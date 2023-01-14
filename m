Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B7A66A782
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jan 2023 01:32:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31ADD10E224;
	Sat, 14 Jan 2023 00:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00B5810E222;
 Sat, 14 Jan 2023 00:32:52 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30E0F3ri011915; Sat, 14 Jan 2023 00:32:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=Vz3iyfTrJ+u6kosghJgiXiCgZsNnygXrYJt2/FBcm88=;
 b=g3xIQta+oOqnbYFRPWfIpptwSxGxxIHyzZvFSjVMnOhIwcrJ/m9FQ5b6x5v5QZXBgVP2
 u78H7rbqyZYllg0Gdiln5d/Y2CU6LJv8pp9ZRs4bchr9KGS/bzOn7oz/2iNfNDDy26yh
 vb8lPGLjLwBPBrLphvJqYaG39UfP9c8ChXKa1FkyH78/Hyne/yyVjvGwfpuQR1aONXNM
 uoB4a/wge7lXOBxvAyRSHWbryniKgFTaknERzcGRg9Hq/n6iI68Lzkl6JeXPH6E/osF7
 3CMAwhE5ScvIAaRlIRw5JvHLWF7TYoZ0HIfw0otdR6yZOgRB0r3Aj6iurUOjXMrTqOyY ZQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n2s0cu1b3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Jan 2023 00:32:46 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30E0Wj9h003091
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Jan 2023 00:32:45 GMT
Received: from [10.110.70.165] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 13 Jan
 2023 16:32:44 -0800
Message-ID: <2cf91727-c339-e319-602f-fa272b18ce9f@quicinc.com>
Date: Fri, 13 Jan 2023 16:32:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 1/2] drm/msm/dpu: remove dpu_encoder_virt_ops
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
References: <20230102154748.951328-1-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20230102154748.951328-1-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: CILfbIN2aqsbHsZ1CVRHkDmOu12Dw0Jh
X-Proofpoint-GUID: CILfbIN2aqsbHsZ1CVRHkDmOu12Dw0Jh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_12,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301140000
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
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/2/2023 7:47 AM, Dmitry Baryshkov wrote:
> Struct dpu_encoder_virt_ops is used to provide several callbacks to the
> phys_enc backends. However these ops are static and are not supposed to
> change in the foreseeble future. Drop the indirection and call
> corresponding functions directly.
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

With a few minor comments below.

Also, I did a quick check if this would conflict with PSR but this 
change wont, probably the next one will so this one should be okay.

> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 17 ++-----
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 47 ++++++++++---------
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 17 ++-----
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 11 ++---
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 13 ++---
>   5 files changed, 40 insertions(+), 65 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c6817b5a194..84f8c8a1b049 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -340,9 +340,7 @@ void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
>   			phys_enc->intf_idx - INTF_0, phys_enc->wb_idx - WB_0,
>   			phys_enc->hw_pp->idx - PINGPONG_0, intr_idx);
>   
> -	if (phys_enc->parent_ops->handle_frame_done)
> -		phys_enc->parent_ops->handle_frame_done(
> -				phys_enc->parent, phys_enc,
> +	dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc,
>   				DPU_ENCODER_FRAME_EVENT_ERROR);
>   }
>   
> @@ -1284,7 +1282,7 @@ static enum dpu_wb dpu_encoder_get_wb(const struct dpu_mdss_cfg *catalog,
>   	return WB_MAX;
>   }
>   
> -static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
> +void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>   		struct dpu_encoder_phys *phy_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc = NULL;
> @@ -1306,7 +1304,7 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>   	DPU_ATRACE_END("encoder_vblank_callback");
>   }
>   
> -static void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
> +void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
>   		struct dpu_encoder_phys *phy_enc)
>   {
>   	if (!phy_enc)
> @@ -1382,7 +1380,7 @@ void dpu_encoder_register_frame_event_callback(struct drm_encoder *drm_enc,
>   	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
>   }
>   
> -static void dpu_encoder_frame_done_callback(
> +void dpu_encoder_frame_done_callback(
>   		struct drm_encoder *drm_enc,
>   		struct dpu_encoder_phys *ready_phys, u32 event)
>   {
> @@ -2233,12 +2231,6 @@ static int dpu_encoder_virt_add_phys_encs(
>   	return 0;
>   }
>   
> -static const struct dpu_encoder_virt_ops dpu_encoder_parent_ops = {
> -	.handle_vblank_virt = dpu_encoder_vblank_callback,
> -	.handle_underrun_virt = dpu_encoder_underrun_callback,
> -	.handle_frame_done = dpu_encoder_frame_done_callback,
> -};
> -
>   static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   				 struct dpu_kms *dpu_kms,
>   				 struct msm_display_info *disp_info)
> @@ -2258,7 +2250,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   	memset(&phys_params, 0, sizeof(phys_params));
>   	phys_params.dpu_kms = dpu_kms;
>   	phys_params.parent = &dpu_enc->base;
> -	phys_params.parent_ops = &dpu_encoder_parent_ops;
>   	phys_params.enc_spinlock = &dpu_enc->enc_spinlock;
>   
>   	switch (disp_info->intf_type) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index f2af07d87f56..1d434b22180d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -60,25 +60,6 @@ enum dpu_enc_enable_state {
>   
>   struct dpu_encoder_phys;
>   
> -/**
> - * struct dpu_encoder_virt_ops - Interface the containing virtual encoder
> - *	provides for the physical encoders to use to callback.
> - * @handle_vblank_virt:	Notify virtual encoder of vblank IRQ reception
> - *			Note: This is called from IRQ handler context.
> - * @handle_underrun_virt: Notify virtual encoder of underrun IRQ reception
> - *			Note: This is called from IRQ handler context.
> - * @handle_frame_done:	Notify virtual encoder that this phys encoder
> - *			completes last request frame.
> - */
> -struct dpu_encoder_virt_ops {
> -	void (*handle_vblank_virt)(struct drm_encoder *,
> -			struct dpu_encoder_phys *phys);
> -	void (*handle_underrun_virt)(struct drm_encoder *,
> -			struct dpu_encoder_phys *phys);
> -	void (*handle_frame_done)(struct drm_encoder *,
> -			struct dpu_encoder_phys *phys, u32 event);
> -};
> -
>   /**
>    * struct dpu_encoder_phys_ops - Interface the physical encoders provide to
>    *	the containing virtual encoder.
> @@ -199,7 +180,6 @@ enum dpu_intr_idx {
>   struct dpu_encoder_phys {
>   	struct drm_encoder *parent;
>   	struct dpu_encoder_phys_ops ops;
> -	const struct dpu_encoder_virt_ops *parent_ops;
>   	struct dpu_hw_mdp *hw_mdptop;
>   	struct dpu_hw_ctl *hw_ctl;
>   	struct dpu_hw_pingpong *hw_pp;
> @@ -283,7 +263,6 @@ struct dpu_encoder_phys_cmd {
>   struct dpu_enc_phys_init_params {
>   	struct dpu_kms *dpu_kms;
>   	struct drm_encoder *parent;
> -	const struct dpu_encoder_virt_ops *parent_ops;
>   	enum dpu_enc_split_role split_role;
>   	enum dpu_intf intf_idx;
>   	enum dpu_wb wb_idx;
> @@ -400,4 +379,30 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
>    */
>   void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc);
>   
> +/**
> + * dpu_encoder_vblank_callback - Notify virtual encoder of vblank IRQ reception
> + * @drm_enc:    Pointer to drm encoder structure
> + * @phys_enc:	Pointer to physical encoder
> + * Note: This is called from IRQ handler context.
> + */
> +void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
> +				 struct dpu_encoder_phys *phy_enc);
> +
> +/** dpu_encoder_underrun_callback - Notify virtual encoder of underrun IRQ reception
> + * @drm_enc:    Pointer to drm encoder structure
> + * @phys_enc:	Pointer to physical encoder
> + * Note: This is called from IRQ handler context.
> + */
> +void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
> +				   struct dpu_encoder_phys *phy_enc);
> +
> +/** dpu_encoder_frame_done_callback -- Notify virtual encoder that this phys encoder completes last request frame
extra - before notify
Notify virtual encoder that this phys encoder has completed the last frame
> + * @drm_enc:    Pointer to drm encoder structure
> + * @phys_enc:	Pointer to physical encoder
> + * @event:	Event to process
> + */
> +void dpu_encoder_frame_done_callback(
> +		struct drm_encoder *drm_enc,
> +		struct dpu_encoder_phys *ready_phys, u32 event);
> +
>   #endif /* __dpu_encoder_phys_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index ae28b2b93e69..41bd7dd2b482 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -83,9 +83,7 @@ static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
>   
>   	DPU_ATRACE_BEGIN("pp_done_irq");
>   	/* notify all synchronous clients first, then asynchronous clients */
> -	if (phys_enc->parent_ops->handle_frame_done)
> -		phys_enc->parent_ops->handle_frame_done(phys_enc->parent,
> -				phys_enc, event);
> +	dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc, event);
>   
>   	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
>   	new_cnt = atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
> @@ -111,9 +109,7 @@ static void dpu_encoder_phys_cmd_pp_rd_ptr_irq(void *arg, int irq_idx)
>   	DPU_ATRACE_BEGIN("rd_ptr_irq");
>   	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
>   
> -	if (phys_enc->parent_ops->handle_vblank_virt)
> -		phys_enc->parent_ops->handle_vblank_virt(phys_enc->parent,
> -			phys_enc);
> +	dpu_encoder_vblank_callback(phys_enc->parent, phys_enc);
>   
>   	atomic_add_unless(&cmd_enc->pending_vblank_cnt, -1, 0);
>   	wake_up_all(&cmd_enc->pending_vblank_wq);
> @@ -137,9 +133,7 @@ static void dpu_encoder_phys_cmd_underrun_irq(void *arg, int irq_idx)
>   {
>   	struct dpu_encoder_phys *phys_enc = arg;
>   
> -	if (phys_enc->parent_ops->handle_underrun_virt)
> -		phys_enc->parent_ops->handle_underrun_virt(phys_enc->parent,
> -			phys_enc);
> +	dpu_encoder_underrun_callback(phys_enc->parent, phys_enc);
>   }
>   
>   static void dpu_encoder_phys_cmd_atomic_mode_set(
> @@ -202,9 +196,7 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
>   	/* request a ctl reset before the next kickoff */
>   	phys_enc->enable_state = DPU_ENC_ERR_NEEDS_HW_RESET;
>   
> -	if (phys_enc->parent_ops->handle_frame_done)
> -		phys_enc->parent_ops->handle_frame_done(
> -				drm_enc, phys_enc, frame_event);
> +	dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc, frame_event);
>   
>   	return -ETIMEDOUT;
>   }
> @@ -780,7 +772,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
>   
>   	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
>   	phys_enc->parent = p->parent;
> -	phys_enc->parent_ops = p->parent_ops;
>   	phys_enc->dpu_kms = p->dpu_kms;
>   	phys_enc->split_role = p->split_role;
>   	phys_enc->intf_mode = INTF_MODE_CMD;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 0f71e8fe7be7..39ca1b305114 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -308,9 +308,7 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
>   
>   	DPU_ATRACE_BEGIN("vblank_irq");
>   
> -	if (phys_enc->parent_ops->handle_vblank_virt)
> -		phys_enc->parent_ops->handle_vblank_virt(phys_enc->parent,
> -				phys_enc);
> +	dpu_encoder_vblank_callback(phys_enc->parent, phys_enc);
>   
>   	atomic_read(&phys_enc->pending_kickoff_cnt);
>   
> @@ -330,7 +328,7 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
>   	/* Signal any waiting atomic commit thread */
>   	wake_up_all(&phys_enc->pending_kickoff_wq);
>   
> -	phys_enc->parent_ops->handle_frame_done(phys_enc->parent, phys_enc,
> +	dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc,
>   			DPU_ENCODER_FRAME_EVENT_DONE);
>   
>   	DPU_ATRACE_END("vblank_irq");
> @@ -340,9 +338,7 @@ static void dpu_encoder_phys_vid_underrun_irq(void *arg, int irq_idx)
>   {
>   	struct dpu_encoder_phys *phys_enc = arg;
>   
> -	if (phys_enc->parent_ops->handle_underrun_virt)
> -		phys_enc->parent_ops->handle_underrun_virt(phys_enc->parent,
> -			phys_enc);
> +	dpu_encoder_underrun_callback(phys_enc->parent, phys_enc);
>   }
>   
>   static bool dpu_encoder_phys_vid_needs_single_flush(
> @@ -700,7 +696,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
>   
>   	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
>   	phys_enc->parent = p->parent;
> -	phys_enc->parent_ops = p->parent_ops;
>   	phys_enc->dpu_kms = p->dpu_kms;
>   	phys_enc->split_role = p->split_role;
>   	phys_enc->intf_mode = INTF_MODE_VIDEO;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 7cbcef6efe17..c5146b6477d6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -365,13 +365,9 @@ static void _dpu_encoder_phys_wb_frame_done_helper(void *arg)
>   
>   	DPU_DEBUG("[wb:%d]\n", hw_wb->idx - WB_0);
>   
> -	if (phys_enc->parent_ops->handle_frame_done)
> -		phys_enc->parent_ops->handle_frame_done(phys_enc->parent,
> -				phys_enc, event);
> +	dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc, event);
>   
> -	if (phys_enc->parent_ops->handle_vblank_virt)
> -		phys_enc->parent_ops->handle_vblank_virt(phys_enc->parent,
> -				phys_enc);
> +	dpu_encoder_vblank_callback(phys_enc->parent, phys_enc);
>   
>   	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
>   	atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
> @@ -441,9 +437,7 @@ static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
>   	if (wb_enc->wb_conn)
>   		drm_writeback_signal_completion(wb_enc->wb_conn, 0);
>   
> -	if (phys_enc->parent_ops->handle_frame_done)
> -		phys_enc->parent_ops->handle_frame_done(
> -				phys_enc->parent, phys_enc, frame_event);
> +	dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc, frame_event);
>   }
>   
>   /**
> @@ -723,7 +717,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
>   
>   	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
>   	phys_enc->parent = p->parent;
> -	phys_enc->parent_ops = p->parent_ops;
>   	phys_enc->dpu_kms = p->dpu_kms;
>   	phys_enc->split_role = p->split_role;
>   	phys_enc->intf_mode = INTF_MODE_WB_LINE;
