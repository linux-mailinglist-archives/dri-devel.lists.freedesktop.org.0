Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F34ADFD7F
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 08:12:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64FAC10E1F8;
	Thu, 19 Jun 2025 06:12:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="e06TIMxF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA1310E1F8
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 06:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1750313569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pfhEtd1jwHhvY5Akc+bs9I+OMHq84rXrBLaKDXZZDvg=;
 b=e06TIMxFZQy091PABR2Kso+Uu6KoOd1Ld6ULeYzzF+nNUx4oXQqKCKbLXa812Kyn59jqgj
 y7wOXlQDdUuDLCZMkoJjQlO3OgcJgQfCDOLTsUJIUMpJMJRfWAgvDILwo1S4+FNIPq+T6P
 MG+OjuDkny1PLcWFGEPpwdrvb0Vh/G8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-t3mCZD_3Nue8TSw_b2_lMw-1; Thu, 19 Jun 2025 02:12:47 -0400
X-MC-Unique: t3mCZD_3Nue8TSw_b2_lMw-1
X-Mimecast-MFC-AGG-ID: t3mCZD_3Nue8TSw_b2_lMw_1750313567
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-450d6768d4dso2378185e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 23:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750313567; x=1750918367;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pfhEtd1jwHhvY5Akc+bs9I+OMHq84rXrBLaKDXZZDvg=;
 b=BUU7nGZeD3jegXK0oh9U1ivzf49bJ2/9/uwm9FMrkZTGzeSC2QMDdftuBXC1DyQQgF
 5IX6PvB7Sou4rr2s+o9nXyYdwdX+pZ/t7ISjag9gFIp0ecHmTwN1tYfvhtKYI8Fb6RBY
 tLXLCFaDQZBH5KksyYqiaf5N+yFi0bm3wtE/IDK+HdgeA6ZHT8kokOeii1ycz965afQ8
 e9W7FL5JaLnHU7PamRDFERKCmiJRDHV5nV95+sOMW5uNsbJAwsel7LK07G9UH0UUg3DL
 c4KqIbQxI2nk4h1CGqGM8pLuwDQ4pNVJSJ2q3sCXBE2V1velEqXVDeEgqJlPvJowaRWU
 58Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqhSFSoxj2c+4yZGHV6Hxkor1FNAO7TGviM8YG/MWSkqCIH+ImO7HmvKKaYbYkD/S7kNTIPzfxglQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywC7x/yQjmoZ4XRTKxL7xbZkcK2VtkiDYuOX+wG09ORep1QRql
 h0o2wFPgQA7Oja39L1ksReZV91FJ6BAslWsxDxP1OKGMRByNsI+2JoLVD/IwQbvEwIHfyeWyBYE
 hlL9iJoPcJyK38sVuQ6dKw9OQydXIPCMKqe+WgFpvGuSdfvcKdvdLOvHbSFbVju1AEqhscQ==
X-Gm-Gg: ASbGncve/9q8AxGwhrGQsVDWSn4/bBZ2e/NEDZL/v1fy2U+UbMmGlssxmX+XnMhmxBE
 ZDUDd5NSyCHqwLruwGrn0/Zbrk/jv2bihPuZ/taNafCv6iUZjWdKS9PfEc1nj0wHkJSd8jnajkj
 CYPIJsphrDGIpRudttXVRCWbyiOraxvF/HZgiA4gtUg38raBE/ZbU+IxfXKFAwrkU8p8Oq+Icka
 LL6grEXKPVnmBpw3mApfC2qC89OJsqX/hvGUXVlf8UdIqd3g9v9xF4itrpnm4BsmvQWrLLE1OCF
 7FAlbwelJt/hcDCOJUrYB11wJA5N
X-Received: by 2002:a05:600c:8012:b0:43b:ce36:7574 with SMTP id
 5b1f17b1804b1-4533cae684fmr198267285e9.11.1750313566776; 
 Wed, 18 Jun 2025 23:12:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv4EqMqSDWgujH3nkvWTbJJTf6ltr+z032AO09GMUBmRwveoEtpo/cuFt1a8jxgEJEJ0WV8A==
X-Received: by 2002:a05:600c:8012:b0:43b:ce36:7574 with SMTP id
 5b1f17b1804b1-4533cae684fmr198266955e9.11.1750313566319; 
 Wed, 18 Jun 2025 23:12:46 -0700 (PDT)
Received: from [192.168.190.158] ([37.167.112.85])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4535ebd02basm17508635e9.39.2025.06.18.23.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 23:12:45 -0700 (PDT)
Message-ID: <30f0ea0c-d8fb-461e-86ab-6e7677beac3c@redhat.com>
Date: Thu, 19 Jun 2025 08:12:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-next] drm/bochs: Add support for drm_panic
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, kraxel@redhat.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250613132023.106946-1-ryasuoka@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250613132023.106946-1-ryasuoka@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iSkXu3q4FCEmmrSoc1hszrdzBzTJ5YvAPWObWE7gBow_1750313567
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

On 13/06/2025 15:20, Ryosuke Yasuoka wrote:
> Add drm_panic moudle for bochs drm so that panic screen can be displayed
> on panic.

Thanks for the patch, it's simple and looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

If no objections, I will push it next Monday.

Best regards,

-- 

Jocelyn

> 
> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> ---
>   drivers/gpu/drm/tiny/bochs.c | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
> index 8706763af8fb..ed42ad5c4927 100644
> --- a/drivers/gpu/drm/tiny/bochs.c
> +++ b/drivers/gpu/drm/tiny/bochs.c
> @@ -19,6 +19,7 @@
>   #include <drm/drm_gem_shmem_helper.h>
>   #include <drm/drm_managed.h>
>   #include <drm/drm_module.h>
> +#include <drm/drm_panic.h>
>   #include <drm/drm_plane_helper.h>
>   #include <drm/drm_probe_helper.h>
>   
> @@ -469,10 +470,28 @@ static void bochs_primary_plane_helper_atomic_update(struct drm_plane *plane,
>   	bochs_hw_setformat(bochs, fb->format);
>   }
>   
> +static int bochs_primary_plane_helper_get_scanout_buffer(struct drm_plane *plane,
> +							  struct drm_scanout_buffer *sb)
> +{
> +	struct bochs_device *bochs = to_bochs_device(plane->dev);
> +	struct iosys_map map = IOSYS_MAP_INIT_VADDR_IOMEM(bochs->fb_map);
> +
> +	if (plane->state && plane->state->fb) {
> +		sb->format = plane->state->fb->format;
> +		sb->width = plane->state->fb->width;
> +		sb->height = plane->state->fb->height;
> +		sb->pitch[0] = plane->state->fb->pitches[0];
> +		sb->map[0] = map;
> +		return 0;
> +	}
> +	return -ENODEV;
> +}
> +
>   static const struct drm_plane_helper_funcs bochs_primary_plane_helper_funcs = {
>   	DRM_GEM_SHADOW_PLANE_HELPER_FUNCS,
>   	.atomic_check = bochs_primary_plane_helper_atomic_check,
>   	.atomic_update = bochs_primary_plane_helper_atomic_update,
> +	.get_scanout_buffer = bochs_primary_plane_helper_get_scanout_buffer,
>   };
>   
>   static const struct drm_plane_funcs bochs_primary_plane_funcs = {
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494

