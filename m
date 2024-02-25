Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F282C862CB0
	for <lists+dri-devel@lfdr.de>; Sun, 25 Feb 2024 20:57:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 238A210E38A;
	Sun, 25 Feb 2024 19:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="k5uQwNMa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A74AF10E389;
 Sun, 25 Feb 2024 19:57:24 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41PJqlr2023991; Sun, 25 Feb 2024 19:57:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=bzbwxhBL3/ANprITyQ8JbsOn+1U7PpwwKhIsh+TwLn0=; b=k5
 uQwNMayS8SPJrXP8N+Iku0IiFQfkByOZJKEI8o30Zgqiebh4W6oaKEw555KVxdGf
 1zXut/ztli66m3slz1vpub83J7gfhYaSLVUlKytMdOuyxATqS5maytcFPIQpifqW
 s+kqFc4aRBKUXQ+GPT+QN12W1G+I/CkLg2H61ueEhq0kmEmkSkAsv5lRu0925y3f
 vbJtc2+ZUJrpdk2M/5tSuCD9el3Z0/2i5FRlRXaHCNzXhdFAKrXz6zz2SNEWHHXv
 n2cLkAn45DK5cWv4CgveM0c177wOSfxMqys7Kg2ugl7R7oYy0BhTv/D1hC9+dT8s
 PkLgAg+YyDwKU6nnMPZA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wf65htg1d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 25 Feb 2024 19:57:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41PJvKxt011190
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 25 Feb 2024 19:57:20 GMT
Received: from [10.110.76.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 25 Feb
 2024 11:57:19 -0800
Message-ID: <33e38ac8-f41e-ca66-0b75-e72990691a80@quicinc.com>
Date: Sun, 25 Feb 2024 11:57:18 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/3] drm/msm/dpu: capture snapshot on the first
 commit_done timeout
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Steev Klimaszewski <steev@kali.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
 <20240225-fd-dpu-debug-timeout-v3-3-252f2b21cdcc@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240225-fd-dpu-debug-timeout-v3-3-252f2b21cdcc@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: vlGMjNgEnjeSetryRp6Ml3GVa7Vzu-Jh
X-Proofpoint-GUID: vlGMjNgEnjeSetryRp6Ml3GVa7Vzu-Jh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-25_23,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2402120000
 definitions=main-2402250159
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



On 2/25/2024 6:12 AM, Dmitry Baryshkov wrote:
> In order to debug commit_done timeouts, capture the devcoredump state
> when the first timeout occurs after the encoder has been enabled.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 +++++++++
>   1 file changed, 9 insertions(+)
> 

This looks fine now. Once we discuss patch 2, I can ack this.

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 30f349c8a1e5..3cae07bf0b9b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -126,6 +126,8 @@ enum dpu_enc_rc_states {
>    * @base:		drm_encoder base class for registration with DRM
>    * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
>    * @enabled:		True if the encoder is active, protected by enc_lock
> + * @commit_done_timedout: True if there has been a timeout on commit after
> + *			enabling the encoder.
>    * @num_phys_encs:	Actual number of physical encoders contained.
>    * @phys_encs:		Container of physical encoders managed.
>    * @cur_master:		Pointer to the current master in this mode. Optimization
> @@ -172,6 +174,7 @@ struct dpu_encoder_virt {
>   	spinlock_t enc_spinlock;
>   
>   	bool enabled;
> +	bool commit_done_timedout;
>   
>   	unsigned int num_phys_encs;
>   	struct dpu_encoder_phys *phys_encs[MAX_PHYS_ENCODERS_PER_VIRTUAL];
> @@ -1226,6 +1229,8 @@ static void dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>   	else if (disp_info->intf_type == INTF_DSI)
>   		dpu_enc->wide_bus_en = msm_dsi_wide_bus_enabled(priv->dsi[index]);
>   
> +	dpu_enc->commit_done_timedout = false;
> +
>   	mutex_lock(&dpu_enc->enc_lock);
>   	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
>   
> @@ -2436,6 +2441,10 @@ int dpu_encoder_wait_for_commit_done(struct drm_encoder *drm_enc)
>   			DPU_ATRACE_BEGIN("wait_for_commit_done");
>   			ret = phys->ops.wait_for_commit_done(phys);
>   			DPU_ATRACE_END("wait_for_commit_done");
> +			if (ret == -ETIMEDOUT && !dpu_enc->commit_done_timedout) {
> +				dpu_enc->commit_done_timedout = true;
> +				msm_disp_snapshot_state(drm_enc->dev);
> +			}
>   			if (ret)
>   				return ret;
>   		}
> 
