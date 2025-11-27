Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F225C8D4F1
	for <lists+dri-devel@lfdr.de>; Thu, 27 Nov 2025 09:19:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93ADC10E791;
	Thu, 27 Nov 2025 08:19:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.b="EgtTQ+X5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ABAB10E09C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Nov 2025 01:23:30 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4779a637712so1611315e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 17:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=suse.com; s=google; t=1764206609; x=1764811409; darn=lists.freedesktop.org; 
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:date:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tNuNk1yaizw865Qq2SQ1TPwZonHkT+uQRcwOIFsLCps=;
 b=EgtTQ+X5QxX9hR5f7knmvWQ65LT6XV64WqUhOa9bqmINgKOYf45SQS0JaGj2hB4Kao
 pZbrz8M2pqus28XaXi+JjvA4S81TwSJ7jAFuE5226YxPQ5sYjBKRs2uv/pZGAkZBy9bW
 7FBlqQTBSBHwA139okIsG8EgJ8LsYS+Hv8eI4CHTiMnpKJH17nWnnwTXfSOhl9ewVJlw
 Tm75ZJcduqcCFKAvpoZ8no3WFFFy27esiPRFjtQP+XNdd2eUfjiChtvCvuL9+O/YQUTG
 eg9d0zSV3/MWbVSGaX8Zpsqj2y5xVJL0ddkFzpHjoD6rDjNExtrPUvzx90EEDbkSALHO
 XtyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764206609; x=1764811409;
 h=user-agent:in-reply-to:content-disposition:mime-version:references
 :message-id:subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tNuNk1yaizw865Qq2SQ1TPwZonHkT+uQRcwOIFsLCps=;
 b=g2R34Ls23/TBxD59WxniBqIOOnsx/qWUAbXCGl9p3UlhVc/bAnBgoBAUCfyYGC8ASd
 LSuj3uUjpMIdy4fP6uWSmr4k4tJt/JhuGyvbIN3/Isp65iKJgRFOKVWOIGF/Za0dsW8/
 YoRbF9K7y/6BDVvKFRFMJXEumNNPxSQ9kIeq3sz9a48rdf6K/U3FnKfm2k4vvGjIafDg
 lvSVbQ0Lf3KQd2x3lAa6zX0f9aFda5irroOQoZ0b8KWVII7m+ATR+582dXK+kHqpxfk+
 +8iEP6TY2Jaa8QHc9jPkJSL/gI0uN/OCY+NTjw+buTdgDL6JNzlALGijIdzZYf5MU2y5
 JMLw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV057t5nxHi0iFDzFZBLy2yTSn6SnZw9uONPK+PzGuWGu7qJYAiVcNC46bdKSqPEmtl0UcXcvieZ1E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzCSgaeS9ovsh5MTuF4BqKw3LDi2SS1crk1yU59c3LiMj6E/Dp
 DDL4RaZIAjPrAKsomLb4HBYuo7Wb3pe77uof4cV9hfyBDt3yiumaoNOxR2ZtPpBrZkA=
X-Gm-Gg: ASbGncsV/KD3W+NwyTAKlqHSN/w5F6zSs8KhL++5LDMgkBHMo0CbxPSLGw56U4VF6V8
 STmNVVq/Gsb/+ylNULbJrfFKyi+N8QwacofL1mSRmad1fYMErOORGj/kYRb/QDxCf3r4LWWLvFw
 TgaFAtBumXUpi1a+Xobmd91jdpglliNZDMrOi0uMzOMCGGIp2fqJ3ogFRyv+I2XRdEYnoS3MWmC
 d9K3yeP4ohdtBN/67aPyEJ6zfgUiWw9xmXs5wFbqTz62URJtQzkwffECeAUS7qh4u2qCzteviGg
 Ym0ls4khvUcY4+Hovr67amzG/h676x+kJBLckRCX1C59nwqXURf5szrUgjusxjVJP+ztUjP0RNj
 +mLTqaD7LiRQ/tqhAJlWfbfF2TAMi1bQxBlURK+EgJTOTs3/SUTGmFOIX6SI+V24H+B25a0co/b
 rPG6R76R/LbOMqEVc8muQtS50moyDL9cdJ
X-Google-Smtp-Source: AGHT+IFAI6GQD9lcY1JxdhkE8Lv0II4oKq4ojcJkBaGXT4DCZOTPlduoBmiQE99ST1DmviiNV2jnsw==
X-Received: by 2002:a05:600c:450f:b0:46d:ba6d:65bb with SMTP id
 5b1f17b1804b1-477c01eb9bdmr241739295e9.31.1764206608732; 
 Wed, 26 Nov 2025 17:23:28 -0800 (PST)
Received: from r1chard (1-169-246-18.dynamic-ip.hinet.net. [1.169.246.18])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3f0243b19sm22661544b3a.37.2025.11.26.17.23.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 17:23:27 -0800 (PST)
From: Richard Lyu <richard.lyu@suse.com>
X-Google-Original-From: Richard Lyu <r1chard@r1chard>
Date: Thu, 27 Nov 2025 09:23:19 +0800
To: Thomas Zimmermann <tzimmermann@suse.de>, ardb@kernel.org,
 javierm@redhat.com, arnd@arndb.de, helgaas@kernel.org
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 5/9] sysfb: Pass sysfb_primary_display to devices
Message-ID: <aSeoB1xf05i4LhCp@r1chard>
References: <20251126160854.553077-1-tzimmermann@suse.de>
 <20251126160854.553077-6-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126160854.553077-6-tzimmermann@suse.de>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Mailman-Approved-At: Thu, 27 Nov 2025 08:19:07 +0000
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


Reviewed-by: Richard Lyu <richard.lyu@suse.com>

On 2025/11/26 17:03, Thomas Zimmermann wrote:
> Instead of screen_info, store a copy of sysfb_primary_display as
> device data. Pick it up in drivers. Later changes will add additional
> data to the display info, such as EDID information.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> ---
>  drivers/firmware/sysfb.c        |  5 +++--
>  drivers/gpu/drm/sysfb/efidrm.c  |  9 ++++++---
>  drivers/gpu/drm/sysfb/vesadrm.c |  9 ++++++---
>  drivers/video/fbdev/efifb.c     | 10 ++++++----
>  drivers/video/fbdev/vesafb.c    | 10 ++++++----
>  drivers/video/fbdev/vga16fb.c   |  8 +++++---
>  6 files changed, 32 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 1f671f9219b0..8833582c1883 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -141,7 +141,8 @@ static struct device *sysfb_parent_dev(const struct screen_info *si)
>  
>  static __init int sysfb_init(void)
>  {
> -	struct screen_info *si = &sysfb_primary_display.screen;
> +	struct sysfb_display_info *dpy = &sysfb_primary_display;
> +	struct screen_info *si = &dpy->screen;
>  	struct device *parent;
>  	unsigned int type;
>  	struct simplefb_platform_data mode;
> @@ -202,7 +203,7 @@ static __init int sysfb_init(void)
>  
>  	sysfb_set_efifb_fwnode(si, pd);
>  
> -	ret = platform_device_add_data(pd, si, sizeof(*si));
> +	ret = platform_device_add_data(pd, dpy, sizeof(*dpy));
>  	if (ret)
>  		goto err;
>  
> diff --git a/drivers/gpu/drm/sysfb/efidrm.c b/drivers/gpu/drm/sysfb/efidrm.c
> index 1b683d55d6ea..29533ae8fbbf 100644
> --- a/drivers/gpu/drm/sysfb/efidrm.c
> +++ b/drivers/gpu/drm/sysfb/efidrm.c
> @@ -4,7 +4,7 @@
>  #include <linux/efi.h>
>  #include <linux/limits.h>
>  #include <linux/platform_device.h>
> -#include <linux/screen_info.h>
> +#include <linux/sysfb.h>
>  
>  #include <drm/clients/drm_client_setup.h>
>  #include <drm/drm_atomic.h>
> @@ -141,6 +141,7 @@ static const struct drm_mode_config_funcs efidrm_mode_config_funcs = {
>  static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
>  						  struct platform_device *pdev)
>  {
> +	const struct sysfb_display_info *dpy;
>  	const struct screen_info *si;
>  	const struct drm_format_info *format;
>  	int width, height, stride;
> @@ -160,9 +161,11 @@ static struct efidrm_device *efidrm_device_create(struct drm_driver *drv,
>  	size_t nformats;
>  	int ret;
>  
> -	si = dev_get_platdata(&pdev->dev);
> -	if (!si)
> +	dpy = dev_get_platdata(&pdev->dev);
> +	if (!dpy)
>  		return ERR_PTR(-ENODEV);
> +	si = &dpy->screen;
> +
>  	if (screen_info_video_type(si) != VIDEO_TYPE_EFI)
>  		return ERR_PTR(-ENODEV);
>  
> diff --git a/drivers/gpu/drm/sysfb/vesadrm.c b/drivers/gpu/drm/sysfb/vesadrm.c
> index 7b7b5ba26317..16fc223f8c5b 100644
> --- a/drivers/gpu/drm/sysfb/vesadrm.c
> +++ b/drivers/gpu/drm/sysfb/vesadrm.c
> @@ -4,7 +4,7 @@
>  #include <linux/ioport.h>
>  #include <linux/limits.h>
>  #include <linux/platform_device.h>
> -#include <linux/screen_info.h>
> +#include <linux/sysfb.h>
>  
>  #include <drm/clients/drm_client_setup.h>
>  #include <drm/drm_atomic.h>
> @@ -391,6 +391,7 @@ static const struct drm_mode_config_funcs vesadrm_mode_config_funcs = {
>  static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
>  						    struct platform_device *pdev)
>  {
> +	const struct sysfb_display_info *dpy;
>  	const struct screen_info *si;
>  	const struct drm_format_info *format;
>  	int width, height, stride;
> @@ -410,9 +411,11 @@ static struct vesadrm_device *vesadrm_device_create(struct drm_driver *drv,
>  	size_t nformats;
>  	int ret;
>  
> -	si = dev_get_platdata(&pdev->dev);
> -	if (!si)
> +	dpy = dev_get_platdata(&pdev->dev);
> +	if (!dpy)
>  		return ERR_PTR(-ENODEV);
> +	si = &dpy->screen;
> +
>  	if (screen_info_video_type(si) != VIDEO_TYPE_VLFB)
>  		return ERR_PTR(-ENODEV);
>  
> diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
> index 0e1bd3dba255..47ebc0107209 100644
> --- a/drivers/video/fbdev/efifb.c
> +++ b/drivers/video/fbdev/efifb.c
> @@ -15,7 +15,7 @@
>  #include <linux/fb.h>
>  #include <linux/platform_device.h>
>  #include <linux/printk.h>
> -#include <linux/screen_info.h>
> +#include <linux/sysfb.h>
>  #include <video/vga.h>
>  #include <asm/efi.h>
>  #include <drm/drm_utils.h> /* For drm_get_panel_orientation_quirk */
> @@ -345,6 +345,7 @@ ATTRIBUTE_GROUPS(efifb);
>  
>  static int efifb_probe(struct platform_device *dev)
>  {
> +	struct sysfb_display_info *dpy;
>  	struct screen_info *si;
>  	struct fb_info *info;
>  	struct efifb_par *par;
> @@ -360,10 +361,11 @@ static int efifb_probe(struct platform_device *dev)
>  	 * driver. We get a copy of the attached screen_info, so that we can
>  	 * modify its values without affecting later drivers.
>  	 */
> -	si = dev_get_platdata(&dev->dev);
> -	if (!si)
> +	dpy = dev_get_platdata(&dev->dev);
> +	if (!dpy)
>  		return -ENODEV;
> -	si = devm_kmemdup(&dev->dev, si, sizeof(*si), GFP_KERNEL);
> +
> +	si = devm_kmemdup(&dev->dev, &dpy->screen, sizeof(*si), GFP_KERNEL);
>  	if (!si)
>  		return -ENOMEM;
>  
> diff --git a/drivers/video/fbdev/vesafb.c b/drivers/video/fbdev/vesafb.c
> index f135033c22fb..f84f4db244bf 100644
> --- a/drivers/video/fbdev/vesafb.c
> +++ b/drivers/video/fbdev/vesafb.c
> @@ -20,7 +20,7 @@
>  #include <linux/ioport.h>
>  #include <linux/init.h>
>  #include <linux/platform_device.h>
> -#include <linux/screen_info.h>
> +#include <linux/sysfb.h>
>  #include <linux/io.h>
>  
>  #include <video/vga.h>
> @@ -243,6 +243,7 @@ static int vesafb_setup(char *options)
>  
>  static int vesafb_probe(struct platform_device *dev)
>  {
> +	struct sysfb_display_info *dpy;
>  	struct screen_info *si;
>  	struct fb_info *info;
>  	struct vesafb_par *par;
> @@ -257,10 +258,11 @@ static int vesafb_probe(struct platform_device *dev)
>  	 * driver. We get a copy of the attached screen_info, so that we can
>  	 * modify its values without affecting later drivers.
>  	 */
> -	si = dev_get_platdata(&dev->dev);
> -	if (!si)
> +	dpy = dev_get_platdata(&dev->dev);
> +	if (!dpy)
>  		return -ENODEV;
> -	si = devm_kmemdup(&dev->dev, si, sizeof(*si), GFP_KERNEL);
> +
> +	si = devm_kmemdup(&dev->dev, &dpy->screen, sizeof(*si), GFP_KERNEL);
>  	if (!si)
>  		return -ENOMEM;
>  
> diff --git a/drivers/video/fbdev/vga16fb.c b/drivers/video/fbdev/vga16fb.c
> index 6b81337a4909..22085d3668e8 100644
> --- a/drivers/video/fbdev/vga16fb.c
> +++ b/drivers/video/fbdev/vga16fb.c
> @@ -21,7 +21,7 @@
>  #include <linux/ioport.h>
>  #include <linux/init.h>
>  #include <linux/platform_device.h>
> -#include <linux/screen_info.h>
> +#include <linux/sysfb.h>
>  
>  #include <asm/io.h>
>  #include <video/vga.h>
> @@ -1305,15 +1305,17 @@ static const struct fb_ops vga16fb_ops = {
>  
>  static int vga16fb_probe(struct platform_device *dev)
>  {
> +	struct sysfb_display_info *dpy;
>  	struct screen_info *si;
>  	struct fb_info *info;
>  	struct vga16fb_par *par;
>  	int i;
>  	int ret = 0;
>  
> -	si = dev_get_platdata(&dev->dev);
> -	if (!si)
> +	dpy = dev_get_platdata(&dev->dev);
> +	if (!dpy)
>  		return -ENODEV;
> +	si = &dpy->screen;
>  
>  	ret = check_mode_supported(si);
>  	if (ret)
> -- 
> 2.51.1
> 
