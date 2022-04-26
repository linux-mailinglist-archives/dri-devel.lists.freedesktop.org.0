Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D632D5104F5
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 19:10:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7346C10E6EA;
	Tue, 26 Apr 2022 17:10:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 068B910E408
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 17:10:31 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id p10so33085476lfa.12
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 10:10:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sYnrahpAa4YmJXa8HL26Z6/nwOSzaxCYEI8F4wluo1k=;
 b=AwBfB7DiZjFlud4JbPqAmBujyczeyHh/Tk/OJRFpRBxWvmhd+Z02RjVF5YcOckvqh3
 GRPFvsgFcHFn7LtJt3I/FN1bp5vHvvix0R8F+kX9zkcAlLumWeZ8rYgl2u3u6pUb83E2
 WofRihG4KGcst2z3gBQPs6R3AyNVlhHbmpY7e3Aqqa2PzimHNDBFwKbpi8IR2WClugqd
 oAOJYdHF7sm2lXZXxtYxwnTqQRnzbb+7N1FChfwpo2TFmJ676QfpRCbuDcKzomDjb8m7
 ykVUhPbALDp+62u9f74NvjADo9CUnLnnRSdbd9jNDrLjwpQqv70iII/k9JED9dUnOhZ3
 eP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sYnrahpAa4YmJXa8HL26Z6/nwOSzaxCYEI8F4wluo1k=;
 b=likWHznNZZnNGn1mNO5161aVxst+OOGcZTlJAD7sU89/Sr5RvyuseolTS5c9C03S8S
 ezmFjWRQJbvMx6G0VZ42nWLLxKvGROyP25Dz9nSbXCymCMP63J7kyQn1bz2CaeMI21LV
 3zvnoqPsSI5Bk/NXla/jzVHpnb0OfzOPwqa20EivqNMWiK4tzw4dm/emlI4spKZoXWxM
 EI3JCs791sjrWYm506Q6Mm8A7V1GAhrbyz/ssDILu0MUNvXpyO+AmzgYIedtAPs7CR1C
 rrYVLyFQTIA3ESTHGzC6BdWs47OnVeLhiXNGPhmvfd01B6MFzdQYipCpe5xjPypf2J1T
 2o7A==
X-Gm-Message-State: AOAM53013oMSkefDWQDOeoWMX2XvCczaUhADF/Kdtqqg2pIFC8HIMIi+
 paoI+x66Z5ApLAJvisIBLD1AIA==
X-Google-Smtp-Source: ABdhPJyvdgBEbe8xN2FxgJQPF1O2s0Q2uO6B/LaawCXLaOobsa0kxv+CrDqf5K5mNWYHmAbW3RtGMA==
X-Received: by 2002:a05:6512:200c:b0:46d:d2d:c38c with SMTP id
 a12-20020a056512200c00b0046d0d2dc38cmr17804802lfb.279.1650993029268; 
 Tue, 26 Apr 2022 10:10:29 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 bp4-20020a056512158400b0044332792f30sm1799814lfb.175.2022.04.26.10.10.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 10:10:28 -0700 (PDT)
Message-ID: <2891f8b6-c99f-1759-8f76-8dffb1f01146@linaro.org>
Date: Tue, 26 Apr 2022 20:10:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 10/19] drm/msm/dpu: make changes to dpu_encoder to
 support virtual encoder
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650984096-9964-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650984096-9964-11-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650984096-9964-11-git-send-email-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: markyacoub@chromium.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, seanpaul@chromium.org,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/04/2022 17:41, Abhinav Kumar wrote:
> Make changes to dpu_encoder to support virtual encoder needed
> to support writeback for dpu.
> 
> changes in v4:
> 	- squash dpu_encoder pieces from [1]
> 
> changes in v5:
> 	- none
> 
> changes in v6:
> 	- fix the comment about intf_idx and wb_idx
> 	- add the condition for valid phys_enc with intf_idx
> 	  and wb_idx
> 
> [1] https://patchwork.freedesktop.org/patch/483099/?series=102964&rev=2
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nits below,

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 98 +++++++++++++++++++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  7 ++
>   2 files changed, 87 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 25c7eda..e9d8859 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1013,9 +1013,18 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
>   			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
>   
> -		if (!phys->hw_intf) {
> +		if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
> +			phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
> +
> +		if (!phys->hw_intf && !phys->hw_wb) {
> +			DPU_ERROR_ENC(dpu_enc,
> +				      "no intf or wb block assigned at idx: %d\n", i);
> +			return;
> +		}
> +
> +		if (phys->hw_intf && phys->hw_wb) {
>   			DPU_ERROR_ENC(dpu_enc,
> -				      "no intf block assigned at idx: %d\n", i);
> +					"invalid phys both intf and wb block at idx: %d\n", i);
>   			return;
>   		}
>   
> @@ -1163,16 +1172,35 @@ static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
>   {
>   	int i = 0;
>   
> -	for (i = 0; i < catalog->intf_count; i++) {
> -		if (catalog->intf[i].type == type
> -		    && catalog->intf[i].controller_id == controller_id) {
> -			return catalog->intf[i].id;
> +	if (type != INTF_WB) {

This might be easier (like you did in the dpu_encoder_get_wb()):

if (type == INTF_WB)
     goto end;

> +		for (i = 0; i < catalog->intf_count; i++) {
> +			if (catalog->intf[i].type == type
> +				&& catalog->intf[i].controller_id == controller_id) {
> +				return catalog->intf[i].id;
> +			}
>   		}
>   	}
>   
>   	return INTF_MAX;
>   }
>   
> +static enum dpu_wb dpu_encoder_get_wb(struct dpu_mdss_cfg *catalog,
> +		enum dpu_intf_type type, u32 controller_id)
> +{
> +	int i = 0;
> +
> +	if (type != INTF_WB)
> +		goto end;
> +
> +	for (i = 0; i < catalog->wb_count; i++) {
> +		if (catalog->wb[i].id == controller_id)
> +			return catalog->wb[i].id;
> +	}
> +
> +end:
> +	return WB_MAX;
> +}
> +
>   static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>   		struct dpu_encoder_phys *phy_enc)
>   {
> @@ -1887,16 +1915,32 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>   
>   	dpu_encoder_helper_reset_mixers(phys_enc);
>   
> -	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> -		if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
> -			phys_enc->hw_intf->ops.bind_pingpong_blk(
> -					dpu_enc->phys_encs[i]->hw_intf, false,
> -					dpu_enc->phys_encs[i]->hw_pp->idx);
> -
> -		/* mark INTF flush as pending */
> -		if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
> -			phys_enc->hw_ctl->ops.update_pending_flush_intf(phys_enc->hw_ctl,
> -					dpu_enc->phys_encs[i]->hw_intf->idx);
> +	/*
> +	 * TODO: move the once-only operation like CTL flush/trigger
> +	 * into dpu_encoder_virt_disable() and all operations which need
> +	 * to be done per phys encoder into the phys_disable() op.
> +	 */
> +	if (phys_enc->hw_wb) {
> +		/* disable the PP block */
> +		if (phys_enc->hw_wb->ops.bind_pingpong_blk)
> +			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, false,
> +					phys_enc->hw_pp->idx);
> +
> +		/* mark WB flush as pending */
> +		if (phys_enc->hw_ctl->ops.update_pending_flush_wb)
> +			phys_enc->hw_ctl->ops.update_pending_flush_wb(ctl, phys_enc->hw_wb->idx);
> +	} else {
> +		for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> +			if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
> +				phys_enc->hw_intf->ops.bind_pingpong_blk(
> +						dpu_enc->phys_encs[i]->hw_intf, false,
> +						dpu_enc->phys_encs[i]->hw_pp->idx);
> +
> +			/* mark INTF flush as pending */
> +			if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
> +				phys_enc->hw_ctl->ops.update_pending_flush_intf(phys_enc->hw_ctl,
> +						dpu_enc->phys_encs[i]->hw_intf->idx);
> +		}
>   	}
>   
>   	/* reset the merge 3D HW block */
> @@ -2112,6 +2156,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   	case DRM_MODE_ENCODER_TMDS:
>   		intf_type = INTF_DP;
>   		break;
> +	case DRM_MODE_ENCODER_VIRTUAL:
> +		intf_type = INTF_WB;
> +		break;
>   	}
>   
>   	WARN_ON(disp_info->num_of_h_tiles < 1);
> @@ -2149,8 +2196,23 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   		phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
>   													intf_type,
>   													controller_id);
> -		if (phys_params.intf_idx == INTF_MAX) {
> -			DPU_ERROR_ENC(dpu_enc, "could not get intf: type %d, id %d\n",
> +
> +		phys_params.wb_idx = dpu_encoder_get_wb(dpu_kms->catalog,
> +				intf_type, controller_id);
> +		/*
> +		 * The phys_params might represent either an INTF or a WB unit, but not
> +		 * both of them at the same time.
> +		 */
> +		if ((phys_params.intf_idx == INTF_MAX) &&
> +				(phys_params.wb_idx == WB_MAX)) {
> +			DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type %d, id %d\n",
> +						  intf_type, controller_id);
> +			ret = -EINVAL;
> +		}
> +
> +		if ((phys_params.intf_idx != INTF_MAX) &&
> +				(phys_params.wb_idx != WB_MAX)) {
> +			DPU_ERROR_ENC(dpu_enc, "both intf and wb present: type %d, id %d\n",
>   						  intf_type, controller_id);
>   			ret = -EINVAL;
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 544a9a4..c84b8e8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -11,6 +11,7 @@
>   
>   #include "dpu_kms.h"
>   #include "dpu_hw_intf.h"
> +#include "dpu_hw_wb.h"
>   #include "dpu_hw_pingpong.h"
>   #include "dpu_hw_ctl.h"
>   #include "dpu_hw_top.h"
> @@ -165,12 +166,14 @@ enum dpu_intr_idx {
>    * @hw_ctl:		Hardware interface to the ctl registers
>    * @hw_pp:		Hardware interface to the ping pong registers
>    * @hw_intf:		Hardware interface to the intf registers
> + * @hw_wb:		Hardware interface to the wb registers
>    * @dpu_kms:		Pointer to the dpu_kms top level
>    * @cached_mode:	DRM mode cached at mode_set time, acted on in enable
>    * @enabled:		Whether the encoder has enabled and running a mode
>    * @split_role:		Role to play in a split-panel configuration
>    * @intf_mode:		Interface mode
>    * @intf_idx:		Interface index on dpu hardware
> + * @wb_idx:			Writeback index on dpu hardware
>    * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
>    * @enable_state:	Enable state tracking
>    * @vblank_refcount:	Reference count of vblank request
> @@ -193,11 +196,13 @@ struct dpu_encoder_phys {
>   	struct dpu_hw_ctl *hw_ctl;
>   	struct dpu_hw_pingpong *hw_pp;
>   	struct dpu_hw_intf *hw_intf;
> +	struct dpu_hw_wb *hw_wb;
>   	struct dpu_kms *dpu_kms;
>   	struct drm_display_mode cached_mode;
>   	enum dpu_enc_split_role split_role;
>   	enum dpu_intf_mode intf_mode;
>   	enum dpu_intf intf_idx;
> +	enum dpu_wb wb_idx;
>   	spinlock_t *enc_spinlock;
>   	enum dpu_enc_enable_state enable_state;
>   	atomic_t vblank_refcount;
> @@ -243,6 +248,7 @@ struct dpu_encoder_phys_cmd {
>    * @parent_ops:		Callbacks exposed by the parent to the phys_enc
>    * @split_role:		Role to play in a split-panel configuration
>    * @intf_idx:		Interface index this phys_enc will control
> + * @wb_idx:			Writeback index this phys_enc will control
>    * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
>    */
>   struct dpu_enc_phys_init_params {
> @@ -251,6 +257,7 @@ struct dpu_enc_phys_init_params {
>   	const struct dpu_encoder_virt_ops *parent_ops;
>   	enum dpu_enc_split_role split_role;
>   	enum dpu_intf intf_idx;
> +	enum dpu_wb wb_idx;
>   	spinlock_t *enc_spinlock;
>   };
>   


-- 
With best wishes
Dmitry
