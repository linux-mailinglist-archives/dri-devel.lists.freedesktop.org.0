Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B18E764282
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 01:24:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB98F10E4CC;
	Wed, 26 Jul 2023 23:24:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C03E10E036;
 Wed, 26 Jul 2023 23:24:07 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36QN6D4D002205; Wed, 26 Jul 2023 23:24:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=WpdmNBlP98xhySGushnDB/8BvB0s7iU/IRM6tj+cJvI=;
 b=eUONCwmGJOGsZpMpzynL/WjVY7hXiiiQGImNg2qM76Nlx+0DnVVQVHMA8+0+2EGzc+SQ
 Ro+8grl6SzFXEUDroDSLkSs0BZbS69jHmaLeSrAJNx7RgsqiEJKiechSKHk2KJ2ONync
 orXOoEl8gfTUTWfM0JPqHS48r8BTz5HwPqnqiqeNvLIMdwDn+5koCRDrz4PfbzOJFyke
 p/hO+14nIjTT4rtBnOyB/1Z7+XF/jgaIwvK6yp0NGQKgYJmPSVdB1ZBtVUUbtAU1j/zJ
 NLV/KgpHubHspuP4614gPPBVm1xYC4futrMw6wbIcOkLzgayHGues2AUqa0Ch39rqxSw Fg== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3s31059h9y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jul 2023 23:24:02 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36QNO07c027628
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Jul 2023 23:24:01 GMT
Received: from [10.110.29.149] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 26 Jul
 2023 16:24:00 -0700
Message-ID: <1ecb643a-69c9-693a-fb23-4aac016b48dd@quicinc.com>
Date: Wed, 26 Jul 2023 16:23:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 6/6] drm/msm/dpu: drop UBWC configuration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <20230521171026.4159495-7-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230521171026.4159495-7-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: xJOVUIegLofRqWtk4wmcCn32_oc9qIvI
X-Proofpoint-GUID: xJOVUIegLofRqWtk4wmcCn32_oc9qIvI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-26_08,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 mlxlogscore=797
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307260209
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 5/21/2023 10:10 AM, Dmitry Baryshkov wrote:
> As the DPU driver has switched to fetching data from MDSS driver, we can
> now drop the UBWC and highest_bank_bit parts of the DPU hw catalog.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  6 ------
>   .../drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  6 ------
>   .../drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  6 ------
>   .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  6 ------
>   .../drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 -------
>   .../drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 ------
>   .../drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 -------
>   .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  5 -----
>   .../drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  6 ------
>   .../drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 -------
>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 -------
>   .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 -------
>   .../drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  6 ------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 15 ---------------
>   14 files changed, 97 deletions(-)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

