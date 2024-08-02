Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5B5945B2C
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2024 11:39:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BC710E047;
	Fri,  2 Aug 2024 09:39:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S4vBY47g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD7F10E047;
 Fri,  2 Aug 2024 09:39:40 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3687ea0521cso5160723f8f.1; 
 Fri, 02 Aug 2024 02:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722591579; x=1723196379; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=epsFg+QNub+FqtmHtHz144X/ITFDI4OkHx3ujhgC24A=;
 b=S4vBY47gZkQT4aXXr6ncxnJCwCJsIOa4uPJmGaOdu4G8s0OhbbkB7Oav0+MsPg3LM/
 Tf+spNiKtmaaxakTsaJNsKV8G7AE0KF86F/Qpj4QXc62USTyNaMwjlMZc/U5ysbXsILC
 OMLZ5zILqVK/9nylFn3wLsB77frKbvz7pebXKo/zc7Jglo2NfX6DY79xt7dAeNLfh5Xg
 yOegFTLYksyuTTIu7g1FcgeF+u/05eWGDkEW7wDUbacf41/Pjvku5vSu7cjnTy24lihI
 Z6iqkMLa6x4kblwrlZac2GogZEefQuCo+csGKJHbVxEnX6iG39YvfmQh92ptQJUbhklj
 tQBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722591579; x=1723196379;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=epsFg+QNub+FqtmHtHz144X/ITFDI4OkHx3ujhgC24A=;
 b=DQH5P7rDwdkfz6Asa6Fu3/8eIdf958tgAjEjBHQAzD7k1X6pSwjblheiBvXL4EEpH1
 YPFHX8gMBf7B1/u4vuRV5hq/8xahlwM9cRV544pzxt0Vxt9lF57ozaBNdXa6tIGibjYS
 HWVuucM1U2uvNV69X0nAppXUiT6yOWVeDp83/iDRgactMqNxFvrYh0fw9iV2ZDo7GehD
 Jy7ykhDdP2Oh3dYdLfrUbqvbkS6mZavhQpAfSyDblRujL4IyYzhKyCnQunZSMjDiYsav
 RZvOYCsC09hoYa+c5U3sIRMp2gpEhLBhIQdzaqv8p+JwvTKYibP6wfiv856yk+qk6rSO
 FQfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDwHJ0MVaSdf5PWzDbJwuO/6lM8Fbhge7uJ2/krq3ylK66s9hJnCw29iaDUb4RkvryR3WJJR1aYDRCa3b7ZnqyGWRjDMq5A/QvPXbHQ1ikzTmN66SzwD9ANNbvlvEcXre+GTHiOtMY3ExZZHPqxw==
X-Gm-Message-State: AOJu0YzbVDl1OFGzQ2jFMX10kA1wES+ly3Ec1uDTO9RZHc6M/btwthnX
 220P/0iTPJ8v2u0+rZJFVD5P5AMOhVe//Yu7CWgY/BRO0xvK9pQC
X-Google-Smtp-Source: AGHT+IHNFpNyZLyDG82LlxIHjrUDxrGrZIvbFsdh4WVQj+Ss/wNeTYIUpERWeCU6ixu2lioDvMJyQg==
X-Received: by 2002:a05:6000:b92:b0:368:7ad8:531f with SMTP id
 ffacd0b85a97d-36bbc1a5174mr1844283f8f.42.1722591578368; 
 Fri, 02 Aug 2024 02:39:38 -0700 (PDT)
Received: from [10.254.108.81] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbd01ee30sm1501150f8f.50.2024.08.02.02.39.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Aug 2024 02:39:37 -0700 (PDT)
Message-ID: <ce45d800-ad6a-4cef-9c57-480908867490@gmail.com>
Date: Fri, 2 Aug 2024 11:39:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amdgpu: add dce6 drm_panic support
To: Lu Yao <yaolu@kylinos.cn>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, srinivasan.shanmugam@amd.com,
 sunil.khatri@amd.com
Cc: airlied@gmail.com, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240802071752.116541-1-yaolu@kylinos.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20240802071752.116541-1-yaolu@kylinos.cn>
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

Am 02.08.24 um 09:17 schrieb Lu Yao:
> Add support for the drm_panic module, which displays a pretty user
> friendly message on the screen when a Linux kernel panic occurs.
>
> Signed-off-by: Lu Yao <yaolu@kylinos.cn>
> ---
> The patch can work properly on the TTY, but after start X, drawn
> image is messy, it looks like the data isn't linearly arranged.
> However at this time 'fb->modifier' is 'DRM_FORMAT_MOD_LINEAR'.
>
> Another difference I found is:
>    For TTY, the amdgpu_bo is created with flag
>    'AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED|AMDGPU_GEM_CREATE_CPU_GTT_USWC|
>    AMDGPU_GEM_CREATE_VRAM_CLEARED|AMDGPU_GEM_CREATE_VRAM_CONTIGUOUS'.
>    For X, the amdgpu_bo is created with flag
>    'AMDGPU_GEM_CREATE_NO_CPU_ACCESS|AMDGPU_GEM_CREATE_CPU_GTT_USWC'
> I try to use same flag for X, it looks like no difference.
>
> Can someone provide some insight into this problem or where I am going
> wrong. Thanks a lot.
>
> Test environment: X86 arch + v6.6 kernel + R7340.
> ---
>   drivers/gpu/drm/amd/amdgpu/dce_v6_0.c | 32 +++++++++++++++++++++++++++
>   1 file changed, 32 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> index 05c0df97f01d..12c3801c264a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
> @@ -28,6 +28,8 @@
>   #include <drm/drm_modeset_helper.h>
>   #include <drm/drm_modeset_helper_vtables.h>
>   #include <drm/drm_vblank.h>
> +#include <drm/drm_panic.h>

> +#include "../../drm_internal.h"

Well that this file is named "internal" and not in a common include 
directory is a strong indicator that you should absolutely *not* include 
it in a driver.

>   
>   #include "amdgpu.h"
>   #include "amdgpu_pm.h"
> @@ -2600,6 +2602,35 @@ static const struct drm_crtc_helper_funcs dce_v6_0_crtc_helper_funcs = {
>   	.get_scanout_position = amdgpu_crtc_get_scanout_position,
>   };
>   
> +static int dce_v6_0_drm_primary_plane_get_scanout_buffer(struct drm_plane *plane,
> +							 struct drm_scanout_buffer *sb)
> +{
> +	struct drm_framebuffer *fb;
> +	struct drm_gem_object *obj;
> +	struct amdgpu_bo *abo;
> +	int ret = 0;
> +
> +	if (!plane->fb || plane->fb->modifier != DRM_FORMAT_MOD_LINEAR)
> +		return -ENODEV;
> +
> +	fb = plane->fb;
> +	sb->width = fb->width;
> +	sb->height = fb->height;
> +	sb->format = fb->format;
> +	sb->pitch[0] = fb->pitches[0];
> +
> +	obj = fb->obj[0];
> +	abo = gem_to_amdgpu_bo(obj);
> +	if (!abo || abo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)
> +		return -EINVAL;
> +
> +	return drm_gem_vmap(obj, &sb->map[0]);

Yeah that will almost always not work. Most display buffers are tilled 
and not CPU accessible.

Regards,
Christian.

> +}
> +
> +static const struct drm_plane_helper_funcs dce_v6_0_drm_primary_plane_helper_funcs = {
> +	.get_scanout_buffer = dce_v6_0_drm_primary_plane_get_scanout_buffer
> +};
> +
>   static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
>   {
>   	struct amdgpu_crtc *amdgpu_crtc;
> @@ -2627,6 +2658,7 @@ static int dce_v6_0_crtc_init(struct amdgpu_device *adev, int index)
>   	amdgpu_crtc->encoder = NULL;
>   	amdgpu_crtc->connector = NULL;
>   	drm_crtc_helper_add(&amdgpu_crtc->base, &dce_v6_0_crtc_helper_funcs);
> +	drm_plane_helper_add(amdgpu_crtc->base.primary, &dce_v6_0_drm_primary_plane_helper_funcs);
>   
>   	return 0;
>   }

