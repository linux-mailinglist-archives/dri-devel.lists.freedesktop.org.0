Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960998C4DC3
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 10:39:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3CE10E3E4;
	Tue, 14 May 2024 08:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="lnWDa536";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D362510E2CC;
 Tue, 14 May 2024 08:39:20 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ8qGb009927;
 Tue, 14 May 2024 08:39:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=
 qcppdkim1; bh=W+cQzK1jV7GXUwc2V171zeRC9Hwm7VPkbzzlgUEJxjQ=; b=ln
 WDa536xBLsio82+i8IHgpANcLLAcx3OKC5Sp4/05IHmCzVEXSXi0BD8hnumKV+Ef
 4mdUBu04nsOX9k2megVmOTegd/WWGoCNisfSewWnaBdAf+vlRV/wt0PyIF4+j16v
 kCbS2e6OSv0ToV86RY1L/n9TzaTLCmyOjzz6ZvzHSsoQhAev95dkAi8R3v+LZRhT
 WPNQscWiiwIHMXnZW0glthKr+K+o2G6efmne6Zr2EgTLygsyA7lZUyX9x27svKO0
 egzRzotUvQ/i4W5EIiaU8ocM7lrkMLKb7caAkJ6+hwYZ+IoGqaOub0DhVC+g8KtA
 hdUBdM5ovR1p9y1LpxIw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y21eddk78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 May 2024 08:39:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44E8dFW7009982
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 May 2024 08:39:15 GMT
Received: from [10.110.76.247] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 14 May
 2024 01:39:14 -0700
Message-ID: <34743d0c-287f-be2a-847e-3a65eb4815fa@quicinc.com>
Date: Tue, 14 May 2024 01:39:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] Revert "drm/msm/dpu: drop
 dpu_encoder_phys_ops.atomic_mode_set"
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten
 <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
References: <20240514-dpu-revert-ams-v1-1-b13623d6cd5f@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20240514-dpu-revert-ams-v1-1-b13623d6cd5f@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: m7lMPOgT_FuV0DG9uxJClpePdwPWOyCm
X-Proofpoint-ORIG-GUID: m7lMPOgT_FuV0DG9uxJClpePdwPWOyCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_03,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405140060
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



On 5/14/2024 12:56 AM, Dmitry Baryshkov wrote:
> In the DPU driver blank IRQ handling is called from a vblank worker and
> can happen outside of the irq_enable / irq_disable pair. Revert commit
> d13f638c9b88 ("drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set")
> to fix vblank IRQ assignment for CMD DSI panels.
> 

Can you please explain the sequence of events causing an issue due to 
moving the irq assignment to init and how is moving it back to modeset 
helping?

> Fixes: d13f638c9b88 ("drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  2 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  5 ++++
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 32 ++++++++++++----------
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 13 +++++++--
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 11 +++++++-
>   5 files changed, 46 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 119f3ea50a7c..a7d8ecf3f5be 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1200,6 +1200,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>   
>   		phys->cached_mode = crtc_state->adjusted_mode;
> +		if (phys->ops.atomic_mode_set)
> +			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
>   	}
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 002e89cc1705..30470cd15a48 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -69,6 +69,8 @@ struct dpu_encoder_phys;
>    * @is_master:			Whether this phys_enc is the current master
>    *				encoder. Can be switched at enable time. Based
>    *				on split_role and current mode (CMD/VID).
> + * @atomic_mode_set:		DRM Call. Set a DRM mode.
> + *				This likely caches the mode, for use at enable.
>    * @enable:			DRM Call. Enable a DRM mode.
>    * @disable:			DRM Call. Disable mode.
>    * @control_vblank_irq		Register/Deregister for VBLANK IRQ
> @@ -93,6 +95,9 @@ struct dpu_encoder_phys;
>   struct dpu_encoder_phys_ops {
>   	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
>   	bool (*is_master)(struct dpu_encoder_phys *encoder);
> +	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
> +			struct drm_crtc_state *crtc_state,
> +			struct drm_connector_state *conn_state);
>   	void (*enable)(struct dpu_encoder_phys *encoder);
>   	void (*disable)(struct dpu_encoder_phys *encoder);
>   	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 489be1c0c704..95cd39b49668 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -142,6 +142,23 @@ static void dpu_encoder_phys_cmd_underrun_irq(void *arg)
>   	dpu_encoder_underrun_callback(phys_enc->parent, phys_enc);
>   }
>   
> +static void dpu_encoder_phys_cmd_atomic_mode_set(
> +		struct dpu_encoder_phys *phys_enc,
> +		struct drm_crtc_state *crtc_state,
> +		struct drm_connector_state *conn_state)
> +{
> +	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
> +
> +	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
> +
> +	if (phys_enc->has_intf_te)
> +		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
> +	else
> +		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
> +
> +	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
> +}
> +
>   static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> @@ -280,14 +297,6 @@ static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
>   					  phys_enc->hw_pp->idx - PINGPONG_0,
>   					  phys_enc->vblank_refcount);
>   
> -	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
> -	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
> -
> -	if (phys_enc->has_intf_te)
> -		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
> -	else
> -		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
> -
>   	dpu_core_irq_register_callback(phys_enc->dpu_kms,
>   				       phys_enc->irq[INTR_IDX_PINGPONG],
>   				       dpu_encoder_phys_cmd_pp_tx_done_irq,
> @@ -318,10 +327,6 @@ static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
>   	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_UNDERRUN]);
>   	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
>   	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_PINGPONG]);
> -
> -	phys_enc->irq[INTR_IDX_CTL_START] = 0;
> -	phys_enc->irq[INTR_IDX_PINGPONG] = 0;
> -	phys_enc->irq[INTR_IDX_RDPTR] = 0;
>   }
>   
>   static void dpu_encoder_phys_cmd_tearcheck_config(
> @@ -698,6 +703,7 @@ static void dpu_encoder_phys_cmd_init_ops(
>   		struct dpu_encoder_phys_ops *ops)
>   {
>   	ops->is_master = dpu_encoder_phys_cmd_is_master;
> +	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
>   	ops->enable = dpu_encoder_phys_cmd_enable;
>   	ops->disable = dpu_encoder_phys_cmd_disable;
>   	ops->control_vblank_irq = dpu_encoder_phys_cmd_control_vblank_irq;
> @@ -736,8 +742,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
>   
>   	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
>   	phys_enc->intf_mode = INTF_MODE_CMD;
> -	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
> -
>   	cmd_enc->stream_sel = 0;
>   
>   	if (!phys_enc->hw_intf) {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ef69c2f408c3..636a97432d51 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -356,6 +356,16 @@ static bool dpu_encoder_phys_vid_needs_single_flush(
>   	return phys_enc->split_role != ENC_ROLE_SOLO;
>   }
>   
> +static void dpu_encoder_phys_vid_atomic_mode_set(
> +		struct dpu_encoder_phys *phys_enc,
> +		struct drm_crtc_state *crtc_state,
> +		struct drm_connector_state *conn_state)
> +{
> +	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
> +
> +	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
> +}
> +
>   static int dpu_encoder_phys_vid_control_vblank_irq(
>   		struct dpu_encoder_phys *phys_enc,
>   		bool enable)
> @@ -699,6 +709,7 @@ static int dpu_encoder_phys_vid_get_frame_count(
>   static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>   {
>   	ops->is_master = dpu_encoder_phys_vid_is_master;
> +	ops->atomic_mode_set = dpu_encoder_phys_vid_atomic_mode_set;
>   	ops->enable = dpu_encoder_phys_vid_enable;
>   	ops->disable = dpu_encoder_phys_vid_disable;
>   	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
> @@ -737,8 +748,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(struct drm_device *dev,
>   
>   	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
>   	phys_enc->intf_mode = INTF_MODE_VIDEO;
> -	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
> -	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
>   
>   	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->hw_intf->idx);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index d3ea91c1d7d2..356dca5e5ea9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -404,6 +404,15 @@ static void dpu_encoder_phys_wb_irq_disable(struct dpu_encoder_phys *phys)
>   		dpu_core_irq_unregister_callback(phys->dpu_kms, phys->irq[INTR_IDX_WB_DONE]);
>   }
>   
> +static void dpu_encoder_phys_wb_atomic_mode_set(
> +		struct dpu_encoder_phys *phys_enc,
> +		struct drm_crtc_state *crtc_state,
> +		struct drm_connector_state *conn_state)
> +{
> +
> +	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
> +}
> +
>   static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> @@ -640,6 +649,7 @@ static bool dpu_encoder_phys_wb_is_valid_for_commit(struct dpu_encoder_phys *phy
>   static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
>   {
>   	ops->is_master = dpu_encoder_phys_wb_is_master;
> +	ops->atomic_mode_set = dpu_encoder_phys_wb_atomic_mode_set;
>   	ops->enable = dpu_encoder_phys_wb_enable;
>   	ops->disable = dpu_encoder_phys_wb_disable;
>   	ops->wait_for_commit_done = dpu_encoder_phys_wb_wait_for_commit_done;
> @@ -685,7 +695,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(struct drm_device *dev,
>   
>   	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
>   	phys_enc->intf_mode = INTF_MODE_WB_LINE;
> -	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
>   
>   	atomic_set(&wb_enc->wbirq_refcount, 0);
>   
> 
> ---
> base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
> change-id: 20240514-dpu-revert-ams-9410abc1ee48
> 
> Best regards,
