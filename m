Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FDB9FFFDA
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 21:12:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A99EA10E0BF;
	Thu,  2 Jan 2025 20:12:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="G6iAiO7K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3F610E0BF;
 Thu,  2 Jan 2025 20:12:39 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 502G1EPC023354;
 Thu, 2 Jan 2025 20:12:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c/NY/ICFRRfVd3T6RyzGCo9kXw+u3l1RfJjLzXEmePw=; b=G6iAiO7K3GO6J9Uc
 C2slYigeyjzOJUbokLE4bPxDzagMkSqeVjpSjygfz8aMRCOdUdjwPE4p8PQu/VFl
 dlek9So4WEyo5+njGN0XqNXQ67AfihIkBDGLmb+NsX/Gr+F0CHDwzQl/q29Vx3CK
 qTTZjbFQbvWGHsV55TNxkg3SakywPSQRf+tkcrCRdHO+oYoi4p+qyIdCnXZGSeg3
 Y3guxiOJmgXGX7oO+pSvefaV0wcV5i2d9ZrrIPN3Uc0sZJOTFbJz6+x6ad9cBKro
 KSGlSW34Bp+HhGpQ8M2uPReFuGDbSHBczMV5fdwLVfV6+yZeOy+uY1V0Pl08Yo4O
 lScEaw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43wt3c91hu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jan 2025 20:12:34 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 502KCYT8005162
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 2 Jan 2025 20:12:34 GMT
Received: from [10.216.23.18] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 2 Jan 2025
 12:12:28 -0800
Message-ID: <1c09d5f5-58c4-41f3-b52d-6d4603236467@quicinc.com>
Date: Fri, 3 Jan 2025 01:42:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Print GMU version at boot on >A630
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
CC: Marijn Suijten <marijn.suijten@somainline.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>
References: <20241219-topic-gmu_fw_ver-v1-0-d403a70052d8@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20241219-topic-gmu_fw_ver-v1-0-d403a70052d8@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 68d6NYqMnOpc8nY-nKlXU_MM53aaRFQc
X-Proofpoint-ORIG-GUID: 68d6NYqMnOpc8nY-nKlXU_MM53aaRFQc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 mlxlogscore=852 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501020176
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

On 12/20/2024 4:06 AM, Konrad Dybcio wrote:
> Might come in useful to try and track down otherwise inexplicable
> failures in e.g. old CI logs. A630 uses a different mechanism that is
> not implemented in this series.
> 
> Tested on 8280 and X1
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

For the whole series:

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

-Akhil

> ---
> Konrad Dybcio (2):
>       drm/msm: registers: Add GMU FW version register
>       drm/msm/a6xx: Print GMU core firmware version at boot
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c             | 7 +++++++
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 5 +++++
>  2 files changed, 12 insertions(+)
> ---
> base-commit: 8503810115fbff903f626adc0788daa048302bc0
> change-id: 20241219-topic-gmu_fw_ver-609e8b867802
> 
> Best regards,

