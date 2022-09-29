Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8017D5EED29
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 07:21:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED7C10E840;
	Thu, 29 Sep 2022 05:21:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 485CF10E839;
 Thu, 29 Sep 2022 05:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664428868; x=1695964868;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=oWVvk2mhB2zj7VIp3M0iIis1AXF/xW9Wx3scuHaCVtM=;
 b=D/0rXB2G87ucFyWxlIx0TNpkBoatt+zZq80I9QqufA/ZB8kWTrlw0HiP
 ChUbnGvkcBXl2LhIYqqq3uzhzVO6f2B1TrelqGUyfnkEvcQZr+dKGYOvs
 OVBpufN4zh8PWLeedfVDv9MESffP+NpuauquFFSVvrTp9+yIakxvLiN/H
 AbwskTv3+E04HJyXoUg+4UoZpydXgAKZwhER0BFNcuig06TtRTc9MeCgB
 2b+iyUqs1VJ86yomha2Hfq57ncWgkWfVEym9wHbfzQixOgFsLGtPugNih
 +8JS++hk3Rmma4TE38VFtmQI1kPYf+iv0g9ySftIpfO+GXhfE1yoyEz/q w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="281511730"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="281511730"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 22:21:07 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="726242461"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="726242461"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Sep 2022 22:21:07 -0700
Date: Wed, 28 Sep 2022 22:20:43 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 03/16] drm/i915/vm_bind: Expose
 i915_gem_object_max_page_size()
Message-ID: <20220929052043.GH16345@nvishwa1-DESK>
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
 <20220928061918.6340-4-niranjana.vishwanathapura@intel.com>
 <fd9c1918-5ca4-1e05-9dff-7793b84cfc43@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <fd9c1918-5ca4-1e05-9dff-7793b84cfc43@intel.com>
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
Cc: matthew.brost@intel.com, paulo.r.zanoni@intel.com, tvrtko.ursulin@intel.com,
 jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@intel.com,
 lionel.g.landwerlin@intel.com, jason@jlekstrand.net,
 andi.shyti@linux.intel.com, daniel.vetter@intel.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 28, 2022 at 06:40:01PM +0100, Matthew Auld wrote:
>On 28/09/2022 07:19, Niranjana Vishwanathapura wrote:
>>Expose i915_gem_object_max_page_size() function non-static
>>which will be used by the vm_bind feature.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>---
>>  drivers/gpu/drm/i915/gem/i915_gem_create.c | 19 ++++++++++++++-----
>>  drivers/gpu/drm/i915/gem/i915_gem_object.h |  2 ++
>>  2 files changed, 16 insertions(+), 5 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_create.c b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>index 33673fe7ee0a..4aa7b5582b8e 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_create.c
>>@@ -15,10 +15,19 @@
>>  #include "i915_trace.h"
>>  #include "i915_user_extensions.h"
>>-static u32 object_max_page_size(struct intel_memory_region **placements,
>>-				unsigned int n_placements)
>>+/**
>>+ * i915_gem_object_max_page_size() - max of min_page_size of the regions
>>+ * @placements:  list of regions
>>+ * @n_placements: number of the placements
>>+ *
>>+ * Calculates the max of the min_page_size of a list of placements passed in.
>>+ *
>>+ * Return: max of the min_page_size
>
>"max of the min_page_size, or I915_GTT_PAGE_SIZE_4K if zero placements."
>

ok, will update.

Regards,
Niranjana

>Acked-by: Matthew Auld <matthew.auld@intel.com>
>
>>+ */
>>+u32 i915_gem_object_max_page_size(struct intel_memory_region **placements,
>>+				  unsigned int n_placements)
>>  {
>>-	u32 max_page_size = 0;
>>+	u32 max_page_size = I915_GTT_PAGE_SIZE_4K;
>>  	int i;
>>  	for (i = 0; i < n_placements; i++) {
>>@@ -28,7 +37,6 @@ static u32 object_max_page_size(struct intel_memory_region **placements,
>>  		max_page_size = max_t(u32, max_page_size, mr->min_page_size);
>>  	}
>>-	GEM_BUG_ON(!max_page_size);
>>  	return max_page_size;
>>  }
>>@@ -99,7 +107,8 @@ __i915_gem_object_create_user_ext(struct drm_i915_private *i915, u64 size,
>>  	i915_gem_flush_free_objects(i915);
>>-	size = round_up(size, object_max_page_size(placements, n_placements));
>>+	size = round_up(size, i915_gem_object_max_page_size(placements,
>>+							    n_placements));
>>  	if (size == 0)
>>  		return ERR_PTR(-EINVAL);
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>index a3b7551a57fc..d53d01b1860a 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
>>@@ -47,6 +47,8 @@ static inline bool i915_gem_object_size_2big(u64 size)
>>  }
>>  void i915_gem_init__objects(struct drm_i915_private *i915);
>>+u32 i915_gem_object_max_page_size(struct intel_memory_region **placements,
>>+				  unsigned int n_placements);
>>  void i915_objects_module_exit(void);
>>  int i915_objects_module_init(void);
