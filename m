Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 541E5B2941A
	for <lists+dri-devel@lfdr.de>; Sun, 17 Aug 2025 18:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A563A10E0F6;
	Sun, 17 Aug 2025 16:20:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XfLoi8gN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0D9610E0F6;
 Sun, 17 Aug 2025 16:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755447620; x=1786983620;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uE3ZCqxIIKSvyGHf4iXzu+iVqayQg38NSHhmwtzfJmY=;
 b=XfLoi8gNXjnBSKPXoqZd7vOoJ0BPlhap25bS7WTuu85HQ2+zaYgiRGuJ
 b1pUIj5tn4lpUsSP6vzNA4XXyOkSFBV2EDhvxUyOY8+ldVPeBKintU5M4
 9JVsDMclKrF3sc65+83u2jPXIwoWfgpjIiWlmYy9dPQeJ4awmO1PY05qW
 lt8VmboCFaqQiVpoWlRBVgY3dH2nCoi7BaK1S0rUm9kC+hVubwjw1Rp5L
 iqrRFqTyk1dPjYlDUIYVVN2xf181h1iFmRdfcsbAdVma4P9sJjKbong1Z
 D/bNLiP7/ha/Y9ore1JoeiHK47Up+++wlZxGF5ey4/x91n9FoW3C4uK/e w==;
X-CSE-ConnectionGUID: m4RFeBmrT1+5JHb86gh82A==
X-CSE-MsgGUID: xpC7lZaAQK6dX9O4Lad5Gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="57763622"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="57763622"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 09:20:19 -0700
X-CSE-ConnectionGUID: XtE5l7DnQ5KrpWyASzcNlw==
X-CSE-MsgGUID: YILBiuVsSWWfDb19tDUBHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; d="scan'208";a="171831644"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2025 09:20:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 09:20:18 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Sun, 17 Aug 2025 09:20:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Sun, 17 Aug 2025 09:20:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zp4sy8HI4IVRgZKi7txDu0Qgp99XS6lnFIv/Nmkg2kfqCs8dKVWhx7HGo1wDkVOC+t0g6iTS/m5v5Fr37PzWlefKW+tAJauQJmiRrnoP5kANor9DzIpyjhPcdV4wtJzE1PT3g29UY8WzQnLedj5dlIYqd3OEpt5ONFW9xHsgPuJgZJgOL56lQvdWI7xSk2lO7Oi+NqbdgbHNwFZH1RXK0erGV3qBdOQYdVzE6KhzIQuvei9zLiSZGwUBfo1cMFzesrmr7aeD8jwEx5imF0WSl3y60eOTmXqGnn/8ly+e+fbCsGC5+zffmolzqTqex5BTDd4oqPQaQwCk2MDW+pLV1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2DtS+1XeMlK0kL51QI5R80E3ouGjLqs+g7lFnh359f4=;
 b=f7755vRTA8PVqrjgO4GpzViuPHRw/FgtKmIDrPLOlOQDxTNCwY6Q30lmBrYzM1sgfm2NKSTm3fS+dgPClp2xwZ22pSNQiZRWkt6A7oHPaNtk12gWp9OMijpsgJLJ/gph/04UGf9h+leiu7Y5iU608yxO+bSF/UsE9gODJpvLQq4NJPJv6NNfQIqybH60aWuiAt+SHg+JXvdZ7+KbzHfzEF8kfR2F4XPF20EG1hnHCXAGQTWWuNidVpHek1LtJu8MwOzJ+iH+Ztu9K7GpxP8eo37jeMxH9nl8RaGnpftsDtTJbooYDFOh5njLBSfo9sJN8DSylmcIks5Ssu12HFj3rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by MW6PR11MB8412.namprd11.prod.outlook.com (2603:10b6:303:23a::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.23; Sun, 17 Aug
 2025 16:20:11 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.9031.021; Sun, 17 Aug 2025
 16:20:10 +0000
Date: Sun, 17 Aug 2025 12:20:05 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <zhaoguohan@kylinos.cn>
CC: <lucas.demarchi@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <riana.tauro@intel.com>, "open list:INTEL DRM XE
 DRIVER (Lunar Lake and newer)" <intel-xe@lists.freedesktop.org>, "open
 list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm/xe/hwmon: Return early on power limit read failure
Message-ID: <aKIBNeuupayX6awq@intel.com>
References: <20250815063623.18162-1-zhaoguohan@kylinos.cn>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250815063623.18162-1-zhaoguohan@kylinos.cn>
X-ClientProxiedBy: SJ0PR03CA0197.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::22) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|MW6PR11MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 131473bc-3cfd-44fa-7cdf-08dddda9f044
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/0AG+Ca45WPaNIr5Zj5Rq6KrEuU9yIpXWz7j1ch18tuJWwg3RM+/n+UfXds/?=
 =?us-ascii?Q?X0cm7/9lj1hPye+zYn9urk2AIYz1arWEw34jrnfAsi/q5glHMKYDSQ82dNpi?=
 =?us-ascii?Q?KtXOZqjsqLSQjUa51c5OrBxDZxxGrJGNGOhcMfQMO41/YMBIVciljtMoJLFo?=
 =?us-ascii?Q?Izk3Tp4lN7V0JaEC9yunH1KgfOPqf1q/miFi3iyjenpewtxDehBSMc8rX5fN?=
 =?us-ascii?Q?HVm0yXYyeARbpRXs+1osbwQMENqalewnYnOJQHgGgTmq6F2W132mHs5cGVp3?=
 =?us-ascii?Q?ulq56F+Fyh1r6UWUdIhjhZrCjFfxeY8IZJoPzeWaD4C5c8z0sXGLxhtkVNbr?=
 =?us-ascii?Q?2NcgTp1rbHtX0WlG3Ie+3SocdlUBwVTc06gY12zgfOikOTcRlZs2ZgZNseM2?=
 =?us-ascii?Q?Z5uvY473pyHKCp4d+6KYf4yxNDF0US8muE5Wuo73xJ8z8ApR3M8kCMQCTCIQ?=
 =?us-ascii?Q?btV8+HFE91p3taNLIf/6c50+j9kaYrlBA1pBBIP1CV8HYElTotz4iskSyB1B?=
 =?us-ascii?Q?iucE2tDE5itptw+pMLDc4kZ1SaTZUbNAuRYuvm1mGuZrMbCTGcIQMKJu18LL?=
 =?us-ascii?Q?nTFMApos0234lczGTQdx5bf2cgf9etrHCn9hHDagRIknm9S5n2ci302bCoja?=
 =?us-ascii?Q?vnFsEPDN9WjJufw5G+nfTbpcH5/xgkhuCNdefMOtmql4+f7S9H6przgZepP7?=
 =?us-ascii?Q?/fk5q3eaqJJaejgK4omGGOa0qFsEGrY6/s7sWOaIi+me04/dtveR3Spa1dbz?=
 =?us-ascii?Q?Rm7KtC/N611IyBukp/Q5BhMf59xUeh+fsANi2g0/5WN+4fGHcbioK/pQ0Iev?=
 =?us-ascii?Q?7xWU6yYmThllEcNl0EJY5vB+U9i5CFablvWhrBVs2vfxCANTq6VoDOJ81DCk?=
 =?us-ascii?Q?2aK6s/Lp7XkKKYoyfHWqVWyNC5wjlIrizmK2fVDPd6NJcTYOJib+27Bjmgkq?=
 =?us-ascii?Q?HSNhRPwS75wEXIb43LMElBMVP3WtCgR4caRtupVis9txDQnS0z85TLATFiFm?=
 =?us-ascii?Q?GU9lNCh4ih75yL0Bgij9xLM66GsXAAk6YtXNk/e0ipDvIqIRumh0xX2ATBmA?=
 =?us-ascii?Q?n4AfjbMzqjbtVRzwtX71uq4xfht6o5iRAAs4Jd3dhPTyLrt5KNRO09qP4mKa?=
 =?us-ascii?Q?+lrinVeiPdWPZkxFV9hPek6sfHchNOtHmhYHwaaSXL69TFws6cAwkFg/maCB?=
 =?us-ascii?Q?+R01aKZasUJ/rOD+OTjlzuUT8T+trWRux8xI9Vib7KRy6EQgYKduz9WGGK0b?=
 =?us-ascii?Q?No6qPtNGVHtvR+pxLtQdcBBwrP/sq+d8DiLgmquVUHme/nRPHDZjARpXdcS8?=
 =?us-ascii?Q?W/Mh+qkL5A3bb4uwQ58FPTCIBELQJy1o52zOrBiA6FF3fE6REb4exZnIi2Yd?=
 =?us-ascii?Q?bym6741Ucl1ktAGmLLa03DkiYbX7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+ozU1i92VxJ3pOaYbMglPin2AuI2R3GEctO0yyfBeuyEspdDcRNZl3ER3gsc?=
 =?us-ascii?Q?0eGeCD/V8+VfBPBS/MkcSPXssqdkyPlnq3oHvxxPnpAyIyDG5+uo1D4siI5m?=
 =?us-ascii?Q?fRmhIVeMaJppoJIrdtpXrJc+IPq0SmNxYyGc0zrGqlc1kdeWHzww+sLRSbfw?=
 =?us-ascii?Q?0tmUELS5vLSusU1KML9hmfKWlB30urDDABDlS7PnWlAbPDSbI4/XxK8vdS0y?=
 =?us-ascii?Q?WKo5XkH3qFnDTtgjBw05zJaS25zX6IfSQbVlTUtTEpB/DV95csYVwJufyRgx?=
 =?us-ascii?Q?uc9fNxNIvqFE40YD9BkXIJD9pibSc3mhFDLXc/c1aqJu1pk8Qm0nyjzTv+qM?=
 =?us-ascii?Q?+SeUSkXV9YIOcBCGTzYSYCjLcacgn/OpNiNgblao55DeFg07xIJkCimFlyWn?=
 =?us-ascii?Q?dmS1q+LOnglEg9o8pbEQXL5I8nb6EQU2haHB8qiN3WPBflcbekuL/ATtw+dr?=
 =?us-ascii?Q?Dm4DRnQku4Wu2W/B3wjmgdN2ols8QpNUMtLK4n2ONP8qnwwBT91s8QuXAJz3?=
 =?us-ascii?Q?2vXUk7BfXxPI1MEGUs5DCvA+vvV31c6h7EvdwRsP7zS4+3sswcqoSdhQD5nE?=
 =?us-ascii?Q?vr8n5VZbjU2jxu+Z/1mk/iqSjveQo5rz/tESCdr6mtGZV8stEINE8haP1tBj?=
 =?us-ascii?Q?v6x6o2jm8fFqcAXTbL8NWiudf7Hz+l8g/lnndl51O5FlIr2d65Epu+K3gcHg?=
 =?us-ascii?Q?tewg+EJZrdPTF+JvAmIBCQeK4KZaI60WgKu11bEblScexuo48U7reXwkOnHs?=
 =?us-ascii?Q?7ZlNKQ+KYwab7svF8ZThINgAh1q4nuJ9KN5i58cFoP4YxPqCfMZHtwmxN2sE?=
 =?us-ascii?Q?COocm8Y0c/+xqMncUVkAhkG9Jfq4p9z261536MfFg49C7kCammz5VWE2g+wo?=
 =?us-ascii?Q?CJafxxGyF941ZfeA/au7Vu61kWg64OccA90fN4Ba2W3L2qv/9sZfBmCM73EH?=
 =?us-ascii?Q?wulwr2ZK0vf3O15DI+iWvFdLHUHLOHd6bdVzgZaiBNrWoZvCFgWVH9LlqxHV?=
 =?us-ascii?Q?/zkdbp6vVNIx0ifnTspYF6QXsTZC/Om/VXsgeu2iUE4DHhYAooCQEtfy/scL?=
 =?us-ascii?Q?//A25qEYRgyB2+/ifx4NVLFLvpk2S3Q+YMBHkclOuir8JYiOnV6IxNgkx7xP?=
 =?us-ascii?Q?I9StLvfVpiQLWTLgmslS3izIUaN9cP0kY5EviqbMwnT06zMskWG3JC4TNSIc?=
 =?us-ascii?Q?pXx3/s+PxQcmUASXYK9onBgZOjzQjvg/tIxcvqbU2euXMD2hTMxQ4/Rc/gQ2?=
 =?us-ascii?Q?KnXF9VN9/xquz/s4jyrhrDr6QGhKOotrqbBGIT2XgeZJkfHjw2oJHssqQomS?=
 =?us-ascii?Q?6FjCxgdybPAAMn9THBLojUF2PZFTYAodsPsDQ5e72JhcLfPI+Suygo5pu2cJ?=
 =?us-ascii?Q?cUK9dX74lTn/iH1vGrl3MiohFX8xXIxjuLG82YmMi12Ul38qGvKtceA7s0eP?=
 =?us-ascii?Q?RC1SHGRpwL9Dz9OjowJ9YCYptj4Yjn03NZDV0msyoFitEDjghLWZGc+LdO4g?=
 =?us-ascii?Q?bKIiKeaoqDj55Rr+UZDvRWJaobfAYDLGAsF0cPWnXGJ5ZaYa7OG+PJhGmdjI?=
 =?us-ascii?Q?IZu3w7JYNFBrtzHwH7nbnQwLW3CHuCXXQdKaCsEp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 131473bc-3cfd-44fa-7cdf-08dddda9f044
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2025 16:20:10.9209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nsrgwtXNs5S3zk2079j5rnabGbHzBdymBhqXxAPGlBiXuFY0xj2tKAp+1Xx4bqEe0PgeARYrUpZItILLKykc2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8412
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

On Fri, Aug 15, 2025 at 02:36:23PM +0800, zhaoguohan@kylinos.cn wrote:
> From: GuoHan Zhao <zhaoguohan@kylinos.cn>
> 
> In xe_hwmon_pcode_rmw_power_limit(), when xe_pcode_read() fails,
> the function logs the error but continues to execute the subsequent
> logic. This can result in undefined behavior as the values val0 and
> val1 may contain invalid data.
> 
> Fix this by adding an early return after logging the read failure,
> ensuring that we don't proceed with potentially corrupted data.
> 
> Fixes: 8aa7306631f0 ("drm/xe/hwmon: Fix xe_hwmon_power_max_write")
> 
> V2:
> - Change 'drm_dbg' to 'drm_err'
> - Added the Fixes tag in commit message

There are still missed/unanswered questions/concerns in the original review:

https://lore.kernel.org/intel-xe/aJtG0xmBBgwnTANg@intel.com

Please ensure to address all of them before re-iterating the patch.

Thanks,
Rodrigo.

> 
> Signed-off-by: GuoHan Zhao <zhaoguohan@kylinos.cn>
> ---
>  drivers/gpu/drm/xe/xe_hwmon.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index f08fc4377d25..8e29fa155d7e 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -190,9 +190,11 @@ static int xe_hwmon_pcode_rmw_power_limit(const struct xe_hwmon *hwmon, u32 attr
>  						  READ_PL_FROM_PCODE : READ_PL_FROM_FW),
>  						  &val0, &val1);
>  
> -	if (ret)
> -		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
> +	if (ret) {
> +		drm_err(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>  			channel, val0, val1, ret);
> +		return ret;
> +	}
>  
>  	if (attr == PL1_HWMON_ATTR)
>  		val0 = (val0 & ~clr) | set;
> -- 
> 2.43.0
> 
