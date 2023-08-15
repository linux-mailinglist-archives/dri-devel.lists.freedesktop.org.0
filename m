Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB5577C66C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 05:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA5810E148;
	Tue, 15 Aug 2023 03:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0B010E0B7;
 Tue, 15 Aug 2023 03:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692070676; x=1723606676;
 h=from:to:subject:date:message-id:mime-version;
 bh=dcKXQVswupctn4OL1uXFGH4dNJ0IkNvGp9BWY+1xybM=;
 b=PzKiP1bIlXQb4zsFka1PYH/Mz1deURpezHiBDiRC0KqPf/YQEuklwcTZ
 yPChyHWyBwOkll79P6qMt4GGoEhMGoL0Txbu7nMZYQSk7Fpe9zSbB4ZmT
 1mGZbnbTuD5Wp3CgfMLMBkGbi5OUXE5g+OaEqe1kH6TLXgmFFWd85V/FS
 Q+IjREqIBxJbpeRasRxDmC+g4TjCAqoP400p6mONsc4F8nD5uDsW2VVA+
 8tseCRKuo02cfuuBFT1Ib2nIO12fk10hMgSbzrMmEijNS/iiUaoxqVyIB
 yFANfSNYtG5vuw8rUcXHBOrSwrrrw0twyfy62FtMBKzQR3Qnh89Ylm+iN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="436090843"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
 d="scan'208,217";a="436090843"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2023 20:37:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="980252109"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
 d="scan'208,217";a="980252109"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga006.fm.intel.com with ESMTP; 14 Aug 2023 20:37:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 20:37:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 14 Aug 2023 20:37:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 14 Aug 2023 20:37:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 14 Aug 2023 20:37:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZzIPHnNukiuWTgHYcbzEJjez3UGyaMwYQYuMOiUl2u+tJGwsRNFGM4k3C0TC3rxGCDk0GaDk1zDOFnOSY/hwtvrQtYqiWgxoL1jwGxs4+gCqKSljSd/CIYC027BvFM8RRAbElI+kY/i9HjzIw9gyV4EpYAGMJ93w3BrrlpBNo3mka0tkuYJ3Mc8cEEZx+XjBo1jlza2pxHePjfskPU8f0xZLvEKx+q2AWPG3mwKWm9RmxNhUlKF9sYPRm0wkCPJiUQxmoITeNowfrwik6JV1j+bN1UNH6TgogB7gOSsOCVHVt25bM1IysLsC8AqoHO+oR/QElwcR+tZB+bn8JlUuTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Byq5Cm0P2oqDxAldvNt/79dB1tNHsX2rBPmOL/QOD00=;
 b=nN8eCWF0HXQ4x/C3lX142v8bxSr/UdXhOiguhkiUB5Z5dBvn+4ivoj0b6djAqmot9kgCkIFTtrQ/ze0hD1HcHybWWGVvRNhGO5X/PhzkJzIVAwaQB1OSx3Erx5RA+WFMb2xjdH/4aozFVoXZfI73sFfFU0Ahfe1GQBtutOJdNcOSTY737o8KJhMBUOGcPGZj6hm/4HW8rknQMAkscLgLd2IFKpKRMKteIZXG+qYHzsph7nBvmI4Vpkionhk/amhYTKoJEVShldBEH+XqxRFR8RGR9B6mleMfXVVPYYcR2nbcDDL9sitG7/KQuJM+CpSvrhnk29hbnDIazSpFi1kvng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by CH3PR11MB7866.namprd11.prod.outlook.com (2603:10b6:610:124::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 03:37:53 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::27f1:a7a0:b6db:6c99%3]) with mapi id 15.20.6678.022; Tue, 15 Aug 2023
 03:37:53 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>, "Vishwanathapura, Niranjana"
 <niranjana.vishwanathapura@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, Felix Kuehling <felix.kuehling@amd.com>, Philip Yang
 <Philip.Yang@amd.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Implement svm without BO concept in xe driver
Thread-Topic: Implement svm without BO concept in xe driver
Thread-Index: AdnPImk6MOYV1wEITTKbUW99JKTN8A==
Date: Tue, 15 Aug 2023 03:37:53 +0000
Message-ID: <SA1PR11MB699192A66D7A2CC7305A59569214A@SA1PR11MB6991.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|CH3PR11MB7866:EE_
x-ms-office365-filtering-correlation-id: ef6e5e38-2b16-4759-6dfa-08db9d4101be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pN996pHRsg6ULkHRxyMNd0WC0L5jmTYnhC+CXUv4wfAh89w3fWHfr1HJ/NS2YHSzQAlRLYnnsbWPOaegUyt9COmOI/FSodcimHIalnnURMkxbgmLkFWodcKnGB/9kqMbZgiNSfEZuecGixHajQgfvePHucsWJZEJ34iAAHhlrzz+sdJhL8fVE5E02cjwYvBvQoMDeq5OgZzvh2FAIOwBG9EylMVRZRgnLegnGwcPGHPiKEtBcqWdASO0qEfiUP8aEmiZ3oxkODTbshyklm8Y1Zv9siBiTa2j6HvCk5mrhEJ4gXFZ/lqoZawTashxVNa1V9mVUrVuY6OJPQ3rc2DuncmJQ2ehKQZsyCvoe4rTXhvvTT6PVaAzGAZITHUXsif7wa96l1UnOh0XCNO/P6e7AcEP7SNLPg6KxR+zoJJco1Exq5NWn0TaBQK+yAMqF3GTfptIzUNiRimgV2UGmqfUj+AvsHWe/AkOhWA9eCVhZ+aOYNmUH3kztowm8S2dPZgnLFtMrTcQHk5qLJjZehkpN/Vt+hEm78gYsLvWxvTo9rVHSXFr1rGrQ9gOScp1+h6FmDHfji+8k2VYky+OQ5DYJAbnTU3+1CLFzLKMSGMNX9sg2xfCxi0lE6XFjO5ipkdyTWCMsPqgw7BbPTdsFXDyOA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(366004)(376002)(346002)(186006)(1800799006)(451199021)(55016003)(921005)(38070700005)(82960400001)(122000001)(38100700002)(86362001)(33656002)(9686003)(6506007)(71200400001)(478600001)(2906002)(7696005)(26005)(83380400001)(316002)(41300700001)(110136005)(64756008)(66556008)(66946007)(76116006)(66476007)(66446008)(52536014)(5660300002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?AxzaqsIVAWIqlKM0tSI11HNw4SlSnWKnhdIzqAjQxfAjM9weaIUv8Uj5tE?=
 =?iso-8859-1?Q?fAoYuUhpAFMowODI/138RJY2q0qvTEk6/J/Lf5vCTnGQnvvLsJpxHVI540?=
 =?iso-8859-1?Q?1msP+Y3zuulnzGswW5CPukOaEBGA5YVfKL65yVrk1MNWOnYXm4BZoVx5jy?=
 =?iso-8859-1?Q?aZR9k7fE0QZdWiM5jiP6cJjLNlYlxQI9FcbBd4+djH/xNW1VyuNA5heTp7?=
 =?iso-8859-1?Q?Q8Nx9D9wT7FdKHlZQG53ovsfIV2sibGl5Y4rf/uT6NOTmydqKIsxnt9z1+?=
 =?iso-8859-1?Q?hoea5PbUQpVFXUaDtCDIUDGq/LNUuu+0VbD0M8r6+esxzNgi8DS2DVEqGD?=
 =?iso-8859-1?Q?M+QyGpC1M8IBJOgG/dIUuZuNTVSpUvkaprA534XasqfDt9RgNexdD6vVkZ?=
 =?iso-8859-1?Q?ZGItJSfxYLQmWzGES/F0SpsfELWicSP9I4FuxUxZ4IglmIdxDxvEU5pS1g?=
 =?iso-8859-1?Q?XtHd/SHRhi5/JSTRQb/aF9z2ZQjVlFlHRD9zzMsNaJdTsXRLNaENCF4R2e?=
 =?iso-8859-1?Q?ke9VV30QXYE6Uz014C8QvYlXqqI9lNHj9Pdd+/Dn1sudqZTFJngbSSPf9F?=
 =?iso-8859-1?Q?2TTGy6S3rB5nwwds/5sfdtcUgKCRH56ZdZMxRCKcF2ZA+EwQw5u8mM8kOu?=
 =?iso-8859-1?Q?HzPVSk2/fqWa2gyptyrCMsZaLEeHtOyqCXVIeORvmsCM004Bjuvhy64UpS?=
 =?iso-8859-1?Q?D5ySU4CtNSn2ZEECt7hrv+d7H7s3uZRapkuJVTbiP+63sBjnzM5c+9a7dY?=
 =?iso-8859-1?Q?iEt3jlC4Raa42YEetSiihnB/9tiFCuRCxDvW3ODbbBLge30yvvH/EB9tc9?=
 =?iso-8859-1?Q?wPYOUqW4Ejhr5I4Z4S91vz+3lo3GcX61Y8GnJjWTA1S9I69jbmqJMPYM3l?=
 =?iso-8859-1?Q?MVdCfAHUeV5OfXJFO2CiIhmoMXsoQYM54P6anDXWDmCOZi/JQ6qeD/cwHT?=
 =?iso-8859-1?Q?KPA9Z8ZApc3qUehUyX12Saph3jziCIcQ7Gnog9IblNmEvGCnlKnoxDY1QG?=
 =?iso-8859-1?Q?4dRIy4Cn/2K8H7bOLctgWAjGnp42+sYq+Di8sspIRHi0sxgWuT+vC2UeoQ?=
 =?iso-8859-1?Q?Ku6s/W5scpWw/CaYEVSRps61Chl3YL457omwLibWTLIj+UvnL2jJwo0VcE?=
 =?iso-8859-1?Q?ZsfFLRurUQf7tVTKxjlTAzOFQqfXGCzoonQocxF4hEyHXj20jZpO6QQ9uH?=
 =?iso-8859-1?Q?MC8T0Tj7YYM2nASJIZC2WoIAKTzG8ug0VCRT0b43CHPRjhbq2JWqbNn4vX?=
 =?iso-8859-1?Q?wMYOCr5ghFrlsh95+Mj10MZG3YXzOQt6miJqr/gw6HAu0dO8rvSBHd9Yr8?=
 =?iso-8859-1?Q?dR4lXuyQ/jQkQTETvSnTkDEaFsTIakIkAWKIONQVBUbH6QwOAjb1ML0Xii?=
 =?iso-8859-1?Q?QpINmTAMhCSzLbpBiuTkTWtMxPo5Z+ALssxzomI9G9XyV3qR6P4c7g4lGP?=
 =?iso-8859-1?Q?lHhH/DBRUyYNyfSSDj3lfK1WqtG+6sHCzOm1AIk0V6Peds+NSriOkwyab6?=
 =?iso-8859-1?Q?x3q9medcGXfa2/GEiPydzRMsr32hETWLbV5+OjC4GLK1Z3fhISHIhJhoQw?=
 =?iso-8859-1?Q?5ZJWvYXqVoMHyp3jO78xDkB/ZZxGsxdDvU8BKUtZafCMfLZWvpX1YHcuP6?=
 =?iso-8859-1?Q?tFVf5xbMDIO/Y=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SA1PR11MB699192A66D7A2CC7305A59569214ASA1PR11MB6991namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef6e5e38-2b16-4759-6dfa-08db9d4101be
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Aug 2023 03:37:53.0406 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V+Kltgjes7TiHr6A78lsyTwJhH6NhDpqxRZvHqAsS19gZxjmV+4N/wnY15BcP1x77NScgmlo2Ly3kPuC0URe6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7866
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_SA1PR11MB699192A66D7A2CC7305A59569214ASA1PR11MB6991namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Thomas, Matt and all,

This came up when I port i915 svm codes to xe driver. In i915 implementatio=
n, we have i915_buddy manage gpu vram and svm codes directly call i915_budd=
y layer to allocate/free vram. There is no gem_bo/ttm bo concept involved i=
n the svm implementation.

In xe driver,  we have drm_buddy, xe_ttm_vram_mgr and ttm layer to manage v=
ram. Drm_buddy is initialized during xe_ttm_vram_mgr initialization. Vram a=
llocation/free is done through xe_ttm_vram_mgr functions which call into dr=
m_buddy layer to allocate vram blocks.

I plan to implement xe svm driver the same way as we did in i915, which mea=
ns there will not be bo concept in the svm implementation. Drm_buddy will b=
e passed to svm layer during vram initialization and svm will allocate/free=
 memory directly from drm_buddy, bypassing ttm/xee vram manager. Here are a=
 few considerations/things we are aware of:


  1.  This approach seems match hmm design better than bo concept. Our svm =
implementation will be based on hmm. In hmm design, each vram page is backe=
d by a struct page. It is very easy to perform page granularity migrations =
(b/t vram and system memory). If BO concept is involved, we will have to sp=
lit/remerge BOs during page granularity migrations.



  1.  We have a prove of concept of this approach in i915, originally imple=
mented by Niranjana. It seems work but it only has basic functionalities fo=
r now.



  1.  With this approach, vram will divided into two separate pools: one fo=
r xe_gem_created BOs and one for vram used by svm. Those two pools are not =
connected: memory pressure from one pool won't be able to evict vram from a=
nother pool. At this point, we don't whether this aspect is good or not.



  1.  Amdkfd svm went different approach which is BO based. The benefit of =
this approach is a lot of existing driver facilities can be reused.



Do you have any comment to this approach? Should I come back with a RFC of =
some POC codes?

Thanks,
Oak


--_000_SA1PR11MB699192A66D7A2CC7305A59569214ASA1PR11MB6991namp_
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
p.MsoListParagraph, li.MsoListParagraph, div.MsoListParagraph
	{mso-style-priority:34;
	margin-top:0cm;
	margin-right:0cm;
	margin-bottom:0cm;
	margin-left:36.0pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
/* List Definitions */
@list l0
	{mso-list-id:1520854713;
	mso-list-type:hybrid;
	mso-list-template-ids:-1783088106 269025297 269025305 269025307 269025295 =
269025305 269025307 269025295 269025305 269025307;}
@list l0:level1
	{mso-level-text:"%1\)";
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level2
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level3
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level4
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level5
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level6
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
@list l0:level7
	{mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level8
	{mso-level-number-format:alpha-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:left;
	text-indent:-18.0pt;}
@list l0:level9
	{mso-level-number-format:roman-lower;
	mso-level-tab-stop:none;
	mso-level-number-position:right;
	text-indent:-9.0pt;}
ol
	{margin-bottom:0cm;}
ul
	{margin-bottom:0cm;}
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
<p class=3D"MsoNormal">Hi Thomas, Matt and all,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This came up when I port i915 svm codes to xe driver=
. In i915 implementation, we have i915_buddy manage gpu vram and svm codes =
directly call i915_buddy layer to allocate/free vram. There is no gem_bo/tt=
m bo concept involved in the svm implementation.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">In xe driver, &nbsp;we have drm_buddy, xe_ttm_vram_m=
gr and ttm layer to manage vram. Drm_buddy is initialized during xe_ttm_vra=
m_mgr initialization. Vram allocation/free is done through xe_ttm_vram_mgr =
functions which call into drm_buddy layer
 to allocate vram blocks.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I plan to implement xe svm driver the same way as we=
 did in i915, which means there will not be bo concept in the svm implement=
ation. Drm_buddy will be passed to svm layer during vram initialization and=
 svm will allocate/free memory directly
 from drm_buddy, bypassing ttm/xee vram manager. Here are a few considerati=
ons/things we are aware of:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0cm" start=3D"1" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo1">This approach seems match hmm design better than bo concept. Our svm =
implementation will be based on hmm. In hmm design, each vram page is backe=
d by a struct page. It is very easy
 to perform page granularity migrations (b/t vram and system memory). If BO=
 concept is involved, we will have to split/remerge BOs during page granula=
rity migrations.<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0cm" start=3D"2" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo1">We have a prove of concept of this approach in i915, originally imple=
mented by Niranjana. It seems work but it only has basic functionalities fo=
r now.<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0cm" start=3D"3" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo1">With this approach, vram will divided into two separate pools: one fo=
r xe_gem_created BOs and one for vram used by svm. Those two pools are not =
connected: memory pressure from one
 pool won&#8217;t be able to evict vram from another pool. At this point, w=
e don&#8217;t whether this aspect is good or not.<o:p></o:p></li></ol>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<ol style=3D"margin-top:0cm" start=3D"4" type=3D"1">
<li class=3D"MsoListParagraph" style=3D"margin-left:0cm;mso-list:l0 level1 =
lfo1">Amdkfd svm went different approach which is BO based. The benefit of =
this approach is a lot of existing driver facilities can be reused.<o:p></o=
:p></li></ol>
<p class=3D"MsoListParagraph"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Do you have any comment to this approach? Should I c=
ome back with a RFC of some POC codes?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks,<o:p></o:p></p>
<p class=3D"MsoNormal">Oak<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SA1PR11MB699192A66D7A2CC7305A59569214ASA1PR11MB6991namp_--
