Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D5450827E
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:44:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9F210E836;
	Wed, 20 Apr 2022 07:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA7C10F086
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 07:44:20 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id o16so936221ljp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 00:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ibwUwHm/xhch6g+B676ErtePh6cmjlKjgcvhpkHL8f4=;
 b=ocE+pHmhwwcPGq8yPZFvrxB4QNQRa3l1Tj4xoSw9J3/aNPAnSj+Jvetzi5ssv4UlPO
 FeeJloH4CrvvRTsoauyytI5BfTulPRvjC1TWcEK0X6j1/rN0aJ8Y2q85xBkBEwvmEmDU
 pJklVVnN42gyEOAR5X8J8qBb1MkxjZ6u9MNxTW0tF2GdneFlloJd9y+Pd0hpz0mQR4kH
 CCCtTtRF9MWaigIMZCWUvR2+ClnBIWgOLiwVw5DGS5S58Q/a+FcLeiyIT3hlUPJEXzs3
 ymsvwRNHo7zL43eZYgWxDi1P9ptTMkg88cz06bhoJEdPm3dc+TZZflydOUxi/BptTCHW
 vcJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=ibwUwHm/xhch6g+B676ErtePh6cmjlKjgcvhpkHL8f4=;
 b=47s4QcM3LB47vflj4aqBx8Lk7ZB/2Y+malClGRGiJrotrwC6LPsv9k8SRDFhY+AJIC
 9IAWkB4CYFSN5P8CezsvAcw6kAP3BChPbBJMVbBi5y/iUqed37ROU45qb76NeQzWsrWH
 Pe1iXhSGAM+4Si/7nxclCPpTZqs63c/w9xn8+AvA2Brw7jUZUSiAcu+MVFVCPW2x2UrH
 EuVyKVOORZNpUgzEZnZr4YxXm5v0RPVw+uRhDVrlAw5Fl7JeN9xNZienpdX9djdy82op
 f/lDMs2mO5J0GSISPp38ybWzplIS9ErXqDIp7YpYK3K6+dvqcT2lUIo3jgHsqZeVZWm1
 a15w==
X-Gm-Message-State: AOAM5338md1h8BVMGH86FnchS0dL+pnvC/JVRS+WopTNfLNCR6lGo96X
 lA9/EGLTaPwi3bEENPbqqYCCGw==
X-Google-Smtp-Source: ABdhPJxprE+9wH3oqsQuTKK8tf7KDAsJuH+nCv0YZ9FRirgKZU61bZSo9ZcGhwqJLK37+e/p3UJ34g==
X-Received: by 2002:a05:651c:4c8:b0:24b:598f:9ceb with SMTP id
 e8-20020a05651c04c800b0024b598f9cebmr12753475lji.158.1650440659135; 
 Wed, 20 Apr 2022 00:44:19 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a056512338a00b0046fd34ed2dcsm1429260lfg.230.2022.04.20.00.44.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Apr 2022 00:44:18 -0700 (PDT)
Message-ID: <d31094f8-c067-567e-3fcb-d2ae31fff3c0@linaro.org>
Date: Wed, 20 Apr 2022 10:44:18 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 10/17] drm/msm/dpu: make changes to dpu_encoder to
 support virtual encoder
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650419169-13760-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650419169-13760-11-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650419169-13760-11-git-send-email-quic_abhinavk@quicinc.com>
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

On 20/04/2022 04:46, Abhinav Kumar wrote:
> Make changes to dpu_encoder to support virtual encoder needed
> to support writeback for dpu.
> 
> changes in v2:
> 	- add the writeback parts to dpu_encoder_helper_phys_cleanup
> 	- rebase on tip of msm-next and fix related dependencies
> 	- get the writeback blocks directly from RM
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 71 +++++++++++++++++-------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  3 +
>   2 files changed, 54 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 0e31ad3..06b8631 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -928,6 +928,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
>   	int num_lm, num_ctl, num_pp, num_dsc;
>   	unsigned int dsc_mask = 0;
> +	enum dpu_hw_blk_type blk_type;
>   	int i;
>   
>   	if (!drm_enc) {
> @@ -1009,12 +1010,21 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   		phys->hw_pp = dpu_enc->hw_pp[i];
>   		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>   
> -		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
> -			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
> +		if (dpu_encoder_get_intf_mode(&dpu_enc->base) == INTF_MODE_WB_LINE)
> +			blk_type = DPU_HW_BLK_WB;
> +		else
> +			blk_type = DPU_HW_BLK_INTF;
> +
> +		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX) {
> +			if (blk_type == DPU_HW_BLK_INTF)
> +				phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
> +			else if (blk_type == DPU_HW_BLK_WB)
> +				phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->intf_idx);
> +		}
>   
> -		if (!phys->hw_intf) {
> +		if (!phys->hw_intf && !phys->hw_wb) {
>   			DPU_ERROR_ENC(dpu_enc,
> -				      "no intf block assigned at idx: %d\n", i);
> +				      "no intf ow wb block assigned at idx: %d\n", i);

or wb

>   			return;
>   		}
>   
> @@ -1157,15 +1167,22 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> -static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
> +static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg *catalog,
>   		enum dpu_intf_type type, u32 controller_id)
>   {
>   	int i = 0;
>   
> -	for (i = 0; i < catalog->intf_count; i++) {
> -		if (catalog->intf[i].type == type
> -		    && catalog->intf[i].controller_id == controller_id) {
> -			return catalog->intf[i].id;
> +	if (type != INTF_WB) {
> +		for (i = 0; i < catalog->intf_count; i++) {
> +			if (catalog->intf[i].type == type
> +				&& catalog->intf[i].controller_id == controller_id) {
> +				return catalog->intf[i].id;
> +			}
> +		}
> +	} else {
> +		for (i = 0; i < catalog->wb_count; i++) {
> +			if (catalog->wb[i].id == controller_id)
> +				return catalog->wb[i].id;
>   		}
>   	}
>   
> @@ -1886,16 +1903,27 @@ void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc)
>   
>   	dpu_encoder_helper_reset_mixers(phys_enc);
>   
> -	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
> -		if (dpu_enc->phys_encs[i] && phys_enc->hw_intf->ops.bind_pingpong_blk)
> -			phys_enc->hw_intf->ops.bind_pingpong_blk(
> -					dpu_enc->phys_encs[i]->hw_intf, false,
> -					dpu_enc->phys_encs[i]->hw_pp->idx);
> +	if (phys_enc->hw_wb) {

I think this adds a hidden knowledge here. That there is always just a 
single phys_enc for the WB encoder. I'd still do this cleanup in a loop 
together with the INTF cleanup.

> +		/* disable the PP block */
> +		if (phys_enc->hw_wb->ops.bind_pingpong_blk)
> +			phys_enc->hw_wb->ops.bind_pingpong_blk(phys_enc->hw_wb, false,
> +					phys_enc->hw_pp->idx);
>   
> -		/* mark INTF flush as pending */
> -		if (phys_enc->hw_ctl->ops.update_pending_flush_intf)
> -			phys_enc->hw_ctl->ops.update_pending_flush_intf(phys_enc->hw_ctl,
> -					dpu_enc->phys_encs[i]->hw_intf->idx);
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
> @@ -2111,6 +2139,9 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   	case DRM_MODE_ENCODER_TMDS:
>   		intf_type = INTF_DP;
>   		break;
> +	case DRM_MODE_ENCODER_VIRTUAL:
> +		intf_type = INTF_WB;
> +		break;
>   	}
>   
>   	WARN_ON(disp_info->num_of_h_tiles < 1);
> @@ -2145,11 +2176,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>   				i, controller_id, phys_params.split_role);
>   
> -		phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
> +		phys_params.intf_idx = dpu_encoder_get_intf_or_wb(dpu_kms->catalog,
>   													intf_type,
>   													controller_id);

I'd prefer to be more explicit here. intf_idx is of type enum dpu_intf, 
while WBs are enumerated with enum dpu_wb.

I's suggest adding a separate phys_params.wb_idx and a 
dpu_encoder_get_wb() and calling one here depending on intf_type.

Then at the dpu_encoder_virt_atomic_mode_set() you don't need to check 
intf_mode, but get both intf and wb and report an error if none was 
provided.

>   		if (phys_params.intf_idx == INTF_MAX) {
> -			DPU_ERROR_ENC(dpu_enc, "could not get intf: type %d, id %d\n",
> +			DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type %d, id %d\n",
>   						  intf_type, controller_id);
>   			ret = -EINVAL;
>   		}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 544a9a4..0b80af4 100644
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
> @@ -165,6 +166,7 @@ enum dpu_intr_idx {
>    * @hw_ctl:		Hardware interface to the ctl registers
>    * @hw_pp:		Hardware interface to the ping pong registers
>    * @hw_intf:		Hardware interface to the intf registers
> + * @hw_wb:		Hardware interface to the wb registers
>    * @dpu_kms:		Pointer to the dpu_kms top level
>    * @cached_mode:	DRM mode cached at mode_set time, acted on in enable
>    * @enabled:		Whether the encoder has enabled and running a mode
> @@ -193,6 +195,7 @@ struct dpu_encoder_phys {
>   	struct dpu_hw_ctl *hw_ctl;
>   	struct dpu_hw_pingpong *hw_pp;
>   	struct dpu_hw_intf *hw_intf;
> +	struct dpu_hw_wb *hw_wb;
>   	struct dpu_kms *dpu_kms;
>   	struct drm_display_mode cached_mode;
>   	enum dpu_enc_split_role split_role;


-- 
With best wishes
Dmitry
