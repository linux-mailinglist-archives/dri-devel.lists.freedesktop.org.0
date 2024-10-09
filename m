Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C911F99701A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 17:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C5C310E77B;
	Wed,  9 Oct 2024 15:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZLs2vOeX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E69D10E77B
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 15:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728489493; x=1760025493;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DQ+UXJ6V9fAJtdAYV5JF+pZvbG+QV1OVa/sMvW/vdW8=;
 b=ZLs2vOeXCBmraEroFPGo9Y6D76GxN41MOkAHP9DoNUJuz8BUeU11xugJ
 gEdKEZ5dq+ovkIYywfqWzV8zOUGD5f3Yy4hkl0B75YwiHh5PI1NBxSLIk
 rB+KUuR8lyE6cSX2a0IX1JS1MejNCohYkLRcgTX+YGu7ireT8ottsC1Pa
 7zfyGSLVaSNCkhJzmzYU2FR3ZiReJ1L5vHKMye5doPdN8iJZPGeXiJ+iB
 e+xCDjMsfRRDwjGazgiycMGeKfaPqNpcYjmVTqOIkydt3HSL4swzHOu5O
 nKc4iURaI8eIz+yYPDwJUoNelsdiGYE7s7rWEcMFl6MLOaY2YuEPnqVgx A==;
X-CSE-ConnectionGUID: NDSaCF7uSySJQj36oSBkKA==
X-CSE-MsgGUID: AMg5hVY8Qa+UA93q4CDvgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="38448347"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="38448347"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 08:58:12 -0700
X-CSE-ConnectionGUID: StWuh8uQR7yw7xUh157Y4Q==
X-CSE-MsgGUID: ivsXANsTTq25vy/oUx1Bog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="76193122"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.80])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 08:58:09 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: R Sundar <prosunofficial@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, R Sundar
 <prosunofficial@gmail.com>
Subject: Re: [PATCH linux-next] drm: Fix for kernel doc warning
In-Reply-To: <20241003023806.17537-1-prosunofficial@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241003023806.17537-1-prosunofficial@gmail.com>
Date: Wed, 09 Oct 2024 18:58:06 +0300
Message-ID: <87frp58e0h.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, 03 Oct 2024, R Sundar <prosunofficial@gmail.com> wrote:
> Added colon in kernel-doc comment to fix the warning.
>
> ./include/drm/drm_drv.h:372: warning: Incorrect use of kernel-doc format:          * @fbdev_probe
> ./include/drm/drm_drv.h:435: warning: Function parameter or struct member 'fbdev_probe' not described in 'drm_driver'
>
> Signed-off-by: R Sundar <prosunofficial@gmail.com>

Pushed to drm-misc-next, thanks for the patch.

BR,
Jani.

> ---
>  include/drm/drm_drv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 36a606af4ba1..1bbbcb8e2d23 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -369,7 +369,7 @@ struct drm_driver {
>  			       uint64_t *offset);
>  
>  	/**
> -	 * @fbdev_probe
> +	 * @fbdev_probe:
>  	 *
>  	 * Allocates and initialize the fb_info structure for fbdev emulation.
>  	 * Furthermore it also needs to allocate the DRM framebuffer used to

-- 
Jani Nikula, Intel
