Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4FC7892A9
	for <lists+dri-devel@lfdr.de>; Sat, 26 Aug 2023 02:19:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACDB810E6F2;
	Sat, 26 Aug 2023 00:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B406210E6F1;
 Sat, 26 Aug 2023 00:19:06 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37Q0ENB8027858; Sat, 26 Aug 2023 00:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=3fDjEGa6aWpEJMzx7o12X/ViTKe3bb1L50uj/k+ZbZA=;
 b=UsiZY5LKfKUspqvuv0mgWWlweo5mSawpdr57kltdvJLGxI4dSxFaCCYY6qzFy75LhF+U
 yTLt68QW4yylU5DxyAI0uzjhoCvch9Z7IxUZ13kJV2Et9URRWq14xTl3X/FU2daAkciI
 8iARKPYxtNUM6GOgC/GX8K1eqIU8Fvqjy8f8ExRCBWsQr9sfhlD4yCuo9irmyzuYit35
 TdtzJbX9E6EWs/bNkhXSVamwECMjit8i4NKw65hKAYDjTb329fOADFZLcWljPe87XkA3
 PK7IYhTViABHLEFhS3he4CjsLNIG+JDfxSabVcY5z5QaXMQum7chrQD9y1pF/d5/FHj5 6g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3spmtxt4nw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 26 Aug 2023 00:19:03 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com
 [10.47.209.197])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37Q0J2YO012973
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 26 Aug 2023 00:19:02 GMT
Received: from [10.110.6.4] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Fri, 25 Aug
 2023 17:19:01 -0700
Message-ID: <4b08d359-dbff-7180-1669-b79cea8e8e3d@quicinc.com>
Date: Fri, 25 Aug 2023 17:19:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 2/4] drm/msm/dpu: Enable widebus for DSI INTF
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Sean
 Paul" <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230822-add-widebus-support-v4-0-9dc86083d6ea@quicinc.com>
 <20230822-add-widebus-support-v4-2-9dc86083d6ea@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230822-add-widebus-support-v4-2-9dc86083d6ea@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: OrP3FySg4CJzN7d-vVk3dPRI9ZER_10b
X-Proofpoint-GUID: OrP3FySg4CJzN7d-vVk3dPRI9ZER_10b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-25_19,2023-08-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=836
 mlxscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2308260000
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/22/2023 10:42 AM, Jessica Zhang wrote:
> DPU supports a data-bus widen mode for DSI INTF.
> 
> Enable this mode for all supported chipsets if widebus is enabled for DSI.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 7 +++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c          | 7 +++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h          | 1 +
>   drivers/gpu/drm/msm/dsi/dsi.c                        | 5 +++++
>   drivers/gpu/drm/msm/msm_drv.h                        | 5 +++++
>   6 files changed, 25 insertions(+), 2 deletions(-)
> 

I am fine with this, thanks for working through the comments.


Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
