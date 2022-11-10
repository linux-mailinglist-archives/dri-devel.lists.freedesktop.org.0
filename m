Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A05D56240FD
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 12:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0CD10E714;
	Thu, 10 Nov 2022 11:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864A010E6DA;
 Thu, 10 Nov 2022 11:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668078458; x=1699614458;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=IsNq6/Ft1iTpHnw5oawzIriKRv5do41LbNMZ4pqWXqo=;
 b=TTvJQeuH8vyswGjWuKRqrSYXIf3zm/hyzorBVe0GUvQq8YTeeyLYPxux
 td1Fj1ZUycKI6QQIoA9to4sw1v4PkrE47DC4m7ntJB1ONfQk4GrWROrYT
 XVM5rSa/HBqAjJ6HcxLanHzdwHskHZ9h3IYv5nq3gVdLpc1TSaXuQi6Jv
 97A8qx0gokhAxV4ZdxtSsj5wvYcSw4v2pNlRNxFz4No6ZfcrnFQ4sG5LU
 CIvAipgrAHuA5UmyeISniKr68piENLDvPGXEC5ythq5dNfOUBRFsoeb5J
 pVvtlNbEV0dQMsBaOH3iFi9zEXuyd1+/i4Lm/dL3Vnh/waZxKqAJnlM9l A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="308905806"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="308905806"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 03:07:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="615060557"
X-IronPort-AV: E=Sophos;i="5.96,153,1665471600"; d="scan'208";a="615060557"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.23.198])
 ([10.213.23.198])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 03:07:16 -0800
Message-ID: <6ebca1da-47c4-9ced-c77c-1083ba2e02ed@intel.com>
Date: Thu, 10 Nov 2022 12:07:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [Intel-gfx] [PATCH v3] drm/i915: Partial abandonment of legacy
 DRM logging macros
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
References: <20221108114950.2017869-1-tvrtko.ursulin@linux.intel.com>
 <20221109104633.2579245-1-tvrtko.ursulin@linux.intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20221109104633.2579245-1-tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09.11.2022 11:46, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Convert some usages of legacy DRM logging macros into versions which tell
> us on which device have the events occurred.
> 
> v2:
>   * Don't have struct drm_device as local. (Jani, Ville)
> 
> v3:
>   * Store gt, not i915, in workaround list. (John)


Neither gt neither i915 does fit into wa list IMHO.
The best solution would be provide context (i915/gt/whatever)
as a function parameter, every time it is necessary.
On the other side it should not block the patch.
More below.

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com> # v2
> Acked-by: Jani Nikula <jani.nikula@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_context.c   |  2 +-
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 26 ++++++++----
>   .../drm/i915/gt/intel_execlists_submission.c  | 13 +++---
>   drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |  4 +-
>   drivers/gpu/drm/i915/gt/intel_gt.c            |  4 +-
>   drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  8 ++--
>   drivers/gpu/drm/i915/gt/intel_rps.c           |  6 ++-
>   drivers/gpu/drm/i915/gt/intel_workarounds.c   | 42 +++++++++++--------
>   .../gpu/drm/i915/gt/intel_workarounds_types.h |  3 ++
>   .../gpu/drm/i915/gt/selftest_workarounds.c    |  4 +-
>   drivers/gpu/drm/i915/i915_debugfs.c           |  4 +-
>   drivers/gpu/drm/i915/i915_gem.c               |  2 +-
>   drivers/gpu/drm/i915/i915_getparam.c          |  2 +-
>   drivers/gpu/drm/i915/i915_irq.c               | 12 +++---
>   drivers/gpu/drm/i915/i915_perf.c              | 14 ++++---
>   drivers/gpu/drm/i915/i915_query.c             | 12 +++---
>   drivers/gpu/drm/i915/i915_sysfs.c             |  3 +-
>   drivers/gpu/drm/i915/i915_vma.c               | 16 +++----
>   drivers/gpu/drm/i915/intel_uncore.c           | 21 ++++++----
>   19 files changed, 117 insertions(+), 81 deletions(-)
> 

(...)

> @@ -1749,7 +1755,7 @@ wa_list_apply(struct intel_gt *gt, const struct i915_wa_list *wal)
>   				intel_gt_mcr_read_any_fw(gt, wa->mcr_reg) :
>   				intel_uncore_read_fw(uncore, wa->reg);
>   
> -			wa_verify(wa, val, wal->name, "application");
> +			wa_verify(wal->gt, wa, val, wal->name, "application");

This looks confusing at 1st sight, why wa_verify(wal->gt,...) and not 
wa_verify(gt,...). Can they differ? and similar questions as in case of 
redundant vars.
The same apply to wal->engine_name, which is almost unused anyway?
Also AFAIK there is always sequence:
1. wa_init_start
2. *init_workarounds*
3. wa_init_finish - btw funny name.
Why not 1 and 3 embed in 2? Do we need this sequence.

Anyway all these comments are for wa handling, which should be addressed 
in other patch. So my r-b still holds, either with wal->i915, either 
with wal->gt.

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej





>   		}
>   	}
>   
> @@ -1779,7 +1785,7 @@ static bool wa_list_verify(struct intel_gt *gt,
>   	intel_uncore_forcewake_get__locked(uncore, fw);
>   
>   	for (i = 0, wa = wal->list; i < wal->count; i++, wa++)
> -		ok &= wa_verify(wa, wa->is_mcr ?
> +		ok &= wa_verify(wal->gt, wa, wa->is_mcr ?
>   				intel_gt_mcr_read_any_fw(gt, wa->mcr_reg) :
>   				intel_uncore_read_fw(uncore, wa->reg),
>   				wal->name, from);
> @@ -2127,7 +2133,7 @@ void intel_engine_init_whitelist(struct intel_engine_cs *engine)
>   	struct drm_i915_private *i915 = engine->i915;
>   	struct i915_wa_list *w = &engine->whitelist;
>   
> -	wa_init_start(w, "whitelist", engine->name);
> +	wa_init_start(w, engine->gt, "whitelist", engine->name);
>   
>   	if (IS_PONTEVECCHIO(i915))
>   		pvc_whitelist_build(engine);
> @@ -3012,7 +3018,7 @@ void intel_engine_init_workarounds(struct intel_engine_cs *engine)
>   	if (GRAPHICS_VER(engine->i915) < 4)
>   		return;
>   
> -	wa_init_start(wal, "engine", engine->name);
> +	wa_init_start(wal, engine->gt, "engine", engine->name);
>   	engine_init_workarounds(engine, wal);
>   	wa_init_finish(wal);
>   }
> @@ -3193,7 +3199,7 @@ static int engine_wa_list_verify(struct intel_context *ce,
>   		if (mcr_range(rq->engine->i915, i915_mmio_reg_offset(wa->reg)))
>   			continue;
>   
> -		if (!wa_verify(wa, results[i], wal->name, from))
> +		if (!wa_verify(wal->gt, wa, results[i], wal->name, from))
>   			err = -ENXIO;
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
> index 7c8b01d00043..e14188120e66 100644
> --- a/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_workarounds_types.h
> @@ -10,6 +10,8 @@
>   
>   #include "i915_reg_defs.h"
>   
> +struct intel_gt;
> +
>   struct i915_wa {
>   	union {
>   		i915_reg_t	reg;
> @@ -24,6 +26,7 @@ struct i915_wa {
>   };
>   
>   struct i915_wa_list {
> +	struct intel_gt	*gt;
>   	const char	*name;
>   	const char	*engine_name;
>   	struct i915_wa	*list;
> diff --git a/drivers/gpu/drm/i915/gt/selftest_workarounds.c b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> index 21b1edc052f8..711014bb53d9 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_workarounds.c
> @@ -66,14 +66,14 @@ reference_lists_init(struct intel_gt *gt, struct wa_lists *lists)
>   
>   	memset(lists, 0, sizeof(*lists));
>   
> -	wa_init_start(&lists->gt_wa_list, "GT_REF", "global");
> +	wa_init_start(&lists->gt_wa_list, gt, "GT_REF", "global");
>   	gt_init_workarounds(gt, &lists->gt_wa_list);
>   	wa_init_finish(&lists->gt_wa_list);
>   
>   	for_each_engine(engine, gt, id) {
>   		struct i915_wa_list *wal = &lists->engine[id].wa_list;
>   
> -		wa_init_start(wal, "REF", engine->name);
> +		wa_init_start(wal, gt, "REF", engine->name);
>   		engine_init_workarounds(engine, wal);
>   		wa_init_finish(wal);
>   
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index ae987e92251d..6c7ac73b69a5 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -688,8 +688,8 @@ i915_drop_caches_set(void *data, u64 val)
>   	unsigned int flags;
>   	int ret;
>   
> -	DRM_DEBUG("Dropping caches: 0x%08llx [0x%08llx]\n",
> -		  val, val & DROP_ALL);
> +	drm_dbg(&i915->drm, "Dropping caches: 0x%08llx [0x%08llx]\n",
> +		val, val & DROP_ALL);
>   
>   	ret = gt_drop_caches(to_gt(i915), val);
>   	if (ret)
> diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
> index 299f94a9fb87..8132743ca87e 100644
> --- a/drivers/gpu/drm/i915/i915_gem.c
> +++ b/drivers/gpu/drm/i915/i915_gem.c
> @@ -1286,7 +1286,7 @@ int i915_gem_open(struct drm_i915_private *i915, struct drm_file *file)
>   	struct i915_drm_client *client;
>   	int ret = -ENOMEM;
>   
> -	DRM_DEBUG("\n");
> +	drm_dbg(&i915->drm, "\n");
>   
>   	file_priv = kzalloc(sizeof(*file_priv), GFP_KERNEL);
>   	if (!file_priv)
> diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
> index 3047e80e1163..61ef2d9cfa62 100644
> --- a/drivers/gpu/drm/i915/i915_getparam.c
> +++ b/drivers/gpu/drm/i915/i915_getparam.c
> @@ -179,7 +179,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
>   		value = i915_perf_oa_timestamp_frequency(i915);
>   		break;
>   	default:
> -		DRM_DEBUG("Unknown parameter %d\n", param->param);
> +		drm_dbg(&i915->drm, "Unknown parameter %d\n", param->param);
>   		return -EINVAL;
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
> index b0180ea38de0..6c20817f8967 100644
> --- a/drivers/gpu/drm/i915/i915_irq.c
> +++ b/drivers/gpu/drm/i915/i915_irq.c
> @@ -1086,8 +1086,9 @@ static void ivb_parity_work(struct work_struct *work)
>   		kobject_uevent_env(&dev_priv->drm.primary->kdev->kobj,
>   				   KOBJ_CHANGE, parity_event);
>   
> -		DRM_DEBUG("Parity error: Slice = %d, Row = %d, Bank = %d, Sub bank = %d.\n",
> -			  slice, row, bank, subbank);
> +		drm_dbg(&dev_priv->drm,
> +			"Parity error: Slice = %d, Row = %d, Bank = %d, Sub bank = %d.\n",
> +			slice, row, bank, subbank);
>   
>   		kfree(parity_event[4]);
>   		kfree(parity_event[3]);
> @@ -2774,7 +2775,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>   		master_ctl = raw_reg_read(regs, GEN11_GFX_MSTR_IRQ);
>   		raw_reg_write(regs, GEN11_GFX_MSTR_IRQ, master_ctl);
>   	} else {
> -		DRM_ERROR("Tile not supported: 0x%08x\n", master_tile_ctl);
> +		drm_err(&i915->drm, "Tile not supported: 0x%08x\n",
> +			master_tile_ctl);
>   		dg1_master_intr_enable(regs);
>   		return IRQ_NONE;
>   	}
> @@ -3940,7 +3942,7 @@ static void i8xx_error_irq_ack(struct drm_i915_private *i915,
>   static void i8xx_error_irq_handler(struct drm_i915_private *dev_priv,
>   				   u16 eir, u16 eir_stuck)
>   {
> -	DRM_DEBUG("Master Error: EIR 0x%04x\n", eir);
> +	drm_dbg(&dev_priv->drm, "Master Error: EIR 0x%04x\n", eir);
>   
>   	if (eir_stuck)
>   		drm_dbg(&dev_priv->drm, "EIR stuck: 0x%04x, masked\n",
> @@ -3975,7 +3977,7 @@ static void i9xx_error_irq_ack(struct drm_i915_private *dev_priv,
>   static void i9xx_error_irq_handler(struct drm_i915_private *dev_priv,
>   				   u32 eir, u32 eir_stuck)
>   {
> -	DRM_DEBUG("Master Error, EIR 0x%08x\n", eir);
> +	drm_dbg(&dev_priv->drm, "Master Error, EIR 0x%08x\n", eir);
>   
>   	if (eir_stuck)
>   		drm_dbg(&dev_priv->drm, "EIR stuck: 0x%08x, masked\n",
> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 0dd597a7a11f..9e6f060592d8 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -530,9 +530,9 @@ static bool oa_buffer_check_unlocked(struct i915_perf_stream *stream)
>   
>   		if (OA_TAKEN(hw_tail, tail) > report_size &&
>   		    __ratelimit(&stream->perf->tail_pointer_race))
> -			DRM_NOTE("unlanded report(s) head=0x%x "
> -				 "tail=0x%x hw_tail=0x%x\n",
> -				 head, tail, hw_tail);
> +			drm_notice(&stream->uncore->i915->drm,
> +				   "unlanded report(s) head=0x%x tail=0x%x hw_tail=0x%x\n",
> +				   head, tail, hw_tail);
>   
>   		stream->oa_buffer.tail = gtt_offset + tail;
>   		stream->oa_buffer.aging_tail = gtt_offset + hw_tail;
> @@ -1015,7 +1015,8 @@ static int gen7_append_oa_reports(struct i915_perf_stream *stream,
>   		 */
>   		if (report32[0] == 0) {
>   			if (__ratelimit(&stream->perf->spurious_report_rs))
> -				DRM_NOTE("Skipping spurious, invalid OA report\n");
> +				drm_notice(&uncore->i915->drm,
> +					   "Skipping spurious, invalid OA report\n");
>   			continue;
>   		}
>   
> @@ -1602,8 +1603,9 @@ static void i915_oa_stream_destroy(struct i915_perf_stream *stream)
>   	free_noa_wait(stream);
>   
>   	if (perf->spurious_report_rs.missed) {
> -		DRM_NOTE("%d spurious OA report notices suppressed due to ratelimiting\n",
> -			 perf->spurious_report_rs.missed);
> +		drm_notice(&gt->i915->drm,
> +			   "%d spurious OA report notices suppressed due to ratelimiting\n",
> +			   perf->spurious_report_rs.missed);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> index 6ec9c9fb7b0d..00871ef99792 100644
> --- a/drivers/gpu/drm/i915/i915_query.c
> +++ b/drivers/gpu/drm/i915/i915_query.c
> @@ -250,8 +250,9 @@ static int query_perf_config_data(struct drm_i915_private *i915,
>   		return total_size;
>   
>   	if (query_item->length < total_size) {
> -		DRM_DEBUG("Invalid query config data item size=%u expected=%u\n",
> -			  query_item->length, total_size);
> +		drm_dbg(&i915->drm,
> +			"Invalid query config data item size=%u expected=%u\n",
> +			query_item->length, total_size);
>   		return -EINVAL;
>   	}
>   
> @@ -418,9 +419,10 @@ static int query_perf_config_list(struct drm_i915_private *i915,
>   	} while (n_configs > alloc);
>   
>   	if (query_item->length < sizeof_perf_config_list(n_configs)) {
> -		DRM_DEBUG("Invalid query config list item size=%u expected=%zu\n",
> -			  query_item->length,
> -			  sizeof_perf_config_list(n_configs));
> +		drm_dbg(&i915->drm,
> +			"Invalid query config list item size=%u expected=%zu\n",
> +			query_item->length,
> +			sizeof_perf_config_list(n_configs));
>   		kfree(oa_config_ids);
>   		return -EINVAL;
>   	}
> diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
> index 1e2750210831..595e8b574990 100644
> --- a/drivers/gpu/drm/i915/i915_sysfs.c
> +++ b/drivers/gpu/drm/i915/i915_sysfs.c
> @@ -218,7 +218,8 @@ static const struct bin_attribute error_state_attr = {
>   static void i915_setup_error_capture(struct device *kdev)
>   {
>   	if (sysfs_create_bin_file(&kdev->kobj, &error_state_attr))
> -		DRM_ERROR("error_state sysfs setup failed\n");
> +		drm_err(&kdev_minor_to_i915(kdev)->drm,
> +			"error_state sysfs setup failed\n");
>   }
>   
>   static void i915_teardown_error_capture(struct device *kdev)
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index c39488eb9eeb..3b969d679c1e 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -73,14 +73,16 @@ static void vma_print_allocator(struct i915_vma *vma, const char *reason)
>   	char buf[512];
>   
>   	if (!vma->node.stack) {
> -		DRM_DEBUG_DRIVER("vma.node [%08llx + %08llx] %s: unknown owner\n",
> -				 vma->node.start, vma->node.size, reason);
> +		drm_dbg(&to_i915(vma->obj->base.dev)->drm
> +			"vma.node [%08llx + %08llx] %s: unknown owner\n",
> +			vma->node.start, vma->node.size, reason);
>   		return;
>   	}
>   
>   	stack_depot_snprint(vma->node.stack, buf, sizeof(buf), 0);
> -	DRM_DEBUG_DRIVER("vma.node [%08llx + %08llx] %s: inserted at %s\n",
> -			 vma->node.start, vma->node.size, reason, buf);
> +	drm_dbg(&to_i915(vma->obj->base.dev)->drm,
> +		"vma.node [%08llx + %08llx] %s: inserted at %s\n",
> +		vma->node.start, vma->node.size, reason, buf);
>   }
>   
>   #else
> @@ -782,9 +784,9 @@ i915_vma_insert(struct i915_vma *vma, struct i915_gem_ww_ctx *ww,
>   	 * attempt to find space.
>   	 */
>   	if (size > end) {
> -		DRM_DEBUG("Attempting to bind an object larger than the aperture: request=%llu > %s aperture=%llu\n",
> -			  size, flags & PIN_MAPPABLE ? "mappable" : "total",
> -			  end);
> +		drm_dbg(&to_i915(vma->obj->base.dev)->drm,
> +			"Attempting to bind an object larger than the aperture: request=%llu > %s aperture=%llu\n",
> +			size, flags & PIN_MAPPABLE ? "mappable" : "total", end);
>   		return -ENOSPC;
>   	}
>   
> diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
> index 2a3e2869fe71..6c25c9e7090a 100644
> --- a/drivers/gpu/drm/i915/intel_uncore.c
> +++ b/drivers/gpu/drm/i915/intel_uncore.c
> @@ -178,8 +178,9 @@ static inline void
>   fw_domain_wait_ack_clear(const struct intel_uncore_forcewake_domain *d)
>   {
>   	if (wait_ack_clear(d, FORCEWAKE_KERNEL)) {
> -		DRM_ERROR("%s: timed out waiting for forcewake ack to clear.\n",
> -			  intel_uncore_forcewake_domain_to_str(d->id));
> +		drm_err(&d->uncore->i915->drm,
> +			"%s: timed out waiting for forcewake ack to clear.\n",
> +			intel_uncore_forcewake_domain_to_str(d->id));
>   		add_taint_for_CI(d->uncore->i915, TAINT_WARN); /* CI now unreliable */
>   	}
>   }
> @@ -226,11 +227,12 @@ fw_domain_wait_ack_with_fallback(const struct intel_uncore_forcewake_domain *d,
>   		fw_clear(d, FORCEWAKE_KERNEL_FALLBACK);
>   	} while (!ack_detected && pass++ < 10);
>   
> -	DRM_DEBUG_DRIVER("%s had to use fallback to %s ack, 0x%x (passes %u)\n",
> -			 intel_uncore_forcewake_domain_to_str(d->id),
> -			 type == ACK_SET ? "set" : "clear",
> -			 fw_ack(d),
> -			 pass);
> +	drm_dbg(&d->uncore->i915->drm,
> +		"%s had to use fallback to %s ack, 0x%x (passes %u)\n",
> +		intel_uncore_forcewake_domain_to_str(d->id),
> +		type == ACK_SET ? "set" : "clear",
> +		fw_ack(d),
> +		pass);
>   
>   	return ack_detected ? 0 : -ETIMEDOUT;
>   }
> @@ -255,8 +257,9 @@ static inline void
>   fw_domain_wait_ack_set(const struct intel_uncore_forcewake_domain *d)
>   {
>   	if (wait_ack_set(d, FORCEWAKE_KERNEL)) {
> -		DRM_ERROR("%s: timed out waiting for forcewake ack request.\n",
> -			  intel_uncore_forcewake_domain_to_str(d->id));
> +		drm_err(&d->uncore->i915->drm,
> +			"%s: timed out waiting for forcewake ack request.\n",
> +			intel_uncore_forcewake_domain_to_str(d->id));
>   		add_taint_for_CI(d->uncore->i915, TAINT_WARN); /* CI now unreliable */
>   	}
>   }

