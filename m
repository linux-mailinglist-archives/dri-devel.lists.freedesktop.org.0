Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 344F03F4D60
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 17:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF1089CAD;
	Mon, 23 Aug 2021 15:22:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F6E89CAC;
 Mon, 23 Aug 2021 15:22:26 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 61-20020a9d0d430000b02903eabfc221a9so37342087oti.0; 
 Mon, 23 Aug 2021 08:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ASeymh39glRTlZ/QC0Mp/PVzzPL8u93oZ5ehRjBe1Qs=;
 b=DR7IXQa74ey6SMpniOnsK5s29ChcuVQ5GPO4YhjI/N6cJkAlCaPEFdJp5POfGwDmrV
 bPKmFguInoGk7J08gLYI3GMHAn/NkyfNmOonwbo1mKanoHkAXl591DKg5Sz0NSr848My
 IZn8nNuCqHWpo8e8nPDuvie5gaTuO5KJQjPUqKElgCIRoXvyhW9JnVmYeL4X5x/P+I9o
 0WXiu6cC71LlCBYGvDLUt8dbQ4Uf5EtTdNKYzAXDrp7I5UZGrLArAxWgl6m7pwC5mHwI
 73Mn/WNe5dtjUjpJs1W6kae+yA6oZuEgcisV6j/ABwmfNp2hB9C2rqCD6lNKOdn9e85C
 DgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=ASeymh39glRTlZ/QC0Mp/PVzzPL8u93oZ5ehRjBe1Qs=;
 b=jeQ6gkcd04vz7O1M7sH5OMo61fCjQe/ZqzH9zoWpT0+oy8PwAmSvhNt1tuYct9YerG
 kS9exFT/fWOGoJaJVvZ1uKtk2orLAWLCUDSiNQt720ZuGXMPnd1qC/KovixTuOJTNMtk
 M90YPjTJSbD7xyrLXlwtcJjJkgJsSSgiLnSgUowyGJXcfEwHDv10D54Z7sdfldyHw7zA
 vStyuJkwcUzw2qMFb9EYaWiZDRApNpP2r9Wuc+Tpg2wVySsZkEPHhK91iofI+yn+OZw6
 eKRAGtn0frlVWyAOiUrA9EQmBaTqUW2Et+bAjnD8SLBVJCZ1aamF1eqWCHhvnUV7hf6Q
 SUiw==
X-Gm-Message-State: AOAM531y6oETP5Mout46K4epiJ06l168IrCNT0HGYnMmq6zSWQZZnLMn
 QmKJXa+xG3Yq3ag7dpg3TT8=
X-Google-Smtp-Source: ABdhPJxAmzhtQA6bLPi5BptW3w6IuHDj6QRxiqsLSY8b3GKvTAwLv9CN2Kl2ywGXFexjug5txrpGFw==
X-Received: by 2002:a05:6808:483:: with SMTP id
 z3mr11466412oid.5.1629732145844; 
 Mon, 23 Aug 2021 08:22:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 t1sm3872630otp.9.2021.08.23.08.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 08:22:25 -0700 (PDT)
Date: Mon, 23 Aug 2021 08:22:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: Re: [Intel-gfx] [PATCH v2 11/11] drm/i915: Extract i915_module.c
Message-ID: <20210823152223.GA1135259@roeck-us.net>
References: <20210727121037.2041102-1-daniel.vetter@ffwll.ch>
 <20210727121037.2041102-11-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210727121037.2041102-11-daniel.vetter@ffwll.ch>
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

On Tue, Jul 27, 2021 at 02:10:37PM +0200, Daniel Vetter wrote:
> The module init code is somewhat misplaced in i915_pci.c, since it
> needs to pull in init/exit functions from every part of the driver and
> pollutes the include list a lot.
> 
> Extract an i915_module.c file which pulls all the bits together, and
> allows us to massively trim the include list of i915_pci.c.
> 
> The downside is that have to drop the error path check Jason added to
> catch when we set up the pci driver too early. I think that risk is
> acceptable for this pretty nice include.
> 
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>

With gcc and CONFIG_GCC_PLUGIN_RANDSTRUCT=y, this patch results
in:

drivers/gpu/drm/i915/i915_module.c:50:11: error:
	positional initialization of field in 'struct' declared with 'designated_init' attribute

This is seen for each of the initializers.

Guenter

> ---
>  drivers/gpu/drm/i915/Makefile      |   1 +
>  drivers/gpu/drm/i915/i915_module.c | 113 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/i915/i915_pci.c    | 117 +----------------------------
>  drivers/gpu/drm/i915/i915_pci.h    |   8 ++
>  4 files changed, 125 insertions(+), 114 deletions(-)
>  create mode 100644 drivers/gpu/drm/i915/i915_module.c
>  create mode 100644 drivers/gpu/drm/i915/i915_pci.h
> 
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 9022dc638ed6..4ebd9f417ddb 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -38,6 +38,7 @@ i915-y += i915_drv.o \
>  	  i915_irq.o \
>  	  i915_getparam.o \
>  	  i915_mitigations.o \
> +	  i915_module.o \
>  	  i915_params.o \
>  	  i915_pci.o \
>  	  i915_scatterlist.o \
> diff --git a/drivers/gpu/drm/i915/i915_module.c b/drivers/gpu/drm/i915/i915_module.c
> new file mode 100644
> index 000000000000..c578ea8f56a0
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/i915_module.c
> @@ -0,0 +1,113 @@
> +/*
> + * SPDX-License-Identifier: MIT
> + *
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +#include <linux/console.h>
> +
> +#include "gem/i915_gem_context.h"
> +#include "gem/i915_gem_object.h"
> +#include "i915_active.h"
> +#include "i915_buddy.h"
> +#include "i915_params.h"
> +#include "i915_pci.h"
> +#include "i915_perf.h"
> +#include "i915_request.h"
> +#include "i915_scheduler.h"
> +#include "i915_selftest.h"
> +#include "i915_vma.h"
> +
> +static int i915_check_nomodeset(void)
> +{
> +	bool use_kms = true;
> +
> +	/*
> +	 * Enable KMS by default, unless explicitly overriden by
> +	 * either the i915.modeset prarameter or by the
> +	 * vga_text_mode_force boot option.
> +	 */
> +
> +	if (i915_modparams.modeset == 0)
> +		use_kms = false;
> +
> +	if (vgacon_text_force() && i915_modparams.modeset == -1)
> +		use_kms = false;
> +
> +	if (!use_kms) {
> +		/* Silently fail loading to not upset userspace. */
> +		DRM_DEBUG_DRIVER("KMS disabled.\n");
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct {
> +   int (*init)(void);
> +   void (*exit)(void);
> +} init_funcs[] = {
> +	{ i915_check_nomodeset, NULL },
> +	{ i915_active_module_init, i915_active_module_exit },
> +	{ i915_buddy_module_init, i915_buddy_module_exit },
> +	{ i915_context_module_init, i915_context_module_exit },
> +	{ i915_gem_context_module_init, i915_gem_context_module_exit },
> +	{ i915_objects_module_init, i915_objects_module_exit },
> +	{ i915_request_module_init, i915_request_module_exit },
> +	{ i915_scheduler_module_init, i915_scheduler_module_exit },
> +	{ i915_vma_module_init, i915_vma_module_exit },
> +	{ i915_mock_selftests, NULL },
> +	{ i915_pmu_init, i915_pmu_exit },
> +	{ i915_register_pci_driver, i915_unregister_pci_driver },
> +	{ i915_perf_sysctl_register, i915_perf_sysctl_unregister },
> +};
> +static int init_progress;
> +
> +static int __init i915_init(void)
> +{
> +	int err, i;
> +
> +	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
> +		err = init_funcs[i].init();
> +		if (err < 0) {
> +			while (i--) {
> +				if (init_funcs[i].exit)
> +					init_funcs[i].exit();
> +			}
> +			return err;
> +		} else if (err > 0) {
> +			/*
> +			 * Early-exit success is reserved for things which
> +			 * don't have an exit() function because we have no
> +			 * idea how far they got or how to partially tear
> +			 * them down.
> +			 */
> +			WARN_ON(init_funcs[i].exit);
> +			break;
> +		}
> +	}
> +
> +	init_progress = i;
> +
> +	return 0;
> +}
> +
> +static void __exit i915_exit(void)
> +{
> +	int i;
> +
> +	for (i = init_progress - 1; i >= 0; i--) {
> +		GEM_BUG_ON(i >= ARRAY_SIZE(init_funcs));
> +		if (init_funcs[i].exit)
> +			init_funcs[i].exit();
> +	}
> +}
> +
> +module_init(i915_init);
> +module_exit(i915_exit);
> +
> +MODULE_AUTHOR("Tungsten Graphics, Inc.");
> +MODULE_AUTHOR("Intel Corporation");
> +
> +MODULE_DESCRIPTION(DRIVER_DESC);
> +MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
> index b4f5e88aaae6..08651ca03478 100644
> --- a/drivers/gpu/drm/i915/i915_pci.c
> +++ b/drivers/gpu/drm/i915/i915_pci.c
> @@ -22,24 +22,13 @@
>   *
>   */
>  
> -#include <linux/console.h>
>  #include <linux/vga_switcheroo.h>
>  
>  #include <drm/drm_drv.h>
>  #include <drm/i915_pciids.h>
>  
> -#include "display/intel_fbdev.h"
> -
> -#include "i915_active.h"
> -#include "i915_buddy.h"
>  #include "i915_drv.h"
> -#include "gem/i915_gem_context.h"
> -#include "gem/i915_gem_object.h"
> -#include "i915_request.h"
> -#include "i915_perf.h"
> -#include "i915_selftest.h"
> -#include "i915_scheduler.h"
> -#include "i915_vma.h"
> +#include "i915_pci.h"
>  
>  #define PLATFORM(x) .platform = (x)
>  #define GEN(x) \
> @@ -1251,31 +1240,6 @@ static void i915_pci_shutdown(struct pci_dev *pdev)
>  	i915_driver_shutdown(i915);
>  }
>  
> -static int i915_check_nomodeset(void)
> -{
> -	bool use_kms = true;
> -
> -	/*
> -	 * Enable KMS by default, unless explicitly overriden by
> -	 * either the i915.modeset prarameter or by the
> -	 * vga_text_mode_force boot option.
> -	 */
> -
> -	if (i915_modparams.modeset == 0)
> -		use_kms = false;
> -
> -	if (vgacon_text_force() && i915_modparams.modeset == -1)
> -		use_kms = false;
> -
> -	if (!use_kms) {
> -		/* Silently fail loading to not upset userspace. */
> -		DRM_DEBUG_DRIVER("KMS disabled.\n");
> -		return 1;
> -	}
> -
> -	return 0;
> -}
> -
>  static struct pci_driver i915_pci_driver = {
>  	.name = DRIVER_NAME,
>  	.id_table = pciidlist,
> @@ -1285,87 +1249,12 @@ static struct pci_driver i915_pci_driver = {
>  	.driver.pm = &i915_pm_ops,
>  };
>  
> -static int i915_register_pci_driver(void)
> +int i915_register_pci_driver(void)
>  {
>  	return pci_register_driver(&i915_pci_driver);
>  }
>  
> -static void i915_unregister_pci_driver(void)
> +void i915_unregister_pci_driver(void)
>  {
>  	pci_unregister_driver(&i915_pci_driver);
>  }
> -
> -static const struct {
> -   int (*init)(void);
> -   void (*exit)(void);
> -} init_funcs[] = {
> -	{ i915_check_nomodeset, NULL },
> -	{ i915_active_module_init, i915_active_module_exit },
> -	{ i915_buddy_module_init, i915_buddy_module_exit },
> -	{ i915_context_module_init, i915_context_module_exit },
> -	{ i915_gem_context_module_init, i915_gem_context_module_exit },
> -	{ i915_objects_module_init, i915_objects_module_exit },
> -	{ i915_request_module_init, i915_request_module_exit },
> -	{ i915_scheduler_module_init, i915_scheduler_module_exit },
> -	{ i915_vma_module_init, i915_vma_module_exit },
> -	{ i915_mock_selftests, NULL },
> -	{ i915_pmu_init, i915_pmu_exit },
> -	{ i915_register_pci_driver, i915_unregister_pci_driver },
> -	{ i915_perf_sysctl_register, i915_perf_sysctl_unregister },
> -};
> -static int init_progress;
> -
> -static int __init i915_init(void)
> -{
> -	int err, i;
> -
> -	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
> -		err = init_funcs[i].init();
> -		if (err < 0) {
> -			while (i--) {
> -				if (init_funcs[i].exit)
> -					init_funcs[i].exit();
> -			}
> -			return err;
> -		} else if (err > 0) {
> -			/*
> -			 * Early-exit success is reserved for things which
> -			 * don't have an exit() function because we have no
> -			 * idea how far they got or how to partially tear
> -			 * them down.
> -			 */
> -			WARN_ON(init_funcs[i].exit);
> -
> -			/*
> -			 * We don't want to advertise devices with an only
> -			 * partially initialized driver.
> -			 */
> -			WARN_ON(i915_pci_driver.driver.owner);
> -			break;
> -		}
> -	}
> -
> -	init_progress = i;
> -
> -	return 0;
> -}
> -
> -static void __exit i915_exit(void)
> -{
> -	int i;
> -
> -	for (i = init_progress - 1; i >= 0; i--) {
> -		GEM_BUG_ON(i >= ARRAY_SIZE(init_funcs));
> -		if (init_funcs[i].exit)
> -			init_funcs[i].exit();
> -	}
> -}
> -
> -module_init(i915_init);
> -module_exit(i915_exit);
> -
> -MODULE_AUTHOR("Tungsten Graphics, Inc.");
> -MODULE_AUTHOR("Intel Corporation");
> -
> -MODULE_DESCRIPTION(DRIVER_DESC);
> -MODULE_LICENSE("GPL and additional rights");
> diff --git a/drivers/gpu/drm/i915/i915_pci.h b/drivers/gpu/drm/i915/i915_pci.h
> new file mode 100644
> index 000000000000..b386f319f52e
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/i915_pci.h
> @@ -0,0 +1,8 @@
> +/*
> + * SPDX-License-Identifier: MIT
> + *
> + * Copyright © 2021 Intel Corporation
> + */
> +
> +int i915_register_pci_driver(void);
> +void i915_unregister_pci_driver(void);
