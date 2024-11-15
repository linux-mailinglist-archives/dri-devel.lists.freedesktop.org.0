Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4607D9CF5C4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 21:21:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8732010E3CC;
	Fri, 15 Nov 2024 20:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U0Gp65NW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE2F010E3CC;
 Fri, 15 Nov 2024 20:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731702066; x=1763238066;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=edYvEggoOmsYnxNnfuWkuV1vS4Hq5g7Jv2unyHWsOx4=;
 b=U0Gp65NWeLoErBxiyKduqw5t8GkJOpKRXXOXHt5z5tb4yjdG79/WZh5u
 +DTeTxBZkuI1PUTCLuGU9v3PBYNd7jREW2hJ1g9j/iKhREThsl0ZzAfRC
 0VvrtEB9xiPMi8GWrNS10Kd0uRnbIxpYBk7xYd4P8PKu0A4SYEQ2vwlJz
 lan4ad3Yi61in0pOi2AynxR7vr30cx7MmQoG3DyHji69Wn4H2q/sGjx5a
 2o5HhbWg6QJr8fDWx27COQ6iiUOMWRgppwRPKJzcUb1FyQPkebVKDBU7o
 C7z/xDD0s5quVQ6KTDReFD5HRXchzucaxcjwVD2gNA+Zq1UUYnruR2I+1 Q==;
X-CSE-ConnectionGUID: CLDNyCBcQZScf243Rn6wxg==
X-CSE-MsgGUID: qeIp+DbAQN+p8goxZV8Ryw==
X-IronPort-AV: E=McAfee;i="6700,10204,11257"; a="42803669"
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="42803669"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2024 12:21:06 -0800
X-CSE-ConnectionGUID: kpJdJ/IZSg6EL1tMzrOxJA==
X-CSE-MsgGUID: Nj1i1s2GQx2k7DGl0WUvhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,157,1728975600"; d="scan'208";a="119597883"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Nov 2024 12:21:05 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 15 Nov 2024 12:21:04 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 15 Nov 2024 12:21:04 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 15 Nov 2024 12:21:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmdFVW2SFYOpmyTxsj/B0KBhSfUgcuLNDBBMVsWTPG2PkRwB9uK8J1zAyJq/A7VFkNi3UcVfapKc2uJMe6R8LW0nXF6vuLgYbE95LPq316RcQeiiMVDYatzQ4v1KAsE+uBFURz/E/nHrbNLkokbHXcrxR1iULVueVwgxio+LnchVokNrgWV/tdZbnms6Fi3BwAPDehFT4x+6kKToGUXxJDm+31njBjfsI966c2xq9B/oCfzUF5IGHiCt1878C6/ca8bolI/EpmBjLKnRK/20KKXjFk5hm90e2DjTIlX9t74AEJGjgoTupuefc33bCydxsBkQkZ/MM04YcY6BZDbuRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QvBtjWJKuwG0YUVkRHgOb2i6so7SJDN9kg59a50+8AU=;
 b=X8Y6PwcrYM5KLAIIzGGKRNftvhD3Y8U7/GTpF2uY1+emaCtc7gsmCrNi320Mfl1Zp6/V0NkqoTCjJ5IPJ60N08kwPjXYplv8kgE+mt+9nu4X58zshCEA9zHFttEwLj+1XIMY1lO/nC6B8wdtkHP/9L2ZbuOkF4jE3+PE/CS7qN6/bZIkAUr3PTP0r14x08N2UuCVMUpBKmU9wIMDlkMgAzQGEQ8Q4hrDOHahAgIOPaI+EdC2n/hCXW4PhQPyGeOYf9i73zIfhg0YGgzYScOqgIS3p/x5dNQHdgYY5LsZjCY+CkhA2JVk0ZA5DxUfu7tfzQj514gbXdcr3qkAAKATmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB4863.namprd11.prod.outlook.com (2603:10b6:a03:2ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.19; Fri, 15 Nov
 2024 20:21:01 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Fri, 15 Nov 2024
 20:21:01 +0000
Date: Fri, 15 Nov 2024 15:20:58 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Imre Deak <imre.deak@intel.com>
CC: <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 "Jani Nikula" <jani.nikula@intel.com>
Subject: Re: [PATCH 1/4] drm/i915/dp_mst: Fix connector initialization in
 intel_dp_add_mst_connector()
Message-ID: <ZzetKr-rApPqmehO@intel.com>
References: <20241115164159.1081675-1-imre.deak@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241115164159.1081675-1-imre.deak@intel.com>
X-ClientProxiedBy: MW4PR04CA0372.namprd04.prod.outlook.com
 (2603:10b6:303:81::17) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB4863:EE_
X-MS-Office365-Filtering-Correlation-Id: 121f259a-6460-483e-dafd-08dd05b305cb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a/fA+qd3oHejulI0FYJjJ5Q7oSNBArJbbijcSnNp8B/fmCtCQOj4WO48WJZ4?=
 =?us-ascii?Q?vKMzAE6wULkKeCpfKJyuOYf9QASeil3LBup4H2bRjJj4W9Tyuu3s8+Kx9BlU?=
 =?us-ascii?Q?XsB4quvlX9ullINw9H/MynSwWVTqZouLVHtYz9FxP0itrCzh9TegfkPIKQ2i?=
 =?us-ascii?Q?S9BAp98mboaoIa58HSs1i3LUehf1GUBE/8H8JEnPd6tgyhPxso/V4D7SGGxQ?=
 =?us-ascii?Q?UMcYZaAnCfC70pmOqkEeSkB7pawA1O7i+hYb0gJFrjSY1jXGjiGFtrKFO37b?=
 =?us-ascii?Q?Vai8RY6kIS6jK0O33SESGbizq4sCH6x8FrnYeU0VUblvkjxRmOu1oZO8dDsd?=
 =?us-ascii?Q?8E50xU1Vxizhj7KZSF3FT1p/oVjxzMV+f1/9KztJrgLd52tQnwF8h+BTHA/n?=
 =?us-ascii?Q?0iBbTjE+7rVCxzbhfnWvJKugLMZeVBMRM2GJc2tB3wXu3ZyHpio2p+il1urL?=
 =?us-ascii?Q?2WxI0QtxRvQhP7P9R50TwvllEcNeuqiaEptDO/oyi9LNrleXv32ClC94Tb+y?=
 =?us-ascii?Q?7LvF59+E9Vn5ofvJXYJ9od5V+Z5HEd6Qj1439wh1kgsP0+qK3otodcFLn9Dn?=
 =?us-ascii?Q?30VQNSFr5TlyTNdhZtJXbdgiNcBwlBqZTrZDTb1JvyM4KUJNY5PTk3tUTEc4?=
 =?us-ascii?Q?qpa/aZsmfV01uWYleNI4EQKUP0mo7BaFrQBtja/YMRyewEnhL/ldxA8zfl2L?=
 =?us-ascii?Q?Jy1GUTZKNwDVhVTxq193EBWJBttN3QOwTo6SbKwzJbE/UMux/e+cjqF/6FPM?=
 =?us-ascii?Q?OEsN0ojBgBBVTJxVpyB6/EDMfD04CxXxWg76fsCaEbu4vpaXArL3NlRRgugp?=
 =?us-ascii?Q?OOOaqua3Kea9QWcJFrEorFjgq5g6W5V14no2L7Gwxb4FNQwjGWN51J992GND?=
 =?us-ascii?Q?l3amNdIs7QdYpXwoo/hPJiefEk3689gT8VVsI3CwjsKGwpWngQJPm1s/Cvgp?=
 =?us-ascii?Q?bVH+sTriA6fc5bGewo9t04pRmMxO03Mkw/5n5Zeu51Sg9eTvSpsBJNBy5Mzd?=
 =?us-ascii?Q?k4aoFFUyOYR316PPec7gcv1l/Sli+rTyT5w9Lrjqj4JBtR9R2XtpLkBnhrAM?=
 =?us-ascii?Q?NatthDB8x5sCiZc4w6ivqz5ElBbuamiWSSALr119K12gJgxxy8B3OKTbaGAX?=
 =?us-ascii?Q?eJDZKdio8TTSRyFMi1eKDFL4HNXeNViGws8Wc2iRKKeX9xsDN3KsJkS3Sj4O?=
 =?us-ascii?Q?hzSoSr1uUzSDqvnO9i9V6gwJ8BEIgC+k7ZYlu+4wj/A4Ovq9XOCtKOiBSGkk?=
 =?us-ascii?Q?+xKTtsoJp64GWEC17Jqg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZwWup0h7BfIuVXfM3mtyvbwhitWjM6cKr9ygltZo9k1CeB4HDuaBpeRviMVM?=
 =?us-ascii?Q?lCD/aNfiJrE7no6/XdW/wN55vaJw8PoeCLmKs8jbzL8tHxAnfBjfEX2YdZxN?=
 =?us-ascii?Q?xTzeqY56Yy7Q0NxHZlis8pkHRDCUzikrjTuKVSlHXMKw7ZEPxJUEuHQscQhd?=
 =?us-ascii?Q?cFLCog64MHkk3tIsz8qX3TdT4pv31PzFY966FwxlB7Qv0vWQDVE1/0bygW37?=
 =?us-ascii?Q?5TpDergD9QCy9CwzTYvC4/SveqbztErsFqEXLF+nJuPUqptABF+fLkath5I6?=
 =?us-ascii?Q?E+iM3JORQ9VlO2DHNQ2H9PiIw2ipHdikqo1TzsExmddU3C2Pf6IiKBOBh6Ho?=
 =?us-ascii?Q?Woje+wwwqzu1GRSmlHYFh11vBmAhQ5csRiMAERYC/O/Mf/xkkgKIHiyqiv17?=
 =?us-ascii?Q?MMKq8rBDkQYou1seNV7f1KYlkaJYg97CgtzomHfiFDYvgGc4vOpsP/th1T1m?=
 =?us-ascii?Q?DHI1Z4I+g3UGKcONx3r1YgjCTvKMTrDBC0YgBpOdfwjTdDLYXMFC1QsZrWTT?=
 =?us-ascii?Q?vs15/3nGgUuuwIF4XnnKZFMsdXmwhFrRgJiy7njM5az99kFjCYP0xo9mR1yz?=
 =?us-ascii?Q?LMZT3D5xPD+AV/eATIbONAJlQZdEC+NY45QcYs4a/vvtKRHOyHlqf57ur8VC?=
 =?us-ascii?Q?R+Wt3NwKl1+/FP3E1OhEnyPtzk9j/pD4IpTV/P6oKbkWW8rZQj+K2qV5uGDW?=
 =?us-ascii?Q?ftHoaUH8Diojl32+seGuftzsEU+bt2esr7Rik0GxlkZ2l+gZrj0S+z8bnttQ?=
 =?us-ascii?Q?CEwBW6sj7PmYPgWXyif0/YFDUmvZZB0lw36Jjglm1ZF24IiDgH0kELyCUOfy?=
 =?us-ascii?Q?ErLBYu4RvXxHnsnNzF9kxUbh8FGVzPFCLB+eGFV2ZwGe6Mef4FXLtZFoZ5tk?=
 =?us-ascii?Q?8gvNU1azZWbixqWKk7bq60utYpGADyeBOn1xRWnxE79yxIkT/G3nfbNe2Ies?=
 =?us-ascii?Q?njEOyUPmpXyliwKRzpjPd+eMbvs6WZPRv6wjiAuO7Drn8SKuFRYAaJwQnpfF?=
 =?us-ascii?Q?TUu+ZuauaR2U/Ez7CPLg1Kt1vgiPT1K/PBoXznPIhB2Vbu0cydsAyBDWoqUQ?=
 =?us-ascii?Q?prBT+TpaXUi+Ym1+d9+lRcaMEJ7ezPEQyktbOfrGrXgiRDeeHJGVMrrcG9R5?=
 =?us-ascii?Q?aEh54FEa1zsApCBi6Y9m0mws20lIBn23u49eOeZkr3t94DZzLNScLeF2EF7e?=
 =?us-ascii?Q?ilAngjsWVNPoL7iA/mfWjyQkBtmF7OQOQu1Kuv1T7bTE2HzMDABnZbUt1JqC?=
 =?us-ascii?Q?9RMY0/9XJRV4bllIWzbfKkNwiWRgcjl2cd1Y0B+qCN2IHOTUKf1FTyTqhb6O?=
 =?us-ascii?Q?LgRCgKJprX4B3Jvy0F3uVL6i+mF4ALDgUHRhcPgNDzIdEZcWmg+sEOPX/J41?=
 =?us-ascii?Q?yZH7De2Nx40nv0L3Cqpgo9iDwVMluhIvy9XXOgjWPRih3QsavRwUtO0lwbfJ?=
 =?us-ascii?Q?RNZdARy3PZG/vn+UdFbW3P480CqP5JlOALTp+zjwBPPRIy0ITmPKlE+UajgJ?=
 =?us-ascii?Q?7bxPCpG/YsqMRDglGVoM1Sfu4Tjp3OyWWSane6hmmrzdOKUGFiL6Utl6cgFo?=
 =?us-ascii?Q?4IyJ258g7OpDd2Ts4sDN1TsS57OzTfX4Q4bVN6z0v7QpXVc7WU9mAAYNXGZb?=
 =?us-ascii?Q?6w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 121f259a-6460-483e-dafd-08dd05b305cb
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2024 20:21:01.3413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fjeYZ4R51yxmjOeRkb2acEac0ksWmDKfQMEvhqc/DhQf9gnUFoNi4u1+kjLCmtXSaOYNzeepLOhUDfi4F2dK0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4863
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

On Fri, Nov 15, 2024 at 06:41:56PM +0200, Imre Deak wrote:
> The connector initialization in intel_dp_add_mst_connector() depends on
> the device pointer in connector to be valid, at least by connector
> debug printing. The device pointer is initialized by drm_connector_init(),
> however that function also exposes the connector to in-kernel users,
> which can't be done before the connector is fully initialized. For now
> make sure the device pointer is valid before it's used, until a
> follow-up change moving this to DRM core.
> 
> This issue was revealed by the commit in the Fixes: line below, before
> which the above debug printing checked and handled a NULL device pointer
> gracefully in DRM core.
> 
> Cc: Jani Nikula <jani.nikula@intel.com>
> Fixes: 529798bd786a ("drm/i915/mst: convert to struct intel_display")

This is awkward. This patch actually removes callers of base.dev.
I don't see how that it could be causing this new null dereference.

> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12799

But well, trusting more the tests then my eyes, let's move forward.

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dp_mst.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> index df7edcfe885b6..f058360a26413 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -1727,6 +1727,16 @@ static struct drm_connector *intel_dp_add_mst_connector(struct drm_dp_mst_topolo
>  
>  	intel_dp_init_modeset_retry_work(intel_connector);
>  
> +	/*
> +	 * TODO: The following drm_connector specific initialization belongs
> +	 * to DRM core, however it happens atm too late in
> +	 * drm_connector_init(). That function will also expose the connector
> +	 * to in-kernel users, so it can't be called until the connector is
> +	 * sufficiently initialized; init the device pointer used by the
> +	 * following DSC setup, until a fix moving this to DRM core.
> +	 */
> +	intel_connector->base.dev = mgr->dev;
> +
>  	intel_connector->dp.dsc_decompression_aux = drm_dp_mst_dsc_aux_for_port(port);
>  	intel_dp_mst_read_decompression_port_dsc_caps(intel_dp, intel_connector);
>  	intel_connector->dp.dsc_hblank_expansion_quirk =
> -- 
> 2.44.2
> 
