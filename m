Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 701384B3188
	for <lists+dri-devel@lfdr.de>; Sat, 12 Feb 2022 00:53:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C40410EB52;
	Fri, 11 Feb 2022 23:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com
 [199.106.114.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A32F10EB52;
 Fri, 11 Feb 2022 23:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
 t=1644623618; x=1676159618;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yzDQ4Zy4Vt8RIKYhkXDtgWxSAHoeRUOf+5AGjSXn+Mc=;
 b=kAf4RdPnae3BKxHGU+EcvyJfbg3+z8Q3cpG+/L1Ag6gAxI1RP4az9i/q
 adL5hlAm6whFaakBO91g5jyNjFM7Ppv02ZRphbQ65sjUcnDT4PmBCogMr
 /AdIn/AO+H0L2yTucuB7DDdrM5uBpI+UBRj9dKa0cfPbdvwL6+HgavldO c=;
Received: from unknown (HELO ironmsg01-sd.qualcomm.com) ([10.53.140.141])
 by alexa-out-sd-02.qualcomm.com with ESMTP; 11 Feb 2022 15:53:37 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
 by ironmsg01-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2022 15:53:36 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Fri, 11 Feb 2022 15:53:35 -0800
Received: from [10.38.246.233] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.19; Fri, 11 Feb
 2022 15:53:33 -0800
Message-ID: <cf8c49e0-5656-69b2-c35e-8df3cfaffb40@quicinc.com>
Date: Fri, 11 Feb 2022 15:53:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 5/7] drm/msm/dpu: encoder: drop unused callbacks
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>
References: <20220203082611.2654810-1-dmitry.baryshkov@linaro.org>
 <20220203082611.2654810-6-dmitry.baryshkov@linaro.org>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20220203082611.2654810-6-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 2/3/2022 12:26 AM, Dmitry Baryshkov wrote:
> Both cmd and vid backends provide no atomic_check() callbacks and
> useless mode_fixup() callbacks. Drop support for both of them.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

We can drop mode_fixup() but I am using atomic_check() for WB to 
validate whether the programmed FB exceeds WB limits OR
the programmed mode. Hence without an alternative for that we cannot 
drop that

Please refer to dpu_encoder_phys_wb_atomic_check in 
https://patchwork.freedesktop.org/patch/472324/

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 39 +++++--------------
>   .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  8 ----
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 10 -----
>   .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 14 -------
>   4 files changed, 9 insertions(+), 62 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 4530549850f0..e1c43a0c0643 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -573,7 +573,6 @@ static int dpu_encoder_virt_atomic_check(
>   	struct drm_display_mode *adj_mode;
>   	struct msm_display_topology topology;
>   	struct dpu_global_state *global_state;
> -	int i = 0;
>   	int ret = 0;
>   
>   	if (!drm_enc || !crtc_state || !conn_state) {
> @@ -595,39 +594,19 @@ static int dpu_encoder_virt_atomic_check(
>   
>   	trace_dpu_enc_atomic_check(DRMID(drm_enc));
>   
> -	/* perform atomic check on the first physical encoder (master) */
> -	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> -		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
> -
> -		if (phys->ops.atomic_check)
> -			ret = phys->ops.atomic_check(phys, crtc_state,
> -					conn_state);
> -		else if (phys->ops.mode_fixup)
> -			if (!phys->ops.mode_fixup(phys, mode, adj_mode))
> -				ret = -EINVAL;
> -
> -		if (ret) {
> -			DPU_ERROR_ENC(dpu_enc,
> -					"mode unsupported, phys idx %d\n", i);
> -			break;
> -		}
> -	}
> -
>   	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
>   
>   	/* Reserve dynamic resources now. */
> -	if (!ret) {
> -		/*
> -		 * Release and Allocate resources on every modeset
> -		 * Dont allocate when active is false.
> -		 */
> -		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> -			dpu_rm_release(global_state, drm_enc);
> +	/*
> +	 * Release and Allocate resources on every modeset
> +	 * Dont allocate when active is false.
> +	 */
> +	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
> +		dpu_rm_release(global_state, drm_enc);
>   
> -			if (!crtc_state->active_changed || crtc_state->active)
> -				ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> -						drm_enc, crtc_state, topology);
> -		}
> +		if (!crtc_state->active_changed || crtc_state->active)
> +			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
> +					drm_enc, crtc_state, topology);
>   	}
>   
>   	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index e7270eb6b84b..159deb8ed7fb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -84,12 +84,10 @@ struct dpu_encoder_virt_ops {
>    * @is_master:			Whether this phys_enc is the current master
>    *				encoder. Can be switched at enable time. Based
>    *				on split_role and current mode (CMD/VID).
> - * @mode_fixup:			DRM Call. Fixup a DRM mode.
>    * @mode_set:			DRM Call. Set a DRM mode.
>    *				This likely caches the mode, for use at enable.
>    * @enable:			DRM Call. Enable a DRM mode.
>    * @disable:			DRM Call. Disable mode.
> - * @atomic_check:		DRM Call. Atomic check new DRM state.
>    * @destroy:			DRM Call. Destroy and release resources.
>    * @get_hw_resources:		Populate the structure with the hardware
>    *				resources that this phys_enc is using.
> @@ -117,17 +115,11 @@ struct dpu_encoder_phys_ops {
>   			struct dentry *debugfs_root);
>   	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
>   	bool (*is_master)(struct dpu_encoder_phys *encoder);
> -	bool (*mode_fixup)(struct dpu_encoder_phys *encoder,
> -			const struct drm_display_mode *mode,
> -			struct drm_display_mode *adjusted_mode);
>   	void (*mode_set)(struct dpu_encoder_phys *encoder,
>   			struct drm_display_mode *mode,
>   			struct drm_display_mode *adjusted_mode);
>   	void (*enable)(struct dpu_encoder_phys *encoder);
>   	void (*disable)(struct dpu_encoder_phys *encoder);
> -	int (*atomic_check)(struct dpu_encoder_phys *encoder,
> -			    struct drm_crtc_state *crtc_state,
> -			    struct drm_connector_state *conn_state);
>   	void (*destroy)(struct dpu_encoder_phys *encoder);
>   	void (*get_hw_resources)(struct dpu_encoder_phys *encoder,
>   				 struct dpu_encoder_hw_resources *hw_res);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index 34a6940d12c5..45fe97fb612d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -45,15 +45,6 @@ static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
>   	return (phys_enc->split_role != ENC_ROLE_SLAVE);
>   }
>   
> -static bool dpu_encoder_phys_cmd_mode_fixup(
> -		struct dpu_encoder_phys *phys_enc,
> -		const struct drm_display_mode *mode,
> -		struct drm_display_mode *adj_mode)
> -{
> -	DPU_DEBUG_CMDENC(to_dpu_encoder_phys_cmd(phys_enc), "\n");
> -	return true;
> -}
> -
>   static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> @@ -732,7 +723,6 @@ static void dpu_encoder_phys_cmd_init_ops(
>   	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
>   	ops->is_master = dpu_encoder_phys_cmd_is_master;
>   	ops->mode_set = dpu_encoder_phys_cmd_mode_set;
> -	ops->mode_fixup = dpu_encoder_phys_cmd_mode_fixup;
>   	ops->enable = dpu_encoder_phys_cmd_enable;
>   	ops->disable = dpu_encoder_phys_cmd_disable;
>   	ops->destroy = dpu_encoder_phys_cmd_destroy;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ddd9d89cd456..1831fe37c88c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -225,19 +225,6 @@ static void programmable_fetch_config(struct dpu_encoder_phys *phys_enc,
>   	spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
>   }
>   
> -static bool dpu_encoder_phys_vid_mode_fixup(
> -		struct dpu_encoder_phys *phys_enc,
> -		const struct drm_display_mode *mode,
> -		struct drm_display_mode *adj_mode)
> -{
> -	DPU_DEBUG_VIDENC(phys_enc, "\n");
> -
> -	/*
> -	 * Modifying mode has consequences when the mode comes back to us
> -	 */
> -	return true;
> -}
> -
>   static void dpu_encoder_phys_vid_setup_timing_engine(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> @@ -676,7 +663,6 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
>   {
>   	ops->is_master = dpu_encoder_phys_vid_is_master;
>   	ops->mode_set = dpu_encoder_phys_vid_mode_set;
> -	ops->mode_fixup = dpu_encoder_phys_vid_mode_fixup;
>   	ops->enable = dpu_encoder_phys_vid_enable;
>   	ops->disable = dpu_encoder_phys_vid_disable;
>   	ops->destroy = dpu_encoder_phys_vid_destroy;
