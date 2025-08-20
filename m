Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D732BB2DB0F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 13:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408F110E00D;
	Wed, 20 Aug 2025 11:34:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCNU/iKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48FBE10E00D
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:34:09 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KAAu3l020839
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=XcNX4ZDYiBJ7hPbbX3QqeNKI
 VB3toybrjSkdSm9Gk44=; b=eCNU/iKnkqs2/ujRIBoZ3cftAZtZMetCNlRfqUcS
 WBDmgpb5vugP2hRdIcOiP+bTSMIgTQ47Ax+2hnGjqmlxM/13uTFqFs/SC4j6bA+J
 nLUx+pO3Uc6UG3QnR5IYcVJcJV+PHR8bBwBy/yZtefRJvcoU6zXuqUNNLD3JRKiW
 IrjKsYtFqMvvQ0AR2q0XNA0eggWzuVla2/gY0AsDXVP0L3PuEh73qMlD0vSSQuaw
 qRqQaF3gaZq9Qpm5dZRyy+roT3jMPAHnSjEYp5TYJC5ZeKCNgmOLkc0CVjTvUavU
 wc1/3eWdLpk7HpxWlfX2c3/sTguSODbFm9i/Upn9w6kotQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5291hra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 11:34:08 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-70a9f57ef93so133102186d6.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 04:34:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755689647; x=1756294447;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XcNX4ZDYiBJ7hPbbX3QqeNKIVB3toybrjSkdSm9Gk44=;
 b=ms2N3kctK2A1XrZaokXF+4Me+YD+IsvM2cDw3PRkd39QLKhBlMF+ZBwKEgyve6y1/A
 z+2htPwPzFOdf3k/wyGVKgyw8KEV3s6APEyTQz1VmIJ+jR/UeLj6RBtYei9PoBs0/im0
 pfUM6ddp114Sp2EoeY9lj4byfyxxscuMvHkluu3bnafrZAVM/61gbBq/Ds+wna1U3+lj
 0j97j8m6R1L1hM0/5qWdeMhqz4alYvtOBobzZxoSnE96pWr6FYttfzrsjhjvyQnGdZ4P
 1+yNw6QjXMc/7ZG/oKebKrFDzP9/JUDaS26aIwTtXv9va3j2jASLzoOvfqyRx0FNmQne
 7CPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz9XfhuGWS5VCtjNXlWVmvus3QAmAo4G7gSt3o+lNpOo+hGo1xIzgWLLH4VNZ9AMDYf8tWdgOyvnM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzs5GmzLaIBG+mO6ilLMnyLZ6IG3UD9iymcqG8pteTVpv2SOOOe
 LMUXf+4vaV74iTupvp/w77Tzz0X5QYT5xS4L61GOYYb9C5s5ymKWgqiL9idnKGzAReQ8Yx9C5zG
 x2a3N/9u1RRAhW6LCZTonNV2Yp4AMhKsWj7GD4wWs5g6lujLw/Ckxy/r2fboOMJLI5ZQDre0=
X-Gm-Gg: ASbGncvPECOKvgOod7IgogoyxchU6wX14r8CgvORKfifbQyBqSf2togkOvUPRP3brpL
 Q/W2E9iIWRcNfMSdgsOQtaC31Q3GAJ4uj0Ij8tOmH2wo1nPWVXQXpx1eBUT4BSzjxtF8NpPTCge
 MjDolo7oa4eRZ9Be5sYLuU4NTnaE3F0iCIv8+j4sH3KaOJQE8Cl32bWwiSNKBlABPsbeM2PQLAV
 d8CbWiC8+WSYHET0dSjM/lPCaEyJd1V9KnNbpJB3uaEKiYtBwrZl4MEddCDX2zk7wUdIgTe3IDY
 9sr+H6yg8AiLa1S2Z7To+mVtS8p2sVMsgWKDMZVcmfBDaS613NQVppYxNmmF2y517yrfHs4oori
 I27zuRRutVC51XcROMOxCSEctOjMnYXnvWdwuWQ7dFyYTthj0hflo
X-Received: by 2002:a05:6214:2467:b0:704:f952:18bb with SMTP id
 6a1803df08f44-70d771402c7mr20425556d6.46.1755689647343; 
 Wed, 20 Aug 2025 04:34:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKE0JSYrOpvMO2WcRrh53W2VDmbQ14HSNNSlF+so2tCr9GefhcpbJA6wUwasEOVbgwxfyTww==
X-Received: by 2002:a05:6214:2467:b0:704:f952:18bb with SMTP id
 6a1803df08f44-70d771402c7mr20425116d6.46.1755689646629; 
 Wed, 20 Aug 2025 04:34:06 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55e084e46b7sm233240e87.48.2025.08.20.04.34.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 04:34:05 -0700 (PDT)
Date: Wed, 20 Aug 2025 14:34:03 +0300
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
Subject: Re: [PATCH v3 04/14] phy: qcom: qmp-usbc: Add USBC PHY type enum
Message-ID: <cueyo7huj2m2yt46sjk3atfktft6y5slhhtslwmi44r7h7lxbn@5zvwxtdmk34t>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-4-a43bd25ec39c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-add-displayport-support-for-qcs615-platform-v3-4-a43bd25ec39c@oss.qualcomm.com>
X-Proofpoint-GUID: XvoIdurZvdeTQecWBI-vkQIPudYRNde6
X-Proofpoint-ORIG-GUID: XvoIdurZvdeTQecWBI-vkQIPudYRNde6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX9kGes9YySDPM
 fvMPpM5PkYzZy9/GUmzqRKQLjGiEjxPpNoBR13tw8sBl5C9nD/jyVPiErHFh8K5oo17USxXf40Q
 wGjBIkqPh1+AXNEsgflPI3GVjNoSjRoEwO0EtmazbJwgwvjYldmgN/rL4RTGyY/Uvv9Odo0i/8e
 akfK1BVpgQAKFpp/46aipjhWrR+kwY9zB1Q62q2KD59z5S85ncX+airnPKau/XgE1N/izEi8FfJ
 L2XPjOCb1q1/LF/lahrXGO+sfyFC/kA1TmbBAGOe8EjPTYLQ4sPQHbWz3jU3T2pYGHvlHMOMkED
 1F5FzVX3mZvNmlEYWlszd4PanjQrkKmdK5Lm7sucAYHXmtdRY+w1UivU3brTuRYrhkvEwVvNMB0
 iFMAdRzEkXrWh7tnf+F5sPmUWvO4jw==
X-Authority-Analysis: v=2.4 cv=SPkblOvH c=1 sm=1 tr=0 ts=68a5b2b0 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=LJgbN-Jd--P93uwsTkIA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_03,2025-08-20_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
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

On Wed, Aug 20, 2025 at 05:34:46PM +0800, Xiangxu Yin wrote:
> Introduce qmp_phy_usbc_type enum and a 'type' field in qmp_phy_cfg to
> differentiate between USB-only PHYs and USB/DP switchable PHYs.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> index e484caec2be20121cfe287c507b17af28fb9f211..5afe090b546977a11265bbffa7c355feb8c72dfa 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-usbc.c
> @@ -284,6 +284,11 @@ static const struct qmp_phy_init_tbl qcm2290_usb3_pcs_tbl[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V3_PCS_RX_SIGDET_LVL, 0x88),
>  };
>  
> +enum qmp_phy_usbc_type {
> +	QMP_PHY_USBC_USB3_ONLY,
> +	QMP_PHY_USBC_USB3_DP,

Drop, you can use presense of DP offsets in order to differentiate
between USB3 and USB3+DP.

> +};
> +
>  struct qmp_usbc_offsets {
>  	u16 serdes;
>  	u16 pcs;

-- 
With best wishes
Dmitry
