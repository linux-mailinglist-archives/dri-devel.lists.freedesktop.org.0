Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B8F7B76F4
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 05:53:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80C510E0C9;
	Wed,  4 Oct 2023 03:53:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5586810E0C9;
 Wed,  4 Oct 2023 03:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696391585; x=1727927585;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=0fWK9m5t4xsKGXyduTjn1swPekVxDUgaPE0JgJa1nAs=;
 b=ATemMSDQ6uXW9YcCi8AZvCl9wN1hkABe5tBm8BSToTmX+XQTFp7TapbH
 kZv87+BY3vZTAAHzFS0lVV6VTw71WE8XoNuTqd+tETz+MH7Xc9QCuJYQR
 XkWZltnZKmUN0AP6ZZYvkFOT/7wRBlcGaLsjSW2FoqXXz8ElTzpwfi4Nq
 Fneqlz9rSnhF+xj1aDnTiaONs612H5WbtGXFwWlKO1yREwcg6k3Ls110F
 zg5BeskjPUSiJjkRtM6DSZcn/jvdKaVtddgKhl5zp19lN7BFfbOjdAMa5
 rGw7goxzdPGcoC+sjYPDttgAb3u/H3ph96lEy4s6QshFvt65rg8w7OeKZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="368099616"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
 d="scan'208,217";a="368099616"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 20:53:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="894766011"
X-IronPort-AV: E=Sophos;i="6.03,199,1694761200"; 
 d="scan'208,217";a="894766011"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 20:51:39 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 20:53:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 20:53:03 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 20:53:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 20:52:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFyGocTzM4OqbjbFmA+y3DBzgNy4Uv7KU7GoxR8P9pn3NOk1Ri74L5gEviCgfIm++DV3H7TtZwslZnvHPioPI3eNoFz9XLi+XNKapufC1Y/5RL2lpnYVS4b3sfw1IeByDDHoYYs+EJq9MmLBY2SCJtzggyPUqTn7hpzSmI/Pmk6c6A/5Q1XGTMbU1sD8/MhbNLRN2+/cFVGwjbgXBF402zJgmS5IxGUfKBGLp0BDTHdbArQZfz9hScTG4TFF3xoHOruoMLpyqLGzjClbRWojv7yLRiiiZNNJ9pWk+uNnNHm7Jb4uC7OslfZ6gL5b8IRzClWubYFdYsa2LO35PKExIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mkvNiL4PJKYuOFuDKGcSAgx8sRF9koasPkXeQSfzus=;
 b=au/gheqPSZa8sKkoaY+8YgH+pVjWTzQFjU64zR48Ukkdk/jpQ90iJOv7KhwIhjYz+0sHTWGoXwO6jYzrN9w4TNMy1jOZHa+qwSx1x+SgH3ksNDaZE+SSNlHTkTlWKmybeLQUGuxcOdlHJLnhwQ5d2xfRfCaZaE19HsBYJ4U3naopvEY0Div7H94WmUPEKjl8hvitVdn9tegd8d/rMhNN2wq8G34jlEbqeC9qrAcR3tgoQJ9sENRHpIdlObFG+MWk5dVkHmgW+sDVOEnEPycsS6QA3QLDiCvlv1gjbs2yF+TVJBjqj/zq+9VloornIVlCBUm+XIBDzLrWyWI/uPtgTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by LV3PR11MB8530.namprd11.prod.outlook.com (2603:10b6:408:1b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Wed, 4 Oct
 2023 03:52:50 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::18a2:59e7:4541:b61c]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::18a2:59e7:4541:b61c%3]) with mapi id 15.20.6838.027; Wed, 4 Oct 2023
 03:52:50 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?iso-8859-1?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: bulk_move in ttm_resource manager
Thread-Topic: bulk_move in ttm_resource manager
Thread-Index: Adn2ctIrdkmtsoIjSwiVZseTI8cRhg==
Date: Wed, 4 Oct 2023 03:52:49 +0000
Message-ID: <SA1PR11MB69918FBD6B32447AEB6E0F6A92CBA@SA1PR11MB6991.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|LV3PR11MB8530:EE_
x-ms-office365-filtering-correlation-id: 4008d1f6-81f8-4ce5-2678-08dbc48d60b3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: H+G4sLxvfOLsBkyxnGIUZF8oNfgzBcn/zIankDGAdUBrivJu4gXyjO6ce3pDOdDDUBH/z+Ft/k/MSXRDAmZB9/UjZSkaWg+FySKw6OQExdKHXudK8eS/TcdtGdv7aXioyYfUXXMnchRDasOi5H0FPCd1hq9buL1to0OHZH1q3QysG737O6rqFWzSlqWGqxLFT929czc1sc56zu7NsqOWTlp5U+cK6kW3GGernbpcAnsyeSkiKvU21LsgvoH3oLIxcRBVYZuVVAYunp0cCWZmiLqPiUSa1MCD18aqbL83lsnL+vHs0R7AQF935EuSEar5GpXH95b/uDb/2QidIw6p8vtx32uPDIF7XQ7cdombWo1GKKy53+ZG95S1/MKI6HTpKc150ZEdcllxv9OjSpXxm7FT6fpAxbF5j5r9JHJHOjGxU4Klrxtz+/kRn+Yeec3WsDgcm36U15cZGK7+wZA0HKS4NX6QyoRZMoC1EJvLu+/tI4Uy15G3fNu3QZ36RRj7Fp1PPgxTFBZUxBHLrql1CoVyYewVh1bnRIoUu6iGl8Lku82DuvQcUvjn4Wb99LcpcvtD1TskI4AWwFkVq0sseOIQFrZvVsGzJ3UE6Jh0leo=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(376002)(396003)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(966005)(7696005)(6506007)(478600001)(9686003)(26005)(83380400001)(110136005)(71200400001)(2906002)(8936002)(54906003)(316002)(66556008)(8676002)(66446008)(21615005)(52536014)(66946007)(66476007)(9326002)(76116006)(41300700001)(5660300002)(64756008)(33656002)(4326008)(82960400001)(38070700005)(122000001)(166002)(86362001)(38100700002)(55016003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?Xfiw8/CjQC+jZgkbNEZ2SkCciIx7IUpUAbvVVq5kDI3SMSxp5wize9x53O?=
 =?iso-8859-1?Q?SEehde1xYLSGdHG2ntse99kl+gGZWZh9UFaq0/m+1tY2YI6qH3bY5TfaF7?=
 =?iso-8859-1?Q?BPhaXs3zDTfDSH/39Io3+usdbB+n072/KvD9upvjpU6HT8sHqf0OpbFcan?=
 =?iso-8859-1?Q?APZ75/f1HaBDyynHN4nYVY4N6RIM4K2ss6gQKHP5UJKMZYoo+nOQ9JLh/0?=
 =?iso-8859-1?Q?BaPeCnjicKxKuidd9N8Eikfky+eh6btkeuuqgrLN60GrA6ZaabXrSwZo1j?=
 =?iso-8859-1?Q?uZeOe8jPVGDAipMxSq98m5LVluxlgjjZOsuKac0ZKYgd6zuMZ6c1ibR29S?=
 =?iso-8859-1?Q?iieq53v0TMvpvz30lxDj0n7FPun6sWVY4XGtZaBiQVHJk7zmINRbSZ/bR7?=
 =?iso-8859-1?Q?NtiIUgFCoj+5XWANIP9WsWGbDdVkJMjwyoIOOWiGjKOaYqS0F14bi72hSY?=
 =?iso-8859-1?Q?H7enpku7iQ/mjHc5c6LNQ/Cox16uBd6TbbrJlLRtRD+9DxJVYQwcKoQAJn?=
 =?iso-8859-1?Q?W35WEgWr8NLXqUyyA+JSuwPuPctyJHZu3xFC5Y2aj4jpovKkYEFF83t/2g?=
 =?iso-8859-1?Q?ZnmenWS9uxGk+utJZKTJbgyL65YY7KlccXYsezJAx17O3Bn9pWRDAiEo9Q?=
 =?iso-8859-1?Q?rbA704PBV7JWZ+uWJj/VzHizjJRzlxERv63vMGNnQ9WWciEUrt9E8T6roW?=
 =?iso-8859-1?Q?vBbORH6/XeV4A1dSoeztmeJyqfPTVvnQR7pYqaHEIkO9YW4myBZSGUxKSi?=
 =?iso-8859-1?Q?5frjafJlstf0ROPhvOkSP9SGLsf07xBqzP1NEqQkIB6eeelWvCM4FkZ0Zq?=
 =?iso-8859-1?Q?H/E8QbTbp2+o7rnWiU+fCiBEpNyIzpyBRVyuruSGCTVuFJFFqHPJoxk6mQ?=
 =?iso-8859-1?Q?nuqpMKWYZNghba76sCMZiAQjaMZxtRzz3h55tbKZnBQ3BtU6iWto5MiAVO?=
 =?iso-8859-1?Q?9W6kUCwQRuklMawookxK06sfxHlfalpUMJBU/vK13ViaeJjTPD4XWLxqvY?=
 =?iso-8859-1?Q?YmNXBgrFS4ctdvFoWoaT7LSamGaL94Qe13tA5bZE4Hm3MgynVIcSxzAOrL?=
 =?iso-8859-1?Q?ARoTlHzongq7kI7NQBv59mfkb/CXXbBnCgIzUS91aBkavOYMRAb1hUARkx?=
 =?iso-8859-1?Q?U1AsNKQocjfZU2fYIvemovAx7Rzw323F6wHS2c3uOdWPYQfjv0NuCC83Hn?=
 =?iso-8859-1?Q?qjGWYUROB1nwG9rsuZNSNvQKwz4rGwvp0Tib6HTABzETCbmA7Jt5qKIICM?=
 =?iso-8859-1?Q?LrK1YYIjHNeTp5cbbDYDq/pccs0WrH7WZoqKLB/BK/ZJTgYkW1d5hkPDx9?=
 =?iso-8859-1?Q?rzbaraHhIqFPGeNV1gIS4trgsy3NxvvYYEaFn76i7h4VN+I8HU7+ga0E1c?=
 =?iso-8859-1?Q?UWXMgWpduZyeubL7QGMP625BQZSUlbBMZ+MfO4A+aCiihy/RxlWo5EUrrD?=
 =?iso-8859-1?Q?U74PpnP2MIb2FCDq4xZNpmssBQgJOjQQqPmI/KokC19FCVqI6wE3EGE8O9?=
 =?iso-8859-1?Q?slB2E3ZQ2grWKpkiObYzu8QMrNuUBmyYrPrBfi7LnaOz+V3TUiYt5OJzlN?=
 =?iso-8859-1?Q?I3F1H6o56HHjUuVgTwwhueAJHkFpU3md7bjih5tQOiubxQgOssXRfqAQtF?=
 =?iso-8859-1?Q?W1JTKF2/TmCr0=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SA1PR11MB69918FBD6B32447AEB6E0F6A92CBASA1PR11MB6991namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4008d1f6-81f8-4ce5-2678-08dbc48d60b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Oct 2023 03:52:49.4646 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yoF+zm5YDsYL1QS1NXtsvahVB5wYACz6/wCEcDtLwxGMJPhm9AMmx3Vg96ZCKT3zbJhDihkfj4jOfTn1VKN5Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8530
X-OriginatorOrg: intel.com
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_SA1PR11MB69918FBD6B32447AEB6E0F6A92CBASA1PR11MB6991namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

As a follow up to this thread: https://www.spinics.net/lists/dri-devel/msg4=
10740.html, I started the work of moving the lru out of ttm_resource_manage=
r and make it a common library for both ttm and svm. While look into the de=
tails of the bulk_move in ttm resource manager, I found a potential problem=
:

For simplicity, let's say we only have one memory type and one priority, so=
 ttm resource manager only maintains one global lru list. Let's say this li=
st has 10 nodes, node1 to node10.

But the lru_bulk_move is per vm. Let's say vm1 has a bulk_move covering nod=
e range [node4, node7] and vm2 has a bulk_move covering node range [node6, =
node9]. Notice those two range has an overlap. Since two vm can simultaneou=
sly add nodes to lru, I think this scenario can happen.

Now if we perform a bulk move for vm1, moving [node4, node7] to the tail of=
 the lru list. The lru after this bulk move will be: node1, node2, node3,no=
de8, node9, node10, node4, node5, node6, node7. Now notice that for vm2's b=
ulk_move, the first pointer  (pointing to node6) is actually after the last=
 pointer (pointing to node9), which doesn't make sense.

Is this a real problem? As I understand it, with this issue, we only mess u=
p the lru list order, but there won't be any functional problem. If it is a=
 real problem, should we make the bulk_move global instead of per vm based?

Thanks,
Oak


--_000_SA1PR11MB69918FBD6B32447AEB6E0F6A92CBASA1PR11MB6991namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:DengXian;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@DengXian";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-ligatures:none;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-CA" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Christian,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">As a follow up to this thread: <a href=3D"https://ww=
w.spinics.net/lists/dri-devel/msg410740.html">
https://www.spinics.net/lists/dri-devel/msg410740.html</a>, I started the w=
ork of moving the lru out of ttm_resource_manager and make it a common libr=
ary for both ttm and svm. While look into the details of the bulk_move in t=
tm resource manager, I found a potential
 problem:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">For simplicity, let&#8217;s say we only have one mem=
ory type and one priority, so ttm resource manager only maintains one globa=
l lru list. Let&#8217;s say this list has 10 nodes, node1 to node10.<o:p></=
o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But the lru_bulk_move is per vm. Let&#8217;s say vm1=
 has a bulk_move covering node range [node4, node7] and vm2 has a bulk_move=
 covering node range [node6, node9]. Notice those two range has an overlap.=
 Since two vm can simultaneously add nodes
 to lru, I think this scenario can happen.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Now if we perform a bulk move for vm1, moving [node4=
, node7] to the tail of the lru list. The lru after this bulk move will be:=
 node1, node2, node3,node8,
<span style=3D"color:red">node9</span>, node10, node4, node5, <span style=
=3D"color:red">
node6</span>, node7. Now notice that for vm2&#8217;s bulk_move, the first p=
ointer &nbsp;(pointing to node6) is actually after the last pointer (pointi=
ng to node9), which doesn&#8217;t make sense.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Is this a real problem? As I understand it, with thi=
s issue, we only mess up the lru list order, but there won&#8217;t be any f=
unctional problem. If it is a real problem, should we make the bulk_move gl=
obal instead of per vm based?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Oak<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SA1PR11MB69918FBD6B32447AEB6E0F6A92CBASA1PR11MB6991namp_--
