Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C81A45E68C8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 18:46:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA00310EA82;
	Thu, 22 Sep 2022 16:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9226D10EA82;
 Thu, 22 Sep 2022 16:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663865185; x=1695401185;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=pk9k/lnB01bsityjYPeT0Kap6UyKDdhsL5XRgVPhBMA=;
 b=CX79auJtKxLGe0TpJQDCJsXrF+9V64isbLUeFcSuW4IVkRKs7q6bTumO
 DpQKIsADuGosHSriwB03cKv+Y36zuhGIeAZB10niDT+EoHMueZWxcgiTh
 zx8RZOYOVIN739eWXUzaFWRM7XGYwA3a7obuQoLzVb1q4AY2aJ3aTFhNs
 RYCu4G3A0uq7r4Xzuiqn8Wux2qWygBUzzFwKS3+dARGC914/yKXupR2FC
 YIDEd8HIyukQITM/ml1Dn4FGP23e6PtsQb+dCH0fY2e86QyQZaNXTpUWo
 aCb85Nh2xeVS1UaIrB17HVY1iCIPQVu866UthFYBRt4zY4oFhGw2Hv7QU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="364340470"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="364340470"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 09:46:24 -0700
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; d="scan'208";a="948668594"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2022 09:46:24 -0700
Date: Thu, 22 Sep 2022 09:46:03 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [RFC v4 03/14] drm/i915/vm_bind: Expose
 i915_gem_object_max_page_size()
Message-ID: <20220922164601.GH28263@nvishwa1-DESK>
References: <20220921070945.27764-1-niranjana.vishwanathapura@intel.com>
 <20220921070945.27764-4-niranjana.vishwanathapura@intel.com>
 <578445bc-d804-3f1d-a32d-51cac9460351@linux.intel.com>
 <20220921180040.GD28263@nvishwa1-DESK>
 <e02e34ef-0dca-d61d-e5c4-a6f002baf434@linux.intel.com>
 <1072ee80-13fb-dc72-5416-c7fdded3c80c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1072ee80-13fb-dc72-5416-c7fdded3c80c@intel.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, paulo.r.zanoni@intel.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 thomas.hellstrom@intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 22, 2022 at 05:18:28PM +0100, Matthew Auld wrote:
>On 22/09/2022 09:09, Tvrtko Ursulin wrote:
>>
>>On 21/09/2022 19:00, Niranjana Vishwanathapura wrote:
>>>On Wed, Sep 21, 2022 at 10:13:12AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>>On 21/09/2022 08:09, Niranjana Vishwanathapura wrote:
>>>>>Expose i915_gem_object_max_page_size() function non-static
>>>>>which will be used by the vm_bind feature.
>>>>>
>>>>>Signed-off-by: Niranjana Vishwanathapura 
>>>>><niranjana.vishwanathapura@intel.com>
>>>>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>>>>---
>>>>> drivers/gpu/drm/i915/gem/i915_gem_create.c | 20 +++++++++++++++-----
>>>>> drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 ++
>>>>> 2 files changed, 17 insertions(+), 5 deletions(-)
>>>>>
>>>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c 
>>>>>b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>>>index 33673fe7ee0a..3b3ab4abb0a3 100644
>>>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>>>>@@ -11,14 +11,24 @@
>>>>> #include "pxp/intel_pxp.h"
>>>>> #include "i915_drv.h"
>>>>>+#include "i915_gem_context.h"
>>>>
>>>>I can't spot that you are adding any code which would need this? 
>>>>I915_GTT_PAGE_SIZE_4K? It is in intel_gtt.h.
>>>
>>>This include should have been added in a later patch for calling
>>>i915_gem_vm_lookup(). But got added here while patch refactoring.
>>>Will fix.
>>>
>>>>
>>>>> #include "i915_gem_create.h"
>>>>> #include "i915_trace.h"
>>>>> #include "i915_user_extensions.h"
>>>>>-static u32 object_max_page_size(struct intel_memory_region 
>>>>>**placements,
>>>>>-                unsigned int n_placements)
>>>>>+/**
>>>>>+ * i915_gem_object_max_page_size() - max of min_page_size of 
>>>>>the regions
>>>>>+ * @placements:  list of regions
>>>>>+ * @n_placements: number of the placements
>>>>>+ *
>>>>>+ * Calculates the max of the min_page_size of a list of 
>>>>>placements passed in.
>>>>>+ *
>>>>>+ * Return: max of the min_page_size
>>>>>+ */
>>>>>+u32 i915_gem_object_max_page_size(struct intel_memory_region 
>>>>>**placements,
>>>>>+                  unsigned int n_placements)
>>>>> {
>>>>>-    u32 max_page_size = 0;
>>>>>+    u32 max_page_size = I915_GTT_PAGE_SIZE_4K;
>>>>>     int i;
>>>>>     for (i = 0; i < n_placements; i++) {
>>>>>@@ -28,7 +38,6 @@ static u32 object_max_page_size(struct 
>>>>>intel_memory_region **placements,
>>>>>         max_page_size = max_t(u32, max_page_size, mr->min_page_size);
>>>>>     }
>>>>>-    GEM_BUG_ON(!max_page_size);
>>>>>     return max_page_size;
>>>>> }
>>>>>@@ -99,7 +108,8 @@ __i915_gem_object_create_user_ext(struct 
>>>>>drm_i915_private *i915, u64 size,
>>>>>     i915_gem_flush_free_objects(i915);
>>>>>-    size = round_up(size, object_max_page_size(placements, 
>>>>>n_placements));
>>>>>+    size = round_up(size, i915_gem_object_max_page_size(placements,
>>>>>+                                n_placements));
>>>>>     if (size == 0)
>>>>>         return ERR_PTR(-EINVAL);
>>>>
>>>>Because of the changes above this path is now unreachable. I 
>>>>suppose it was meant to tell the user "you have supplied no 
>>>>placements"? But then GEM_BUG_ON (which you remove) used to be 
>>>>wrong.
>>>>
>>>
>>>Yah, looks like an existing problem. May be this "size == 0" check
>>>should have been made before we do the round_up()? ie., check 
>>>input 'size'
>>>paramter is not 0?
>>>I think for now, I will remove this check as it was unreachable anyhow.
>>
>>Hm that's true as well. i915_gem_create_ext_ioctl ensures at least 
>>one placement and internal callers do as well.
>>
>>To be safe, instead of removing maybe move to before "size = " and 
>>change to "if (GEM_WARN_ON(n_placements == 0))"? Not sure.. Matt any 
>>thoughts here given the changes in this patch?
>
>The check is also to reject a zero sized object with args->size = 0, 
>i.e round_up(0, PAGE_SIZE) == 0. So for sure that is still needed 
>here.

Thanks Matt.
Yah, we could check for "size == 0" before we round_up, but doing it
after like here should be just fine. Will keep it as is.

Niranjana

>
>>
>>Regards,
>>
>>Tvrtko
>>
>>>
>>>Niranjana
>>>
>>>>Regards,
>>>>
>>>>Tvrtko
>>>>
>>>>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h 
>>>>>b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>>>index 7317d4102955..8c97bddad921 100644
>>>>>--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>>>>@@ -47,6 +47,8 @@ static inline bool 
>>>>>i915_gem_object_size_2big(u64 size)
>>>>> }
>>>>> void i915_gem_init__objects(struct drm_i915_private *i915);
>>>>>+u32 i915_gem_object_max_page_size(struct intel_memory_region 
>>>>>**placements,
>>>>>+                  unsigned int n_placements);
>>>>> void i915_objects_module_exit(void);
>>>>> int i915_objects_module_init(void);
