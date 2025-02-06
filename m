Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54FF8A2A157
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 07:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8258A10E44F;
	Thu,  6 Feb 2025 06:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NZ4V2BhI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802FC10E444;
 Thu,  6 Feb 2025 06:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738824420; x=1770360420;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=X+fBqAi5ZdfRYdrvkUbZgWJ5TTNsa2UwwhLY8orklcQ=;
 b=NZ4V2BhIutsT7Gf8dCt1D8ugFQvKY0ZXoCfxnoOuIm/cNdUsbY+hfQ+1
 wXFD4UexZIYF0txVgHG0HQPYh8Zx5k/AFUGI17eJA80wTmg3akwODa5M/
 E1iVarREnaEcvF4oypNyvrLrgOEv/pFYNtFFrJbD8NmnhWXxdRSsCXg6P
 Ch+exsRl4wDm7zkEQqselEwCw7s46wfnjNZJlk0CFfujT4mo12BJRlO2O
 Xv2m2lkUO4uHowEvXHuCKIXlmMGO/4YRMwoiqnoCVJGvMHCkgvDalANvU
 9F50m5qE3/um7KIfY1SgdBzQFDEMPEBShjm7brL+w2jCzwYBzXLLxgV1o g==;
X-CSE-ConnectionGUID: x6Tb2tEZS8Ca2ZiDbwdDhQ==
X-CSE-MsgGUID: P2ANzCtZTXiB5cTc6bIriA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="56830685"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="56830685"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 22:46:40 -0800
X-CSE-ConnectionGUID: mE6mT4zYRsShe4O7OOCsFQ==
X-CSE-MsgGUID: dS1v/n8GSG2GyLhAD3ZjzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208";a="111654665"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Feb 2025 22:46:21 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 5 Feb 2025 22:46:20 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 5 Feb 2025 22:46:20 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.49) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 5 Feb 2025 22:46:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KPQIl7SIRCMCCL//+AiaiFpXLnuU0m9xXSCuLIC0XIXeZQjUsCh5BsPX6XgxfgryMe+lyD32PLrUCvjReoD5uz4j6yA49ISYNN7dE2VmGuAi7PdPE564H+ymY2QBYltb+om1Tp+na+M4r2rxm2O3BlNBe5R7tuy4/yEpT345ng8Qmnpy1DitD3z0wpr+qBPyqWHU0fDj4tU773fr8ZO6+Nd5PK+ef2dvfLBP4WPNnX6U1JIOA8aMA4mNIrNBcqxs/oF+rYOSxTDknznI+V62soPtjqVlH8axDtWJspxidwiGMVr4Ndfg49o3WvkVdl4H/f/oh8/7o1GCg6uVgiMmnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3P2dZw+C218t3yyIgm8/R7neCFVJ1dgzf6TwFaBOX7c=;
 b=qTFj3s/YEG3fY0JTqHaidLtNlkhZbFwAeBtQRHYzLi2UWPAAvBDCzd22GqrY99wu2izbJVbVRBC5uLclgzS46QNhm3QHLcoxmIJJLHw4YteKA4M/Otd0JdsESAmlU/OzmDR3LVCkzRaRBXIwLcULko3hpdbkTwAElm84bYTGgy3I7erggUbImYoHCr40lOMSDhOIJccAPWBjwthsm4yCzN/KihWWco9xJznahRnRuIOXJMZc6EeXFNPIPDnw39c8QihI5i3G+Z+dnXOG2m5Eb1X+F0IXMsGv4wakAuB0/RGUuolMnQiOlAXcudrmgbznrSZMS+VVQUEbC75g4MltIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by MW4PR11MB6716.namprd11.prod.outlook.com (2603:10b6:303:20d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Thu, 6 Feb
 2025 06:45:57 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%5]) with mapi id 15.20.8422.012; Thu, 6 Feb 2025
 06:45:57 +0000
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
CC: "Shankar, Uma" <uma.shankar@intel.com>, "Kao, Ben" <ben.kao@intel.com>
Subject: RE: [PATCH 4/8] drm/i915/backlight: Check Luminance based brightness
 control for VESA
Thread-Topic: [PATCH 4/8] drm/i915/backlight: Check Luminance based brightness
 control for VESA
Thread-Index: AQHbeGEGwuBGU8le6ECQw/PLMcdSFLM51FFw
Date: Thu, 6 Feb 2025 06:45:57 +0000
Message-ID: <IA0PR11MB7307A5F0EA79285F07A0DD17BAF62@IA0PR11MB7307.namprd11.prod.outlook.com>
References: <20250206063253.2827017-1-suraj.kandpal@intel.com>
 <20250206063253.2827017-5-suraj.kandpal@intel.com>
In-Reply-To: <20250206063253.2827017-5-suraj.kandpal@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7307:EE_|MW4PR11MB6716:EE_
x-ms-office365-filtering-correlation-id: bce86f27-1e5e-4d6e-50fa-08dd4679e958
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?u94CNv/1SvdMKXyXPzu3pOtvitQHNEV8aKi0qU/aPwvbh1Mm/C51frBsHNnK?=
 =?us-ascii?Q?e8Up4lzv6fmzPN5m4wejRdc5yvRZLYfVR/STATwEGwcvLqrgHQc7k7wmE4CP?=
 =?us-ascii?Q?Z9uK+T27DY7LDmtBg9YjtQezWaWgcDvSQf3ZNdUqoiJWrz23K0QM9wNsV0+A?=
 =?us-ascii?Q?N1g0oogBHUz3b/vWZj61/4u7HhREMrmr5+axRSsRlH5am3QysrxHVPCd13Vd?=
 =?us-ascii?Q?z2aK1mQ+H41kghPifJ1V2jVYBeEa+PwRtpTdOq4Skt2PgTzhi4sLDYRglibm?=
 =?us-ascii?Q?rnysRhPYmNcbbBrZgY5W43jo1Hw4VwXGx61NCAMy9UAwLFwwqYLBhgTlkNDs?=
 =?us-ascii?Q?8eKdyGwxMYKufqcmHNieD1+ZuXIwAgcaf10ARCgxJqENzc+ngUp26UH58M1B?=
 =?us-ascii?Q?dyMTXBTz1WPKWDIWb1ZZKblXAuj8ReD2mjmnrW4j2iJ10A+OD0Fp7q3618o6?=
 =?us-ascii?Q?/st+xqbdWNJF4krltWS2do+JTzWcH1EOpZESDv7sXI0uB4vZR9xAxktqP9bv?=
 =?us-ascii?Q?A3kR3TT6n40JkQzXLKT5S9QuerA6rr3ApVThuuYJzbCR0pV8qsl9RAMcsjaI?=
 =?us-ascii?Q?IQC7K8ziJ9w3fjEVA0NO4gtHDV9T7bPn/u8NqiWj7seWPmZCx6VfdwXLmDap?=
 =?us-ascii?Q?NWFfM9RHbXs8Y+gp7aca9gN3F6bKNkzA12Vt/WxyY7JXUm9XTZqxzmAvg91n?=
 =?us-ascii?Q?pySp/3q+lJkNLFf5g2GOLysHcCuc78MYL0o92VFSeLReRp1LVXwoG66XLU8Y?=
 =?us-ascii?Q?tRvJdf5FngpAcwAPyjjy0buNVF6UIdPOKHvLY8JbPFuYTJIPT4DRU0WIOJL0?=
 =?us-ascii?Q?snF12tzCx1wrxDGE+dIkROe7fGu+1QWMjaYBWTAtRPmE0w+txcDCn4x6Dgwi?=
 =?us-ascii?Q?onRO8+NWq9SXw/cjtobGH4jUUVOwyFBJsfEgy5nGIBq2tZZP4gkOXuxQgYE/?=
 =?us-ascii?Q?Uj5QvlUG9E6tMsGXf2b5HuklPVlsQL1cjD8DwoC6PahxDr/QUhzHAFKcS1kN?=
 =?us-ascii?Q?sO4BOAK/o4WPPs4Z7YTRjafLI1PAvEUt7EorGCoqWEz9oHeqhcxyXh2S8ay1?=
 =?us-ascii?Q?IOMScfFnMFHfMb82qgYZWNz1GIF192xuyW1xNuuf7QFwxbx63AjYXJt/lLc0?=
 =?us-ascii?Q?kBM4EdABwDWFYWn0JZJiSaiVgiHoIdjTfPx/VjpYdZM2OxT81UXSwMbriULQ?=
 =?us-ascii?Q?MRrYXp575t2JDqFrVI4MhkQb2JXtZzlWxaP77pFeE5tdFkERC/vvMAErAZMo?=
 =?us-ascii?Q?fRM9H3W/1UqzFJBYqKdwsJFwMEqsHOHFWwd11s/0HtcWvpxvYZEbesjMGlnq?=
 =?us-ascii?Q?59qf18fFfV3ElVQcsHQ/U9/xWKm6lmulbr63lFxwHB+KNF9IquoJ9Dc0QPWJ?=
 =?us-ascii?Q?CaapMQaefXI+gJ7aZicem8QzT3orNnJEBUhw8dXNL2s7zUadfPduvQnzMeHY?=
 =?us-ascii?Q?+GO33US1ElL5nc7nUWH5TZXt+WjbiBNz?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?astwjjOXPRntBAXY67iGYI3tn6uRlN4CuZPo3bSA0lD8u3CoLXK4j1R6SlYF?=
 =?us-ascii?Q?ajUt4rFCUbxhu1vsl7l2+DJ3M3l8/8T+nh4oZgvyQu0Bnj+ArW2tT1Ar+lyi?=
 =?us-ascii?Q?NxaPmLCGI9+nME8DHfN9wcNWpNm8yJHJxa4vpTpw18cVl7IDUeB007HGRntr?=
 =?us-ascii?Q?hRxRlV5Mj7rI1wxUYSwIUh3znlwGrKJqPSo7lUyBadFFgzVQ2MxWZ8NZduzx?=
 =?us-ascii?Q?kbnN9rinM/m1JFtFkUgBoSh0o0IbSN5nJso96uXwrS64lfcYssrmcQO6o3pQ?=
 =?us-ascii?Q?KH81wge7PsI/oSoiOU4aj8+YEzl3pJeT/n7rv6jpNdIPP+a7Uy4hmFw7FmvG?=
 =?us-ascii?Q?sZ9Yu0KGwZlKLj/ysQn3LRVDh+1dTU8o1p6W/EHa2sApubn4qKUnX3hNJBBt?=
 =?us-ascii?Q?3whU/lI7sxRVEzz892NS47f+4m6MoxzWuyktss4YmARAEHyZMXX6Tn1eGl3w?=
 =?us-ascii?Q?yNebPHChG/fGYn049TzfsUKCcix5P+1LsauyzD4itgQPihRieCDzzukj2XhS?=
 =?us-ascii?Q?m/C/jxSSAVgyYAzahatZmKeEWdj0BZu9/veMc4BYXYl7hI3qYMZa1yOpPBIf?=
 =?us-ascii?Q?TS8fVDMQHZ5a4innFsTdqvRLKFDqH/clTK/F7e2C+JjnEx1r+UscZfFLlrg6?=
 =?us-ascii?Q?Gnx/L5qqMyENna+k2A6ozBJEL+kwfZ1SWBsr6/psQNnffa5va5s98oCNCbwk?=
 =?us-ascii?Q?jdOQFOfmA4jpeMpBy0po3WjamjQ6AG8a+0XkDEdDnpPP/LkUQfIqa7wlor6+?=
 =?us-ascii?Q?M+IgW+RNpeXkb8vWUPZx0lS+7HpPI8k0YETrJPE1TKgASSanoQ220Z1VzyHJ?=
 =?us-ascii?Q?WnxThai8/OrqQlQagq0YL/6nLyn7uI8bCOXtR7YzIZVKM7yBdCiZu+ZRGWuC?=
 =?us-ascii?Q?n/5MPtujeqOl65HObAcp/fTkEsZDO9vyLOrsf5gLK05iavG6iEw0+oRF5GD5?=
 =?us-ascii?Q?iJMyQvSA0f97VtXS9VRoc1E+AeD+ZIQTAmyB4FeH5Unr/NzI/q7L0KGFLXxm?=
 =?us-ascii?Q?EqJm3ZTG9xeMxusx0Dd97WXJrqtEzTlZ8r/oJac+AgWvUimeuvTkzKQXKZbm?=
 =?us-ascii?Q?vpcvL7qn1XhCwR4M1PV14DX83NLKePXlI81dtyVDSUI23uaynYnCxQESwVk2?=
 =?us-ascii?Q?cTK/D/GFCZk2HILSlPEsDhz0HJsP4fgaa6XNi1TUPUlzcUTJ9+ZSORpqxd1V?=
 =?us-ascii?Q?rqL9LEz2G9kHZAF32096Lmn0HgDzdk2QnhjC8bBS5nXgUtK+pj5naNERdufj?=
 =?us-ascii?Q?LC4oXvoCCW9ALvT7YHhSenWwdIwi89cik8Sg6yIvMamV4VUJTLl1u7fznYwY?=
 =?us-ascii?Q?7x9RSPSnqI7NVb352u/a/g9kTaGYdGhaZIlzZtsmzRtRwx083viy5P5wG/Qh?=
 =?us-ascii?Q?aOYTpmbQEQYP2Qj2ejy/zsF23JU/vW81clHOHQjWjIpQRfQUxbMH2WhYHXZF?=
 =?us-ascii?Q?kkaz+1AMoU1zeFP07Sul8k6Q6pGAJyb5+5iIWRnZkcy+QYiyZyPMZQ/n+NXX?=
 =?us-ascii?Q?5AFjiId2BCXIJpIfvBgYSqQyJdmo+71eRmCyvHrzgRzx1NKcL1UiyEdnWYLQ?=
 =?us-ascii?Q?1Bo23U3RjH8ieMvtyZRwdTp80UhHv7k3XuPNM4Yv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce86f27-1e5e-4d6e-50fa-08dd4679e958
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2025 06:45:57.5926 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kSfUVzAWsgMjFOMCL05c5w9zJ3/EG1ZD+J19hDoIBenO4/4DrAWkHZhyKwbhdwonJqM87g3VT0jNwI1lsT1Wrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6716
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

> Check if we are capable of controlling brightness via luminance which is
> dependent on PANEL_LUMINANCE_CONTROL_CAPABLE bit being set on
> EDP_GENERAL_CAPABILITY_2 register.
>=20
> --v2
> -Prefer using luminance rather than nits [Jani] -Fix commit message
>=20
> --v3
> -Fix the bit name used in commit message [Arun] -Use correct edp_dpcd[] t=
o
> check the capability [Arun]
>=20
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Tested-by: Ben Kao <ben.kao@intel.com>
> ---
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>

Thanks and Regards,
Arun R Murthy
--------------------

>  drivers/gpu/drm/i915/display/intel_display_types.h    | 1 +
>  drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 9 +++++++++
>  2 files changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h
> b/drivers/gpu/drm/i915/display/intel_display_types.h
> index cb51b7936f93..3b64ad724b29 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -412,6 +412,7 @@ struct intel_panel {
>  		union {
>  			struct {
>  				struct drm_edp_backlight_info info;
> +				bool luminance_control_support;
>  			} vesa;
>  			struct {
>  				bool sdr_uses_aux;
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index 09e82f24d030..2599aa39b21d 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -575,6 +575,15 @@ intel_dp_aux_supports_vesa_backlight(struct
> intel_connector *connector)  {
>  	struct intel_display *display =3D to_intel_display(connector);
>  	struct intel_dp *intel_dp =3D intel_attached_dp(connector);
> +	struct intel_panel *panel =3D &connector->panel;
> +
> +	if ((intel_dp->edp_dpcd[3] &
> DP_EDP_PANEL_LUMINANCE_CONTROL_CAPABLE)) {
> +		drm_dbg_kms(display->drm,
> +			    "[CONNECTOR:%d:%s] AUX Luminance Based
> Backlight Control Supported!\n",
> +			    connector->base.base.id, connector->base.name);
> +		panel->backlight.edp.vesa.luminance_control_support =3D true;
> +		return true;
> +	}
>=20
>  	if (drm_edp_backlight_supported(intel_dp->edp_dpcd)) {
>  		drm_dbg_kms(display->drm,
> --
> 2.34.1

