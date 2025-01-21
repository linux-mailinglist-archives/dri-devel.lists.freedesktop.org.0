Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E610A178D2
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 08:54:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A35210E4EF;
	Tue, 21 Jan 2025 07:54:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BI7srZf/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1783910E4EC;
 Tue, 21 Jan 2025 07:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737446092; x=1768982092;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wvMI55Y0ul363HbfKVNlFM70rCePOFob1Ix+5G/FGIM=;
 b=BI7srZf/qZacsNN28KHdCJ+U82wDCtlm7ecFYvqIN33q7vxk/GspAyvo
 AQqZxY22XWKv+iwo4DeByidZmmCIFeK/WxGOmqfLsD9jfeYayaEI0MiKs
 ULJBbiehwjOyRrOEsRcw2nBLYxo2TvwsB+wGkj2EKlueiRSg+DtiPqQro
 bYch6HnNGWCgUBZ34tP+BFGaqB6lLuuZcCzkHbMEpam6OBlHHR9qFNZTT
 hXJSxHDL4VVm05Px6h0enQiiUrl7jBHb8fiSVTGQgVrSr7hsviTbWJQiA
 J3hDJaYTFu9B12dYuC5TDn6oXPp1jVO9HTKUu6f4huShyIRRWVqaBaYYa A==;
X-CSE-ConnectionGUID: 8cXe8KrkRWmEG/tx0+4Otw==
X-CSE-MsgGUID: vkuChMPfR2SotVVsgHiEpg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="60316015"
X-IronPort-AV: E=Sophos;i="6.13,221,1732608000"; d="scan'208";a="60316015"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 23:54:52 -0800
X-CSE-ConnectionGUID: CB1LDolbTN6MpgI9xUPAcg==
X-CSE-MsgGUID: HYV8VmlgQmWr8WSUhh67dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="129990885"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jan 2025 23:54:51 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 23:54:51 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 23:54:51 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 23:54:50 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K1bZdUAArqycRCyqJTl1qdxHNj8ALyxEYGaskEes5Vv+6tftj9sy1iU5EI7U1b8leyY1M77X7iKdvRnTggdGcTrTZhvAdY/bBU6b/m/jP34dncHczrh59fN6dNNn4dzj6g0o8JQsrtPI3x/rlXcSE6+8129kD13OWrKl71abQsn89ZEUCIu+DgmJCIk6sCAj1hCCwJfzkQm9utAUubZ0yXR3WiCXFue/meQ5mrpcZwhN0NVP2HAMvqNBHf0XZPxg6BW0SjRQr0NFH1mMIL7VUcYRtDwYa1SZPsaHsfrMKAW2S412fHBlpYijbN6fvLw85wlf7M4pyqv89xHrpWrsfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfUYsgMqlnAUSDtsnvTfxJtMi62XY3xBmTNRMeiVCmE=;
 b=Ewdu6W3MaZTSCYIBVK+gWTrGVICyAVdwEjo9NluiwKXtFuyTV4EdxTnP1X+BsO3dsF+AsKMhxwETWY4Gw1dH/6/6uS+w+z+03KR6nWU2ZENheOmtUksIGUycvP32/gU/LGV859XOZCOlX1ZSDYTJpiO7sCvwcqol36ufvJGzcPF8Tch0tdTHvkAFQ5wIn7s6OlcNbpEc51nhr+pUutQ1diNlUQCwaM1cjtVeog1ns4oKHboq8JQwseRnGGuLcsaIw2bk3USZLgKMNLQw/hOvnA3jb6X/a57RTrtCoQ8VKRA8JVdujJqCC9xelzMDPZAAAygpEUkcg9c/0l223zVF2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by PH0PR11MB5783.namprd11.prod.outlook.com (2603:10b6:510:128::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Tue, 21 Jan
 2025 07:54:47 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%2]) with mapi id 15.20.8356.020; Tue, 21 Jan 2025
 07:54:46 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Nikula, Jani" <jani.nikula@intel.com>, "dmitry.baryshkov@linaro.org"
 <dmitry.baryshkov@linaro.org>
Subject: RE: [PATCH 1/3] drm/dp: Add the DPCD register required for Extended
 wake timeout
Thread-Topic: [PATCH 1/3] drm/dp: Add the DPCD register required for Extended
 wake timeout
Thread-Index: AQHba8qILHg/TsrzxUO2QkgD9QotD7Mg263Q
Date: Tue, 21 Jan 2025 07:54:46 +0000
Message-ID: <IA0PR11MB7307393F037B56409B4BAF1CBAE62@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250121060522.1296166-1-suraj.kandpal@intel.com>
 <20250121060522.1296166-2-suraj.kandpal@intel.com>
In-Reply-To: <20250121060522.1296166-2-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|PH0PR11MB5783:EE_
x-ms-office365-filtering-correlation-id: e756b030-4d6e-436f-57cb-08dd39f0dfff
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?R+5rUdWh1Qj9jrRZiUWzakWoGuxtt53ya7fbu6D4V3TYI0w+GG7McaFgZM+t?=
 =?us-ascii?Q?rNLl4X2ZBqgJz+alRgKdymz0LaZ2L9VzYgSYtcTL3FQNlZvosBeZM5jBqetE?=
 =?us-ascii?Q?u57FD7XSPOWfSUoteqAp7y6JZTGzO4CuJJRoKsf7G6MG8B1FYkx5hjaAj+rO?=
 =?us-ascii?Q?/gCp13DWLqpP16TKCMdgNVdgFoELuFKM3OvrBvQECriuolukOd2OFF6vVBny?=
 =?us-ascii?Q?eYb+NYXRSBrbHVBxS9Wh1lzUZGRVb/nzJdC12RdnsfpT/RulLl0pBYnyH5nG?=
 =?us-ascii?Q?1292K9ZudEp/HrWGd05HvkN0CR7bvaowo/lWBBTjfPCTIUBUcgdtoNpIk6kY?=
 =?us-ascii?Q?uzSZOxgyBnWTrF3oRBvbgui1+E5/dZ3E6cmTnB7wcJ01NQKtfeINs0WCB8bu?=
 =?us-ascii?Q?Abscu69ZqkzeIDLigv07gQxSCT0Bz9UcKO1bjkuyECSCYaGTC7RoqaG5FeaF?=
 =?us-ascii?Q?7voKXNeCMT8rwCUHXRkCyJlLH6rrVn5tPaDy4r2RlpdCFsaDDUJY36mRxOes?=
 =?us-ascii?Q?TUZ49twU+zDpyS4VTDqZYeZX9ZLy8QF3OTbXj0+OrTr6096w4xj3s/3D6Lh7?=
 =?us-ascii?Q?DlanFjYGUGWCGB1XB4UIrvEs9UBXtKHOrFsUFuz3UamM0jo49k6taBPMCoK4?=
 =?us-ascii?Q?KEqicID/X53MNBtI3FG8eFrDqZZF+d80N7ORbEaS2KdmtSLEccrA1LoZEJJC?=
 =?us-ascii?Q?4T6sIAfQBWcwTLrtx71HagTRxwETv0d8Xd0G8hWeMnVSDv8ixWKKwg4KmE3o?=
 =?us-ascii?Q?qfcQA9E309jrZwPgo87yC1gLFEV8beX3lD1NHwBtjFuswoHSWuHiVscBdop/?=
 =?us-ascii?Q?9nHtPmn0IhAMMq9i6bdIFwsY6oLAxoPQD8zzv/DCzEUDim5KzjzENcXFlYBf?=
 =?us-ascii?Q?hxiQ6Fixc9E+//MYCdXEE/TeUlNlZ1nM9N2Fgi2PytIHHhN9ZRcqicYGJIoQ?=
 =?us-ascii?Q?Ny41nWodXSkGdD+/tB4DgVDBHfA4ifoasSV+RUvfBPx4DHQBspZ8uM0VA4+c?=
 =?us-ascii?Q?kle7D8AKeU8Xs96CG/d/Q9FqxRy9/cMx8kg5cuI3zhcMUmMFcwyMSY34yrIO?=
 =?us-ascii?Q?QRDhvZgfr46TkkRgwSeUmbJfKw4L7gRzqNUsxXEB5vXhRidTKpHcaacb3W8U?=
 =?us-ascii?Q?YB2ynzY+HGu5xdVkEDKzytn6nnOtTUZ6ODb5zDXL1JdrC57pVGHPDcdeU2nh?=
 =?us-ascii?Q?u/uV52JktrXMihvd7RuHii1YHtPB91xuAuu/vkFKjXqessOXWn3+BYPFaYM/?=
 =?us-ascii?Q?O/3Op78B3m93u/pDAPB4GHHSy2AYMg3CF05/SWRwyev6H0aQ+e1WbUDITMh5?=
 =?us-ascii?Q?Js/EvpA1DEFiWwNL5ZZb3eN4f6YzDSZUMbWdLcQoQI7teoXJzpJpja41JrBz?=
 =?us-ascii?Q?Kvv1JriFM+mR67IrV3nkh4HQ9l06O7ZdQELVZsmZPM1ao93VkoqXoGTPH9xB?=
 =?us-ascii?Q?KOlTHZ2uxXR/u80zvwF74q0uSiZ/QvGy?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MsdSnuDBFdY7ZRTIkY0W71Zl/8hhZWOmuGUFvX6fDKZjKQcYGOS9xv924xqR?=
 =?us-ascii?Q?PpDzcDxG7bZ+HEupeWPqR2VOfySXVbUvrE77KMt7A6dnQQRzWA8xoLtdb74t?=
 =?us-ascii?Q?qdGbYBJzzYRB94FT7RXP9whf1s4RfRpDjlcjvFiz4Xj1Sbl5yCB0NVETV3z2?=
 =?us-ascii?Q?2y4XXHuvUPoC7pnb6rCFbjLSZmukhQhYwzGyWAnDSHtNVOMABGFI69AsJvqy?=
 =?us-ascii?Q?122HNtmxzH/H0ovZHwq/7BqvPcosAv6NcVhJTFrhKE7ZE9QndryFKRJV0BGP?=
 =?us-ascii?Q?o36QA45NdDqQ5zjcXlp3lA1ZWjBMxxhrMjwe9Vz0MAWC9V4+jIFzyut1x1P/?=
 =?us-ascii?Q?JQO9TfjMyOb/OIj/uVlu9dHmLKugEQaKuOLbgrsDKT30FA1I+3lgpbPcY8Zf?=
 =?us-ascii?Q?fWfzEQUXhqGuzsovGNFh4K5Fz93Tli76nkNSjiYYW9L7IERJOPsaRliqgE11?=
 =?us-ascii?Q?Esa8w86ycjkmTbE7lSfUgJpJWsqCStisYwUFL6qwXXCAGhLD3SwwkF3xSoBl?=
 =?us-ascii?Q?3LyLjJUbJwP/FvEWvm7cLVgz/28Hq8LBlZHO7iNFKqSyJW8+bTz99XmwvYyl?=
 =?us-ascii?Q?CIQeP6lbTQy/76TejDNCzjERD67zQUioB8kLXZ+m44Hur7Lo9kZsKooPH9ZS?=
 =?us-ascii?Q?ktSdS5F8YfnVCgGHIWQMiK36evKtQrJlpZuhKtt+BBRIjBubSboMEeCbWOLe?=
 =?us-ascii?Q?Y/lZz3DvjahMkJQOpJBaONmq//JkOKSKWjG0Lq7vCIdJDA1QqLP5UNROo9hP?=
 =?us-ascii?Q?Nq3pDdRMmaFrNd6dXXApCAVTE0QEYDMMR9JDw2GBjz9FXyGw+7ErPIDqzgzc?=
 =?us-ascii?Q?VcZb/NhoI23rTmP4g/lLLx6YrVaJo6Ds7VygFYeWvTt98WQpsmjNtTHwAIHM?=
 =?us-ascii?Q?ihOotXqEzf0i1ln53BnhhgB46A8zf4pwUevPPmtiBJIFQ/MNK5+hD9/azIPn?=
 =?us-ascii?Q?GcoGl6LM49EFJ5EttZjUZpcmpZ7LVKJMMqfsGdvnP5n07AQMGP9OhEkWBsOW?=
 =?us-ascii?Q?b4b6YqXQ1hPqqHXkhgNe95/uHV138ovO06OvKGd54chnkqFOxqwAnlVaASDd?=
 =?us-ascii?Q?LQuWOsNojj0YxuEfcdkXnYIWOxxasixjZ03QsAHvW3muXg7rZaU0GxRWsXQ9?=
 =?us-ascii?Q?QJkOZwEYE94K/eha3+znPV6SYOLWHaXCQvtRcfr2dD06UYogLdio74JbXGmC?=
 =?us-ascii?Q?36OQ0xafdMSLLIfP1luxCJ2r5mKONtbnL4bpLtzyazgXc4jNsIfkjYtF40wY?=
 =?us-ascii?Q?x2QlpAbFTcHYB9Fa8tOgi2sRdf1+gd8uPYDrVJreM83UziKLoUbwEHd05E1V?=
 =?us-ascii?Q?6dMeuL8RcEQ2P46Q0Dljjyz1Fx+7NuJX0xWySJOz1eCd6LbCj7DjjXB498Nl?=
 =?us-ascii?Q?C6vL/uZ5kufU0HqaYfiY/mc7T2BCNuiSiCozgb/cuBCbK3bCTi0TONmSM/BL?=
 =?us-ascii?Q?hBHwVfn1xz5MFLgkMBOtQGkMHYLAia12o8qmdnkGRcla38kn64Ac9PrIGwFH?=
 =?us-ascii?Q?Y2bYYl4ScxqGg2w4NnMvpksTipQGW23gxAyS4LCjPcmLLKvRJBqeWZDScKk9?=
 =?us-ascii?Q?Si1QJixtrlXVnyYJfg2vzbOzrcIHm8QZCXzwINtj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e756b030-4d6e-436f-57cb-08dd39f0dfff
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2025 07:54:46.9150 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fMZwoMfPF8MUMkMj9AELoR3iR8NQQ4npBfwlPQ09TYXUjlXNRVOCTnx0qgmwbK2lRumoUxnGip8RX8g/SFEUaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5783
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

> Add DPCD registers required to configure Extended Wake Timeout for LTTPR.
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  include/drm/display/drm_dp.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>=20
> diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
> index a6f8b098c56f..480370bba1de 100644
> --- a/include/drm/display/drm_dp.h
> +++ b/include/drm/display/drm_dp.h
> @@ -696,6 +696,9 @@
>  #define DP_UPSTREAM_DEVICE_DP_PWR_NEED	    0x118   /* 1.2 */
>  # define DP_PWR_NOT_NEEDED		    (1 << 0)
>=20
> +#define DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_GRANT	    0x119   /*
> 1.4a */
> +# define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_GRANTED	    (1 << 0)
> +
>  #define DP_FEC_CONFIGURATION		    0x120    /* 1.4 */
>  # define DP_FEC_READY			    (1 << 0)
>  # define DP_FEC_ERR_COUNT_SEL_MASK	    (7 << 1)
> @@ -1168,6 +1171,15 @@
>  # define DP_VSC_EXT_CEA_SDP_SUPPORTED			(1 << 6)  /* DP
> 1.4 */
>  # define DP_VSC_EXT_CEA_SDP_CHAINING_SUPPORTED		(1 << 7)  /* DP
> 1.4 */
>=20
> +#define DP_EXTENDED_DPRX_SLEEP_WAKE_TIMEOUT_REQUEST
> 	0x2211  /* 1.4a */
> +# define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_MASK		0xff
> +# define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_1_MS		0x00
> +# define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_20_MS	0x01
> +# define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_40_MS	0x02
> +# define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_60_MS	0x03
> +# define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_80_MS	0x04
> +# define DP_DPRX_SLEEP_WAKE_TIMEOUT_PERIOD_100_MS	0x05
> +
>  #define DP_DPRX_FEATURE_ENUMERATION_LIST_CONT_1         0x2214 /* 2.0
> E11 */
>  # define DP_ADAPTIVE_SYNC_SDP_SUPPORTED    (1 << 0)
>  # define DP_ADAPTIVE_SYNC_SDP_OPERATION_MODE		GENMASK(1,
> 0)
> @@ -1473,6 +1485,8 @@
>  #define DP_MAX_LANE_COUNT_PHY_REPEATER			    0xf0004 /*
> 1.4a */
>  #define DP_Repeater_FEC_CAPABILITY			    0xf0004 /* 1.4 */
>  #define DP_PHY_REPEATER_EXTENDED_WAIT_TIMEOUT		    0xf0005 /*
> 1.4a */
> +# define DP_EXTENDED_WAKE_TIMEOUT_REQUEST_MASK		0x7f
> +# define DP_EXTENDED_WAKE_TIMEOUT_GRANT			(1 <<
> 7)
>  #define DP_MAIN_LINK_CHANNEL_CODING_PHY_REPEATER	    0xf0006 /*
> 2.0 */
>  # define DP_PHY_REPEATER_128B132B_SUPPORTED		    (1 << 0)
>  /* See DP_128B132B_SUPPORTED_LINK_RATES for values */
> --
> 2.34.1

