Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D45621E3E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 22:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6726010E0D5;
	Tue,  8 Nov 2022 21:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886F410E03C
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 21:10:33 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id d20so22933085ljc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 13:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6ZAafqOZBdpxx83ZFYFN1Hi8JWgUTuB0MF2wqgfb+j0=;
 b=BmbRlhuIxfQgv60+/uxmJD2mUTMS1D0a5vXHhZdSI+B0M5n7f+PY+aY+i3bYejK+47
 QAdInA8SRHniQJjhhghXtj43Y63XNmSMkmmTfTfgYedB6o8JaZTnyatSRXboWFXzzkD8
 g2QTiyGD9OFXonYu/wW1c7sVz7Lz7oaxfiWFJNRGfSlCfaPJrTkpgUNBuc9HeD98Ah24
 YpHZNx0F0/+cfv0RdCs+sd/hp7I/iGeLbyq/AyZr/jaiGdiBxohdkNnS+fx/fy2Hpfyr
 3WxJzj5MdugdN3Sot7qFgjiKrVQpDMLOmwPQXKT4N6+Tmja50fD0vqu1PTZ0NNp4I0Lt
 djPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6ZAafqOZBdpxx83ZFYFN1Hi8JWgUTuB0MF2wqgfb+j0=;
 b=IvFJNw5Pr98LwTKeK7xTRzes0WeqFTzcEjTtT4EjI9S+0NYbbnI+Qu+EENZI7LDoxo
 05iLEiRzYh3RrLLvMLQ4uPGLCMXV6MQ6j8KHtDZDz9TQ7QMXMkgeXOVv3IMwM/Seongt
 UIGYlSFuyOuYs2ThZWXPcgZoKZd4bt49o3B6MPeKaDZIbUweTkfuxHHnuONet1N1J8aG
 wSxOILJsqG5bjtVsQH3MfD7WLGi50VNPRfWgXU0pMubxFTeLaJmhASj2xmzjSvnGECy1
 SpbTJSDPTfCpVT6Zb19C1Aj6ECGFB5U0XV0M72edubWTgrYOzghG3GuYO7zlrJxpDEdI
 fJ/A==
X-Gm-Message-State: ACrzQf3PHquszqBGKZ/FVfgKFxXmtqZBJRUd3Bol2/KNVJ4XMwLwaSVU
 oQVljM1zk+7U6h04wWHSH0q7Yw==
X-Google-Smtp-Source: AMsMyM4fusBtXtXt1yqqm9JfpkjsgoZrmDOHZ38/STvFvd3nHz0ohLlYZyuEMRbdkEJIFvFcju188w==
X-Received: by 2002:a05:651c:1207:b0:277:276a:9d7b with SMTP id
 i7-20020a05651c120700b00277276a9d7bmr19141181lja.129.1667941831467; 
 Tue, 08 Nov 2022 13:10:31 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056512210d00b0049c29292250sm1932529lfr.149.2022.11.08.13.10.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 13:10:30 -0800 (PST)
Message-ID: <b482360f-16d2-6a7d-2cbe-72f2a1c6f50f@linaro.org>
Date: Tue, 8 Nov 2022 22:10:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 02/18] dt-bindings: msm: dsi-controller-main: Fix
 power-domain constraint
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
 quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-3-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221107235654.1769462-3-bryan.odonoghue@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 08/11/2022 00:56, Bryan O'Donoghue wrote:
> power-domain is required for the sc7180 dispcc GDSC but not every qcom SoC
> has a similar dependency for example the aqp8064.
> 
> Most Qcom SoC's using mdss-dsi-ctrl seem to have the ability to
> power-collapse the MDP without collapsing DSI.
> 
> For example the qcom vendor kernel commit for apq8084, msm8226, msm8916, msm8974
> 
> https://review.carbonrom.org/plugins/gitiles/CarbonROM/android_kernel_oneplus_msm8994/+/7b5c011a770daa2811778937ed646237a28a8694
> 
> "ARM: dts: msm: add mdss gdsc supply to dsi controller device
> 
>  It is possible for the DSI controller to be active when MDP is
>  power collapsed. DSI controller needs to have it's own vote for
>  mdss gdsc to ensure that gdsc remains on in such cases."
> 
> This however doesn't appear to be the case for the apq8064 so we shouldn't
> be marking power-domain as required in yaml checks.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org

Your Cc list is huge and not necessary to store in git log. For example
I am appearing there twice. Please keep it under '---'.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

