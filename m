Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBC4948245
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 21:26:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D876610E291;
	Mon,  5 Aug 2024 19:25:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="cq1BQfoh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF79210E162;
 Mon,  5 Aug 2024 19:25:55 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 475BUvKZ021368;
 Mon, 5 Aug 2024 19:25:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 05pYew0QZsnoHD2ifGyMy+1KXhPPBHZKe3O6r2x8sQI=; b=cq1BQfohNIBhAIxs
 Xci6Wlwk8v6ggm0uufQgSxCij98ckOyPRoWD4Mk2Dw7m3R1lF0yN5GgEq4t1Cnv6
 FFytrxr1lupa5IR/VZ7eQ86BtrOy+e2T0Ae+37/acy8lU0umQlQvRpxSMhWhI+cx
 L52WRforCrJTP8gq+ovg6gyj0KMKkPK0pIA1N8CYsmD+M38uVHJry4i0Cw4fwzye
 ZIXuDQn6Nrofnz1gNm6hvAH4ah938zlFqDs5rpRi4WxLsQn9zXuIz24rmj0zdErO
 7timoqBXZ33wpD/n1N57qUZtpsMWPP/FKj7r3fGVNbihF7gDm0On/xcC0QnNanxd
 u8lVPA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40scmtw3hs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 05 Aug 2024 19:25:28 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id
 475JPRJ9012819
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 5 Aug 2024 19:25:27 GMT
Received: from [10.71.110.34] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 5 Aug 2024
 12:25:23 -0700
Message-ID: <531b68a0-e2e5-4f39-a586-5aaf73bb376c@quicinc.com>
Date: Mon, 5 Aug 2024 12:25:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/msm/dpu: don't play tricks with debug macros
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Jeykumar
 Sankaran <jsanka@codeaurora.org>
References: <20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org>
 <20240802-dpu-fix-wb-v2-2-7eac9eb8e895@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240802-dpu-fix-wb-v2-2-7eac9eb8e895@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 7Whn8VW-plGTcVijgWVdvo-KfbWe-Exz
X-Proofpoint-GUID: 7Whn8VW-plGTcVijgWVdvo-KfbWe-Exz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-05_08,2024-08-02_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408050137
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



On 8/2/2024 12:47 PM, Dmitry Baryshkov wrote:
> DPU debugging macros need to be converted to a proper drm_debug_*
> macros, however this is a going an intrusive patch, not suitable for a
> fix. Wire DPU_DEBUG and DPU_DEBUG_DRIVER to always use DRM_DEBUG_DRIVER
> to make sure that DPU debugging messages always end up in the drm debug
> messages and are controlled via the usual drm.debug mask.
> 
> I don't think that it is a good idea for a generic DPU_DEBUG macro to be
> tied to DRM_UT_KMS. It is used to report a debug message from driver, so by
> default it should go to the DRM_UT_DRIVER channel. While refactoring
> debug macros later on we might end up with particular messages going to
> ATOMIC or KMS, but DRIVER should be the default.
> 
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h | 14 ++------------
>   1 file changed, 2 insertions(+), 12 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
