Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4C2756DEF
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 22:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E0F010E2B5;
	Mon, 17 Jul 2023 20:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 110ED10E153;
 Mon, 17 Jul 2023 20:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689624359; x=1721160359;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pyQA8taa7W0N+6zRoeUdSkvWvX2K746iWwnZrKIQuwA=;
 b=FAf3qd1CHKI8AmzZMilZrk60cMLOGs1YhvWcMQAPT5n9JK2KapWfV2zR
 5Q//eoZD9M0PQhRhmXZiM8UhQLK7Gb2MxpqDLZ7Opp1pPV5vJ4zTRE8xM
 mLkxDtpJ/ugGXtVCofBSv1HgEZ4Fg81XTs7RNxqbFqpggNtdkxSdDj9rB
 JTvIb4cRuEON1DONW09Wgvj9D68I2qN9EXOxw2r3Z7Zk+N/M44g808D2c
 CiSSD19Aruhb6EDHhZzuNewxbsTRhC9FHDjLFHcITBDTl8gTHBvfg4kYi
 ij4sTTU7CUjm9TQm8m1TYA97c1gePQcwTrtADejUdYfwQhPTlup3s6HzI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="452401770"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="452401770"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2023 13:05:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="788772773"
X-IronPort-AV: E=Sophos;i="6.01,211,1684825200"; d="scan'208";a="788772773"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 17 Jul 2023 13:05:40 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 17 Jul 2023 13:05:40 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 17 Jul 2023 13:05:40 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 17 Jul 2023 13:05:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l//+ELDreGMwDlwGmxDZcJRU51M/XgAtssDHtE50ylcwmJQ8ccJfWM2BSEYvur41WRN0BZpcge9IIhou4ks5yxmpdIpblhXqHoe+w5GO0p0SwBfxTThiTpdGzJkevj2Ov4pduJD/nFeBLr2aMeTL41jVXvjzDEAPrdcd4QbrDnLp5CwnPk1C9kWbysc3/ypvTwzDkFeup6lB0ZpJuIhTHp7vqTRvtDCa208x96Jppemvqb/yXjy5HRBBb/8pwJTe9G3T9mzZJPlNukBQPIRuVvUtL2mDInblxdKFlcNcCtjIGNrbE8uSF14To6wt6OvixmR0xESGZ5SKRLIQRR1xVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEdY7Vocncr+/uhLqyzfQcBLkEQiIa99jOOezwtjV2M=;
 b=jWpaRN136/UKCzZZE98VsqTLJg9iQurqUOxLaTD/XdX4q0YQgoX/++4/8CKTsQ+zxL8CQTDoIApNPWssiTYGi8kHjQfmGnUCfqdjeqXRe2w0xDYIU3HwTorZUEvltmwxva1agira8MdpzOfnghMD3G74lw43DmNIfZCjGJi8at/bBbUougJSViCpqUXyo6oD+c42zB7ehsXMYKeSWUCV163w12Dv91qIOcFlt2FoC3I2h5yqj0M91MZAoy9Ad8e8Fo/y4oWR9+92VIp01PySalyb2+3JwhLqPF5ZgXDZO3IFpvA2ej9tvQGlSHDBl91rHaFKh6G3Kk1O+TuazL4q8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 CH3PR11MB8591.namprd11.prod.outlook.com (2603:10b6:610:1af::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.33; Mon, 17 Jul 2023 20:05:38 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::de6b:b5a9:e542:b41%5]) with mapi id 15.20.6588.031; Mon, 17 Jul 2023
 20:05:38 +0000
Date: Mon, 17 Jul 2023 13:05:35 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH v4 5/6] drm/i915/gt: Poll aux invalidation register bit
 on invalidation
Message-ID: <20230717200535.GE138014@mdroper-desk1.amr.corp.intel.com>
References: <20230717173059.422892-1-andi.shyti@linux.intel.com>
 <20230717173059.422892-6-andi.shyti@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230717173059.422892-6-andi.shyti@linux.intel.com>
X-ClientProxiedBy: BYAPR05CA0019.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::32) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|CH3PR11MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: f5906c41-1c5f-4217-5fc8-08db8701306a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3yaA+gKKOKfFiR9p+AzOqRA1rVB2SqJFzjshRilo6GAt+FhF/Vkovl6ndH3q7HIrjb9e1FEE2LnJwowkTa8vGzg4ocsopDBDoclAksyhVMgMLlAxsQ3sJlujhs9JFBGC02eTm8nC3+MlXwslFRqwFHLEZhQ7ff+V6i0pAaFf5oSamHzwoxsdRWisYIY5n4k9tz1ZAuFCtvDzvSYVI6+/heEE+2UoC5y+6t3RFxzasmGXt72WSdnLN0wXfnQxnadOgUfpev4Bqyr9w0aF9HnbH/G/pFi/YGRqDb41bcG266z25keJDYHcmkHijIe3J3nniEUOXSR5phwNy6GjmlToWPM9/txvnsfEpVG8qqas6+w/tvwuSArUyieoE0xWF/tBwTo7iZfBjYZMMTC5vNcVNrvajmxVZKb4xCVtfn7QgQ3JvDVhlD9tlMIzePpsDFbIZAwfAuy/Ffcx3ri75+UinABu+byI/J/mj4vb6KvbZ63y5/CuBd14REm6VPofK3O4d7HxSDh7W50yos5TLBNgR5WAQuBsEM8vRiWvVYIyDqs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(346002)(396003)(366004)(39860400002)(451199021)(2906002)(54906003)(478600001)(6666004)(6486002)(8676002)(33656002)(41300700001)(316002)(66476007)(66556008)(4326008)(66946007)(6916009)(82960400001)(6512007)(83380400001)(38100700002)(6506007)(5660300002)(1076003)(8936002)(86362001)(26005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RlrZb5tiBTBBBfZfHY5qnsS9euiI2qg71Oigzb+HVCgIHBkjpeVb2/GfdHtt?=
 =?us-ascii?Q?wRkX48Jn71EY0VDiHJWHL2NrgNqe5lMWsxtuyFf8eS9lEzp/5ENcdTleE0ZD?=
 =?us-ascii?Q?ogzILzJR4l+5EWQwRqtrNnI3/VJxFAa0gHhXZmBJGBaebXzR8a4QISiXaVQE?=
 =?us-ascii?Q?rmbNYEVVtozg+qWwZ+SNyErXX4jeHHzJ5bOsuLUkNBLL3YJxD/kSDahdoVfg?=
 =?us-ascii?Q?r4wTfgnC5GkJiNj08QAayhC9Vq2i5KtGMfOwDzlM9Bi2OzQVkoo86DUzNG13?=
 =?us-ascii?Q?Hb4sUaVmO38vJkSyM3QsE1PRHmybfS5aDB9m1+w2oNg5GpEGYhKo/17sCuC7?=
 =?us-ascii?Q?sRZwe/hZehD3jKXAtDH8sJOcw+/kb0RxdmaZZcAfsyN4AE5RnCevHU1dup2F?=
 =?us-ascii?Q?0xgKjb6Z/EttrzC6Ont+kaRiXYQgkvt/4B/w/YHk0k5vWaig/5HzWrbiHWek?=
 =?us-ascii?Q?iQrRvyuK0eIjhN1obDb81vmwCZ4ewpCZ9ECbJC9+O1vVHocYRarXneMxIgOw?=
 =?us-ascii?Q?QaPo0TKLLiR7LM+g1Fswjfy068BkcYlOzDHlgcQO3PotLUwgtz0oR/q9Q6uo?=
 =?us-ascii?Q?2E7lJE6oyHx+NpepuKHgdtDsBrYua7xb6K8ee+yYyQmP971hdRUn2sIZp6Fl?=
 =?us-ascii?Q?yvKpMaX1jNAJKafn53QlhaQ/ZLfcwh12vNX72utjv/3F/gVL2WRsT3nTdfIS?=
 =?us-ascii?Q?3DfQ6y6m38qtjvdU86f1DPugQfem7oLElMimG9/ZHbWgfxV2VlYNHROPxjvx?=
 =?us-ascii?Q?iNGdUS91eZraDFz4doLDf7dtXdNY5kex1zIMNc/Cw0yGQLdXd6LZI9ucEjYO?=
 =?us-ascii?Q?or/iA8VFlPdExyrmWE7YlK6VvQ9FfDIgx6teilivai5f+L0cFyuDg6E/JE2m?=
 =?us-ascii?Q?LRDAslWDx+M8+V22S3LDo/fnHbmj9bb0X/IuLxVmUJGptwMm+dYRtz6ZkGdl?=
 =?us-ascii?Q?hCDH4pSWVhlOIm/OqyUvRWGjW2zMrl1N5TFcpr7wgWjkRSqN/DpGNrnYTjr/?=
 =?us-ascii?Q?1G8AB5Yj9pz8mj7CF8g5QyiVO4upJDoFjD7ZtvLxCmSaFL03hJ+yLNTLAW7d?=
 =?us-ascii?Q?OrrEh/tnU9adwGpRMyTaryIFLFztHYdytkfY5JQQH6fuFWlGnWyE96NxI0V3?=
 =?us-ascii?Q?bGuvWWfbDiJYC/bqPEl6MvN+0RbWqB1ievrKPvlvD8utym4v6QwNYCXxTEHr?=
 =?us-ascii?Q?PfO/XCOUtuMkxkcSXVAQS/PPdV6nkiXvFQ5t/+GpCQUBulwu13oSLKLkPxx2?=
 =?us-ascii?Q?duJzErE9s/8IvgzJGYZrBu8B8V4MK8DLG/hdlV6gry1tM8Izi/sh1YxuJHk4?=
 =?us-ascii?Q?oM6imcPdZMyn8i0BvPfcy+iYgc22hC4o0bro7H/NNkmfo5yusJp+IkUhzWpk?=
 =?us-ascii?Q?LYwM8l7yN9JrQfdtP/zOZJUuUepNuRumivhNRdiBydLDvgoXaGke4COWte71?=
 =?us-ascii?Q?tR7Ty722i7uEwXxbNiV8jCQP/WXhVevXa/AYlz+qAvt5vjCslNwinVz794VK?=
 =?us-ascii?Q?hbguZ8RfXML0cJAKzctBhzLPf9nSStNVjU4zjC3mQ5sjYXxCEbkRpbyzgeef?=
 =?us-ascii?Q?QMLRWwZXUk9exhAK8mVO5s8490gqAdEvtoFq6J1g88K6HKAA/MrBUj9cAxu8?=
 =?us-ascii?Q?rQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5906c41-1c5f-4217-5fc8-08db8701306a
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2023 20:05:38.1553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0FzXh+czTLx8KnCmV4hrlauW42Du/sbgqJzHZjqEIOm/zRhruqUvmCnVJxctMUIk/rytJQTsP8NieDO5qVBRLojqSGicJWJB8p4tfg8eS8I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8591
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

On Mon, Jul 17, 2023 at 07:30:58PM +0200, Andi Shyti wrote:
> From: Jonathan Cavitt <jonathan.cavitt@intel.com>
> 
> For platforms that use Aux CCS, wait for aux invalidation to
> complete by checking the aux invalidation register bit is
> cleared.
> 
> Fixes: 972282c4cf24 ("drm/i915/gen12: Add aux table invalidate for all engines")
> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.8+
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/gen8_engine_cs.c     | 17 +++++++++++++----
>  drivers/gpu/drm/i915/gt/intel_gpu_commands.h |  1 +
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index aa2fb9d72745a..fbc70f3b7f2fd 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -174,6 +174,16 @@ u32 *gen12_emit_aux_table_inv(struct intel_gt *gt, u32 *cs, const i915_reg_t inv
>  	*cs++ = AUX_INV;
>  	*cs++ = MI_NOOP;

We only need qword alignment for sequences of commands, not each
individual command, right?  So technically we could drop this noop...

>  
> +	*cs++ = MI_SEMAPHORE_WAIT_TOKEN |
> +		MI_SEMAPHORE_REGISTER_POLL |
> +		MI_SEMAPHORE_POLL |
> +		MI_SEMAPHORE_SAD_EQ_SDD;
> +	*cs++ = 0;
> +	*cs++ = i915_mmio_reg_offset(inv_reg) + gsi_offset;
> +	*cs++ = 0;
> +	*cs++ = 0;
> +	*cs++ = MI_NOOP;

...and then we wouldn't need an extra one here.

If we drop the pair of noops, that would also change the # of dwords
farther down too.

> +
>  	return cs;
>  }
>  
> @@ -284,10 +294,9 @@ int gen12_emit_flush_rcs(struct i915_request *rq, u32 mode)
>  		else if (engine->class == COMPUTE_CLASS)
>  			flags &= ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>  
> +		count = 8;
>  		if (!HAS_FLAT_CCS(rq->engine->i915))

As noted on the earlier patch, we should probably make this check that
the platform actually has AuxCCS.  

Anyway, up to you whether you want to make that change or not.  The
extra noops don't actually hurt anything.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> -			count = 8 + 4;
> -		else
> -			count = 8;
> +			count += 10;
>  
>  		cs = intel_ring_begin(rq, count);
>  		if (IS_ERR(cs))
> @@ -330,7 +339,7 @@ int gen12_emit_flush_xcs(struct i915_request *rq, u32 mode)
>  			aux_inv = rq->engine->mask &
>  				~GENMASK(_BCS(I915_MAX_BCS - 1), BCS0);
>  			if (aux_inv)
> -				cmd += 4;
> +				cmd += 10;
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> index 5df7cce23197c..2bd8d98d21102 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> +++ b/drivers/gpu/drm/i915/gt/intel_gpu_commands.h
> @@ -121,6 +121,7 @@
>  #define   MI_SEMAPHORE_TARGET(engine)	((engine)<<15)
>  #define MI_SEMAPHORE_WAIT	MI_INSTR(0x1c, 2) /* GEN8+ */
>  #define MI_SEMAPHORE_WAIT_TOKEN	MI_INSTR(0x1c, 3) /* GEN12+ */
> +#define   MI_SEMAPHORE_REGISTER_POLL	(1 << 16)
>  #define   MI_SEMAPHORE_POLL		(1 << 15)
>  #define   MI_SEMAPHORE_SAD_GT_SDD	(0 << 12)
>  #define   MI_SEMAPHORE_SAD_GTE_SDD	(1 << 12)
> -- 
> 2.40.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
