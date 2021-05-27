Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0939393954
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864566F516;
	Thu, 27 May 2021 23:45:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 349FD6F517
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 23:45:10 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id w15so2993010ljo.10
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 16:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Agf93Ei+9Tdc8Zvz0bPaizkEiLAVgHXWf+4M50aPaoE=;
 b=nMLBX5g3X755skTAhGoSjvtud9YhlWMACVOScm/kNloVrVed8R0YJUV775o79Jx9Wl
 MDSDih8RcL440wYlNQpFDNytOoigNMc04LUUwX4qflmZjpJfPGt1d9e8j5xKUVgiNWJq
 UtaarziZM/3+2DOLG1Mp8D1+hrRjYRMFsaGFwMLiCjVw2DLYv0ifSiJT0LHxL4WSJil/
 oSJ82ZDgS/UpNpLj0CnbRLmoeHkbULctk4u2GDbHvm1L7sukyOExw6gXoDTmFQRbFfmr
 rSM0UbGJLzvlMpR2BAwpVz+5XaT7ECbXnuit+qUapS5gUbtJI03LwJhbvNBAg2t9oTfX
 ReoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Agf93Ei+9Tdc8Zvz0bPaizkEiLAVgHXWf+4M50aPaoE=;
 b=luBk8M+ycpUZz3+Uge7eYNzpt+QKpuWs5TlZzFHe3i2o0Se0ZFpcdyX5FN1KfqjEwl
 zg/7j9jlnbz7QtLz/RUFCDsnNPZGZOxAEeXWiQlzGcqfW2xXs3mCKu958yb+/THcTNkp
 bt70Lr4yOkfEfa1HQJmTeqBSV+ZV6emkmPZwqeqIfXrA+D4UTVD1RMAp+Vfqtj9LrJBU
 kTYj7pdBbC6dIZ2mfQUOxDvlQ7S0A6bMwYlThjkz2rmaD9MzHErhqWvZezVSBSZJ9qfP
 V/h67t7fBm+iGsdgg3uImAMM+ZnEGDUoro19x7RFC0ZW+C/AdGFWQvpqIg01vFklMyCd
 mviA==
X-Gm-Message-State: AOAM5307M54kEtygliNFGrUC4pdN4xLsOy8UnC6HdFAfCwfLZmFwoGCF
 phef0PcgZvAK9myQ+LNyMY+mtQ==
X-Google-Smtp-Source: ABdhPJwpm9LP4ARZQheOF4vnrUK8YBrm3JYilKh6GFbYW+t31vOsjf6nmJE0sqqDaGqQ4CfmeZEBTA==
X-Received: by 2002:a2e:9196:: with SMTP id f22mr4363198ljg.88.1622159108474; 
 Thu, 27 May 2021 16:45:08 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s1sm368494ljj.69.2021.05.27.16.45.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 May 2021 16:45:07 -0700 (PDT)
Subject: Re: [RFC PATCH 03/13] drm/msm/dsi: add support for dsc data
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20210521124946.3617862-1-vkoul@kernel.org>
 <20210521124946.3617862-5-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <73815f0b-b6d1-f6f3-d7aa-f77492861967@linaro.org>
Date: Fri, 28 May 2021 02:45:07 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521124946.3617862-5-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/05/2021 15:49, Vinod Koul wrote:
> DSC needs some configuration from device tree, add support to read and
> store these params and add DSC structures in msm_drv
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/dsi/dsi_host.c | 170 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/msm/msm_drv.h      |  32 ++++++
>   2 files changed, 202 insertions(+)
> 


[skipped]


>   		DRM_DEV_ERROR(dev, "%s: invalid lane configuration %d\n",
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 2668941df529..26661dd43936 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -30,6 +30,7 @@
>   #include <drm/drm_plane_helper.h>
>   #include <drm/drm_probe_helper.h>
>   #include <drm/drm_fb_helper.h>
> +#include <drm/drm_dsc.h>
>   #include <drm/msm_drm.h>
>   #include <drm/drm_gem.h>
>   
> @@ -70,6 +71,16 @@ enum msm_mdp_plane_property {
>   #define MSM_GPU_MAX_RINGS 4
>   #define MAX_H_TILES_PER_DISPLAY 2
>   
> +/**
> + * enum msm_display_compression_type - compression method used for pixel stream
> + * @MSM_DISPLAY_COMPRESSION_NONE:	Pixel data is not compressed
> + * @MSM_DISPLAY_COMPRESSION_DSC:	DSC compresison is used
> + */
> +enum msm_display_compression_type {
> +	MSM_DISPLAY_COMPRESSION_NONE,
> +	MSM_DISPLAY_COMPRESSION_DSC,
> +};
> +

Seems to be unused

>   /**
>    * enum msm_display_caps - features/capabilities supported by displays
>    * @MSM_DISPLAY_CAP_VID_MODE:           Video or "active" mode supported



-- 
With best wishes
Dmitry
