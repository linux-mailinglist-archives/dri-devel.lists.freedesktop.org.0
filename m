Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3667742CF59
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 01:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F310C6E125;
	Wed, 13 Oct 2021 23:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205576E10E;
 Wed, 13 Oct 2021 23:59:16 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10136"; a="214508007"
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="214508007"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 16:59:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,371,1624345200"; d="scan'208";a="460976150"
Received: from fmsmsx606.amr.corp.intel.com ([10.18.126.86])
 by orsmga002.jf.intel.com with ESMTP; 13 Oct 2021 16:59:15 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx606.amr.corp.intel.com (10.18.126.86) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 16:59:15 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 13 Oct 2021 16:59:14 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 13 Oct 2021 16:59:14 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 13 Oct 2021 16:59:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gYdnZbPxARQ6NY14zUltdxMJYdWC7orGzibPb/9DjdTRs8yOR2a68xhchZdavYYmoGdN8B9b73j53TP2d+7DDLAZUKKkG5mnFDOr5mW7mrWptXz2mTsWfqxvuwDpVv7iPMncP8MQ2rfkioURBXYtN0CwccwFAHPYcrFnJtlvWI1HwfOEYME29JtmpJc73Z0K7mG0urn3smMtz9ANOTT8zWX02jQl1geU58FrtEUT8hwlvP0m5tbfnn/A5L/9EjZ0M67iALt0VVbUFdUeaeSudVCyiFlRdKtI4cmTDOhpt1zgBraDmQ54YrYqQQC/7a1bkCcJ7VoVcGrFhGHWyTeCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSF85a2TWmtQ8im3eq0h6niC+mav8nz7VfPtnyTbExo=;
 b=OCbRV1LfLemuEp7ZwVsOGMPX6UxZNQifdCGWKw05XEZca2QEaNsQEhpXWcCpas4AS3XGxwqR4TxlaksMAOpBeRaUTD+glJsY6q6pJ+8ud7/+Iv1lLT1dfB/OgOIz70VYhWJbWwW9AfKuH9GoNph7QIKkIKpSyVRq/9eSkN95Rj6QkS5J565tYUvutEBbbb7PRoxTby7ysaudi7+8ZugTgmyy0jZLG61b36fD1gApTd5uZkbMt9p/EdnOk6Pp+DVbW0/ADshNGGwA0ycLBpMJ1p85VMULXy+TZwrGCZfMi95EqZ/kt+jYXxYqChDHPfVs5DCrFEDd1FJ2O8HOP7BF5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LSF85a2TWmtQ8im3eq0h6niC+mav8nz7VfPtnyTbExo=;
 b=qm0Nz+t5tWa5oomE6A4EH1pWjf77TN4Ijaru+WlMzYjue0RE9PAi+guB1L+tZTT1bm7a70xJUtepezEjs5co3lYgdfKlJc+D6WMm/qaJlbLXIU6vg394fyXrCHHauJIs2A6o2qUP6o/xw9/lmNpfFwKuRYSnbDKv5O3gCc5igoY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.19; Wed, 13 Oct
 2021 23:59:07 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4587.026; Wed, 13 Oct 2021
 23:59:07 +0000
Subject: Re: [PATCH 02/25] drm/i915/guc: Take GT PM ref when deregistering
 context
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20211013204231.19287-1-matthew.brost@intel.com>
 <20211013204231.19287-3-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <854e5e50-b9f4-ea6e-77d5-e06be964a9ba@intel.com>
Date: Wed, 13 Oct 2021 16:59:04 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
In-Reply-To: <20211013204231.19287-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: MWHPR10CA0021.namprd10.prod.outlook.com (2603:10b6:301::31)
 To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.106] (73.157.192.58) by
 MWHPR10CA0021.namprd10.prod.outlook.com (2603:10b6:301::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Wed, 13 Oct 2021 23:59:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 379eaf2d-e2de-4974-abd9-08d98ea5716a
X-MS-TrafficTypeDiagnostic: PH0PR11MB5577:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB55770DAD8C01F8ECD83D1724BDB79@PH0PR11MB5577.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u0KDHyJmUhoJBcpp7eSRGXkLCIfpdevRnaqwx9+FLrxTUDIjr0nq78iZBkuZGiOSDgCdRon5EbZichrGAdjFrCs9D+kwZOvRWrcvKc/hI2XmbUJVp7Cer4jykHuKDurskvIBvCTSl9FhcHar2o0T9DVWNUfsLp74XX8hmQnr8eHHZuwT5skygD2SI8LjTQqmMh+bqAB4axiwTK9g+garIsw5HCPlFcQ2fpd+bsLI0diDMtkUxq3/fm4CYAmP+1jX9Ml5dXf4YViltvmqE2CP2EE0utsTtPaL9itBw9xygml53GquYyRRDXFpjf3zll2HS4NHcI0Q6L+r68QCkFq56Q2uwsnT8fl4IgJlZoM79Ak2T/FLOvbNq4cpWvkYYEYLpTi39biketBhJtHyQG/s9boPppMPDEy7OC/KyYkAtra7AtRbKr7cOVBzm6AR+ACyp6OD9mQ9fAYxRuNG4dyqyp4BQsCKw9wOhXnSMI0nS7ToBq4q3+ad7iVZCIBaAtNwnZg2KhxIrxkrOtkwlwEgl4eNUWYZ6P4zvimr0Le6U/9fhWBZJUrjftIyJ/8xvX6oFdLoTIcPTbR5drTwoH1MnBXptzBIjXnOj5N0HPQYrKOMwhTO42O7GPYp2Q7tolmxGB1NOuVMNG6Vbsqd3Ejg4uj/d4UzcG6KoP0dgcUUozgIekCvUetSgkur2KKoIlayF2/TRyr0xUXk27Gaobw6Zq0kdvLYmQb7C/EkViIfyzjDs9LQkInAh4TFqkd+lOFKUVFLGfBkoYrNsQUgUoHjgA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8936002)(31686004)(66946007)(2906002)(2616005)(31696002)(83380400001)(66476007)(66556008)(36756003)(8676002)(186003)(82960400001)(86362001)(508600001)(16576012)(5660300002)(956004)(6486002)(450100002)(53546011)(38100700002)(316002)(26005)(30864003)(21314003)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjJua2pUTTFsa3ZobXRXZWxER3UrNGNqcklTZDYrTXNSZWJQZmpEZVd3ZFl1?=
 =?utf-8?B?VCtYclh0eW45TVRicGNWc0FzMjg2ZktNOVl1SUN5VUVtbzlaTTNGODJiVGlh?=
 =?utf-8?B?bUhieXRMT3R1bUQwTkFieHRNOUpYTEJJR3kwNFlNemhVODQ1eDN3bXYybmFL?=
 =?utf-8?B?WEVLOWpETVpCUEVuc1dNK3pCK2ZsWXB5L2pYaEltaVZDczM4VnJtSkNTV1Ry?=
 =?utf-8?B?cnFMWFE4Ri9QMHZSZVhrU2VlaXpXNURGZm1FdVhKT21zTjJNVnc4YVE5aFdi?=
 =?utf-8?B?NUx1QkwvTHBYa3d3cjdHblg5TkN2ZFY2RzltR3hXQ1d1QUJzWTMvYk0xbUJZ?=
 =?utf-8?B?NTg3eU1mMDR4R2d5ejBucjFNYldIQVVwR0NENEF1MUQ4bDdCQW5lWlpNTlBH?=
 =?utf-8?B?MlBIdVBQUjFyUFlQUWFENElVdDgzaWp5aEZXMVVJb0J6Mmd2ZW9WRGI5S2sw?=
 =?utf-8?B?U0VPRjNWSkpwRWZqaWN0MzFsZUJuektQVFBKR2V0RG1VRVM1ck0vMXYvdWNS?=
 =?utf-8?B?bGF4QWJzdWFweGpCS2gwL2lZUExMYkNjTFlvY0ZCaHd0Qm5EY2pPcDJtSkk4?=
 =?utf-8?B?RmNuaC9IWkZHT2U1OTFJVmQ3Qm1kU01FMktSYVdmY25ZcmdqY1poK3ZjeFJF?=
 =?utf-8?B?Szh2eU9CYnd3dWJSblROQ3YrejA0SmtrU0JCL2I3c2ZBdGc0OXFwMzdyeVow?=
 =?utf-8?B?REFsR2NSYW8rY3ZQSGdCeEN0VUJud05leUlFQUE4UTdaS1RFTkdyeTJCWnA4?=
 =?utf-8?B?czNheWZBTzR6V0dtbGd0UmtTNDVPbmw2Y3plcUdHMUNGRXBXMnhpZXRQR3pU?=
 =?utf-8?B?RkJud3VVd3B1WDZCQS82RnQxZ0R1VDJEMmh5Z280UmhaL29neUcwVjBEdGxi?=
 =?utf-8?B?ditLc0MraVZhbGYxVVY2cTJVRzRjNm1pTW40enB0aDN6YVhmOXh6NkpvbFVC?=
 =?utf-8?B?dDlIemJ2SHdYVi9vYVV3U1d2STJTWkhDaWpuV0tYd0ZCWElIWm1BRkkwYXp4?=
 =?utf-8?B?elAwVThoS3JHVm9DWnVJTE1VcE8vSUpPa2pPZUJmRDBpTkZwZThqZEIzM0Ru?=
 =?utf-8?B?U01WVkVhSitNN3hhT2pGUURNUzM4M1RNSHFTeEgzalZyNU00bnNrVzJ6bzdq?=
 =?utf-8?B?KzUrcjA2aGpYRTRwRnZKUEp6TkI4dWVjYVdLVGNUMWtFcnNoaVBBNnQ0RE9s?=
 =?utf-8?B?QnBZTzFTZVlib2RtSlIrcXcwMSszYXlFTFprVGtlM0xqYXUvTEtJbzY0Z2Mv?=
 =?utf-8?B?ZmQvMGpmdEh1MFNzdnJHeW1aUzkyQzBmaHZjckJqSy9QTW5BOHdLVVkyNTJQ?=
 =?utf-8?B?SFU3N0NueExVWTZWZ0dEV24xaHhpUndEYUcreGF2RGR5NXVSK291MVI0bmxs?=
 =?utf-8?B?djl3K1ZVVWtEdmlJbUQ5QTdLcWlZMEtKL3FLUVhzQThsaDg2amEycC91T2Zs?=
 =?utf-8?B?SkUzR1hnNWszdVBOSFEvdlBPeC9WRG1lN2FOYU8zRDJacHdxSWl2bmszZXB1?=
 =?utf-8?B?TE9yeFdYMG9rTmxVeGkrK2ZVVFF4QnlXWU0zVlBjMnZtS0NvVnl6WkdDMzlr?=
 =?utf-8?B?NzZRSnNRTEVqRkxkd1pPNWtObGdncGJXdmlxMmhGNkJLK0E0dEw2bFhhbnZM?=
 =?utf-8?B?VUJxekpuajNGbmVmSjFtU0hRSk90R1lPUlB1N3JuZVVRVXZ0bm5lUTZHNlVT?=
 =?utf-8?B?cU9IQWRhMlpwRG8rcU9JS3BEQnZMdVQyOTlPdTJWeEQ5cEFnQ0crK1NiVUE4?=
 =?utf-8?Q?Q9kX41z7YA6PQrKxkqEopXEJo7yH7uQcmKHzw78?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 379eaf2d-e2de-4974-abd9-08d98ea5716a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 23:59:07.4803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KxBNDYiKxV7j2OSlwWUzLqJsqNx3GFSWWZMyiyNFxw1ZINhd5E7L89cUppIA2Ok3ZpAGJryWAR4hQuwzJH8lBjr5nhII97AakmmtvhZOtw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5577
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

On 10/13/2021 13:42, Matthew Brost wrote:
> Taking a PM reference to prevent intel_gt_wait_for_idle from short
> circuiting while a deregister context H2G is in flight. To do this must
> issue the deregister H2G from a worker as context can be destroyed from
> an atomic context and taking GT PM ref blows up. Previously we took a
> runtime PM from this atomic context which worked but will stop working
> once runtime pm autosuspend in enabled.
>
> So this patch is two fold, stop intel_gt_wait_for_idle from short
> circuting and fix runtime pm autosuspend.
>
> v2:
>   (John Harrison)
>    - Split structure changes out in different patch
>   (Tvrtko)
>    - Don't drop lock in deregister_destroyed_contexts
> v3:
>   (John Harrison)
>    - Flush destroyed contexts before destroying context reg pool
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>

> ---
>   drivers/gpu/drm/i915/gt/intel_context.c       |   2 +
>   drivers/gpu/drm/i915/gt/intel_context_types.h |   7 +
>   drivers/gpu/drm/i915/gt/intel_engine_pm.h     |   5 +
>   drivers/gpu/drm/i915/gt/intel_gt_pm.h         |   4 +
>   drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  11 ++
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 146 +++++++++++-------
>   6 files changed, 121 insertions(+), 54 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.c b/drivers/gpu/drm/i915/gt/intel_context.c
> index 35babd02ddfe..d008ef8623ce 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.c
> +++ b/drivers/gpu/drm/i915/gt/intel_context.c
> @@ -400,6 +400,8 @@ intel_context_init(struct intel_context *ce, struct intel_engine_cs *engine)
>   	ce->guc_id.id = GUC_INVALID_LRC_ID;
>   	INIT_LIST_HEAD(&ce->guc_id.link);
>   
> +	INIT_LIST_HEAD(&ce->destroyed_link);
> +
>   	/*
>   	 * Initialize fence to be complete as this is expected to be complete
>   	 * unless there is a pending schedule disable outstanding.
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index e7e3984aab78..4613d027cbc3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -213,6 +213,13 @@ struct intel_context {
>   		struct list_head link;
>   	} guc_id;
>   
> +	/**
> +	 * @destroyed_link: link in guc->submission_state.destroyed_contexts, in
> +	 * list when context is pending to be destroyed (deregistered with the
> +	 * GuC), protected by guc->submission_state.lock
> +	 */
> +	struct list_head destroyed_link;
> +
>   #ifdef CONFIG_DRM_I915_SELFTEST
>   	/**
>   	 * @drop_schedule_enable: Force drop of schedule enable G2H for selftest
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> index 8520c595f5e1..6fdeae668e6e 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
> @@ -16,6 +16,11 @@ intel_engine_pm_is_awake(const struct intel_engine_cs *engine)
>   	return intel_wakeref_is_active(&engine->wakeref);
>   }
>   
> +static inline void __intel_engine_pm_get(struct intel_engine_cs *engine)
> +{
> +	__intel_wakeref_get(&engine->wakeref);
> +}
> +
>   static inline void intel_engine_pm_get(struct intel_engine_cs *engine)
>   {
>   	intel_wakeref_get(&engine->wakeref);
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm.h b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> index d0588d8aaa44..05de6c1af25b 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm.h
> @@ -41,6 +41,10 @@ static inline void intel_gt_pm_put_async(struct intel_gt *gt)
>   	intel_wakeref_put_async(&gt->wakeref);
>   }
>   
> +#define with_intel_gt_pm(gt, tmp) \
> +	for (tmp = 1, intel_gt_pm_get(gt); tmp; \
> +	     intel_gt_pm_put(gt), tmp = 0)
> +
>   static inline int intel_gt_pm_wait_for_idle(struct intel_gt *gt)
>   {
>   	return intel_wakeref_wait_for_idle(&gt->wakeref);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index 82e248c2290c..74f071a0b6d5 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -90,6 +90,17 @@ struct intel_guc {
>   		 * refs
>   		 */
>   		struct list_head guc_id_list;
> +		/**
> +		 * @destroyed_contexts: list of contexts waiting to be destroyed
> +		 * (deregistered with the GuC)
> +		 */
> +		struct list_head destroyed_contexts;
> +		/**
> +		 * @destroyed_worker: worker to deregister contexts, need as we
> +		 * need to take a GT PM reference and can't from destroy
> +		 * function as it might be in an atomic context (no sleeping)
> +		 */
> +		struct work_struct destroyed_worker;
>   	} submission_state;
>   
>   	/**
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index b2646b088c7f..d2ce47b5541e 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -90,8 +90,8 @@
>    * used for all of GuC submission but that could change in the future.
>    *
>    * guc->submission_state.lock
> - * Protects guc_id allocation for the given GuC, i.e. only one context can be
> - * doing guc_id allocation operations at a time for each GuC in the system.
> + * Global lock for GuC submission state. Protects guc_ids and destroyed contexts
> + * list.
>    *
>    * ce->guc_state.lock
>    * Protects everything under ce->guc_state. Ensures that a context is in the
> @@ -719,6 +719,7 @@ static void scrub_guc_desc_for_outstanding_g2h(struct intel_guc *guc)
>   			if (deregister)
>   				guc_signal_context_fence(ce);
>   			if (destroyed) {
> +				intel_gt_pm_put_async(guc_to_gt(guc));
>   				release_guc_id(guc, ce);
>   				__guc_context_destroy(ce);
>   			}
> @@ -797,6 +798,8 @@ static void guc_flush_submissions(struct intel_guc *guc)
>   	spin_unlock_irqrestore(&sched_engine->lock, flags);
>   }
>   
> +static void guc_flush_destroyed_contexts(struct intel_guc *guc);
> +
>   void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   {
>   	int i;
> @@ -815,6 +818,7 @@ void intel_guc_submission_reset_prepare(struct intel_guc *guc)
>   	spin_unlock_irq(&guc_to_gt(guc)->irq_lock);
>   
>   	guc_flush_submissions(guc);
> +	guc_flush_destroyed_contexts(guc);
>   
>   	/*
>   	 * Handle any outstanding G2Hs before reset. Call IRQ handler directly
> @@ -1126,6 +1130,8 @@ void intel_guc_submission_reset_finish(struct intel_guc *guc)
>   	intel_gt_unpark_heartbeats(guc_to_gt(guc));
>   }
>   
> +static void destroyed_worker_func(struct work_struct *w);
> +
>   /*
>    * Set up the memory resources to be shared with the GuC (via the GGTT)
>    * at firmware loading time.
> @@ -1151,6 +1157,9 @@ int intel_guc_submission_init(struct intel_guc *guc)
>   	spin_lock_init(&guc->submission_state.lock);
>   	INIT_LIST_HEAD(&guc->submission_state.guc_id_list);
>   	ida_init(&guc->submission_state.guc_ids);
> +	INIT_LIST_HEAD(&guc->submission_state.destroyed_contexts);
> +	INIT_WORK(&guc->submission_state.destroyed_worker,
> +		  destroyed_worker_func);
>   
>   	return 0;
>   }
> @@ -1160,6 +1169,7 @@ void intel_guc_submission_fini(struct intel_guc *guc)
>   	if (!guc->lrc_desc_pool)
>   		return;
>   
> +	guc_flush_destroyed_contexts(guc);
>   	guc_lrc_desc_pool_destroy(guc);
>   	i915_sched_engine_put(guc->sched_engine);
>   }
> @@ -1859,11 +1869,30 @@ static void guc_context_sched_disable(struct intel_context *ce)
>   static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>   {
>   	struct intel_guc *guc = ce_to_guc(ce);
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	unsigned long flags;
> +	bool disabled;
>   
> +	GEM_BUG_ON(!intel_gt_pm_is_awake(gt));
>   	GEM_BUG_ON(!lrc_desc_registered(guc, ce->guc_id.id));
>   	GEM_BUG_ON(ce != __get_context(guc, ce->guc_id.id));
>   	GEM_BUG_ON(context_enabled(ce));
>   
> +	/* Seal race with Reset */
> +	spin_lock_irqsave(&ce->guc_state.lock, flags);
> +	disabled = submission_disabled(guc);
> +	if (likely(!disabled)) {
> +		__intel_gt_pm_get(gt);
> +		set_context_destroyed(ce);
> +		clr_context_registered(ce);
> +	}
> +	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +	if (unlikely(disabled)) {
> +		release_guc_id(guc, ce);
> +		__guc_context_destroy(ce);
> +		return;
> +	}
> +
>   	deregister_context(ce, ce->guc_id.id);
>   }
>   
> @@ -1891,78 +1920,86 @@ static void __guc_context_destroy(struct intel_context *ce)
>   	}
>   }
>   
> +static void guc_flush_destroyed_contexts(struct intel_guc *guc)
> +{
> +	struct intel_context *ce, *cn;
> +	unsigned long flags;
> +
> +	GEM_BUG_ON(!submission_disabled(guc) &&
> +		   guc_submission_initialized(guc));
> +
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
> +	list_for_each_entry_safe(ce, cn,
> +				 &guc->submission_state.destroyed_contexts,
> +				 destroyed_link) {
> +		list_del_init(&ce->destroyed_link);
> +		__release_guc_id(guc, ce);
> +		__guc_context_destroy(ce);
> +	}
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> +}
> +
> +static void deregister_destroyed_contexts(struct intel_guc *guc)
> +{
> +	struct intel_context *ce, *cn;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&guc->submission_state.lock, flags);
> +	list_for_each_entry_safe(ce, cn,
> +				 &guc->submission_state.destroyed_contexts,
> +				 destroyed_link) {
> +		list_del_init(&ce->destroyed_link);
> +		guc_lrc_desc_unpin(ce);
> +	}
> +	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> +}
> +
> +static void destroyed_worker_func(struct work_struct *w)
> +{
> +	struct intel_guc *guc = container_of(w, struct intel_guc,
> +					     submission_state.destroyed_worker);
> +	struct intel_gt *gt = guc_to_gt(guc);
> +	int tmp;
> +
> +	with_intel_gt_pm(gt, tmp)
> +		deregister_destroyed_contexts(guc);
> +}
> +
>   static void guc_context_destroy(struct kref *kref)
>   {
>   	struct intel_context *ce = container_of(kref, typeof(*ce), ref);
> -	struct intel_runtime_pm *runtime_pm = ce->engine->uncore->rpm;
>   	struct intel_guc *guc = ce_to_guc(ce);
> -	intel_wakeref_t wakeref;
>   	unsigned long flags;
> -	bool disabled;
> +	bool destroy;
>   
>   	/*
>   	 * If the guc_id is invalid this context has been stolen and we can free
>   	 * it immediately. Also can be freed immediately if the context is not
>   	 * registered with the GuC or the GuC is in the middle of a reset.
>   	 */
> -	if (context_guc_id_invalid(ce)) {
> -		__guc_context_destroy(ce);
> -		return;
> -	} else if (submission_disabled(guc) ||
> -		   !lrc_desc_registered(guc, ce->guc_id.id)) {
> -		release_guc_id(guc, ce);
> -		__guc_context_destroy(ce);
> -		return;
> -	}
> -
> -	/*
> -	 * We have to acquire the context spinlock and check guc_id again, if it
> -	 * is valid it hasn't been stolen and needs to be deregistered. We
> -	 * delete this context from the list of unpinned guc_id available to
> -	 * steal to seal a race with guc_lrc_desc_pin(). When the G2H CTB
> -	 * returns indicating this context has been deregistered the guc_id is
> -	 * returned to the pool of available guc_id.
> -	 */
>   	spin_lock_irqsave(&guc->submission_state.lock, flags);
> -	if (context_guc_id_invalid(ce)) {
> -		spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> -		__guc_context_destroy(ce);
> -		return;
> +	destroy = submission_disabled(guc) || context_guc_id_invalid(ce) ||
> +		!lrc_desc_registered(guc, ce->guc_id.id);
> +	if (likely(!destroy)) {
> +		if (!list_empty(&ce->guc_id.link))
> +			list_del_init(&ce->guc_id.link);
> +		list_add_tail(&ce->destroyed_link,
> +			      &guc->submission_state.destroyed_contexts);
> +	} else {
> +		__release_guc_id(guc, ce);
>   	}
> -
> -	if (!list_empty(&ce->guc_id.link))
> -		list_del_init(&ce->guc_id.link);
>   	spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> -
> -	/* Seal race with Reset */
> -	spin_lock_irqsave(&ce->guc_state.lock, flags);
> -	disabled = submission_disabled(guc);
> -	if (likely(!disabled)) {
> -		set_context_destroyed(ce);
> -		clr_context_registered(ce);
> -	}
> -	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> -	if (unlikely(disabled)) {
> -		release_guc_id(guc, ce);
> +	if (unlikely(destroy)) {
>   		__guc_context_destroy(ce);
>   		return;
>   	}
>   
>   	/*
> -	 * We defer GuC context deregistration until the context is destroyed
> -	 * in order to save on CTBs. With this optimization ideally we only need
> -	 * 1 CTB to register the context during the first pin and 1 CTB to
> -	 * deregister the context when the context is destroyed. Without this
> -	 * optimization, a CTB would be needed every pin & unpin.
> -	 *
> -	 * XXX: Need to acqiure the runtime wakeref as this can be triggered
> -	 * from context_free_worker when runtime wakeref is not held.
> -	 * guc_lrc_desc_unpin requires the runtime as a GuC register is written
> -	 * in H2G CTB to deregister the context. A future patch may defer this
> -	 * H2G CTB if the runtime wakeref is zero.
> +	 * We use a worker to issue the H2G to deregister the context as we can
> +	 * take the GT PM for the first time which isn't allowed from an atomic
> +	 * context.
>   	 */
> -	with_intel_runtime_pm(runtime_pm, wakeref)
> -		guc_lrc_desc_unpin(ce);
> +	queue_work(system_unbound_wq, &guc->submission_state.destroyed_worker);
>   }
>   
>   static int guc_context_alloc(struct intel_context *ce)
> @@ -2798,6 +2835,7 @@ int intel_guc_deregister_done_process_msg(struct intel_guc *guc,
>   		intel_context_put(ce);
>   	} else if (context_destroyed(ce)) {
>   		/* Context has been destroyed */
> +		intel_gt_pm_put_async(guc_to_gt(guc));
>   		release_guc_id(guc, ce);
>   		__guc_context_destroy(ce);
>   	}

