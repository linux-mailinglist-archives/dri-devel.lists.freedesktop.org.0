Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EEEA9FEF6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 03:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD0110E115;
	Tue, 29 Apr 2025 01:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="YHcByK2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B7110E10F;
 Tue, 29 Apr 2025 01:21:44 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNr5Yl014348;
 Tue, 29 Apr 2025 01:21:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CbStryZlt5DJ28eMv12jxj4dqVZCRZkUHYacBDFYMDs=; b=YHcByK2c2au2DhuA
 1mRDtsIi1kbdpTKfq+MgFtAR4S0wGcO4Rg+iOHPxXuXn9gj8vFfbIJC2T8QJ+fSU
 7GSREeN72a6N17CQR3j6zrWmQ3ZtloaMATlAKrAGxpWutXW+luvBrvvSFcR1sM9m
 7MPv8WbJ2tcIhWIzDRcAoRW2nVrGueaBB7K4iXvEq2wXpYqwYkZB9gt9O0yQRP5k
 RWnq6N7RNRM8Ed+W6J0Mo3Iieau5uOZUgYITI8YOTqD19TDDC9jTe+HfM5hoSP2O
 +Xj01t42urgOP9prejVGNjmCkP7zufqKrd5EO0aId96vGCZGR36soo6USvzCAeAr
 9HUTsA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rnn1r8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Apr 2025 01:21:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T1LdFg004977
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 29 Apr 2025 01:21:39 GMT
Received: from [10.71.110.123] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 28 Apr
 2025 18:21:38 -0700
Message-ID: <afa1558f-bd45-473c-8d09-7385801ae07c@quicinc.com>
Date: Mon, 28 Apr 2025 18:21:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/msm/dpu: remove DSC feature bit for PINGPONG
 on MSM8953
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?=
 <barnabas.czeman@mainlining.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@oss.qualcomm.com>
References: <20250301-dpu-fix-catalog-v2-0-498271be8b50@linaro.org>
 <20250301-dpu-fix-catalog-v2-3-498271be8b50@linaro.org>
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20250301-dpu-fix-catalog-v2-3-498271be8b50@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Ut7t2P7JHcKys9T2YR_VQ9Hl4OLP0ENQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDAwOCBTYWx0ZWRfX7o71t7FQh5ND
 YSIgOiZYQ1NPGZ3QUTWtU4sBDJBrSsOWGHWm0MJfyKAU6T0n9dbsOzq3GV1f5tABNW/bq0Wm+V6
 MJpg93HupSfL5g89qZ7xtqPNPjkgJ/IA8q1gO64qcgyVTCjzHLAcO0s3tLLutbShTOOh8Gl9e0o
 yKRg+45/+LpJjIzBFjC+lPwOru99Qpj5ipdDhSt219Qb+vLTyErInFSqOSx8LFsbaeShVT+GZs9
 702B8VA73vGGj5qMv5CxZGe4uSjerimWW4MT7ox+cKHUqM07MfBsHskRdjgaAQuHUdSTDfnsN+P
 7uvmNBPFl93Q9zUpCyPfX8d/fAQLDpq3I+YYGL2v5lTNoL98Weo2STVoGM/gLJAEUHkG40/QAYS
 aMHDRHuWxdovzM/LxppbuYQcu3hrIrgd5Y/IvV8pPW5uJ/1cECC0oUNxDVhfop5hbPY7T/XT
X-Proofpoint-GUID: Ut7t2P7JHcKys9T2YR_VQ9Hl4OLP0ENQ
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=681029a3 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=iTZM9pQ1TWb8sfHiNRoA:9 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=973 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 mlxscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290008
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



On 3/1/2025 1:24 AM, Dmitry Baryshkov wrote:
> The MSM8953 platform doesn't have DSC blocks nor does have it DSC
> registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
> from the PINGPONG's feature mask and, as it is the only remaining bit,
> drop the .features assignment completely.
> 
> Fixes: 7a6109ce1c2c ("drm/msm/dpu: Add support for MSM8953")
> Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 2 --
>   1 file changed, 2 deletions(-)
> 


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
