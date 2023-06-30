Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E082F74316E
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 02:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC74910E3FD;
	Fri, 30 Jun 2023 00:08:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 774B210E3FD
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 00:08:31 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fafe87c6fbso2047002e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 17:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688083707; x=1690675707;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=s5oOzBe/nVGDwAK0iyaGfslfTLtCU4K5wViAKaVmJeU=;
 b=oyETgP+v3WNIOjsW6+oA/qr5AlcQ0zlZOSoxS4AAtjXC5oa2BIzGM/fPSONKXVzsvQ
 jkgJ+FUBAtwmUvl3hFu089oD4M1qh1cRihGWzZ9onlxKcr4s8Wwo6KicaDUc4Q0m0MiW
 58+s8DnUm7M2CTz9Qy2d8GLnsnR+hxlsAxJRU03zt23uZfei38eh3u1fQT75cfWeNIZ+
 D/0k4hbCRPCZmuCVnVdFUnBYZt/OaZcR2m8XoX6z6l86FO61iJ3YqPu7BdVjpTS0NwSJ
 d/4gpu2C/N77QrVZzIRfjVGh2qeeLKl4RykKrftfItqGuGdbYSOEgmMFk7cgGKhfpJMJ
 jFMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688083707; x=1690675707;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s5oOzBe/nVGDwAK0iyaGfslfTLtCU4K5wViAKaVmJeU=;
 b=jBeTx5chOAMt2PAQ00klI34z0ofVe17yj1XUra3FHent8NdjABL66XKUAm9L+wZIDJ
 ceiPzNTyDblE5J28V1yI4z0z5MUF49AScZiBvGVXe6+2JHBkrv93t9tqOKARxVsB+I/E
 r4nS2zjw8J9nQ2gARbA6Eu0qS5p7SFYk+DdL7oxgvvl5Z3RvtTwp2LfmvlV2qVs9z3RO
 ODQg2SF4ALiG/xLmt12e2bu/fksALAyXght2l/frwwnIdZXoFMhs6rLumzygXhI8dZBk
 QJfcNt4LKLMN+gt14ljbDGQA/K2oOp5KeYAON3TazYUL9Zz3sUXojTRGd5fz80BkEgwI
 ugTQ==
X-Gm-Message-State: ABy/qLa0VqPvgx2f1wEi8wjQEaTCBT85D8OyDvbPKIMgIKv3gerwdvRC
 e2nWCYHAJ6iEl9e06KNt+i0gtg==
X-Google-Smtp-Source: APBJJlGBXjweEA4tlpdONZP1vsekWb7PFCUO0i+g7o6nRpI0L6M/oTskjDp5d9z42SX7zPFlolFnUg==
X-Received: by 2002:a19:ca0a:0:b0:4fb:9341:9921 with SMTP id
 a10-20020a19ca0a000000b004fb93419921mr832160lfg.52.1688083707184; 
 Thu, 29 Jun 2023 17:08:27 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 n25-20020a195519000000b004fb6c61e79bsm2063499lfe.117.2023.06.29.17.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 17:08:26 -0700 (PDT)
Message-ID: <9118315e-7280-a8b9-d65f-c1c3026909bd@linaro.org>
Date: Fri, 30 Jun 2023 03:08:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 13/15] arm64: dts: qcom: sm6125: Add dispcc node
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-13-03e430a2078c@somainline.org>
 <4a267feb-5855-1427-c378-b2615eae4f84@linaro.org>
 <kisifidg4bdb4v6fb6nvgt5omsprssd4bxrn6wqehjo66l2y4a@7nfaydtafzpn>
 <CAA8EJpr+PyjehSd4SEUVfh13+i=+-7v1esQasc+7gNaL2iqWJA@mail.gmail.com>
 <13f29231-692e-b624-bdbd-fa1b2b3e793b@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <13f29231-692e-b624-bdbd-fa1b2b3e793b@linaro.org>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, Lux Aliaga <they@mint.lgbt>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Jami Kettunen <jami.kettunen@somainline.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/06/2023 22:53, Konrad Dybcio wrote:
> On 29.06.2023 14:24, Dmitry Baryshkov wrote:
>> On Thu, 29 Jun 2023 at 15:14, Marijn Suijten
>> <marijn.suijten@somainline.org> wrote:
>>>
>>> On 2023-06-29 13:56:25, Dmitry Baryshkov wrote:
>>>> On 27/06/2023 23:14, Marijn Suijten wrote:
>>>>> Enable and configure the dispcc node on SM6125 for consumption by MDSS
>>>>> later on.
>>>>>
>>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/sm6125.dtsi | 25 +++++++++++++++++++++++++
>>>>>    1 file changed, 25 insertions(+)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
>>>>> index edb03508dba3..a5cc0d43d2d9 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
>>>>> @@ -3,6 +3,7 @@
>>>>>     * Copyright (c) 2021, Martin Botka <martin.botka@somainline.org>
>>>>>     */
>>>>>
>>>>> +#include <dt-bindings/clock/qcom,dispcc-sm6125.h>
>>>>>    #include <dt-bindings/clock/qcom,gcc-sm6125.h>
>>>>>    #include <dt-bindings/clock/qcom,rpmcc.h>
>>>>>    #include <dt-bindings/dma/qcom-gpi.h>
>>>>> @@ -1203,6 +1204,30 @@ sram@4690000 {
>>>>>                      reg = <0x04690000 0x10000>;
>>>>>              };
>>>>>
>>>>> +           dispcc: clock-controller@5f00000 {
>>>>> +                   compatible = "qcom,sm6125-dispcc";
>>>>> +                   reg = <0x05f00000 0x20000>;
>>>>> +                   clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>>>>> +                            <0>,
>>>>> +                            <0>,
>>>>> +                            <0>,
>>>>> +                            <0>,
>>>>> +                            <0>,
>>>>> +                            <&gcc GCC_DISP_AHB_CLK>,
>>>>> +                            <&gcc GCC_DISP_GPLL0_DIV_CLK_SRC>;
>>>>> +                   clock-names = "bi_tcxo",
>>>>> +                                 "dsi0_phy_pll_out_byteclk",
>>>>> +                                 "dsi0_phy_pll_out_dsiclk",
>>>>> +                                 "dsi1_phy_pll_out_dsiclk",
>>>>> +                                 "dp_phy_pll_link_clk",
>>>>> +                                 "dp_phy_pll_vco_div_clk",
>>>>> +                                 "cfg_ahb_clk",
>>>>> +                                 "gcc_disp_gpll0_div_clk_src";
>>>>> +                   power-domains = <&rpmpd SM6125_VDDCX>;
>>>>
>>>> Would it be logical to specify the required-opps too?
>>>
>>> Perhaps, but barely any other SoC aside from sm8x50 sets it on dispcc.
>>> What should it be, rpmhpd_opp_low_svs?  IIRC we used "svs" for the DSI
>>> PHY despite not having a reference value downstream (it sets a range of
>>> NOM-TURBO_NO_CPR, and RETENTION when it's off).
>>
>> Then for DSI PHY the required-opps should be rpmpd_opp_nom.
> Yes
> 
>>
>> For the dispcc I think the rpmpd_opp_ret, the lowest possible vote,
>> should be enough.
> I'm not 100% sure but not specifying an opp and turning on the domain
> *******probably******* just sticks with the lowest vote

I think so too. But I think it might be better to be explicit rather 
than being implicit here. Both of us are describing Linux behaviour 
(=set lowest possible value), while DT should describe the hardware.

> 
> Konrad
>>
>>>
>>> - Marijn
>>>
>>>>
>>>>> +                   #clock-cells = <1>;
>>>>> +                   #power-domain-cells = <1>;
>>>>> +           };
>>>>> +
>>>>>              apps_smmu: iommu@c600000 {
>>>>>                      compatible = "qcom,sm6125-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>>>>>                      reg = <0x0c600000 0x80000>;
>>>>>
>>>>
>>>> --
>>>> With best wishes
>>>> Dmitry
>>>>
>>
>>
>>

-- 
With best wishes
Dmitry

