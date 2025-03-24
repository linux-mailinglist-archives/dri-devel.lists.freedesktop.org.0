Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AD8A6DD91
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 16:00:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB2710E23D;
	Mon, 24 Mar 2025 15:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IMmtkL8C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507B110E23D;
 Mon, 24 Mar 2025 15:00:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 37A4A44529;
 Mon, 24 Mar 2025 15:00:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742828417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=EnFMPLx7M/kZHQAxYRBwHRfuXIf9zIzQgVdOcnEKHIc=;
 b=IMmtkL8CSFNu64h/YsLX8xGaUa62RQGndUQc7BsSEq8BHik7+/3rDEPhtNykJFMF0FBCjf
 LiJQYer/VLGPI2pDBk6k9fke81WvHLmhAQbboBcmJ5RMxQ5TRPzpzf/mietognrYFlQ6MV
 /kVziJ8V4U2QlrzmjduKAGeWpuAJqeeZ2gH3ao5ggufqcaKzu4wT4FPxA+ZpQNPyAwHAPj
 YnYz5Tqp+2fpQ5oNSjjIowwiVH9fEJCrOY75GJnJnMPNdlDDU3XqF9m/O9XQ1tag2gU4Wo
 aEpeo74KrnuyMTqK6D13PeIa+ZRSqocAj1q0UppPirB46aFFqjokNPUEbvyr6A==
Message-ID: <76b58aa3-0401-41a3-930f-c49880fefbfd@bootlin.com>
Date: Mon, 24 Mar 2025 16:00:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: [PATCH v2 59/59] drm: RFC - make drm_dyndbg_user.o for
 drm-*_helpers, drivers
To: Jim Cromie <jim.cromie@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com
References: <20250320185238.447458-1-jim.cromie@gmail.com>
 <20250320185238.447458-60-jim.cromie@gmail.com>
Content-Language: en-US
Autocrypt: addr=louis.chauvet@bootlin.com; keydata=
 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
In-Reply-To: <20250320185238.447458-60-jim.cromie@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedttdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfhuffvvehfjggtgfesthekredttddvjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetfffhtdeigfehffduuedvkeefgfdvuddugfffteetffdvteffgfejvedugffgffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudegpdhrtghpthhtohepjhhimhdrtghrohhmihgvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegrmhguqdhgfhigsehlihhsthhsr
 dhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepihhnthgvlhdqghhvthdquggvvheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehinhhtvghlqdhgfhigsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepihhnthgvlhdqghhfgidqthhrhigsohhtsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepjhgsrghrohhnsegrkhgrmhgrihdrtghomh
X-GND-Sasl: louis.chauvet@bootlin.com
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



Le 20/03/2025 à 19:52, Jim Cromie a écrit :
> Add new drm_dyndbg_user.c with a single call to
> DYNDBG_CLASSMAP_USE(drm_debug_classes).  This creates a _class_user
> record (and a linkage dependency).

I agree, this could be a very nice thing to automagically have the _USE 
call included. But if this remains a per-module work, I think it is 
better in the C code, it is less error-prone.

Maybe to clarify this is a per-module call, you can move it near the 
MODULE_* macros.

> If a driver adds this object to its Makefile target, it gets the
> record, which authorizes dyndbg to enable the module's class'd
> pr_debugs, such as DRMs <category>_dbg() macros.
> 
> So Id like to automatically inject this object into drivers.  I tried
> subdir-objs-y, but thats not a thing.
> 
> In drm/Makefile:
> 
> Add object dependency to drm_*_helper-y targets:
> 
>    $targ-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
> 
> Attempt a foreach:
> 
>    to add $driver-y += ../drm_dyndbg_user.o
> 
> this appears to be a train-wreck for impl reasons, but it describes a
> want/need reasonably well.  It might not be a good maintainble idea.
> 
> Explicitly adding to radeon/Makefile worked:
> 
>    $radeon-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += ../drm_dyndbg_user.o
> 
> But doing this is just as per-module as just adding the _USE()
> explicitly to the main .c file, which is less magical than make-fu.
> 
> Also, it appears to cause make && make rebuilds.
> 
> and try to link it to helpers and everything
> 
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>   drivers/gpu/drm/Makefile          |  9 +++++++++
>   drivers/gpu/drm/drm_dyndbg_user.c | 11 +++++++++++
>   2 files changed, 20 insertions(+)
>   create mode 100644 drivers/gpu/drm/drm_dyndbg_user.c
> 
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 704f94efc804..1adb5a262180 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -74,10 +74,12 @@ drm-y := \
>   	drm_vblank_work.o \
>   	drm_vma_manager.o \
>   	drm_writeback.o
> +
>   drm-$(CONFIG_DRM_CLIENT) += \
>   	drm_client.o \
>   	drm_client_event.o \
>   	drm_client_modeset.o
> +
>   drm-$(CONFIG_DRM_LIB_RANDOM) += lib/drm_random.o
>   drm-$(CONFIG_COMPAT) += drm_ioc32.o
>   drm-$(CONFIG_DRM_PANEL) += drm_panel.o
> @@ -111,20 +113,25 @@ obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
>   drm_dma_helper-y := drm_gem_dma_helper.o
>   drm_dma_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_dma.o
>   drm_dma_helper-$(CONFIG_DRM_KMS_HELPER) += drm_fb_dma_helper.o
> +drm_dma_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
>   obj-$(CONFIG_DRM_GEM_DMA_HELPER) += drm_dma_helper.o
>   
>   drm_shmem_helper-y := drm_gem_shmem_helper.o
>   drm_shmem_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_shmem.o
> +drm_shmem_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
>   obj-$(CONFIG_DRM_GEM_SHMEM_HELPER) += drm_shmem_helper.o
>   
>   drm_suballoc_helper-y := drm_suballoc.o
> +drm_suballoc_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
>   obj-$(CONFIG_DRM_SUBALLOC_HELPER) += drm_suballoc_helper.o
>   
>   drm_vram_helper-y := drm_gem_vram_helper.o
> +drm_vram_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
>   obj-$(CONFIG_DRM_VRAM_HELPER) += drm_vram_helper.o
>   
>   drm_ttm_helper-y := drm_gem_ttm_helper.o
>   drm_ttm_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fbdev_ttm.o
> +drm_ttm_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
>   obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
>   
>   #
> @@ -149,11 +156,13 @@ drm_kms_helper-y := \
>   	drm_simple_kms_helper.o
>   drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
>   drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
> +drm_kms_helper-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
>   obj-$(CONFIG_DRM_KMS_HELPER) += drm_kms_helper.o
>   
>   #
>   # Drivers and the rest
>   #
> +subdir-obj-$(CONFIG_DRM_USE_DYNAMIC_DEBUG) += drm_dyndbg_user.o
>   
>   obj-y			+= tests/
>   
> diff --git a/drivers/gpu/drm/drm_dyndbg_user.c b/drivers/gpu/drm/drm_dyndbg_user.c
> new file mode 100644
> index 000000000000..9e4aa87d4b58
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_dyndbg_user.c
> @@ -0,0 +1,11 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include "drm/drm_print.h"
> +/*
> + * if DRM_USE_DYNAMIC_DEBBUG:
> + *    DYNDBG_CLASSMAP_USE(drm_debug_classes);
> + *
> + * dyndbg classmaps are opt-in, so modules which call drm:_*_dbg must
> + * link this to authorize dyndbg to change the static-keys underneath.
> + */
> +DRM_CLASSMAP_USE(drm_debug_classes);

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


