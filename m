Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 418B1A1309A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 02:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4C7D10E54D;
	Thu, 16 Jan 2025 01:17:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bjUVNhM0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A28A10E549;
 Thu, 16 Jan 2025 01:17:11 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50FKrbJf009208;
 Thu, 16 Jan 2025 01:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 saJ1fk4vOLxGWYtDZMmSkpZrxzipQvGL3nYDUcAsoyg=; b=bjUVNhM0NGfD3KqT
 gk9ZypCy7lH3t/uEDa1dclcVTO5yj1WFoIOqgAVLCKtQfPpqG2tsYRHQ5YAgsjTf
 JL5NFMv6akWIzr1dF44lDOo31PzM7S+B10QFHi172CTpEAJnn2rPRmSpCiO2z92r
 SFQ8Tu9TovbxI5l0rwWMt3fy8kzguDjQhTWfR+iZ3L4iSKNFTD4JtU95Sa/3rBOu
 LQbdGz4zf+0NX5h9CdUf2fFTfpFVfkgn2KYtYxEZ6nNFPsDT1a6o8laMPHLOdQJW
 qmicfYaIJBOwZlD+Ya1hCuWpdOEc3pstXXuRkWaAt+9grUbxy8xrvtt9egNeOugO
 ywDX5A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446mf2gefn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2025 01:17:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50G1H6rG018181
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Jan 2025 01:17:06 GMT
Received: from [10.71.108.79] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 15 Jan
 2025 17:17:05 -0800
Message-ID: <4d4fcf77-8730-4c5c-bc33-53b8d8575c57@quicinc.com>
Date: Wed, 15 Jan 2025 17:17:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/35] drm/msm/dpu: drop INTF_SC7280_MASK
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
 <20241214-dpu-drop-features-v1-4-988f0662cb7e@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20241214-dpu-drop-features-v1-4-988f0662cb7e@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: qjRL1pekM4dZOdcFhTZqeBSnYaNa5Bk4
X-Proofpoint-GUID: qjRL1pekM4dZOdcFhTZqeBSnYaNa5Bk4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-15_11,2025-01-15_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 mlxscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160007
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



On 12/13/2024 2:14 PM, Dmitry Baryshkov wrote:
> The INTF_SC7280_MASK is equal to the INTF_SC7180_MASK. Stop defining a
> separate symbol and use the INTF_SC7180_MASK instead.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  6 +++---
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   | 18 +++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  8 ++++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 16 ++++++++--------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  8 ++++----
>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 18 +++++++++---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         |  2 --
>   9 files changed, 45 insertions(+), 47 deletions(-)
> 

I think when 781452286aeb ("drm/msm/dpu: drop DPU_INTF_DATA_COMPRESS 
from dpu catalog") was made, we had only two chipsets using those masks, 
sc7180 and sc7280, and since then all newer ones went with 
INTF_SC7280_MASK leading to this duplication.

We can drop this now,

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
