Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9104877FE81
	for <lists+dri-devel@lfdr.de>; Thu, 17 Aug 2023 21:27:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC8A10E2C3;
	Thu, 17 Aug 2023 19:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D989A10E0B5;
 Thu, 17 Aug 2023 19:27:37 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 37HE0CX7024495; Thu, 17 Aug 2023 19:27:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=1AgtPxpK+4KO/5pmxW1d2FzBpUL8URkzXFOOIdlye6Y=;
 b=KIZ4EQz+YwdtZ0VKo4NCm5ISbsIxpz/LolRS2KL4wQAC6sDhiq8TqXy03TyqBfaVhM0w
 WXXmqDy+h/UR4UuSIRlP/7nJK2LEOPNTl7MybK/FarX1BTKL/oFnhnUICV7OzfCMVM78
 nHnpr6FAzd5FrzE4ZKqFOEx4U2qZznnU0QRMkqEbpg6BQoEaFraN6neTX2qL/Txp2Zhr
 wguhWlVEascvSCwtZEekKZPoy7hscTNvyp8LOQfjgrkdL7jNqWWrhIlS4sD1jpzomNiN
 622xMK1MF00QLTBgKaQ2sJtqW/KvHavxkjjzmnw2vwt1Zf0q99wByJfUfBUmV68oa/gi Tg== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sh0tnbach-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Aug 2023 19:27:31 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 37HJRULu002029
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Aug 2023 19:27:30 GMT
Received: from [10.134.70.142] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 17 Aug
 2023 12:27:29 -0700
Message-ID: <9f86ce98-156d-25cb-e35f-6d266d2eac14@quicinc.com>
Date: Thu, 17 Aug 2023 12:27:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dpu: drop
 dpu_encoder_phys_ops.atomic_mode_set
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>
References: <20230604144514.949628-1-dmitry.baryshkov@linaro.org>
 <20230604144514.949628-4-dmitry.baryshkov@linaro.org>
 <821d87bd-f428-57d1-ba30-29aed8fcdb65@quicinc.com>
 <93881487-6574-47df-92bc-b5fb4d174d33@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <93881487-6574-47df-92bc-b5fb4d174d33@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 7Yt3zFXJ2XWhtUeqb7r13fN_kZK3_oWb
X-Proofpoint-ORIG-GUID: 7Yt3zFXJ2XWhtUeqb7r13fN_kZK3_oWb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_15,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 impostorscore=0 mlxscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308170175
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/17/2023 11:50 AM, Dmitry Baryshkov wrote:
> On 08/08/2023 02:49, Abhinav Kumar wrote:
>>
>>
>> On 6/4/2023 7:45 AM, Dmitry Baryshkov wrote:
>>> The atomic_mode_set() callback only sets the phys_enc's IRQ data. As the
>>> INTF and WB are statically allocated to each encoder/phys_enc, drop the
>>> atomic_mode_set callback and set the IRQs during encoder init.
>>>
>>> For the CMD panel usecase some of IRQ indexes depend on the selected
>>> resources. Move setting them to the irq_enable() callback.
>>>
>>
>> The irq_enable() callback is called from the 
>> dpu_encoder_virt_atomic_enable() after the phys layer's enable.
>>
>> Thats late.
>>
>> So lets consider the case where command mode panel's clock is powered 
>> from bootloader (quite common).
>>
>> Now, as soon as the tearcheck is configured and interface is ON from 
>> the phys's enable(), nothing prevents / should prevent the interrupt 
>> from firing.
> 
> Please note that interrupt callbacks are also registered from the 
> irq_control(). There is no way the interrupt can fire beforehand (and 
> the call chain is dpu_encoder_virt_atomic_enable() -> 
> dpu_encoder_resource_control() -> _dpu_encoder_resource_control_helper() 
> -> _dpu_encoder_irq_control() -> irq_control().
> 
> If we ever want to move irq_control() to be called before phys's 
> enable() callbacks, this will be a separate patchset, involving 
> refactoring of dpu_encoder_resource_control().
> 

Ack, I will rebase my patches on top of this and re-test it.

Then will give my R-b, tested-by tags by Monday.

>>
>> So I feel / think mode_set is the correct location to assign these.
>>
>> I can ack patches 1 and 2 but I think you did those mainly for this 
>> one, so I would like to get some clarity on this part.
>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 --
>>>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  5 ---
>>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 32 ++++++++-----------
>>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 13 ++------
>>>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 11 +------
>>>   5 files changed, 17 insertions(+), 46 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> index cc61f0cf059d..6b5c80dc5967 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>>> @@ -1148,8 +1148,6 @@ static void 
>>> dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>>>           phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>>>           phys->cached_mode = crtc_state->adjusted_mode;
>>> -        if (phys->ops.atomic_mode_set)
>>> -            phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
>>>       }
>>>   }
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>> index faf033cd086e..24dbc28be4f8 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
>>> @@ -67,8 +67,6 @@ struct dpu_encoder_phys;
>>>    * @is_master:            Whether this phys_enc is the current master
>>>    *                encoder. Can be switched at enable time. Based
>>>    *                on split_role and current mode (CMD/VID).
>>> - * @atomic_mode_set:        DRM Call. Set a DRM mode.
>>> - *                This likely caches the mode, for use at enable.
>>>    * @enable:            DRM Call. Enable a DRM mode.
>>>    * @disable:            DRM Call. Disable mode.
>>>    * @atomic_check:        DRM Call. Atomic check new DRM state.
>>> @@ -95,9 +93,6 @@ struct dpu_encoder_phys;
>>>   struct dpu_encoder_phys_ops {
>>>       void (*prepare_commit)(struct dpu_encoder_phys *encoder);
>>>       bool (*is_master)(struct dpu_encoder_phys *encoder);
>>> -    void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
>>> -            struct drm_crtc_state *crtc_state,
>>> -            struct drm_connector_state *conn_state);
>>>       void (*enable)(struct dpu_encoder_phys *encoder);
>>>       void (*disable)(struct dpu_encoder_phys *encoder);
>>>       int (*atomic_check)(struct dpu_encoder_phys *encoder,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> index 3422b49f23c2..a0b7d8803e94 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
>>> @@ -140,23 +140,6 @@ static void 
>>> dpu_encoder_phys_cmd_underrun_irq(void *arg, int irq_idx)
>>>       dpu_encoder_underrun_callback(phys_enc->parent, phys_enc);
>>>   }
>>> -static void dpu_encoder_phys_cmd_atomic_mode_set(
>>> -        struct dpu_encoder_phys *phys_enc,
>>> -        struct drm_crtc_state *crtc_state,
>>> -        struct drm_connector_state *conn_state)
>>> -{
>>> -    phys_enc->irq[INTR_IDX_CTL_START] = 
>>> phys_enc->hw_ctl->caps->intr_start;
>>> -
>>> -    phys_enc->irq[INTR_IDX_PINGPONG] = 
>>> phys_enc->hw_pp->caps->intr_done;
>>> -
>>> -    if (phys_enc->has_intf_te)
>>> -        phys_enc->irq[INTR_IDX_RDPTR] = 
>>> phys_enc->hw_intf->cap->intr_tear_rd_ptr;
>>> -    else
>>> -        phys_enc->irq[INTR_IDX_RDPTR] = 
>>> phys_enc->hw_pp->caps->intr_rdptr;
>>> -
>>> -    phys_enc->irq[INTR_IDX_UNDERRUN] = 
>>> phys_enc->hw_intf->cap->intr_underrun;
>>> -}
>>> -
>>>   static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
>>>           struct dpu_encoder_phys *phys_enc)
>>>   {
>>> @@ -287,6 +270,14 @@ static void 
>>> dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
>>>                       true,
>>>                       atomic_read(&phys_enc->vblank_refcount));
>>> +    phys_enc->irq[INTR_IDX_CTL_START] = 
>>> phys_enc->hw_ctl->caps->intr_start;
>>> +    phys_enc->irq[INTR_IDX_PINGPONG] = 
>>> phys_enc->hw_pp->caps->intr_done;
>>> +
>>> +    if (phys_enc->has_intf_te)
>>> +        phys_enc->irq[INTR_IDX_RDPTR] = 
>>> phys_enc->hw_intf->cap->intr_tear_rd_ptr;
>>> +    else
>>> +        phys_enc->irq[INTR_IDX_RDPTR] = 
>>> phys_enc->hw_pp->caps->intr_rdptr;
>>> +
>>>       dpu_core_irq_register_callback(phys_enc->dpu_kms,
>>>                          phys_enc->irq[INTR_IDX_PINGPONG],
>>>                          dpu_encoder_phys_cmd_pp_tx_done_irq,
>>> @@ -318,6 +309,10 @@ static void 
>>> dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
>>>       dpu_core_irq_unregister_callback(phys_enc->dpu_kms, 
>>> phys_enc->irq[INTR_IDX_UNDERRUN]);
>>>       dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
>>>       dpu_core_irq_unregister_callback(phys_enc->dpu_kms, 
>>> phys_enc->irq[INTR_IDX_PINGPONG]);
>>> +
>>> +    phys_enc->irq[INTR_IDX_CTL_START] = -1;
>>> +    phys_enc->irq[INTR_IDX_PINGPONG] = -1;
>>> +    phys_enc->irq[INTR_IDX_RDPTR] = -1;
>>>   }
>>>   static void dpu_encoder_phys_cmd_tearcheck_config(
>>> @@ -737,7 +732,6 @@ static void dpu_encoder_phys_cmd_init_ops(
>>>           struct dpu_encoder_phys_ops *ops)
>>>   {
>>>       ops->is_master = dpu_encoder_phys_cmd_is_master;
>>> -    ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
>>>       ops->enable = dpu_encoder_phys_cmd_enable;
>>>       ops->disable = dpu_encoder_phys_cmd_disable;
>>>       ops->destroy = dpu_encoder_phys_cmd_destroy;
>>> @@ -775,6 +769,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>>>       dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
>>>       phys_enc->intf_mode = INTF_MODE_CMD;
>>> +    phys_enc->irq[INTR_IDX_UNDERRUN] = 
>>> phys_enc->hw_intf->cap->intr_underrun;
>>> +
>>>       cmd_enc->stream_sel = 0;
>>>       phys_enc->has_intf_te = test_bit(DPU_INTF_TE,
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> index a550b290246c..3f2e0ebe3cfc 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
>>> @@ -348,16 +348,6 @@ static bool 
>>> dpu_encoder_phys_vid_needs_single_flush(
>>>       return phys_enc->split_role != ENC_ROLE_SOLO;
>>>   }
>>> -static void dpu_encoder_phys_vid_atomic_mode_set(
>>> -        struct dpu_encoder_phys *phys_enc,
>>> -        struct drm_crtc_state *crtc_state,
>>> -        struct drm_connector_state *conn_state)
>>> -{
>>> -    phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
>>> -
>>> -    phys_enc->irq[INTR_IDX_UNDERRUN] = 
>>> phys_enc->hw_intf->cap->intr_underrun;
>>> -}
>>> -
>>>   static int dpu_encoder_phys_vid_control_vblank_irq(
>>>           struct dpu_encoder_phys *phys_enc,
>>>           bool enable)
>>> @@ -684,7 +674,6 @@ static int dpu_encoder_phys_vid_get_frame_count(
>>>   static void dpu_encoder_phys_vid_init_ops(struct 
>>> dpu_encoder_phys_ops *ops)
>>>   {
>>>       ops->is_master = dpu_encoder_phys_vid_is_master;
>>> -    ops->atomic_mode_set = dpu_encoder_phys_vid_atomic_mode_set;
>>>       ops->enable = dpu_encoder_phys_vid_enable;
>>>       ops->disable = dpu_encoder_phys_vid_disable;
>>>       ops->destroy = dpu_encoder_phys_vid_destroy;
>>> @@ -723,6 +712,8 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>>>       dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
>>>       phys_enc->intf_mode = INTF_MODE_VIDEO;
>>> +    phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
>>> +    phys_enc->irq[INTR_IDX_UNDERRUN] = 
>>> phys_enc->hw_intf->cap->intr_underrun;
>>>       DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", 
>>> p->hw_intf->idx);
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>> index 858fe6656c9b..439f645e0bc9 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
>>> @@ -410,15 +410,6 @@ static void 
>>> dpu_encoder_phys_wb_irq_disable(struct dpu_encoder_phys *phys)
>>>           dpu_core_irq_unregister_callback(phys->dpu_kms, 
>>> phys->irq[INTR_IDX_WB_DONE]);
>>>   }
>>> -static void dpu_encoder_phys_wb_atomic_mode_set(
>>> -        struct dpu_encoder_phys *phys_enc,
>>> -        struct drm_crtc_state *crtc_state,
>>> -        struct drm_connector_state *conn_state)
>>> -{
>>> -
>>> -    phys_enc->irq[INTR_IDX_WB_DONE] = 
>>> phys_enc->hw_wb->caps->intr_wb_done;
>>> -}
>>> -
>>>   static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
>>>           struct dpu_encoder_phys *phys_enc)
>>>   {
>>> @@ -668,7 +659,6 @@ static bool 
>>> dpu_encoder_phys_wb_is_valid_for_commit(struct dpu_encoder_phys *phy
>>>   static void dpu_encoder_phys_wb_init_ops(struct 
>>> dpu_encoder_phys_ops *ops)
>>>   {
>>>       ops->is_master = dpu_encoder_phys_wb_is_master;
>>> -    ops->atomic_mode_set = dpu_encoder_phys_wb_atomic_mode_set;
>>>       ops->enable = dpu_encoder_phys_wb_enable;
>>>       ops->disable = dpu_encoder_phys_wb_disable;
>>>       ops->destroy = dpu_encoder_phys_wb_destroy;
>>> @@ -715,6 +705,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
>>>       dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
>>>       phys_enc->intf_mode = INTF_MODE_WB_LINE;
>>> +    phys_enc->irq[INTR_IDX_WB_DONE] = 
>>> phys_enc->hw_wb->caps->intr_wb_done;
>>>       atomic_set(&wb_enc->wbirq_refcount, 0);
> 
