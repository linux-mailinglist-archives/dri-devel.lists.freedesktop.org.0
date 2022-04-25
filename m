Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C9B50EBE9
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 00:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 221C810E29E;
	Mon, 25 Apr 2022 22:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD2F10EE97
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 22:23:41 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id n14so8029776lfu.13
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 15:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=X6tPtyrOOLF1/p14xxSTVx958MJNQbxFMOc73dV5Mzo=;
 b=Ce7pCVUGiFJQSnItmyWywubtP/Tv45dyMCL1pPWfKJJsTdHrxgfCvX2KsBbiyFqZGS
 901m5YPZcONrcIef6sdmwhVrPW1kaCXD9G041SP5iPMSzE1RLDX+bASNocYr2CCvcDXs
 zB7zZVUHI8pwS/nHvMGZNa/UtCBMU90HFa3ZsXC8jEoLC+6kVzr7bukkiDi9clU5rCha
 8qOIrhFwfd6NpJUV3luIYezgZV1CPJFqxHRNEiyLpuRKNM5yFKbwPwikPsjqQI/LB11r
 /sXNjJZo08eJQNLd4RxJWAtWXTe3iq0fTXNDpIRvqPVrs2Cme9p0NXt8bwoXT1g50RuN
 QK4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=X6tPtyrOOLF1/p14xxSTVx958MJNQbxFMOc73dV5Mzo=;
 b=dhytHAkipHbWbmqviveRGcyRA9/KgoPgxTv5FGOuPeh/gCqCuDMf3EEQ3bPpRyywhp
 2F9395T2cVX3z0POghu0hbx2my3ykqXZMU67wo0nMAUmnrYc2AWBAtbnDDe94GBe81zk
 YNr4pYpg/8HyiOW1N6k6kNtt8F9NPEdLkz0wjGq4qz6a6hQ5H+wus+19QDbBn3s+GiFd
 VdJgRCvJ1HIZk1h7TFhtPQLZwoQdyTBBAZsPvhsWob4toEarr2RNw5Bog1wfVtT+Ysy7
 OD73GN5MHzTXpuR1tAzecfZbsut2HPdE47L5TYhKlkI6xS2C4rhVudijGV+g6R1k4iXL
 Njbg==
X-Gm-Message-State: AOAM533Kd+9awHq+C4DdGIa+jzELDzJcCuQjy/5c524xEQU0LTKnJkHs
 5GEvXy3c/HsU+mDLGWztWjledw==
X-Google-Smtp-Source: ABdhPJzxHLoRrGJZ4lg39u4RC4KZZ7ipF64tibG2Qxu8QIwRay7SmyMbnhHFRx5OOlxuYAKETLeK2Q==
X-Received: by 2002:a05:6512:b1e:b0:44a:9b62:3201 with SMTP id
 w30-20020a0565120b1e00b0044a9b623201mr14974371lfu.42.1650925419622; 
 Mon, 25 Apr 2022 15:23:39 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a05651c023100b0024f11b44e93sm453321ljn.102.2022.04.25.15.23.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Apr 2022 15:23:39 -0700 (PDT)
Message-ID: <d315bd2d-6f8d-592f-b24e-15ee34ca22d8@linaro.org>
Date: Tue, 26 Apr 2022 01:23:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] drm: msm: fix error check return value of
 irq_of_parse_and_map()
Content-Language: en-GB
To: cgel.zte@gmail.com
References: <39b3828e-064c-6aa4-de77-35b201b1b40f@linaro.org>
 <20220424031959.3172406-1-lv.ruyi@zte.com.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220424031959.3172406-1-lv.ruyi@zte.com.cn>
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
Cc: sean@poorly.run, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 lv.ruyi@zte.com.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, quic_abhinavk@quicinc.com,
 quic_mkrishn@quicinc.com, vulab@iscas.ac.cn, swboyd@chromium.org,
 freedreno@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/04/2022 06:19, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> The irq_of_parse_and_map() function returns 0 on failure, and does not
> return an negative value.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
> v2: don't print irq, and return ERR_PTR(-EINVAL)
> ---
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 3b92372e7bdf..44e395e59df9 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -570,9 +570,9 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>   	}
>   
>   	irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
> -	if (irq < 0) {
> -		ret = irq;
> -		DRM_DEV_ERROR(&pdev->dev, "failed to get irq: %d\n", ret);
> +	if (!irq) {
> +		ret = -EINVAL;
> +		DRM_DEV_ERROR(&pdev->dev, "failed to get irq\n");
>   		goto fail;
>   	}
>   


-- 
With best wishes
Dmitry
