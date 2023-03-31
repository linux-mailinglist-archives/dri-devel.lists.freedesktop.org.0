Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 005E06D1438
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 02:39:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B5910E31A;
	Fri, 31 Mar 2023 00:39:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0C3A10E31A
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Mar 2023 00:39:11 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id g17so26875198lfv.4
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 17:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680223150;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GGffWxiLWtEc/sDkXGzevKji1Y0bUIbGHyNyuOurZmg=;
 b=hw6P+cNJTYoVFUvkhbDLCLyr6hkV8w6DdP80DifpNo1tZPIrNXR4LvRxV1DOjkKREh
 +amDuT0QfAgO9fkwBXYUcFk/Sksxwa8YCiruNRuBTHwfuWVxd2HLmgwjrs2+DJpkuYZJ
 7d0WBXPuU574cvAX8TSPEPv/ZwjCMislILLMYgR7Kj5saimZqfizVHEQR6MXiXiT6XNB
 qe5moXa91McwwRoQKdEDzsPzXAz5yi8EX8m8AIoHJLU5BoJr4nH3LtefyJmgtyO32CM1
 pE69mICzXN16x5fkrLzHVmccjiBr51/87wPyCwvs9vy3KiYQjwilRPVUzAX7TvMPmo55
 USFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680223150;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GGffWxiLWtEc/sDkXGzevKji1Y0bUIbGHyNyuOurZmg=;
 b=yuTw+pUO+FX+pRBk9QZOK2hgriL09uKQPZr2QBdALrIH/WpH5dPxHOmg852jNoAKBS
 wI5ysXo6qZeCfNYVDbFqIhtCwHzambCrYim7H4wKy0F6Ojl6j+bZwjdikYHgtwU/XD5Y
 Ze0i4r1eiJJ7rGOmQKHtift3Vocc0rza3RUM5XpgKgG7Q24sw9zi0wZxVF+xFn1Pnzmk
 nU4ApXob5xyrcL9QAJ/i02knwSGgkkQIfR0fj2eRdDJFRg2V2ku/YNbH/RVWj+a/vdh8
 Y+ywMCgP53H9ep0XyVP9tlA2bC0eVGTtCsNWiBZ7oF68rLHKd8fwxftcOGupkC9Dg4JP
 vD0g==
X-Gm-Message-State: AAQBX9cSshR0Qz08nYbR1MlfDn4c08kzLrKJs2rxAwNaG3Qfxm6w8nAf
 IPmDVmCBe/O9M5kCIx1/Nvz3dg==
X-Google-Smtp-Source: AKy350YSStvzpj8ckN2dlm2ZDKPCmXkOO8MPKj1SGrOpVpVoFQCvkIaHGATguDKP7y44/9sGbxM2jQ==
X-Received: by 2002:ac2:5ec6:0:b0:4eb:20e:6aec with SMTP id
 d6-20020ac25ec6000000b004eb020e6aecmr7159970lfq.40.1680223149832; 
 Thu, 30 Mar 2023 17:39:09 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 10-20020ac2484a000000b004a2c447598fsm147065lfy.159.2023.03.30.17.39.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 17:39:09 -0700 (PDT)
Message-ID: <48ac39ed-cb14-a07a-447f-b1022c44737e@linaro.org>
Date: Fri, 31 Mar 2023 03:39:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 2/5] drm/msm/a6xx: Add support for A650 speed binning
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
References: <20230120172233.1905761-1-konrad.dybcio@linaro.org>
 <20230120172233.1905761-3-konrad.dybcio@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230120172233.1905761-3-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/01/2023 19:22, Konrad Dybcio wrote:
> Add support for matching QFPROM fuse values to get the correct speed bin
> on A650 (SM8250) GPUs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Thank you for the patch. It took me a while to dive into various ways 
vendor kernels handle GPU speed bins.

> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 0ee8cb3e490c..c5f5d0bb3fdc 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1894,6 +1894,20 @@ static u32 a640_get_speed_bin(u32 fuse)
>   	return UINT_MAX;
>   }
>   
> +static u32 a650_get_speed_bin(u32 fuse)
> +{
> +	if (fuse == 0)
> +		return 0;
> +	else if (fuse == 1)
> +		return 1;
> +	else if (fuse == 2)
> +		return 2;
> +	else if (fuse == 3)
> +		return 3;
> +
> +	return UINT_MAX;
> +}
> +
>   static u32 adreno_7c3_get_speed_bin(u32 fuse)
>   {
>   	if (fuse == 0)
> @@ -1922,6 +1936,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
>   	if (adreno_cmp_rev(ADRENO_REV(6, 4, 0, ANY_ID), rev))
>   		val = a640_get_speed_bin(fuse);
>   
> +	if (adreno_cmp_rev(ADRENO_REV(6, 5, 0, ANY_ID), rev))
> +		val = a650_get_speed_bin(fuse);
> +
>   	if (val == UINT_MAX) {
>   		DRM_DEV_ERROR(dev,
>   			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",

-- 
With best wishes
Dmitry

