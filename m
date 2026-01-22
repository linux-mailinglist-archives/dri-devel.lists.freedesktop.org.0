Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YJoUFAztcWlKZwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:25:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82A9647D7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 10:25:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0684C10E959;
	Thu, 22 Jan 2026 09:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Xg4On4j3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B26310E966
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 09:25:27 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-47d6a1f08bbso3418665e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 01:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769073926; x=1769678726; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=1wh7yPBI+oxYltmzoz6sUaPuJ2ob9U5MNpZ+a6WNEGQ=;
 b=Xg4On4j3eOSMNmRmDkyNzUxdyI2qpODXQ4yZGzW5G9Km56Gl3/BXO/rEuBOfWTPSOs
 MmI7K2APOi70Csyd8EuVShOJfvS4x7sqgPd7rrvtK1+V5l/6tZs0py4XytQVKaVkhv00
 6QQ+lH8+yTE1+A7bTurzX4dd+xmRli1VPYcXfo5fLwNXPVVWgI+Ud+RpGVGDhhE8cwi8
 jNqIOPuW9VthoOCkY7ydLCbKfuqNAAvkEtMe04af32PGfngNRo8G6n7xRQt0lqBTJczf
 9x9HvIKwvinCmRVRosjFSEiOJyloIo5Uabet2ubFCBmjsIAQieYK3ufbmaRwvtlDsEDG
 n4XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769073926; x=1769678726;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1wh7yPBI+oxYltmzoz6sUaPuJ2ob9U5MNpZ+a6WNEGQ=;
 b=p+wSc5+eCB7xuc6c7PIktPmqW8f2rnu/UbGskM9wc5KiYcvAMQ9dcaZ85oNjfiZ+ug
 RaXHz7nH/cAX9/dQsPbmB4tYs1HQmtQrMISEk9c9ubWrYRt/Pp9CHoN7ZAflo0o6TveR
 +eMVfJaPSZYvUqr7KJCfBfyKlD5vCYJ6VGYWss79PlpLWbfrgY+pekY1quybUGf1BHmp
 TWggn3iSy9Ch2ETL5JORZ94xbXCWf15ZSPYN1c8jy6C07pz/TP8JQdG2KzPvLHEqJNQx
 it2OTiq4gLenTIIpl9d2Yyqtwhdm8fZWzBzcIpSkqDRU0GfG2cTSXyrIinAQxENJT0Bo
 z79Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW/coSd4zOHnEhiavub3tW4ZlgwETBt7/NRxui0LijB8AXJ8OwLLartd7dpLWvx6eRNG+aVMDYfY5w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7E7DzfgvF3yxynpvFa90tOmWtkobzg0Or1rIJdiThuG51W2+1
 Sa0b98LsoNbzmhb5WU1BlbTWgGiJ98cUd/+T2VwTKlkHSQdakYY8mEACsg/4hNqTYV0=
X-Gm-Gg: AZuq6aLMvCmTREkeb2xYEcvJeMb+Jgh12Kn3A215WfeMcVclvIvs3EIAszQlVj1zGEn
 pMv0g6PdTrvsXStNGCAUCYt4UYcXQTGHqgtUbAN0Qzc3B15uh18M5fgahLwsXk/S2WqZsBYTSVS
 GyQGbMSEDOmoUtR0yAYh8IE/yYNqPKIpeS8zbFGieYqAkilO1H6uM2qm/Mx6NorpDCxVW5w863j
 8lmg/6hl8HlhmBAL3+oWs6nK0FlAkbcTPzOpA6A24x9uvjAwgOYnhM8B0l39OMB3iYbUpToBG/+
 jquRNQu+JsBNXQuCCXGXFfhnEbSasjPy/MtmtSaB1u1MpCANCL8pEFsq+onrcF2QbrnJl/9/YfR
 xifLOYJt5sJ+QUnE+II85wMdUU+aNO19uCMiBl/Uqve7lRBofHl94g+aIAULId99um0uX6iwesV
 7/VgOOdNvp4LK5GnJXJndfXT1ZtPmJW5XZZGkA7Prn2VqVNrmmqLnf9cPfU7arFds=
X-Received: by 2002:a05:600c:35c3:b0:47a:81b7:9a20 with SMTP id
 5b1f17b1804b1-4801eac0617mr298875535e9.9.1769073926248; 
 Thu, 22 Jan 2026 01:25:26 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:9dc7:6955:8850:f258?
 ([2a01:e0a:3d9:2080:9dc7:6955:8850:f258])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804705b277sm54563365e9.12.2026.01.22.01.25.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 01:25:25 -0800 (PST)
Message-ID: <53a1370b-89a4-4276-949a-e3ad95dbad2c@linaro.org>
Date: Thu, 22 Jan 2026 10:25:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, KancyJoe <kancy2333@outlook.com>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
 <01de9fc2-f60c-4bc0-af61-c070213df29b@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <01de9fc2-f60c-4bc0-af61-c070213df29b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,outlook.com];
	DKIM_TRACE(0.00)[linaro.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,outlook.com:email,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: A82A9647D7
X-Rspamd-Action: no action

On 1/22/26 10:15, Konrad Dybcio wrote:
> On 1/21/26 5:40 PM, Neil Armstrong wrote:
>> From: KancyJoe <kancy2333@outlook.com>
>>
>> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
>> on the Qualcomm Snapdragon 8 Gen 3 platform.
>>
>> The design is similar to a phone wihout the modem, the game control
>> is handled via a standalone controller connected to a PCIe USB
>> controller.
>>
>> Display support will be added in a second time.
>>
>> Signed-off-by: KancyJoe <kancy2333@outlook.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
> 
> [...]
> 
>> +	fan: pwm-fan {
> 
> I'd call it fan {} but gray/grey
> 
>> +		status = "okay";
> 
> You can drop this line (nothing disables it)

Oops will remove

> 
>> +		compatible = "pwm-fan";
>> +
>> +		interrupt-parent = <&tlmm>;
>> +		interrupts = <14 IRQ_TYPE_EDGE_FALLING>;
> 
> interrupts-extended looks neater

Ack

> 
>> +
>> +		pinctrl-0 = <&fan_pwr_active>,
>> +			    <&pwm_fan_ctrl_default>,
>> +			    <&fan_int_active>;
>> +		pinctrl-1 = <&fan_pwr_sleep>;
> 
> fan-pwr looks like an EN pin of a GPIO-controlled regulator

Probably, will model it as a regulator

> 
>> +		pinctrl-names = "default",
>> +				"sleep";
>> +
>> +		pwms = <&pm8550_pwm 3 50000>;
>> +
>> +		#cooling-cells = <2>;
>> +		cooling-levels = <0 16 32 45 60 80 105 130 155 180 205 230 255>;
> 
> Does this come from a preexisting map?

Kancy ?

> 
>> +	};
>> +
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +
>> +		pinctrl-0 = <&volume_up_n>;
>> +		pinctrl-names = "default";
>> +
>> +		key-volume-up {
>> +			label = "Volume Up";
>> +			linux,code = <KEY_VOLUMEUP>;
>> +			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
>> +			debounce-interval = <15>;
>> +			linux,can-disable;
>> +			wakeup-source;
>> +		};
>> +	};
>> +
>> +	pmic-glink {
>> +		compatible = "qcom,sm8650-pmic-glink",
>> +			     "qcom,sm8550-pmic-glink",
>> +			     "qcom,pmic-glink";
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
>> +
>> +		orientation-gpios = <&tlmm 29 GPIO_ACTIVE_HIGH>;
>> +
>> +		connector@0 {
>> +			compatible = "usb-c-connector";
>> +			reg = <0>;
>> +
>> +			power-role = "dual";
>> +			data-role = "dual";
>> +			self-powered;
> 
> Is this property interpreted at all by our setup?

Kancy did add self-powered, but it does charging so it should be dropped.

> 
> [...]
> 
>> +	sound {
>> +		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
>> +		model = "SM8650-APS2";
>> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
>> +				"SpkrRight IN", "WSA_SPK2 OUT",
>> +				"IN1_HPHL", "HPHL_OUT",
>> +				"IN2_HPHR", "HPHR_OUT",
>> +				"DMIC1", "MIC BIAS1",
>> +				"DMIC2", "MIC BIAS2",
>> +				"AMIC2", "MIC BIAS2",
>> +				"TX SWR_INPUT1", "ADC2_OUTPUT",
>> +				"TX SWR_INPUT7", "DMIC1_OUTPUT",
>> +				"TX SWR_INPUT8", "DMIC2_OUTPUT";
>> +
>> +		wcd-playback-dai-link {
>> +			link-name = "WCD Playback";
>> +
>> +			cpu {
>> +				sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
>> +			};
>> +
>> +			codec {
>> +				sound-dai = <&wcd939x 0>,
>> +					    <&swr1 0>,
>> +					    <&lpass_rxmacro 0>;
>> +			};
> 
> 'co'dec < 'cp'u
> 
> [...]
> 
>> +	wcd939x: audio-codec {
> 
> 'a'udio-codec should be way higher

ack

> 
> [...]
> 
>> +	thermal-zones {
>> +		cpu2-top-thermal {
>> +			trips {
>> +				cpu2_active: cpu2-active {
>> +					temperature = <38000>;
>> +					hysteresis = <2000>;
>> +					type = "active";
> 
> This is shaky.. let's perhaps reference each thermal zone that you want
> to extend with a label.. Or maybe a pair of labels for trips/cooling-maps
> per zone?

Yep, will clean that by adding labels


> 
> [...]
> 
>> +&pcieport1 {
>> +	pinctrl-0 = <&upd720201_active>;
> 
> Is this a regulator?

There's s 3 gpios, the 3 are required to have the controller to show up,
it could be 3 regulators and a reset line, I don't know. The controller
needs 1.05v and 3.3v plus a reset signal, but I don't know which one
is which and if it's really regulators...

> 
>> +	pinctrl-names = "default";
>> +
>> +	/* Renesas μPD720201 PCIe USB3.0 HOST CONTROLLER */
> 
> DON'T SCREAM! :P
> 
>> +	usb-controller@0 {
>> +		compatible = "pci1912,0014";
>> +		reg = <0x10000 0x0 0x0 0x0 0x0>;
>> +
>> +		pinctrl-0 = <&gamepad_pwr_en>;
>> +		pinctrl-names = "default";
> 
> Is there a hub connected to it? Or does it go directly to the
> aforementioned (game) controller?

Directly connected

> 
> [...]
> 
>> +&pm8550_pwm {
>> +	status = "okay";
>> +
>> +	multi-led {
>> +		color = <LED_COLOR_ID_RGB>;
>> +		function = LED_FUNCTION_STATUS;
>> +
>> +		#address-cells = <1>;
>> +		#size-cells = <0>;
> 
> Would a label="xyz" be useful here?

Probably yes

> 
> [...]
> 
>> +&tlmm {
>> +	/* Reserved I/Os for NFC */
>> +	gpio-reserved-ranges = <32 4>,  <36 1>, <38 6>, <74 1>;
> 
> double space
> 
> Are they all for NFC, are they all required?

They are reserved, usually for NFC to be used by the secure enclave,
but we don't have nfc but they are still reserved...

> 
> [...]
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> index 07ae74851621..fcd5a1a45803 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
>> @@ -3917,7 +3917,7 @@ opp-32000000-4 {
>>   				};
>>   			};
>>   
>> -			pcie@0 {
>> +			pcieport1: pcie@0 {
> 
> pcie1_port0, please

Ack

> 
> Konrad

Thanks,
Neil
