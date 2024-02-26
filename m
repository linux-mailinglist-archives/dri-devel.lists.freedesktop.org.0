Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CBA86679A
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 02:36:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBAA10E565;
	Mon, 26 Feb 2024 01:36:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="CQZAf5fN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B55C10E528;
 Mon, 26 Feb 2024 01:36:02 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41Q0iWRZ003713; Mon, 26 Feb 2024 01:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:from:to:cc:references
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=IewfBOrPUxGnXhkfxZXG51CRbI5sZJWyaKDgJYLyteY=; b=CQ
 ZAf5fNiVapy9N7S26+7JIGucr7GykzpDSsujIlwll6yfwpEdzEVvO824cZoS5t/q
 MjohNa3MX9WUub/Dx5k0wBz21UXrhtprvNQhX10Pu4/uf2+vQkfNzVxH/uwb3GM5
 QdDURZEL9W57zczRq8p8jNsXcOQoZvKFRbMgOuoQDoz/kEeyMMKRmblHAp7AY3FB
 w+49AawJxuUxUmVEJlGIPaUAtohbrUnFg5/ZGGQuiPL3+XauhcBVLdvS7CZelu+3
 /xx9YSsZl3+arruf3VT/TN/6TZR39UMojuugSagwva3KbeoN1KGKqQJEREApZLCi
 I1ZWGlR1IDC3K7s7PO7A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wf8p7jmfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Feb 2024 01:35:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 41Q1Zw8q006981
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 26 Feb 2024 01:35:58 GMT
Received: from [10.110.76.211] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Sun, 25 Feb
 2024 17:35:57 -0800
Message-ID: <3dd62c7e-e419-9ea2-b383-4c1c0959fecf@quicinc.com>
Date: Sun, 25 Feb 2024 17:35:56 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 3/3] drm/msm/dpu: capture snapshot on the first
 commit_done timeout
Content-Language: en-US
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: Steev Klimaszewski <steev@kali.org>, <linux-arm-msm@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20240225-fd-dpu-debug-timeout-v3-0-252f2b21cdcc@linaro.org>
 <20240225-fd-dpu-debug-timeout-v3-3-252f2b21cdcc@linaro.org>
 <33e38ac8-f41e-ca66-0b75-e72990691a80@quicinc.com>
In-Reply-To: <33e38ac8-f41e-ca66-0b75-e72990691a80@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: vscv7Qt20e2p-cYt2sgrR05dFsyzW_Jz
X-Proofpoint-GUID: vscv7Qt20e2p-cYt2sgrR05dFsyzW_Jz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-25_29,2024-02-23_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 clxscore=1015
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402260010
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



On 2/25/2024 11:57 AM, Abhinav Kumar wrote:
> 
> 
> On 2/25/2024 6:12 AM, Dmitry Baryshkov wrote:
>> In order to debug commit_done timeouts, capture the devcoredump state
>> when the first timeout occurs after the encoder has been enabled.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 9 +++++++++
>>   1 file changed, 9 insertions(+)
>>
> 
> This looks fine now. Once we discuss patch 2, I can ack this.
> 

Not entirely onboard with patch 2, but lets see how that code evolves

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 30f349c8a1e5..3cae07bf0b9b 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -126,6 +126,8 @@ enum dpu_enc_rc_states {
>>    * @base:        drm_encoder base class for registration with DRM
>>    * @enc_spinlock:    Virtual-Encoder-Wide Spin Lock for IRQ purposes
>>    * @enabled:        True if the encoder is active, protected by 
>> enc_lock
>> + * @commit_done_timedout: True if there has been a timeout on commit 
>> after
>> + *            enabling the encoder.
>>    * @num_phys_encs:    Actual number of physical encoders contained.
>>    * @phys_encs:        Container of physical encoders managed.
>>    * @cur_master:        Pointer to the current master in this mode. 
>> Optimization
>> @@ -172,6 +174,7 @@ struct dpu_encoder_virt {
>>       spinlock_t enc_spinlock;
>>       bool enabled;
>> +    bool commit_done_timedout;
>>       unsigned int num_phys_encs;
>>       struct dpu_encoder_phys *phys_encs[MAX_PHYS_ENCODERS_PER_VIRTUAL];
>> @@ -1226,6 +1229,8 @@ static void 
>> dpu_encoder_virt_atomic_enable(struct drm_encoder *drm_enc,
>>       else if (disp_info->intf_type == INTF_DSI)
>>           dpu_enc->wide_bus_en = 
>> msm_dsi_wide_bus_enabled(priv->dsi[index]);
>> +    dpu_enc->commit_done_timedout = false;
>> +
>>       mutex_lock(&dpu_enc->enc_lock);
>>       cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
>> @@ -2436,6 +2441,10 @@ int dpu_encoder_wait_for_commit_done(struct 
>> drm_encoder *drm_enc)
>>               DPU_ATRACE_BEGIN("wait_for_commit_done");
>>               ret = phys->ops.wait_for_commit_done(phys);
>>               DPU_ATRACE_END("wait_for_commit_done");
>> +            if (ret == -ETIMEDOUT && !dpu_enc->commit_done_timedout) {
>> +                dpu_enc->commit_done_timedout = true;
>> +                msm_disp_snapshot_state(drm_enc->dev);
>> +            }
>>               if (ret)
>>                   return ret;
>>           }
>>
