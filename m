Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20DFA91D7AF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 07:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E827610E072;
	Mon,  1 Jul 2024 05:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="T1eWx6OJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E360C10E072;
 Mon,  1 Jul 2024 05:51:18 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45UNhNPl009177;
 Mon, 1 Jul 2024 05:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=U8w4D1r7t7niSc/XiQ8MWOlU
 ZfgvTBRs8X6EjKJ4vwY=; b=T1eWx6OJLaaLAXZWIoAdhOPKH/C2jnVRXZHiJ7b9
 ma0QL6ElXYT62aSSjODmfFFonSdpZ02m77m0sODF8Mk2BbeqPQfyv9hz3SeVa0Al
 0CNMJwiAIVOFoDtXVPmZxSEojHqqB1FzjsRVDHwkUdGeMhqtH9ul1XFJPPSRSiDI
 y5CUCGI/wPts8gHepD4Vsfhrq/AYqsZlBqbkYy8epVo0ZQZqcTE/+VWhrzVd5HSt
 gAlJUdLVSvL+oDs3Tf8UdOv7YGbCdrLrutw+SRjwWMRsUHNME0ivPiSs/Iqhzw2v
 Yhj3p9K0FKaEXVaCPxDR4/gcNhRJkwPt5vEOS93bwZM6KA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 402bejjw3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 01 Jul 2024 05:51:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 4615pCTs027669
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 1 Jul 2024 05:51:12 GMT
Received: from hu-akhilpo-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 30 Jun 2024 22:51:07 -0700
Date: Mon, 1 Jul 2024 11:21:03 +0530
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
CC: freedreno <freedreno@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-msm@vger.kernel.org>, "OPEN
 FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Krzysztof Kozlowski
 <krzk@kernel.org>, Will Deacon <will@kernel.org>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, "Sean
 Paul" <sean@poorly.run>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] drm/msm/adreno: Introduce gmu_chipid for a740 &
 a750
Message-ID: <20240701055103.srt6olauy7ux5um5@hu-akhilpo-hyd.qualcomm.com>
References: <20240629015111.264564-1-quic_akhilpo@quicinc.com>
 <20240629015111.264564-4-quic_akhilpo@quicinc.com>
 <243c0432-a681-4932-957b-e80f2f4ef295@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <243c0432-a681-4932-957b-e80f2f4ef295@linaro.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: YTnb4gfmvQsDbz3CbM_Kw55DIfWsDEV1
X-Proofpoint-ORIG-GUID: YTnb4gfmvQsDbz3CbM_Kw55DIfWsDEV1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-01_04,2024-06-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 impostorscore=0 spamscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407010043
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

On Sat, Jun 29, 2024 at 03:06:22PM +0200, Konrad Dybcio wrote:
> On 29.06.2024 3:49 AM, Akhil P Oommen wrote:
> > To simplify, introduce the new gmu_chipid for a740 & a750 GPUs.
> > 
> > Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> > ---
> 
> This gets rid of getting patchid from dts, but I suppose that's fine,
> as we can just add a new entry to the id table
> 
> [...]
> 
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> > @@ -771,7 +771,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
> >  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> >  	const struct a6xx_info *a6xx_info = adreno_gpu->info->a6xx;
> >  	u32 fence_range_lower, fence_range_upper;
> > -	u32 chipid, chipid_min = 0;
> > +	u32 chipid = 0;
> 
> The initialization doesn't seem necessary

Rob, would it be possible to fix this up when you pick this patch?

-Akhil.

> 
> otherwise:
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Konrad
