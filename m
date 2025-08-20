Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCE6B2DAAB
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 13:16:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8104510E258;
	Wed, 20 Aug 2025 11:16:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jb4FCtHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A9F510E6F2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:16:42 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KA6aEM007306
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:16:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=1Z7Up3r+c9engU8+UCwkklUb
 n4iM1d7MoVv1XcE+/Bw=; b=Jb4FCtHgVzCuUKJ7WmuwSjJ+BngX6Y0KWaespDfZ
 /gUwh0yFRpcSznLyLx16ksxhAwNyF3cywKbX/XJTWQ9kpbrwYHpPU83ulp35TuvE
 RxJEzDzKBAKHKzI72rO/dBtvWfp2Q+nQjUt4DHnkK2iFeMVexC2w8sp9jC6nbpBT
 mRroLv2koSmJulBWEqR0FVSElttV8E+mLnJ/u6waK3bxBN8SkVc4SHASDNUUuE4r
 UdgzWo3uN5P0BMguUqiuPXJdIXmltNnxPxoF+zKGS2gAu1jfK3ytp/pyNu9qzZ3n
 LdIkCbrbaZDQcp56ERlYjMtRJvVX26D7aUfjwNZkzK3awQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5291g2x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:16:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70d7c7e9709so11052086d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 04:16:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755688601; x=1756293401;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1Z7Up3r+c9engU8+UCwkklUbn4iM1d7MoVv1XcE+/Bw=;
 b=lwqPV5j37I+oO6zhYEUVcNbOwn+UVFydmhUrKAtbgYaHa3f/gxUZkuTCrG6IENtvl0
 UKkbKt/iXl6e6iU76XdcRFQ4ELowobFBTjWUbtedhmZ6yTuDMSeRZHXTX9rK3oDUdOj5
 TKd08k6jzuLR2NlA5lJLk5FKnhe99+D3+UwzueuHuVBUD/FRbEldLJ8A7nsHxwUExw6l
 ZIvwpijsjMJaz8n658vRrgQ/V9/6u/OelrON3AJ2FfIWxxkm0Qo/vtX+g3hK1+wreM9Q
 I6TkxXYQ6ze/v4zLACvwvioLh1eo/3Eew77u21VDz4J3C7OvFTyxhQmJO6eo2GgBcXCE
 gY5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU6ppdVumDpts+fipFzQRfxTcaTihy0kLuc5TYGJ7LWxGn+XJH97OZ0qbNZNwKzHYHWrsKbQWs1E/Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzpnxQUp8sDPzUVBivDA3IIMhz8/9EI7aYnt3QALaZrVy/NAe1A
 WHCIUeZFLyt8thJ2sy8ftTP2wApP8tEO0DuvoBHI4BobNAYy/D+0QnYDnS+vbj4kd8lOvLmG+7K
 hNFF42zDk+VQl9KKJZKqCJDbka+0FGYp0md7WWlAGrRbzYuERcZrV1slEm5pFjE4i/KWQBi0=
X-Gm-Gg: ASbGnctfMqvcSfpgyyp5mSQMtTYDvnwxUolp6Lu+hLwVN24wnsmQQoCqogpmu3uwyec
 0lC8fb7+BfoYHky+dDarCbqp6pjCK4rDHUHKGj3mJZr1kxU1dXb1urdCwnbfF+oauC01T5OF1Fs
 xa89LbjoVpUKJLHW5KTxoNTR1kA7ylyNb4pv6u3huvd3K52Y7RcT0SO+zpaVR6K194a+XBqCcpn
 PDmGJMQ3PpMBeDF3hlyPrcU+3If9UvtJdvyR/xBUgrUBoRCk3glhH6LkjIOGD5C47Lj5GMCC73+
 QPxYRHS95ki62WPHogzkzuweb8bnRfiGNVYfOp7vfAtfyFughqkwQSNtIbUKGS24/TkHlXb7UJV
 d96sDjz+qaY9Zs4U9W86w4du1aowdRBHWjJWXjf908pZ/4dkQRBK8
X-Received: by 2002:a05:6214:d6a:b0:707:71d9:d6da with SMTP id
 6a1803df08f44-70d76f5be8emr25705306d6.10.1755688600587; 
 Wed, 20 Aug 2025 04:16:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGXo2tEhaFHWFMNzMyu5ebXhvONp13hFPzXhg1vzwJcxoRGG2jluk+k9PtM8oxn7Ws7nmt9rw==
X-Received: by 2002:a05:6214:d6a:b0:707:71d9:d6da with SMTP id
 6a1803df08f44-70d76f5be8emr25704406d6.10.1755688599895; 
 Wed, 20 Aug 2025 04:16:39 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55cef3515edsm2625261e87.20.2025.08.20.04.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 04:16:39 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:16:37 +0300
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
Subject: Re: [PATCH v3 08/14] phy: qcom: qmp-usbc: Add DP PHY configuration
 support for QCS615
Message-ID: <su3zkeepxaislh6q5ftqxp6uxsyg7usxmc5hkafw7yn2mgtqeu@wua72odmy7zp>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-8-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-8-a43bd25ec39c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Aui3HO9P c=1 sm=1 tr=0 ts=68a5ae99 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=2oAyx2JpwU0Ji29QuscA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: aUk38bOIBON42Sdi-tSTWQA35mEFfZ3O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfXxyXwgh1m0FHF
 OIduTvgTi3SxPbNkRxByVJYsC6/4j/Nn2WxVXzh9R8jWYaxI+GQIq3MLGqKvF6q7HD4+2n5EC1d
 Xjz11WW+ktCo1TrdwxOuUMLp6b+fF2K7o+w5nn4XQDOW1NIA8Mssgu9T/fXkgpZTxXFLXC6NPny
 GoE0miusV2h78aqcZFfQyOTLvrAba40IBwOb+yJs/W/b4qgUd9gcflISUgMIrABkEuOT6t3SFFe
 88tDt+dER2yJHeK/NM5SfOVVYfojRzJVNhzoBhdFkUlI7F0BrT5IRy+kV31LzaVqaPyhQIuFadS
 Eom1XYBnrNNXugjLXTm5dpsHRmkfcvxX356SLAKxvOYx3phrhKHBn1ZMlMFVMR6/ff2JXHM8gFu
 CLVg2YrzmW7vUi/jUiIbj0Xgy+QVSw==
X-Proofpoint-GUID: aUk38bOIBON42Sdi-tSTWQA35mEFfZ3O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2508110000
 definitions=main-2508200013
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

On Wed, Aug 20, 2025 at 05:34:50PM +0800, Xiangxu Yin wrote:
> Introduce DisplayPort PHY configuration routines for QCS615, including
> aux channel setup, lane control, voltage swing tuning, clock
> programming and calibration. These callbacks are registered via
> qmp_phy_cfg to enable DP mode on USB/DP switchable Type-C PHYs.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h |   1 +
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c   | 251 +++++++++++++++++++++++++++++
>  2 files changed, 252 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> index 0ebd405bcaf0cac8215550bfc9b226f30cc43a59..59885616405f878885d0837838a0bac1899fb69f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> @@ -25,6 +25,7 @@
>  #define QSERDES_DP_PHY_AUX_CFG7				0x03c
>  #define QSERDES_DP_PHY_AUX_CFG8				0x040
>  #define QSERDES_DP_PHY_AUX_CFG9				0x044
> +#define QSERDES_DP_PHY_VCO_DIV				0x068

This register changes between PHY versions, so you can not declare it here.

Otherwise LGTM.

>  
>  /* QSERDES COM_BIAS_EN_CLKBUFLR_EN bits */
>  # define QSERDES_V3_COM_BIAS_EN				0x0001

-- 
With best wishes
Dmitry
