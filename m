Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 040416799CF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 14:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E6110E693;
	Tue, 24 Jan 2023 13:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74D410E683;
 Tue, 24 Jan 2023 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674567734; x=1706103734;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=fz5L/jHMy8+DFCd1++aOdYoKBo8rvQJUpj6dJeGxoto=;
 b=FbZYI5VpZlT78SsfgG1PRroDbFd/Oh8gjUHPuXsFTEymDMjFkTShSabQ
 ffD9i1vG+V0HY95NCmdUFbCptEPi48tQ1MXwyszp0vjTaArk27cWBeSI0
 GqKqKScW1rBQun8bfM9IDakpHNTsmik5w/o6X2i28X4pCVHYI7ASbGNSs
 ns48O9q+Pcfz0EYBBQA//Ennqymb0oOK2Mf8oyu4u4xvQONC8gyFXgZYq
 vjFVkMH16dLMB/6i01lsCOxNgxTBLWO4e25TGNmu1t4ZBvSyKWlI93VNV
 2diSfEma8f7WoBUPvL9Ym27AqFUItGlY0ZxV05kMMiMVU9qo1Mz4c/glo w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="323990838"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="323990838"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 05:42:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="750832563"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="750832563"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by FMSMGA003.fm.intel.com with ESMTP; 24 Jan 2023 05:42:12 -0800
Received: from [10.249.147.192] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.147.192])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 38F1B36377;
 Tue, 24 Jan 2023 13:42:11 +0000 (GMT)
Message-ID: <f567365d-71c3-3f31-b518-4ade65808c96@intel.com>
Date: Tue, 24 Jan 2023 14:42:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
Subject: Re: [PATCH 6/8] drm/i915/guc: Update GuC messages in intel_guc_log.c
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20230120164050.1765-1-michal.wajdeczko@intel.com>
 <20230120164050.1765-7-michal.wajdeczko@intel.com>
 <acc7f369-0bf3-52c1-a0ff-e050d0fbd882@intel.com>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <acc7f369-0bf3-52c1-a0ff-e050d0fbd882@intel.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 24.01.2023 00:01, John Harrison wrote:
> On 1/20/2023 08:40, Michal Wajdeczko wrote:
>> Use new macros to have common prefix that also include GT#.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/i915/gt/uc/intel_guc_log.c | 35 +++++++++++-----------
>>   1 file changed, 18 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> index 68331c538b0a..1d76497b783c 100644
>> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_log.c
>> @@ -12,6 +12,7 @@
>>   #include "i915_memcpy.h"
>>   #include "intel_guc_capture.h"
>>   #include "intel_guc_log.h"
>> +#include "intel_guc_print.h"
>>     #if defined(CONFIG_DRM_I915_DEBUG_GUC)
>>   #define GUC_LOG_DEFAULT_CRASH_BUFFER_SIZE    SZ_2M
>> @@ -39,7 +40,6 @@ struct guc_log_section {
>>   static void _guc_log_init_sizes(struct intel_guc_log *log)
>>   {
>>       struct intel_guc *guc = log_to_guc(log);
>> -    struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
>>       static const struct guc_log_section
>> sections[GUC_LOG_SECTIONS_LIMIT] = {
>>           {
>>               GUC_LOG_CRASH_MASK >> GUC_LOG_CRASH_SHIFT,
>> @@ -82,12 +82,12 @@ static void _guc_log_init_sizes(struct
>> intel_guc_log *log)
>>           }
>>             if (!IS_ALIGNED(log->sizes[i].bytes, log->sizes[i].units))
>> -            drm_err(&i915->drm, "Mis-aligned GuC log %s size: 0x%X vs
>> 0x%X!",
>> +            guc_err(guc, "Mis-aligned log %s size: 0x%X vs 0x%X!",
>>                   sections[i].name, log->sizes[i].bytes,
>> log->sizes[i].units);
>>           log->sizes[i].count = log->sizes[i].bytes /
>> log->sizes[i].units;
>>             if (!log->sizes[i].count) {
>> -            drm_err(&i915->drm, "Zero GuC log %s size!",
>> sections[i].name);
>> +            guc_err(guc, "Zero log %s size!", sections[i].name);
>>           } else {
>>               /* Size is +1 unit */
>>               log->sizes[i].count--;
>> @@ -95,14 +95,14 @@ static void _guc_log_init_sizes(struct
>> intel_guc_log *log)
>>             /* Clip to field size */
>>           if (log->sizes[i].count > sections[i].max) {
>> -            drm_err(&i915->drm, "GuC log %s size too large: %d vs %d!",
>> +            guc_err(guc, "log %s size too large: %d vs %d!",
>>                   sections[i].name, log->sizes[i].count + 1,
>> sections[i].max + 1);
>>               log->sizes[i].count = sections[i].max;
>>           }
>>       }
>>         if (log->sizes[GUC_LOG_SECTIONS_CRASH].units !=
>> log->sizes[GUC_LOG_SECTIONS_DEBUG].units) {
>> -        drm_err(&i915->drm, "Unit mis-match for GuC log crash and
>> debug sections: %d vs %d!",
>> +        guc_err(guc, "Unit mis-match for GuC log crash and debug
>> sections: %d vs %d!",
> -> "for log, crash and debug sections"

hmm, not sure, message seems to be about mismatch between just two
buffers/sections, so maybe better to rephrase and use section names:

guc_err("Unit mis-match between log sections: %s = %d vs %s = %d\n",
	log->sizes[GUC_LOG_SECTIONS_CRASH].name,
	log->sizes[GUC_LOG_SECTIONS_CRASH].units,
	log->sizes[GUC_LOG_SECTIONS_DEBUG].name,
	log->sizes[GUC_LOG_SECTIONS_DEBUG].units);


> 
>>               log->sizes[GUC_LOG_SECTIONS_CRASH].units,
>>               log->sizes[GUC_LOG_SECTIONS_DEBUG].units);
>>           log->sizes[GUC_LOG_SECTIONS_CRASH].units =
>> log->sizes[GUC_LOG_SECTIONS_DEBUG].units;
>> @@ -374,6 +374,7 @@ size_t intel_guc_get_log_buffer_offset(struct
>> intel_guc_log *log,
>>     static void _guc_log_copy_debuglogs_for_relay(struct intel_guc_log
>> *log)
>>   {
>> +    struct intel_guc *guc = log_to_guc(log);
>>       unsigned int buffer_size, read_offset, write_offset,
>> bytes_to_copy, full_cnt;
>>       struct guc_log_buffer_state *log_buf_state,
>> *log_buf_snapshot_state;
>>       struct guc_log_buffer_state log_buf_state_local;
>> @@ -383,7 +384,7 @@ static void
>> _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>>         mutex_lock(&log->relay.lock);
>>   -    if (WARN_ON(!intel_guc_log_relay_created(log)))
>> +    if (guc_WARN_ON(guc, !intel_guc_log_relay_created(log)))
>>           goto out_unlock;
>>         /* Get the pointer to shared GuC log buffer */
>> @@ -398,7 +399,7 @@ static void
>> _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>>            * Used rate limited to avoid deluge of messages, logs might be
>>            * getting consumed by User at a slow rate.
>>            */
>> -        DRM_ERROR_RATELIMITED("no sub-buffer to copy general logs\n");
>> +        guc_err_ratelimited(guc, "no sub-buffer to copy general
>> logs\n");
>>           log->relay.full_count++;
>>             goto out_unlock;
>> @@ -451,7 +452,7 @@ static void
>> _guc_log_copy_debuglogs_for_relay(struct intel_guc_log *log)
>>               write_offset = buffer_size;
>>           } else if (unlikely((read_offset > buffer_size) ||
>>                       (write_offset > buffer_size))) {
>> -            DRM_ERROR("invalid log buffer state\n");
>> +            guc_err(guc, "invalid log buffer state\n");
>>               /* copy whole buffer as offsets are unreliable */
>>               read_offset = 0;
>>               write_offset = buffer_size;
>> @@ -547,7 +548,7 @@ static int guc_log_relay_create(struct
>> intel_guc_log *log)
>>                       subbuf_size, n_subbufs,
>>                       &relay_callbacks, dev_priv);
>>       if (!guc_log_relay_chan) {
>> -        DRM_ERROR("Couldn't create relay chan for GuC logging\n");
>> +        guc_err(guc, "Couldn't create relay channel for GuC logging\n");
> Again, no need for 'GuC' string.
> 
>>             ret = -ENOMEM;
>>           return ret;
>> @@ -596,7 +597,7 @@ static u32 __get_default_log_level(struct
>> intel_guc_log *log)
>>       }
>>         if (i915->params.guc_log_level > GUC_LOG_LEVEL_MAX) {
>> -        DRM_WARN("Incompatible option detected: %s=%d, %s!\n",
>> +        guc_warn(guc, "Incompatible option detected: %s=%d, %s!\n",
>>                "guc_log_level", i915->params.guc_log_level,
>>                "verbosity too high");
>>           return (IS_ENABLED(CONFIG_DRM_I915_DEBUG) ||
>> @@ -641,15 +642,15 @@ int intel_guc_log_create(struct intel_guc_log *log)
>>       log->buf_addr = vaddr;
>>         log->level = __get_default_log_level(log);
>> -    DRM_DEBUG_DRIVER("guc_log_level=%d (%s, verbose:%s,
>> verbosity:%d)\n",
>> -             log->level, str_enabled_disabled(log->level),
>> -             str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
>> -             GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
>> +    guc_dbg(guc, "guc_log_level=%d (%s, verbose:%s, verbosity:%d)\n",
>> +        log->level, str_enabled_disabled(log->level),
>> +        str_yes_no(GUC_LOG_LEVEL_IS_VERBOSE(log->level)),
>> +        GUC_LOG_LEVEL_TO_VERBOSITY(log->level));
>>         return 0;
>>     err:
>> -    DRM_ERROR("Failed to allocate or map GuC log buffer. %d\n", ret);
>> +    guc_err(guc, "Failed to allocate or map GuC log buffer %pe\n",
>> ERR_PTR(ret));
> Redundant 'GuC' again.
> 
>>       return ret;
>>   }
>>   @@ -687,7 +688,7 @@ int intel_guc_log_set_level(struct intel_guc_log
>> *log, u32 level)
>>                            GUC_LOG_LEVEL_IS_ENABLED(level),
>>                            GUC_LOG_LEVEL_TO_VERBOSITY(level));
>>       if (ret) {
>> -        DRM_DEBUG_DRIVER("guc_log_control action failed %d\n", ret);
>> +        guc_dbg(guc, "guc_log_control action failed %pe\n",
>> ERR_PTR(ret));
>>           goto out_unlock;
>>       }
>>   @@ -905,7 +906,7 @@ int intel_guc_log_dump(struct intel_guc_log
>> *log, struct drm_printer *p,
>>         map = i915_gem_object_pin_map_unlocked(obj, I915_MAP_WC);
>>       if (IS_ERR(map)) {
>> -        DRM_DEBUG("Failed to pin object\n");
>> +        guc_dbg(guc, "Failed to pin object\n");
> Would be useful to say which object! Maybe change to "Failed to pin log
> object"?

ok, will also add %pe to see the actual error

Michal

> 
> John.
> 
>>           drm_puts(p, "(log data unaccessible)\n");
>>           free_page((unsigned long)page);
>>           return PTR_ERR(map);
> 
