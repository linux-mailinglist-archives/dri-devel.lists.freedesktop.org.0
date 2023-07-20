Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FB275A800
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 09:43:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B44F10E575;
	Thu, 20 Jul 2023 07:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A1E10E573;
 Thu, 20 Jul 2023 07:42:55 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 896F6660707E;
 Thu, 20 Jul 2023 08:42:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1689838973;
 bh=qql06jpSc72dkLq4FdZfoamoL5RBmEctV2tIFgfKNAo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a4UkT6nTjXp2W/l2ACa0ChLRSV/AGn3QpUHSpdxfWsu67VsEa+aeF6qEQk2S+8XPo
 DDzYFePfFmO0UXJ0V9CHzb1cX6nsNWSWxxPyNasFdT/ctXHlTsbYYtixl7GH6FK/Wm
 1cBZJL5Aad0XCjNaMpKEMDk0AkfNIMut2g0a2Xce3ucyRsKpV252mhORhSRsLkG/66
 oR54TKmnhhgh4T1cCh8Ww3lu4Zld3Vj5RwBfT69WJz/NYWDe4hdcthnAgW1RVDokgZ
 lQA3VaxGRcwBXbdV1bj7qrrXET1Fv7nxRDRbcoUsvXsKVnpL3jHYWzp/h+gosVtMGT
 EKbOankWmv9bw==
Message-ID: <78efa42b-cf2e-bf3c-a59a-99d61225c629@collabora.com>
Date: Thu, 20 Jul 2023 09:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 02/15] arm64: dts: qcom: sm6125: Sort spmi_bus node
 numerically by reg
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230718-sm6125-dpu-v3-0-6c5a56e99820@somainline.org>
 <20230718-sm6125-dpu-v3-2-6c5a56e99820@somainline.org>
 <149d15e6-4995-8ff6-5191-77783c3dedb8@linaro.org>
 <2zwj7sgsvcl7czobhokop37ycsekiivtuznwegaeybu577skcc@mqdkoolwkail>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <2zwj7sgsvcl7czobhokop37ycsekiivtuznwegaeybu577skcc@mqdkoolwkail>
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
 Loic Poulain <loic.poulain@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 19/07/23 23:54, Marijn Suijten ha scritto:
> On 2023-07-19 01:02:56, Dmitry Baryshkov wrote:
>> On 19/07/2023 00:24, Marijn Suijten wrote:
>>> This node has always resided in the wrong spot, making it somewhat
>>> harder to contribute new node entries while maintaining proper sorting
>>> around it.  Move the node up to sit after hsusb_phy1 where it maintains
>>> proper numerical sorting on the (first of its many) reg address
>>> property.
>>>
>>> Fixes: cff4bbaf2a2d ("arm64: dts: qcom: Add support for SM6125")
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>> ---
>>>    arch/arm64/boot/dts/qcom/sm6125.dtsi | 38 ++++++++++++++++++------------------
>>>    1 file changed, 19 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
>>> index 6937c7ebdb81..cfd0901d4555 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
>>> @@ -684,6 +684,24 @@ hsusb_phy1: phy@1613000 {
>>>    			status = "disabled";
>>>    		};
>>>    
>>> +		spmi_bus: spmi@1c40000 {
>>> +			compatible = "qcom,spmi-pmic-arb";
>>> +			reg = <0x01c40000 0x1100>,
>>> +			      <0x01e00000 0x2000000>,
>>> +			      <0x03e00000 0x100000>,
>>> +			      <0x03f00000 0xa0000>,
>>> +			      <0x01c0a000 0x26000>;
>>> +			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
>>> +			interrupt-names = "periph_irq";
>>> +			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
>>> +			qcom,ee = <0>;
>>> +			qcom,channel = <0>;
>>> +			#address-cells = <2>;
>>> +			#size-cells = <0>;
>>> +			interrupt-controller;
>>> +			#interrupt-cells = <4>;
>>> +		};
>>> +
>>>    		rpm_msg_ram: sram@45f0000 {
>>>    			compatible = "qcom,rpm-msg-ram";
>>>    			reg = <0x045f0000 0x7000>;
>>> @@ -1189,27 +1207,9 @@ sram@4690000 {
>>>    			reg = <0x04690000 0x10000>;
>>>    		};
>>>    
>>> -		spmi_bus: spmi@1c40000 {
>>> -			compatible = "qcom,spmi-pmic-arb";
>>> -			reg = <0x01c40000 0x1100>,
>>> -			      <0x01e00000 0x2000000>,
>>> -			      <0x03e00000 0x100000>,
>>> -			      <0x03f00000 0xa0000>,
>>> -			      <0x01c0a000 0x26000>;
>>> -			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
>>> -			interrupt-names = "periph_irq";
>>> -			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
>>> -			qcom,ee = <0>;
>>> -			qcom,channel = <0>;
>>> -			#address-cells = <2>;
>>> -			#size-cells = <0>;
>>> -			interrupt-controller;
>>> -			#interrupt-cells = <4>;
>>> -		};
>>> -
>>>    		apps_smmu: iommu@c600000 {
>>>    			compatible = "qcom,sm6125-smmu-500", "qcom,smmu-500", "arm,mmu-500";
>>> -			reg = <0xc600000 0x80000>;
>>> +			reg = <0x0c600000 0x80000>;
>>
>> Irrelevant, please split.
> 
> This was already here in v1, and it is what likely contributed to the
> sorting mismatch in the first place.
> 
> But will split it and send a v4 for just this...
> 

I agree in that it is irrelevant, but anyway, for the next time: you should at
least mention "the other change" in your commit message ;-)

Also, remember that this commit has a Fixes tag........ :-)

Cheers,
Angelo



