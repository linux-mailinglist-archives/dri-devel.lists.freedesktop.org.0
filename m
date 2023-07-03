Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD037465E6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 00:58:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DBA110E247;
	Mon,  3 Jul 2023 22:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF4210E246;
 Mon,  3 Jul 2023 22:57:59 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 363LfWla028732; Mon, 3 Jul 2023 22:57:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=peNyGUE5ls45+ctyUrJ0mrTUD48g611x5+vUhF92JbY=;
 b=GDhg6NK4V45QvA5xMnPCQDTvheg2xu2yDuHGMufe78BzTfZpzc0FNGrvwBNdcNg9hAJH
 ddO3t/qy65YqwSR32ue+jawHv3rwJSN8ZWmJi7Zp0jHF7jLfynt7yCybIjaMyCtEOspi
 N/rRgAYHjO4OOWX+Eymiu+piVn3dyiXy6OpSZNqeE5fYrzCbG2P7UBW11a2LPrbP9Lve
 UbC9UMX4zNeWNeQx6g8z/sA9hacp7zo9+TX/OUZVDFEJhU34xtiqCXDSAkubzXO+vqKM
 QLZllAPPXpwQuWiuDYN70ez2/CiIWwvOMvQljMDbDcYNNErxKMFZHc9Ps+C+9t9AIREf aQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rky5mh0mt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jul 2023 22:57:50 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 363MvnDn009783
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 3 Jul 2023 22:57:49 GMT
Received: from [10.110.19.132] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.7; Mon, 3 Jul 2023
 15:57:48 -0700
Message-ID: <b2499f3d-46d4-216e-9142-87d73e26781e@quicinc.com>
Date: Mon, 3 Jul 2023 15:57:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 7/8] drm/msm/dpu: drop dpu_core_perf_destroy()
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230620000846.946925-1-dmitry.baryshkov@linaro.org>
 <20230620000846.946925-8-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230620000846.946925-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: 3aG8C40pCOLiHTui4C43KZSEYwjzw5or
X-Proofpoint-GUID: 3aG8C40pCOLiHTui4C43KZSEYwjzw5or
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-03_15,2023-06-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 spamscore=0 clxscore=1015 mlxscore=0 priorityscore=1501 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307030208
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/19/2023 5:08 PM, Dmitry Baryshkov wrote:
> This function does nothing, just clears several data pointers. Drop it
> now.
> 

This will undo what dpu_core_perf_init() did when an error happens.

Why can we drop that?

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 12 ------------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  6 ------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  1 -
>   3 files changed, 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 78a7e3ea27a4..f779ad544347 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -394,18 +394,6 @@ int dpu_core_perf_debugfs_init(struct dpu_kms *dpu_kms, struct dentry *parent)
>   }
>   #endif
>   
> -void dpu_core_perf_destroy(struct dpu_core_perf *perf)
> -{
> -	if (!perf) {
> -		DPU_ERROR("invalid parameters\n");
> -		return;
> -	}
> -
> -	perf->max_core_clk_rate = 0;
> -	perf->core_clk = NULL;
> -	perf->dev = NULL;
> -}
> -
>   int dpu_core_perf_init(struct dpu_core_perf *perf,
>   		struct drm_device *dev,
>   		const struct dpu_perf_cfg *perf_cfg,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> index e8a7916b6f71..e1198c104b5e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> @@ -69,12 +69,6 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>    */
>   void dpu_core_perf_crtc_release_bw(struct drm_crtc *crtc);
>   
> -/**
> - * dpu_core_perf_destroy - destroy the given core performance context
> - * @perf: Pointer to core performance context
> - */
> -void dpu_core_perf_destroy(struct dpu_core_perf *perf);
> -
>   /**
>    * dpu_core_perf_init - initialize the given core performance context
>    * @perf: Pointer to core performance context
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 6e62606e32de..4439147d2c35 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1162,7 +1162,6 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
>   	return 0;
>   
>   drm_obj_init_err:
> -	dpu_core_perf_destroy(&dpu_kms->perf);
>   hw_intr_init_err:
>   perf_err:
>   power_error:
