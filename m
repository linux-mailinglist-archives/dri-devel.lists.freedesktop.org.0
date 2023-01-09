Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAE066344B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 23:49:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4137910E0C1;
	Mon,  9 Jan 2023 22:49:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C023E10E0A2;
 Mon,  9 Jan 2023 22:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673304565; x=1704840565;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=mH5DvHX1Az3x9AJjHJMxKV2nwxEtL5cjb8VBdLVxKmM=;
 b=NQvVkzpk+rYk/AeDi2BLz7YszbLdEYUvOLdb4jHJv1LmkkqdN4N1ub2C
 lCeJ0/Fe/TJ5kHoAtaEEvo8sDbntfjzi1V2KboADsIRZPM5H38Ys6ocef
 gONK0ec8tWBpD85tTVas2kH0ad521osLmYtjflnHgaZ1UP1X4bkY8r3ad
 TgdHlQzeAe0odnj8xID3i80CI0wOj3VLQM1Z4PFF1U57t7TPKwnzY0ZI1
 YidxDmiM0DuwN2tWPlMy8mtmQVxNrc45KvjwWYXSsrbPk3H9/cmDWOQQ7
 BCXcJ8XQsBbZY5oWA05xKgFpdpUEPew/Yap0OpfWvT2no04qKyWB7k805 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="385310792"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; d="scan'208";a="385310792"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2023 14:48:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="656826811"
X-IronPort-AV: E=Sophos;i="5.96,313,1665471600"; d="scan'208";a="656826811"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP; 09 Jan 2023 14:48:38 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 14:48:37 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Mon, 9 Jan 2023 14:48:37 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Mon, 9 Jan 2023 14:48:37 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Mon, 9 Jan 2023 14:48:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HuF3C0EShGvptEwPw0zv/CAWgtrD/XAN/Bh/+wcg+b1V5FjZGlOQt7++cdeVdxqP/8isEETGyyA53ZCyDLZu/M6UOwoKhQPAKyYZKCDZsrgfZHXEVZb0qnOP8EGCdaq+NOkpsivah44EACBrix1XMbR0eWPfl0qZ7HBwuTABXG+oRmHxeGsZyf2KDmklF+qNC8W+VxJ1V202nYUqDzu2X8MRekncJIK0u35HskBlyNzpCcWwB9oJR9jDO04wIWhpZsnjITsMivnYiGld6B7m0i1y2TKtQfaQLH7CoYBeed+PgNcbfyNt6YhFKiAx8wKSe0u0gHONyga304Be5x8cJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CF5uzEJY78P8/sXZ6jCKiYkmvdAQJrSYEss9XzOSdpY=;
 b=S3HB3dRt0cX7FBUVCRnvieh20jnCnj0LHMCjj4Ecg3CZnrYQc9yEEXXohOjlFVt7yJCK4uPtDi+LPJYeg66qEO0Gw6Nz1aRSwkVQwRc/U9hVLwbkrQWTQWCTkKN0G+IHWwHUxRZy1XBNiGOvDOkZqKfA2W5845s+H0uZmfNyY0aHLyYmARWn7ugw19aeIwJ9g3yfFdrhaoJZDTOCu1M+d90Em7TSTkZ6pdZ5twAPIXoUvwTLsx/z4yixK2lqU2amDC3p50ondsNFqCkfj77k0fh4bZNeqVk5qENWdB6IwZpSclnU55UbXTGfHd/tkRaXkJyNB/OuP1KKOLfcejVZog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 SN7PR11MB6703.namprd11.prod.outlook.com (2603:10b6:806:268::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Mon, 9 Jan
 2023 22:48:35 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::68d0:f8e0:eaf3:982e%9]) with mapi id 15.20.5986.018; Mon, 9 Jan 2023
 22:48:35 +0000
Date: Mon, 9 Jan 2023 14:48:32 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915: Do not cover all future platforms in TLB
 invalidation
Message-ID: <Y7yZwF3aCkh7uOP7@mdroper-desk1.amr.corp.intel.com>
References: <20230106103835.640924-1-tvrtko.ursulin@linux.intel.com>
 <20230109122442.713861-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230109122442.713861-1-tvrtko.ursulin@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0046.namprd02.prod.outlook.com
 (2603:10b6:a03:54::23) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|SN7PR11MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe23a14-7ebb-4f7e-c3d8-08daf293a401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3dmVnjTBJjQ8TTHBbktrjm8wagdOHFxlSUNBvZI3oQ00YWTzwYImeLCp8oM+khSjzZPm88yCx3Y4N4HoMXRzRGn/PMWjWkJJG9LileLUIJJrho2reT10Gz1vi2nHEKqX/qPjraP1DYi6qZUqoxZNNXOmKYGRgcYXSx4Ik/2OKjg63QKOeuevvOiRHiF4pZRG3mghFgmcT/NPYKfGScnVdI7hE94PVGkbVky2QFPxyTSMVyaGXaLCMpjliVZMn0EwjRMQx0NotUek5lFIny31H/54gYTMoR0GDngzsOA0dn4YVUKtQ76iD7u4NsqOl/SDhlXvKINTIuY0L42unBU6YLDfImUVJKyoiStLeMePU2ozv8/Sorzs3jwx5tuam8q7imRE0zM5FqT3o7Jhp49kLLWFthL8QEoUxkw4MEBU8kDEGtCjtqugtwiY4yLMIzf/+fxtWVDiDf8Ams1o9N+sajHXb3bRvlbbrv5UFlH80vn/79eeUi0hxENGtmG5AMNzajfuAVQxKcC+G58aXni7IuW9P6h/SDK2tE0wcOvIALUduUT8cu2y91PTklfvDcIpfgMFyCIMaHx9ZH2L6c3jG0dc4VxDWBMwxGNeoHKfpZHU57GlWnoFqzYBrMEFNPGUaNXL44tTsR1jfi3CRFBehQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(376002)(136003)(39860400002)(396003)(366004)(346002)(451199015)(8676002)(6916009)(316002)(66946007)(66476007)(66556008)(4326008)(54906003)(2906002)(5660300002)(8936002)(41300700001)(186003)(83380400001)(6666004)(82960400001)(6506007)(6486002)(478600001)(38100700002)(26005)(6512007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Q5b3v/GX8dkgfyDIX41zmEUqtY2aCBrU+4BDqPUEgV2mEXVyI1DCXJG+LtbB?=
 =?us-ascii?Q?lOZFxdmPqO86+i3ixM2ViX7b+e7uqujh44Mhw6tePvaWoZoGWteyi+HXWD7G?=
 =?us-ascii?Q?/1/bxyy7gLJqMvjJt+wdJCQu+lREZLv3ud45Bk/BuX8BK5XRfr6alndv9XR4?=
 =?us-ascii?Q?sqIvxepIKIelOCRmhWkvvvtId9yj9x6cFS/wsAw3pPqL5V8/KBXck+Xj3lNq?=
 =?us-ascii?Q?m1Dv+c1jztInFY7p74jVuki8IL7WT9K4R7IU439jt0C+6XYtkmYFvj51NltT?=
 =?us-ascii?Q?RnYH+n4ze+5Sxubi9vl0g7AGViA/I2lpjUs7S9RSsohNQ3bUp9eoQ1RwDpQ5?=
 =?us-ascii?Q?rTl8gYfWzhuh1JeFnyWDuE/EzL3ftbYKy1U4786So9ubeWUreduZfXwtba4j?=
 =?us-ascii?Q?h8x5ySS4ovGVENArTOIxUPqCqeiaTmD6sKDtNndcBBg1v7XRSkPGYwFiidOM?=
 =?us-ascii?Q?adr3tDmqGaj/1JQbg+R+hL6nhH6AJsGk7pP3JkgZsCHXNmHdtyIzGH0Sil9W?=
 =?us-ascii?Q?nKokgOJPh8AUqb4jCs690DDFAaaiBRLtvvertzqFhurhQXloI0KRDjqUl1L7?=
 =?us-ascii?Q?TcahW0bdeaY9p4DDyzfNA3eegDRgJa88wuCgmfkmC0nLK7xAjn45dh/9bsak?=
 =?us-ascii?Q?Eck2b5+PEH8rTMUrD516b4E69rBZPlXHeY+KJlNhbHMJN9bACih2PlgAzTzy?=
 =?us-ascii?Q?6kwdP7L5zifgOTSXkbOGbkAAdWEiQoJua1FURiWMATd/tZBZmpDGElRyuSUR?=
 =?us-ascii?Q?/M7criC5CElTVrLBaNFR2lI7MnED/9nDuXVcP/k0x3gNk7lSdQw8IgtKu9je?=
 =?us-ascii?Q?LbFEvqfXSskrXuJdjZ7gv30ow7wpstFsDjqe0Gfp3U32e4v6+90eIQJoA9ud?=
 =?us-ascii?Q?eEroc8H1pJ7Hd0PCfKD1kM+oRiMipEiQdqpwvKDyvXr+haklxrYw9xq5MauM?=
 =?us-ascii?Q?+BTpvW1AKFXmnkJWo8ZFvP9kXF6Gwu7zsghT8qeAg4BhmMlkbtcFESmSe/vG?=
 =?us-ascii?Q?99AHPLj9GrnbtN7V4fb5T4nbMnyBDwiH5M4xWhCaDGouutnV/0Usuizw695P?=
 =?us-ascii?Q?xt9jLsjkiPLOg/ifGkmizLe6k9nk+OR1L1NTCbEy4ezIaEF+emlat46yXrZ4?=
 =?us-ascii?Q?qe1BWj9WuUbQmJ/sLzE2JF1ditcBbmYVSM9ZQ2ukRo6Q41OFvI1cq2hnxFgC?=
 =?us-ascii?Q?dUmOrciN0X4hcYyIyJl+j21uj2enGpUyZauw001hmlJ3DS4xKTP5Y1C/hOel?=
 =?us-ascii?Q?eyBRZJaH0JaZsKAh5Ob/T+GtqwF1U0DIO3JTRxA4j2sE7a8BADgFmezoSRtb?=
 =?us-ascii?Q?85GwYLk6eqWZEf7kSB66IHWxnj+GKwUNlrmNcOWcUFV0Y+kGulgLoAfTGV9d?=
 =?us-ascii?Q?7f6PZ0WYZ3Q7o7eAotKB/kP6F8AaCWqAJVOV6JhO8kVdHy8+JEyNvUur1TWu?=
 =?us-ascii?Q?ACyqJ+Zjrjxkd41MeIGARA0ZrIuD6SVwgvqZMvmkFjlZijH0TL7dh994h1jJ?=
 =?us-ascii?Q?eQOnYbK8n5Rwpx0CLgtVPQbUO7GDFI/yQRnLCKsbvHjkxCxp3Ygw3yF8beAH?=
 =?us-ascii?Q?XaeMyVs25LSCyQdN/0QVIbfMYi4l4/9/ofj2L5NlCI5/o6qJjaxVvjTPzwKb?=
 =?us-ascii?Q?vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebe23a14-7ebb-4f7e-c3d8-08daf293a401
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2023 22:48:35.2977 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1tDLBbgWkaAqoNtksx/rulWFdkhbSabO65J3yVH9sCbcvq4UfoqISvSs3hYMdKHD5RlV0tyXeQE1LlJxKLBLbDlP9OjL8bNNcm9gXe1Edoc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6703
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Intel-gfx@lists.freedesktop.org,
 Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 dri-devel@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 09, 2023 at 12:24:42PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Revert to the original explicit approach and document the reasoning
> behind it.
> 
> v2:
>  * DG2 needs to be covered too. (Matt)
> 
> v3:
>  * Full version check for Gen12 to avoid catching all future platforms.
>    (Matt)
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v1

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/intel_gt.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 7eeee5a7cb33..5521fa057aab 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -1070,10 +1070,23 @@ static void mmio_invalidate_full(struct intel_gt *gt)
>  	unsigned int num = 0;
>  	unsigned long flags;
>  
> -	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50)) {
> +	/*
> +	 * New platforms should not be added with catch-all-newer (>=)
> +	 * condition so that any later platform added triggers the below warning
> +	 * and in turn mandates a human cross-check of whether the invalidation
> +	 * flows have compatible semantics.
> +	 *
> +	 * For instance with the 11.00 -> 12.00 transition three out of five
> +	 * respective engine registers were moved to masked type. Then after the
> +	 * 12.00 -> 12.50 transition multi cast handling is required too.
> +	 */
> +
> +	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50) &&
> +	    GRAPHICS_VER_FULL(i915) <= IP_VER(12, 55)) {
>  		regs = NULL;
>  		num = ARRAY_SIZE(xehp_regs);
> -	} else if (GRAPHICS_VER(i915) == 12) {
> +	} else if (GRAPHICS_VER_FULL(i915) == IP_VER(12, 0) ||
> +		   GRAPHICS_VER_FULL(i915) == IP_VER(12, 10)) {
>  		regs = gen12_regs;
>  		num = ARRAY_SIZE(gen12_regs);
>  	} else if (GRAPHICS_VER(i915) >= 8 && GRAPHICS_VER(i915) <= 11) {
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
