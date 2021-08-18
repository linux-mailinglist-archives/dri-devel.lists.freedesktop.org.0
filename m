Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D753EF8B3
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 05:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AD66E332;
	Wed, 18 Aug 2021 03:35:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E8826E332
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 03:35:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1629257736; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=qCrmXzudiSN8HgX6IsYkQa32BFt0lRqrA5+HjNFleLg=;
 b=guZhNhO+Owf8ocnkY+oplHTyf173igkMux481iIerSYR3yI19nprzCF7XZH0aALZKZ5Fmlo5
 XmJXafPzXWOt4IIdCdCwP6HH3I83kdXtTefKrWpzqCqbboICHcZ1g4LJuLbOdU0vHRQxsLRy
 ZzWUaOXZe3vxHVpVqtgAemjTVZs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 611c7ff166ff10790467f9cb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 18 Aug 2021 03:35:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 21277C4360C; Wed, 18 Aug 2021 03:35:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 34BF7C4338F;
 Wed, 18 Aug 2021 03:35:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 17 Aug 2021 20:35:09 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH v2 6/7] drm/msm/dpu: get rid of
 dpu_encoder_helper_(un)register_irq
In-Reply-To: <20210617222029.463045-7-dmitry.baryshkov@linaro.org>
References: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
 <20210617222029.463045-7-dmitry.baryshkov@linaro.org>
Message-ID: <445e180f28dd4af427adfdcafe53db48@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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

On 2021-06-17 15:20, Dmitry Baryshkov wrote:
> Get rid of dpu_encoder_helper_register_irq/unregister_irq helpers, call
> dpu_core_register/unregister_callback directly, without surrounding 
> them
> with helpers.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 64 -------------------
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 18 ------
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 39 +++++++----
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 21 ++++--
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  4 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 29 +++------
>  6 files changed, 56 insertions(+), 119 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index d3557b0f4db9..3d8864df8605 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -333,70 +333,6 @@ int dpu_encoder_helper_wait_for_irq(struct
> dpu_encoder_phys *phys_enc,
>  	return ret;
>  }
> 
> -int dpu_encoder_helper_register_irq(struct dpu_encoder_phys *phys_enc,
> -		enum dpu_intr_idx intr_idx)
> -{
> -	struct dpu_encoder_irq *irq;
> -	int ret = 0;
> -
> -	if (intr_idx >= INTR_IDX_MAX) {
> -		DPU_ERROR("invalid params\n");
> -		return -EINVAL;
> -	}
> -	irq = &phys_enc->irq[intr_idx];
> -
> -	if (irq->irq_idx < 0) {
> -		DPU_ERROR_PHYS(phys_enc,
> -			"invalid IRQ index:%d\n", irq->irq_idx);
> -		return -EINVAL;
> -	}
> -
> -	ret = dpu_core_irq_register_callback(phys_enc->dpu_kms, irq->irq_idx,
> -			irq->func, phys_enc);
> -	if (ret) {
> -		DPU_ERROR_PHYS(phys_enc,
> -			"failed to register IRQ callback for %s\n",
> -			irq->name);
> -		irq->irq_idx = -EINVAL;
> -		return ret;
> -	}
> -
> -	trace_dpu_enc_irq_register_success(DRMID(phys_enc->parent), intr_idx,
> -				irq->irq_idx);
> -
> -	return ret;
> -}
> -
> -int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys 
> *phys_enc,
> -		enum dpu_intr_idx intr_idx)
> -{
> -	struct dpu_encoder_irq *irq;
> -	int ret;
> -
> -	irq = &phys_enc->irq[intr_idx];
> -
> -	/* silently skip irqs that weren't registered */
> -	if (irq->irq_idx < 0) {
> -		DRM_ERROR("duplicate unregister id=%u, intr=%d, irq=%d",
> -			  DRMID(phys_enc->parent), intr_idx,
> -			  irq->irq_idx);
> -		return 0;
> -	}
> -
> -	ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms, 
> irq->irq_idx,
> -			irq->func, phys_enc);
> -	if (ret) {
> -		DRM_ERROR("unreg cb fail id=%u, intr=%d, irq=%d ret=%d",
> -			  DRMID(phys_enc->parent), intr_idx,
> -			  irq->irq_idx, ret);
> -	}
> -
> -	trace_dpu_enc_irq_unregister_success(DRMID(phys_enc->parent), 
> intr_idx,
> -					     irq->irq_idx);
> -
> -	return 0;
> -}
> -
>  int dpu_encoder_get_frame_count(struct drm_encoder *drm_enc)
>  {
>  	struct dpu_encoder_virt *dpu_enc;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 80d87871fd94..ff2218155b44 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -364,22 +364,4 @@ int dpu_encoder_helper_wait_for_irq(struct
> dpu_encoder_phys *phys_enc,
>  		enum dpu_intr_idx intr_idx,
>  		struct dpu_encoder_wait_info *wait_info);
> 
> -/**
> - * dpu_encoder_helper_register_irq - register and enable an irq
> - * @phys_enc: Pointer to physical encoder structure
> - * @intr_idx: encoder interrupt index
> - * @Return: 0 or -ERROR
> - */
> -int dpu_encoder_helper_register_irq(struct dpu_encoder_phys *phys_enc,
> -		enum dpu_intr_idx intr_idx);
> -
> -/**
> - * dpu_encoder_helper_unregister_irq - unregister and disable an irq
> - * @phys_enc: Pointer to physical encoder structure
> - * @intr_idx: encoder interrupt index
> - * @Return: 0 or -ERROR
> - */
> -int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys 
> *phys_enc,
> -		enum dpu_intr_idx intr_idx);
> -
>  #endif /* __dpu_encoder_phys_H__ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index f921a5c99456..4bfeac821f51 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -211,7 +211,9 @@ static int 
> _dpu_encoder_phys_cmd_handle_ppdone_timeout(
>  			  cmd_enc->pp_timeout_report_cnt,
>  			  atomic_read(&phys_enc->pending_kickoff_cnt));
>  		msm_disp_snapshot_state(drm_enc->dev);
> -		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_RDPTR);
> +		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> +				phys_enc->irq[INTR_IDX_RDPTR].irq_idx,
> +				phys_enc->irq[INTR_IDX_RDPTR].func, phys_enc);
>  	}
> 
>  	atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
> @@ -277,10 +279,13 @@ static int 
> dpu_encoder_phys_cmd_control_vblank_irq(
>  		      enable ? "true" : "false", refcount);
> 
>  	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
> -		ret = dpu_encoder_helper_register_irq(phys_enc, INTR_IDX_RDPTR);
> +		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
> +				phys_enc->irq[INTR_IDX_RDPTR].irq_idx,
> +				phys_enc->irq[INTR_IDX_RDPTR].func, phys_enc);
>  	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 
> 0)
> -		ret = dpu_encoder_helper_unregister_irq(phys_enc,
> -				INTR_IDX_RDPTR);
> +		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> +				phys_enc->irq[INTR_IDX_RDPTR].irq_idx,
> +				phys_enc->irq[INTR_IDX_RDPTR].func, phys_enc);
> 
>  end:
>  	if (ret) {
> @@ -301,21 +306,31 @@ static void
> dpu_encoder_phys_cmd_irq_control(struct dpu_encoder_phys *phys_enc,
>  			enable, atomic_read(&phys_enc->vblank_refcount));
> 
>  	if (enable) {
> -		dpu_encoder_helper_register_irq(phys_enc, INTR_IDX_PINGPONG);
> -		dpu_encoder_helper_register_irq(phys_enc, INTR_IDX_UNDERRUN);
> +		dpu_core_irq_register_callback(phys_enc->dpu_kms,
> +				phys_enc->irq[INTR_IDX_PINGPONG].irq_idx,
> +				phys_enc->irq[INTR_IDX_PINGPONG].func, phys_enc);
> +		dpu_core_irq_register_callback(phys_enc->dpu_kms,
> +				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx,
> +				phys_enc->irq[INTR_IDX_UNDERRUN].func, phys_enc);
>  		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
> 
>  		if (dpu_encoder_phys_cmd_is_master(phys_enc))
> -			dpu_encoder_helper_register_irq(phys_enc,
> -					INTR_IDX_CTL_START);
> +			dpu_core_irq_register_callback(phys_enc->dpu_kms,
> +					phys_enc->irq[INTR_IDX_CTL_START].irq_idx,
> +					phys_enc->irq[INTR_IDX_CTL_START].func, phys_enc);
>  	} else {
>  		if (dpu_encoder_phys_cmd_is_master(phys_enc))
> -			dpu_encoder_helper_unregister_irq(phys_enc,
> -					INTR_IDX_CTL_START);
> +			dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> +					phys_enc->irq[INTR_IDX_CTL_START].irq_idx,
> +					phys_enc->irq[INTR_IDX_CTL_START].func, phys_enc);
> 
> -		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_UNDERRUN);
> +		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> +				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx,
> +				phys_enc->irq[INTR_IDX_UNDERRUN].func, phys_enc);
>  		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
> -		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_PINGPONG);
> +		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> +				phys_enc->irq[INTR_IDX_PINGPONG].irq_idx,
> +				phys_enc->irq[INTR_IDX_PINGPONG].func, phys_enc);
>  	}
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 437af231d6a4..7f605287a377 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -404,10 +404,13 @@ static int 
> dpu_encoder_phys_vid_control_vblank_irq(
>  		      atomic_read(&phys_enc->vblank_refcount));
> 
>  	if (enable && atomic_inc_return(&phys_enc->vblank_refcount) == 1)
> -		ret = dpu_encoder_helper_register_irq(phys_enc, INTR_IDX_VSYNC);
> +		ret = dpu_core_irq_register_callback(phys_enc->dpu_kms,
> +				phys_enc->irq[INTR_IDX_VSYNC].irq_idx,
> +				phys_enc->irq[INTR_IDX_VSYNC].func, phys_enc);
>  	else if (!enable && atomic_dec_return(&phys_enc->vblank_refcount) == 
> 0)
> -		ret = dpu_encoder_helper_unregister_irq(phys_enc,
> -				INTR_IDX_VSYNC);
> +		ret = dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> +				phys_enc->irq[INTR_IDX_VSYNC].irq_idx,
> +				phys_enc->irq[INTR_IDX_VSYNC].func, phys_enc);
> 
>  end:
>  	if (ret) {
> @@ -539,7 +542,9 @@ static void 
> dpu_encoder_phys_vid_prepare_for_kickoff(
>  		DPU_ERROR_VIDENC(phys_enc, "ctl %d reset failure: %d\n",
>  				ctl->idx, rc);
>  		msm_disp_snapshot_state(drm_enc->dev);
> -		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_VSYNC);
> +		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> +				phys_enc->irq[INTR_IDX_VSYNC].irq_idx,
> +				phys_enc->irq[INTR_IDX_VSYNC].func, phys_enc);
>  	}
>  }
> 
> @@ -628,10 +633,14 @@ static void
> dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
>  		if (WARN_ON(ret))
>  			return;
> 
> -		dpu_encoder_helper_register_irq(phys_enc, INTR_IDX_UNDERRUN);
> +		dpu_core_irq_register_callback(phys_enc->dpu_kms,
> +				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx,
> +				phys_enc->irq[INTR_IDX_UNDERRUN].func, phys_enc);
>  	} else {
>  		dpu_encoder_phys_vid_control_vblank_irq(phys_enc, false);
> -		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_UNDERRUN);
> +		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
> +				phys_enc->irq[INTR_IDX_UNDERRUN].irq_idx,
> +				phys_enc->irq[INTR_IDX_UNDERRUN].func, phys_enc);
>  	}
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 9b74cfdf5355..557ad831e651 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -451,6 +451,8 @@ int dpu_core_irq_register_callback(struct dpu_kms
> *dpu_kms, int irq_idx,
>  					irq_idx);
>  	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
> 
> +	trace_dpu_irq_register_success(irq_idx);
> +
>  	return 0;
>  }
> 
> @@ -493,6 +495,8 @@ int dpu_core_irq_unregister_callback(struct
> dpu_kms *dpu_kms, int irq_idx,
> 
>  	spin_unlock_irqrestore(&dpu_kms->hw_intr->irq_lock, irq_flags);
> 
> +	trace_dpu_irq_unregister_success(irq_idx);
> +
>  	return 0;
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> index 1e2619556f93..58b7b8654543 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
> @@ -167,33 +167,24 @@ TRACE_EVENT(dpu_perf_crtc_update,
>  			__entry->update_clk)
>  );
> 
> -DECLARE_EVENT_CLASS(dpu_enc_irq_template,
> -	TP_PROTO(uint32_t drm_id, enum dpu_intr_idx intr_idx,
> -		 int irq_idx),
> -	TP_ARGS(drm_id, intr_idx, irq_idx),
> +DECLARE_EVENT_CLASS(dpu_irq_template,
> +	TP_PROTO(int irq_idx),
> +	TP_ARGS(irq_idx),
>  	TP_STRUCT__entry(
> -		__field(	uint32_t,		drm_id		)
> -		__field(	enum dpu_intr_idx,	intr_idx	)
>  		__field(	int,			irq_idx		)
>  	),
>  	TP_fast_assign(
> -		__entry->drm_id = drm_id;
> -		__entry->intr_idx = intr_idx;
>  		__entry->irq_idx = irq_idx;
>  	),
> -	TP_printk("id=%u, intr=%d, irq=%d",
> -		  __entry->drm_id, __entry->intr_idx,
> -		  __entry->irq_idx)
> +	TP_printk("irq=%d", __entry->irq_idx)
>  );
> -DEFINE_EVENT(dpu_enc_irq_template, dpu_enc_irq_register_success,
> -	TP_PROTO(uint32_t drm_id, enum dpu_intr_idx intr_idx,
> -		 int irq_idx),
> -	TP_ARGS(drm_id, intr_idx, irq_idx)
> +DEFINE_EVENT(dpu_irq_template, dpu_irq_register_success,
> +	TP_PROTO(int irq_idx),
> +	TP_ARGS(irq_idx)
>  );
> -DEFINE_EVENT(dpu_enc_irq_template, dpu_enc_irq_unregister_success,
> -	TP_PROTO(uint32_t drm_id, enum dpu_intr_idx intr_idx,
> -		 int irq_idx),
> -	TP_ARGS(drm_id, intr_idx, irq_idx)
> +DEFINE_EVENT(dpu_irq_template, dpu_irq_unregister_success,
> +	TP_PROTO(int irq_idx),
> +	TP_ARGS(irq_idx)
>  );
> 
>  TRACE_EVENT(dpu_enc_irq_wait_success,
