Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1827AAD6D0A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 12:07:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D65810E4B0;
	Thu, 12 Jun 2025 10:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 42D6F10E4B0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 10:07:04 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39CF912FC
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 03:06:44 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 23CA73F59E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 03:07:04 -0700 (PDT)
Date: Thu, 12 Jun 2025 11:06:56 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] drm/arm/malidp: Silence informational message
Message-ID: <aEqmwLRzpNDlNzoK@e110455-lin.cambridge.arm.com>
References: <20250523064042.3275926-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250523064042.3275926-1-alexander.stein@ew.tq-group.com>
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

Hi,

On Fri, May 23, 2025 at 08:40:41AM +0200, Alexander Stein wrote:
> When checking for unsupported expect an error is printed every time.
> This spams the log for platforms where this is expected, e.g. ls1028a
> having a Vivante (etnaviv) GPU and Mali display processor.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Sorry for the delay in replying, I was on holiday when you've sent the patch and
I've only found it today.

Patch looks sensible, so Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

I will push the patch today into drm-misc-next.

Best regards,
Liviu

> ---
> Every time glmark2-es2-wayland is started on a downstream kernel raises the error:
> > [drm:malidp_format_mod_supported [mali_dp]] *ERROR* Unknown modifier (not Arm)
> 
>  drivers/gpu/drm/arm/malidp_planes.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
> index 34547edf1ee3c..87f2e5ee87907 100644
> --- a/drivers/gpu/drm/arm/malidp_planes.c
> +++ b/drivers/gpu/drm/arm/malidp_planes.c
> @@ -159,7 +159,7 @@ bool malidp_format_mod_supported(struct drm_device *drm,
>  	}
>  
>  	if (!fourcc_mod_is_vendor(modifier, ARM)) {
> -		DRM_ERROR("Unknown modifier (not Arm)\n");
> +		DRM_DEBUG_KMS("Unknown modifier (not Arm)\n");
>  		return false;
>  	}
>  
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
