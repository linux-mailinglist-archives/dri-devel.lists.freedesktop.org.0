Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D226621FB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 10:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4C210E3A1;
	Mon,  9 Jan 2023 09:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC0B10E39F
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 09:47:09 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso8535910wms.5
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Jan 2023 01:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FKZOdRVhSJo3yaxrUarQJx4FQlBCZQiZZVkJFevOxtM=;
 b=ey8mA2Qpdik4m8Fl6j+lkcKYW2b48xTqXYdkAwGAM559ANUSIAbk+CVADLNpZIutzj
 fRPdSiW0RKPwMnzzxPZxhPZwyfL+9FMEMqlzlJePYi40/HtT4ovai/k6zWPZ7AwQuo3u
 zZrkhB1o5mJy/IpuRHWNlJ59pLvExgxPMy9bmqAPQC8bv3vqjd/y0f2UiZs1w7idKbHk
 V2pRmgwv7FzK2Ep0dfdvi7s/If0kI4L8/+WouRcLZO1Nfk4On4fhycVqnpEkbVbL4qWX
 V40rSXpgfkKGIqccZwqzs5iK03pz1ROfihyrqE4rSWX1f6eTHRvlK+zV9ORg+mnixl2t
 UTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FKZOdRVhSJo3yaxrUarQJx4FQlBCZQiZZVkJFevOxtM=;
 b=mA6W0+vz+kiw4V56e2sn6hffz8SHn19QTuoe0OkuaGftYjkUDQ9JA9+HSB/xTObqTi
 CjAQaPeFo+wxhnJVMUxIg+8BTSv8uGX3SXXsIeEHvWGTZcb2FK1iJ57cQDrMq0Cs7qSB
 IbuoRLGIrA93H9JaFxrVtxI/yuv46VHzzU0qjyBUPoFQwultuFxVAp63jxg1n7P3kK2U
 ozfAbYaKu6RhKw4kYyXC2uexiwyKKUvq+vHpViY+0uBwiqrJ4PWqIJMLkj2CeUgR1iah
 6msV0YUmcZfgDeFH9OebTQhhK2hZm11YNf1cy+IDfYFAyqd2i88C2Q9tVB2VxLNKCzGb
 XGdw==
X-Gm-Message-State: AFqh2kr5dsAmGG5Hvvh90hZ+sK+6KOVExxgWpKm08W3fTIxNukit7rNp
 83RZXhCzcy1I/RJ2Fipb5QytZw==
X-Google-Smtp-Source: AMrXdXuW5epZtV+HpY5xI25+04xlHHlJnY6+V4z4ksJEU4Swz5Wc6Gy1UxaqAFE3mLDJ3ppkOtIoOg==
X-Received: by 2002:a7b:c39a:0:b0:3d2:640:c4e5 with SMTP id
 s26-20020a7bc39a000000b003d20640c4e5mr44159365wmj.8.1673257628549; 
 Mon, 09 Jan 2023 01:47:08 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c350800b003d990372dd5sm16749798wmq.20.2023.01.09.01.47.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Jan 2023 01:47:08 -0800 (PST)
Message-ID: <c2363f3a-1eb1-5e12-1616-b201dc05bdf3@linaro.org>
Date: Mon, 9 Jan 2023 10:47:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 3/7] dt-bindings: display/msm: document MDSS on SM8550
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v2-0-87f1c16d7635@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v2-3-87f1c16d7635@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v2-3-87f1c16d7635@linaro.org>
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

On 09/01/2023 10:26, Neil Armstrong wrote:
> Document the MDSS hardware found on the Qualcomm SM8550 platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8550-mdss.yaml     | 331 +++++++++++++++++++++
>  1 file changed, 331 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

