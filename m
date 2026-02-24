Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOTNFiIRnWkGMwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:46:58 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1F7181189
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 03:46:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7388510E487;
	Tue, 24 Feb 2026 02:46:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iOHg+c25";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OnEAX8ns";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4AC710E487
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 02:46:52 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 61NI0G0q3732653
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 02:46:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KKvDDeqz+mNOB5u9/ZS3tcm3iKJq9M5SZJMjlZE1ub4=; b=iOHg+c25+5djRIqJ
 XGV9nWkpGpWGQPQbjDJW5LBWS3k3RYhB0iralmu44PhSuERAWVaN02ZJ6KJ0ErAU
 bLYr9wNktRf3vHUZnNPt+rkfEip2o/2LcEwzRc1TjQ9aerEayBJsIvE9pzgm787a
 EX0KLSyKUmJ+4MffxPUHvY4kBDFGOqyO1gA5BNCXpWORkrxGXbsghKsqDJPw4Tm5
 sVGkJB1zzGLqbgtkprwl50NUXJyn64mRXuXVZsu4imuPLLwr5m7gHGss+sk19q4V
 kfZp5xPugFHNfGZ13f+FW+fyVHbb0lrfOnmnTGNdUV7b/I9ivuDdi9vC4jTSes0B
 0iZDVQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7takvk-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 02:46:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8cb3ff05c73so4595913185a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 18:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1771901211; x=1772506011;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KKvDDeqz+mNOB5u9/ZS3tcm3iKJq9M5SZJMjlZE1ub4=;
 b=OnEAX8ns+nLJg73eIibp8iewMBO+04jFqBtvrh2PKSaD8VBBT5PJl9V++nA8xVqAcz
 rG65MAibxGVnwo78BGFi1jg65uzjKFok7PXPwEMxVDuIs33lJVVt4Vt6qQfGtCiYRpPl
 3aNdh9zEnw0mMgepG67JNGGzEPWeKcZVbTI3mhqkicSgA7tvxGdIYxZ1JNNJtS3AkayN
 GQKq5WkmdW2qLDKijapRhr3f5J8s90+c/ZqjCnMpnDWsaPg8wz14R1be4h617xYMjK7y
 w91fJyK7V1V6HeiwCsbkh3wjG1MWlE+7waE423dz00J3m3zQjah8qjxncBJTTPZ5Xcyk
 YI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771901211; x=1772506011;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KKvDDeqz+mNOB5u9/ZS3tcm3iKJq9M5SZJMjlZE1ub4=;
 b=N1+QzgDM3pi8ImVnnYNImQitRwPKGxLL7pTtyPQfhWCfmA1DCcQu0Lr8wKTl9hrNVO
 TTE8Ddlb9BZRPfn1zBm3AHdTByKPxCcCJ0t2Z4//bmfBb2m5zoODL6pFJywDDxMID3d3
 AoOL45tmQ9whmkaQtPmzhy7FLdhr/Aep/mK9QMYpxPsTmNkRUBrzciWuIb8koPlhaZLJ
 QMMczbeVQJTReBHD+cDq5IF1/vp0/VKRGzDZTJMABQJr/yU7R9ICI1holXx4nI21aaGT
 f1gbbQE8wedmcIZ2cmSAF3L3o876tTCCUaXCYY5FQ5JHzbb0MtfydkfBgAOtLrekPLAE
 O3rg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT4k2EX7cMGaPEjua9Oql8axcLvAZjB9hYiebz8PLoGOC5kW6goNkbcyUiDLbh96WsmEueBvoHmmg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4IyGLcV3FMtL/rQpS09oZHQ7HdS1ZZOHYUR5eR2w0sECE9Lm0
 2jfYCGH3QXMzisBFTeeyQyHWOLliXWuPhmd/0ZQz110DmljX/PoPptUkJmi10ihAUwskpqQ3O9o
 WVrqzCN0Gb+ZUZk/SQN9BZLYbMazlmfzoMrPbPTkILMhPY2A0VPd7qseg7DmNdEbQ5luKi0M=
X-Gm-Gg: AZuq6aJgyg+BTYeN/1UffWvmvvi80VkmfryPj8JRHI6++eBPJoSSaOWmChQpqBkqlHa
 qKm0yp9aKtXScjolJENSBv0agFtyF/n3NHq2BX8OZKiEs+/gqTD7HzDDBUTqlXajDm/prZlBi3O
 +nHCYw9+0NdpXA+e8RfCGwQ3LZTMq4GaHfEC/lxG3czbg6inza5WgAdJzcX0zLkoAVM9X5Iqqy5
 LqbNlNYz+tLmFJCphXm27qwk0n5p+Vr739Ms91o17DyXSYwcHGem/bPysI5b2LGtn3S9zKyCDDQ
 RDW2MvOK5BEsjIPsNru4RlbpiA3fpq+3Al4CDEmKUVdqW+t6vBiRdmJHwYJJesWVWIgHqvFvuX/
 joQGVhaiKijFA6/fa7r1Ng2mPEvX5pYjAnKSLJHNmmkObsJ1OkBGCCTtOglIJOeT5bT7WALKokx
 ft2ayYBStlpkQze6NSDV0lXuM2u7ty+sZ5+uQ=
X-Received: by 2002:a05:620a:4891:b0:8c9:fb65:7f0d with SMTP id
 af79cd13be357-8cb8ca033cdmr1325733185a.28.1771901211132; 
 Mon, 23 Feb 2026 18:46:51 -0800 (PST)
X-Received: by 2002:a05:620a:4891:b0:8c9:fb65:7f0d with SMTP id
 af79cd13be357-8cb8ca033cdmr1325730185a.28.1771901210619; 
 Mon, 23 Feb 2026 18:46:50 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-389a7b02490sm18350771fa.45.2026.02.23.18.46.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 18:46:48 -0800 (PST)
Date: Tue, 24 Feb 2026 04:46:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yedaya Katsman <yedaya.ka@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kamil =?utf-8?B?R2/FgmRh?= <kamil.golda@protonmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm6125-xiaomi-laurel-sprout:
 Enable MDSS and add panel
Message-ID: <dko7l6iage7blup4zbpsm32d2elvxpengqwbzcsv4v4zedjmpb@rsdrb77acgme>
References: <20260223-panel-patches-v1-0-7756209477f9@gmail.com>
 <20260223-panel-patches-v1-3-7756209477f9@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223-panel-patches-v1-3-7756209477f9@gmail.com>
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699d111b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=sfOm8-O8AAAA:8
 a=pGLkceISAAAA:8 a=FNN4Il8BKJnmybe0k9EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: -dB2uycWzPgR4aGXAuizNs15fKhnpixi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDAyMiBTYWx0ZWRfX1bSDRODEPP69
 MeHabyxoTJadkUofu3HpPVkfrPJDDRweVcuHP0OSnYXc68fiHgpHC264xfCx2i9dbziO4wXlt+1
 DXeCW2cREs/ArAkeRWz1Xg5kfHk2oFmAURDz+/ZwPsN3pPLtNfNreKYOmhzCqkInrYeEbShn4BC
 k+E8+MiaOesyxPAYi+KuhYl7zjYUBpoPjHWaEcJPoUskQtOIv4+rHq8Z1SmYgk053aOLc9e32/5
 PtRLp02+/67ujmyYMocHOY60ckwWU9VsjC34zXq8e5NORFL/0ctAD0kO22iir6vYj17zNyZzIdU
 7wCMZ9ZAaASqfoeV0fKKleuJHOc4bHTwg6rOeYVmvPotorneEm97CrqnIPjpjRaBq6XMboCHthw
 NxcbfmAeogf+biE67sln0kSHDeJRkZZn8KZM54Csdqauq5rm7VGWkN/vXGG6GN7cnAhkTSyHmPx
 ni2ROgKcyD24MlnI2PA==
X-Proofpoint-ORIG-GUID: -dB2uycWzPgR4aGXAuizNs15fKhnpixi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240022
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:yedaya.ka@gmail.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:yedayaka@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com,lists.sr.ht,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,protonmail.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AF1F7181189
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 04:24:04PM +0200, Yedaya Katsman wrote:
> Enable the MDSS nodes and add supplies and bindings for the Samsung
> S6E8FCO panel.
> 
> The ldo and iovcc pins boot up with a current of 16 mA, but they work
> fine with 2mA, so I used that.
> 
> Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
> Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
> ---
>  .../boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts  | 94 ++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> index 994fb0412fcbdf5466f87a325c48b697a37b514b..10fd01143a644004b807fc455d2235f8e6a9737a 100644
> --- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-laurel-sprout.dts
> @@ -82,6 +82,32 @@ key-volume-up {
>  		};
>  	};
>  
> +	panel_ldo_supply: panel-ldo-supply {

regulator-foo-bar-baz

> +		compatible = "regulator-fixed";
> +		regulator-name = "panel_ldo_supply";

Is it an actual name (e.g. from schematics)?

> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +
> +		enable-active-high;
> +		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&panel_ldo_en>;
> +		pinctrl-names = "default";
> +	};
> +
> +	panel_iovcc_supply: panel-iovcc-supply {
> +		compatible = "regulator-fixed";
> +		regulator-name = "panel_iovcc_supply";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-boot-on;
> +
> +		enable-active-high;
> +		gpio = <&tlmm 124 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&panel_iovcc_en>;
> +		pinctrl-names = "default";
> +	};
> +
>  	thermal-zones {
>  		rf-pa0-thermal {
>  			thermal-sensors = <&pm6125_adc_tm 0>;
> @@ -128,6 +154,46 @@ &hsusb_phy1 {
>  	status = "okay";
>  };
>  
> +&mdss {
> +	status = "okay";
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l18a>;
> +
> +	pinctrl-0 = <&mdss_default>;
> +	pinctrl-1 = <&mdss_sleep>;
> +	pinctrl-names = "default", "sleep";
> +
> +	status = "okay";
> +
> +	panel@0 {
> +		compatible = "samsung,s6e8fco";
> +		reg = <0>;
> +
> +		vddio-supply = <&vreg_l9a>;
> +		ldo-supply = <&panel_ldo_supply>;
> +		iovcc-supply = <&panel_iovcc_supply>;
> +		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&panel_in>;
> +};
> +
> +
> +&mdss_dsi0_phy {
> +	status = "okay";

Missing vdds-supply.

> +};
> +
>  &pm6125_adc {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&camera_flash_therm &emmc_ufs_therm>;
> @@ -387,6 +453,34 @@ &sdhc_2 {
>  
>  &tlmm {
>  	gpio-reserved-ranges = <22 2>, <28 6>;
> +
> +	panel_ldo_en: panel-ldo-default-state {
> +		pins = "gpio26";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	mdss_default: mdss-default-state {
> +		pins = "gpio90";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	mdss_sleep: mdss-sleep-state {
> +		pins = "gpio90";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	panel_iovcc_en: panel-iovcc-default-state {
> +		pins = "gpio124";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
>  };
>  
>  &ufs_mem_hc {
> 
> -- 
> 2.53.0
> 

-- 
With best wishes
Dmitry
