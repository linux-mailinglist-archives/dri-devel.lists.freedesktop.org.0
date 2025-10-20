Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24D3BF1B48
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 16:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C0AD10E44A;
	Mon, 20 Oct 2025 14:03:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ixit.cz header.i=@ixit.cz header.b="JogvuJnh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ip-94-112-25-9.bb.vodafone.cz [94.112.25.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C399A10E44A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 14:03:49 +0000 (UTC)
Received: from [10.0.0.200] (unknown [10.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 63DA1534109C;
 Mon, 20 Oct 2025 16:03:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1760969027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=wDhqgp76WpC+4iEmVhkxCNYgjRz0pZYukTW/oudD/PA=;
 b=JogvuJnhkU7w8xxRuUmAQBjfEORbVkv37sZTFxQkyvzh2Hc6RTPWa/st4Des27rWcGGjpn
 AU9w+fqEXCb9+tsr64v/s2jEC0OxoBYlDTWL/aiv1ZhtTct2pfrf6xs6FwPR3VUd9sE1hX
 6A/nyE02wP4t7wlOlBaJbWl6JGPdWHg=
Message-ID: <d3603461-c6ef-4385-9574-b708ae8ddcb4@ixit.cz>
Date: Mon, 20 Oct 2025 16:03:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/8] arm64: dts: qcom: sdm845-oneplus: Describe panel
 vci and poc supplies
To: Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251016-s6e3fc2x01-v3-0-ce0f3566b903@ixit.cz>
 <20251016-s6e3fc2x01-v3-2-ce0f3566b903@ixit.cz>
 <aeb9a34a-d9ea-4027-9f61-beae73498266@linaro.org>
Content-Language: en-US
From: David Heidelberg <david@ixit.cz>
Autocrypt: addr=david@ixit.cz; keydata=
 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
In-Reply-To: <aeb9a34a-d9ea-4027-9f61-beae73498266@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 20/10/2025 15:45, Casey Connolly wrote:
> 
> 
> On 16/10/2025 18:16, David Heidelberg via B4 Relay wrote:
>> From: Casey Connolly <casey.connolly@linaro.org>
>>
>> There are two additional supplies used by the panel, both are GPIO
>> controlled and are left enabled by the bootloader for continuous splash.
>>
>> Previously these were (incorrectly) modelled as pinctrl. Describe them
>> properly so that the panel can control them.
>>
>> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
> 
> This Fixes: is not correct, it should be the commit that first added the
> panel to the DT since it was added after the initial DT.

I double checked, it's the right commit, the panel node was added in the 
initial commit (it's also mentioned in the commit itself)
...
  * Display
...

> 
> The driver changes also need to be backported and may not apply properly
> to stable kernels, so we should be careful with this.
But the OnePlus 6T driver never worked before, that's why I assume the 
backport here play very small role.

If no other objection, I'll keep the Fixes tag in next version, but if 
maintainers decides to remove it, I'm fine with it too.

David

>> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
>> Co-developed-by: David Heidelberg <david@ixit.cz>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
>> ---
>>   .../arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi | 46 +++++++++++++++++++++-
>>   1 file changed, 45 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>> index dcfffb271fcf3..1cf03047dd7ae 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
>> @@ -162,6 +162,34 @@ ts_1p8_supply: ts-1p8-regulator {
>>   		enable-active-high;
>>   		regulator-boot-on;
>>   	};
>> +
>> +	panel_vci_3v3: panel-vci-3v3-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "LCD_VCI_3V";
>> +
>> +		regulator-min-microvolt = <3300000>;
>> +		regulator-max-microvolt = <3300000>;
>> +
>> +		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +		pinctrl-0 = <&panel_vci_default>;
>> +		pinctrl-names = "default";
>> +		regulator-boot-on;
>> +	};
>> +
>> +	panel_vddi_poc_1p8: panel-vddi-poc-regulator {
>> +		compatible = "regulator-fixed";
>> +		regulator-name = "VDDI_POC";
>> +
>> +		regulator-min-microvolt = <1800000>;
>> +		regulator-max-microvolt = <1800000>;
>> +
>> +		gpio = <&tlmm 25 GPIO_ACTIVE_HIGH>;
>> +		enable-active-high;
>> +		pinctrl-0 = <&panel_poc_default>;
>> +		pinctrl-names = "default";
>> +		regulator-boot-on;
>> +	};
>>   };
>>   
>>   &adsp_pas {
>> @@ -429,6 +457,8 @@ display_panel: panel@0 {
>>   		reg = <0>;
>>   
>>   		vddio-supply = <&vreg_l14a_1p88>;
>> +		vci-supply = <&panel_vci_3v3>;
>> +		poc-supply = <&panel_vddi_poc_1p8>;
>>   
>>   		reset-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
>>   
>> @@ -803,6 +833,20 @@ hall_sensor_default: hall-sensor-default-state {
>>   		bias-disable;
>>   	};
>>   
>> +	panel_vci_default: vci-state {
>> +		pins = "gpio26";
>> +		function = "gpio";
>> +		drive-strength = <8>;
>> +		bias-disable;
>> +	};
>> +
>> +	panel_poc_default: poc-state {
>> +		pins = "gpio25";
>> +		function = "gpio";
>> +		drive-strength = <8>;
>> +		bias-disable;
>> +	};
>> +
>>   	tri_state_key_default: tri-state-key-default-state {
>>   		pins = "gpio40", "gpio42", "gpio26";
>>   		function = "gpio";
>> @@ -818,7 +862,7 @@ ts_default_pins: ts-int-state {
>>   	};
>>   
>>   	panel_reset_pins: panel-reset-state {
>> -		pins = "gpio6", "gpio25", "gpio26";
>> +		pins = "gpio6";
>>   		function = "gpio";
>>   		drive-strength = <8>;
>>   		bias-disable;
>>
> 

-- 
David Heidelberg

