Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DF88ABD9A
	for <lists+dri-devel@lfdr.de>; Sun, 21 Apr 2024 00:47:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80D7710EA7E;
	Sat, 20 Apr 2024 22:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="bn7BtLe+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8650910EFE2;
 Sat, 20 Apr 2024 22:47:24 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43KMdMbe007443;
 Sat, 20 Apr 2024 22:47:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=i2oWs22vaTeTIaRZkzwbzO44O/N8MkH63JV9iHy8wuw=; b=bn
 7BtLe+1oq8z9IlpERC/VlBd8TuykSLXqhz9+sL4YjKIO8dHdFjbOlhV0jLxKw8s9
 ySGZbE1srLohvLYFIsCNialwjPwM+FsUuYvjrH9Npuh550pwQYAnfO3QmLvlkXZ5
 B5q2v0FF+cxs45bkAPWykUYyK6jNw+/V0+1O165NbyGZw8jHo+ySE1AgR/gFOmeP
 eor0qzTIrGujKjxTRu3bUmlWChNsn9BKCRGCNLGuGu2Oc7OUYc8tiAgesVHyRGXA
 WA9DYhYU13SQjFGrZMZCCQrwsQp6f6RLgHJjS/0vjLD8KX4EHRYuu9uDG9UljNWZ
 Lauk3hDu32aWUv8IjZJg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xm5sx1d35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 20 Apr 2024 22:47:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43KMlJ8g002136
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 20 Apr 2024 22:47:19 GMT
Received: from [10.110.104.191] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 20 Apr
 2024 15:47:19 -0700
Message-ID: <95b18564-ffa9-2840-d266-1835e6e9d2bd@quicinc.com>
Date: Sat, 20 Apr 2024 15:47:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 4/9] drm/msm/dpu: pull format flag definitions to
 mdp_format.h
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240420-dpu-format-v2-0-9e93226cbffd@linaro.org>
 <20240420-dpu-format-v2-4-9e93226cbffd@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240420-dpu-format-v2-4-9e93226cbffd@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: KMX7nPCPczurQobBTBH8NB6sn2t9CHCr
X-Proofpoint-GUID: KMX7nPCPczurQobBTBH8NB6sn2t9CHCr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-20_20,2024-04-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=863 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404200168
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



On 4/19/2024 9:01 PM, Dmitry Baryshkov wrote:
> In preparation to merger of formats databases, pull format flag
> definitions to mdp_format.h header, so that they are visibile to both
> dpu and mdp drivers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 98 ++++++++++++++---------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 31 +++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  4 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 +-
>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  |  8 +--
>   drivers/gpu/drm/msm/disp/mdp_format.c       |  6 +-
>   drivers/gpu/drm/msm/disp/mdp_format.h       | 39 ++++++++++++
>   drivers/gpu/drm/msm/disp/mdp_kms.h          |  4 +-
>   drivers/gpu/drm/msm/msm_drv.h               |  4 --
>   9 files changed, 109 insertions(+), 89 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
