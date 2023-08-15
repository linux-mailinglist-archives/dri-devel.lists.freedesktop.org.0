Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 586C477CD9D
	for <lists+dri-devel@lfdr.de>; Tue, 15 Aug 2023 15:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8280810E182;
	Tue, 15 Aug 2023 13:56:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623AA10E182;
 Tue, 15 Aug 2023 13:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692107796; x=1723643796;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=yWyCJE5vhqB/p7AAskJPD/5GbomWweT6jr9WJ3T7ce4=;
 b=NfkjXiKaGr8eUIDFoYsgz4AtFm9ezt1KtNxBSsGCMkG5ZmdGx6/MbnoM
 NSl1zq4VmAcsGxk+IT/ItJuaAPa4NQ/CPMvdGO1z2uzXhi7K0dpGH4yj0
 k7k6yENRvwQd5eTc0B6yFw3gW61ejz++7Z6W2MtV40v0e9N/2jEac/8XU
 O9gX6RX+wfApSpg8AzMkAaZF+EEeY/hxkfzGtDk5aAC34FKRo+6PtYBua
 QQQ7i50+HWcM+hODuPadmtCDNJGArH9ptp9vNi1yf1BtvHLhSyoMpXISq
 1PXcXfG5siZ0kNcY/511i3uTsc0N5SJ+NpeQNFdK4kWSKme7HTNwW+RX/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="375050466"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="375050466"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2023 06:56:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="907592405"
X-IronPort-AV: E=Sophos;i="6.01,174,1684825200"; d="scan'208";a="907592405"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga005.jf.intel.com with ESMTP; 15 Aug 2023 06:56:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 06:56:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 15 Aug 2023 06:56:35 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 15 Aug 2023 06:56:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 15 Aug 2023 06:56:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUOlaQuAuqJTyuHvGyKRy3IlngP1g50oVQwxP+r4djjzuKvk0/oVFsg2NEDzuvJeVjHRd0mMUBNeuBy6lQv7XeRm90TW3mma06wSROF+VYuyXUd4v/bWppYhM06UxefOxmA2Qrnux3XIIGlui3NLXJr+KO5ccyajzS/MRJ3iK6BpUgREoglm0pkEszbAGGLF7XPlVOlpPLuwa1piWOPDstMEqeoVnFf34aohjxVpKap+/GZYu6Nb3uDvb3ET/m3dGVLdkzwPuDsKJkLPaqaJtYgcmUf0l1h4n3KQsX+ywoDHQVu0DswrINTW7ae/MHh5+VwsyZgSPdfAjBzlNw7Cpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i+2HWBz7tOzm/kD5kpmY3Cxb2SDN9sKVBJE2gOc6s7k=;
 b=BhbQj5awdYhzCU0J0zBcE940ff8vEQ3A0K+A2DizFPVk2etE1jxW1kzjumSuLZf79PkiAgdvnEaqgyapOGC4+STvrcb0NkJQ+Dfh2t0bpLRx7xR3yKAn4f/838kazpqcvlrjOWCYQkiYSYUX7sVSU9Fe5EleVCSo3CgMlKDz7nyXS/KgKIWKoayFCjmzIVX7opMMm822iDpc9F8QDhXmAwB48gew78QbkU7tnXujEUlky147lBVBm/qhvUqlcr9OECqy/rVfnDzWYMLd02y5q2ObLL0l9mreXddrSjL0AFXT+w/0FIF6FgWMGK2zYhaJ/iPbH5KAGtCmrnuyaM2KCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB6606.namprd11.prod.outlook.com (2603:10b6:510:1b1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Tue, 15 Aug
 2023 13:56:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6678.022; Tue, 15 Aug 2023
 13:56:11 +0000
Date: Tue, 15 Aug 2023 09:56:04 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH v2 2/3] drm/i915/guc: Close deregister-context race
 against CT-loss
Message-ID: <ZNuD9JdmoYhYJ+G5@intel.com>
References: <20230815011210.1188379-1-alan.previn.teres.alexis@intel.com>
 <20230815011210.1188379-3-alan.previn.teres.alexis@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230815011210.1188379-3-alan.previn.teres.alexis@intel.com>
X-ClientProxiedBy: BYAPR08CA0033.namprd08.prod.outlook.com
 (2603:10b6:a03:100::46) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB6606:EE_
X-MS-Office365-Filtering-Correlation-Id: 13f32e69-fae9-4f07-42f9-08db9d9761c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XvvGUmlhldAOPirNcq1z5u4uG78akjWaFigOsy6ISbjP879jxtOJPlBS1LVDvGp3oaKTBecnbF66eoYGJkbmE6o/UG0mxMHa9Izj8SgApblJzrwDMPlJLHBAkhFcVQlePdIhXE0Bde7CWpA5PlW+7cLk66/vBIMYDpSLhYSazxIX00V3WB4bEY3u7Vp+t2TxacDBkbKxkCUpqsAGeCISqX8vrYzwjEXFzUg08gYFOIpH2niS+y9QhWGYxCwoF3LO644s6fRweop4wu374udWBbIwZ4mJkDo2DR+L32oBHqGl5MhV5rrmXwoQskM2IFpN9Wwq4XmQP7E3e+jzazv8+gd5X4Plc7/MouQDiwIaCg0ZsEfh2N9sMpnSOm+kqDYg7FgUfJdkkeFBK5GgOGf5NdJIrsPMCTLk2EsgHDXffMxiQhwg2EMnXF0GFbam3Bz/ZxnD1Y9LGy3prQxLo2ohd3WnYfR+DQuPQOh21L5Fk1Rs6NIocj7E2ujjSLH8PTCrLM56Rr+9c1nOlWmkXNVru+B1n7Db39ladcyPM+PhPH27TeJ23LY9+sC6sf5TQNB0dtJE/6QR3emV87g5IycCjWdjIHmtb6f8A9l+6WC1B7g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(451199024)(1800799009)(186009)(478600001)(6486002)(38100700002)(82960400001)(86362001)(36756003)(2616005)(6506007)(66476007)(66556008)(6636002)(66946007)(316002)(5660300002)(41300700001)(26005)(6666004)(83380400001)(107886003)(450100002)(37006003)(54906003)(6512007)(4326008)(6862004)(2906002)(8676002)(44832011)(8936002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TfZPeF3V7VsnAHQfPBCvmLmHJ6dZuKrH5Mk3v63jGPcQ3LrHoDJV9oCv7+Jt?=
 =?us-ascii?Q?nm8GhBQQWf6zgZh9aalyjG81UZqDfTfgHRD8d5CANdRzMYsk7mlHIBNGc6pT?=
 =?us-ascii?Q?AzI2tJ8sDaQsoAxnU6TmsAqWnH46Yf71YVMC48LCVrPhv9zAL1XOq+SLckZ4?=
 =?us-ascii?Q?j7PTrJD4ZuBaie0HyLuCQIOVin40a7Dkn2K5sizMF+rE5oHsStOomrqZScxT?=
 =?us-ascii?Q?YvCeIx6HXHu//YH31EvpMyd3yZ+u4XXxaQqlnPJ4DEmJnW9AtP3JD0Aj2AWy?=
 =?us-ascii?Q?yGi1j2mG82RC8pEIPSEDNqxzuuNzbGoX1JcQpAynYeZKb24768Jav0EWiUwv?=
 =?us-ascii?Q?kInwzrhrLjS1RVnmHfikVhGcdAOcxaSziRUg/vLMbYQEtv36DNFeFZNSR5iW?=
 =?us-ascii?Q?hKY5fK5GnALVzVgmK6+vEpzNyLRMSMNVRbjB/IwVJyUkHYl8iGCQg2a4330w?=
 =?us-ascii?Q?xKhsF0ar2C0IGICaPVE8TKbYUcaD8EbVTvIxCo1ubRBqTjaEtTEnDDCnw67c?=
 =?us-ascii?Q?vVlFeAORwMR1l8hRQwWJx2X+qQBeOCEUu/gZAMQ0dXOjMUkcNYWUnJGTsPpa?=
 =?us-ascii?Q?r6p1ssjOCqNHbTZsgGIXGVDtj1tBwfJh4Bmn/wQo2gDfChiD8dIeSN5b7DT4?=
 =?us-ascii?Q?RfGuh9W59ITRDWK5Qtt+wsC+iYB2HVErIYBYrjO9p8kq08K9E2j8zxtEm96W?=
 =?us-ascii?Q?3qBMDoOr8soBOBwaEkuk4hJHC7KY/zS4xTX2Hqr658zmfEYcKlMI4Sl32Fte?=
 =?us-ascii?Q?9lUMdriZrrMt1PtPRl1TM9uw6RLbVXjst8txX4DU2eQcd1kOacA8ycIukIup?=
 =?us-ascii?Q?u+MzsLuALvF/6H3aRt6kkbaSAxhhenUoj2WojoXQZw29BAVF3nGywhoPdEqF?=
 =?us-ascii?Q?uzvpO6OwVRWCLi/tXJDON0i7R/ufCIbF3OwGWL0vmF7V+m5aYaUYGG7neygD?=
 =?us-ascii?Q?N39yhkFQ/cQ8l+iIR/03bg1H6ZsIbvyxFFkjwlOBWjxF9u2KsqIjf+3ETReF?=
 =?us-ascii?Q?rRxSheBZARZyK4zZDXpdFCVRbuQADlqrWcE2xSLPqt1cvhODCZv01k/duh3z?=
 =?us-ascii?Q?iZoqWJbHIOMsMGYj5lc6H8kNhREMflVBHXCwg5+43brzdnLR+Z+f1A3ldX15?=
 =?us-ascii?Q?nPZzBdNY/CL2iQu8gnXfPAoZPL8iYJlmSM1lJ0kXrY8ZWtUC9UqLSwrGmAkz?=
 =?us-ascii?Q?YQBNKhuQDEX087HRDvtxiHcRe9qfp0Q8s/ZAhPNNWbNMH8WCj5bEd7eeRgfB?=
 =?us-ascii?Q?6CsbZulSIg74OopwfH8nmJzXdoPhrQGSZuCjmTJcFJ1V6WuoISuCH2tiNE3t?=
 =?us-ascii?Q?ho1IPwHYLIf7HQyUEXylamK12roP1ASe1mIbi0OiLcD9XSSRHoBzWFvtz+9N?=
 =?us-ascii?Q?re7T4cPBvqz0fGHgO2RByz1cVMf7D+7iQtUaWO64dbEHojHKkK3Ljr5gTNRH?=
 =?us-ascii?Q?dlVTDHqYeVqnzjfwZmtsNFR1p5xlZxaxef5U6Fkzfv7xZnT3dFyQEPlRQemw?=
 =?us-ascii?Q?e28298X8bJmWdw3Jb433dcjCohDuL7V2M6rQZ9GzXnOJe1/BAbNx/lVFgvA6?=
 =?us-ascii?Q?XI9XftMWhEFC2z2HRmzmnuqeGhMyE6vKSpalkYv/vz2jqFjlImN3JgA8BjD3?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13f32e69-fae9-4f07-42f9-08db9d9761c1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2023 13:56:11.5170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g0QX0BvD+IRcmm9VbZSmGQAzf8+zJ/Qw+56v6Nl9MnJz4FrqCmbZTT2M1a9Y6zZcbsZzG3ekSbFSPpTWIjGIvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6606
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
Cc: intel-gfx@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Aug 14, 2023 at 06:12:09PM -0700, Alan Previn wrote:
> If we are at the end of suspend or very early in resume
> its possible an async fence signal could lead us to the
> execution of the context destruction worker (after the
> prior worker flush).
> 
> Even if checking that the CT is enabled before calling
> destroyed_worker_func, guc_lrc_desc_unpin may still fail
> because in corner cases, as we traverse the GuC's
> context-destroy list, the CT could get disabled in the mid
> of it right before calling the GuC's CT send function.
> 
> We've witnessed this race condition once every ~6000-8000
> suspend-resume cycles while ensuring workloads that render
> something onscreen is continuously started just before
> we suspend (and the workload is small enough to complete
> and trigger the queued engine/context free-up either very
> late in suspend or very early in resume).
> 
> In such a case, we need to unroll the unpin process because
> guc-lrc-unpin takes a gt wakeref which only gets released in
> the G2H IRQ reply that never comes through in this corner
> case. That will cascade into a kernel hang later at the tail
> end of suspend in this function:
> 
>    intel_wakeref_wait_for_idle(&gt->wakeref)
>    (called by) - intel_gt_pm_wait_for_idle
>    (called by) - wait_for_suspend
> 
> Doing this unroll and keeping the context in the GuC's
> destroy-list will allow the context to get picked up on
> the next destroy worker invocation or purged as part of a
> major GuC sanitization or reset flow.
> 
> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 40 +++++++++++++++++--
>  1 file changed, 36 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 050572bb8dbe..ddb4ee4c4e51 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -235,6 +235,13 @@ set_context_destroyed(struct intel_context *ce)
>  	ce->guc_state.sched_state |= SCHED_STATE_DESTROYED;
>  }
>  
> +static inline void
> +clr_context_destroyed(struct intel_context *ce)
> +{
> +	lockdep_assert_held(&ce->guc_state.lock);
> +	ce->guc_state.sched_state &= ~SCHED_STATE_DESTROYED;
> +}
> +
>  static inline bool context_pending_disable(struct intel_context *ce)
>  {
>  	return ce->guc_state.sched_state & SCHED_STATE_PENDING_DISABLE;
> @@ -3175,7 +3182,7 @@ static void guc_context_close(struct intel_context *ce)
>  	spin_unlock_irqrestore(&ce->guc_state.lock, flags);
>  }
>  
> -static inline void guc_lrc_desc_unpin(struct intel_context *ce)
> +static inline int guc_lrc_desc_unpin(struct intel_context *ce)
>  {
>  	struct intel_guc *guc = ce_to_guc(ce);
>  	struct intel_gt *gt = guc_to_gt(guc);
> @@ -3199,10 +3206,20 @@ static inline void guc_lrc_desc_unpin(struct intel_context *ce)
>  	if (unlikely(disabled)) {
>  		release_guc_id(guc, ce);
>  		__guc_context_destroy(ce);
> -		return;
> +		return 0;
> +	}
> +
> +	if (deregister_context(ce, ce->guc_id.id)) {
> +		/* Seal race with concurrent suspend by unrolling */
> +		spin_lock_irqsave(&ce->guc_state.lock, flags);
> +		set_context_registered(ce);
> +		clr_context_destroyed(ce);
> +		intel_gt_pm_put(gt);

how sure we are this is not calling unbalanced puts?
could we wrap this in some existent function to make this clear?

> +		spin_unlock_irqrestore(&ce->guc_state.lock, flags);
> +		return -ENODEV;
>  	}
>  
> -	deregister_context(ce, ce->guc_id.id);
> +	return 0;
>  }
>  
>  static void __guc_context_destroy(struct intel_context *ce)
> @@ -3270,7 +3287,22 @@ static void deregister_destroyed_contexts(struct intel_guc *guc)
>  		if (!ce)
>  			break;
>  
> -		guc_lrc_desc_unpin(ce);
> +		if (guc_lrc_desc_unpin(ce)) {
> +			/*
> +			 * This means GuC's CT link severed mid-way which could happen
> +			 * in suspend-resume corner cases. In this case, put the
> +			 * context back into the destroyed_contexts list which will
> +			 * get picked up on the next context deregistration event or
> +			 * purged in a GuC sanitization event (reset/unload/wedged/...).
> +			 */
> +			spin_lock_irqsave(&guc->submission_state.lock, flags);
> +			list_add_tail(&ce->destroyed_link,
> +				      &guc->submission_state.destroyed_contexts);
> +			spin_unlock_irqrestore(&guc->submission_state.lock, flags);
> +			/* Bail now since the list might never be emptied if h2gs fail */
> +			break;
> +		}
> +
>  	}
>  }
>  
> -- 
> 2.39.0
> 
