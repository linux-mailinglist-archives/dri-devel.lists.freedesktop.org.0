Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5E9649C02
	for <lists+dri-devel@lfdr.de>; Mon, 12 Dec 2022 11:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB06A10E199;
	Mon, 12 Dec 2022 10:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B703910E194
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 10:23:54 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bp15so17712170lfb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Dec 2022 02:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tx/K2nxqJN+6DgdgaOfQVHfNHyjVh8x8nxZ18Z0hLvA=;
 b=j/VaNbe81nj9PboTIIxg/xAkHSvwtGjPPLfF0JuzkYq4G9UBT1VfXVrXzOsDc3cMxC
 SPzz+61jYM/QSkKOFwd8hFDX4qFrPy+C5Y16H8ym61Rzh7TE29U//nTy2Hz1uROZf5LN
 dxk+qcEmolKHx7Ydhs+85VUB8kEk2Ox2zJZyVbuO9QkvFcOSdYzjbrXayjfpDgVL0rvI
 ck7FNeCbddMwIQ6HCaJc02FUZ7whGuqabfkbwsd1YbYjho51Gu3d4XqvJBfHIpcCoifC
 7Z6RDjWLsmfpbYZpoDQ5i1rwsBAt9qMLKRB9uinIiJgs7s7sYBY4BKAxUaUAALAoBuJt
 sHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tx/K2nxqJN+6DgdgaOfQVHfNHyjVh8x8nxZ18Z0hLvA=;
 b=I2U/WoGPkUkDLAobSYys9UkU+BSAzAau8hPtrQGv3VHiKkbDNrqAjbWt9pmV+NuL95
 Ddaw9skkrI1hX3FS4jnlLxLeyoVS6DOQZxz/gUQpfGizF1jkVIXy5KOKFFZacXI2KqF2
 LZf2oWo3WqBPFuKwEMgPY4kv3uvSt3p2f8nm72aGiV5xjDtHLBoNzrM9go6elANEkPvH
 A6K0swhiMc64RBpULOuDrgrT2NGtdAVGy+2DOEcDzvQZTATNY3pMISFf/MtpwJn6nid3
 o90tO6yxqrrNo2CFixqXuW28viDdk5K+iYdpzZMWJFnndFTZwv3FLEybJ6GLsgRpY0KU
 BcNg==
X-Gm-Message-State: ANoB5pl0wmN4x2Z69Qc1EfyErdGloY6qiKPeIUyzcpFl8TGu1mG05jan
 5qLjOVuajgrjjtKIoNr9kVH2yw==
X-Google-Smtp-Source: AA0mqf7FmyY0UcIoNK7shKkuiKMn1eGM1xDejUPLY6+8jOyWJ7kPNpOuGtSuCDWzN7yFPHyEOYjNrg==
X-Received: by 2002:a05:6512:e9b:b0:4b6:eaa5:4347 with SMTP id
 bi27-20020a0565120e9b00b004b6eaa54347mr1278992lfb.62.1670840633014; 
 Mon, 12 Dec 2022 02:23:53 -0800 (PST)
Received: from [192.168.1.101] (abxh44.neoplus.adsl.tpnet.pl. [83.9.1.44])
 by smtp.gmail.com with ESMTPSA id
 g6-20020a056512118600b004971a83f839sm1587237lfr.39.2022.12.12.02.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 02:23:52 -0800 (PST)
Message-ID: <80168963-0e17-e8aa-6d99-a1c53f63c934@linaro.org>
Date: Mon, 12 Dec 2022 11:23:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm8150: Add DISPCC node
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
References: <20221212093315.11390-1-konrad.dybcio@linaro.org>
 <20221212093315.11390-2-konrad.dybcio@linaro.org>
 <FF242AC6-01EC-4C8E-BE49-BB54FC9D2FEE@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <FF242AC6-01EC-4C8E-BE49-BB54FC9D2FEE@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.12.2022 11:18, Dmitry Baryshkov wrote:
> 
> 
> On 12 December 2022 12:33:13 GMT+03:00, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>> Years after the SoC support has been added, it's high time for it to
>> get dispcc going. Add the node to ensure that.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>> arch/arm64/boot/dts/qcom/sm8150.dtsi | 26 ++++++++++++++++++++++++++
>> 1 file changed, 26 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8150.dtsi b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> index a0c57fb798d3..ff04397777f4 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8150.dtsi
>> @@ -3579,6 +3579,32 @@ camnoc_virt: interconnect@ac00000 {
>> 			qcom,bcm-voters = <&apps_bcm_voter>;
>> 		};
>>
>> +		dispcc: clock-controller@af00000 {
>> +			compatible = "qcom,sm8150-dispcc";
>> +			reg = <0 0x0af00000 0 0x10000>;
>> +			clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>,
>> +				 <0>;
>> +			clock-names = "bi_tcxo",
>> +				      "dsi0_phy_pll_out_byteclk",
>> +				      "dsi0_phy_pll_out_dsiclk",
>> +				      "dsi1_phy_pll_out_byteclk",
>> +				      "dsi1_phy_pll_out_dsiclk",
>> +				      "dp_phy_pll_link_clk",
>> +				      "dp_phy_pll_vco_div_clk";
>> +			#clock-cells = <1>;
>> +			#reset-cells = <1>;
>> +			#power-domain-cells = <1>;
>> +
>> +			power-domains = <&rpmhpd SM8150_MMCX>;
>> +			/* TODO: Maybe rpmhpd_opp_min_svs could work as well? */
>> +			required-opps = <&rpmhpd_opp_low_svs>;
> 
> Is it required for the dispcc, for the DSI or for the dpu? We have stumbled upon the similar issue when working on the 8350, see the latest Robert's patchset.
While I don't have any hard evidence, it seems like it is required for
any "interesting" multimedia components, AFAIU even including video and
camera clocks..

Seems like it's a deep down dependency for a lot of things on this
particular SoC (and likely also on newer ones, remember the initial
mess with 8250 mmcx?)

Konrad
> 
> 
>> +		};
>> +
>> 		pdc: interrupt-controller@b220000 {
>> 			compatible = "qcom,sm8150-pdc", "qcom,pdc";
>> 			reg = <0 0x0b220000 0 0x400>;
> 
