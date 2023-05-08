Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1766FA739
	for <lists+dri-devel@lfdr.de>; Mon,  8 May 2023 12:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C9710E1FA;
	Mon,  8 May 2023 10:28:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D983210E1F8
 for <dri-devel@lists.freedesktop.org>; Mon,  8 May 2023 10:28:34 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2ac806f4fccso49066141fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 May 2023 03:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683541712; x=1686133712;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I2Jb+xA8QGd1sVsf3f5607mlfCv/gv10lcVV2z3QNTI=;
 b=f3mTLwEfdvUiXjDcEzJ3Z+m0bt6D1IXVPzbEtXDvgGVP8nekC+GD6PIenAt/TlLgce
 7u+B2bdtASR6O3VIlfVzmZdwasDY0VeReTexR9/I99aZMqVmyNiajsrkXUSjmUelJ6YW
 DHOIahsjXRerPO2EI/l48ZlYZAgxIbNsJTLrowmfF2ryvWoO5mMMMCzcj1FHM4UN75G0
 UQM3BHRCT5azEWlgwHGX3AH2P+VSlQbyhLYztdRJPXu5DgA275k+XoFR+fO4ayCbU17I
 oreSPnESoyGzDalguQee8j0QVdjCkufWkMm96h41vZKX7eP5wodoGRadQfoMIU1b/xE+
 H46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683541712; x=1686133712;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I2Jb+xA8QGd1sVsf3f5607mlfCv/gv10lcVV2z3QNTI=;
 b=a/q+aGb0B/etUl28GY50fpG8kQWhXJ2rwL5ubrH84yzo8TWGd/wrQ5JOU/PGFOm1Jv
 rCnH2pu71q3/gYlY2tmgz67PeXei8XH3+E4z5CC8wKfnbTEI9r1yxE5NeBLuMGGS0jfS
 MBS7RsV2eq9wbqA8Pob9Ngra7nrcy7C36gYF/CFdv9yfZHSRS6/9bw9dPN7vKr1GDaak
 Rn6ptnkEFRyFuTVcgnx2202XEvi8w6huCT00rOnNW+W7wJs5U3ggSMs00KVTX+qSY5vT
 2jlC95kk4YsbdVjpxYEF6PbR3F38JyE1kcOsnVWxfstWun6q1A9OxXY0FiqmS6qYxEMi
 NiNQ==
X-Gm-Message-State: AC+VfDz02LwEAFdmMopsiEgHPej+froIR96lI3OGVzI2RrdOduSR3RD7
 oWv4xW6NHTekWXWZe9O2FMdPyw==
X-Google-Smtp-Source: ACHHUZ4h0seTe4/zh3HmwznORxKSXd7UYJS5RgdNNFU0wGGRhLw3cbZnlmYxmIDSQ1Nw4afv8SwzXQ==
X-Received: by 2002:a2e:2419:0:b0:2ad:85dd:f3a8 with SMTP id
 k25-20020a2e2419000000b002ad85ddf3a8mr1287361ljk.30.1683541712491; 
 Mon, 08 May 2023 03:28:32 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a2e9a93000000b002ad94c4351asm241662lji.66.2023.05.08.03.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 May 2023 03:28:32 -0700 (PDT)
Message-ID: <d357a6f9-d66b-0ba1-138c-4b541c3bebfb@linaro.org>
Date: Mon, 8 May 2023 12:28:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974: add ocmem clock to GPU
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230507190735.2333145-1-dmitry.baryshkov@linaro.org>
 <20230507190735.2333145-2-dmitry.baryshkov@linaro.org>
 <8cdecc51-2a42-4b82-9eb3-2ab77860c5d4@linaro.org>
 <c8144b21-d672-318e-2761-5d1daf384c30@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <c8144b21-d672-318e-2761-5d1daf384c30@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8.05.2023 12:24, Dmitry Baryshkov wrote:
> On 08/05/2023 11:30, Konrad Dybcio wrote:
>>
>>
>> On 7.05.2023 21:07, Dmitry Baryshkov wrote:
>>> To get GPU working with the OCMEM, the oxili_ocmemgx_clk clock should be
>>> enabled. Pass it to the GPU to get it to work on apq8074/msm8974 boards.
>>>
>>> Fixes: fe079442db63 ("ARM: dts: qcom: msm8974: add gpu support")
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>> Uhh.. this clock should be managed by RPM with:
>>
>> type = MEM
>> id = 2
>>
>> just like it's defined for 8994 today.
>>
>> Could you try adding it in rpmcc and confirming?
> 
> There is an RPM_SMD_OCMEMGX_CLK clk already, it is a bus clock for the ocmemnoc.
It's wrong.

Konrad
> 
>>
>> Konrad
>>>   arch/arm/boot/dts/qcom-msm8974.dtsi | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
>>> index 834ad95515b1..fb661c1bd3d5 100644
>>> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
>>> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
>>> @@ -2104,8 +2104,9 @@ gpu: adreno@fdb00000 {
>>>                 clocks = <&mmcc OXILI_GFX3D_CLK>,
>>>                    <&mmcc OXILICX_AHB_CLK>,
>>> +                 <&mmcc OXILI_OCMEMGX_CLK>,
>>>                    <&mmcc OXILICX_AXI_CLK>;
>>> -            clock-names = "core", "iface", "mem_iface";
>>> +            clock-names = "core", "iface", "mem", "mem_iface";
>>>                 sram = <&gmu_sram>;
>>>               power-domains = <&mmcc OXILICX_GDSC>;
> 
