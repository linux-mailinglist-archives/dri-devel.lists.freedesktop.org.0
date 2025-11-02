Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB3DC29872
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 23:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2521310E0C9;
	Sun,  2 Nov 2025 22:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDKimwy2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jq/c0Qtd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6553510E0C9
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 22:21:38 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A2Gfpd5564683
 for <dri-devel@lists.freedesktop.org>; Sun, 2 Nov 2025 22:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Fy0+zB1zFcmNDPBHzfEZnFa8
 agZt/sFQo0/x5Ko7o68=; b=fDKimwy2eBdQWL3qZfpEPPgtkkMfxroO9fm5czNR
 Z4vkwatgq5iq9X2qfJL0bNDe2cnzUfGl9fZcnpjki6bMvkee9o5Q7fnR2vaFS8+V
 B5OWZTgy/9+mRIg1FHcTaC7iPdT+xV9yNbJh+28yqJZ2GZwsjdnowkuKXVrQeCuM
 9Edd09cghNSyCbdYyUOtFbcTMPjYiuXTlDGgszfFIxnnSYz07hAxJhq1lBPD0+TN
 1Ev8Cc/+A5YWXTMnZIaZdI2lob6OYMld9ebE8n+qQ6sMb4P2I1T9UdANZS7AePIb
 p+0apkQSA4XWuMPzxlUC2uxAL3QukEEb2ulViBBZTb0pCw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a5bcm2neu-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 22:21:37 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ecf77618a5so127401891cf.3
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 14:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762122097; x=1762726897;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Fy0+zB1zFcmNDPBHzfEZnFa8agZt/sFQo0/x5Ko7o68=;
 b=Jq/c0QtdyaEDu4ygMLnWbYYLdKfUHcynp9mQWOExEbFd/toY4eV7djbVI/3RjRqncZ
 ms1TlVgTmo+cW0rLeaKnEbSgbA/LoEEFWFq8/5SiQM/HV8Y8UboZzw/Ms3opg+R6vXjc
 GhUTmTNbt4b0OGjMyT1VqYhun998jZm0R791CSykQd7E5nj7w801KDpTOvc/93ZKHWRe
 uFMZdyy2YS3SNa2QKMyOsAEbFDd/5GlwFck5VKQdShT3npTypCtTWD79/kNjYg/cuSm7
 v8XZI/ZdO+tsBtWm5TjQPeuT2iCX33Ig7EMDus9+deUgnUQENl4t5Qry5xaE67X2CAYC
 zYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762122097; x=1762726897;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Fy0+zB1zFcmNDPBHzfEZnFa8agZt/sFQo0/x5Ko7o68=;
 b=M2ckKgFK1p/XRigsSlwIGyCwqdOFRVwarvq8HORfg0q4JJMAaUDJF7Unz31No80Low
 FLQStZvjeJi6w3F2pgMKO4ELrOKWfQZu5Q5A5XY0qLTJzlyaYyKhnSAj+23nT3hVhTnL
 7VZObJM5GgSSHfViO2uSXOMy0pyT+MiFXsU+iTE9Z4Do19x1wj09TTKd2eSb9bZnUQbg
 D+zZ+bmHIbMHq+uHZDvb6BtmYOH1faJI2V+oofjIeWQErPKxQULF1MftuYMgp8WUp8mm
 fDLe2L4VdC6Jv70heZBoS52djR0g7+xLaGiG6tT80FYAYqg3Ushh8JusoGQWTRV38gBE
 f15A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/yBxmCRkTUaL1xCkLnSiN7JMx8dPdW4Mj+ysRPD7GT7ekACyk3/0TZMP36ScdlPG2TofbwzzerFs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxB6Uuw5Ln//nsfZ1R1WngDNqL4dMLwFh3VasHrEWN+o4arVha5
 iTniUjNdKHivJ62GzVWsFpQY7SWjAVQWaq3xNWH0q4vrnmQtcE62atN/CKv3neeIyOrGWtQIhFY
 6MMMkf46w1DeIOkJYdos0ICz2W6pwyZaC1yxwKrunQbQmaXTDH215nq4PDH26osjYVULi3sg=
X-Gm-Gg: ASbGncs9VqAzAFI44ABfK7HoqyoZr0qq1wBNPZwMgIkhcAVok47duXBaL/HlP7byy3N
 FY9zoH83TLkGk/kfiXmnp9JkLPMt/qdMLzxgu4gOSA9wP1mlXxSCwG0TJHv13VAONoff90Ue6+X
 wWYmFFe7f5R9DesOABDVwHRRaQE75i18P3inQQlZ0Twoy/X/c/aYV4S/90OuGzjM7TZtEvgHyFu
 0MqvNLFVVk5LTK++oEV7fRro2KaFOQJEbSRKvL1iFfIKoC0BaY+vnZJ6IOcjdmPDxXYWDwN48Vx
 FpqOv2qaFr6tB/SEqpxLudejtKlHo5yti6yrHROPUjxRNw8eueU5kKLjYu4nl+fBvJHhi16KFCg
 I84b+FHT7DZ4xGPRPkbduzv87fkAIaJw/tI9xWUooG3FlFNxVkALslsJmIWa0tUm27vs0JSZkwn
 kX/qO/igy0/CF8
X-Received: by 2002:ac8:58c6:0:b0:4ec:f156:883d with SMTP id
 d75a77b69052e-4ed30f873a3mr150821641cf.43.1762122096613; 
 Sun, 02 Nov 2025 14:21:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKSuBp5T5gQKe8Rxj77+3COdbWI4x8CvKxpNjeJKe55iGjnrgP/lpO6D3eNUdIWsNdHSe8Ig==
X-Received: by 2002:ac8:58c6:0:b0:4ec:f156:883d with SMTP id
 d75a77b69052e-4ed30f873a3mr150821431cf.43.1762122096189; 
 Sun, 02 Nov 2025 14:21:36 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5942e83f33asm136383e87.49.2025.11.02.14.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 14:21:34 -0800 (PST)
Date: Mon, 3 Nov 2025 00:21:31 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: maud_spierings@hotmail.com
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/6] arm64: dts: qcom: x1e80100-vivobook-s15: enable
 ps8830 retimers
Message-ID: <vijkpvomiv3nonumyqoeut2k3ajftf7cafx56ngjlc3uuwqfcb@7o75sm3kh36d>
References: <20251101-asus_usbc_dp-v1-0-9fd4eb9935e8@hotmail.com>
 <20251101-asus_usbc_dp-v1-3-9fd4eb9935e8@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251101-asus_usbc_dp-v1-3-9fd4eb9935e8@hotmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDIwNyBTYWx0ZWRfXwlg0XAuaFJNC
 qmk0NciZX7hCQsu6ymIHrh1yK437QhYUkk3eCjUhGKuHkGRsgkgf/+dDPN7yP+STrRpfaUUN4Ta
 MTXFpPXoJh9bz+ImDTVscz/WdiuFDuwDOr2uIXaMkfDddpXz4b2jCOxuasxAxAvCbXqAYl31mhZ
 76LHmkgYL3XMd0ScAhrJ4NXPD/reMlUOOpo1d45dZ+Ovh17EWEjOnvmJeg/X+QhNDitwO1mMGzU
 mc9LR/DSreLWCC06dZ/kD11kDv/oe7uoaX47SmMNBRwrleDNGmwsUOJDen9N8KhsGKz0ICMZPhF
 hqY5RniEOnZ+Gc5nMEGosbg+etk72D/Lvsb9PNUmGO5wlB7AGQvOlEDN64ci9kVXXa5deEeL+Vc
 kCiac+O7+XC0OBg7eqKEGRerzYFZkw==
X-Authority-Analysis: v=2.4 cv=EszfbCcA c=1 sm=1 tr=0 ts=6907d971 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=69EAbJreAAAA:8 a=pijrH-o4oxMIDQe8xl8A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: psrFn3R4H4z9GUmfvJX7a68aMvsfL1Ju
X-Proofpoint-ORIG-GUID: psrFn3R4H4z9GUmfvJX7a68aMvsfL1Ju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511020207
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

On Sat, Nov 01, 2025 at 01:54:14PM +0100, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> The Asus vivobook s15 has two usb type c ports on the left side, these
> use parade ps8830 retimers like the others, enable them to also enable
> dp altmode
> 
> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 310 ++++++++++++++++++++-
>  1 file changed, 302 insertions(+), 8 deletions(-)
> 
> @@ -158,6 +174,102 @@ vph_pwr: regulator-vph-pwr {
>  		regulator-boot-on;
>  	};
>  
> +	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {

'vph-pwr' > 'rtmr0'

> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR0_1P15";
> +		regulator-min-microvolt = <1150000>;
> +		regulator-max-microvolt = <1150000>;
> +
> +		gpio = <&pmc8380_5_gpios 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usb0_pwr_1p15_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr0_1p8: regulator-rtmr0-1p8 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR0_1P8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&pm8550ve_9_gpios 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usb0_1p8_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr0_3p3: regulator-rtmr0-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR0_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usb0_3p3_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr1_1p15: regulator-rtmr1-1p15 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR1_1P15";
> +		regulator-min-microvolt = <1150000>;
> +		regulator-max-microvolt = <1150000>;
> +
> +		gpio = <&tlmm 188 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usb1_pwr_1p15_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr1_1p8: regulator-rtmr1-1p8 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR1_1P8";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		gpio = <&tlmm 175 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usb1_pwr_1p8_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
> +	vreg_rtmr1_3p3: regulator-rtmr1-3p3 {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "VREG_RTMR1_3P3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 186 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&usb1_pwr_3p3_reg_en>;
> +		pinctrl-names = "default";
> +
> +		regulator-boot-on;
> +	};
> +
>  	/*
>  	 * TODO: These two regulators are actually part of the removable M.2
>  	 * card and not the CRD mainboard. Need to describe this differently.
> @@ -506,15 +618,62 @@ touchpad@15 {
>  &i2c1 {
>  	clock-frequency = <400000>;
>  	status = "okay";
> -
> -	/* PS8830 USB4 Retimer? @ 0x8 */

No retimer on this bus?

>  };
>  

-- 
With best wishes
Dmitry
