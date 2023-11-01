Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DC67DE252
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 15:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B0A10E700;
	Wed,  1 Nov 2023 14:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A4310E6D8;
 Wed,  1 Nov 2023 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698848640; x=1730384640;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RM043y1sDLmBArzaGUYvGKIMnzq4WD/zMKvKWDxKEhM=;
 b=PQRSW/keEaiol23N0JtwfYedmMq5B+utcggwoE1tisoVKxcvI0wbtRXZ
 YZ+tX2cYI1W/koStnB7npA5hKvtvy+ZllNGy1Ro7V//gKxQ01eoB/j5TK
 tJ2DB8kh8MOdF7AJD7dXGSxu1NkJRed7MLRTvvsiRfEoQtwE64QMYiJPl
 V8yvGo+kiU/Z6BaUBYDtQgizNX8cNjb0isPU+732IT72Mtk4MeY8p2rXk
 djsv8bDIyJFl4CpYceLvE85pTlJSmTwfWic9vTGsHrb3S1WA5YO/5wU0j
 VEpCZVxLkKHgidpbLyYQNinzlyva9WDxvulidHlLZdOVb5V5Qtyh0QLKI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="474743640"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="474743640"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 07:23:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="790121866"
X-IronPort-AV: E=Sophos;i="6.03,268,1694761200"; d="scan'208";a="790121866"
Received: from cwilso3-mobl1.ger.corp.intel.com (HELO [10.213.231.239])
 ([10.213.231.239])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2023 07:23:57 -0700
Message-ID: <1d8b9bb8-1368-436f-9fb6-125e6bb04e40@linux.intel.com>
Date: Wed, 1 Nov 2023 14:23:55 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Remove unused for_each_uabi_class_engine
Content-Language: en-US
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20231101100124.303739-1-tvrtko.ursulin@linux.intel.com>
 <87sf5p4wjx.fsf@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <87sf5p4wjx.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 01/11/2023 10:06, Jani Nikula wrote:
> On Wed, 01 Nov 2023, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> Unused macro after 99919be74aa3 ("drm/i915/gem: Zap the i915_gem_object_blt code")
>> removed some code.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> \o/
> 
> Reviewed-by: Jani Nikula <jani.nikula@intel.com>
> 
> Could I persuade you to move for_each_engine(),
> for_each_engine_masked(), rb_to_uabi_engine(), and
> for_each_uabi_engine() to a more suitable header?

Former to intel_gt.h, but latter a better place is not coming to me. Like:

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_pm.h b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
index d68675925b79..1d97c435a015 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_pm.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_pm.h
@@ -10,6 +10,7 @@
  #include "i915_request.h"
  #include "intel_engine_types.h"
  #include "intel_wakeref.h"
+#include "intel_gt.h"
  #include "intel_gt_pm.h"
  
  static inline bool
diff --git a/drivers/gpu/drm/i915/gt/intel_gt.h b/drivers/gpu/drm/i915/gt/intel_gt.h
index 9ffdb05e231e..b0e453e27ea8 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt.h
@@ -171,6 +171,20 @@ void intel_gt_release_all(struct drm_i915_private *i915);
              (id__)++) \
                 for_each_if(((gt__) = (i915__)->gt[(id__)]))
  
+/* Simple iterator over all initialised engines */
+#define for_each_engine(engine__, gt__, id__) \
+       for ((id__) = 0; \
+            (id__) < I915_NUM_ENGINES; \
+            (id__)++) \
+               for_each_if ((engine__) = (gt__)->engine[(id__)])
+
+/* Iterator over subset of engines selected by mask */
+#define for_each_engine_masked(engine__, gt__, mask__, tmp__) \
+       for ((tmp__) = (mask__) & (gt__)->info.engine_mask; \
+            (tmp__) ? \
+            ((engine__) = (gt__)->engine[__mask_next_bit(tmp__)]), 1 : \
+            0;)
+
  void intel_gt_info_print(const struct intel_gt_info *info,
                          struct drm_printer *p);
  
diff --git a/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c
index 8f9b874fdc9c..3aa1d014c14d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_engines_debugfs.c
@@ -6,8 +6,8 @@
  
  #include <drm/drm_print.h>
  
-#include "i915_drv.h" /* for_each_engine! */
  #include "intel_engine.h"
+#include "intel_gt.h"
  #include "intel_gt_debugfs.h"
  #include "intel_gt_engines_debugfs.h"
  
diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
index 744c8c4a50fa..3feec04a2b1c 100644
--- a/drivers/gpu/drm/i915/i915_drv.h
+++ b/drivers/gpu/drm/i915/i915_drv.h
@@ -396,20 +396,6 @@ static inline struct intel_gt *to_gt(const struct drm_i915_private *i915)
         return i915->gt[0];
  }
  
-/* Simple iterator over all initialised engines */
-#define for_each_engine(engine__, gt__, id__) \
-       for ((id__) = 0; \
-            (id__) < I915_NUM_ENGINES; \
-            (id__)++) \
-               for_each_if ((engine__) = (gt__)->engine[(id__)])
-
-/* Iterator over subset of engines selected by mask */
-#define for_each_engine_masked(engine__, gt__, mask__, tmp__) \
-       for ((tmp__) = (mask__) & (gt__)->info.engine_mask; \
-            (tmp__) ? \
-            ((engine__) = (gt__)->engine[__mask_next_bit(tmp__)]), 1 : \
-            0;)
-
  #define rb_to_uabi_engine(rb) \
         rb_entry_safe(rb, struct intel_engine_cs, uabi_node)
  
diff --git a/drivers/gpu/drm/i915/selftests/intel_uncore.c b/drivers/gpu/drm/i915/selftests/intel_uncore.c
index 7a5f4adc1b8b..c998f15d505c 100644
--- a/drivers/gpu/drm/i915/selftests/intel_uncore.c
+++ b/drivers/gpu/drm/i915/selftests/intel_uncore.c
@@ -24,6 +24,8 @@
  
  #include "../i915_selftest.h"
  
+#include "gt/intel_gt.h"
+
  static int intel_fw_table_check(const struct intel_forcewake_range *ranges,
                                 unsigned int num_ranges,
                                 bool is_watertight)

Beneficial?

Regards,

Tvrtko
  
>> ---
>>   drivers/gpu/drm/i915/i915_drv.h | 5 -----
>>   1 file changed, 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index bfcbe93bd9fe..744c8c4a50fa 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -418,11 +418,6 @@ static inline struct intel_gt *to_gt(const struct drm_i915_private *i915)
>>   	     (engine__); \
>>   	     (engine__) = rb_to_uabi_engine(rb_next(&(engine__)->uabi_node)))
>>   
>> -#define for_each_uabi_class_engine(engine__, class__, i915__) \
>> -	for ((engine__) = intel_engine_lookup_user((i915__), (class__), 0); \
>> -	     (engine__) && (engine__)->uabi_class == (class__); \
>> -	     (engine__) = rb_to_uabi_engine(rb_next(&(engine__)->uabi_node)))
>> -
>>   #define INTEL_INFO(i915)	((i915)->__info)
>>   #define RUNTIME_INFO(i915)	(&(i915)->__runtime)
>>   #define DRIVER_CAPS(i915)	(&(i915)->caps)
> 
