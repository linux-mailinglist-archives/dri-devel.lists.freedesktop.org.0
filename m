Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AB397B017
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 14:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E01410E46A;
	Tue, 17 Sep 2024 12:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="C8+80v2X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6788710E46A
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726575962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uEGssPI2MZgcV8pXcwA+wieYfiMi4q7bjaWYcO2wC20=;
 b=C8+80v2Xh97dOR+BkSThwwknz/5ady5BCL/dWwUYR3YvP8evguNPY/lJkSGYmFlaAZCjbr
 0QC3TG26FIzeBTrO8BWUIzingnvLuSkVNC/2XP1kCqqXEpm2SEb6NCK0Rjvpt2XUXB0pCu
 4qkC/YAA8mW5URkqtpOueWtKwt9bwvE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-woXvYCheMWmq3dKZ2kU1dw-1; Tue, 17 Sep 2024 08:26:01 -0400
X-MC-Unique: woXvYCheMWmq3dKZ2kU1dw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42cb9e14ab6so35220815e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2024 05:26:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726575960; x=1727180760;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uEGssPI2MZgcV8pXcwA+wieYfiMi4q7bjaWYcO2wC20=;
 b=kBtC05rj6xUILup+5ZlPUwrRedp2V9g5Ua8GAVhsPq4fzxs47/yYXyB7VRAmTLN0Uo
 8DjInhEwHgPlJyCsErfTcmbCtunqrRrBFQalk7YAQRknuiuPL4w/unG5ss8mpBpWPOKc
 325hddxEO6WUmweEUu3b00nkA0hB21AS215STmKtqLIGuQ6pcalOpjgMjcw6dN8oG+go
 ErTRhRqnO7BkFj9JNIIANgPyZDzb8O8SjrZo2uhKOjmO1p7p1IbWijofHGd+qJdvUBQD
 /RO7g1Em1yreZHzEnRq2cIbbWEoYQFqRcKA9EUyCuG+3XhrLQ5lS+jOxwA5s5a3myvG6
 I5uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtskwxpDVS07W8SMBqJSDUn+nKz6LzNoNHWuf9rXoSqejTSqUvonIV75OHw3pPQ7tLfvE09NinOEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwQaNGAyRWWWV8LtEF7gs8+UGQFLk55YtWN9hEiEtSCX0O0Dwo6
 o/3BINi4nduLARZQb1GDGiHlAooWgBtBc5BcqbCnRIbq96bRbTp9ym8iC2GkpIPUm88qtvq0luB
 0juNhF2A7EW7B2nhPUmcE/Ee/525Y/d/U57olKoeBxOvXJA90aXOPr7U83+NRGQ+u9w==
X-Received: by 2002:a05:600c:1d23:b0:428:eb6:2e73 with SMTP id
 5b1f17b1804b1-42cdb58db62mr145843775e9.29.1726575959889; 
 Tue, 17 Sep 2024 05:25:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0jbwSBYytCdU+Bu8kjEc0nWinMC6KrvgTzoFbP+dxniCUqWXx6FRdolXeJwjqomLSh6+2sQ==
X-Received: by 2002:a05:600c:1d23:b0:428:eb6:2e73 with SMTP id
 5b1f17b1804b1-42cdb58db62mr145843575e9.29.1726575959357; 
 Tue, 17 Sep 2024 05:25:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42da242185dsm101745305e9.33.2024.09.17.05.25.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Sep 2024 05:25:58 -0700 (PDT)
Message-ID: <b1191ab8-a3c6-4873-9a96-58c8e47c9e0c@redhat.com>
Date: Tue, 17 Sep 2024 14:25:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/amdgpu: add dce6 drm_panic support
To: Lu Yao <yaolu@kylinos.cn>, alexdeucher@gmail.com,
 ckoenig.leichtzumerken@gmail.com, daniel@ffwll.ch
Cc: Xinhui.Pan@amd.com, airlied@gmail.com, alexander.deucher@amd.com,
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 srinivasan.shanmugam@amd.com, sunil.khatri@amd.com
References: <20240802071752.116541-1-yaolu@kylinos.cn>
 <20240812060914.102614-1-yaolu@kylinos.cn>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240812060914.102614-1-yaolu@kylinos.cn>
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

On 12/08/2024 08:09, Lu Yao wrote:
> Add support for the drm_panic module, which displays a pretty user
> friendly message on the screen when a Linux kernel panic occurs.

 From a drm_panic point of view, it looks good to me.
I don't have the required hardware, so unfortunately I wasn't able to 
test it.

Best regards,

-- 

Jocelyn


> 
> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> ---
> Changes in v2:
> 1. Drop include "drm_internal.h"
> 2. Add disabling DC tiling ops.
> Per suggestion from previous thread:
> https://patchwork.freedesktop.org/patch/606879/?series=136832&rev=1
> ---
>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 48 +++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index 05c0df97f01d..ba1b7a36caa3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -28,6 +28,7 @@
>   #include <drm/drm_modeset_helper.h>
>   #include <drm/drm_modeset_helper_vtables.h>
>   #include <drm/drm_vblank.h>
> +#include <drm/drm_panic.h>
>   
>   #include "amdgpu.h"
>   #include "amdgpu_pm.h"
> @@ -2600,6 +2601,52 @@ static const struct drm_crtc_helper_funcs dce_v6_0_crtc_helper_funcs = {
>   	.get_scanout_position = amdgpu_crtc_get_scanout_position,
>   };
>   
> +static int dce_v6_0_drm_primary_plane_get_scanout_buffer(struct drm_plane *plane,
> +							 struct drm_scanout_buffer *sb)
> +{
> +	struct drm_framebuffer *fb;
> +	struct amdgpu_bo *abo;
> +	struct amdgpu_crtc *amdgpu_crtc;
> +	struct amdgpu_device *adev;
> +	uint32_t fb_format;
> +
> +	if (!plane->fb)
> +		return -EINVAL;
> +
> +	fb = plane->fb;
> +
> +	abo = gem_to_amdgpu_bo(fb->obj[0]);
> +	amdgpu_crtc = to_amdgpu_crtc(plane->crtc);
> +	adev = drm_to_adev(fb->dev);
> +
> +	if (!abo->kmap.virtual &&
> +	    ttm_bo_kmap(&abo->tbo, 0, PFN_UP(abo->tbo.base.size), &abo->kmap)) {
> +		DRM_WARN("amdgpu bo map failed, panic won't be displayed\n");
> +		return -ENOMEM;
> +	}
> +
> +	if (abo->kmap.bo_kmap_type & TTM_BO_MAP_IOMEM_MASK)
> +		iosys_map_set_vaddr_iomem(&sb->map[0], abo->kmap.virtual);
> +	else
> +		iosys_map_set_vaddr(&sb->map[0], abo->kmap.virtual);
> +
> +	sb->width = fb->width;
> +	sb->height = fb->height;
> +	sb->format = fb->format;
> +	sb->pitch[0] = fb->pitches[0];
> +
> +	/* Disable DC tiling */
> +	fb_format = RREG32(mmGRPH_CONTROL + amdgpu_crtc->crtc_offset);
> +	fb_format &= ~GRPH_ARRAY_MODE(0x7);
> +	WREG32(mmGRPH_CONTROL + amdgpu_crtc->crtc_offset, fb_format);
> +
> +	return 0;
> +}
> +
> +static const struct drm_plane_helper_funcs dce_v6_0_drm_primary_plane_helper_funcs = {
> +	.get_scanout_buffer = dce_v6_0_drm_primary_plane_get_scanout_buffer
> +};
> +
>   static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
>   {
>   	struct amdgpu_crtc *amdgpu_crtc;
> @@ -2627,6 +2674,7 @@ static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
>   	amdgpu_crtc->encoder = NULL;
>   	amdgpu_crtc->connector = NULL;
>   	drm_crtc_helper_add(&amdgpu_crtc->base, &dce_v6_0_crtc_helper_funcs);
> +	drm_plane_helper_add(amdgpu_crtc->base.primary, &dce_v6_0_drm_primary_plane_helper_funcs);
>   
>   	return 0;
>   }

