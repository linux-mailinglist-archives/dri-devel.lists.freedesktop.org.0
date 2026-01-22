Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0E+TJCnicWk+MgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 09:39:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 449CE634B9
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 09:39:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E3D10E93E;
	Thu, 22 Jan 2026 08:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VU3+eee9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC4BD10E93E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 08:39:01 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-47d59da3d81so11823285e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 00:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769071140; x=1769675940; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=WRgWt3QOSpx0eS1nwXFOWd2CSZ21RZ8VIcbpaI5Urno=;
 b=VU3+eee9BPyCBQsG+zaOgTU7jZCYBuuL6zjOglUvuODOWheE/TzVEuAm+6WVQ9omEo
 kDuYFjMPlArEcTemuzh+OwJ/0px1vzUVxlWHnSojhf9AmD0YdfTxO6BURAXnSFnt8vr6
 yE32blgi59UDiGNFPM2mlFD6cRCM6u4eb5MjefmfiwHjPzI6Xn4N97WraOejq9gFAcJr
 Fi0ISlyDeZJAIoL0Qa+ILRlTcbW/NoAZeYjKbVg68gSFgnonZV2lXp1BxJA4zqfcxDcv
 vo+7x7iUc8mSejBGMzVtG6ts5mFjOHKt2vjeoH5jopw13gNLepHQWridQ/XfQjO56i2T
 ytxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769071140; x=1769675940;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WRgWt3QOSpx0eS1nwXFOWd2CSZ21RZ8VIcbpaI5Urno=;
 b=j2aEqcfGBmwLxbcfHozP4snvwctoha6kO8sjP8eWKFa0bMoDzZj4KbR51aqp23A3un
 rN6YMzVg7wQs3OJt4WwoJhadQ3LoJp45yDLUS+NaHTyqdoM9hGEg+OdGXJMWlWdaOozW
 PgMPNleIDtSGXtlEPDw+1rFAajEJ9m9VotDIQg1nbi6OKB6pF0RBqbsnCJib7hXaNHfj
 iyn4Tqq1/8rKze2mybw46SdX8yXMhpnF3NvTJe8SpI7XfjJn3ZoyY9kXBHeddic8o23f
 mxiD1Iu/Z8hcoZSmCKJgaYftA+795tt/HjMtr4DF2REyuVkMBtz2cLT1suKthPrMh3h1
 U1lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVd1kE4UMnFi7A1EEACtH+c831G9MoJSrqKTHQThPWdJ88O0uhW7uTCPJ3m32kM6U5m+slJ6KT+hU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywzlg48eILjQrn2AI++1O/AXx1nzD4LmoIKzhgiPMwEq0njhcTC
 lLnXj37vE4iEfAZMeRNRt31AihC9aYsrXbkqMl7J0WZkPIQn3MSj5xsieOZf1kBfqAZhfdt4xGf
 ahaCqitfhMA==
X-Gm-Gg: AZuq6aJHA/uZObdNzZn1fecu0+4MR/T9A5/Zog5rSNPy9RtFUyHANf0Jsb/arpwXDMb
 1CNrYIJUvywUvDrairAOroRUhsL1l+MaVmMr+jnjg65GG++GdtJeVATMlIq6pmW3WnQRAs82ZeX
 YuuC3rGf9PgBFlPdGIfrYJdU2C4eSfq9hNihxR3HLQxV/HtSWl3WCNmCwDsETvWfq6/V1Q+nWbw
 8f0USvJGSSGHDIPalw5RsFn+EDBGOynJXHRHZqR7HcCGMq9T85TnT2LKIg3VScxLxuTOiWuq+0C
 A5+/C93ISbmwYbk/zLCpxIFF8tDMTu7t0TKFWhm3jOoYqQf8M38/il1cLphLAJ+xkBC8sYdOAXC
 fbwq1rHPl+Go1xXu/IRCjQ66Q6Gp2Kl4b5/7hxdrqagFC8k5ii9D7xOI3HiOJ9SVcd2J1oq+eS4
 qjEtbOVwcwVVunzykXUU4esIjtCNjOpZJsNUsM3CbGgcaBhfigu3VpQrey5OUlpJ4=
X-Received: by 2002:a05:600c:4653:b0:47e:e0b3:2437 with SMTP id
 5b1f17b1804b1-480470689femr23241895e9.5.1769071140057; 
 Thu, 22 Jan 2026 00:39:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:9dc7:6955:8850:f258?
 ([2a01:e0a:3d9:2080:9dc7:6955:8850:f258])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-480470cf385sm48724455e9.13.2026.01.22.00.38.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jan 2026 00:38:59 -0800 (PST)
Message-ID: <5c54dffe-f8eb-4b45-97b0-512a9658c212@linaro.org>
Date: Thu, 22 Jan 2026 09:38:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, KancyJoe <kancy2333@outlook.com>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
 <hmnyvxz7ashufiiil6hf4lg5g435e53zd3xla7qeqcb2styrqg@jkbjl6arm33g>
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
In-Reply-To: <hmnyvxz7ashufiiil6hf4lg5g435e53zd3xla7qeqcb2styrqg@jkbjl6arm33g>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,outlook.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[outlook.com:email,e:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.0:email,1c:email,0.0.0.1:email,linaro.org:dkim,linaro.org:email,linaro.org:replyto,linaro.org:mid];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 449CE634B9
X-Rspamd-Action: no action

On 1/22/26 02:30, Dmitry Baryshkov wrote:
> On Wed, Jan 21, 2026 at 05:40:28PM +0100, Neil Armstrong wrote:
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
>>   arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>>   .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1445 ++++++++++++++++++++
>>   arch/arm64/boot/dts/qcom/sm8650.dtsi               |    2 +-
>>   drivers/gpu/drm/msm/dsi/dsi.c                      |    4 +-
>>   4 files changed, 1449 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>> index 6f34d5ed331c..1ba29755e5ba 100644
>> --- a/arch/arm64/boot/dts/qcom/Makefile
>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>> @@ -313,6 +313,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-samsung-q5q.dtb
>>   dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-sony-xperia-yodo-pdx234.dtb
>> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-ayaneo-pocket-s2.dtb
>>   
>>   sm8650-hdk-display-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-display-card.dtbo
>>   
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>> new file mode 100644
>> index 000000000000..141d92933957
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
>> +
>> +&i2c3 {
> 
> clock-frequency?

We never did so far we we didn't need more than 100KHz

> 
>> +	status = "okay";
>> +
>> +	wcd_usbss: typec-mux@e {
>> +		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
>> +		reg = <0xe>;
>> +
>> +		vdd-supply = <&vreg_l15b_1p8>;
>> +		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
>> +
>> +		mode-switch;
>> +		orientation-switch;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				wcd_usbss_sbu_mux: endpoint {
>> +					remote-endpoint = <&pmic_glink_sbu>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				wcd_usbss_headset_out: endpoint {
>> +					remote-endpoint = <&wcd_codec_headset_in>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&i2c6 {
> 
> clock-frequency?
> 
>> +	status = "okay";
>> +
>> +	typec-mux@1c {
>> +		compatible = "onnn,nb7vpq904m";
>> +		reg = <0x1c>;
>> +
>> +		vcc-supply = <&vreg_l15b_1p8>;
>> +
>> +		retimer-switch;
>> +		orientation-switch;
>> +
>> +		ports {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			port@0 {
>> +				reg = <0>;
>> +
>> +				redriver_ss_out: endpoint {
>> +					remote-endpoint = <&pmic_glink_ss_in>;
>> +				};
>> +			};
>> +
>> +			port@1 {
>> +				reg = <1>;
>> +
>> +				redriver_ss_in: endpoint {
>> +					remote-endpoint = <&usb_dp_qmpphy_out>;
>> +				};
>> +			};
>> +		};
>> +	};
>> +};
>> +
>> +&iris {
>> +	status = "okay";
> 
> With the default firmware?

Yes

> 
>> +&remoteproc_adsp {
>> +	firmware-name = "qcom/sm8650/ayaneo/ps2/adsp.mbn",
>> +			"qcom/sm8650/ayaneo/ps2/adsp_dtb.mbn";
>> +
>> +	status = "okay";
>> +};
>> +
>> +&remoteproc_cdsp {
>> +	firmware-name = "qcom/sm8650/ayaneo/ps2/cdsp.mbn",
>> +			"qcom/sm8650/ayaneo/ps2/cdsp_dtb.mbn";
> 
> Is it fused?

No but as Kancy reported, it's usual vendord provides their own
version with battery & features tuning.

> 
>> +
>> +	status = "okay";
>> +};
>> +
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
>>   				device_type = "pci";
>>   				reg = <0x0 0x0 0x0 0x0 0x0>;
>>   				bus-range = <0x01 0xff>;
>> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
>> index d8bb40ef820e..0781dce7cda2 100644
>> --- a/drivers/gpu/drm/msm/dsi/dsi.c
>> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> 
> Something stray
> 
>> @@ -43,12 +43,12 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
>>   	of_node_put(phy_node);
>>   
>>   	if (!phy_pdev) {
>> -		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
>> +		DRM_DEV_ERROR(&pdev->dev, "%s: 0 phy driver is not ready\n", __func__);
>>   		return -EPROBE_DEFER;
>>   	}
>>   	if (!msm_dsi->phy) {
>>   		put_device(&phy_pdev->dev);
>> -		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
>> +		DRM_DEV_ERROR(&pdev->dev, "%s: 1 phy driver is not ready\n", __func__);
>>   		return -EPROBE_DEFER;
>>   	}

Aw, will drop in v2

Neil

>>   
>>
>> -- 
>> 2.34.1
>>
> 

