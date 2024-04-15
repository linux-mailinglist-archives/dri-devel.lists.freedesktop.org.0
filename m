Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6876F8A5632
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 17:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818C8112674;
	Mon, 15 Apr 2024 15:19:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ok33NZLg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD23112675
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 15:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713194380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f7fOl3tR+F+7N56uhjNhKTPH7uUxNc/DkB5SISld0k0=;
 b=Ok33NZLgv/Agl2JA2IS05fjPhS6ihSlmE+UApJO26LPWXAfa35aCsvmW7J1jJcLxPwLGlR
 LHmUVt3y0JcJvrYXbqiGrf6Zao3j5CscuIRlLzt4NqG0+y296PgLZudCMxZxzZ3gwAXTwI
 7AzPMfyjGTEjcmtBCrQtkUntFz6cOcw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-317-pxlwufOyOjS6XKN9xO0rMQ-1; Mon, 15 Apr 2024 11:19:37 -0400
X-MC-Unique: pxlwufOyOjS6XKN9xO0rMQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-343f8b51910so1995648f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 08:19:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713194376; x=1713799176;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f7fOl3tR+F+7N56uhjNhKTPH7uUxNc/DkB5SISld0k0=;
 b=OVCRSNyezsRBv++jJ16eAFmj66KlZV5LVb0cJ2Wun61D3SWanX05M0Wp8pvi8fDCLS
 aEvFvEHlXCp8Hb99xAKDuwskozwETNfqmgLiwP2M2Qlqu7Nrg+5mmgD7yzj9uyZsG3dW
 sKRv3ipqOVB2LxcwB1Xai36ZM6qi8fH/W9IPdMGQd5VkpiigzPBFFEY3+DpXO7+i7QGM
 O72iib0p1zbMftWtsEUoHDN68a+Qi2qW2+Sbtf8s2P5wjc24zQ5WKV04bmUgJs5KQRd2
 cfYDpYKv3oc65kjSIE8oIXSsWTrzPceJ5B2xRtaqIh9uOar+vaCfEbzFSG2A0zHppWmP
 KNJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/ZvzzzA0CJLynv98MTphDHSPcFLGIAclZ9BjonIitlVk8nmZmcXAi1cN34X1MV2H30fTmB0wQGiJvrwqmCsSr6hiAuYRc4BXJMWSKXNut
X-Gm-Message-State: AOJu0YzR5PZ8FLId63D9TqN8alxrck/gtfQkJ3937GKS1XaA1EkDQuo6
 dw9dUPYjLAjtHIJ4ys9KtoTW7PI+TbHW0FIJJTXWYLTgo701TqsgIdNiAIL1Itqsej+0eE4kdQu
 45L1hCfjm8VTwhWXULl/h+CH6mOOvAlrLs8Dgoq2P20jLdAGjplGY3ElUQswESTCHQQ==
X-Received: by 2002:adf:ef84:0:b0:343:f2f1:21c1 with SMTP id
 d4-20020adfef84000000b00343f2f121c1mr6400598wro.24.1713194376043; 
 Mon, 15 Apr 2024 08:19:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE91sYnMcbzJyR992r5RhtOppAYEWn2g2anJ2wj13yUa2OkHygqGMavv2yPPGHyKy5Cp3XnWQ==
X-Received: by 2002:adf:ef84:0:b0:343:f2f1:21c1 with SMTP id
 d4-20020adfef84000000b00343f2f121c1mr6400578wro.24.1713194375679; 
 Mon, 15 Apr 2024 08:19:35 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 u7-20020adfeb47000000b0033ec9ddc638sm12387124wrn.31.2024.04.15.08.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Apr 2024 08:19:35 -0700 (PDT)
Message-ID: <661a4bd7-a42d-4009-9d61-a1fdbb47681d@redhat.com>
Date: Mon, 15 Apr 2024 17:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/fb_dma:
 s/drm_panic_gem_get_scanout_buffer/drm_fb_dma_get_scanout_buffer
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, tzimmermann@suse.de,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net,
 noralf@tronnes.org, sui.jingfeng@linux.dev
Cc: gpiccoli@igalia.com, dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20240415151013.3210278-1-mcanal@igalia.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240415151013.3210278-1-mcanal@igalia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

You're right, I messed up the rename, and I mostly test on x86, where I 
don't build the imx driver.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

Best regards,

-- 

Jocelyn

On 15/04/2024 17:09, Maíra Canal wrote:
> On version 11, Thomas suggested to change the name of the function and
> this request was applied on version 12, which is the version that
> landed. Although the name of the function changed on the C file, it
> didn't changed on the header file, leading to a compilation error as
> such:
> 
> drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c:780:24: error: use of undeclared
> identifier 'drm_fb_dma_get_scanout_buffer'; did you mean 'drm_panic_gem_get_scanout_buffer'?
>    780 |         .get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
>        |                               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>        |                               drm_panic_gem_get_scanout_buffer
> ./include/drm/drm_fb_dma_helper.h:23:5: note: 'drm_panic_gem_get_scanout_buffer'
> declared here
>     23 | int drm_panic_gem_get_scanout_buffer(struct drm_plane *plane,
>        |     ^
> 1 error generated.
> 
> Best Regards,
> - Maíra
> 
> Fixes: 879b3b6511fe ("drm/fb_dma: Add generic get_scanout_buffer() for drm_panic"
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   include/drm/drm_fb_dma_helper.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/drm_fb_dma_helper.h b/include/drm/drm_fb_dma_helper.h
> index 61f24c2aba2f..c950732c6d36 100644
> --- a/include/drm/drm_fb_dma_helper.h
> +++ b/include/drm/drm_fb_dma_helper.h
> @@ -6,6 +6,7 @@
>   
>   struct drm_device;
>   struct drm_framebuffer;
> +struct drm_plane;
>   struct drm_plane_state;
>   struct drm_scanout_buffer;
>   
> @@ -20,8 +21,8 @@ void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
>   				  struct drm_plane_state *old_state,
>   				  struct drm_plane_state *state);
>   
> -int drm_panic_gem_get_scanout_buffer(struct drm_plane *plane,
> -				     struct drm_scanout_buffer *sb);
> +int drm_fb_dma_get_scanout_buffer(struct drm_plane *plane,
> +				  struct drm_scanout_buffer *sb);
>   
>   #endif
>   

