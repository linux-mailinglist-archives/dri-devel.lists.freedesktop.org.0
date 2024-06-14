Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 892FD9088AE
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 11:55:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E5410ECBE;
	Fri, 14 Jun 2024 09:55:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LZEtpTGT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB9610ECC8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 09:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718358925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vc9vnEGEoOkbYVmoCf71UsJOzFBKHRz5WSa94wukYEo=;
 b=LZEtpTGTcQXQl8s8Qr0cAr9OnKxfwAcvFaw9S2/+iW598ZxrqFhU8RvRHN76fgvJkiU3Rl
 ded72RPSZdr/DNYdE1dPNUS8IZiS9YDja3PHRZGwqRH4fFwG985LtJ7VNxT2EoipF/gySW
 2NwkPdu1V4KFA4JFp0Pv+n7UcIZtrL8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-474-UwZ_6ZGxOiy1Z6Hai6FQOg-1; Fri, 14 Jun 2024 05:55:24 -0400
X-MC-Unique: UwZ_6ZGxOiy1Z6Hai6FQOg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-422a0f21366so15391065e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 02:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358923; x=1718963723;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vc9vnEGEoOkbYVmoCf71UsJOzFBKHRz5WSa94wukYEo=;
 b=xJB+TUX403Jv77Tcl/thodlJ6pfBZoSXRtWnXooezHuhruuYFOJCFjTdVFb+I0O9lC
 Nc9ZNGSxp11X3MzNWq4Ewzdz6vtBSLrbJLyLkfrIwhrKLA30xYuNk4zcGX/BVPuqD/Do
 n6Tw7GqdHAFfx4HyQ/ufsQ4geJri11GUhvj87jmRHyaIVTzLe540VDkYiXOvwYQPm1oI
 MLfzdbXtHbPHX31FKIlnrd5IejBkmjUSXtnvX/V7SE/6uOPxnQKKMe3BoVpB3pkl20gv
 0YSukfwvzJwXcDaik+YZLSISGsAd3jTpV3b22p1z2O82pGz1C8aPJhZsiRVoeSPhbBbC
 8r8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXPjkrPt6EdV9DSrEsyIwwRIOWlyBR6/rAfb6ueDxhkogxgVmsGWoAD0Y2Cx/j5F4OFAddez3FktwOCSE7KoLqQiCwdNlsuvslJHTNr9rMV
X-Gm-Message-State: AOJu0YyGKbxHU4VdF1Cq60Lpz44gS8zyj6UK9Fw59i8zYkdvouMl65uf
 DUqzK+0izjUiRrDt9o9u/EVfzR72kdQGuTsbLD7dgcV9hkD5e9oVveDTGT9MiHxfySXHERZbl2F
 3fSkkvps0zjEYCVrzbIDseLY8sXE+qFkgcaKOogllQAa1qzMkC4eR4C6+NC+09DWCjQ==
X-Received: by 2002:a05:600c:1818:b0:421:4786:eb0c with SMTP id
 5b1f17b1804b1-4230485a6acmr21184195e9.33.1718358922908; 
 Fri, 14 Jun 2024 02:55:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP6kV89/gqZPZg3CTIVIOinlEGl8b8uKTyRlBpWHUEfiwgtPulLVmxijVX5LkwDB+k6n+phQ==
X-Received: by 2002:a05:600c:1818:b0:421:4786:eb0c with SMTP id
 5b1f17b1804b1-4230485a6acmr21184045e9.33.1718358922546; 
 Fri, 14 Jun 2024 02:55:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422d0be1424sm59326775e9.12.2024.06.14.02.55.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 02:55:22 -0700 (PDT)
Message-ID: <f2c00c97-4d2d-4cb8-aa9b-e9c458ca9e65@redhat.com>
Date: Fri, 14 Jun 2024 11:55:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/panic: Add support for drawing a monochrome
 graphical logo
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
 <3f1a5f56213f3e4584773eb2813e212b2dff6d14.1718305355.git.geert+renesas@glider.be>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <3f1a5f56213f3e4584773eb2813e212b2dff6d14.1718305355.git.geert+renesas@glider.be>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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



On 13/06/2024 21:18, Geert Uytterhoeven wrote:
> Re-use the existing support for boot-up logos to draw a monochrome
> graphical logo in the DRM panic handler.  When no suitable graphical
> logo is available, the code falls back to the ASCII art penguin logo.
> 
> Note that all graphical boot-up logos are freed during late kernel
> initialization, hence a copy must be made for later use.

Would it be possible to have the logo not in the __init section if 
DRM_PANIC is set ?

The patch looks good to me anyway.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>    - Rebased,
>    - Inline trivial draw_logo_mono().
> ---
>   drivers/gpu/drm/drm_panic.c | 65 +++++++++++++++++++++++++++++++++----
>   drivers/video/logo/Kconfig  |  2 ++
>   2 files changed, 60 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index f7e22b69bb25d3be..af30f243b2802ad7 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -7,11 +7,15 @@
>    */
>   
>   #include <linux/font.h>
> +#include <linux/init.h>
>   #include <linux/iosys-map.h>
>   #include <linux/kdebug.h>
>   #include <linux/kmsg_dump.h>
> +#include <linux/linux_logo.h>
>   #include <linux/list.h>
> +#include <linux/math.h>
>   #include <linux/module.h>
> +#include <linux/overflow.h>
>   #include <linux/printk.h>
>   #include <linux/types.h>
>   
> @@ -88,6 +92,42 @@ static const struct drm_panic_line logo_ascii[] = {
>   	PANIC_LINE(" \\___)=(___/"),
>   };
>   
> +#ifdef CONFIG_LOGO
> +static const struct linux_logo *logo_mono;
> +
> +static int drm_panic_setup_logo(void)
> +{
> +	const struct linux_logo *logo = fb_find_logo(1);
> +	const unsigned char *logo_data;
> +	struct linux_logo *logo_dup;
> +
> +	if (!logo || logo->type != LINUX_LOGO_MONO)
> +		return 0;
> +
> +	/* The logo is __init, so we must make a copy for later use */
> +	logo_data = kmemdup(logo->data,
> +			    size_mul(DIV_ROUND_UP(logo->width, BITS_PER_BYTE), logo->height),
> +			    GFP_KERNEL);
> +	if (!logo_data)
> +		return -ENOMEM;
> +
> +	logo_dup = kmemdup(logo, sizeof(*logo), GFP_KERNEL);
> +	if (!logo_dup) {
> +		kfree(logo_data);
> +		return -ENOMEM;
> +	}
> +
> +	logo_dup->data = logo_data;
> +	logo_mono = logo_dup;
> +
> +	return 0;
> +}
> +
> +device_initcall(drm_panic_setup_logo);
> +#else
> +#define logo_mono	((const struct linux_logo *)NULL)
> +#endif
> +
>   /*
>    * Color conversion
>    */
> @@ -452,15 +492,22 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>   	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg;
> +	unsigned int logo_width, logo_height;
>   
>   	if (!font)
>   		return;
>   
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   
> -	r_logo = DRM_RECT_INIT(0, 0,
> -			       get_max_line_len(logo_ascii, logo_ascii_lines) * font->width,
> -			       logo_ascii_lines * font->height);
> +	if (logo_mono) {
> +		logo_width = logo_mono->width;
> +		logo_height = logo_mono->height;
> +	} else {
> +		logo_width = get_max_line_len(logo_ascii, logo_ascii_lines) * font->width;
> +		logo_height = logo_ascii_lines * font->height;
> +	}
> +
> +	r_logo = DRM_RECT_INIT(0, 0, logo_width, logo_height);
>   	r_msg = DRM_RECT_INIT(0, 0,
>   			      min(get_max_line_len(panic_msg, msg_lines) * font->width, sb->width),
>   			      min(msg_lines * font->height, sb->height));
> @@ -471,10 +518,14 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>   	/* Fill with the background color, and draw text on top */
>   	drm_panic_fill(sb, &r_screen, bg_color);
>   
> -	if ((r_msg.x1 >= drm_rect_width(&r_logo) || r_msg.y1 >= drm_rect_height(&r_logo)) &&
> -	    drm_rect_width(&r_logo) <= sb->width && drm_rect_height(&r_logo) <= sb->height) {
> -		draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, &r_logo,
> -				   fg_color);
> +	if ((r_msg.x1 >= logo_width || r_msg.y1 >= logo_height) &&
> +	    logo_width <= sb->width && logo_height <= sb->height) {
> +		if (logo_mono)
> +			drm_panic_blit(sb, &r_logo, logo_mono->data, DIV_ROUND_UP(logo_width, 8),
> +				       fg_color);
> +		else
> +			draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, &r_logo,
> +					   fg_color);
>   	}
>   	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color);
>   }
> diff --git a/drivers/video/logo/Kconfig b/drivers/video/logo/Kconfig
> index b7d94d1dd1585a84..ce6bb753522d215d 100644
> --- a/drivers/video/logo/Kconfig
> +++ b/drivers/video/logo/Kconfig
> @@ -8,6 +8,8 @@ menuconfig LOGO
>   	depends on FB_CORE || SGI_NEWPORT_CONSOLE
>   	help
>   	  Enable and select frame buffer bootup logos.
> +	  Monochrome logos will also be used by the DRM panic handler, if
> +	  enabled.
>   
>   if LOGO
>   

