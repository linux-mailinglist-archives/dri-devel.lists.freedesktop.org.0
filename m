Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6125F0FA9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 18:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02A2710ED76;
	Fri, 30 Sep 2022 16:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6DC510ED76;
 Fri, 30 Sep 2022 16:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664554403; x=1696090403;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=GsI+ofswTjbHnpiYtYQ1Ydt+QdbSgxMGCVr1fuk9ngY=;
 b=SYrh3P3QpkQfoz1vpajlS9F6moJDn1rOzMoHo4GsodrjhWNjL3oD9sX+
 AQ8TtJ3t2OA9krtgFHiF/nwTxxE+rmCgMWUqwIa7pW0w2Q/l1bvCIdGn0
 HKmyY1zCgRzJz5s6nZ0GXEF1EDNo0XhlRfLiVX6AoI+OUW8l3/DqUM0aj
 jy8unI0N1CW3Yy7ExVAvUGkEwgHuPKwMfEL5cbgRKf6JmgZuXVfPdwx2N
 0dcqk1KhFEJHnSeM2uDITQxDMD0q967jqdH9ZDde+/6M8e498lxvoVG54
 zs7Bbjqh/KGNn/oK5/HhpHPWojRSIu+5EF0gI6a0MiUZwEeN/AOvK3UPK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="328611123"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="328611123"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 09:13:23 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="748277291"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="748277291"
Received: from nvishwa1-desk.sc.intel.com (HELO nvishwa1-DESK) ([172.25.29.76])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 09:13:22 -0700
Date: Fri, 30 Sep 2022 09:13:00 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH 16/16] drm/i915/vm_bind: Add uapi for user to enable
 vm_bind_mode
Message-ID: <20220930161255.GI22224@nvishwa1-DESK>
References: <20220928061918.6340-1-niranjana.vishwanathapura@intel.com>
 <20220928061918.6340-17-niranjana.vishwanathapura@intel.com>
 <110254ac-a4af-395c-0581-73de653e8cd9@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <110254ac-a4af-395c-0581-73de653e8cd9@intel.com>
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

On Fri, Sep 30, 2022 at 11:01:17AM +0100, Matthew Auld wrote:
>On 28/09/2022 07:19, Niranjana Vishwanathapura wrote:
>>Add getparam support for VM_BIND capability version.
>>Add VM creation time flag to enable vm_bind_mode for the VM.
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
>>---
>>  drivers/gpu/drm/i915/gem/i915_gem_context.c |  9 +++++++-
>>  drivers/gpu/drm/i915/i915_drv.h             |  2 ++
>>  drivers/gpu/drm/i915/i915_getparam.c        |  3 +++
>>  include/uapi/drm/i915_drm.h                 | 24 ++++++++++++++++++++-
>>  4 files changed, 36 insertions(+), 2 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>index f4e648ec01ed..c20bd6e8aaf8 100644
>>--- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>+++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
>>@@ -1808,9 +1808,13 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
>>  	if (!HAS_FULL_PPGTT(i915))
>>  		return -ENODEV;
>>-	if (args->flags)
>>+	if (args->flags & I915_VM_CREATE_FLAGS_UNKNOWN)
>>  		return -EINVAL;
>>+	if ((args->flags & I915_VM_CREATE_FLAGS_USE_VM_BIND) &&
>>+	    !HAS_VM_BIND(i915))
>>+		return -EOPNOTSUPP;
>>+
>>  	ppgtt = i915_ppgtt_create(to_gt(i915), 0);
>>  	if (IS_ERR(ppgtt))
>>  		return PTR_ERR(ppgtt);
>>@@ -1828,6 +1832,9 @@ int i915_gem_vm_create_ioctl(struct drm_device *dev, void *data,
>>  	if (err)
>>  		goto err_put;
>>+	if (args->flags & I915_VM_CREATE_FLAGS_USE_VM_BIND)
>>+		ppgtt->vm.vm_bind_mode = true;
>>+
>>  	GEM_BUG_ON(id == 0); /* reserved for invalid/unassigned ppgtt */
>>  	args->vm_id = id;
>>  	return 0;
>>diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>>index 84a2f6b16f57..e77393d74c6f 100644
>>--- a/drivers/gpu/drm/i915/i915_drv.h
>>+++ b/drivers/gpu/drm/i915/i915_drv.h
>>@@ -974,6 +974,8 @@ IS_SUBPLATFORM(const struct drm_i915_private *i915,
>>  #define HAS_ONE_EU_PER_FUSE_BIT(i915)	(INTEL_INFO(i915)->has_one_eu_per_fuse_bit)
>>+#define HAS_VM_BIND(dev_priv) (GRAPHICS_VER(dev_priv) >= 12)
>
>s/dev_priv/i915/

Ok, will fix

>
>>+
>>  /* intel_device_info.c */
>>  static inline struct intel_device_info *
>>  mkwrite_device_info(struct drm_i915_private *dev_priv)
>>diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
>>index 342c8ca6414e..f45b3c684bcf 100644
>>--- a/drivers/gpu/drm/i915/i915_getparam.c
>>+++ b/drivers/gpu/drm/i915/i915_getparam.c
>>@@ -175,6 +175,9 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
>>  	case I915_PARAM_PERF_REVISION:
>>  		value = i915_perf_ioctl_version();
>>  		break;
>>+	case I915_PARAM_VM_BIND_VERSION:
>>+		value = HAS_VM_BIND(i915);
>>+		break;
>>  	default:
>>  		DRM_DEBUG("Unknown parameter %d\n", param->param);
>>  		return -EINVAL;
>>diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>index f3a5b198b3e7..9a033acc254b 100644
>>--- a/include/uapi/drm/i915_drm.h
>>+++ b/include/uapi/drm/i915_drm.h
>>@@ -755,6 +755,27 @@ typedef struct drm_i915_irq_wait {
>>  /* Query if the kernel supports the I915_USERPTR_PROBE flag. */
>>  #define I915_PARAM_HAS_USERPTR_PROBE 56
>>+/*
>>+ * VM_BIND feature version supported.
>>+ *
>>+ * The following versions of VM_BIND have been defined:
>>+ *
>>+ * 0: No VM_BIND support.
>>+ *
>>+ * 1: In VM_UNBIND calls, the UMD must specify the exact mappings created
>>+ *    previously with VM_BIND, the ioctl will not support unbinding multiple
>>+ *    mappings or splitting them. Similarly, VM_BIND calls will not replace
>>+ *    any existing mappings.
>>+ *
>>+ * 2: The restrictions on unbinding partial or multiple mappings is
>>+ *    lifted, Similarly, binding will replace any mappings in the given range.
>
>Should we just remove 2 for now? It looks like 1 is this series.

Yah, will remove.

>
>>+ *
>>+ * See struct drm_i915_gem_vm_bind and struct drm_i915_gem_vm_unbind.
>>+ *
>>+ * vm_bind versions are backward compatible.
>>+ */
>>+#define I915_PARAM_VM_BIND_VERSION	57
>>+
>>  /* Must be kept compact -- no holes and well documented */
>>  /**
>>@@ -2622,7 +2643,8 @@ struct drm_i915_gem_vm_control {
>>  	/** @extensions: Zero-terminated chain of extensions. */
>>  	__u64 extensions;
>>-	/** @flags: reserved for future usage, currently MBZ */
>>+#define I915_VM_CREATE_FLAGS_USE_VM_BIND	(1u << 0)
>
>Some kernel-doc for that would be good, even if it's kind of obvious.
>

Ok, will add comment.

Regards,
Niranjana

>Acked-by: Matthew Auld <matthew.auld@intel.com>
>
>>+#define I915_VM_CREATE_FLAGS_UNKNOWN	(-(I915_VM_CREATE_FLAGS_USE_VM_BIND << 1))
>>  	__u32 flags;
>>  	/** @vm_id: Id of the VM created or to be destroyed */
