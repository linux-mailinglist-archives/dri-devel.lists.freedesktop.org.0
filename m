Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A105AFC37
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 08:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1311A10E33B;
	Wed,  7 Sep 2022 06:13:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C93F10E337
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 06:13:07 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id e18so18150857edj.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 23:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date; bh=654Mx5KNflErskpZWsH78GwciP3JIpFtIohp9Xrffk8=;
 b=kTVxUA3e9XBedEkDMGUk5JWQTnlJeSjnLmlcU4pG1ZFUTA8PEjcLC2U6LgGg5ayxqm
 Zgz1xqYKHghLFxYUSQU/hJzNPVChEdbcp9aR9WcLZjA4/4dQYwSGSW6NVmg8GwpJgZiX
 NUpxPYYLtJzbT8z5kLMYvf8Iw/hk/fojCH37A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=654Mx5KNflErskpZWsH78GwciP3JIpFtIohp9Xrffk8=;
 b=N4MnSrYJBIyxSI7qrw6BN00xOxgSe6VrU+c+tls96oCLwBTi24TdYXA5kVzn/XGKyF
 IvByXj467qxc8UaWGpF1pfnV78OsP7oddWzysP54KAofZdx46nGV/yEw1l3I+MD9OLF8
 CLpXRsKEq8EaWf3/CR3J11w0BeOBvc2726/iBWJD8/lEEUq90HkYyReDhY6xNKb2LPHS
 mbZaSofSqLaay2dn3oFSvwjiUX6d5ibTUO6i7Uhzj+e+VGGUXucpf4cTUbouHTUmODh4
 2C8QdNyDTqVnSmue9kxRd3x+Z/TFdCDlsdsDn4OfsUpE8W0TRkooLhzMIACG8zVVXasb
 EdKA==
X-Gm-Message-State: ACgBeo2a3LDmghUP7Rfnej82qRS9QM6t9MQ8YcfTNoxoebugb2U5kcvc
 guHoQHWjueF0aP0cyaAfcj2rsobs8MpJlw==
X-Google-Smtp-Source: AA6agR7EC4O8cL4v8Kr/JZ/weO0LUmT/WoVmEM5JZHGy6WvE2zVf2us/qRdDMvqkQPCJFFq2EBqEtg==
X-Received: by 2002:a05:6402:3507:b0:448:b672:55ee with SMTP id
 b7-20020a056402350700b00448b67255eemr1752029edd.107.1662531185647; 
 Tue, 06 Sep 2022 23:13:05 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 kz16-20020a17090777d000b0073c8d4c9f38sm7935402ejc.177.2022.09.06.23.13.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 23:13:05 -0700 (PDT)
Date: Wed, 7 Sep 2022 08:13:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v6 23/57] drm: POC drm on dyndbg - use in core, 2
 helpers, 3 drivers.
Message-ID: <Yxg2b2stA27B6B0t@phenom.ffwll.local>
Mail-Followup-To: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 seanpaul@chromium.org, robdclark@gmail.com,
 linux@rasmusvillemoes.dk, joe@perches.com
References: <20220904214134.408619-1-jim.cromie@gmail.com>
 <20220904214134.408619-24-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220904214134.408619-24-jim.cromie@gmail.com>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux@rasmusvillemoes.dk, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, jbaron@akamai.com, seanpaul@chromium.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch, joe@perches.com,
 intel-gvt-dev@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Sep 04, 2022 at 03:41:00PM -0600, Jim Cromie wrote:
> Use DECLARE_DYNDBG_CLASSMAP across DRM:
> 
>  - in .c files, since macro defines/initializes a record
> 
>  - in drivers, $mod_{drv,drm,param}.c
>    ie where param setup is done, since a classmap is param related
> 
>  - in drm/drm_print.c
>    since existing __drm_debug param is defined there,
>    and we ifdef it, and provide an elaborated alternative.
> 
>  - in drm_*_helper modules:
>    dp/drm_dp - 1st item in makefile target
>    drivers/gpu/drm/drm_crtc_helper.c - random pick iirc.
> 
> Since these modules all use identical CLASSMAP declarations (ie: names
> and .class_id's) they will all respond together to "class DRM_UT_*"
> query-commands:
> 
>   :#> echo class DRM_UT_KMS +p > /proc/dynamic_debug/control
> 
> NOTES:
> 
> This changes __drm_debug from int to ulong, so BIT() is usable on it.
> 
> DRM's enum drm_debug_category values need to sync with the index of
> their respective class-names here.  Then .class_id == category, and
> dyndbg's class FOO mechanisms will enable drm_dbg(DRM_UT_KMS, ...).
> 
> Though DRM needs consistent categories across all modules, thats not
> generally needed; modules X and Y could define FOO differently (ie a
> different NAME => class_id mapping), changes are made according to
> each module's private class-map.
> 
> No callsites are actually selected by this patch, since none are
> class'd yet.
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

So maybe I should just try, but what happens if a drm module doesn't have
these classbits declared? You simply have to use the raw number instead?

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 14 +++++++++++++
>  drivers/gpu/drm/display/drm_dp_helper.c | 13 ++++++++++++
>  drivers/gpu/drm/drm_crtc_helper.c       | 13 ++++++++++++
>  drivers/gpu/drm/drm_print.c             | 27 +++++++++++++++++++++++--
>  drivers/gpu/drm/i915/i915_params.c      | 12 +++++++++++
>  drivers/gpu/drm/nouveau/nouveau_drm.c   | 13 ++++++++++++
>  include/drm/drm_print.h                 |  3 ++-
>  7 files changed, 92 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index de7144b06e93..97e184f44a52 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -38,6 +38,8 @@
>  #include <linux/mmu_notifier.h>
>  #include <linux/suspend.h>
>  #include <linux/cc_platform.h>
> +#include <linux/fb.h>
> +#include <linux/dynamic_debug.h>
>  
>  #include "amdgpu.h"
>  #include "amdgpu_irq.h"
> @@ -185,6 +187,18 @@ int amdgpu_vcnfw_log;
>  
>  static void amdgpu_drv_delayed_reset_work_handler(struct work_struct *work);
>  
> +DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,

Iirc we've talked about maybe some kbuild trickery so that any module
under drivers/gpu/drm gets these by default. I don't think we need to have
this for the first cut, but a macro to avoid the copypaste mistakes would
be really good here.

> +			"DRM_UT_CORE",
> +			"DRM_UT_DRIVER",
> +			"DRM_UT_KMS",
> +			"DRM_UT_PRIME",
> +			"DRM_UT_ATOMIC",
> +			"DRM_UT_VBL",
> +			"DRM_UT_STATE",
> +			"DRM_UT_LEASE",
> +			"DRM_UT_DP",
> +			"DRM_UT_DRMRES");
> +
>  struct amdgpu_mgpu_info mgpu_info = {
>  	.mutex = __MUTEX_INITIALIZER(mgpu_info.mutex),
>  	.delayed_reset_work = __DELAYED_WORK_INITIALIZER(
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index 92990a3d577a..cbb9c4d6d8f2 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -30,6 +30,7 @@
>  #include <linux/sched.h>
>  #include <linux/seq_file.h>
>  #include <linux/string_helpers.h>
> +#include <linux/dynamic_debug.h>
>  
>  #include <drm/display/drm_dp_helper.h>
>  #include <drm/display/drm_dp_mst_helper.h>
> @@ -40,6 +41,18 @@
>  
>  #include "drm_dp_helper_internal.h"
>  
> +DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
> +			"DRM_UT_CORE",
> +			"DRM_UT_DRIVER",
> +			"DRM_UT_KMS",
> +			"DRM_UT_PRIME",
> +			"DRM_UT_ATOMIC",
> +			"DRM_UT_VBL",
> +			"DRM_UT_STATE",
> +			"DRM_UT_LEASE",
> +			"DRM_UT_DP",
> +			"DRM_UT_DRMRES");
> +
>  struct dp_aux_backlight {
>  	struct backlight_device *base;
>  	struct drm_dp_aux *aux;
> diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
> index 457448cc60f7..7d86020b5244 100644
> --- a/drivers/gpu/drm/drm_crtc_helper.c
> +++ b/drivers/gpu/drm/drm_crtc_helper.c
> @@ -32,6 +32,7 @@
>  #include <linux/export.h>
>  #include <linux/kernel.h>
>  #include <linux/moduleparam.h>
> +#include <linux/dynamic_debug.h>
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -50,6 +51,18 @@
>  
>  #include "drm_crtc_helper_internal.h"
>  
> +DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
> +			"DRM_UT_CORE",
> +			"DRM_UT_DRIVER",
> +			"DRM_UT_KMS",
> +			"DRM_UT_PRIME",
> +			"DRM_UT_ATOMIC",
> +			"DRM_UT_VBL",
> +			"DRM_UT_STATE",
> +			"DRM_UT_LEASE",
> +			"DRM_UT_DP",
> +			"DRM_UT_DRMRES");
> +
>  /**
>   * DOC: overview
>   *
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index f783d4963d4b..ec32df35a3e3 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -40,7 +40,7 @@
>   * __drm_debug: Enable debug output.
>   * Bitmask of DRM_UT_x. See include/drm/drm_print.h for details.
>   */
> -unsigned int __drm_debug;
> +unsigned long __drm_debug;
>  EXPORT_SYMBOL(__drm_debug);
>  
>  MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug category.\n"
> @@ -52,7 +52,30 @@ MODULE_PARM_DESC(debug, "Enable debug output, where each bit enables a debug cat
>  "\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
>  "\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
>  "\t\tBit 8 (0x100) will enable DP messages (displayport code)");
> -module_param_named(debug, __drm_debug, int, 0600);
> +
> +#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
> +module_param_named(debug, __drm_debug, ulong, 0600);
> +#else
> +/* classnames must match vals of enum drm_debug_category */
> +DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
> +			"DRM_UT_CORE",
> +			"DRM_UT_DRIVER",
> +			"DRM_UT_KMS",
> +			"DRM_UT_PRIME",
> +			"DRM_UT_ATOMIC",
> +			"DRM_UT_VBL",
> +			"DRM_UT_STATE",
> +			"DRM_UT_LEASE",
> +			"DRM_UT_DP",
> +			"DRM_UT_DRMRES");
> +
> +static struct ddebug_class_param drm_debug_bitmap = {
> +	.bits = &__drm_debug,
> +	.flags = "p",
> +	.map = &drm_debug_classes,
> +};
> +module_param_cb(debug, &param_ops_dyndbg_classes, &drm_debug_bitmap, 0600);
> +#endif
>  
>  void __drm_puts_coredump(struct drm_printer *p, const char *str)
>  {
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index 6fc475a5db61..d1e4d528cb17 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -29,6 +29,18 @@
>  #include "i915_params.h"
>  #include "i915_drv.h"
>  
> +DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
> +			"DRM_UT_CORE",
> +			"DRM_UT_DRIVER",
> +			"DRM_UT_KMS",
> +			"DRM_UT_PRIME",
> +			"DRM_UT_ATOMIC",
> +			"DRM_UT_VBL",
> +			"DRM_UT_STATE",
> +			"DRM_UT_LEASE",
> +			"DRM_UT_DP",
> +			"DRM_UT_DRMRES");
> +
>  #define i915_param_named(name, T, perm, desc) \
>  	module_param_named(name, i915_modparams.name, T, perm); \
>  	MODULE_PARM_DESC(name, desc)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 561309d447e0..fd99ec0f4257 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -28,6 +28,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/vga_switcheroo.h>
>  #include <linux/mmu_notifier.h>
> +#include <linux/dynamic_debug.h>
>  
>  #include <drm/drm_aperture.h>
>  #include <drm/drm_crtc_helper.h>
> @@ -70,6 +71,18 @@
>  #include "nouveau_svm.h"
>  #include "nouveau_dmem.h"
>  
> +DECLARE_DYNDBG_CLASSMAP(drm_debug_classes, DD_CLASS_TYPE_DISJOINT_BITS, 0,
> +			"DRM_UT_CORE",
> +			"DRM_UT_DRIVER",
> +			"DRM_UT_KMS",
> +			"DRM_UT_PRIME",
> +			"DRM_UT_ATOMIC",
> +			"DRM_UT_VBL",
> +			"DRM_UT_STATE",
> +			"DRM_UT_LEASE",
> +			"DRM_UT_DP",
> +			"DRM_UT_DRMRES");
> +
>  MODULE_PARM_DESC(config, "option string to pass to driver core");
>  static char *nouveau_config;
>  module_param_named(config, nouveau_config, charp, 0400);
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index b3b470440e46..668273e36c2c 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -35,7 +35,7 @@
>  #include <drm/drm.h>
>  
>  /* Do *not* use outside of drm_print.[ch]! */
> -extern unsigned int __drm_debug;
> +extern unsigned long __drm_debug;
>  
>  /**
>   * DOC: print
> @@ -275,6 +275,7 @@ static inline struct drm_printer drm_err_printer(const char *prefix)
>   *
>   */
>  enum drm_debug_category {
> +	/* These names must match those in DYNAMIC_DEBUG_CLASSBITS */

I'd just put this into the kerneldoc, then you can also link to the
DRM_PRINT_DECLARE_DEBUG_CLASSBITS macro or whatever you'll call the thing
so drivers don't have to copypaste it all.
-Daniel

>  	/**
>  	 * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
>  	 * drm_memory.c, ...
> -- 
> 2.37.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
