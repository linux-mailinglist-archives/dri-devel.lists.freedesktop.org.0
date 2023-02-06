Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BF168BCFE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 13:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807F210E3AB;
	Mon,  6 Feb 2023 12:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6454910E3AB
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Feb 2023 12:36:07 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id o36so8570626wms.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Feb 2023 04:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=0aXfQBABxKfO7JAJ2yxMQbPPYZ/h8BQuEBZK925pzQ4=;
 b=AKO2l+admtw3x9A9sRWozDQ6GJwnwZt5GGBPlBenJFSF1yOV6ld2PsD5B9Lzx+Gb9Z
 yFibYiPRxcqcjFokxvlf/w+UjcrEZsbVnCeuWWT/A38Eo2qSSiHuVAcHxUWiFT0mR4nD
 Z76JFpN2jaCuYnR76L6hdqpoXzKkIy84vVNDFH2YsllNPshbhzJzNUadEAWDh/7ZA68L
 xU/L0rGqj7CG5apa1dZhP1sEIVEzaG6oiHUyfDACmDFJYvKvlTrTVdsaMx7t6o5XYvYO
 axwUQvKz2hSKwOtCDY1Cbo3Mv6X4WTdLjjF7UghkmIEAR7AcUVkt1YdZ0iie4vSHfJ/h
 lhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0aXfQBABxKfO7JAJ2yxMQbPPYZ/h8BQuEBZK925pzQ4=;
 b=U7FS+ZaG6KUV3d7ElKBQ0jDHOw/oKaISl+bbP0S3gqM0FCzdaKthtwb8EkLzTL+fKP
 vhZVs+ff9YH2ivX+V8012DpEC7Hy/+19G1G2MeN00ZEbDi77xVYxSRZT3ctLS8q6p5Fi
 TYVjF41ZIdQ+aeITMlk7+7Ak3H6PcbLQr2kAfq6KJMkCjMBpxLsNrb/KyMmxhsPDpoLL
 hMPJ+akUAcJGCrvGzOVUOX3KywkA1lg9xoETVat+ucLYGNZe3E7norUO+rdskSkpZEuV
 a6/RUQdwKmabLCxRuuqFaBUru1nsOerncugE/zftDLHPBQDgd0RP0o4dEsOx/fh4G0kq
 ELRQ==
X-Gm-Message-State: AO0yUKWn1d8bVQ7awl3vuFFf62WIpjNYH0mFo00eAZlgvHxf0B7jtXRx
 Hmjii46BppJ+4upw9aMV/w1yVA==
X-Google-Smtp-Source: AK7set8ecGPZj8ULN5EH8l/6SoTIPumWIF5hZq0Aqogu2SVs1clrmB1w0pyb57bpvicZdN+fHeCalw==
X-Received: by 2002:a05:600c:1d28:b0:3df:efdc:6505 with SMTP id
 l40-20020a05600c1d2800b003dfefdc6505mr6077699wms.0.1675686965909; 
 Mon, 06 Feb 2023 04:36:05 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:f03f:3ced:a369:d884?
 ([2a01:e0a:982:cbb0:f03f:3ced:a369:d884])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05600c4fce00b003dc1a525f22sm11382129wmq.25.2023.02.06.04.36.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 04:36:05 -0800 (PST)
Message-ID: <9c3c7d3b-68a8-7fec-6641-0dc7f814fc0d@linaro.org>
Date: Mon, 6 Feb 2023 13:36:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 4/5] arm64: dst: qcom: sm8450: switch to usb3/dp combo phy
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v1-0-f1345872ed19@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v1-4-f1345872ed19@linaro.org>
 <9e6be00e-305e-b4d1-049d-5205ac77f576@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <9e6be00e-305e-b4d1-049d-5205ac77f576@linaro.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 06/02/2023 12:03, Konrad Dybcio wrote:
> subject: s/dst/dts here and in 5/5
> 
> On 6.02.2023 11:17, Neil Armstrong wrote:
>> The QMP PHY is a USB3/DP combo phy, switch to the newly
>> documented bindings and register the clocks to the GCC
>> and DISPCC controllers.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 38 +++++++++++++-----------------------
>>   1 file changed, 14 insertions(+), 24 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> index d66dcd8fe61f..757b7c56d5f5 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> @@ -748,7 +748,7 @@ gcc: clock-controller@100000 {
>>   				 <&ufs_mem_phy_lanes 0>,
>>   				 <&ufs_mem_phy_lanes 1>,
>>   				 <&ufs_mem_phy_lanes 2>,
>> -				 <0>;
>> +				 <&usb_1_qmpphy 0>;
>>   			clock-names = "bi_tcxo",
>>   				      "sleep_clk",
>>   				      "pcie_0_pipe_clk",
>> @@ -2038,37 +2038,27 @@ usb_1_hsphy: phy@88e3000 {
>>   			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
>>   		};
>>   
>> -		usb_1_qmpphy: phy-wrapper@88e9000 {
>> -			compatible = "qcom,sm8450-qmp-usb3-phy";
>> -			reg = <0 0x088e9000 0 0x200>,
>> -			      <0 0x088e8000 0 0x20>;
>> -			status = "disabled";
>> +		usb_1_qmpphy: phy@88e8000 {
>> +			compatible = "qcom,sm8450-qmp-usb3-dp-phy";
>> +			reg = <0 0x088e8000 0 0x4000>;
> 
>>   			#address-cells = <2>;
>>   			#size-cells = <2>;
>>   			ranges;
> These can go since you're removing the subnode, I think..

Indeed will remove

>>   
>>   			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
>>   				 <&rpmhcc RPMH_CXO_CLK>,
>> -				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>;
>> -			clock-names = "aux", "ref_clk_src", "com_aux";
>> +				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
>> +				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>> +			clock-names = "aux", "ref", "com_aux", "usb3_pipe";
>>   
>>   			resets = <&gcc GCC_USB3_DP_PHY_PRIM_BCR>,
>>   				 <&gcc GCC_USB3_PHY_PRIM_BCR>;
>>   			reset-names = "phy", "common";
>>   
>> -			usb_1_ssphy: phy@88e9200 {
>> -				reg = <0 0x088e9200 0 0x200>,
>> -				      <0 0x088e9400 0 0x200>,
>> -				      <0 0x088e9c00 0 0x400>,
>> -				      <0 0x088e9600 0 0x200>,
>> -				      <0 0x088e9800 0 0x200>,
>> -				      <0 0x088e9a00 0 0x100>;
>> -				#phy-cells = <0>;
>> -				#clock-cells = <0>;
>> -				clocks = <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
>> -				clock-names = "pipe0";
>> -				clock-output-names = "usb3_phy_pipe_clk_src";
>> -			};
>> +			#clock-cells = <1>;
>> +			#phy-cells = <1>;
>> +
>> +			status = "disabled";
>>   		};
>>   
>>   		remoteproc_slpi: remoteproc@2400000 {
>> @@ -2976,8 +2966,8 @@ dispcc: clock-controller@af00000 {
>>   				 <&mdss_dsi0_phy 1>,
>>   				 <&mdss_dsi1_phy 0>,
>>   				 <&mdss_dsi1_phy 1>,
>> -				 <0>, /* dp0 */
>> -				 <0>,
>> +				 <&usb_1_qmpphy 0>,
>> +				 <&usb_1_qmpphy 1>,
>>   				 <0>, /* dp1 */
>>   				 <0>,
>>   				 <0>, /* dp2 */
>> @@ -4157,7 +4147,7 @@ usb_1_dwc3: usb@a600000 {
>>   				iommus = <&apps_smmu 0x0 0x0>;
>>   				snps,dis_u2_susphy_quirk;
>>   				snps,dis_enblslpm_quirk;
>> -				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>> +				phys = <&usb_1_hsphy>, <&usb_1_qmpphy 0>;
>>   				phy-names = "usb2-phy", "usb3-phy";
> BTW msm-5.10 marks the dwc3 subdevice dma-coherent, maybe we should too?

Probably, not sure it's related to this patchset

Neil

> 
> Konrad
>>   			};
>>   		};
>>

