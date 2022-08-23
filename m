Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD6659EA23
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 19:47:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C482910F7F4;
	Tue, 23 Aug 2022 17:47:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E5910F76A;
 Tue, 23 Aug 2022 17:47:13 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27NGjpT6002746;
 Tue, 23 Aug 2022 17:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xZo+vzm1TOVsna0zI8E67IlnE8HAd1OyXQrditCnKTc=;
 b=Agpv8gbvv6ChQ2bg0ZfIgUU26g9tqZraE774F2+pZmp8/Nw3JxRtBBesvVKp3fPtxzbZ
 Z94W0YR1EWsk9mxtnZAjVwH6lXK6vG2zfg2btGM/Vq48yfZisVmdmyDZ9AtfTpQLrd3A
 i9fxghqbNCpMQ4wVq1aixLyzG8OiE3wMZSKPtss3jEsa5E2rtvPoeDS0kb19U71iihTU
 D9YvWoh4qwm89zWW5NOU6/98msx77k1NWj+zJTnnLNzweLpxJ1b0MzsCTCtag327/ukz
 ULT0v7+eMN6YBc1cVsx4HxugSJ94DKOxPmaVv2WfyVRDwDh0TbztJ3cf6O+B5xFDXrID RQ== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j52pjg913-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 17:47:11 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27NHlAwd008891
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Aug 2022 17:47:10 GMT
Received: from [10.111.161.24] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Tue, 23 Aug
 2022 10:47:07 -0700
Message-ID: <c8a2f675-4d69-58f7-a603-5e810f0077fe@quicinc.com>
Date: Tue, 23 Aug 2022 10:47:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] drm/msm/dp: Silence inconsistent indent warning
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
References: <20220823024356.783318-1-swboyd@chromium.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220823024356.783318-1-swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: HuEEDLdcL0mdPNiLnLBtwirenx7MxWA9
X-Proofpoint-GUID: HuEEDLdcL0mdPNiLnLBtwirenx7MxWA9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_07,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208230069
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
Cc: kernel test robot <lkp@intel.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, patches@lists.linux.dev,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Stephen

On 8/22/2022 7:43 PM, Stephen Boyd wrote:
> Build robots complain
> 
>   smatch warnings:
>   drivers/gpu/drm/msm/dp/dp_link.c:969 dp_link_process_link_status_update() warn: inconsistent indenting
> 
> Fix it.
> 
> Cc: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Fixes: ea530388e64b ("drm/msm/dp: skip checking LINK_STATUS_UPDATED bit")

This patch itself LGTM. But when I was looking at the fixes commit, I 
noticed one more formatting issue.

There seems to be an extra space character in this part.

diff --git a/drivers/gpu/drm/msm/dp/dp_link.c 
b/drivers/gpu/drm/msm/dp/dp_link.c
index 49d7fad36fc4..be986da78c4a 100644
--- a/drivers/gpu/drm/msm/dp/dp_link.c
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -773,7 +773,8 @@ static int 
dp_link_process_link_training_request(struct dp_link_private *link)
                         link->request.test_lane_count);

         link->dp_link.link_params.num_lanes = 
link->request.test_lane_count;
-       link->dp_link.link_params.rate = link->request.test_link_rate;
+       link->dp_link.link_params.rate =
+               drm_dp_bw_code_to_link_rate(link->request.test_link_rate);

         return 0;

Since we are fixing up this commit, can you please fix this too?

Thanks

Abhinav
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> ---
>   drivers/gpu/drm/msm/dp/dp_link.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index 36f0af02749f..1620110806cf 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -965,8 +965,7 @@ static int dp_link_process_link_status_update(struct dp_link_private *link)
>   	if (channel_eq_done && clock_recovery_done)
>   		return -EINVAL;
>   
> -
> -       return 0;
> +	return 0;
>   }
>   
>   /**
> 
> base-commit: 568035b01cfb107af8d2e4bd2fb9aea22cf5b868
