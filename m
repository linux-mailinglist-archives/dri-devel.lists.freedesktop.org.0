Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF8E6397B3
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 19:54:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 666AD10E06E;
	Sat, 26 Nov 2022 18:54:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0423F10E153
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 18:54:15 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id s8so11510973lfc.8
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 10:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=17Uu5jB5JSV5jcVLyNQKvZQt0F2pRwxcX8qU0oKH7qw=;
 b=hd/b35FcuDguYSlqryOQKYBHU9QtBMOiMyUdY5h4wx7KHyOf/l9+c/A9bDpNTpzl6i
 CeJtMBtmLLmS02vjN7cGtyelAF1womE/Ri0uolJ23roXhI4yop7dCkv4IaYPR0M2eKRq
 ELj83xM+6tCWZa6tqQHl2HchVMdCETh/zJV+grmE+lP8ZFZNe2xL+Hm+XO1zKflqkx84
 8dObKZontXoNls2yxo6gvW3jtTF0yUp3c85BmDNj/qgQ5Snv/+LNw4p9S3P9Rwump3Fp
 Ud3wbFLqTqj8Q5JpDKylWVU38ycyTvsa1ySRV0PW02NUVDfmXjw7Zbr7OueoALA/cKfA
 9KeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=17Uu5jB5JSV5jcVLyNQKvZQt0F2pRwxcX8qU0oKH7qw=;
 b=lZupdVJeZYaoWsFlR3PjLtbGspXYZjUlX07gq6kvKEw8AKymltednEcnQQHWnBNjC/
 fYvI6GcKqVK8USFzo22GPT46a+lY3g6IpGusmBTPUoZxLwkfy1bRuPn37faznLM+VqZW
 +N5rj9BFhgKY6uodmEDoFA4cUekrKq8cXf1vTMNoyUCjd3EzeAbZS9xUYqMZEANRvBdC
 CODHd0r+8DzmFO6TI2oM/BEKJuflCWRBQeqlKPuQIK3NbG18v8Ztjc2dMbuCGvhEb9J1
 wFORtMa5FaDZ+F1dDZC6G2uokXQGhbGK0fZClmUJkkCt8qRr6xnL2P+B2v+1+T2n6/nz
 kMYw==
X-Gm-Message-State: ANoB5pnjS8LnT2cti0RzyQeyslPu1Q7JgNKr+hyhai0qXSPjjnKKuKOT
 uBvuCo2UTBwWxbIkLkmaK8b0Tg==
X-Google-Smtp-Source: AA0mqf6Y7o7r7uQYiZDsghBFDuKtnMf9/K9SkY9AU9Mbkm5Kf98HI24HvIBkrxEmTFbQEGx9TreZMg==
X-Received: by 2002:a05:6512:63:b0:4b4:f7a2:e4f2 with SMTP id
 i3-20020a056512006300b004b4f7a2e4f2mr5034714lfo.272.1669488853033; 
 Sat, 26 Nov 2022 10:54:13 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a056512314200b004a2c447598fsm993270lfi.159.2022.11.26.10.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 10:54:12 -0800 (PST)
Message-ID: <dc5df66c-2e2b-14f1-ce88-705d831f37d9@linaro.org>
Date: Sat, 26 Nov 2022 20:54:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 03/18] dt-bindings: msm: dsi-controller-main: Rename
 qcom,dsi-ctrl-6g-qcm2290 to qcom,qcm2290-dsi-ctrl
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-4-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-4-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, swboyd@chromium.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2022 14:36, Bryan O'Donoghue wrote:
> We will add in a number of compat strings to dsi-controller-main.yaml in
> the format "qcom,socname-dsi-ctrl" convert the currently unused
> qcom,dsi-ctrl-6g-qcm2290 to qcom,qcm2290-dsi-ctrl.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

I'd say, as you are going to introduce new bindings using two compat 
strings, just leave this binding as is, marking it as deprecated.

> ---
>   .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index cf782c5f5bdb0..67d08dc338925 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -16,7 +16,7 @@ properties:
>     compatible:
>       enum:
>         - qcom,mdss-dsi-ctrl
> -      - qcom,dsi-ctrl-6g-qcm2290
> +      - qcom,qcm2290-dsi-ctrl
>   
>     reg:
>       maxItems: 1

-- 
With best wishes
Dmitry

