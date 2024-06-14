Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9299087DA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 11:45:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E72610ECDE;
	Fri, 14 Jun 2024 09:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gYssdKkh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4226C10ECDA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 09:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718358328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3zCQQ8p+hx0Gk9UH1f3YCfOSKKO0jNZPpOokLLsHO7k=;
 b=gYssdKkhhwdhQpNz2SgSXEggadnaMcsJA2NIu0t+4QKjs6MrpnrYLnPphXy2ViPgPNdd+Q
 wL3UmVffNcuCOx7EZBleXgoXMX3nhIxhWCrur6Gs6Q0tfFz0ZL0Pjwg/vB4uGEWzce1kCg
 q4RLcUQHRCpvvKmC2ep50x4H9Jj4thU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-BcRc_Gr5O_-AQtQUCq4D-A-1; Fri, 14 Jun 2024 05:45:20 -0400
X-MC-Unique: BcRc_Gr5O_-AQtQUCq4D-A-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-421bb51d73cso11633165e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 02:45:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358319; x=1718963119;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3zCQQ8p+hx0Gk9UH1f3YCfOSKKO0jNZPpOokLLsHO7k=;
 b=SgU4uU0jjMtwAXPlTYUaQRJm6oGdBiY7NTzWmbhtQVS3wxLdKhAyRFbHPdvEQlKOam
 TVJtYULSEqSxKW+oPCIxTUhg916ooYBwXM5+RDJikrHu1YtETf/V1Plh9cuKf5gKOVpc
 HoD0CMX3C6Hrjt6Uld2Uyojb4r/HT16I0CuughX37ioyxCbk1xzmfkNxksXO0TWZHD/6
 Wli1T/qI6he88r6KjSGxdkyhH3A77CZCkDiMpMMLnBtn0Goz7Dk2GmjeZeIFw8DXlfag
 gWJ3E/K0UORekQHZM2rlI7UQBrHcsCVE82x+NiMLxUbP26TRGl9rcsoNj+GfvrS5Zhnv
 tFWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdrU/GVW2DeNA51PDXkKVvZKKHrAIOH9u7DxKDYrnyT0DdoZbO+hFx8ZK7Gs+TypgAbvOOXOV/sJv44nw5iMWwAI4Rqicso0wf2i0QG1ae
X-Gm-Message-State: AOJu0YzUIiRwRTi3nPt4M3qNMH7Fc/cbQSwGQNS0u7nJZ488An9ULclt
 5LNu0b+02Apmpk89Dyd2P5ZAOZMj8DuKBUnxgLxVpa79/byKEhFRotHpMh76AYR/leMzJ/BgUby
 zrRGUV3oGPWjBtorrtU8c2cn9pGk5xGewcmJPLhWY+dzI0mE6Zc3nyby7wlj3K9QMPQ==
X-Received: by 2002:a05:600c:354e:b0:422:6755:17e3 with SMTP id
 5b1f17b1804b1-42304848ad5mr18239345e9.29.1718358319400; 
 Fri, 14 Jun 2024 02:45:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq14KCC0bgeAFbxip4impHue7nA1V9MdeorCw9J2iMMisj4tdn99VzNb0cTThFgkm5mlMrXQ==
X-Received: by 2002:a05:600c:354e:b0:422:6755:17e3 with SMTP id
 5b1f17b1804b1-42304848ad5mr18239255e9.29.1718358319173; 
 Fri, 14 Jun 2024 02:45:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075104b45sm3833550f8f.109.2024.06.14.02.45.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 02:45:18 -0700 (PDT)
Message-ID: <31eb764b-27f2-4a99-b035-fab21de4ca7f@redhat.com>
Date: Fri, 14 Jun 2024 11:45:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] drm/panic: Rename logo to logo_ascii
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
 <df77372c16153655c321a290b5a3191ee2dcbc6b.1718305355.git.geert+renesas@glider.be>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <df77372c16153655c321a290b5a3191ee2dcbc6b.1718305355.git.geert+renesas@glider.be>
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
> Rename variables related to the ASCII logo, to prepare for the advent of
> support for graphical logos.

Thanks, that looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>    - Rebased.
> ---
>   drivers/gpu/drm/drm_panic.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 5b0acf8c86e402a8..f7e22b69bb25d3be 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -78,7 +78,7 @@ static struct drm_panic_line panic_msg[] = {
>   	PANIC_LINE("Please reboot your computer."),
>   };
>   
> -static const struct drm_panic_line logo[] = {
> +static const struct drm_panic_line logo_ascii[] = {
>   	PANIC_LINE("     .--.        _"),
>   	PANIC_LINE("    |o_o |      | |"),
>   	PANIC_LINE("    |:_/ |      | |"),
> @@ -447,7 +447,7 @@ static void draw_txt_rectangle(struct drm_scanout_buffer *sb,
>   static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>   {
>   	size_t msg_lines = ARRAY_SIZE(panic_msg);
> -	size_t logo_lines = ARRAY_SIZE(logo);
> +	size_t logo_ascii_lines = ARRAY_SIZE(logo_ascii);
>   	u32 fg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_FOREGROUND_COLOR, sb->format->format);
>   	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
> @@ -459,8 +459,8 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   
>   	r_logo = DRM_RECT_INIT(0, 0,
> -			       get_max_line_len(logo, logo_lines) * font->width,
> -			       logo_lines * font->height);
> +			       get_max_line_len(logo_ascii, logo_ascii_lines) * font->width,
> +			       logo_ascii_lines * font->height);
>   	r_msg = DRM_RECT_INIT(0, 0,
>   			      min(get_max_line_len(panic_msg, msg_lines) * font->width, sb->width),
>   			      min(msg_lines * font->height, sb->height));
> @@ -473,7 +473,8 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>   
>   	if ((r_msg.x1 >= drm_rect_width(&r_logo) || r_msg.y1 >= drm_rect_height(&r_logo)) &&
>   	    drm_rect_width(&r_logo) <= sb->width && drm_rect_height(&r_logo) <= sb->height) {
> -		draw_txt_rectangle(sb, font, logo, logo_lines, false, &r_logo, fg_color);
> +		draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, &r_logo,
> +				   fg_color);
>   	}
>   	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color);
>   }

