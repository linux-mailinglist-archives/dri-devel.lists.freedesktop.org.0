Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0FC6DC0A0
	for <lists+dri-devel@lfdr.de>; Sun,  9 Apr 2023 18:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628FD10E1C8;
	Sun,  9 Apr 2023 16:10:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226FE10E1C6;
 Sun,  9 Apr 2023 16:10:32 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id a44so29094922ljr.10;
 Sun, 09 Apr 2023 09:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681056627; x=1683648627;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sZREeCBr///Shiq8jdwSn0p5JZZF5ydSiJvYkwH+KoQ=;
 b=RusavgALAATkpcX03rmvi5j99Xg9ZjHCWQk+vMeGZHh1jy5rOXpEPDE5AhXid7U5Pt
 gFYWkBLXoNRK9P0igG2zk0TiPLBwjkV5a2XhQj6LRp1tSGyvu3BXmlMbQgGKGfHijD3o
 SNtcjEUPsDK3/6RZch1MTnSB62p3QyGACfCFhYOENOGOrvr0ttdU2MaZy2Fe5mj/kJD+
 3PMGx3RSB34lTQPFLhJzZJ6nFNPlwHRH9d1VQANAKYx/rKKp41unXQEHktrJob5eMNdq
 KWCCiAskqgqLGDnxqmlME0JWXjcmyXko1U58NeJzxO6fz9P9LCr5MO3uS3BN0j/yM94R
 gLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681056627; x=1683648627;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sZREeCBr///Shiq8jdwSn0p5JZZF5ydSiJvYkwH+KoQ=;
 b=Y+ZzsMlqIJvltw9ySwZOWkJv++u1/w90FCaiwpKUh+PivaxSaVgJA5zv063DfRMOsy
 lCefvWGt2eOs9qA5I/pVCrWQK/1IHKhZqRCIOzoEkQ/wSGQmT1W75UKbEx72gFjHAxhi
 VSORBKPoMiJUgDgK2MAbN0MUt6x8v0UYNZ1ydX9mo2Nw+lI3IycU3C3M9RnKf+qaM7NH
 yGCdpvXwhdk2tt7sPRUI7wXdyHRRFpZVjfm2gJAcJUbOtVY9TanWLQwWHVYke6IHDQuU
 /WW2rpjiKpRCUN7k6Vm8VMZwbxU0Q5oMy6EKi3mmOkn4sIkCrwHV8R4eKxVgI+yldTrv
 Pxtw==
X-Gm-Message-State: AAQBX9eWCrmluo1Mt4nWoi8GpB9KkrYjrYzmTrieVPE71TQBy/uIHhqA
 jLuLtyEcc9bp2IYjrflgDhg=
X-Google-Smtp-Source: AKy350ZxrjVC65CacRj+DQu/msGQpYSlVaHr/3NhIsTGmFIWOMxrPMXfH8C930zX49GwpeEO8J2Prg==
X-Received: by 2002:a2e:9c90:0:b0:298:aa96:55c2 with SMTP id
 x16-20020a2e9c90000000b00298aa9655c2mr2775935lji.44.1681056627532; 
 Sun, 09 Apr 2023 09:10:27 -0700 (PDT)
Received: from [192.168.1.107] (byy157.neoplus.adsl.tpnet.pl. [83.30.44.157])
 by smtp.gmail.com with ESMTPSA id
 u7-20020a2e9f07000000b002a76f63a657sm555210ljk.105.2023.04.09.09.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Apr 2023 09:10:27 -0700 (PDT)
Message-ID: <7affdcfd-1e75-4a96-1110-83cfdb3e596e@gmail.com>
Date: Sun, 9 Apr 2023 18:10:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH] drm/msm/a5xx: really check for A510 in a5xx_gpu_init
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230409011329.2365570-1-dmitry.baryshkov@linaro.org>
From: Adam Skl <a39.skl@gmail.com>
In-Reply-To: <20230409011329.2365570-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 9.04.2023 03:13, Dmitry Baryshkov wrote:

> The commit 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno
> 510") added special handling for a510 (this SKU doesn't seem to support
> preemption, so the driver should clamp nr_rings to 1). However the
> gpu->revn is not yet set (it is set later, in adreno_gpu_init()) and
> thus the condition is always false. Check config->rev instead.
>
> Fixes: 010c8bbad2cb ("drm: msm: adreno: Disable preemption on Adreno 510")
> Reported-by: Adam Skladowski <a39.skl@gmail.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 1e8d2982d603..a99310b68793 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1743,6 +1743,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  {
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct platform_device *pdev = priv->gpu_pdev;
> +	struct adreno_platform_config *config = pdev->dev.platform_data;
>  	struct a5xx_gpu *a5xx_gpu = NULL;
>  	struct adreno_gpu *adreno_gpu;
>  	struct msm_gpu *gpu;
> @@ -1769,7 +1770,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
>  
>  	nr_rings = 4;
>  
> -	if (adreno_is_a510(adreno_gpu))
> +	if (adreno_cmp_rev(ADRENO_REV(5, 1, 0, ANY_ID), config->rev))
>  		nr_rings = 1;
>  
>  	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, nr_rings);

After testing on Leeco S2 it appears to work as intended now, thanks.

Tested-by: Adam Skladowski <a39.skl@gmail.com>

