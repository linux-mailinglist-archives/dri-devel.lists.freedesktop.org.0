Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EFD63968D
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 15:39:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E5110E14A;
	Sat, 26 Nov 2022 14:39:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F61310E146
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 14:39:14 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id be13so10921572lfb.4
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 06:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z2npeoW1fUYvgot8LGOdczcXpNyjWUXUEKt73WEmiAM=;
 b=y9PdNFgEdpOcvo1nWI9PTjNGq/DgMEyJBwKggVmJQMslyUvgKfY8DQt+eDaaD5NLxc
 pidH3J66+48Y7Ft0/cGJ02GDdOeC9hQLjmmxlUaE7LI6ZUJg9VzKYgSOmH3MLDc5EzeH
 FsbXECnOFOfxImvJW5q6jXS54VX0C3Uxak3HvGzeWx2tJ+vT/8SeQLVmZKc9Apnkm0r/
 eq+EgouUmvYTCRqut/TvGxJOjdLbRBY9CpjBDiOGfFB56AtkiNfa1VGvgybhEFi7U/6t
 qJrfbqU791YEtkaYp9nACehigIFzxEg/fPLQsm9+Xsn0QKtsGzQ0jMU1Uedv8KyVxsim
 vIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z2npeoW1fUYvgot8LGOdczcXpNyjWUXUEKt73WEmiAM=;
 b=dzLCrCxqxEOf9hpuyZga1wxGQZAyT3zO5StZNlMBq7EN6/XQ0uskYALcruf7JOKfIt
 0ivZbamC2iHDYRuuJe9FlBMwbXn4T/P47Oqwp59OhQgFw8i2xA6zgu6T/L7024fLgf3/
 nIrnSH+8EDrHwTSShRnL4Qd28RwscWMNzOZBcf8iMG8mJwtqi9jOXXsISp58g4z2qn7K
 ddqEAHcfb5d0Ms52cSYdJB/xbwd5PeBF1jSdn/11M/TvNL1O5LzWwS2sS3Vx3Xn2t5Ce
 vNLnPdpComdZTvWWNaYPjeArH7LLlviF17DW8rtaCqh3KMITRnHqjKPPCMB8tQRGDnDX
 QcrA==
X-Gm-Message-State: ANoB5pmnBngT92/qnC7uNlNF+wnHUaCzDq5HBX7ZPt+nZhfS0wtfYAkS
 zBCLkag5oJFihSkRIKh9JOb2MQ==
X-Google-Smtp-Source: AA0mqf6pIhEjjCxmaDZ1mnUD6cLA91tLZOX0a2JYnwJ60QhlMlhj5MG22U1/Fp5c+BCi+krhFIN10Q==
X-Received: by 2002:a05:6512:a88:b0:4a0:2b7b:3f27 with SMTP id
 m8-20020a0565120a8800b004a02b7b3f27mr14167476lfu.443.1669473552868; 
 Sat, 26 Nov 2022 06:39:12 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 u4-20020ac248a4000000b0049944ab6895sm934026lfg.260.2022.11.26.06.39.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 06:39:12 -0800 (PST)
Message-ID: <130b23da-1cf5-126d-11b4-bffb766bd2eb@linaro.org>
Date: Sat, 26 Nov 2022 15:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 04/18] dt-bindings: msm: dsi-controller-main: Add
 compatible strings for every current SoC
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221124004801.361232-1-bryan.odonoghue@linaro.org>
 <20221124004801.361232-5-bryan.odonoghue@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221124004801.361232-5-bryan.odonoghue@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, krzysztof.kozlowski+dt@linaro.org,
 sean@poorly.run, andersson@kernel.org, konrad.dybcio@somainline.org,
 quic_abhinavk@quicinc.com, david@ixit.cz, dianders@chromium.org,
 robh+dt@kernel.org, agross@kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 24/11/2022 01:47, Bryan O'Donoghue wrote:
> Currently we do not differentiate between the various users of the
> qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
> compatible string but, the hardware does have some significant differences
> in the number of clocks.
> 
> To facilitate documenting the clocks add the following compatible strings
> 
> - qcom,apq8064-dsi-ctrl
> - qcom,msm8916-dsi-ctrl
> - qcom,msm8974-dsi-ctrl
> - qcom,msm8996-dsi-ctrl
> - qcom,sc7180-dsi-ctrl
> - qcom,sc7280-dsi-ctrl
> - qcom,sdm630-dsi-ctrl
> - qcom,sdm660-dsi-ctrl
> - qcom,sdm845-dsi-ctrl
> - qcom,sm8250-dsi-ctrl
> 
> Each SoC dtsi should declare "qcom,socname-dsi-ctrl", "qcom,mdss-dsi-ctrl";

You need to test the bindings before sending them. Such change needs
updates in examples.

> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../display/msm/dsi-controller-main.yaml        | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 67d08dc338925..c4da7179999d2 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -14,9 +14,20 @@ allOf:
>  
>  properties:
>    compatible:
> -    enum:
> -      - qcom,mdss-dsi-ctrl
> -      - qcom,qcm2290-dsi-ctrl

You need to mention changes to existing compatibles in the commit msg.

> +    items:
> +      - enum:
> +          - qcom,apq8064-dsi-ctrl
> +          - qcom,msm8916-dsi-ctrl
> +          - qcom,msm8974-dsi-ctrl
> +          - qcom,msm8996-dsi-ctrl
> +          - qcom,qcm2290-dsi-ctrl


Best regards,
Krzysztof

