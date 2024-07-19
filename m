Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECCD9379E5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 17:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5033510EC5E;
	Fri, 19 Jul 2024 15:28:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkZ0ZHdJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6DF10EC55
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 15:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721402923; x=1752938923;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=O400daFFa/G3BKwxuAnLFE1c7TEZSJZfbuzcib5iwLk=;
 b=VkZ0ZHdJE6aWe7VjgiQFRPzFdW0o1YUqL9cVrdx0xlEFBjcAA6ZWwi0z
 iNAAKEiwklCUDbroPSntOQSlBhGqvpfNQ36KUQHovejxS6zNbsA5cMFYv
 E3TfJ5MnXfIlNA7JECvYeJthTmzYQfG47C5wbZ/epQOonyCuNCG0Lsapb
 JotjmxX3onuSqBYuX2YsP43McAnYamfXi4qwYFu10gSyn8JZc1xX0e2f4
 gTd2aHNFrfsBccBeHFnBCfzMm1qq91tFcO8VZwR0a/gt1gDaP42N1l9Dw
 l7Do2Socxz6TCJGGY8bJbLwciKLbjFH7JJmZw1kw5zEUBp/9vPCG8/ra6 Q==;
X-CSE-ConnectionGUID: CfQ8UdYtTkKL0Ag8NA1h7g==
X-CSE-MsgGUID: qyrGpHrwQZqDXgIlaHEMFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11138"; a="44445404"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="44445404"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2024 08:28:41 -0700
X-CSE-ConnectionGUID: grGiz4aNQpioYEm6B+EVgg==
X-CSE-MsgGUID: KvYirWC6TOCadnClvrjp9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="51761812"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by orviesa007.jf.intel.com with ESMTP; 19 Jul 2024 08:28:39 -0700
Received: from [10.245.82.99] (mwajdecz-MOBL.ger.corp.intel.com [10.245.82.99])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 7BB132816F;
 Fri, 19 Jul 2024 16:28:37 +0100 (IST)
Message-ID: <0bc6a8d1-d206-4d64-b170-bd70c7129f80@intel.com>
Date: Fri, 19 Jul 2024 17:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panic: Add missing static inline to
 drm_panic_is_enabled()
To: Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>
References: <20240719122051.1507927-1-jfalempe@redhat.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20240719122051.1507927-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 19.07.2024 14:20, Jocelyn Falempe wrote:
> This breaks build if DRM_PANIC is not enabled.
> Also add the missing include drm_crtc_internal.h in drm_panic.c
> 
> Fixes: 9f774c42a908 ("drm/panic: Add drm_panic_is_enabled()")
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_crtc_internal.h | 2 +-
>  drivers/gpu/drm/drm_panic.c         | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
> index c10de39cbe83..bbac5350774e 100644
> --- a/drivers/gpu/drm/drm_crtc_internal.h
> +++ b/drivers/gpu/drm/drm_crtc_internal.h
> @@ -321,7 +321,7 @@ drm_edid_load_firmware(struct drm_connector *connector)
>  #ifdef CONFIG_DRM_PANIC
>  bool drm_panic_is_enabled(struct drm_device *dev);
>  #else
> -bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
> +static inline bool drm_panic_is_enabled(struct drm_device *dev) {return false; }
>  #endif

shouldn't this whole chunk be part of <drm/drm_panic.h> ?
other exported drm_panic functions have forward declarations there

>  
>  #endif /* __DRM_CRTC_INTERNAL_H__ */
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 9f1a3568e62d..072752b658f0 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -27,6 +27,8 @@
>  #include <drm/drm_plane.h>
>  #include <drm/drm_print.h>
>  
> +#include "drm_crtc_internal.h"

then you will not need this include here

> +
>  MODULE_AUTHOR("Jocelyn Falempe");
>  MODULE_DESCRIPTION("DRM panic handler");
>  MODULE_LICENSE("GPL");
