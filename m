Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 497766397BC
	for <lists+dri-devel@lfdr.de>; Sat, 26 Nov 2022 19:56:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C0E10E153;
	Sat, 26 Nov 2022 18:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54A110E153
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 18:56:24 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id bp15so11460895lfb.13
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Nov 2022 10:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=a8lPpKXS45ixTQsb1W3lrQ0O/1/giDkdpwlXIi9rIK0=;
 b=bH47IJUNvzxukvPxBHPanC96mCq54aXbxHPC3WXzz2xx6YfFDE8vnm3F2CpIsyUIoD
 ZXjlbpnGcnomDDX7yaV5urLnsLbLGyaX9cYcFN6G5nZPzUS2OluIG3dXeHo5Ee3eidxb
 cZndh72MmSag9HITY03GAj81Lp7IMZ47U7lSNnTwgWseFkZIRVqtEptSJd/gKIjM+45B
 6bHhouKqoHOpraY0kanDE0iTLwvWrGIrLcOrxLnRbQWXgk+LJvvpt44vch3qTJ4vOxqB
 1Wd7KEoYpAbpMY5/PU4JjKJ1Etx5145Vx96mHabFpVF6oactXZxHef7oaWhOaylTuLTr
 PpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a8lPpKXS45ixTQsb1W3lrQ0O/1/giDkdpwlXIi9rIK0=;
 b=KPPLph6AKyxw9AK3s8GTHSkMLjlzKuLeJaKOqQmDbEMLfOsCeveEYJUw74Pq5aaMp+
 8VfDa1aURQ5+H6+B0x+uqt8qPp9QK4XgT2hridLBnVNMbnUKe72Su0xSW65T5zHH3c/c
 WIe+LDy/2DvFjDSG4gDfRA0SRo1/GkIinzvxMbjHJX9pq/RNDubSKqJLditWhi+BIodx
 nKzeYJUILS3ccpR8+WANIhpqbNb5hudpMlW3V6FytBHT2vWRHQ3bxTTea/diOjx5kA22
 ezvITo1wa+uz7CZ5MUHKF3JoAzae5eqPv+py2o8AXyiGFKgnknep//DOybx0Z7Do08aX
 cJgw==
X-Gm-Message-State: ANoB5pkkc+B13asmn71ssmL2bEOsuwfLHZ5ULHtYVTVUXdSyLv7YRzZe
 TS/qm9KE9U7+qOhRhrMweaaK/w==
X-Google-Smtp-Source: AA0mqf5UaVByEJ58l+9W3QDXOvvcwIxl3uE85p9GSOmKC7q7+z1qkKoZEKHWyE8wUHd1gw9obGxaQg==
X-Received: by 2002:ac2:4f0a:0:b0:4b4:12dd:3f4 with SMTP id
 k10-20020ac24f0a000000b004b412dd03f4mr16881562lfr.610.1669488983111; 
 Sat, 26 Nov 2022 10:56:23 -0800 (PST)
Received: from [192.168.1.8] ([185.24.52.156])
 by smtp.gmail.com with ESMTPSA id
 q10-20020ac2528a000000b0048b003c4bf7sm1003972lfm.169.2022.11.26.10.56.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Nov 2022 10:56:22 -0800 (PST)
Message-ID: <a1d3dbd2-c13f-88cd-969e-ca6bafaa1943@linaro.org>
Date: Sat, 26 Nov 2022 20:56:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v4 06/18] dt-bindings: msm: dsi-controller-main: Fix
 description of core clock
Content-Language: en-GB
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20221125123638.823261-1-bryan.odonoghue@linaro.org>
 <20221125123638.823261-7-bryan.odonoghue@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221125123638.823261-7-bryan.odonoghue@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, robh+dt@kernel.org,
 agross@kernel.org, swboyd@chromium.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/11/2022 14:36, Bryan O'Donoghue wrote:
> There's a typo in describing the core clock as an 'escape' clock. The
> accurate description is 'core'.
> 
> Fixes: 4dbe55c97741 ("dt-bindings: msm: dsi: add yaml schemas for DSI bindings")
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

In the next spin please move this patch after first two fixes, so all 
three of them can be picked into -fixes.

> ---
>   .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> index 88aac7d33555c..0c09b9230b7f5 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
> @@ -40,7 +40,7 @@ properties:
>         - description: Display byte clock
>         - description: Display byte interface clock
>         - description: Display pixel clock
> -      - description: Display escape clock
> +      - description: Display core clock
>         - description: Display AHB clock
>         - description: Display AXI clock
>   

-- 
With best wishes
Dmitry

