Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCC79087D2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 11:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02D110ECC2;
	Fri, 14 Jun 2024 09:44:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Lk2mnNYM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBA910ECC2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 09:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718358285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CshieQQIH4mKg/EiA3AsDpWQdSbrKh64nojN+WE88yY=;
 b=Lk2mnNYM99945qjIV2r5OCuQIAyyz4TAhXx8gohIHr5rvJPWv0BErC1MMISWmSLMQiCcEI
 hVz2PG4s2Al5J2AAJ+XSk9MnNRZ5ApR2HfZ8BjJMs4paSBHZUJ+kBf1yhq3X4NjDWRn+WY
 ZeWmcjkp6c0Bo+RUK8FYtdF6wqrN0LQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-2QsvvNxWMcemNfAZCuoH4Q-1; Fri, 14 Jun 2024 05:44:43 -0400
X-MC-Unique: 2QsvvNxWMcemNfAZCuoH4Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42135f60020so15502505e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 02:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718358282; x=1718963082;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CshieQQIH4mKg/EiA3AsDpWQdSbrKh64nojN+WE88yY=;
 b=G0rtnxz5cxFeY/2PRNtyq735hxd5coqBlX4xHWFdtu43+zr0tviK+vPL5iFCEpXSF9
 wj0tjggENqmkOpA/rTE8UZ95/spmKVk8QaStY0JreTvYDH7WqqPFXiNnBFlq3tpZW90d
 fqbXdvAa9TufPQXTZxB2C2th2ok+wCiUZbDh7Y/F5H+r5LKANqJZKdURNmoHAfbPb0a4
 VLyiGGSKrk8GiQOTPx8GZVY2irXQk7t0ggRrZU2E+Oeyv2ck1fObfDfANG9jF8DMheOl
 jISGDCQGB/ioui3MLSP2g6O5zpmdfXYzxxuxM9HFqZ/P/MKQXkIlcvkyUtc0xfyap1vy
 pbGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWCj8tcNhnDSETzw+t5gr9jvYSJFLwDapFQeMRg1X/L0ZSRDCZzR/25S2HFWT0lq0ODfnNuyZe3iwd0S7a6rS51GNo4UDZiDbcsy2wq75r
X-Gm-Message-State: AOJu0YxK5mFnfRSq48xWCmK5dA5iGXuBXwZVZlOSVW2emk8kCYQixlZ/
 t3U9zy4M0oQi5keBnh+oYxrzM7uHR7xGft0DZx7xqbGt0eSCEFZbSAsOp1yCknpgozmUtQg5PKy
 4fKEINwLpnLSFJ7WJTKW5XhIoMhiKwbcOtAz8YSn1kdlZ214iqNjwBymGHWDMk20lRuHSui8+mw
 ==
X-Received: by 2002:a05:600c:4e52:b0:421:7296:ba3f with SMTP id
 5b1f17b1804b1-423048309d5mr22183345e9.22.1718358282299; 
 Fri, 14 Jun 2024 02:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHol7Fxpqc45AcQb9iiSor1fKX+OLVhNrRP3nOxOGjpSELqoTURxJjSrSWvYixqw/xO488Sfw==
X-Received: by 2002:a05:600c:4e52:b0:421:7296:ba3f with SMTP id
 5b1f17b1804b1-423048309d5mr22183125e9.22.1718358281948; 
 Fri, 14 Jun 2024 02:44:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f602e802sm53742615e9.11.2024.06.14.02.44.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 02:44:41 -0700 (PDT)
Message-ID: <16ded77c-a506-4672-ab74-ca1a7aaf21aa@redhat.com>
Date: Fri, 14 Jun 2024 11:44:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
 <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
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
> Use the drm_fb_clip_offset() helper instead of open-coding the same
> operation.

Thanks, it's a nice cleanup.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> DRM_PANIC already selects DRM_KMS_HELPER.
> 
> v2:
>    - New.
> ---
>   drivers/gpu/drm/drm_panic.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 814ef5c20c08ee42..5b0acf8c86e402a8 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -285,7 +285,7 @@ static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
>   		return drm_panic_blit_pixel(sb, clip, sbuf8, spitch, fg_color);
>   
>   	map = sb->map[0];
> -	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
> +	iosys_map_incr(&map, drm_fb_clip_offset(sb->pitch[0], sb->format, clip));
>   
>   	switch (sb->format->cpp[0]) {
>   	case 2:
> @@ -373,7 +373,7 @@ static void drm_panic_fill(struct drm_scanout_buffer *sb, struct drm_rect *clip,
>   		return drm_panic_fill_pixel(sb, clip, color);
>   
>   	map = sb->map[0];
> -	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
> +	iosys_map_incr(&map, drm_fb_clip_offset(sb->pitch[0], sb->format, clip));
>   
>   	switch (sb->format->cpp[0]) {
>   	case 2:

