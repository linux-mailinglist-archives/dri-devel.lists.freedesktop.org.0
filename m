Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A40C97F171
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 21:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F9B210E484;
	Mon, 23 Sep 2024 19:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="iislJ+7j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3C310E48B;
 Mon, 23 Sep 2024 19:58:32 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48NBek1P022699;
 Mon, 23 Sep 2024 19:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=z6wb02yUb05pmv4YBYmLlCqX
 MDXAd164bdsu0ye707M=; b=iislJ+7j+m0SE3SYP6Q2rXPw/JGjiJNb+REwlYjP
 XJ05ucRqDQqRTxRu1B9OfuDrkPv32zScwdfWnZSwQBkJwzm8wm/Xx5kFXNNLfkti
 uTTml4yXwZJDuMYchhadkdZmPw/RnyWu/J9MMDRc9nDZns4J60LAX7IrJ+Rerv0D
 V6JOLaZlicOv0uuJj6zpR6cKvgZdJJftx6jdXFbGbDAFO5qk5+c6quPTzpapiIMd
 wyPNSmFXbluIRlAGsEfWNEJiNh9SA7iPb9rGERFNxuzg1SlVhmXOyDjKUvBitjXF
 JayVytm4YVKqtrFpotHbrHzi/swfRj1ZGZulMOvuDUEAnQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41snqye7s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2024 19:58:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48NJwPZ1007818
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Sep 2024 19:58:25 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 23 Sep 2024 12:58:19 -0700
Date: Tue, 24 Sep 2024 01:28:15 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Puranam V G Tejaswi"
 <quic_pvgtejas@quicinc.com>
Subject: Re: [PATCH 0/3] DRM/MSM: Support for Adreno 663 GPU
Message-ID: <20240923195815.phtxrnnpt7cxm3mz@hu-akhilpo-hyd.qualcomm.com>
References: <20240918-a663-gpu-support-v1-0-25fea3f3d64d@quicinc.com>
 <5fxmsbtyagtzt2pizdjoadiwxt3klafaulrhxoz4adevapxyoj@5jg7qaqhwkgr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5fxmsbtyagtzt2pizdjoadiwxt3klafaulrhxoz4adevapxyoj@5jg7qaqhwkgr>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: MVa_S3vuw5Iwwef3--9pf0RywK13A0ew
X-Proofpoint-ORIG-GUID: MVa_S3vuw5Iwwef3--9pf0RywK13A0ew
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 bulkscore=0 phishscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409230144
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

On Wed, Sep 18, 2024 at 12:34:32AM +0300, Dmitry Baryshkov wrote:
> On Wed, Sep 18, 2024 at 02:08:40AM GMT, Akhil P Oommen wrote:
> > This series adds support for Adreno 663 gpu found in SA8775P chipsets.
> > The closest gpu which is currently supported in drm-msm is A660.
> > Following are the major differences with that:
> > 	1. gmu/zap firmwares
> > 	2. Recommended to disable Level2 swizzling
> > 
> > Verified kmscube with the below Mesa change [1]. This series is rebased
> > on top of msm-next.
> 
> Is there a chance of you sharing Vulkan CTS results?

No. As of now there are no plans to run CTS.

-Akhil

> 
> > 
> > Patch (1) & (2) for Rob Clark and Patch (3) for Bjorn
> > 
> > [0] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/31211
> > 
> > To: Rob Clark <robdclark@gmail.com>
> > To: Sean Paul <sean@poorly.run>
> > To: Konrad Dybcio <konrad.dybcio@linaro.org>
> > To: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > To: Marijn Suijten <marijn.suijten@somainline.org>
> > To: David Airlie <airlied@gmail.com>
> > To: Daniel Vetter <daniel@ffwll.ch>
> > To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > To: Maxime Ripard <mripard@kernel.org>
> > To: Thomas Zimmermann <tzimmermann@suse.de>
> > To: Rob Herring <robh@kernel.org>
> > To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > To: Conor Dooley <conor+dt@kernel.org>
> > To: Bjorn Andersson <andersson@kernel.org>
> > Cc: linux-arm-msm@vger.kernel.org
> > Cc: dri-devel@lists.freedesktop.org
> > Cc: freedreno@lists.freedesktop.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: devicetree@vger.kernel.org
> > 
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> > Puranam V G Tejaswi (3):
> >       drm/msm/a6xx: Add support for A663
> >       dt-bindings: display/msm/gmu: Add Adreno 663 GMU
> >       arm64: dts: qcom: sa8775p: Add gpu and gmu nodes
> > 
> >  .../devicetree/bindings/display/msm/gmu.yaml       |  1 +
> >  arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi         |  8 +++
> >  arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 75 ++++++++++++++++++++++
> >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 19 ++++++
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  8 ++-
> >  drivers/gpu/drm/msm/adreno/a6xx_hfi.c              | 33 ++++++++++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
> >  7 files changed, 148 insertions(+), 1 deletion(-)
> > ---
> > base-commit: 15302579373ed2c8ada629e9e7bcf9569393a48d
> > change-id: 20240917-a663-gpu-support-b1475c828606
> > 
> > Best regards,
> > -- 
> > Akhil P Oommen <quic_akhilpo@quicinc.com>
> > 
> 
> -- 
> With best wishes
> Dmitry
