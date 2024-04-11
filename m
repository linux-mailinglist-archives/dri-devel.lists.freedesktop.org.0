Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BC18A1EC0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 20:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D92410E9F9;
	Thu, 11 Apr 2024 18:43:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="iQvl6GeR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EABC10E8C0;
 Thu, 11 Apr 2024 18:43:00 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 43BCWWRS007844; Thu, 11 Apr 2024 18:42:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:from:to:cc:references
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=l0mGIIANjDyxm+e8e+dV7rCE3SepN75fWHXkPif1qbM=; b=iQ
 vl6GeRr6dI19njlwwZLvLFNJQGeMNpqAg1IsQ+qj7N3N9obzHjIXSrTHUX/lYOB6
 BvdATp6hzvEwF3+jCaUK4Y42ytPOH5nFvlqfwyIRmsMGlt+Yq0N0/7l8RDrwJXcV
 6hxx3pibDLcPI181pIbuOgKmRAZSiP46Q+x3dXdg2ZgV6N8s7WtHJNSCulLVH2Cg
 pv4PGFuXyEohRiYPXlAYSvxOOOw5FJqRlMl3meS9oBe6wpkc4iG24o7wYJ1FVqet
 Y5GY99ymUPA+5hZVZ+ZorxPkENaynZqdrbsEEJj8VFfUo3nMzdn+w8uybnVEvaKU
 UiJ0NnaobHjOyNyrwkzA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xe8yvjx52-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Apr 2024 18:42:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43BIgrdh006405
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 11 Apr 2024 18:42:53 GMT
Received: from [10.71.109.81] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 11 Apr
 2024 11:42:52 -0700
Message-ID: <f06d1916-7721-7e04-de35-0326cec7ba6c@quicinc.com>
Date: Thu, 11 Apr 2024 11:42:51 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 06/12] drm/msm/dpu: pull format flag definitions to
 msm_drv.h
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
CC: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>
References: <20231202214016.1257621-1-dmitry.baryshkov@linaro.org>
 <20231202214016.1257621-7-dmitry.baryshkov@linaro.org>
 <0ce28e37-0d92-2eaa-7d95-0b3829149a8f@quicinc.com>
In-Reply-To: <0ce28e37-0d92-2eaa-7d95-0b3829149a8f@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: WIeJh5EioWTwFWcJtaQWUu-gQ3wQdygl
X-Proofpoint-GUID: WIeJh5EioWTwFWcJtaQWUu-gQ3wQdygl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-11_10,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 mlxlogscore=999 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2404110136
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



On 4/11/2024 11:41 AM, Abhinav Kumar wrote:
> 
> 
> On 12/2/2023 1:40 PM, Dmitry Baryshkov wrote:
>> In preparation to merger of formats databases, pull format flag
>> definitions to msm_drv.h header, so that they are visibile to both dpu
>> and mdp drivers.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c | 98 ++++++++++-----------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 28 ++----
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c |  4 +-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  4 +-
>>   drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  |  8 +-
>>   drivers/gpu/drm/msm/disp/mdp_format.c       |  6 +-
>>   drivers/gpu/drm/msm/disp/mdp_kms.h          |  3 +-
>>   drivers/gpu/drm/msm/msm_drv.h               | 24 +++++
>>   8 files changed, 91 insertions(+), 84 deletions(-)
>>
> 
> <snip>
> 
>> +#define DPU_FORMAT_IS_YUV(X)        MSM_FORMAT_IS_YUV(&(X)->base)
>> +#define DPU_FORMAT_IS_DX(X)        MSM_FORMAT_IS_DX(&(X)->base)
>> +#define DPU_FORMAT_IS_LINEAR(X)        MSM_FORMAT_IS_LINEAR(&(X)->base)
>> +#define DPU_FORMAT_IS_TILE(X)        MSM_FORMAT_IS_TILE(&(X)->base)
>> +#define DPU_FORMAT_IS_UBWC(X)        MSM_FORMAT_IS_UBWC(&(X)->base)
> 
> Do we need another wrapper macro on top of MSM_FORMAT_*** macros? Why 
> cant we use them directly?
> 
> Same comment for MDP_FORMAT_IS_YUV macro as well.
> 
> Rest LGTM.

never mind, the next change does exactly this. Hence this one LGTM

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
