Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ECtSDmyPrWnH4QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 16:02:04 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FBC230D1F
	for <lists+dri-devel@lfdr.de>; Sun, 08 Mar 2026 16:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEDB10E16A;
	Sun,  8 Mar 2026 15:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o+aD/xbb";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T2j49u7y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB1D010E16A
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2026 15:01:58 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6289FA2i2752520
 for <dri-devel@lists.freedesktop.org>; Sun, 8 Mar 2026 15:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=BwabE/ZDUGVLXR5B0ijRMwfR
 m6xlXcpiu0L9ARNRamc=; b=o+aD/xbbiF4bgwIqiKNgkFdNK4W2eGuccsale8Kg
 igvwigaKcX9zTQywkK+vPvTIVd7mycp+/f6uldTYsaOQDwhwNL8MivVT7ZhZQCsz
 gT9+kAGGpknEbKiDz2EQn+ujTEQ6/U9i/rAvZyPn3ou7wD7hOQyZvjWVD6/ielPz
 qn3ObNUl08WmqGYF6qvlx4gqjSaD3Q/i9pzptxXs0W4ofL9oouFbd7pLA4ntTaqR
 6i/ypu4AngKIX39/D1MT58Eo8AiN0lZo9NiJS63QhqajfFaxmwL8idW2ugjcE2qA
 pUCHsrKJ3yR3cpzSNB5EO7gC5bzFTPh/321VgKzQnn8xsg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crc3vanus-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 15:01:57 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-9483e4a8662so14971009241.3
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2026 08:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772982117; x=1773586917;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=BwabE/ZDUGVLXR5B0ijRMwfRm6xlXcpiu0L9ARNRamc=;
 b=T2j49u7ye6quQlXEJyflCQ2V6TOn/qoLZBSiDT3jjoGxWswaD50QhPWuV4r/qFU3Dx
 1cBGe4Ww0rNxCLWCMRpy86Y7D7jTvdTNgo8kLyG1jQw/lWhmbLWRBiLPBTPI++pL0N45
 6TOLs1dFQ9YlaO16HdHQtrl987XnaCDj4lKbXmN3OJPc6u252tYOBgq8Dr256a32Yard
 sXCYFcAFRFk+cYDh1fzt49QV4MW8jwq/pB9mcbZcCAbMWodoUKakJpioMQbr7oSyuH4k
 wlTmYg1OBR1Yd2VNLMYSkYzSMhT+gPOTPodTxsttvlx0DRwML9mI1ZWZCbStHJp3WurI
 Kmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772982117; x=1773586917;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BwabE/ZDUGVLXR5B0ijRMwfRm6xlXcpiu0L9ARNRamc=;
 b=VpgpAFKheu6kgcRmmXKMm/X/arZkPS0qNSsosIWYR26D5U6M315rUKXqKl9ih9rXDw
 vrtk+LKmnrjW8FpIslBLBMxJBqqkvwBZ3A1kREvK2k3pgg8QVTnrWpzvjS8mxPnaPxFu
 rXNPpDSH09RA0HLiv/RzKecIntMbq2G9jCHYMNViG9mpvBEiKERCjmLO+5CbMFn9ZBOA
 S0pKM3LKKP3W2W6SZY8b9vvQhWTMB45BerJdmQkpDXPl7eveuuVyD/F5i5ko8yvWGLrp
 TM39bkkAmmHCj/9a5EFwnUwRd0Gb9XcyAUZyaYyZ1S1+rm8XMrIX2MgAc1dq0+RWBKH2
 6lAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYe7wjweUhT6HY4/YuvUK6Z4wJKMV4dvFlN7+o55tslIkqIKsP59PbfoyM9E3r9DrnXR2mtSObYHg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuP7mNR7eNxWu/IqpK/+3YUibdYkw5l73IANE+ocCdpRGWpvtX
 aCIlwupL6hVPFU/5RwKKMVyDKaajGOgwTKR5tI73Eu4qxtolpWurDIG+xCOlFNYq/IK6t0nykVY
 YR5Lqs1L9C1zyWiNWrqc+IeeSSv31CU18LOqzqDNbBU7A34IfURgoomvGo1yWcj2I1X4r9FI=
X-Gm-Gg: ATEYQzw6RZVjyp6vTrWee6sjOr9GT6r1Xl0kyuDeOJI0Cg+2LWncvBLUTCR+QZ/7eBG
 XL21C1W+U/jiLbfbDSd+bMrC5UJg2IMmWjWiOXzH5ZI8Ikp/GHWUQVnDyHRrTMcyJKkR1r8D8js
 TnH8aJk6L2BCOdnBSsH1WH7d2gA3xW6MSeTeSCwJ++7xmBLmgoEp482wUacow6Hi2CuXpjKRm26
 bNbMbjtjllESnR7c/t0psg2zNixJ0UHOPyNfZZR+0yFYhdDCLy+Nm4/B8bm1lDpQesueK8q2Twz
 uo+cxseMuS/VUENFs4LWNgrshknM9HtTI/y9XPSRkHUOUJUzJz3K9p4qESKuTdt4xKRDxmN9+U9
 Akx6q1IwW6cP0MqX5vg8Rh4FlLWEsuGqWoshW5Fw9y9P4bUi7a7NV5tbtNQf6PatTWxKrS7U6RT
 XVk+vJU9e2ckJLOz+9zbDAbou6xeWCTHJxDyU=
X-Received: by 2002:a05:6122:4f87:b0:56a:eb30:4e77 with SMTP id
 71dfb90a1353d-56b07f721c3mr3178783e0c.19.1772982116969; 
 Sun, 08 Mar 2026 08:01:56 -0700 (PDT)
X-Received: by 2002:a05:6122:4f87:b0:56a:eb30:4e77 with SMTP id
 71dfb90a1353d-56b07f721c3mr3178693e0c.19.1772982115811; 
 Sun, 08 Mar 2026 08:01:55 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a13d033ab4sm1503815e87.33.2026.03.08.08.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 08:01:53 -0700 (PDT)
Date: Sun, 8 Mar 2026 17:01:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: cristian_ci@protonmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
Subject: Re: [PATCH 3/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 display and GPU
Message-ID: <ne3i5tmvperssm4pivae7jhmqzvyy7ftkwnacpaf4ukdqojtha@53mhrxlraw3k>
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-3-aa2c330572c0@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308-rimob-new-features-v1-3-aa2c330572c0@protonmail.com>
X-Proofpoint-ORIG-GUID: tDAvf3exJJenrFRLUOoE-l-SR5-ErJLs
X-Proofpoint-GUID: tDAvf3exJJenrFRLUOoE-l-SR5-ErJLs
X-Authority-Analysis: v=2.4 cv=OOQqHCaB c=1 sm=1 tr=0 ts=69ad8f65 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=sfOm8-O8AAAA:8
 a=QiVCaVSgwpAuPVqWOeAA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA4MDEzOCBTYWx0ZWRfX9Pa5m4aTbcFQ
 OJUMQuMVPUyp0lbAn0I6umO0urq9wL+k68/OUCWk678BmSb5IB1CmfaXKQ1XTlWJv68iHU39+Xo
 ZAaWU3r2yzgdL5Izq0d9mbEoB63OLGrFGblln7YsoECHIrdt8x3oyXXMGH8HW8FIl60PIVB1Gkm
 95qgeppkKHEw5reURa1W65rJHWlUSFfc0m37xtUJJCF6VK5X5XYWmYRPJR4BD70aCXz5mP2w4NZ
 ib7+CWSMwkiFr9JAny2QKbcqJmMWXLQOy8das802TWht+iEj76RBIdCH50/GaUE0uDZC9FoJ7mH
 NMpcZLJ5gyn/AUjdQ+fTkm8a+Mf+/Ulg2n1O5pYuqJyZBOwvJTcBHQcpVpFETR3fUpO2CErD8f+
 vP7kO4Seti12DJEzjjvpN0Yw20R47fmmfcSskBUooY/3ZQsz6TZy1DrZGGHHogtDFNEgbTsX2nC
 Z4HZhomoGEnT+QGlOiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-08_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603080138
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
X-Rspamd-Queue-Id: 96FBC230D1F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,lists.freedesktop.org,vger.kernel.org,lists.sr.ht];
	FORGED_RECIPIENTS(0.00)[m:cristian_ci@protonmail.com,m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[protonmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,protonmail.com:email]
X-Rspamd-Action: no action

On Sun, Mar 08, 2026 at 04:52:43PM +0100, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> Add the description for the display panel found on this phone.
> And with this done we can also enable the GPU and set the zap shader
> firmware path.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 80 ++++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&pm8953_s3>;
> +	vddio-supply = <&pm8953_l6>;
> +
> +	pinctrl-0 = <&mdss_default>;
> +	pinctrl-1 = <&mdss_sleep>;
> +	pinctrl-names = "default", "sleep";

It might be better to move pinctrl nodes to the panel device, because
they control the panel reset pin (rather than some kind if DSI-related
pin).

Other than that LGTM.

> +
> +	status = "okay";
> +
> +	panel: panel@0 {
> +		compatible = "novatek,nt35532";
> +		reg = <0>;
> +
> +		backlight = <&pmi8950_wled>;
> +		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
> +		vsp-supply = <&lab>;
> +		vsn-supply = <&ibb>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +

-- 
With best wishes
Dmitry
