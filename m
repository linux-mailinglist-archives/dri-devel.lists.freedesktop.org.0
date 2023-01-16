Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D1C66D02C
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 21:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE0610E4B5;
	Mon, 16 Jan 2023 20:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:403::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B451110E4B5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 20:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=U6Ag7c7NdZCMU3zYe0zGoudpAKYkP6dwFAin/8jJBMo=;
 b=oNj8qiOf1lrWzsz6KUDFWXXnNwXYbURvC0zUEYYDp3q/8wsv+KLHJvTkctv3NQ2vjAXehbJWn+KGO
 poG6BENvqtqLoYlMAEljEDng1Z3J66/tGKYWWcYCeF+BE+W0YTivvHyVtqYN+qMRDBl+jvIVp6H5bV
 M+6sVKdA0t6NiI/OcLn72gkHvd1UyQq4249nlQ460+4dcIyGTfFqoEBefbZwDrEYTcRKFncz4UZH5y
 kM83slAZqlNdKdaKPjOEm3YUtp4xNrWIFDm7XLK12vfRY7jmBF7dcFlifrQ4X71Wyy2/D4JnhObQcM
 AdBNwIeSeFySTXXItiqoyfrqrhkrTFQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=U6Ag7c7NdZCMU3zYe0zGoudpAKYkP6dwFAin/8jJBMo=;
 b=2ykuu+6MFi70+L+AeqMtfIxINz9CczWoB44YxRNe+mrUMT4GDb5GtxnY6k1MB439QnFan+F0Oqp0L
 ueln40ZDw==
X-HalOne-ID: 2988dd34-95dc-11ed-88e6-87783a957ad9
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id 2988dd34-95dc-11ed-88e6-87783a957ad9;
 Mon, 16 Jan 2023 20:27:16 +0000 (UTC)
Date: Mon, 16 Jan 2023 21:27:15 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 05/22] drm/aspeed: Remove unnecessary include statements
 for drm_crtc_helper.h
Message-ID: <Y8WzI8LNLHAbcUzl@ravnborg.org>
References: <20230116131235.18917-1-tzimmermann@suse.de>
 <20230116131235.18917-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116131235.18917-6-tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, nouveau@lists.freedesktop.org,
 linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 02:12:18PM +0100, Thomas Zimmermann wrote:
> Several source files include drm_crtc_helper.h without needing it or
> only to get its transitive include statements; leading to unnecessary
> compile-time dependencies.
> 
> Directly include required headers and drop drm_crtc_helper.h where
> possible.

Nitpicking... The above is the standard text you use.
But in many cases, like this case, the patch just drop the wrong use of
the header and do not include any required headers.

If you want to rephrase for future changelog diggers or leave it as is,
is up to you.

	Sam

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 1 -
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  | 1 -
>  drivers/gpu/drm/aspeed/aspeed_gfx_out.c  | 1 -
>  3 files changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> index 55a3444a51d8..7877a57b8e26 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
> @@ -5,7 +5,6 @@
>  #include <linux/reset.h>
>  #include <linux/regmap.h>
>  
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_fb_dma_helper.h>
>  #include <drm/drm_fourcc.h>
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> index 718119e168a6..ecfb060d2557 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
> @@ -14,7 +14,6 @@
>  #include <linux/reset.h>
>  
>  #include <drm/drm_atomic_helper.h>
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_device.h>
>  #include <drm/drm_fbdev_generic.h>
>  #include <drm/drm_gem_dma_helper.h>
> diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
> index 4f2187025a21..78775e0c853f 100644
> --- a/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
> +++ b/drivers/gpu/drm/aspeed/aspeed_gfx_out.c
> @@ -3,7 +3,6 @@
>  
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_connector.h>
> -#include <drm/drm_crtc_helper.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
>  
> -- 
> 2.39.0
