Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2CD756D86
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 21:40:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6107C10E2B1;
	Mon, 17 Jul 2023 19:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113F210E2B0;
 Mon, 17 Jul 2023 19:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689622828; x=1721158828;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vCa/TqYVYkO/YXa0Ajnr0FGA2UZQ3InBeaBMraCogeE=;
 b=ahrr/+wEbuaNrg0t6eYjMKb7kxZLrTwKpxdYfZXyDtB9uqPOQOggFla/
 1wfkFfVoraDcPOTFjkgpReyLpBEJPn2fxLB7bb6/vSBTsUmjn5A7I9ARy
 OR9yFP2TATXm6AJJPUYqXiEd0XyRbmoUBoOegoTyTwVBX7v9TEMEum+o6
 iPzYpcUb8B8eLjKewjzLChdLt76vQMh2Uj9e3JBYgiozy2fcvzyoG9AEo
 p0WKZ8YE5qag/ywO1lupW5H6xAv7hJByqkv1wTLrfHXlhz9zXvH987kch
 NTLZZEmZipNMUY9y5Y4kYk8eGg8FIQPnz+tpskyIyNVA71At/5U5FMBHj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="363487826"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="363487826"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 12:40:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="969970320"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="969970320"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 17 Jul 2023 12:40:26 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 12:40:26 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 12:40:25 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 12:40:19 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 12:40:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4GGHviIYj2CQKPGroHzkejeoKBxW1PMQU3HGq2/1aZ5JzYaV2t665CiNhcDfQxy9H72l9ce2uwU40CmlUIqAQCqzuC0lHCw455ZH52s4lOrfZW20VQ9Of2XpqzYQ7oeg+okuG6E0PfewlJqNSlAdHufsrIdjIJNvAFRmI6oXg4Hs9Qn8VRZny8Xl2xWWGm1cyhCo0GqTYLvOZ2vSxnVb3P3w+GXYhGbaXtL3xz8L3rrBqmUp+6j/+SaTAcwmAua2fx+BUzMeMaK+FfueL9zGLFbAkpW7211iEZ3ypnJojtbAXz30WLr0pespNd742mh04ymPrMV3EJVVNe/WbuS3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GDoGDnvZPv/paF/7WzSRjRD9FhOMtkcmDNNEWTPUHgg=;
 b=XcDcwqkdhyC4mGcFooJqAsTh8BUoF5/B6ZnYcbdvQJt5NVG/4yglf6yGI2HrSgVsltAhRLMp0c97aUME32HNrc+G7MSIIXVA7ZmBrTKyHzezfNyuDYBB0konVI8/hV+RCxJhYKIVC1oci112RL4LI2nYuyizHS6AOAskS/2k2Xay3qao9vNxoref98SmpyRL+39nK5QYd0rA0KFvgKw/uDwZWe6sLMRix5u2nRRpXoskyM3DFMjwDmDRSlHGz73gO1/Bi3dckICNxn4kiuDZOZOyTPxti3YxQhBSV3LcSdf0QXvAo0bNm/yyIFr1JP4eeGO+KgMIxAG9aDWkJDjnZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 DM4PR11MB6432.namprd11.prod.outlook.com (2603:10b6:8:ba::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Mon, 17 Jul 2023 19:40:18 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 19:40:17 +0000
Date: Mon, 17 Jul 2023 12:40:14 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v4 4/6] drm/i915/gt: Enable the CCS_FLUSH bit in the pipe
 control
Message-ID: <20230717194014.GD138014@mdroper-desk1.amr.corp.intel.com>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-5-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230717173059.422892-5-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0099.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::40) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|DM4PR11MB6432:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1cb5de-3c40-4a89-29b6-08db86fda62d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 34HligVARCKF2q3pQJKT4o9ZLMeG7dwAuW8g73AesxHyDuMLbEgEkRBGJbfj3sEaa9acOHF+ssoxMnF/YhCjNfaHJnFffGlBIk6qU8A/0NyOqQaHoYxg0gbqNhXa8aA4S6NVgxcEkrkQ148gAwgwBhYadQNEpBm+wAvlNA90B9yksCZtDnNyBitQ3AZbayMGRORb6HtcpCqWt/06bkoqdgMaOpjB6Hxm2XbsscqYvt9ugI5BaLPNnA9AxvH4HY7e6kvd1O6KSSlLh9hRvSN6iVOyiVAEkzvNpChfiLeDMjJKJMt/DfmiVPita5HRQ5zrwps/tg0NVFUO6wTJiGG+p1xH0LKfE/Y66adZ3UEi9kF+NJUbPQ2KIzJmv92EEEvbkSo4uBxyoZKh4Y0RDU/0Rj57KtHi+W08htUeUsOi4K3gvXR10UnfISum0wCue2JU2PcnKLMeHescKhpdqHF1WS2Mep8ibO7wxKf7CdZTT8efWkzXR4tJdV7nwuVrQkA8gzj2QLVZX8hKBi5n1AKwqBD1qA3aarwgEMf2iiCJeiBFTcF4ysfjl4m5I08WM+2W
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199021)(478600001)(6486002)(6666004)(54906003)(83380400001)(86362001)(33656002)(2906002)(186003)(1076003)(6506007)(316002)(6512007)(66556008)(38100700002)(26005)(82960400001)(6916009)(41300700001)(66946007)(66476007)(4326008)(8936002)(8676002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?otzpde1uy0LWCuYbugg8ywTNiTBeMsoKOq2jSST2+Az7WkBbP1efsZxjSPau?=
 =?us-ascii?Q?+bXfoPSzdS92kJmIOWBpNlXObyKA0IeCQVag/vjgEYHpCrX8tvcOPoPSb0Tl?=
 =?us-ascii?Q?/aLtyErdAjd35Leu1cslNslIAqsH5f06bMqc2kmJbflBMkqg+qpePQjhdwwK?=
 =?us-ascii?Q?A/TZmZwQ82DxAGduxNJaayCfwxnq6bzuaaVaX7vUn9IlCh9NhP2NvL1/fd7l?=
 =?us-ascii?Q?7x/zkj0US+vX/WNUIaeKynTjD67l8/cSnvyJc8qJ3D4yE8Dfyg8Q5ta71JUJ?=
 =?us-ascii?Q?ZVuBQia+tQu5HFvYJJrgU4kwqYYtKn6M2ZR9xbZZMMgGyi1gNeYidwpU8hYu?=
 =?us-ascii?Q?/W6waWUHG8HQvA4XdYBHUwdNZWMaeVhS3HpYD9Z1ycDoYx750G4ftHFhY6Cr?=
 =?us-ascii?Q?V61VZPmOuHByFGNod5dubh9KF/AcMCn3JoaZHg/olbZEDQ8KQpMaPVgLN63W?=
 =?us-ascii?Q?95qQVO0JR8K/E1Hvx+ELOjtlBd3FGD+/CbWywhR7YmSqZYN8g7kcTUT1WnDd?=
 =?us-ascii?Q?KOvjO6ugBTqdn0k/io8N3yB7tp1ZiCPLAIS7fAVrjFb0zBz4yG3KHCXgIXnq?=
 =?us-ascii?Q?F0cvRqiGERBHmJWUl/WqHMgdvEakn2B2+wZby4A6NaV49jW4AHAPE84kCt5J?=
 =?us-ascii?Q?OZJj8A+B+TrO1MmsOAZxSu/lzu/tqRuKkTpkaz6SkRIZZd2Pq7pBByiUNgma?=
 =?us-ascii?Q?7jh5t+xh+5Yw8euML6leAQSYt5lDwp0Q7FM31U4kr3a1rkYl4zqBsGGWP17M?=
 =?us-ascii?Q?IK4i3vFpgKr7SeHVjk/8KauL3jpHQg6hbiVXlxe7a1ibksOHB58qrugMXZdA?=
 =?us-ascii?Q?wTYuB2GIvRkDOC7QPpXe1dys7G444hmSoraP6P192CLcW1zJWDoTnACJQ5uv?=
 =?us-ascii?Q?QkE+3u+gJVYWcUndqnu+H7nHOmQ/bTKjQYgowRVrksLKcxgClcdPSCKv6xyy?=
 =?us-ascii?Q?gZ6awV3XtapRox7HNdPlXQkSJTTGrFn90gryM4Wk5qIM2/u8/EeWLTnBp3Gg?=
 =?us-ascii?Q?Ax9QAo0UAvljTbPlTX2v27lUxJT0/d+2jGGrkQ2B8+BvG+MRPmDqiARnNjNN?=
 =?us-ascii?Q?7nnxy0wi2AjA5pfEJHck8UrbKR64pcpKiM4jKu+ThWuhv/fSFcYQv+7BcvAa?=
 =?us-ascii?Q?NgsEM4MHTKzZCUW4MdXw/ZlCPZygFyFYDJF47goO7QM+o1dACUUTm936I5wi?=
 =?us-ascii?Q?aJC+SbUCzygBUrHiJ2I/SUshWo1eFoCiqCDwDBWGQXcQ+pp+zNaaqW6gDDyJ?=
 =?us-ascii?Q?lDxkBLftlcZAt4MQblK6Chqqeh19vfCntxTJexPYyb4d1ybopSJFiEkuSJ7c?=
 =?us-ascii?Q?VT/0FxNPPgulJ4SgJsZq+9SJDequ8sJBdDFWauzJ9MM89LSz1hdRa3vEMFvP?=
 =?us-ascii?Q?iBtOx4cmt3ujoJKTO2npJC2t0D3uTsoo4YdrOjh+Co2N6PlZLuBQQ44sQuMn?=
 =?us-ascii?Q?4TnrxjYTzmDDEh5wfASahjnjnuZbCbJcISJrfbW6khbpZpoUYDWOlCZB7aXR?=
 =?us-ascii?Q?L5mEUIAXYk8P9rV/s2DzllGkGmjkIHZrCebDCRm4VHSOkWoulGrOzfrHCMSt?=
 =?us-ascii?Q?5/5/Jb/DkGNOmLq2kjezO/MuEmDm+rvorlPhel8s5Qc7WpLfaElLO4sPYzaJ?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f1cb5de-3c40-4a89-29b6-08db86fda62d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 19:40:17.7243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IP9GcWuDSUY/6C1eJHnjbjFGk0f5S3yaDuDlyESr9jznaf4aFzNECeg9y3Rx7HgOj5HDlGPv2/zI/VFoy8RoeK2H6CzXeQ/hDyDqxW08PzI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6432
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
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 DRI Devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 17, 2023 at 07:30:57PM +0200, Andi Shyti wrote:
> Enable the CCS_FLUSH bit 13 in the control pipe for render and
> compute engines in platforms starting from Meteor Lake (BSPEC
> 43904 and 47112).
> 
> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 10 +++++++++-
>  drivers/gpu/drm/i915/gt/intel_engine_types.h |  1 +
>  drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  1 +
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 3c935d6b68bf0..aa2fb9d72745a 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -207,7 +207,7 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  	 * memory traffic is quiesced prior.
>  	 */
>  	if ((mode & EMIT_INVALIDATE) && !HAS_FLAT_CCS(engine->i915))
> -		mode |= EMIT_FLUSH;
> +		mode |= EMIT_FLUSH | EMIT_CCS_FLUSH;

Do we even really need the extra EMIT_* flag?  It seems like just doing
the CCS flush on graphics 12.70 and beyond would probably be fine since
EMIT_FLUSH is only used in two places on those platforms:  an
EMIT_BARRIER in intel_engine_emit_ctx_wa (which happens during device
init, before we've had an opportunity to use CCS for anything) and the
new flush we're adding here in aux invalidation.  All other uses of
EMIT_FLUSH in the driver are specific to non-GuC execlist submission or
to the old ringbuffer-based submission on pre-gen8 platforms.

Anyway, adding the extra condition shouldn't really hurt anything
either, so up to you whether you want to drop it or not.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  
>  	if (mode & EMIT_FLUSH) {
>  		u32 bit_group_0 = 0;
> @@ -221,6 +221,14 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  
>  		bit_group_0 |= PIPE_CONTROL0_HDC_PIPELINE_FLUSH;
>  
> +		/*
> +		 * When required, in MTL+ platforms we need to
> +		 * set the CCS_FLUSH bit in the pipe control
> +		 */
> +		if (mode & EMIT_CCS_FLUSH &&
> +		    GRAPHICS_VER_FULL(rq->i915) >= IP_VER(12, 70))
> +			bit_group_0 |= PIPE_CONTROL_CCS_FLUSH;
> +
>  		bit_group_1 |= PIPE_CONTROL_TILE_CACHE_FLUSH;
>  		bit_group_1 |= PIPE_CONTROL_FLUSH_L3;
>  		bit_group_1 |= PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH;
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> index e99a6fa03d453..e2cae9d02bd62 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
> @@ -514,6 +514,7 @@ struct intel_engine_cs {
>  	int		(*emit_flush)(struct i915_request *request, u32 mode);
>  #define EMIT_INVALIDATE	BIT(0)
>  #define EMIT_FLUSH	BIT(1)
> +#define EMIT_CCS_FLUSH	BIT(2) /* MTL+ */
>  #define EMIT_BARRIER	(EMIT_INVALIDATE | EMIT_FLUSH)
>  	int		(*emit_bb_start)(struct i915_request *rq,
>  					 u64 offset, u32 length,
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 5d143e2a8db03..5df7cce23197c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -299,6 +299,7 @@
>  #define   PIPE_CONTROL_QW_WRITE				(1<<14)
>  #define   PIPE_CONTROL_POST_SYNC_OP_MASK                (3<<14)
>  #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
> +#define   PIPE_CONTROL_CCS_FLUSH			(1<<13) /* MTL+ */
>  #define   PIPE_CONTROL_WRITE_FLUSH			(1<<12)
>  #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12) /* gen6+ */
>  #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11) /* MBZ on ILK */
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
