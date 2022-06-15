Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E43454C8D5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 14:45:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D22C10E58A;
	Wed, 15 Jun 2022 12:45:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA32110E58D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 12:45:34 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id c4so18697105lfj.12
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 05:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=2zOauB4b7g5lcbnITMMxeE2s0wgTpDslehgvoxa82L8=;
 b=UMAfnrE2aWigR/q6xMPtvhg2ojjat/jbG6oiLiFyBq+r77LyfInB/UMBk0IZsK/KTN
 bXJCj64jpBE273Mdgpj6B4Iwfw5bchCRj3qT6ZNRvb7KglCzvVzMpkWT1ShGllZkTGVA
 JRLBof22O17mYlvel5ag4PwkY4hU6i9DoP09yHKsHhtQJcOoifgDHkyLHTcyIPUFtrFL
 k7KhZHVn7eEynoa4tNELhdGo2DxCKcqEWT1y1ewG8NyNJnWlmSUGJW2jC6DMHlOfSGX6
 LxRwaaQt9NG2rmzZ6ymFOsB7ofiiWR6/kYw9FzQ+fjNP98X4/Efj4sFhuDkazw+exMvC
 FcIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=2zOauB4b7g5lcbnITMMxeE2s0wgTpDslehgvoxa82L8=;
 b=R8LArIxo6UKcxR4R99ySjQPADyzh3Upginn2vEsitCtqGTJZO7Sb+01Rq1S7KagxWC
 CY4MVbFEkKayH74rmqDwjqRGGO0OyyEZGg4NB+XSSHrPWsB4hfn81fIBBERpeH0GMV8K
 LngUV92b6AfpHuzWh57SHT66CYh+aKcqD6uDV+XYEuTqXTPSfVmIOCiMNcdSI48rmjk7
 Js8CR6GVAJXpWOhqV7hg7U7R1lXOWbhD4NCkl39rjE7ZYUrbL5bAAvjEEzJljc0uztq2
 yrgFGoy0P5GsCs1OEfulrq9drYID6OYsIaDIs+v73mUFYwZ+05Tc8k3mNyeFi583iH5y
 0dwA==
X-Gm-Message-State: AJIora+G7OjMV1kSdrL7ChnNeHZt9XwCQZK+odaFmmf7N8y2kNiWkb24
 xs4OedSwHHctyalC1sy7W9X30Q==
X-Google-Smtp-Source: AGRyM1uErqHFJQHAFNutC12wS6K6kS65Ce/no+PwzNQ7oDUszt3CS3a7ktVh56u8Xg1iwUq49+/qrw==
X-Received: by 2002:ac2:4e86:0:b0:479:242:61da with SMTP id
 o6-20020ac24e86000000b00479024261damr5995734lfr.40.1655297133091; 
 Wed, 15 Jun 2022 05:45:33 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 br21-20020a056512401500b0047255d2114asm1780870lfb.121.2022.06.15.05.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 05:45:32 -0700 (PDT)
Message-ID: <5066e977-52b5-ce18-98e9-44dcfe018127@linaro.org>
Date: Wed, 15 Jun 2022 15:45:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 1/2] drm: Add DRM_GEM_FOPS
Content-Language: en-GB
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220609174213.2265938-1-robdclark@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220609174213.2265938-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 Chris Healy <cphealy@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/06/2022 20:42, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The DEFINE_DRM_GEM_FOPS() helper is a bit limiting if a driver wants to
> provide additional file ops, like show_fdinfo().
> 
> v2: Split out DRM_GEM_FOPS instead of making DEFINE_DRM_GEM_FOPS
>      varardic
> v3: nits
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

I suspect that with Tomas's ack we can pick this through the drm/msm. Is 
this correct? (I'll then pick it for the msm-lumag).

> ---
>   include/drm/drm_gem.h | 26 ++++++++++++++++++--------
>   1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 9d7c61a122dc..87cffc9efa85 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -314,6 +314,23 @@ struct drm_gem_object {
>   	const struct drm_gem_object_funcs *funcs;
>   };
>   
> +/**
> + * DRM_GEM_FOPS - Default drm GEM file operations
> + *
> + * This macro provides a shorthand for setting the GEM file ops in the
> + * &file_operations structure.  If all you need are the default ops, use
> + * DEFINE_DRM_GEM_FOPS instead.
> + */
> +#define DRM_GEM_FOPS \
> +	.open		= drm_open,\
> +	.release	= drm_release,\
> +	.unlocked_ioctl	= drm_ioctl,\
> +	.compat_ioctl	= drm_compat_ioctl,\
> +	.poll		= drm_poll,\
> +	.read		= drm_read,\
> +	.llseek		= noop_llseek,\
> +	.mmap		= drm_gem_mmap
> +
>   /**
>    * DEFINE_DRM_GEM_FOPS() - macro to generate file operations for GEM drivers
>    * @name: name for the generated structure
> @@ -330,14 +347,7 @@ struct drm_gem_object {
>   #define DEFINE_DRM_GEM_FOPS(name) \
>   	static const struct file_operations name = {\
>   		.owner		= THIS_MODULE,\
> -		.open		= drm_open,\
> -		.release	= drm_release,\
> -		.unlocked_ioctl	= drm_ioctl,\
> -		.compat_ioctl	= drm_compat_ioctl,\
> -		.poll		= drm_poll,\
> -		.read		= drm_read,\
> -		.llseek		= noop_llseek,\
> -		.mmap		= drm_gem_mmap,\
> +		DRM_GEM_FOPS,\
>   	}
>   
>   void drm_gem_object_release(struct drm_gem_object *obj);


-- 
With best wishes
Dmitry
