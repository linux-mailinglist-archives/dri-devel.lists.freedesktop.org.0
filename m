Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9677C68477
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 09:51:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7443B10E43F;
	Tue, 18 Nov 2025 08:50:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pr5OPNOE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75ABF10E43A;
 Tue, 18 Nov 2025 08:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763455856; x=1794991856;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NLoJqCSiy7+3wvOqVvElT58N/ySUjLx6Cg29rF/ZLH4=;
 b=Pr5OPNOENGpEU2rbTzT0TU82ZVIN7x0h2vwMzN64W+9FRr/JVONmUwvD
 WQppdxo3P4bKmDON6S2wJo6fu0NZexpcv4PDadZePA6PDUml2tzpZ1nIC
 TfVDbVSdmt3Y4bgWdymKz+DStnPFP5gyiq/xkoQ4JAWsdY6Of70ywvjCB
 UhDwMHbiuI8812SkxIjsHitmi4FzMiTspMVmfD9ePMzn+POEjHh0IgK/4
 MLog+nHB3uS3xWcToNMkM2pJJTFvgNEMaY4k49oaoLpoLTkqc2iY6dsoX
 IqOsjaqkzCy1NusENYeSR0AdnfDcX4oorsDrdfpEbLxARaSjlu417NZ5M A==;
X-CSE-ConnectionGUID: AUkMUY7DRQ+/s2eMXMy6bg==
X-CSE-MsgGUID: Nhz+wMaxRgmbmti2K+T6zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11616"; a="90946764"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="90946764"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:50:56 -0800
X-CSE-ConnectionGUID: VouQWayLSySruSGlo0Augw==
X-CSE-MsgGUID: TXy+9lLnRv6+HfnVVLiy4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; d="scan'208";a="190723368"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2025 00:50:56 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:50:55 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 18 Nov 2025 00:50:55 -0800
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.33) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 18 Nov 2025 00:50:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RUseTdjQ8OpTybJJ47PmqH+Ay6vFyNWP5G0YwXwp+qpA2Oo4QASD+rPNS+sppqGURVX0h01Yai1QVXtngu+Cy42OXJlLAceoR0qsqUyDEISwOp6WEut0olCY+PeXztvpggmNNG7eaD4RnO49zrKrt/+xb9/DXCLXAlU5p9fS+2qAxkMUEPa960PsWZacWtyZV5J0uAYB8pm9khXmXl83M6Bqynh61NOfDC+K0TsaweYnIVZ5GJgBf+HnvnQLXPEIdVarGUv3e4N+RzdgNT43NDU5uaJxeIqa6B//KGJ8FRWLjWyOypRYleuaTiTNa8VqEPQ+wdoesHBeti2Zpx62Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cP1HZexvLGeDQBkdB03wqXqBVDYyDonBv13luSG7MD8=;
 b=XV3HbBYlnARfWLhPa7tgERqEJRjKjNEzreE6nCJObwNcGOshg42CAdhXfQo/nz+inr7YtaW8GI0AF2aAO7RePCB2E5VGtogOYlVa+EuFRKMpnFsFWdLdy7TmCITB9pTN0sG2KdtihALysmttyHq/AXEH8uoW4Ah3Krkr84pcFbtcdKNaDrD9TB/z/FLn6KstfwRq5nh98ygn67EraRahm7ctzeJW58SvKfwCBP63WExYvBXNK4/etbxKJPaZur1m1PSDhgtYBsnqqYjRhRmS4off8m6GyePmfEPljWz/456Vz7Zu3nXZdAlihrA9Mb+WRaL5aFBrI0p6pDoookYwBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f13) by SA0PR11MB4527.namprd11.prod.outlook.com
 (2603:10b6:806:72::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Tue, 18 Nov
 2025 08:50:53 +0000
Received: from DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc]) by DM3PPF208195D8D.namprd11.prod.outlook.com
 ([fe80::95c9:5973:5297:d3cc%6]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 08:50:53 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Shankar, Uma" <uma.shankar@intel.com>, "intel-gfx@lists.freedesktop.org"
 <intel-gfx@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>,
 "pekka.paalanen@collabora.com" <pekka.paalanen@collabora.com>,
 "contact@emersion.fr" <contact@emersion.fr>, "harry.wentland@amd.com"
 <harry.wentland@amd.com>, "mwen@igalia.com" <mwen@igalia.com>,
 "jadahl@redhat.com" <jadahl@redhat.com>, "sebastian.wick@redhat.com"
 <sebastian.wick@redhat.com>, "shashank.sharma@amd.com"
 <shashank.sharma@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 "alex.hung@amd.com" <alex.hung@amd.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Shankar, Uma" <uma.shankar@intel.com>
Subject: RE: [v6 15/16] drm/i915/color: Add 3D LUT to color pipeline
Thread-Topic: [v6 15/16] drm/i915/color: Add 3D LUT to color pipeline
Thread-Index: AQHcTk8LBo/UHF3lMEWDkIgvEf2PYLT4MuYA
Date: Tue, 18 Nov 2025 08:50:53 +0000
Message-ID: <DM3PPF208195D8D2BE977D4B97AE6528ADEE3D6A@DM3PPF208195D8D.namprd11.prod.outlook.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
 <20251105123413.2671075-16-uma.shankar@intel.com>
In-Reply-To: <20251105123413.2671075-16-uma.shankar@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF208195D8D:EE_|SA0PR11MB4527:EE_
x-ms-office365-filtering-correlation-id: f77490ec-6a0b-46b2-d4a3-08de267f94c6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?lmhiXvgUKsUhojGC1VCxib9nZnGXxTuEVslpe0EnWfaJvxXnB2lMsjCW89CS?=
 =?us-ascii?Q?RB4BUcL8XkhAKiMuUjTwWQ56Btnox1VgtTQ404/bsbLiG0jCqlY6myMQTvjL?=
 =?us-ascii?Q?etQ4k4aWEDv4ghe2GvQoUXMeswvXGPXX866tP1/0nw1qxP4DBZHXlj1XUcXR?=
 =?us-ascii?Q?cZkIwq3d4y13xcbNt4nrfn5q8jHK/gF4VZEQ0zBLxyBvXhFif7p1ceJDeELC?=
 =?us-ascii?Q?An1hsZcaIRS2oVxMplwMN3HhSyjbhgaFf8H8eJWbViLEN8jXuTaZcpANaiVq?=
 =?us-ascii?Q?VUGv5kqlofWdEtzZGmhpTpxwtcr3s9Jymwla642oxCV0zTU/RmTs1jWeqSwM?=
 =?us-ascii?Q?4mepngI4zWgx4n5LFk5/XzesMdqWvf9W/4nqIiRixLZhwCZOybPfmSGYSn4P?=
 =?us-ascii?Q?F26f2TvXscw/LD+2mRfjPjaaXcX7IRMo3QaUnsULjpTomnvxivbMDjOyRuto?=
 =?us-ascii?Q?LMT7WV7MCdnOFNnYWZSroj9HnDdaAOGob21hRkJHR7eqU82Kx85I+ZeFLhIf?=
 =?us-ascii?Q?ylHIvziDDIyhUKlPhZ29j1xGD7ttIINCwlUaH73XEnfPIwNLbmZ5/JfIeOjh?=
 =?us-ascii?Q?hQGhj1kCFkmjQj4ZWWVyOqnVtjKkaQexgVLQ5YK+p6irNGKP/VlYU9lsC5OO?=
 =?us-ascii?Q?d1fztICABXYIBZZr9w6YcNUd2XjukekwYQ2lGVIEr9ATLaYZEn9QjopyznC8?=
 =?us-ascii?Q?SQZYPa8puysMvXT3hLlEKePt+IksUo3HWgGMuEEFlCYNCrSraQymb0Ub9sRK?=
 =?us-ascii?Q?aCIZpAv+oOPxGGS1hu23HuDI2dPYNK71b92t7q93Aj4E9pWnfCalJpzc66vl?=
 =?us-ascii?Q?NxLjvNJnEBV2khxKyDvGuYnayauRyPY49+dnA3/m3lFwAmjl2pVIUGtQoIcr?=
 =?us-ascii?Q?Pt7yz7DFepGUHS/58MOlOZ+USA4vTA6jBUbxPbx3hGmPrGzlVTidkFXnJ8Nf?=
 =?us-ascii?Q?PaOpGWuueEm+YyJEtVu2SWzo/Y0ZtOuzrG7vt37Ek9cQaZyyMfpKV3NaK/vG?=
 =?us-ascii?Q?pzQGp5UmsOGtipwpsnsphv0N/IF812qTGAa9/Mi+bn4wlDAZQyK4unj7iiF6?=
 =?us-ascii?Q?Yj4QwdZOlkFe9+Ztm1urRjjkhGN/FVM06zQEfN+icyB3LZ1/fiWCCmqcTFGn?=
 =?us-ascii?Q?iKhDyQT+cosKPPkvJKGwo2gnlutoxHrw0tq/6gP26xtxyBslwPx1FAUT6SgO?=
 =?us-ascii?Q?KHtHmYP6oCEPgzm+uE9gccY99C6K5YEG65f4+HiZYrO3WwBykgRgh3w9T3R+?=
 =?us-ascii?Q?aO9UWnvTf1JjGoyHWSzmmCI1cTPyi17c51bEz10pNgee2HUvB1skg1gLAUfz?=
 =?us-ascii?Q?5zUYYcUWMNx8Vw0Eu77GMRpgS1AGCdTgyf3hSJnTXD7WAPwdj0dLIZx1ZNvZ?=
 =?us-ascii?Q?ZWW9rS8kK/68E0E4mBk743Dh38sNXhXN1TJMtSFc/EjB9L1UVKDvdoUDaWsZ?=
 =?us-ascii?Q?XvLnlNbsfXk6QBhmfCLoTs42JMSiyex2f/v/h5MGkROAvOtT9nWQLD28nqY/?=
 =?us-ascii?Q?EhxEUwDMCu6HCShpeeczNsPl1qW9mwJhw0dm?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF208195D8D.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?m97j37cyTd98WNswjEcAnJaNlNGkeHG0qNtVP0yz2+nq9ApXswjMuP7slQEB?=
 =?us-ascii?Q?7f0cuzl/SdZk0Xt/kEFdhMlefbUmDrhDqlBCLTvcSwqNBj6yZSYac9+yBWfa?=
 =?us-ascii?Q?X1ksCEc7fJwX9DU4QbsHaOkl+OAFAM7VLxY1afEHAH86s1SZbtcfQg58V4pc?=
 =?us-ascii?Q?u1Zqdxh2qTBuqM5wqoNxV7amAgPIWqwJWPSA82cxDpTlFYa4kf9fGs+fi9oQ?=
 =?us-ascii?Q?pu0RxXMvptMLnR6ZjrrmhkbtBw12op9FR1UWatSuBjtrKLRPqK1ZTDOD/4kt?=
 =?us-ascii?Q?fDoXliER/VYoADcpdpCvl8M0dvRni6aXCGKzvs2/Ac1SkX2H5tSxibL4hht0?=
 =?us-ascii?Q?dW2RW8U0Tze0OipZRV05BKT6zn5dgyXcm/cr6tqfOSoF2Ko4KOEyEsn796Kd?=
 =?us-ascii?Q?y16RhwR4aFL0oFB9oP8vFgBeSN+XvWFMbhJqSrLCE6EftB8AKFO63svqYkZ4?=
 =?us-ascii?Q?KfcpOwAnmpOX8rBRPJYvy0tEfeN1Pkm6hAMQaEH7054b5KBWZ3tnZmRfyxOT?=
 =?us-ascii?Q?J3yluyXq2ivFL5A1NEVaZr4jZHHEYwaaumIA82UVLREnAhE9lgFT5+MxwiWi?=
 =?us-ascii?Q?JGz/AcJyJE1J/xlmZrY8aM+Q2aDtIc22pitw+ae8qgJQuY586yJ3G0UEN3Jf?=
 =?us-ascii?Q?7XOF3yVK38/q1/6yvuGRyl2yMpB1bejUTskg7+D0Wdyy0hxcbdXcY66Q05cr?=
 =?us-ascii?Q?Z58oqkuTuBQedlSSDvYhg+5VSCxGl9rHPokBy4N63afW/IpeSjkysatrIAN9?=
 =?us-ascii?Q?WUebTiG4W2QiHSBGA0cjI3BosOdR2ZdBfmMbV7Ijk+Pt0JPKKGKh2RPpys/Z?=
 =?us-ascii?Q?ld3CngDLVIoRuQB5KQNgTI3Eu3kp1g1KGUbD14YfZpG8Ke9AEtIO5kO8TsMa?=
 =?us-ascii?Q?4Z3+z5KOTnk9naJAiNdXf4h/QcxbkQKAaJkUUw/rtFnxwpHkWEvr7jm3DvDX?=
 =?us-ascii?Q?3WW8JlvD/HnxRAlMDFzkGNO9njK6uqDHKmPfzxkhCrRExss99M3b3iYgSPt6?=
 =?us-ascii?Q?6ozSJDObPKtNjXP8Yy1LvubVlxciMH1ha/KkbJLsyPOlatPIQFCHxgfrVLsb?=
 =?us-ascii?Q?bWObSgXw9rc61sSO5V8y2ghP7cxEAng6UoDm3OpVKCSe14hIdNlm3NBKTYEO?=
 =?us-ascii?Q?S3SmfrbxXiy2or4ZtDizqhOpkAuiF8JSuiHOpwvTP/rGYFnIRuuUnUcAiC6w?=
 =?us-ascii?Q?LmZ/WmExAt0qn2D6NJIx3CxZIWy0+FbydexpxcueIqwKcIwbwW2cglhn3UP4?=
 =?us-ascii?Q?i4u9LQch7HDRtM8FLy8IM0SUATwB/iIY3jHeKN0KldN56ZqGM8lRxbli5UiN?=
 =?us-ascii?Q?L5DPilxqicLkDhOx26cj62mEs1LcqjJ8vfgnvHcHYF7VYSmBuh2NQX/9WYgn?=
 =?us-ascii?Q?sMSepYgD2mTFNt1YgWEax08QPw8WjKR9I3pqJjciRKSCEbXdLai7nAOQWBti?=
 =?us-ascii?Q?Zp5FqY1t7k2E5nUuLYjA5v6FbsmTcHbqlpJmCGjPaJCY2YzSAuylt7kactou?=
 =?us-ascii?Q?gmB8LL3Tso7HzsX5oODiNfKF5sCLI8lCZXZtfDDRUaxsZ9gZN1911i9CfWLJ?=
 =?us-ascii?Q?905+Jb0j4ETKLEe3JFMX/kZADAwP5zKk0BaOYv+V?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF208195D8D.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f77490ec-6a0b-46b2-d4a3-08de267f94c6
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 08:50:53.1832 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OKL29mzSHm1C/t8f1Og3FS6F1lOlTc+wBPM/JBZjtKaHZY8J4VzfdVK50LPPxCcrETiqjRF4IR9MjpNQM90Kiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4527
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

> Subject: [v6 15/16] drm/i915/color: Add 3D LUT to color pipeline
>=20
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>=20
> Add helpers to program the 3D LUT registers and arm them.
>=20
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c    | 57 +++++++++++++++++++
>  drivers/gpu/drm/i915/display/intel_color.h    |  2 +
>  .../drm/i915/display/intel_color_pipeline.c   | 35 +++++++++++-
>  .../drm/i915/display/intel_color_pipeline.h   |  3 +-
>  .../drm/i915/display/intel_display_limits.h   |  1 +
>  .../drm/i915/display/intel_display_types.h    |  2 +-
>  drivers/gpu/drm/i915/display/intel_plane.c    |  2 +
>  7 files changed, 97 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c
> b/drivers/gpu/drm/i915/display/intel_color.c
> index f290432f3c31..ab9e889ce19f 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -4061,6 +4061,44 @@ xelpd_plane_load_luts(struct intel_dsb *dsb,
> const struct intel_plane_state *pla
>  		xelpd_program_plane_post_csc_lut(dsb, plane_state);  }
>=20
> +static u32 glk_3dlut_10(const struct drm_color_lut32 *color) {
> +	return REG_FIELD_PREP(LUT_3D_DATA_RED_MASK,
> drm_color_lut32_extract(color->red, 10)) |
> +		REG_FIELD_PREP(LUT_3D_DATA_GREEN_MASK,
> drm_color_lut32_extract(color->green, 10)) |
> +		REG_FIELD_PREP(LUT_3D_DATA_BLUE_MASK,
> +drm_color_lut32_extract(color->blue, 10)); }
> +
> +static void glk_load_lut_3d(struct intel_dsb *dsb,
> +			    struct intel_crtc *crtc,
> +			    const struct drm_property_blob *blob) {
> +	struct intel_display *display =3D to_intel_display(crtc->base.dev);
> +	const struct drm_color_lut32 *lut =3D blob->data;
> +	int i, lut_size =3D drm_color_lut32_size(blob);
> +	enum pipe pipe =3D crtc->pipe;
> +
> +	WARN_ON(intel_de_read(display, LUT_3D_CTL(pipe)) &
> LUT_3D_READY);
> +	intel_de_write_dsb(display, dsb, LUT_3D_INDEX(pipe),
> LUT_3D_AUTO_INCREMENT);
> +	for (i =3D 0; i < lut_size; i++)
> +		intel_de_write_dsb(display, dsb, LUT_3D_DATA(pipe),
> glk_3dlut_10(&lut[i]));
> +	intel_de_write_dsb(display, dsb, LUT_3D_INDEX(pipe), 0); }
> +
> +static void glk_lut_3d_commit(struct intel_dsb *dsb, struct intel_crtc
> +*crtc, bool enable) {
> +	struct intel_display *display =3D to_intel_display(crtc);
> +	enum pipe pipe =3D crtc->pipe;
> +	u32 val;
> +
> +	WARN_ON(intel_de_read(display, LUT_3D_CTL(pipe)) &
> LUT_3D_READY);
> +
> +	if (enable)
> +		val =3D LUT_3D_ENABLE | LUT_3D_READY |
> LUT_3D_BIND_PLANE_1;
> +	else
> +		val =3D 0;
> +	intel_de_write_dsb(display, dsb, LUT_3D_CTL(pipe), val); }
> +
>  static const struct intel_color_funcs chv_color_funcs =3D {
>  	.color_check =3D chv_color_check,
>  	.color_commit_arm =3D i9xx_color_commit_arm, @@ -4190,6 +4228,14
> @@ static const struct intel_color_funcs ilk_color_funcs =3D {
>  	.get_config =3D ilk_get_config,
>  };
>=20
> +void intel_color_plane_commit_arm(struct intel_dsb *dsb,
> +				  const struct intel_plane_state *plane_state)
> {
> +	struct intel_crtc *crtc =3D to_intel_crtc(plane_state->uapi.crtc);
> +
> +	glk_lut_3d_commit(dsb, crtc, !!plane_state->hw.lut_3d); }
> +
>  static void
>  intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
>  				  const struct intel_plane_state *plane_state)
> @@ -4210,6 +4256,15 @@ intel_color_load_plane_luts(struct intel_dsb *dsb,
>  		display->funcs.color->load_plane_luts(dsb, plane_state);  }
>=20
> +static void
> +intel_color_load_3dlut(struct intel_dsb *dsb,
> +		       const struct intel_plane_state *plane_state) {
> +	struct intel_crtc *crtc =3D to_intel_crtc(plane_state->uapi.crtc);
> +
> +	glk_load_lut_3d(dsb, crtc, plane_state->hw.lut_3d); }
> +
>  void intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>  					const struct intel_plane_state
> *plane_state)  { @@ -4217,6 +4272,8 @@ void
> intel_color_plane_program_pipeline(struct intel_dsb *dsb,
>  		intel_color_load_plane_csc_matrix(dsb, plane_state);
>  	if (plane_state->hw.degamma_lut || plane_state->hw.gamma_lut)
>  		intel_color_load_plane_luts(dsb, plane_state);
> +	if (plane_state->hw.lut_3d)
> +		intel_color_load_3dlut(dsb, plane_state);
>  }
>=20
>  void intel_color_crtc_init(struct intel_crtc *crtc) diff --git
> a/drivers/gpu/drm/i915/display/intel_color.h
> b/drivers/gpu/drm/i915/display/intel_color.h
> index 8051c827a1d8..a70df0c2bd9a 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.h
> +++ b/drivers/gpu/drm/i915/display/intel_color.h
> @@ -43,4 +43,6 @@ bool intel_color_lut_equal(const struct intel_crtc_stat=
e
> *crtc_state,  void intel_color_assert_luts(const struct intel_crtc_state
> *crtc_state);  void intel_color_plane_program_pipeline(struct intel_dsb *=
dsb,
>  					const struct intel_plane_state
> *plane_state);
> +void intel_color_plane_commit_arm(struct intel_dsb *dsb,
> +				  const struct intel_plane_state *plane_state);
>  #endif /* __INTEL_COLOR_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> index b6e6ebdd0dff..fd7d63ce6d9f 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
> @@ -12,11 +12,24 @@
>  #define PLANE_DEGAMMA_SIZE 128
>  #define PLANE_GAMMA_SIZE 32
>=20
> +static inline bool
> +intel_crtc_has_lut_3d(struct intel_display *display, enum pipe pipe) {
> +	if (DISPLAY_VER(display) >=3D 12)
> +		return pipe =3D=3D PIPE_A || pipe =3D=3D PIPE_B;
> +	else if (DISPLAY_VER(display) >=3D 10 /*|| IS_GEMINILAKE(display)*/)
> +		return pipe =3D=3D PIPE_A;

Is this required specially if this function is only used for color pipeline=
 which
Is only being exposed for DISPLAY_VER(display) >=3D 12 so maybe the else if=
 part is not needed

Regards,
Suraj Kandpal

> +	else
> +		return false;
> +}
> +
>  static
> -int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct
> drm_prop_enum_list *list)
> +int _intel_color_pipeline_plane_init(struct drm_plane *plane, struct
> drm_prop_enum_list *list,
> +				     enum pipe pipe)
>  {
>  	struct intel_colorop *colorop;
>  	struct drm_device *dev =3D plane->dev;
> +	struct intel_display *display =3D to_intel_display(dev);
>  	int ret;
>  	struct drm_colorop *prev_op;
>=20
> @@ -36,6 +49,22 @@ int _intel_color_pipeline_plane_init(struct drm_plane
> *plane, struct drm_prop_en
>  	/* TODO: handle failures and clean up */
>  	prev_op =3D &colorop->base;
>=20
> +	if (DISPLAY_VER(display) >=3D 35 &&
> +	    intel_crtc_has_lut_3d(display, pipe) &&
> +	    plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY) {
> +		colorop =3D intel_colorop_create(INTEL_PLANE_CB_3DLUT);
> +
> +		ret =3D drm_plane_colorop_3dlut_init(dev, &colorop->base,
> plane, 17,
> +
> DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
> +						   true);
> +		if (ret)
> +			return ret;
> +
> +		drm_colorop_set_next_property(prev_op, &colorop->base);
> +
> +		prev_op =3D &colorop->base;
> +	}
> +
>  	colorop =3D intel_colorop_create(INTEL_PLANE_CB_CSC);
>  	ret =3D drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
>=20
> DRM_COLOROP_FLAG_ALLOW_BYPASS); @@ -58,7 +87,7 @@ int
> _intel_color_pipeline_plane_init(struct drm_plane *plane, struct
> drm_prop_en
>  	return 0;
>  }
>=20
> -int intel_color_pipeline_plane_init(struct drm_plane *plane)
> +int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe
> +pipe)
>  {
>  	struct drm_device *dev =3D plane->dev;
>  	struct intel_display *display =3D to_intel_display(dev); @@ -77,7 +106,=
7
> @@ int intel_color_pipeline_plane_init(struct drm_plane *plane)
>  	len++;
>=20
>  	/* Add pipeline consisting of transfer functions */
> -	ret =3D _intel_color_pipeline_plane_init(plane, &pipelines[len]);
> +	ret =3D _intel_color_pipeline_plane_init(plane, &pipelines[len], pipe);
>  	if (ret)
>  		return ret;
>  	len++;
> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.h
> b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
> index 7f1d32bc9202..a457d306da7f 100644
> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.h
> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.h
> @@ -7,7 +7,8 @@
>  #define __INTEL_COLOR_PIPELINE_H__
>=20
>  struct drm_plane;
> +enum pipe;
>=20
> -int intel_color_pipeline_plane_init(struct drm_plane *plane);
> +int intel_color_pipeline_plane_init(struct drm_plane *plane, enum pipe
> +pipe);
>=20
>  #endif /* __INTEL_COLOR_PIPELINE_H__ */ diff --git
> a/drivers/gpu/drm/i915/display/intel_display_limits.h
> b/drivers/gpu/drm/i915/display/intel_display_limits.h
> index 55fd574ba313..cb3c9c665c44 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_limits.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
> @@ -142,6 +142,7 @@ enum intel_color_block {
>  	INTEL_PLANE_CB_PRE_CSC_LUT,
>  	INTEL_PLANE_CB_CSC,
>  	INTEL_PLANE_CB_POST_CSC_LUT,
> +	INTEL_PLANE_CB_3DLUT,
>=20
>  	INTEL_CB_MAX
>  };
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index d8fe80a55601..50a14f75b727 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -646,7 +646,7 @@ struct intel_plane_state {
>  		enum drm_color_encoding color_encoding;
>  		enum drm_color_range color_range;
>  		enum drm_scaling_filter scaling_filter;
> -		struct drm_property_blob *ctm, *degamma_lut,
> *gamma_lut;
> +		struct drm_property_blob *ctm, *degamma_lut, *gamma_lut,
> *lut_3d;
>  	} hw;
>=20
>  	struct i915_vma *ggtt_vma;
> diff --git a/drivers/gpu/drm/i915/display/intel_plane.c
> b/drivers/gpu/drm/i915/display/intel_plane.c
> index 298f8e186fee..7c230a2832c2 100644
> --- a/drivers/gpu/drm/i915/display/intel_plane.c
> +++ b/drivers/gpu/drm/i915/display/intel_plane.c
> @@ -348,6 +348,8 @@ intel_plane_colorop_replace_blob(struct
> intel_plane_state *plane_state,
>  		return	drm_property_replace_blob(&plane_state-
> >hw.degamma_lut, blob);
>  	else if (intel_colorop->id =3D=3D INTEL_PLANE_CB_POST_CSC_LUT)
>  		return drm_property_replace_blob(&plane_state-
> >hw.gamma_lut, blob);
> +	else if (intel_colorop->id =3D=3D INTEL_PLANE_CB_3DLUT)
> +		return	drm_property_replace_blob(&plane_state-
> >hw.lut_3d, blob);
>=20
>  	return false;
>  }
> --
> 2.50.1

