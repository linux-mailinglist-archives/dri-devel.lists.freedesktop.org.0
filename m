Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B67C777DA0A
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 07:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3AD210E2CA;
	Wed, 16 Aug 2023 05:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 884F510E2C6;
 Wed, 16 Aug 2023 05:55:53 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5230a22cfd1so8256779a12.1; 
 Tue, 15 Aug 2023 22:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692165352; x=1692770152;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6aZkOL7SjZGnUHAIvEt/YDknB7+2gxb44+woju4e+uE=;
 b=VfCom1umUhKMEoU/+uHAV8huhuxTS3rkeuRK8CgGS4Pf/0CTvzwkECTCCDk0Nz8fYJ
 ZZwtkJuX4W3UOGSquDKAByWKGnq6kkeoW+l8JP3MOKY/nu3d8hsm5OQx3/P2yfLrBbnu
 3z5awkUHCDiAGeng8HrzdRBzgarA0HmQEtvoEAT7+4oKmYqPuqnXmlMk+jjFTlPlMNs8
 lBy632wiFdEarOdwxdnWDGbxjB/UJdfJFF9XdgK9RgQVln/1VrKM3lVuVg7/eZua2Fyt
 YzWi4KzHUqWcbOY+IxfQ9wQAUz1Ic6Mn7vmooNKeN0HCI7gcNF0jBcHSDGRtrxTYkR3R
 GrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692165352; x=1692770152;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6aZkOL7SjZGnUHAIvEt/YDknB7+2gxb44+woju4e+uE=;
 b=ED9DD/0fc/xC8GPlpNuYFxVJ+FYV3J6tJ9LmVJgZt0kt6DQbOcZopPf67n1E9EoLyi
 ztIePRJuM78+m58VTDJXdzWlOVx7f8UeX5BLWW0S6o9dM8b2BxOIiN5Q5BuPlKtW9eZL
 T4zh8hi+ZATHhylBsOkYaENJ3pyPlpQTQC8qmcB6pri4rofpSQ4CDRS+IMAgtHnLURcT
 9lHbMqPpz8Mdzj/6noDzWdlyxnopbms0isLMnKmF/QNGXWeMupEMlYFIR1x6O8stSk5L
 D0iaJd9T4J4WA7MYYGiampVwfyCSjUfFEEczlGRXAtJdP1FkYoWAbukMrrgA7tooz+SB
 bB5g==
X-Gm-Message-State: AOJu0YzvuwJk+QEAvwMUAs5Lcr46BvZW1sE9JaJNq7merEFLdiqRVcw5
 W82smbBwLrtoHfvjZ/aAOkA=
X-Google-Smtp-Source: AGHT+IF4cQjPHPsGP77huoi8BSKDn99dS/edqLrfBHnOmj+6zJvC5sm7DmueoS1E10YGpHFIdUgYtQ==
X-Received: by 2002:a17:906:259:b0:991:ed4e:1c84 with SMTP id
 25-20020a170906025900b00991ed4e1c84mr667070ejl.25.1692165351663; 
 Tue, 15 Aug 2023 22:55:51 -0700 (PDT)
Received: from ?IPV6:2a00:e180:15f4:7600:d198:bace:ace6:651f?
 ([2a00:e180:15f4:7600:d198:bace:ace6:651f])
 by smtp.gmail.com with ESMTPSA id
 a9-20020a170906190900b00992c92af6easm8031662eje.161.2023.08.15.22.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Aug 2023 22:55:51 -0700 (PDT)
Message-ID: <d1831afd-9e02-fbc9-69f7-e8f044f35ee0@gmail.com>
Date: Wed, 16 Aug 2023 07:55:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2] drm/amdgpu: register a dirty framebuffer callback for
 fbcon
Content-Language: en-US
To: Hamza Mahfooz <hamza.mahfooz@amd.com>, amd-gfx@lists.freedesktop.org
References: <20230815172700.255596-1-hamza.mahfooz@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230815172700.255596-1-hamza.mahfooz@amd.com>
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
Cc: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Guchun Chen <guchun.chen@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 stable@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 15.08.23 um 19:26 schrieb Hamza Mahfooz:
> fbcon requires that we implement &drm_framebuffer_funcs.dirty.
> Otherwise, the framebuffer might take a while to flush (which would
> manifest as noticeable lag). However, we can't enable this callback for
> non-fbcon cases since it might cause too many atomic commits to be made
> at once. So, implement amdgpu_dirtyfb() and only enable it for fbcon
> framebuffers on devices that support atomic KMS.
>
> Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Cc: stable@vger.kernel.org # 6.1+
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2519
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> ---
> v2: update variable names
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 26 ++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index d20dd3f852fc..d3b59f99cb7c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -38,6 +38,8 @@
>   #include <linux/pci.h>
>   #include <linux/pm_runtime.h>
>   #include <drm/drm_crtc_helper.h>
> +#include <drm/drm_damage_helper.h>
> +#include <drm/drm_drv.h>
>   #include <drm/drm_edid.h>
>   #include <drm/drm_fb_helper.h>
>   #include <drm/drm_gem_framebuffer_helper.h>
> @@ -532,11 +534,29 @@ bool amdgpu_display_ddc_probe(struct amdgpu_connector *amdgpu_connector,
>   	return true;
>   }
>   
> +static int amdgpu_dirtyfb(struct drm_framebuffer *fb, struct drm_file *file,
> +			  unsigned int flags, unsigned int color,
> +			  struct drm_clip_rect *clips, unsigned int num_clips)
> +{
> +
> +	if (strcmp(fb->comm, "[fbcon]"))
> +		return -ENOSYS;

Once more to the v2 of this patch: Tests like those are a pretty big 
NO-GO for upstreaming.

Regards,
Christian.

> +
> +	return drm_atomic_helper_dirtyfb(fb, file, flags, color, clips,
> +					 num_clips);
> +}
> +
>   static const struct drm_framebuffer_funcs amdgpu_fb_funcs = {
>   	.destroy = drm_gem_fb_destroy,
>   	.create_handle = drm_gem_fb_create_handle,
>   };
>   
> +static const struct drm_framebuffer_funcs amdgpu_fb_funcs_atomic = {
> +	.destroy = drm_gem_fb_destroy,
> +	.create_handle = drm_gem_fb_create_handle,
> +	.dirty = amdgpu_dirtyfb
> +};
> +
>   uint32_t amdgpu_display_supported_domains(struct amdgpu_device *adev,
>   					  uint64_t bo_flags)
>   {
> @@ -1139,7 +1159,11 @@ static int amdgpu_display_gem_fb_verify_and_init(struct drm_device *dev,
>   	if (ret)
>   		goto err;
>   
> -	ret = drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
> +	if (drm_drv_uses_atomic_modeset(dev))
> +		ret = drm_framebuffer_init(dev, &rfb->base,
> +					   &amdgpu_fb_funcs_atomic);
> +	else
> +		ret = drm_framebuffer_init(dev, &rfb->base, &amdgpu_fb_funcs);
>   
>   	if (ret)
>   		goto err;

