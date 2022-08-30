Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 481945A63A4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 14:40:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB9710E0A6;
	Tue, 30 Aug 2022 12:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B312710E0AD
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 12:40:30 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id n17so14057525wrm.4
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Aug 2022 05:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=7z9Pqzt9hk2WN83EB611zYm/PTUAOC0jcQmMgCYGpxg=;
 b=bZUmg+pmdT2tolVXR9Fqgn9LcYt521sI6D19Q0iJ0JmJKpypHGbARM6gqzgJ61VGw/
 5H2ImJrOAMvCqAEfeEJa+rGQLnSjsfuey0s8q1KKlgVJsY99fmskBh36hGxoFAKDJohG
 SyjSk3iGn+jPXgwMFCg/ktLV+HUoHo/CyHNCd/AwAbtpzZMa1+eumfA/FRIasHFnfFWW
 PW98m0aEzOyrwGb+tTT/QfxHTdRQTy8OTplnYJIHFDscogHkRwomH8UAxIYl/qiWtYPn
 3/W3fPlznQMCcwZkLtsQ06mZKhCvzxITJ3upljmWSsdjFecSNpVi7R2TmwoQUlqSFB11
 XrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=7z9Pqzt9hk2WN83EB611zYm/PTUAOC0jcQmMgCYGpxg=;
 b=wapJKQA2SpZKR02kvSxe8Hdn2HCQe7vnDTGx529QKfplGn2RhuHgk4G9LGoaxiyAE2
 5f+2W23TqnEYBTOs0VnqfwH5ugq27JncewF2qMKIqexX8DgQnytdZsNTGSYtmNumdZOq
 SubwulERx1Eswmb0TJ2MAai9m85O4DefErLyQwnzNSwnof+CKuU8DbLgj26eDabp35y0
 Ty+T5u4OdAs1S3hQneFvDvLhA/kFcsmoBNJWXhpfMbunPCWe+v4fjppSbEtAEENbRBRa
 992w98e8tipzhkGHKXH35pxcY/SDq7Bm0+mATb+/Vbze2x0UZYv/N5NZg2qXOF7UZBnT
 c7dw==
X-Gm-Message-State: ACgBeo1Wxejmb/55IU7ap5GxbmFlv8PB7FevB/1hqcY6r6dK68SZ1Svg
 Y/4Cs2LOLmXaDgfxI7lmviEdWg==
X-Google-Smtp-Source: AA6agR6G6biZprUethAunY+sacCBtYPcpWnzVd7O9AZ4u3KtieS3HHgUJbMoHeyDhGYDnzpQ/Fdl7Q==
X-Received: by 2002:a05:6000:904:b0:21a:3dca:4297 with SMTP id
 bz4-20020a056000090400b0021a3dca4297mr8789004wrb.487.1661863229217; 
 Tue, 30 Aug 2022 05:40:29 -0700 (PDT)
Received: from [192.168.86.238]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 x14-20020a5d60ce000000b002252e5a6841sm9671188wrt.57.2022.08.30.05.40.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 05:40:28 -0700 (PDT)
Message-ID: <8b03a71a-6b5d-e84a-4ea1-351b46954f12@linaro.org>
Date: Tue, 30 Aug 2022 13:40:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH RESEND - dt 1/2] dt-bindings: nvmem: qfprom: add IPQ8064
 and SDM630 compatibles
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Lee Jones <lee@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Kiran Gunda <kgunda@codeaurora.org>, dri-devel@lists.freedesktop.org,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20220825125410.232377-1-krzysztof.kozlowski@linaro.org>
 <20220825125410.232377-2-krzysztof.kozlowski@linaro.org>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220825125410.232377-2-krzysztof.kozlowski@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

I seems to have missed this one,


On 25/08/2022 13:54, Krzysztof Kozlowski wrote:
> Document compatibles for QFPROM used on IPQ8064 and SDM630.  They are
> compatible with generic QFPROM fallback.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Applied thanks,
Srini
> ---
>   Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> index dede8892ee01..b4163086a5be 100644
> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
> @@ -18,6 +18,7 @@ properties:
>         - enum:
>             - qcom,apq8064-qfprom
>             - qcom,apq8084-qfprom
> +          - qcom,ipq8064-qfprom
>             - qcom,msm8974-qfprom
>             - qcom,msm8916-qfprom
>             - qcom,msm8996-qfprom
> @@ -25,6 +26,7 @@ properties:
>             - qcom,qcs404-qfprom
>             - qcom,sc7180-qfprom
>             - qcom,sc7280-qfprom
> +          - qcom,sdm630-qfprom
>             - qcom,sdm845-qfprom
>         - const: qcom,qfprom
>   
