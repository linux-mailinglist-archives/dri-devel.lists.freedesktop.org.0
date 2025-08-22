Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 623A7B314C8
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 12:09:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C716D10E0C8;
	Fri, 22 Aug 2025 10:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aRLhTNmw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EFEB10E08B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 10:09:17 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57M8UQ2V006312
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 10:09:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /CUwk5QH1ZSt+M+5NuLxUaiWmoXIPaE8loSJYuZG5tk=; b=aRLhTNmwMlgE6JQe
 tWwNf2M2oC4oojXabs2KKGwrhhStri5fyzPV+aU3lhp7Jbi3ypNE+l6O+n77w+Tp
 2+SNiqs/0+tfPliih6suw9tHpp0ffs+9zMvXNPDnj13DW/s9SKKdCdxxzOJF/6Cd
 2+pirkH5OE53jNtRqWAYvIT1QB/WQS/5kyUqK+EvwumVYk4v3hTDqjc62miMMSj0
 4B14/XgwMenyqdYSqstlznouGEBuD2xxAJJ9JnOfdMzbsleFWKK2Nn9Ue5BS1F8s
 y7j3e5mNRCzD09dwMDo+M9AcSE5/u8Ow4n4rCDWtFLgLegNNY5i3RDJyrHH0ucW+
 tyuQBg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5290tfk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 10:09:16 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70d903d04dbso29934006d6.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 03:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755857356; x=1756462156;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/CUwk5QH1ZSt+M+5NuLxUaiWmoXIPaE8loSJYuZG5tk=;
 b=njTZILIs4jvNNUgF2qcoVLeEuMNve3yDfSrU2N5vIRiwT2hVht8juA0y91nIiMrdxF
 +qJC2YcAUaT9PIdDSoIpZVxcmv6skt6pP1jrKBvN5ny7/7WUWeZUKOEl48aHlAS+eUOl
 jOFjXM2aTqCn1OluS+khFNfNFkxHADODNimSq3FBDPhHX4gst608OUKfBGigObrnC/w7
 xnRIpRDYk7vfnwsGiia4lYC4pCfi7qXo/guV4nadQM1iy9LnE2reWCwq/h/TK19daysf
 IXfjls4ZHK9bvLXpTcm/d8HTJ5kCcrr5O5+B1r4K4+PKLdfW7322Se+2iOyBqC5lzMsA
 uRIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMomgnJbuCPoGKv2WMp+INZcHyu8ynaW9q8bWFb7pKNhJiiMAeuU7jnIPJNgOCSZJuUBWtoDWdMes=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzIxM8+ty0JL1OwFNTHlR5299O8jiVK5XePuu9Xx6Uf7SOFUWsy
 j39RaCC4nbJtu5OvCBpe2C7bJ5qYD1bnNhR6C+ZYw1wjWdAT452QHUecf6JFENCtETdZyueyMtZ
 PSttyIwTe5K4aTHCVq08R1C+4dBvQKdOkVlnGNwHiICo5zu/ddypoKkkVPYH6rVHf0Q9Z43I=
X-Gm-Gg: ASbGncsf0p37GxDrUcK6cJSMVHfg5d4PEPZ9oJwinDYJvPR1w26JZKgXieU4xP5eOvD
 q3bJ9DpvA/TNcAChaBmSxEGKYmtQl8rGUUeV4fk4yu2ybbFiDV9zG22Ut+uSH+1GnR6o6qf2tzW
 EfwSIWHMd6YtHQyG8T1vJnYfdxfiOBR/PHpsFMIhephP98vT2pi/2IerShhbAMcaPU+gZsi/CGF
 u85qDdjLrSj5hbB6yPf8GWAtb6YX/j1DgjBLIiPdP9AZyh8qCjs5vY5iD3IG7zDITpf6J5b+jch
 vPYpjemhv004nwbH2o02fUEt4gkCIMjZM2VGABkxR5d39N76ODMytJ73QRCVKQ+suVOF6BfxJkK
 rHNdYfMoG6MrEp3L7LbkJmWcfwBsH+gwgOwuaY6Zxw1EjJbCa4xE2
X-Received: by 2002:ad4:4ee2:0:b0:709:d518:74fe with SMTP id
 6a1803df08f44-70d972f905dmr28317716d6.38.1755857355572; 
 Fri, 22 Aug 2025 03:09:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGjLDedc3TEHaa5fOfhQL6JH2lzExRdfVuK/adJjjF/AbJ1wFTlhwvAYsjorze1ggX8bWHyRw==
X-Received: by 2002:ad4:4ee2:0:b0:709:d518:74fe with SMTP id
 6a1803df08f44-70d972f905dmr28317336d6.38.1755857354860; 
 Fri, 22 Aug 2025 03:09:14 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-33650ea5f6asm3013591fa.53.2025.08.22.03.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 03:09:13 -0700 (PDT)
Date: Fri, 22 Aug 2025 13:09:12 +0300
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
 Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH v3 08/14] phy: qcom: qmp-usbc: Add DP PHY configuration
 support for QCS615
Message-ID: <tdmjo5et4ohwg3g5z7wr4dhvvlqbd4z6nfo2hbzpyo77e6okdp@z5f7hlvyovx6>
References: <20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com>
 <20250820-add-displayport-support-for-qcs615-platform-v3-8-a43bd25ec39c@oss.qualcomm.com>
 <su3zkeepxaislh6q5ftqxp6uxsyg7usxmc5hkafw7yn2mgtqeu@wua72odmy7zp>
 <2e3c1559-7da2-4c6e-bcef-eb1e8dfd4c31@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2e3c1559-7da2-4c6e-bcef-eb1e8dfd4c31@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fpOFpF4f c=1 sm=1 tr=0 ts=68a841cc cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=VDbBU9HbQ_CCQpQHtSwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: DUJUvNHgXxITYQA6t6a9Uap2Zu-K3w3l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX4Ktd01UyalYy
 yVS6AnhEyR06KLFlplvt6Id91nVgfYubeSF4UX4zsvkDHeWAnt4t/LrlOuw0xlW2YR3kVxdcy9Y
 M4XtDn0PisEZM+MTkmMKbUoOeGdIv3ALYBTOJPXGMQqnlIksdEMJrNJLya5BY12qHKPCQo0VjnS
 kDX6LAGebYl44q3cxhyt+taXaaeCq7rblQsMVi/k4837PX9jSa90rNoUh/nuHkM7l2PDK2PmtbN
 YYI80JDSMbtbYCiuDC0dOlv4960//QGSf/81iqA8TKj7JESIqG804SQI+B3IFuKiawUJuVymxTS
 Gl0+SvN/2z80sa4QTzfm9T/Fq3FCLIByyOgdj7PpU6qINIHlyUPyu26eTujS58Y+j3QRcmLNUyj
 gZEWDLmO3bNvYDIKjDTrUHd9acKOVA==
X-Proofpoint-ORIG-GUID: DUJUvNHgXxITYQA6t6a9Uap2Zu-K3w3l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-22_03,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
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

On Fri, Aug 22, 2025 at 04:43:11PM +0800, Xiangxu Yin wrote:
> 
> On 8/20/2025 7:16 PM, Dmitry Baryshkov wrote:
> > On Wed, Aug 20, 2025 at 05:34:50PM +0800, Xiangxu Yin wrote:
> >> Introduce DisplayPort PHY configuration routines for QCS615, including
> >> aux channel setup, lane control, voltage swing tuning, clock
> >> programming and calibration. These callbacks are registered via
> >> qmp_phy_cfg to enable DP mode on USB/DP switchable Type-C PHYs.
> >>
> >> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> >> ---
> >>  drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h |   1 +
> >>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c   | 251 +++++++++++++++++++++++++++++
> >>  2 files changed, 252 insertions(+)
> >>
> >> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> >> index 0ebd405bcaf0cac8215550bfc9b226f30cc43a59..59885616405f878885d0837838a0bac1899fb69f 100644
> >> --- a/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> >> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-dp-phy.h
> >> @@ -25,6 +25,7 @@
> >>  #define QSERDES_DP_PHY_AUX_CFG7				0x03c
> >>  #define QSERDES_DP_PHY_AUX_CFG8				0x040
> >>  #define QSERDES_DP_PHY_AUX_CFG9				0x044
> >> +#define QSERDES_DP_PHY_VCO_DIV				0x068
> > This register changes between PHY versions, so you can not declare it here.
> >
> > Otherwise LGTM.
> 
> 
> Ok.
> 
> This PHY appears to be QMP_DP_PHY_V2, but there's no dedicated header for it yet. 
> 
> I’ll create |phy-qcom-qmp-dp-phy-v2.h| next patch and define |VCO_DIV| and shared offsets with V3 will be redefined accordingly.

Nice! Thanks.

> 
> 
> >
> >>  
> >>  /* QSERDES COM_BIAS_EN_CLKBUFLR_EN bits */
> >>  # define QSERDES_V3_COM_BIAS_EN				0x0001

-- 
With best wishes
Dmitry
