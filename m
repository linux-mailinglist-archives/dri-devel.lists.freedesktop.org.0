Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8178EA4C890
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 18:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DFD810E251;
	Mon,  3 Mar 2025 17:02:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="T7LvTxxP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8611210E251
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 17:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=CfH1W5ICLir4G+bFsHfAvdUcpRrzsur0+zqzr6r7JdE=; b=T7LvTxxP0j36A4ga
 KXmDsQpwk4v4olWks/wUbvrRZAHBvrULflicz2MvxpQhmI7mFasK+EZvPeZ4aG1dzAHa9bSJqysXb
 aLakJEeMfap703/rV/OXSGjD7IScMAUW+tl1yyXIrQ4+HwmXvTYTzOIzjepf8d0IDhS+pxQcyZbek
 owUKP0hafSlZ3tdE3N3JIt6Jk/rawWMXsmer4la73Wu7uR4+xujtkk/EURhBJ20K2ij9s2OIgQfV6
 k2QsoS2yesU19cfXhxgh4Zut94fqvSPGVZoY42p+oBT4T1And6rhphRfpf4ympI1hbYXtnDvL1xk4
 Pe66XnbCY/x74Z9Usg==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1tp9Bs-002BqR-3D;
 Mon, 03 Mar 2025 17:02:52 +0000
Date: Mon, 3 Mar 2025 17:02:52 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: anitha.chrisanthus@intel.com, edmund.j.dea@intel.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/kmb: Remove unused const and defines
Message-ID: <Z8XgvEpKdUAug_Bf@gallifrey>
References: <20250125001353.223974-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20250125001353.223974-1-linux@treblig.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 17:01:16 up 299 days,  4:15,  1 user,  load average: 0.13, 0.06, 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* linux@treblig.org (linux@treblig.org) wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> layer_irqs[] was added in 2020 as part of
> commit 7f7b96a8a0a1 ("drm/kmb: Add support for KeemBay Display")
> but isn't used.
> 
> Remove it.
> 
> It was the only user of the LCD_INT_VL0, LCD_INT_VL1, LCD_INT_GL0
> and LCD_INT_GL1 defines.
> 
> Remove them.
> 
> commit c026565fe9be ("drm/kmb: Enable alpha blended second plane")
> added a second copy of the POSSIBLE_CRTCS define.
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Hi,
  Can someone please review or pick up this one please.

Thanks,

Dave

> ---
>  drivers/gpu/drm/kmb/kmb_plane.c | 7 -------
>  drivers/gpu/drm/kmb/kmb_plane.h | 5 -----
>  2 files changed, 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
> index 9e0562aa2bcb..5a8c7cbf27b0 100644
> --- a/drivers/gpu/drm/kmb/kmb_plane.c
> +++ b/drivers/gpu/drm/kmb/kmb_plane.c
> @@ -17,13 +17,6 @@
>  #include "kmb_plane.h"
>  #include "kmb_regs.h"
>  
> -const u32 layer_irqs[] = {
> -	LCD_INT_VL0,
> -	LCD_INT_VL1,
> -	LCD_INT_GL0,
> -	LCD_INT_GL1
> -};
> -
>  /* Conversion (yuv->rgb) matrix from myriadx */
>  static const u32 csc_coef_lcd[] = {
>  	1024, 0, 1436,
> diff --git a/drivers/gpu/drm/kmb/kmb_plane.h b/drivers/gpu/drm/kmb/kmb_plane.h
> index b51144044fe8..ad8b9a67c57f 100644
> --- a/drivers/gpu/drm/kmb/kmb_plane.h
> +++ b/drivers/gpu/drm/kmb/kmb_plane.h
> @@ -25,14 +25,9 @@
>  
>  #define LCD_INT_GL0_ERR (LAYER2_DMA_FIFO_OVERFLOW | LAYER2_DMA_FIFO_UNDERFLOW)
>  #define LCD_INT_GL1_ERR (LAYER3_DMA_FIFO_OVERFLOW | LAYER3_DMA_FIFO_UNDERFLOW)
> -#define LCD_INT_VL0 (LAYER0_DMA_DONE | LAYER0_DMA_IDLE | LCD_INT_VL0_ERR)
> -#define LCD_INT_VL1 (LAYER1_DMA_DONE | LAYER1_DMA_IDLE | LCD_INT_VL1_ERR)
> -#define LCD_INT_GL0 (LAYER2_DMA_DONE | LAYER2_DMA_IDLE | LCD_INT_GL0_ERR)
> -#define LCD_INT_GL1 (LAYER3_DMA_DONE | LAYER3_DMA_IDLE | LCD_INT_GL1_ERR)
>  #define LCD_INT_DMA_ERR (LCD_INT_VL0_ERR | LCD_INT_VL1_ERR \
>  		| LCD_INT_GL0_ERR | LCD_INT_GL1_ERR)
>  
> -#define POSSIBLE_CRTCS 1
>  #define to_kmb_plane(x) container_of(x, struct kmb_plane, base_plane)
>  
>  #define POSSIBLE_CRTCS		1
> -- 
> 2.48.1
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
