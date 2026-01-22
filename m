Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGvyH819cWk1IAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 02:30:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3026160578
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 02:30:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACC3010E03E;
	Thu, 22 Jan 2026 01:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KdFo5+cq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D9hrwoLD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2099510E03E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 01:30:49 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60LLOWgb107356
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 01:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=YRXguZAe/HWolTQJwqgVk2xx
 NQlz6f7cY1R7DReOXgw=; b=KdFo5+cqcEdLJKqdfEnyxekIOYIYHVdS33yKosnx
 6/j9jOCl1lQiB2sb1muDUgwwCC3/9UJsqx/4gLljgvdUkEy3CzsevV9x3P8s1Css
 biJp6H00Fyux83ztXkUHQXfVeGjwuKgVWvs13VVcpE/NLYFChsmPeSSsyC24knXw
 S7HmWfmeVqTIowUfkgEv3b/3a20E0UXjr4Ee3cF6I8EqJ7Sl4P10Ra3gIR4JaSOP
 3/vr0WuX2LwITmY222zbvI8/eJSFS1PTN8rTrC6wvV1m4yy58go2v8O48u7f3KN5
 nqJAHyM+hDNm09GDPQE8l8JU5zDz7eqczTcEuQoWrVevOQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu6pgrj8m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 01:30:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c5297cfe68so107812085a.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 17:30:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769045447; x=1769650247;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=YRXguZAe/HWolTQJwqgVk2xxNQlz6f7cY1R7DReOXgw=;
 b=D9hrwoLDcHdlyLjNzBQ085sM13uC5bfztKKmRXrqDbFTGfMjzPXW/lDBNWXnOADkr3
 dfSyePC23ufMXYZ6a648L3C+ZfiwEvy4Hgch5npysdk0TOabv4sKJkXmn1G6nYrIotEy
 45sIzezbuEtKDm2vFyrrj367iD742ujw6PDlDYoIH249s6IpGjebypWbKI3XbRrx05RL
 HcXithohrm+BXAJD0SaPp0QomV6FOKSWmsqcgNzqq5wPFU5fEFOgub50xSWCFoMvuTWv
 VhLiEeWK9O6I7m6seCq6ThGu0rbZOS68ZqIh2c0yIXcNeDlkSTv/m0IcoZ59oyOCgymN
 R41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769045447; x=1769650247;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YRXguZAe/HWolTQJwqgVk2xxNQlz6f7cY1R7DReOXgw=;
 b=qN9NhvrjFluFYSxIfTnWBTRDlHOCO0SIJwg/85z1Seo3XvuRkx6Dh/dHNh1D3S34aV
 iv9L/g9MGTM4Lp3usaX5PP50wSMh44KhYwMDnLKuCaqUhOyH1dt5KZa6k+YFVaodof8D
 7HCQ/BBMFaFBYhgXWY/HSUFFqx8Lp3taAsiqOcCzP4mpMK449cUV1jrXKuzhG8ZT8fIh
 V8BB4PAj9IQ96Brl5Ez59fbhLR+/iaBeaRxX+VUKFfSk8qM+tSIYxw+LwOPDQKcEE/4d
 0tg1/MbpdMr6cUAiYgk9XZDd2ZOafHBDxr0h1eKW+v6YZ2xgiKf+XF2g/5oqSjf+ncvl
 5HDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1/IJUe7LC4T0dQD0YLer+2CUrHULWttObTYvjbDTzc+6I+RyugMVu55Cn8VFKpMWylie1dc6vqDU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBwK63ZKDrroGceeaztFJ0EXuAMv6tjlO+EGg/nMPsyjOH+WsA
 UqBWTBFiCAz73C+90MOL/il79l4hQuPaxgaeg2+OkXR2KSK2BxQmOe0SNvzmxM3zjKrDXdGJv5a
 y6tiyl/LEVE/CwOo9qkdjoMBFCZXpa3iYEZgUcoa5cCHLwKMDRu2IMpHm80PifQy4vANR4f0=
X-Gm-Gg: AZuq6aLHMuS/urJmrM4LL/VJRF89R3AP30hidC2F07TrQKF4LNeYi+02xIrRey7GD7J
 /OWD+u3B1gqdDfYpsbtkY+w1zqf6MuT5yZIpUv2RCpaSN6NT/b/sFaCoKVf/RKbcQYo1F2QL1Xg
 xUe8PEKDBOyU8YJy2fWAYFpoc2WyI7RQx+gpoWnX8HpN7BLT/Qfz0PYlXhKGbGGcAYAP95oeRiA
 XqJIbGhmjuzaeYMY6EBJdS36SOMgRWXXEoYureEOnIu2SnI0HaP9wlwCCkmUuvUmpxEzaPTOF5Z
 +7cWQE04prGXqNaz4RN5IS29DaapD3MkPX7wML4gP/14qO/gxGEgjJk7YsUBog9PgoJUUrP14WV
 Bg0hFE0zjtvatlzpKQEw9PyYEXlD5yFiSqz5kcQ0wZDnpIR1jzz4o7wP6dtd7jRb4vvQ4jSMyJW
 CxLkXmab4M0TlHSiqM+HTr+8I=
X-Received: by 2002:a05:620a:290f:b0:8b2:5cdd:6a16 with SMTP id
 af79cd13be357-8c6a67ad1a9mr2566996185a.82.1769045447364; 
 Wed, 21 Jan 2026 17:30:47 -0800 (PST)
X-Received: by 2002:a05:620a:290f:b0:8b2:5cdd:6a16 with SMTP id
 af79cd13be357-8c6a67ad1a9mr2566990585a.82.1769045446788; 
 Wed, 21 Jan 2026 17:30:46 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38384f8a1d6sm52282081fa.40.2026.01.21.17.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 17:30:44 -0800 (PST)
Date: Thu, 22 Jan 2026 03:30:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, KancyJoe <kancy2333@outlook.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket S2 gaming console
Message-ID: <hmnyvxz7ashufiiil6hf4lg5g435e53zd3xla7qeqcb2styrqg@jkbjl6arm33g>
References: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-0-bb3f95f1c085@linaro.org>
 <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121-topic-sm8650-ayaneo-pocket-s2-base-v1-3-bb3f95f1c085@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxMCBTYWx0ZWRfX0cxJPCVjtHyr
 psIa5ntzL2zk1+VqQ4Lkfg7z1O5bnQZXyKQ58kY2VuT5ZhDHUihDBCLMMIzJb2+XUADEIK1mRPt
 Z/y+7UiqMWYbxFjbXeZNokYRhUIeI8iKcx0jI9uC+Os2bfTGfVld4g64TNNNUw1RChPjOuFwlMu
 /l6ng3/ep9bgYOGsK/s2bKB5SdlqsmfhzhL00/Q0TXbkiLXicUrkYkFuuOOwwFYMkykf4lkOo1/
 cw3Vou7buZtq6M6JaRvJzbPuzb8uSDo4Ynu0R0ShQOgQ5tbYGjjw1D/NS3GRIaQ6vN98/jcr0Pj
 Q27p0v+JVVeqyimMscEW0sOU2gtmWYHC1wRSm9hpTt/LnJzqq4hk39KldiuU37xnDyrHfPHoYX3
 nUjERK0BCdizFmzp9JcjZBVxrR4Kw98D65lNtXbQXyj/C1q2nX2GKm97s6uqJ7Se15rRDHyJdcM
 cETzYnmzEghlQ2qy4Fw==
X-Authority-Analysis: v=2.4 cv=OZGVzxTY c=1 sm=1 tr=0 ts=69717dc8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=UqCG9HQmAAAA:8 a=KKAkSRfTAAAA:8 a=xr2jeuCrqBIryPMD71IA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 4pXSU-ElncGMlHf3jDXn4H9znnSvJm1y
X-Proofpoint-GUID: 4pXSU-ElncGMlHf3jDXn4H9znnSvJm1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220010
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org,outlook.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:dkim,0.0.0.0:email,oss.qualcomm.com:dkim,outlook.com:email,1c:email,0.0.0.1:email]
X-Rspamd-Queue-Id: 3026160578
X-Rspamd-Action: no action

On Wed, Jan 21, 2026 at 05:40:28PM +0100, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add initial Device Tree for the Ayaneo Pocket S2 gaming console based
> on the Qualcomm Snapdragon 8 Gen 3 platform.
> 
> The design is similar to a phone wihout the modem, the game control
> is handled via a standalone controller connected to a PCIe USB
> controller.
> 
> Display support will be added in a second time.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 1445 ++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm8650.dtsi               |    2 +-
>  drivers/gpu/drm/msm/dsi/dsi.c                      |    4 +-
>  4 files changed, 1449 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 6f34d5ed331c..1ba29755e5ba 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -313,6 +313,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-samsung-q5q.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-sony-xperia-yodo-pdx234.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-ayaneo-pocket-s2.dtb
>  
>  sm8650-hdk-display-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-display-card.dtbo
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> new file mode 100644
> index 000000000000..141d92933957
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> +
> +&i2c3 {

clock-frequency?

> +	status = "okay";
> +
> +	wcd_usbss: typec-mux@e {
> +		compatible = "qcom,wcd9395-usbss", "qcom,wcd9390-usbss";
> +		reg = <0xe>;
> +
> +		vdd-supply = <&vreg_l15b_1p8>;
> +		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
> +
> +		mode-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				wcd_usbss_sbu_mux: endpoint {
> +					remote-endpoint = <&pmic_glink_sbu>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				wcd_usbss_headset_out: endpoint {
> +					remote-endpoint = <&wcd_codec_headset_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c6 {

clock-frequency?

> +	status = "okay";
> +
> +	typec-mux@1c {
> +		compatible = "onnn,nb7vpq904m";
> +		reg = <0x1c>;
> +
> +		vcc-supply = <&vreg_l15b_1p8>;
> +
> +		retimer-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				redriver_ss_out: endpoint {
> +					remote-endpoint = <&pmic_glink_ss_in>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +
> +				redriver_ss_in: endpoint {
> +					remote-endpoint = <&usb_dp_qmpphy_out>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&iris {
> +	status = "okay";

With the default firmware?

> +&remoteproc_adsp {
> +	firmware-name = "qcom/sm8650/ayaneo/ps2/adsp.mbn",
> +			"qcom/sm8650/ayaneo/ps2/adsp_dtb.mbn";
> +
> +	status = "okay";
> +};
> +
> +&remoteproc_cdsp {
> +	firmware-name = "qcom/sm8650/ayaneo/ps2/cdsp.mbn",
> +			"qcom/sm8650/ayaneo/ps2/cdsp_dtb.mbn";

Is it fused?

> +
> +	status = "okay";
> +};
> +

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> index 07ae74851621..fcd5a1a45803 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -3917,7 +3917,7 @@ opp-32000000-4 {
>  				};
>  			};
>  
> -			pcie@0 {
> +			pcieport1: pcie@0 {
>  				device_type = "pci";
>  				reg = <0x0 0x0 0x0 0x0 0x0>;
>  				bus-range = <0x01 0xff>;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index d8bb40ef820e..0781dce7cda2 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c

Something stray

> @@ -43,12 +43,12 @@ static int dsi_get_phy(struct msm_dsi *msm_dsi)
>  	of_node_put(phy_node);
>  
>  	if (!phy_pdev) {
> -		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
> +		DRM_DEV_ERROR(&pdev->dev, "%s: 0 phy driver is not ready\n", __func__);
>  		return -EPROBE_DEFER;
>  	}
>  	if (!msm_dsi->phy) {
>  		put_device(&phy_pdev->dev);
> -		DRM_DEV_ERROR(&pdev->dev, "%s: phy driver is not ready\n", __func__);
> +		DRM_DEV_ERROR(&pdev->dev, "%s: 1 phy driver is not ready\n", __func__);
>  		return -EPROBE_DEFER;
>  	}
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
