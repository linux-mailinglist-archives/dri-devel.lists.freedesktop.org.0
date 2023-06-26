Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C4B73E44B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 18:10:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEFD10E011;
	Mon, 26 Jun 2023 16:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE4710E02B
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 16:10:49 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3113da5260dso3000082f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 09:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687795848; x=1690387848;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zqAmLl/C5FNJIhv2Xt1PuXVNbepqgpYqVZ+raKQfDgo=;
 b=Dk9D/qPMCY74SEye/8fNMTPEpEockgkVtKFNB5FpvJP6Z2NVSo47uRsb0CubNQMYKd
 WtkUlVzRm0OstEhMn04c8lGSdVBSwfWues+6SYb8jxXGnITJ/3Kys7xO1aGHt0pWGOvM
 aA8yIEBHWbJFPmP0UWx3SloZvu0U2PR48aUI4URctIkhwDtRpYz7uXYWH7BXxA+BUtGd
 daPgIncZc5uHyrG7QxHLGDzN0ePEASN4hMWadW2r8fn/QIRPCMMWwCa5uoMgc6pxaZPl
 +Eaa8YzSoZgMSGjoplFEYNvjPCOATV5BP/Pbk7lZXMiSx1VYsVB+XwniRCN8wfPc5YmI
 LzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687795848; x=1690387848;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zqAmLl/C5FNJIhv2Xt1PuXVNbepqgpYqVZ+raKQfDgo=;
 b=NcGr5F3Rtei2H7UBexxK5z/5KTzY15XiSjnSXaXECSXdAAf+Bkf1gQdTAdPsY6hrNT
 ZfWZIEzV2TkiPLTiT4PmWiCla+EHNHpH8U3DaBIyG9x+W/UG2Rrh3osbfuDiFZkWsHo1
 yFokdgALBvwKo6bMA8Q91mF+GbpaGcFlVTWFf45Rt+GjUl9iVi7YRNYvGfIBTP82dGzL
 PqAjSkGhfiAJaFrUiCJEZWWDskJyunnbdfF3UfKAjWvGOdILiB+0vW69z2TBt4X2AW7O
 jvNdyCzZ7LjVHPyP/o6qdYrRFgPCNwcgXb24XnMCyKNRB2uQcK/1SDqGU2WUaWbgF/z5
 AXJQ==
X-Gm-Message-State: AC+VfDwiK626HDmDUq/O9eqRfkTHMsg2qfuwq/7KW3nDM0XRGSE7rKnO
 d3P/PJ6dPx2QN+bawr2iCfwKGA==
X-Google-Smtp-Source: ACHHUZ7NhS/vlSmtNSKWHpB3xX654GhMOQ5yRJfZky0DhRpX0T7S8MJstbg9Aob3s7/xTaRbLNztbg==
X-Received: by 2002:a05:6000:118f:b0:309:4620:e155 with SMTP id
 g15-20020a056000118f00b003094620e155mr8838545wrx.49.1687795847749; 
 Mon, 26 Jun 2023 09:10:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 r16-20020adfce90000000b00313f1f543b8sm3000758wrn.108.2023.06.26.09.10.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 09:10:47 -0700 (PDT)
Message-ID: <52c57cab-10cf-2e7e-2c1d-fa6506786d45@linaro.org>
Date: Mon, 26 Jun 2023 18:10:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/15] dt-bindings: clock: qcom, dispcc-sm6125: Require GCC
 PLL0 DIV clock
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-3-1d5a638cebf2@somainline.org>
 <c9681bce-efa8-9b79-4bf6-837dd6a2dc12@linaro.org>
 <55b0ca89-8f2e-5383-59d4-6809e813abf8@linaro.org>
 <vnp263d43flny2ibt3n7fbloyi26enqrejnobogplfu5fcj6l3@s7zkxrsi2rde>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <vnp263d43flny2ibt3n7fbloyi26enqrejnobogplfu5fcj6l3@s7zkxrsi2rde>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/06/2023 21:48, Marijn Suijten wrote:
> On 2023-06-24 11:08:54, Krzysztof Kozlowski wrote:
>> On 24/06/2023 03:45, Konrad Dybcio wrote:
>>> On 24.06.2023 02:41, Marijn Suijten wrote:
>>>> The "gcc_disp_gpll0_div_clk_src" clock is consumed by the driver, will
>>>> be passed from DT, and should be required by the bindings.
>>>>
>>>> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>> ---
>>> Ideally, you'd stick it at the bottom of the list, as the items: order
>>> is part of the ABI
>>
>> Yes, please add them to the end. Order is fixed.
> 
> Disagreed for bindings that declare clock-names and when the driver
> adheres to it, see my reply to Konrad's message.

That's the generic rule, with some exceptions of course. Whether one
chosen driver (chosen system and chosen version of that system) adheres
or not, does not change it. Other driver behaves differently and ABI is
for everyone, not only for your specific version of Linux driver.

Follow the rule.

Best regards,
Krzysztof

