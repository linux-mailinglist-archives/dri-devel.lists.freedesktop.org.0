Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6125C40CD26
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 21:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2336E9FF;
	Wed, 15 Sep 2021 19:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2132F6E9FF;
 Wed, 15 Sep 2021 19:24:48 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="202571550"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="202571550"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 12:24:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; d="scan'208";a="452655198"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga002.jf.intel.com with ESMTP; 15 Sep 2021 12:24:47 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 12:24:47 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 15 Sep 2021 12:24:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12 via Frontend Transport; Wed, 15 Sep 2021 12:24:46 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2242.12; Wed, 15 Sep 2021 12:24:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D7Drhx2HL3HoNYQNZQMRXn7dtTYl9//ymR+syH/uTUsMq23qq3GtVj7uSdwql+ShODQEEN+X87FXFTNUya+C9vRFh9dBd7bTjXdD3i56b1NpstQOdZLirxOhER+uY1gaFh0ftMDD5APsEEkQg2vfPP1fp1+i4Wj1cXNk60DZEdJ4wXfxpaosBX65LMC34jgjQacxcXz6orirGoJdyRMzsJfw6uKuT72LmCa9sldB/qzQUWHtQujGZb6zMsdcJPLOQ6eWLdJV/wcAey/f9Pkva/6vPwgd17kvq8rHePiO+JquG5DARHs8I6IRnfCkBP2XmLR1wK8Rq9o0ONppgvwT2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=MwKxKn3AseU7MXldLVLqR7/9w3NbYTM5TJ6cy23z/og=;
 b=mbQxHXl1xLbib3yQy7bjExwde0VpVZtGcG2rnRTMP5SV5sRA+qxVEaz64j4TnOfbDenUSaE2JVNMmEd7SlGaaldDpuaow0oWjZ1ZQXQSZV8fRiYfmPDKGs9aVDoFfef5OpPKFOg+qjeOrme8tSAMwVEmQvsh8uxLqNUZZqQ86GFZGDnIlMlxz29KXWpgNYrGH/RKwwH+8S7gA0C5u/409brqTq88ftNLXVlafIdQuHgHpuGZVIWyAEUpMx2n9InIHni5b4UPiRU7YywgNtKrDkBZRMuP8XpupUdafhGGNAlPdZa1lnFQpg8W2R5o4+LQBciWAtwQbgYbD6sEuzUQ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MwKxKn3AseU7MXldLVLqR7/9w3NbYTM5TJ6cy23z/og=;
 b=u4AXV15NZr2tNfUfN2HKxo5IxFcG6KWTxiRkL6IdnM1BRLbgMv8nuYbXzcRua4CxufU42rgKQbzXK0ATbtfOiXfyriAfCDaNm7wApqEdcBacp/g9Ft5CTYybrHweUqHmYgE2rVw9Dv93N4XR02lBkJsADTLpNJVSehYittOsk2A=
Authentication-Results: intel.com; dkim=none (message not signed)
 header.d=none;intel.com; dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 by PH0PR11MB5642.namprd11.prod.outlook.com (2603:10b6:510:e5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Wed, 15 Sep
 2021 19:24:44 +0000
Received: from PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a]) by PH0PR11MB5642.namprd11.prod.outlook.com
 ([fe80::880d:1a54:ca07:738a%8]) with mapi id 15.20.4500.019; Wed, 15 Sep 2021
 19:24:44 +0000
Subject: Re: [Intel-gfx] [PATCH 13/27] drm/i915/guc: Ensure GuC schedule
 operations do not operate on child contexts
To: Matthew Brost <matthew.brost@intel.com>,
 <intel-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: <daniel.vetter@ffwll.ch>, <tony.ye@intel.com>, <zhengguo.xu@intel.com>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-14-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <bc782f52-a19a-0a2e-a472-fb469858135b@intel.com>
Date: Wed, 15 Sep 2021 12:24:41 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
In-Reply-To: <20210820224446.30620-14-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: CO2PR04CA0122.namprd04.prod.outlook.com
 (2603:10b6:104:7::24) To PH0PR11MB5642.namprd11.prod.outlook.com
 (2603:10b6:510:e5::13)
MIME-Version: 1.0
Received: from [192.168.1.221] (73.157.192.58) by
 CO2PR04CA0122.namprd04.prod.outlook.com (2603:10b6:104:7::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Wed, 15 Sep 2021 19:24:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ee28c39-304a-45e0-d06c-08d9787e7938
X-MS-TrafficTypeDiagnostic: PH0PR11MB5642:
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <PH0PR11MB56424934F42B568BDD1375D5BDDB9@PH0PR11MB5642.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FDyNNQJEQIwdspNZOyIC3UJH/0GZ+oSJblctaR7IQtUhkB6PoRWUDPI9CsHeqCiYZH6QkEYG0VQqOfJULJ52YarKp9sRZHJBT/zICmtSMxxbUkU5fLeTqcb0BJzY4IqrAx1q09xbOcfpnxkgtWIT9rCznEf8qOhFxRKdo6kK0K5vC6j6KdLKa06z7XJC71piFw4xgJaaFeWBwAhh4s8AW2+zB5u0dnkchi9hGwiKbGIU4ZLshYskwKpUeuV1tRzS3WjtBUk2sYicWFB1fOIsJ/EVdS0F+90Uah8dfhmM3O5dx5j0JVzGarAdL4mYqvY2LX/8MyyuyZJqvqY0meQKAaiDGxWvAPioxh1JDza4bWtTBWbJLXbs/Zy6RiQUTwCYAuDM8sEeziAHQPnWTWiRiD7fMoSe+G0bQa5NFTxTITFn5Hc04mnQcpudy5/RpjUoAaIPo27jdJNY25gaSZxzPBZ2Cm5WBG/jOKW7nlOHaGJAchZ7y0m9N/yiYmlwEqngg8/LquP59RIXOjpyCoEh2MqOv+ObZmKXkD9ttEZ7nqPS8W4kK0atluNQmZ2D/Q4cpSWEBAZKC0hYR7LfDu+BBOPlBwovxeojVPUg9cZ7xXXIz9BNSJfQw4t8pIX3BvDA/Mw0LEE1z5NvbsUBExuY66MaDUt9uEeDPHfRKXFI51qdsUxi1xo2SynFSQmeH8Crb9kQcwcb5UyCRP05MmQnVGacqkOlxaKXRUd1lPP4jurUSSzelBNa0R+LMAax/acu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5642.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(376002)(366004)(346002)(136003)(26005)(8676002)(83380400001)(86362001)(53546011)(107886003)(6486002)(2616005)(956004)(4326008)(316002)(16576012)(5660300002)(186003)(2906002)(478600001)(66946007)(31696002)(66476007)(8936002)(36756003)(38100700002)(66556008)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ckN3S00veHNscStMclV3aTZmdGpKSmtiNFBTckZ2SWRJcENIeUgyYkZjWFFY?=
 =?utf-8?B?S3ZlL3RySWFOQUs2cDRoajloS3dEWnIrckxDZGtXOXBGcXV1ajE3UlZ2cHRB?=
 =?utf-8?B?Q1F2Qmp5UG5OZGlmSnV4N3N6QjJWU0RKOW54YUxwZ2dKMStLL0ZielN6bklo?=
 =?utf-8?B?WGQzKzFhN2ViRHFwWmVHT2tsM0FiL2Fkbk1Xcy9oWG5QUFdIbnNMcDJSZGRT?=
 =?utf-8?B?ZEJ3N0JlaWRNajQzSEtEVVNhOEJ4OS9SSm50Z3ZWWmVYY2lvRkd6ZTZtWVVY?=
 =?utf-8?B?L0JMcm5UOWhYRmd2dWJXMHF3NkI4eU5ad0R2NGdHa2JKQ1g0ZzFyUm1IOGJB?=
 =?utf-8?B?NktJeGJEM0ZvNGdwS1gzbys2NkRFS2szc1cwY2c3VTNqZ2NaQjA5d2hvUjBa?=
 =?utf-8?B?UGFMMmNaN3hHZEh0SzY0MERYUkhrODNVQ3lMM1doRWRIZzR3Znh3UjdaL3gz?=
 =?utf-8?B?MTk1RzU0YkhqQ015VHB3UENUNXZYYnJpUzF1S0RJNUZMNWJQUUpVT1pUcXlE?=
 =?utf-8?B?dUFtM0VUQWtDcGt0N2tTZ2RiWFJUQTQyY21yUDVOb0VUaDgrWm5uZmtMLzBI?=
 =?utf-8?B?MWozOE1qaG9PUllRYzVmV05YSkJnL2tkS2k5M3hwOWFRTytZTmNwQzRJWHpS?=
 =?utf-8?B?QVlXVzBPcyttV21RcWVVVTVZT3RBSEo1UXVsNk45TzltWkhYWThia3dXU3Qy?=
 =?utf-8?B?b29yK1B5RSs5ZERqWDZ5bmRVQnQ2UkJ1K1pIdkVDSXRMVXRVWlg5Q3Q1TW1Y?=
 =?utf-8?B?dy8zL242MXpsRTV4VGxiMmJRMFZreUN2UHpRMTJ1Zk1od010aGNzZHpnMHFo?=
 =?utf-8?B?MTBwMnQ3ZlE4V3VYNS85bzdQS3JpWGxKUnJJdVQwOCtsRmQ3cmY3Y1RkUUIy?=
 =?utf-8?B?Ly9paUsrNHA2UkN0ZnZHSmw5MWlIUGc0ejkwSkZtVnF4SEkwUEhKZER0K2ZB?=
 =?utf-8?B?N05LVUttOWxxWDRWL0hoUlJIWHlKOXRmdWxOanFEUHBCSUl1OGhOTFdzK1Rw?=
 =?utf-8?B?a3MxaUtJMVN2L042NlkrNjRRWWhSdkhjSTR6Wll6WEJhcDJRZ0FDUFBsR3M0?=
 =?utf-8?B?dEQ2V05UdGdMR3ZFeUd0RnpTTHg5YnNNN0lkMHMyRWJRL3lDMndYUXBRb2Z5?=
 =?utf-8?B?a083aFVnanNFSDYzU0o5Mm5sWklUek1ZR3IxOVQ0aHVCcEJwU25ZVkhtZmJr?=
 =?utf-8?B?NzRwZUVDVUNJWFV5dUdpR3dVYWhMOFRzQXNPK2N2QzFXRzhreGRLbU1aTmZS?=
 =?utf-8?B?MHhyT1F2Q3RuTUVPNnRkOFVHc1ZoQ1JZcG9BaVltVWZqTkF2WFBWYUVzR1Jv?=
 =?utf-8?B?b0d1d0pYS3VEQ080NXFHeVAyMHpsYWhDSDZrdHU2RUxORzRmNTAwYVVQdVFi?=
 =?utf-8?B?R1FQYUJYUmdocUJxRzZoc2pSZG9weG90Mk0wRERYZk83ZS9pNUJyU0Z2Z3p4?=
 =?utf-8?B?dEt0WFpLL2x6Tkd1ZkdSOGx5RUdvSHBKZVRBZlp1aTg0QnFxVC91dGlndjdn?=
 =?utf-8?B?TmR3Z2FFQlk5ZUxwK1RBQmF4UlM5eTltMzd5TmExN1BzYVVUVi9TVGRMdTFs?=
 =?utf-8?B?SENjeDFpRnYyV1grUmU0dVBPeHVZUXhMZm9pZGVMaTMwWXZlWjZ0bW5tbTRR?=
 =?utf-8?B?QnJURFJudllOekdKUzhlRlJBM1E5QjhmdEJoNWhabkhFNysyenM0WTBuaDQw?=
 =?utf-8?B?Z0UyUDV1b3QzQlBSQXJML2pmeTlxeDVXeXcxOFNjaHlMTVhtV2JkTmRPWStX?=
 =?utf-8?Q?uGNyC/N6BqB/eQXaUw9aFqPPikvA96dw/tdu8QV?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee28c39-304a-45e0-d06c-08d9787e7938
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5642.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2021 19:24:44.6576 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t25e9pg93mLbXlRB3OQqI+HGijzaPPB73IMV1VQU7GHKUVv8QNKdzqxJyi6Vxrv740usuVPsOGUBoYx06WWtA3OjZM1RgYUWOE6E+NZ+hxc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5642
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

On 8/20/2021 15:44, Matthew Brost wrote:
> In GuC parent-child contexts the parent context controls the scheduling,
> ensure only the parent does the scheduling operations.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 24 ++++++++++++++-----
>   1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index dbcb9ab28a9a..00d54bb00bfb 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -320,6 +320,12 @@ static void decr_context_committed_requests(struct intel_context *ce)
>   	GEM_BUG_ON(ce->guc_state.number_committed_requests < 0);
>   }
>   
> +static struct intel_context *
> +request_to_scheduling_context(struct i915_request *rq)
> +{
> +	return intel_context_to_parent(rq->context);
> +}
> +
>   static bool context_guc_id_invalid(struct intel_context *ce)
>   {
>   	return ce->guc_id.id == GUC_INVALID_LRC_ID;
> @@ -1684,6 +1690,7 @@ static void __guc_context_sched_disable(struct intel_guc *guc,
>   
>   	GEM_BUG_ON(guc_id == GUC_INVALID_LRC_ID);
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
>   	trace_intel_context_sched_disable(ce);
>   
>   	guc_submission_send_busy_loop(guc, action, ARRAY_SIZE(action),
> @@ -1898,6 +1905,8 @@ static void guc_context_sched_disable(struct intel_context *ce)
>   	u16 guc_id;
>   	bool enabled;
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
> +
>   	if (submission_disabled(guc) || context_guc_id_invalid(ce) ||
>   	    !lrc_desc_registered(guc, ce->guc_id.id)) {
>   		spin_lock_irqsave(&ce->guc_state.lock, flags);
> @@ -2286,6 +2295,8 @@ static void guc_signal_context_fence(struct intel_context *ce)
>   {
>   	unsigned long flags;
>   
> +	GEM_BUG_ON(intel_context_is_child(ce));
> +
>   	spin_lock_irqsave(&ce->guc_state.lock, flags);
>   	clr_context_wait_for_deregister_to_register(ce);
>   	__guc_signal_context_fence(ce);
> @@ -2315,7 +2326,7 @@ static void guc_context_init(struct intel_context *ce)
>   
>   static int guc_request_alloc(struct i915_request *rq)
>   {
> -	struct intel_context *ce = rq->context;
> +	struct intel_context *ce = request_to_scheduling_context(rq);
>   	struct intel_guc *guc = ce_to_guc(ce);
>   	unsigned long flags;
>   	int ret;
> @@ -2358,11 +2369,12 @@ static int guc_request_alloc(struct i915_request *rq)
>   	 * exhausted and return -EAGAIN to the user indicating that they can try
>   	 * again in the future.
>   	 *
> -	 * There is no need for a lock here as the timeline mutex ensures at
> -	 * most one context can be executing this code path at once. The
> -	 * guc_id_ref is incremented once for every request in flight and
> -	 * decremented on each retire. When it is zero, a lock around the
> -	 * increment (in pin_guc_id) is needed to seal a race with unpin_guc_id.
> +	 * There is no need for a lock here as the timeline mutex (or
> +	 * parallel_submit mutex in the case of multi-lrc) ensures at most one
> +	 * context can be executing this code path at once. The guc_id_ref is
Isn't that now two? One uni-LRC holding the timeline mutex and one 
multi-LRC holding the parallel submit mutex?

John.

> +	 * incremented once for every request in flight and decremented on each
> +	 * retire. When it is zero, a lock around the increment (in pin_guc_id)
> +	 * is needed to seal a race with unpin_guc_id.
>   	 */
>   	if (atomic_add_unless(&ce->guc_id.ref, 1, 0))
>   		goto out;

