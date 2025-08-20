Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4533EB2DB8F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 13:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A575010E70A;
	Wed, 20 Aug 2025 11:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fj0EFRd6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5400110E70A
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:47:30 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KADVhJ027085
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=dFc4IH/0HHEYW2zGgPx9oUd1
 ai5FCg3dSwI1TYF3zRA=; b=fj0EFRd64mA+29oBybgkCVSDClAeX2cpVe/JJ+lY
 ybKS2lKptFDXF+W36AaL8Z/4b8ujhEqHlvJFA+8BwmoEUvFU6ugNCOOBqE4Gk9tZ
 LaV+nX6UBN6e56o3l2QkykgRXIUeFRM+qQhrLlWnUaSmM06ehbpCitK700fj4/Ob
 bkNueSH5OJ4ulXd/qK7JQqPRjPc2dFhKavJAUf65g2r5wIt4zCHyT2xFQ4MzrRMI
 0B/r0m64I02uycCk0vw0p8rTbIFURSFW50OGz/IJSamZkA43D+SsQ/6OJyr4a222
 Jgt0i10jklvZUdAPxPJxpbRoB+b0h88g5COwO949pR8ksw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n52a9kp7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:47:29 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a9f57f950so135803496d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 04:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755690448; x=1756295248;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dFc4IH/0HHEYW2zGgPx9oUd1ai5FCg3dSwI1TYF3zRA=;
 b=lfeHGW0PUDsPG9cCSCuy3ARC+uf4X131K4p83A/2pK9owFlF0KH3uQ0cB59xhjYQ6y
 /5Ka0fJesQXSJyhlJu3hjPVybRxxWGDdowkYuPYkYNUtFJrR03PSFYRK4uPEABD1ParL
 ftPyWq2fSMz90W6F+olUa+KmZfjd/fyVDBUPrsEBnNhzH9sJBSJC2yz5usVYyrIJC+Jw
 ER8bB7tjY6gMAwNJi5sAs70zQNYrERJyQKUI5P/AmcN6G1cT2ZnC2eE/A39V31YdkqHD
 G2E8RjhjdluN8XyPf3RG7udtLLtWhlgYrqpuzWuGnIGvo9s4QxzewtHnnQoK+5IKjXuc
 OPdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmIDjW2mSiERp0Vc+XF3+P4gqRxIt0NPUwoank+6WtDsCRH7qMjMnMcpc9MJd2tUJTrDWCMkde19I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzA0tq2JRDmsE7ZqTcvtwsqzhv7jpft9TOeuhDy0Fb+rxSNEOkg
 fwfdkFOQPWvsk9CAbDHS0qu/IMz9pmqzqxxAhDW6LLFqUSfrSJwDEMrw8GbhdPB7V4m4CvooDnP
 V3TLCzUVbeMjDdF9By/al1ICDiKL6JS3i0MAMuVrECeSSyUZtxgAFfDUxC/F32XOzT17jkT8=
X-Gm-Gg: ASbGncuBD1bG6g+DHMoN0V2RSnw21A3i+r5Vs5eU3b+ZEGd166CZimiP3iHknDeS7xX
 c3VcUN/qQuXzXdISrm/zkoIoTj4/01svJU/aeX8UAek4k5cPRgYYRvP4I4SfogPGWqRgKMs+gL2
 5/I5Ceor1FqcgCzfKhQtYQmMeyWAOxS84yIvYza8BxqJMIqlSaOTCVJnGhrSFe/OomPYJgZgov0
 NRqpWCChUkyxIdrgtuVCXVIp8vmDVOj/A9NtdXfBlpgLLJU9+6msKgNVQtkhypitfM8DtioCCsD
 2LWuNQ+1ymP1+JdNZRaNUp+nQQmKXhY05oRPX73q9quKx5GOFON5UryZPq+n0g+KJTZiMCW+/bR
 yThddf/wLCx5Hetjawvm/Zwm5yG5U20Qs5AH1vCjrGebUpcZD9iDh
X-Received: by 2002:a05:6214:e69:b0:70a:3792:71b3 with SMTP id
 6a1803df08f44-70d76f870a8mr26796646d6.8.1755690448148; 
 Wed, 20 Aug 2025 04:47:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/gakNMa/QxtXVM6Q3T3hNzkLDxmdNOzWdZVhhKTGdYxa2vtoe8JOEwhpP+CZNBh6RpUnOkg==
X-Received: by 2002:a05:6214:e69:b0:70a:3792:71b3 with SMTP id
 6a1803df08f44-70d76f870a8mr26796116d6.8.1755690447455; 
 Wed, 20 Aug 2025 04:47:27 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3519d8sm2573833e87.11.2025.08.20.04.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 04:47:26 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:47:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, fange.zhang@oss.qualcomm.com,
 yongxing.mou@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, quic_lliu6@quicinc.com
Subject: Re: [PATCH v3 05/14] phy: qcom: qmp-usbc: Add DP-related fields for
 USB/DP switchable PHY
Message-ID: <7b6utbnibia767bp55vhvg6ghdavb66ubdpabyguohuwtmz3mp@unvm36jttota>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-5-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-5-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 07dzJULTJqOxSS9OeZtXECvWY2ZObAgW
X-Authority-Analysis: v=2.4 cv=B83gEOtM c=1 sm=1 tr=0 ts=68a5b5d1 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=tpX6aX9aePfZnGUoeJ0A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 07dzJULTJqOxSS9OeZtXECvWY2ZObAgW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXzsC6K8gl/ypQ
 Hm0fUaOrT44fhypRG1jC59tAhUk13DF+8BvUaHMtiFyaVvfxCJE3NDktpyzqbAl6o6J0iv798/f
 81r7tHNRNH8+jGGxTMUbL7dUwzls8AAwvQyxQN7T0gY42KBjq8jpfb8vOKmalSnH6Cvm9WO/8CF
 FZ0VOWTV0lIyqPnPuLtK1SxGQbwsyu9KHi9WAXnrrST9XvBnUMBDxfx0lJY0y4BzNF1u2AR6SvN
 27yuB30R1ePT6jhI7QBMvvhPlut0xpjSNbTJ1agM8HyjUHD+3aCJbQvv8os/AfyFSMpcUxQm1cJ
 pW/9UYykS+lrCY5VPj99QGKGdI/bURVXZW03ZjbtcmQ8rAl3++u43XyUapNlUTFHRssNMFwEyPM
 qV5jUrwMp/ODWPO1cEyl+a8XMvV//g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013
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

On Wed, Aug 20, 2025 at 05:34:47PM +0800, Xiangxu Yin wrote:
> Extend qmp_usbc_offsets and qmp_phy_cfg with DP-specific fields,
> including register offsets, init tables, and callback hooks. Also
> update qmp_usbc struct to track DP-related resources and state.
> This enables support for USB/DP switchable Type-C PHYs that operate
> in either mode.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 73 ++++++++++++++++++++++++--------
>  1 file changed, 55 insertions(+), 18 deletions(-)
> 
>  
> +	struct regmap *tcsr_map;
> +	u32 vls_clamp_reg;
> +	u32 dp_phy_mode_reg;
> +
>  	struct mutex phy_mutex;
>  
> +	struct phy *usb_phy;

Should be a part of the previous patch.

>  	enum phy_mode mode;
>  	unsigned int usb_init_count;
>  
> -	struct phy *phy;

Similarly.

> -
> -	struct clk_fixed_rate pipe_clk_fixed;
> +	struct phy *dp_phy;
> +	unsigned int dp_aux_cfg;
> +	struct phy_configure_opts_dp dp_opts;
> +	unsigned int dp_init_count;
>  
>  	struct typec_switch_dev *sw;
>  	enum typec_orientation orientation;
> @@ -874,11 +911,11 @@ static int qmp_usbc_typec_switch_set(struct typec_switch_dev *sw,
>  	qmp->orientation = orientation;
>  
>  	if (qmp->usb_init_count) {
> -		qmp_usbc_usb_power_off(qmp->phy);
> -		qmp_usbc_com_exit(qmp->phy);
> +		qmp_usbc_usb_power_off(qmp->usb_phy);
> +		qmp_usbc_com_exit(qmp->usb_phy);
>  
> -		qmp_usbc_com_init(qmp->phy);
> -		qmp_usbc_usb_power_on(qmp->phy);
> +		qmp_usbc_com_init(qmp->usb_phy);
> +		qmp_usbc_usb_power_on(qmp->usb_phy);

and these.

>  	}
>  
>  	mutex_unlock(&qmp->phy_mutex);
> @@ -1106,14 +1143,14 @@ static int qmp_usbc_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_node_put;
>  
> -	qmp->phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
> -	if (IS_ERR(qmp->phy)) {
> -		ret = PTR_ERR(qmp->phy);
> +	qmp->usb_phy = devm_phy_create(dev, np, &qmp_usbc_usb_phy_ops);
> +	if (IS_ERR(qmp->usb_phy)) {
> +		ret = PTR_ERR(qmp->usb_phy);
>  		dev_err(dev, "failed to create PHY: %d\n", ret);
>  		goto err_node_put;
>  	}
>  
> -	phy_set_drvdata(qmp->phy, qmp);
> +	phy_set_drvdata(qmp->usb_phy, qmp);
>  
>  	of_node_put(np);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
