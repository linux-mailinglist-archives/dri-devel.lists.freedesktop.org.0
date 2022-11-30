Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D92D63D8D9
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 16:08:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A46AF10E47C;
	Wed, 30 Nov 2022 15:08:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A490310E479
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 15:08:41 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id u27so16391945lfc.9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 07:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZYfIBfYi65QOjaw7VkDUPxWFzywCv79WV4n65fszNVU=;
 b=sf/2hz/IrnallWjP9XknwUUDXHJblaEo/mri/HkWsjmzY9Yr4/WWEU6udOKIk2LbZZ
 JYwehJjD9anBF7rMx5ggMRESEhnAU7X2nRSjF6BcWt2zEUDeL5phkf8NSSYzLII7qZ9b
 R4YLwjPB0m5mcLxIKnjx6oRUv2hy3px/Y9pLx9DlOn5t80oaawpjVqY+oIMDOUHOOclk
 i9taTM84hKpMbFvznl+qh70JXN5Q7SimgyquECB8clAnQOGGG01Wai8vVh3FJ9uoFTrN
 eF8qwk18aAp2/ItmdGq2cTnOkPj0Ev8bo54XnWwwmiLR7yWHY5S47LGlNrqYyJ2FQp1o
 MfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZYfIBfYi65QOjaw7VkDUPxWFzywCv79WV4n65fszNVU=;
 b=oPB/nZDaJFWAXkjHK7YBOSHMLhU3/NHkEYf7PLshv+NC3wAc+iMK9I2cO6HebCnL4A
 I4n3HIjcJXGrnKJLkcjrgeEWADLW7lmCTdqSjnOxBuiktiwKmAau9Hfx6N5ZtKHLRHVI
 7ixvltUJDd0wU+ETSF4lqM16ubDJ4vpVQN/2o7bB/2kXqdmHfMt+jIWwjzY0WQ8d3q2M
 0Zkosr19UuamFWLjZ8tKNUzHRvhtXSHHqcjAi8NrLaOigFxMegXA7mDCljGM5Q4ol2zj
 vYwoE8SD/Zep5xwAO1Rf1cjdmbZUppbaYBBbGrtKAb887nXhv5bEH0Kdf6Sf5VonlI7K
 eqKw==
X-Gm-Message-State: ANoB5pkWZzJgjVJVvGDpP0qZr6LMl4r+khuGoCHeMcm8WdRtRHgjGiTL
 kYg3io/00ldvQuYodUCIPeuFXg==
X-Google-Smtp-Source: AA0mqf5Wdcn8iJZuhr5JDcQFbL8gXEwhGIZrCy6wdy3H+GPIx6fF1A2ejA8+AJRekiQCwjCpDmUgIA==
X-Received: by 2002:a05:6512:211:b0:4b4:ea76:8017 with SMTP id
 a17-20020a056512021100b004b4ea768017mr11854189lfo.560.1669820919397; 
 Wed, 30 Nov 2022 07:08:39 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a19914f000000b004b4b9beb0eesm292896lfj.50.2022.11.30.07.08.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 07:08:38 -0800 (PST)
Message-ID: <dcd1ae97-e04b-1021-37d5-749d263cdabe@linaro.org>
Date: Wed, 30 Nov 2022 16:08:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 02/12] dt-bindings: thermal: tsens: Add SM6115 compatible
Content-Language: en-US
To: Adam Skladowski <a39.skl@gmail.com>
References: <20221129204616.47006-1-a39.skl@gmail.com>
 <20221129204616.47006-3-a39.skl@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221129204616.47006-3-a39.skl@gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 phone-devel@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Gross <agross@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 devicetree@vger.kernel.org, Amit Kucheria <amitk@kernel.org>,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/11/2022 21:46, Adam Skladowski wrote:
> Document compatible for tsens on Qualcomm SM6115 platform
> according to downstream dts it ship v2.4 of IP
> 
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>



Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

