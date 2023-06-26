Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7192873DBA7
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 11:43:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66E510E1D7;
	Mon, 26 Jun 2023 09:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30A9A10E069
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 09:43:44 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f8775126d3so3832266e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 02:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687772622; x=1690364622;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Wa4sSEA7B28vGW7cZkSmi2ta/a82zz6uw3G1/9bh3+4=;
 b=Glvda0Sq1DktwYHBHGnIKm6y/v1J/ivavoXEZ5Yzh5ppJdiQIjuPTz8MombSSC+pSK
 gXHLhMxdSPFSFl3HBrUNoGr2jrBJaMpPkL8QZU7fuJRnMB51L3AHtgfGQ4oYB6CP6Rli
 +0c4N0JGOIJcKH3olOwzgAunyS7kl5qpKpCJfpC7X1wS0FV0Pe/3lajiLKZIC1Tq4Qfc
 nnrCI2KaXdn51Fqjm0B0OvaZrxy0Oni3g4ofVDtef9ugjleF3FdubBaJQRM/WXX7kz1g
 5Ln/ntZyUChM4LyLMVRCEUXhXpMUlfKZkwPsm6euDjeNHWN6Lrtno7Y5ZGhrvrYGE151
 aZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687772622; x=1690364622;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wa4sSEA7B28vGW7cZkSmi2ta/a82zz6uw3G1/9bh3+4=;
 b=AmaJjrEJAVtjLO0UCaVgQKLGFk7Um0GbPpuSimy+hEbqD5z6FKZhV/UHnscR3WWZ9t
 oCyIueWWyo8iIC6nJKMKQ9XBD5EDH9sS3ZWFEWrHGkMByp9mepbUdUHqJ/dWsvy0hmWH
 DPcdqO+z3RfejS0duARS0uoym+oSZyV6eRAxZgP5tQLJOQJ+sV9mE1DEkqqxyxbk/9Up
 CUjk8YpCMTWy5taIpb47Xpso0rGCtFOPiI0G02tkmY0gA0mJFGLPl0Zyy4TUXkC5fSb2
 Wec32OtiFPMffz8/NkHcPLwuJCR+FvJKAhbzaJvjYhwzcvs8EQaT/o8+elTb6Xc3CayL
 x6mw==
X-Gm-Message-State: AC+VfDzQJ6iqHr4Qd3WE0Z+lqByKE770XlK934L/gHyILXfRh32/WJDz
 DpsOzkWXtYuabt6FRIU6BbQsIQ==
X-Google-Smtp-Source: ACHHUZ6F1v7pFN28t/+mbYAP/qNkuiQynLLEVdAGA02D77327AAmiQMZUi291CRiOVoLaRv03kmHRA==
X-Received: by 2002:a05:6512:3e24:b0:4fa:d147:9df with SMTP id
 i36-20020a0565123e2400b004fad14709dfmr2833708lfv.19.1687772622267; 
 Mon, 26 Jun 2023 02:43:42 -0700 (PDT)
Received: from [192.168.1.101] (abyk179.neoplus.adsl.tpnet.pl. [83.9.30.179])
 by smtp.gmail.com with ESMTPSA id
 d13-20020ac241cd000000b004db1a7e6decsm1026500lfi.205.2023.06.26.02.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jun 2023 02:43:41 -0700 (PDT)
Message-ID: <f62d750e-da73-fece-c3de-0dac1fbb9827@linaro.org>
Date: Mon, 26 Jun 2023 11:43:39 +0200
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
 <edrftxqhywiaxvbonyh25cmubrg77y4dryqoy7id4ndan2lfa7@rhvcoavtg5vl>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <edrftxqhywiaxvbonyh25cmubrg77y4dryqoy7id4ndan2lfa7@rhvcoavtg5vl>
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
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25.06.2023 21:48, Marijn Suijten wrote:
> On 2023-06-24 03:45:02, Konrad Dybcio wrote:
>> On 24.06.2023 02:41, Marijn Suijten wrote:
>>> The "gcc_disp_gpll0_div_clk_src" clock is consumed by the driver, will
>>> be passed from DT, and should be required by the bindings.
>>>
>>> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> ---
>> Ideally, you'd stick it at the bottom of the list, as the items: order
>> is part of the ABI
> 
> This isn't an ABI break, as this driver nor its bindings require/declare
> a fixed order: they declare a relation between clocks and clock-names.
Bindings describe the ABI, drivers implement compliant code flow.

> 
> This orders the GCC clock just like other dispccs.  And the previous
> patch dropped the unused cfg_ahb_clk from the bindings, so all bets are
> off anyway.
Thinking about it again, the binding has not been consumed by any upstream
DT to date, so it should (tm) be fine to let it slide..

Konrad
> 
> - Marijn
> 
>>
>> Konrad
>>>  Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>>> index 2acf487d8a2f..11ec154503a3 100644
>>> --- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml
>>> @@ -23,6 +23,7 @@ properties:
>>>    clocks:
>>>      items:
>>>        - description: Board XO source
>>> +      - description: GPLL0 div source from GCC
>>>        - description: Byte clock from DSI PHY0
>>>        - description: Pixel clock from DSI PHY0
>>>        - description: Pixel clock from DSI PHY1
>>> @@ -32,6 +33,7 @@ properties:
>>>    clock-names:
>>>      items:
>>>        - const: bi_tcxo
>>> +      - const: gcc_disp_gpll0_div_clk_src
>>>        - const: dsi0_phy_pll_out_byteclk
>>>        - const: dsi0_phy_pll_out_dsiclk
>>>        - const: dsi1_phy_pll_out_dsiclk
>>> @@ -65,12 +67,14 @@ examples:
>>>        compatible = "qcom,sm6125-dispcc";
>>>        reg = <0x5f00000 0x20000>;
>>>        clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>>> +               <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>,
>>>                 <&dsi0_phy 0>,
>>>                 <&dsi0_phy 1>,
>>>                 <&dsi1_phy 1>,
>>>                 <&dp_phy 0>,
>>>                 <&dp_phy 1>;
>>>        clock-names = "bi_tcxo",
>>> +                    "gcc_disp_gpll0_div_clk_src",
>>>                      "dsi0_phy_pll_out_byteclk",
>>>                      "dsi0_phy_pll_out_dsiclk",
>>>                      "dsi1_phy_pll_out_dsiclk",
>>>
