Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3897658A83
	for <lists+dri-devel@lfdr.de>; Thu, 29 Dec 2022 09:26:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8453010E1F6;
	Thu, 29 Dec 2022 08:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB54810E1F6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 08:26:03 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id v23so8620849ljj.9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Dec 2022 00:26:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2jD6n3VI4U3d7CzDLMYOr4tAgBELkqFchc0PWmapwU8=;
 b=qhEE4crGFgsdwFNKY2hdx6b7U+9CNNrQU/L8EM7pLIpvdLqLPQ/X0IBU6xWI/+Tjsb
 9FjNHb7ac8oTGST4Pbt4LqMouaI7o6ptRX4gxrDV+DY0BsNtQ6dSwvr001n+5/bQS1TW
 dOYdrUbb3v+dkIbYWz8iLCg7x3t4MMPZ2yEMkhH+Z1WWRJ5+yQu/egLPHHwdl+1Fnl0r
 PuT+vKRtc4y/RnrOZISux3vGOnMZ5wVwplKkBDryIN5kA1LWgtUpYvt5rXpBwKcDY8L/
 6qQO0TjZcXtrHmmg4U1cLbF5ONgdzmJSCfn+i6u1lzyWWaYS2DnxoS5MODp9cAuXOAFC
 PUxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2jD6n3VI4U3d7CzDLMYOr4tAgBELkqFchc0PWmapwU8=;
 b=r7l/cUroWjbxORWSNi+iSD8rLuFzdWfd3ppZl4jgJRcDnlTgKgmqxgNmZPolW/T+cv
 oZPQ9YDWLDUJawjapxNF23ZfI9PuYil8tRcLrGGXZGtYbJdkw10FEY8AG8t2WTcu1mRc
 hR4+nXyxosR8jkD8tD8w9qvMVAJl8CiZa+Gf8IvZu4/ldZYghvnQKCJijrjdyYBpoXnn
 2bWXciJXX73GCbqqCJn8dvuKWxYzx3CuNSxN/yaJBeoM8Fp9960TiN+ppPpNqySuozkj
 9wO8vpt7N/YoCbI7ZHm0ztBWJpFOXiwPAUqLb81TECLavb2YU9DQLu8Ufb17jiYd1Lg9
 xckQ==
X-Gm-Message-State: AFqh2koJ4jI1FztTJT61nyQrKnIDepiyXzClPWDYQzMeU8qBPbr/rllz
 nDngBfQ6yi4ODsPfnHyJU4ioLw==
X-Google-Smtp-Source: AMrXdXtydbHGlVS8vt7G1ajfd6J2r0uGDhywhmHhWEcVTDCakT7GghbtMJ0/ytEappMkCSN9KHVobg==
X-Received: by 2002:a05:651c:1a2c:b0:27f:cccc:1df3 with SMTP id
 by44-20020a05651c1a2c00b0027fcccc1df3mr2208846ljb.41.1672302361996; 
 Thu, 29 Dec 2022 00:26:01 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a2eb105000000b0027f77c96339sm2257519ljl.0.2022.12.29.00.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 00:26:01 -0800 (PST)
Message-ID: <06a46227-1a0c-aa5b-0b06-f202a5eff05b@linaro.org>
Date: Thu, 29 Dec 2022 09:26:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/1] dt-bindings: msm: dsi-phy-28nm: Add missing
 qcom,dsi-phy-regulator-ldo-mode
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@gmail.com, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20221228131110.213116-1-bryan.odonoghue@linaro.org>
 <20221228131110.213116-2-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221228131110.213116-2-bryan.odonoghue@linaro.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, quic_mkrishn@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/12/2022 14:11, Bryan O'Donoghue wrote:
> Add in missing qcom,dsi-phy-regulator-ldo-mode to the 28nm DSI PHY.
> When converting from .txt to .yaml we missed this one.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-28nm.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> index 3d8540a06fe22..95076c90ea171 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-28nm.yaml
> @@ -25,6 +25,10 @@ properties:
>        - description: dsi phy register set
>        - description: dsi phy regulator register set
>  
> +  qcom,dsi-phy-regulator-ldo-mode:
> +    type: boolean
> +    description: Indicates if the LDO mode PHY regulator is wanted.
> +
Do not add it between reg/reg-names (or any other grouped properties).
Should go after reg-names.

Krzysztof

