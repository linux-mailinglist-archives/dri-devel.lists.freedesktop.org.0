Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 698AC6384F7
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 09:06:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E041910E70E;
	Fri, 25 Nov 2022 08:06:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F08A310E70C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 08:06:05 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id b9so4297030ljr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 00:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=D49i9+CqzhVncl5C6H/ptIMUdWGDiCQ2jV+wEFz40RA=;
 b=n/PGbygZuJrtVuapZT8bdM1579wHkSd3l9IVakzRsfx7SFDPCr6+z1phHUMbC7MmGe
 l/nsjSlGVD2z4Ql58NgWsJHRrVUzG7RoeQrjMaqM9UONFICqoyR0Tw+00DDFFZvIO7vg
 U28rpMxn0j2YvgpkiiuJk42Vm4yD+JEts2R5QBOzdtuVU/Vp4lKR5MUzEZNqADHAuxOD
 zS0pIKtB9DCjUE87vlRxcwXBWCI1crkRmWZ1MYhAUFyqP+rPp4m+y4/YLGju2vOSYkJU
 UbhqOzmk8husMENiGNoJibHkxoCo8tl3yVs6dAgP54EOQNJgMF3o6IU2j6VLBVx2QXTu
 aNlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D49i9+CqzhVncl5C6H/ptIMUdWGDiCQ2jV+wEFz40RA=;
 b=AZAIPmJ/isjVDVWAm03psGmj2rX3eNbzlQuDsfbp9CzQHPucnXbo8S8ufUydiGj9xl
 g7xSzC3In4J+NUOsFIBW7BHG+OilA+lrmRYmEU1C0gxH9L+JLHuxgrLKTuUurXCBeSUm
 PiRdcBi39Q/NxaTbcGDr/z2MdlJm1DQFOd5KSZr5ziGWYSOevLWP/x3quFl6ayULpVk9
 9lm1pDhKAGXwT30YL1qYx+/PzItvYja0aQd+hZhi0PKG9ptntM2qlCSjsJI8H0eWa5H9
 QyAWHomVcSgao1pY5XcUC68jsDNRakPKcmZSHNr5HbzSjbpRKmF4fqcqn4M1LOoa6yzU
 jFeQ==
X-Gm-Message-State: ANoB5pl64hKmw/uimO5vaCEFDpEOK8V1KZadYcis3d+bfhWWVJZuedrN
 MRWeFy7uN9vWO6FnlXHL+Yc3CA==
X-Google-Smtp-Source: AA0mqf6VxT1aEXu7weoSccK7/ISZvPA73NLRVTO6wuY9yZQZBdzrp0PjPI71T4AeNAn5MJj15hwsPw==
X-Received: by 2002:a2e:aa94:0:b0:277:871:5712 with SMTP id
 bj20-20020a2eaa94000000b0027708715712mr11000813ljb.129.1669363563955; 
 Fri, 25 Nov 2022 00:06:03 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b24-20020a196458000000b004949a8df775sm433304lfj.33.2022.11.25.00.06.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 00:06:03 -0800 (PST)
Message-ID: <8ad024c8-1284-0f72-91a3-2a8d9b5692fe@linaro.org>
Date: Fri, 25 Nov 2022 09:06:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/2] dt-bindings: display/msm: add support for SM6115
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221124001708.25720-1-a39.skl@gmail.com>
 <20221124001708.25720-2-a39.skl@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124001708.25720-2-a39.skl@gmail.com>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 Jason Wang <wangborong@cdjrlc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, phone-devel@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 Loic Poulain <loic.poulain@linaro.org>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>, Vinod Koul <vkoul@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/11/2022 01:16, Adam Skladowski wrote:
> Add DPU and MDSS schemas to describe MDSS and DPU blocks on the Qualcomm
> SM6115 platform.
> Configuration for DSI/PHY is shared with QCM2290 so compatibles are reused.
> Lack of dsi phy supply in example is intended
> due to fact on qcm2290, sm6115 and sm6125
> this phy is supplied via power domain, not regulator.
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

