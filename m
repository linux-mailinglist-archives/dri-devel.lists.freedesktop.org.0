Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F456C8B0F
	for <lists+dri-devel@lfdr.de>; Sat, 25 Mar 2023 06:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBA310E0D5;
	Sat, 25 Mar 2023 05:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FC510E078;
 Sat, 25 Mar 2023 05:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679721742; x=1711257742;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AEkzrUbaYfyp6pJTasLnuM69wXAQew4l/IpUZRaum28=;
 b=As9knwYlZk5gN4ameQrjH8ZZ3nj7Ott5vLssK9DV+ru1lDk3/SQWSfTa
 VnYI+ztvKlNYGrRZ6eWm1JIu4NzzOGc0EEeGvFFMdvuqNKlfyg/aFIGqR
 lKcnVqlTPdtrgk5h37whpFwhSIV3Tvcg89B+T/9dfg4D6Nxh6xdlMUaiF
 cpUgbvmP+LuXVMsKeThk5PhsP43Px0y/P8qMDLbNOWz0yyKjDcJcihJSf
 uVNul8ksdhmS4ErhrrJ4dh+iLGeKL/4EJFWUxd6aqt6WaEl95jeuQq8Xr
 LlGcifQiinIPWlbbJeKJhzbifKifEO3qAjVThNZt6nN06QeaV2C8Lui+J A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="320340991"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; d="scan'208";a="320340991"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 22:22:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="826482779"
X-IronPort-AV: E=Sophos;i="5.98,289,1673942400"; d="scan'208";a="826482779"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP; 24 Mar 2023 22:22:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 22:22:21 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 24 Mar 2023 22:22:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 24 Mar 2023 22:22:20 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.108)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 24 Mar 2023 22:22:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAbDjYLcHu2d3c+G1qQMvKZoW5METJ5NxNKgRzAXGD3Z6r7jhJeRErkZiSDrFuWzpJ8FS0Clxol/gXsXkQ+N9TGu0CUL042Sj0BTcDRGSJC/z6/06BbczcGJvMtXxHvYjjr93bBBEBLE/rdyOQWn6tQLzE+BaQyK46ytTml2bM59R7KLBY3+jPsF+jLKlnpS7n09BQFPlwViRx/I+sB6AjHo+2Qsvynl8uMyjiDJJSUpdZgKq9Qs4NA/BxQigwoj2W9pI1Ogsxptq5saUikZcHWR6cvYRi6WNBBPtB7ope/+iWBIXSSEg7gYQNCnCOV4cLL5hh2mqyCpl2uTZpb+Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEkzrUbaYfyp6pJTasLnuM69wXAQew4l/IpUZRaum28=;
 b=LDI0Tgk4JvCMhB6l8nFY9In5yprbB7UpX7CaFgfFoY0zhNH5dG/uw2oUcLWZyIxLlXzuDeH2KB3H7eCHV+Xu4oclRfekM5Vb1vkvymwwas1L18fweCaBiSqdu2uO32XPd5JZP3vcrDiMS0t8tRFNxGkbkOglE8gCiQvW9z0HfLNi2SBV+AITkMn5cAzHmS8/sC4/FebtlmkLHEZt6JGZWqtcqEb0/GqyRW+wbl6S3fadZQ6HFu71GriulZn/5YwJu6teiCag05PYK5OTPLUZQ2LRwWogkfZnSXc1JCeRyYzuWjERU2dwH0Jilg+m1UfVLgwYnRLAtQPdzFe/ib41/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5751.namprd11.prod.outlook.com (2603:10b6:8:12::16) by
 SA2PR11MB5113.namprd11.prod.outlook.com (2603:10b6:806:113::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.39; Sat, 25 Mar 2023 05:22:13 +0000
Received: from DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5]) by DM8PR11MB5751.namprd11.prod.outlook.com
 ([fe80::4cdb:78a7:917e:88e5%9]) with mapi id 15.20.6178.041; Sat, 25 Mar 2023
 05:22:13 +0000
From: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v5] drm/i915/pxp: limit drm-errors or warning
 on firmware API failures
Thread-Topic: [Intel-gfx] [PATCH v5] drm/i915/pxp: limit drm-errors or warning
 on firmware API failures
Thread-Index: AQHZXeE3T7558U7Hhk60erG2jOK4Bq8Jp/cAgAFPx4A=
Date: Sat, 25 Mar 2023 05:22:13 +0000
Message-ID: <fa6b1e19f387be77e8de44c74be1f2711e13d99a.camel@intel.com>
References: <20230323184156.4140659-1-alan.previn.teres.alexis@intel.com>
 <3a0bf008-da85-8334-33d6-784c2ece54af@intel.com> <87o7oi5wvb.fsf@intel.com>
In-Reply-To: <87o7oi5wvb.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.1-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5751:EE_|SA2PR11MB5113:EE_
x-ms-office365-filtering-correlation-id: b7797183-8cd3-4c19-f591-08db2cf0e445
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0NJ88O1Wff2evbGJcrX8TDvsBHTKMYuXEPk17O4Tud5U6jJ3HcBbwcBNZlFFrTxkZMA7tIxnHPszjzi58PMttsdoT8piGvogTDcq8VyZcGVlNbm0Vbg3GmvX3xRKVd5Mu/ZmtKqAKKonGEXXT4g23u7xiYmKP1rzoJUmm2ASoO6K/h/YnMRX2lipDbypUOIWNF6KxSPxKqP/OzMzYNt7OFORtxDy2P6k/uDkTRgjKT3ddSazUPCsqbknZ/pU8LesPPxrZRbhXxvhM4r8aXxhxgnSl9pQTzC+bkwJ7XtL0TES+T5V/u7rMDeAef8QefL6LAoHVNVN1grk/JjElJnjrhS5YXFH1Ye0b0s7P40sdndPBe8Y34Su48Jq+PlgLoArbQLijDmgqXtPgFmFrsyrz6LJ4c/dMCEtJ7xlB2P+HljIr3XIUr8zLbyZN/4IpaR7/bZbLwNl5RKJ2O6PG7Yw9TgnQCi4RSnyLLATtCLBalSAZZMLgMikI9qjsgMOYnkGb3ghtOhhYZp8Y5BTdYD3SYfakqUeDR8I+OQQ6Dp0jIXgmo+IUEoNPdu9jY0STM8DTeeMgB23h0gA8FnQNXAUH46FjGw+LcgewSPV0MJuqGtxY5oUftQsMNs5K9OEPojg
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5751.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(39860400002)(136003)(376002)(346002)(396003)(451199021)(6486002)(2906002)(5660300002)(91956017)(8936002)(38100700002)(122000001)(82960400001)(26005)(6512007)(186003)(6506007)(2616005)(71200400001)(478600001)(64756008)(54906003)(76116006)(316002)(41300700001)(4326008)(66946007)(8676002)(66476007)(66556008)(66446008)(86362001)(558084003)(38070700005)(110136005)(36756003);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?o/HU2/PSpoivwpbKvI+fA4HxXJr8T6iS86EUR5zYNnXQahw4OThjet0INX?=
 =?iso-8859-1?Q?qflIalfW77iYtuSzmPWsAvpojc+Qy+qXK8sZhRiBHUCXcY119Em2q7cKpQ?=
 =?iso-8859-1?Q?1qgXddMJJiInEyxvzHFZmP1pVyLAgK5gTksyv/WucFUl8wh6JmEMDiZ1lv?=
 =?iso-8859-1?Q?jzmzoA53UbyTImA4gB7DIuE1QchYoCYbwps3ckAsacvX+Zp7nP6W5fGQKT?=
 =?iso-8859-1?Q?LvGEXxD5JiFQHn3MekyyzAmOrtJ87g+92UvZ+PV9MyO7IvxfBmof36nqBU?=
 =?iso-8859-1?Q?FHL7jW/qnNFG14X6KD8OE4pRK5msmf2l7k2qcQ/L7WaBlifhA6g3mUYq1N?=
 =?iso-8859-1?Q?p87d9xODGteGNtmk3O6zLoFOeIpflB+S8GDTdsC3FycaOQLRB4+9wEhDZh?=
 =?iso-8859-1?Q?TU1o3I3mJieeUb1LYQcqty3SYn1HMkcCCw25CWfXuZkkuOwUZOpxUyiAkh?=
 =?iso-8859-1?Q?CWbg68A4oxLcZjz4vLNZAs2yyg6D++eFdqEoW0mZcF7rwc4YK+G7avSgGC?=
 =?iso-8859-1?Q?0fYj8R0UDsT1x8dOi+sKjs5HchYPoxKyTmeGC6Zv54xqANo+DLCJadr/oW?=
 =?iso-8859-1?Q?B2Yt2yeUWfGCGoqKzfdxXzwwbCeRBJRsSU3kJgFzPsGAJs8TzFg8yx5lFi?=
 =?iso-8859-1?Q?z4dAj0VC42qXB/4n06KniXdA789Oe6YAqVvxaGd2l/1Bz4Zt1d/aDVq0NL?=
 =?iso-8859-1?Q?URzI+yBe+jng+Dh+eVaEQrpfmZstNUdXExlh1te4ba0ltquu0OZtVa5+F2?=
 =?iso-8859-1?Q?k6oC6LPUvyf5iSJ7KyHOhD3efPKZ52IrwN7wq42WwBNGo8ogzSGbyLc5Y0?=
 =?iso-8859-1?Q?NU8ClIWDBeBO1U9C2bBY1MTOimxkSC3c9MgSjj9pK2BKOD42pSivkP96vy?=
 =?iso-8859-1?Q?y/z2tmP4U8O/aHeyDDUXiownDCGnkyMxm+oveK0GFOUKDS+/VkOy475Hsl?=
 =?iso-8859-1?Q?zYDYlrE49nO1ZI6k4JllnI7eo6gJnu9oQ2A3E4rumojD2tUnS6wGayno4U?=
 =?iso-8859-1?Q?rPETCJ32C2a2mUls8CimJ400Y8o/QfJMazGJHrGoa12RyMDknFmf4D39wK?=
 =?iso-8859-1?Q?Xg7q+f1xtOnqB0svw9sdVx3WemkVsrOJRQqZhnmG24+RohjttQx2sKaLKs?=
 =?iso-8859-1?Q?5d7lxKQjvNxAl1a8dZmS0vTaNWsz9aLZ3Nt9m9lyNxwHVctar/wBx/euVK?=
 =?iso-8859-1?Q?WbLH3b8mQEXw17deqITbX9pbSR97WGo4nXL1sDk9ey/ojkOSIRvH+uGNyG?=
 =?iso-8859-1?Q?luqS6OHMI0hIms6xdUmERJG0KuoCHay6mYPEmLI4BEr47ZpNQBOpuvDl8T?=
 =?iso-8859-1?Q?WhgF5tBdN5SDFw2N5JH65fE7slS70d3KTj6VTS9LQ4FZ7y8kRSuwgcFAdh?=
 =?iso-8859-1?Q?O65W/cnOsSjBbi0kFz9nG9Y/x7xxqycoggaSl4gyHDYd0WrJoq2O1TTkFM?=
 =?iso-8859-1?Q?3IZvrETy4xTA0lCqdwfIE4NkhbOTsc14DAfYKSt2X5xr5Z9V+SiX/OiQrm?=
 =?iso-8859-1?Q?SWPCc41YuS8akfNAS2o7CP+QntIwgGr1gBpOk0XWH18dP2h+nVnuUYl6eM?=
 =?iso-8859-1?Q?akHjzDFWu5myQzGI2cEGPfbgRqkPsnyohXjLrKoaHDexq3e/XGp0UIWPly?=
 =?iso-8859-1?Q?WkLKu+hp2lOkOoOKoUMO1/o6Akt277rD5F58dKhyOJl44QND6aTE8x0dPc?=
 =?iso-8859-1?Q?AHl8o7P/VU1ZNQbN9nI=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5751.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7797183-8cd3-4c19-f591-08db2cf0e445
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2023 05:22:13.5996 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CR6CxhQLgYtevAUAFcQUUgpIWq0Bnycg3K72ZjSx1m1HR9Is4qBl0jYT0SM/hHQJVVj3bN/vSu6JoDMvIyLRx1S/3Ukr/4oaTJVEuaTIUYr42lLYfwIBdkmf1EMwyXrD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5113
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
Cc: "Tamminen, Eero T" <eero.t.tamminen@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Daniele, Thanks Jani.
...alan
