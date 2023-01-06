Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DE7660396
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 16:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94D2C10E879;
	Fri,  6 Jan 2023 15:42:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B13C010E875
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 15:42:03 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id bk16so1592309wrb.11
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 07:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Mua+I7i7capVR8PnOjxe25hKYpxTPGJab57EbFL/wtk=;
 b=nuU1GJg5j8lcEuJkVBVka/IRJWkF24X6QfVZW1pgliLAMTwX1bT0UJz26KULCmVVAQ
 YpDPc+90JKHY0E1X5KzKPSgk7YpwMLS0nyIN9VtbzeaJLLHhDIHRNf58jBrqDcWFge4A
 EENDykKYAyt22wzTATSu5lA5SNQr7KdUmfvLPgF4XJtqu3lllhCQDV0fn83bjoi8+fBX
 Xd5dZUxuUzP0HiCNOm1/k/spLWO09mT5MPFMD/kseybmqKaxOHf0SCpKMK8mXi3IJUYB
 6gN9rfbMVLUt20E2MFYsgAwQBk+vQx3QKZ1sQ4J0gBVZnPG/jx9h1wH2NbBK8pl8+8jM
 gfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mua+I7i7capVR8PnOjxe25hKYpxTPGJab57EbFL/wtk=;
 b=GGuLYh9XxfT9euvI0cB1oTg1L8ru6h4efAQJBShBmoWWzzCaMk4zOjAFlH6nUM9icW
 NuIRuZunfb3OvsyM/kOmTY56/QGSuKvMi04GVEXtOq3iXzAWvrtAAuzQ62J8IaqY3z/D
 pDfJM2pTXzda8vvjVjPrDtrrnFVeZ+0fghCLWC3oDM5Q04g2A3OJ/BCk+WrAjREswSus
 sYM7Kx/jUhcjGnl00IvfzgKWkQAC+lI0h0+U2qxmDZg/Mhu/1FN1621IpIHFV+c+9nZu
 /0SfHnhXgBGztYj9UxWZX0EwNc31fOFbGz6Y+HBgIefqBXBQay/q3MMn4QYeZ+BTPy+7
 rb2w==
X-Gm-Message-State: AFqh2kp5e5r+FCx6mrJtaFXZWbhgYVN4G7FqvWZv1U+lvdtSbfTI4PaM
 pFM/WXoEGYJC4ClPLuY4gko2HnbFN+fgkS9Z
X-Google-Smtp-Source: AMrXdXthHSBcdfCq/c1/NtHLooTO6GDoaKX0aolAquOz2BrXGfeRChcgS3iWnJZZScDBw4WDusRAzA==
X-Received: by 2002:adf:fa0f:0:b0:28f:b480:f4 with SMTP id
 m15-20020adffa0f000000b0028fb48000f4mr18079341wrr.12.1673019722207; 
 Fri, 06 Jan 2023 07:42:02 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 z9-20020a5d44c9000000b0023c8026841csm1449300wrr.23.2023.01.06.07.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Jan 2023 07:42:01 -0800 (PST)
Message-ID: <f8c8076e-2ac3-f67b-7641-d0c324784cb5@linaro.org>
Date: Fri, 6 Jan 2023 16:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/6] dt-bindings: display/msm: document the SM8550 DSI PHY
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v1-1-9ccd7e652fcd@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v1-1-9ccd7e652fcd@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/01/2023 10:08, Neil Armstrong wrote:
> Document the SM8550 DSI PHY which is very close from the 7nm
> and 5nm DSI PHYs found in earlier platforms.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> index bffd161fedfd..f72727f81076 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
> @@ -15,6 +15,7 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - qcom,dsi-phy-4nm-8550
>        - qcom,dsi-phy-5nm-8350
>        - qcom,dsi-phy-5nm-8450

Poor patterns once allowed like to keep growing... I commented here:
https://lore.kernel.org/all/ccbb47e4-d780-0b1d-814e-27e86b6c369c@linaro.org/

so let's wait for response about other compatibles.

>        - qcom,dsi-phy-7nm
> 

Best regards,
Krzysztof

