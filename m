Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4A2524129
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 01:41:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6ED610E702;
	Wed, 11 May 2022 23:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D2710E6CA
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 23:41:34 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id a30so4473523ljq.9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 16:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QQUBL6AAiPvENtz+HDrqxW12KA7JEtcW+/yW68TiJxc=;
 b=VUDr8ggrhQaMK4PwRgjhViEY2vsWFEy4mwnw3k7Zbbb6TmWvmC96/XXibpm2v2XTaA
 4m1O4VDM1S5i9gkgrJLcq+bYWYXHx2QcQ6iDV/HCTj6vkVNCkneY67CVa29ykvtXnG+q
 1uCAGGGdvny5rfhSb8cFeEG3m/7PKDr7uhQ5CPDWiKK5YeHYw4QsSb+tmb2PUgwj98j9
 z0xqliWNzIuTHyq3zbrvLxMWx+g0rsznaFpYHT3IBN44i02P+ouR07BJWLqcIpDNnndz
 ngt6IdHV9AdbXNnURT/4guESiUDbg6nNjpcZC2BUrgjNxGAoiWNrEuwpqGMp56tlrqxa
 Klpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QQUBL6AAiPvENtz+HDrqxW12KA7JEtcW+/yW68TiJxc=;
 b=MQ46ijWeEyIVhkHc1N8qxwvOQYWOvnP7BQemcPB6FIBnfv0JZrzVsjMhE1H9a0MMPI
 8c5o9zzoytDaitYLGfK1jRpOy2PV9nmYyomelB4jHmO9xYSxuE/cu4laig3qf+s35wvX
 ypvwBAxSvQl5AAhSb9f5X7Otr05hUG5EdW20aQSfJXgKYorH07aQ5QIpvMeMAaS3iG9+
 l8VuVGtwuZJuJxzTOmo2jJrW13dRRkfSpW/jjAlMQ0GlaepyG1gYYzaglr2Zy/OXdnk+
 EFQBVPk7qVYPGoLG/4/M1KSxtUS5BQ/yCUKqmxIN2xz18RhJhOh6o/QEYZlKyKuMuSoF
 RQtQ==
X-Gm-Message-State: AOAM533HLUpYdrV9FdkydZ81ZiSFoNoI7c76AAlz60Qh9SMV32RD/XqC
 AtwP6Sl9Wkp59KneE159iDYhaQ==
X-Google-Smtp-Source: ABdhPJyGionT4XPGSQE0dPGjN+7Ju/kSS5aDXtcvu8TNsltNR5JksN4mRMDZ4hR8ig9/gSkob5CX9Q==
X-Received: by 2002:a2e:80da:0:b0:24f:4db3:f02d with SMTP id
 r26-20020a2e80da000000b0024f4db3f02dmr18683114ljg.0.1652312492929; 
 Wed, 11 May 2022 16:41:32 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 bn17-20020a05651c179100b00250d680db18sm583654ljb.85.2022.05.11.16.41.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 May 2022 16:41:32 -0700 (PDT)
Message-ID: <6dfee07b-1c88-a3e4-9e82-b17f4e20a022@linaro.org>
Date: Thu, 12 May 2022 02:41:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/msm/dpu: add DRM_MODE_ROTATE_180 back to supported
 rotations
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <20220511222710.22394-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220511222710.22394-1-quic_abhinavk@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com, quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/05/2022 01:27, Abhinav Kumar wrote:
> DRM_MODE_ROTATE_180 was previously marked as supported even
> for devices not supporting inline rotation.
> 
> This is true because the SSPPs can always flip the image.
> 
> After inline rotation support changes, this bit was removed
> and kms_rotation_crc IGT test starts skipping now whereas
> it was previously passing.
> 
> Restore DRM_MODE_ROTATE_180 bit to the supported rotations
> list.
> 
> Fixes: dabfdd89eaa92 ("add inline rotation support for sc7280")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 9d2f0364d2c7..5b5aef249390 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1577,7 +1577,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   			BIT(DRM_MODE_BLEND_PREMULTI) |
>   			BIT(DRM_MODE_BLEND_COVERAGE));
>   
> -	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> +	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180;

Nit: can we rename this to handled_rotations to remove confusion with 
supported_rotations from dpu_plane_atomic_check()?

Nevertheless:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

>   
>   	if (pdpu->pipe_hw->cap->features & BIT(DPU_SSPP_INLINE_ROTATION))
>   		supported_rotations |= DRM_MODE_ROTATE_MASK;


-- 
With best wishes
Dmitry
