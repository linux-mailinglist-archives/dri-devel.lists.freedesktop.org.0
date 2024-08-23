Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4DF95D58D
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 20:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA37B10E073;
	Fri, 23 Aug 2024 18:53:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.b="X7XP8gy/";
	dkim=permerror (0-bit key) header.d=ravnborg.org header.i=@ravnborg.org header.b="y55+jh3Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod2-cph3.one.com
 (mailrelay3-1.pub.mailoutpod2-cph3.one.com [46.30.211.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606AC10E073
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 18:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Ing5y83DLTTn55EUMYXnCv9ZY7skLyZoKcixFqXqMdE=;
 b=X7XP8gy/Yr5lGcX7PR2qYFaVQ26E2VGlzwA4HBnaIWWhZhdVHcXkad68vJoyrylZJcaUIUsd2QgxL
 qEyR+NsYNqBVPGZFPaLHF8Re+/Xk0jYwI7CG2+/UW5E/XGKp1Vwaqi49nHdPgvIqeLabXfFXG+RpgV
 OARvVQMNFSMBRSLpSVoXhMxjZ0CtO8lAWLEl3CEfS0CY+/54HhQZ1iPhSHL3BQEEBaE28Q6Muq5jq0
 nPZ5Tnr/EVHocYzcQr0k/YN42woRdYmxYaZUlsVcF+UFD6NSwf9ZtPCyK/YJuatTg8gUrJRqKlXZLM
 gU1WpcGzVsK1N9slC2//0oXluPL+4Nw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Ing5y83DLTTn55EUMYXnCv9ZY7skLyZoKcixFqXqMdE=;
 b=y55+jh3YqafrHodzYngAwX+sOueuibBwiDJR2M3qeAUXxIbeQjgBxITU4jyQoPR/TVelc0jULhlMb
 kiBh3hHBw==
X-HalOne-ID: c52ed93c-6180-11ef-b761-dd3f8b2e2fd4
Received: from ravnborg.org (2-105-16-150-cable.dk.customer.tdc.net
 [2.105.16.150])
 by mailrelay3.pub.mailoutpod2-cph3.one.com (Halon) with ESMTPSA
 id c52ed93c-6180-11ef-b761-dd3f8b2e2fd4;
 Fri, 23 Aug 2024 18:51:57 +0000 (UTC)
Date: Fri, 23 Aug 2024 20:51:56 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@gmail.com, jfalempe@redhat.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Boris Brezillon <bbrezillon@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v2 11/86] drm/atmel-hdlcd: Run DRM default client setup
Message-ID: <20240823185156.GA367392@ravnborg.org>
References: <20240821130348.73038-1-tzimmermann@suse.de>
 <20240821130348.73038-12-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240821130348.73038-12-tzimmermann@suse.de>
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

On Wed, Aug 21, 2024 at 02:59:08PM +0200, Thomas Zimmermann wrote:
> Call drm_client_setup_with_fourcc() to run the kernel's default client
> setup for DRM. Set fbdev_probe in struct drm_driver, so that the client
> setup can start the common fbdev client.
> 
> v2:
> - use drm_client_setup_with_fourcc()
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Boris Brezillon <bbrezillon@kernel.org>
> Cc: Nicolas Ferre <nicolas.ferre@microchip.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>

Hi Thomas.

> ---
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> index 9ce429f889ca..ca5bde8ac300 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c
> @@ -18,8 +18,10 @@
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> +#include <drm/drm_client_setup.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_fbdev_dma.h>
> +#include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_dma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_module.h>
> @@ -865,7 +867,7 @@ static int atmel_hlcdc_dc_drm_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_unload;
>  
> -	drm_fbdev_dma_setup(ddev, 24);
> +	drm_client_setup_with_fourcc(ddev, DRM_FORMAT_RGB888);
>  
>  	return 0;

I looks like a patch is missing to add DRM_FBDEV_DMA_DRIVER_OPS to
struct drm_driver?

	Sam
