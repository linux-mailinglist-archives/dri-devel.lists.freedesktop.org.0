Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809FD3691CA
	for <lists+dri-devel@lfdr.de>; Fri, 23 Apr 2021 14:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726196EB85;
	Fri, 23 Apr 2021 12:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052F96EB87
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 12:12:11 +0000 (UTC)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3BD5332;
 Fri, 23 Apr 2021 14:12:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1619179930;
 bh=ztHZDpJmzKliKSCR4Gs3CUFc3lpmrS2nHqGxB96U5X4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HCh/1cFwFsA9JJkCBA0NUM+FS7SYTb7uYKJy1QkG8MQK+tuOaj/mq95QTaWjnylJl
 8U5uXdLKlzhHz4o6SoiU83XwoDQEfxmMvCnMFmHSevCqkRH98ISgwvU1HuEeW5lVgj
 fHJmjy9rFavo5WtPFk76nMb8ZYxaHFmkkhBK4hTU=
Subject: Re: [PATCH 18/40] drm/omapdrm/omap_irq: Fix a couple of incorrectly
 documented functions
To: Lee Jones <lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-19-lee.jones@linaro.org>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <3371e3d9-752c-b301-a28e-f043c869ecdf@ideasonboard.com>
Date: Fri, 23 Apr 2021 15:12:08 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210416143725.2769053-19-lee.jones@linaro.org>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <rob.clark@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/04/2021 17:37, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/gpu/drm/omapdrm/omap_irq.c:114: warning: expecting prototype for enable_vblank(). Prototype was for omap_irq_enable_vblank() instead
>   drivers/gpu/drm/omapdrm/omap_irq.c:140: warning: expecting prototype for disable_vblank(). Prototype was for omap_irq_disable_vblank() instead
> 
> Cc: Tomi Valkeinen <tomba@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Clark <rob.clark@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   drivers/gpu/drm/omapdrm/omap_irq.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
> index 15148d4b35b57..dff095c864909 100644
> --- a/drivers/gpu/drm/omapdrm/omap_irq.c
> +++ b/drivers/gpu/drm/omapdrm/omap_irq.c
> @@ -99,7 +99,7 @@ int omap_irq_enable_framedone(struct drm_crtc *crtc, bool enable)
>   }
>   
>   /**
> - * enable_vblank - enable vblank interrupt events
> + * omap_irq_enable_vblank - enable vblank interrupt events
>    * @crtc: DRM CRTC
>    *
>    * Enable vblank interrupts for @crtc.  If the device doesn't have
> @@ -129,7 +129,7 @@ int omap_irq_enable_vblank(struct drm_crtc *crtc)
>   }
>   
>   /**
> - * disable_vblank - disable vblank interrupt events
> + * omap_irq_disable_vblank - disable vblank interrupt events
>    * @crtc: DRM CRTC
>    *
>    * Disable vblank interrupts for @crtc.  If the device doesn't have
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
