Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 643228120C4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Dec 2023 22:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BEA210E849;
	Wed, 13 Dec 2023 21:32:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39CAB10E833;
 Wed, 13 Dec 2023 21:32:02 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 3BDK07al025038; Wed, 13 Dec 2023 21:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=lKcfjm+2WEJAqFFiQQU5Y0eYQ1QJih9uVwl+uQ394Yk=; b=Rc
 L79rDuWon+gx3FnxQGxBTnuEJcXzaIrCtNgODA7jS180Ylya2AoKES/xeZa+ciVu
 Rp2YlyrgTtsvv0IcqEzN9ZsHaXP38ijJRUyLuPcwFbzF8WEAYZ2qpV0eiYNmMN6c
 74yOQOSBi1ZT8TsNb3M406aMsVlXwt/vzse2SCq6tr6bTkOxqxEWKcWARtrzZLAV
 xjsDjgpMm6rmXoHgmJW3RV8JF73zRBLQ2NlBgbzcVSXsnjuGL+mpENyJ6lDoKwtz
 AmhB46eJytfkJHTwMTpjJ/O+zwwp/At3dGvEBE/awiRAkWxBR5rcqZLLpi8eKG2o
 Upf7Fs58DHcir16Pl+bA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uy9gd1q35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 21:32:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BDLVwWH006124
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 Dec 2023 21:31:58 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 13 Dec
 2023 13:31:57 -0800
Message-ID: <a5fe0a50-ca9b-b3dc-c626-0b75d3eb7c02@quicinc.com>
Date: Wed, 13 Dec 2023 13:31:54 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 1/2] drm/msm/dpu: Set input_sel bit for INTF
Content-Language: en-US
To: Jessica Zhang <quic_jesszhan@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, "Sean
 Paul" <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20231213-encoder-fixup-v4-0-6da6cd1bf118@quicinc.com>
 <20231213-encoder-fixup-v4-1-6da6cd1bf118@quicinc.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231213-encoder-fixup-v4-1-6da6cd1bf118@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: LpGwT-Z0RQJ8OMsqYLSfKdUuUYFi5-P3
X-Proofpoint-GUID: LpGwT-Z0RQJ8OMsqYLSfKdUuUYFi5-P3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 mlxlogscore=926
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312130151
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



On 12/13/2023 1:30 PM, Jessica Zhang wrote:
> Set the input_sel bit for encoders as it was missed in the initial
> implementation.
> 
> Reported-by: Rob Clark <robdclark@gmail.com>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/39
> Fixes: 91143873a05d ("drm/msm/dpu: Add MISR register support for interface")
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 9 +++++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 3 ++-
>   4 files changed, 11 insertions(+), 5 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
