Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EF550AB9B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 00:41:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4782A10E00C;
	Thu, 21 Apr 2022 22:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98AED10E00C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 22:40:57 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bu29so11238343lfb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 15:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=VXnTa3AdiDV/j3eN4DHPMWXjoA8x7lbfScQZ7h6cQ0M=;
 b=lxPWONmCT6K+TLUMqcM9ts5FNVsC3dTcdgfmyNFHYfI6P9hQroFt0+LIgGxusK6jFv
 kqv+6esYVsbscTzTq3l2yMg5BjwobPpoP2nsyb7hkp/yXg7xd6NNIPXxvNt7mN3yLJYk
 GX26owwd6d8SrFlf4QhoTCpVS+5npH3Upqz3d85pLNHkd4HiP0NtEqa7XK8aIcfFIdSq
 y2tJUevArQMVPDeofUiEzlJGGn3jVeo8ZsNXucPfbdv0pkjuVog0vih0rqNve3nVbD2e
 Pjq8M5Q6tPprh4LEQTZe9lvMdQL5urt+uHHQ8pOzrIxnGq/A8tXnz42Y+pmEAI93a6lX
 vmOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=VXnTa3AdiDV/j3eN4DHPMWXjoA8x7lbfScQZ7h6cQ0M=;
 b=q+yZzR3jOVFs6lOu+u2tchAGQ6lOskJRMSguB0Dr2CaF8S2wmErM+a6xpllJxSHEDF
 vdKr6NVM78ns2Eyd9O+f5TRsHu05XzmQ16vzSpCMcxzV3OdxzADXGsQCOIXiXA51wIQj
 L0uAZ1wLr23gN2ERkJItOyCRC9nyKAaouC/ZfnR19qmcxLPzrPnLXKHx2rCHCVqqWoyu
 krFk0rrezG8e7GnDtOiBUlfRU43mH/9F7UjZm0hyxqFw4RM8AdLnSy6C5znqFLPkaZYu
 jnMle8ljXppLCbLwoPSSbdC4l8WmS6mZj4aziYOW5LQRuiXcPzhwN+8x3lVmSO+GBu38
 QIpw==
X-Gm-Message-State: AOAM533Rj22k72033OTOVsFSpNG7oTde0/u56zkJpAjrWgK7t3kON6L0
 87tio0iqERLmGT/2nF+tATdv0pLVhezE3A==
X-Google-Smtp-Source: ABdhPJw6U+grhxnVI9dzch99d4Y+z9cdZtkpfTy/s87p5YikELLSsM2x797MAFp8VBMApGZot3s9oQ==
X-Received: by 2002:a19:5519:0:b0:46f:a717:1675 with SMTP id
 n25-20020a195519000000b0046fa7171675mr1105333lfe.368.1650580855775; 
 Thu, 21 Apr 2022 15:40:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a2e4802000000b0024dc2a58534sm19566lja.75.2022.04.21.15.40.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Apr 2022 15:40:55 -0700 (PDT)
Message-ID: <f3c788b1-e7d8-f13a-e4f9-b96e069fe700@linaro.org>
Date: Fri, 22 Apr 2022 01:40:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC 1/4] drm/msm/dpu: introduce a wb_idx to be used for
 writeback interfaces
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org
References: <1650574112-25294-1-git-send-email-quic_abhinavk@quicinc.com>
 <1650574112-25294-2-git-send-email-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1650574112-25294-2-git-send-email-quic_abhinavk@quicinc.com>
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
Cc: markyacoub@chromium.org, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, quic_jesszhan@quicinc.com,
 quic_aravindh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/04/2022 23:48, Abhinav Kumar wrote:
> Using intf_idx even for writeback interfaces is confusing
> because intf_idx is of type enum dpu_intf but the index used
> for writeback is of type enum dpu_wb.
> 
> In addition, this makes it easier to separately check the
> availability of the two as its possible that there are boards
> which don't have any physical display connected but can still
> work in writeback mode.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Looks good, two minor issues bellow.

With them fixed, I'd even squash this patch into the corresponding patch 
of the previous patchset.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 62 +++++++++++++-----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  4 ++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  2 +-
>   3 files changed, 40 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 9c12841..054d7e4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -962,7 +962,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
>   	int num_lm, num_ctl, num_pp, num_dsc;
>   	unsigned int dsc_mask = 0;
> -	enum dpu_hw_blk_type blk_type;
>   	int i;
>   
>   	if (!drm_enc) {
> @@ -1044,17 +1043,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   		phys->hw_pp = dpu_enc->hw_pp[i];
>   		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
>   
> -		if (dpu_encoder_get_intf_mode(&dpu_enc->base) == INTF_MODE_WB_LINE)
> -			blk_type = DPU_HW_BLK_WB;
> -		else
> -			blk_type = DPU_HW_BLK_INTF;
> +		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
> +			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
>   
> -		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX) {
> -			if (blk_type == DPU_HW_BLK_INTF)
> -				phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
> -			else if (blk_type == DPU_HW_BLK_WB)
> -				phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->intf_idx);
> -		}
> +		if (phys->wb_idx >= WB_0 && phys->wb_idx < WB_MAX)
> +			phys->hw_wb = dpu_rm_get_wb(&dpu_kms->rm, phys->wb_idx);
>   

We also need a check for if (phus->hw_intf && phys->hw_wb) HERE

>   		if (!phys->hw_intf && !phys->hw_wb) {
>   			DPU_ERROR_ENC(dpu_enc,
> @@ -1201,7 +1194,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
>   	mutex_unlock(&dpu_enc->enc_lock);
>   }
>   
> -static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg *catalog,
> +static enum dpu_intf dpu_encoder_get_intf(struct dpu_mdss_cfg *catalog,
>   		enum dpu_intf_type type, u32 controller_id)
>   {
>   	int i = 0;
> @@ -1213,16 +1206,28 @@ static enum dpu_intf dpu_encoder_get_intf_or_wb(struct dpu_mdss_cfg *catalog,
>   				return catalog->intf[i].id;
>   			}
>   		}
> -	} else {
> -		for (i = 0; i < catalog->wb_count; i++) {
> -			if (catalog->wb[i].id == controller_id)
> -				return catalog->wb[i].id;
> -		}
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

I'd return INTF_NONE/WB_NONE if the interface or WB unit was not found.

> +}
> +
>   static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
>   		struct dpu_encoder_phys *phy_enc)
>   {
> @@ -2249,18 +2254,21 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>   		DPU_DEBUG("h_tile_instance %d = %d, split_role %d\n",
>   				i, controller_id, phys_params.split_role);
>   
> -		/*
> -		 * FIXME: have separate intf_idx and wb_idx to avoid using
> -		 * enum dpu_intf type for wb_idx and also to be able to
> -		 * not bail out when there is no intf for boards which dont
> -		 * have a display connected to them.
> -		 * Having a valid wb_idx but not a intf_idx can be a valid
> -		 * combination moving forward.
> -		 */
> -		phys_params.intf_idx = dpu_encoder_get_intf_or_wb(dpu_kms->catalog,
> +		phys_params.intf_idx = dpu_encoder_get_intf(dpu_kms->catalog,
>   													intf_type,
>   													controller_id);
> -		if (phys_params.intf_idx == INTF_MAX) {
> +
> +		phys_params.wb_idx = dpu_encoder_get_wb(dpu_kms->catalog,
> +				intf_type, controller_id);
> +		/*
> +		 * For boards which have no physical displays, having no interface
> +		 * is fine because it can still be used with just writeback.
> +		 * If we try without a display on a board which uses a DPU in which
> +		 * writeback is not supported, then this will still fail as it will not
> +		 * find any writeback in the catalog.
> +		 */
> +		if ((phys_params.intf_idx == INTF_MAX) &&
> +				(phys_params.wb_idx == WB_MAX)) {
>   			DPU_ERROR_ENC(dpu_enc, "could not get intf or wb: type %d, id %d\n",
>   						  intf_type, controller_id);
>   			ret = -EINVAL;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index 04d037e..f2af07d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -181,6 +181,7 @@ enum dpu_intr_idx {
>    * @split_role:		Role to play in a split-panel configuration
>    * @intf_mode:		Interface mode
>    * @intf_idx:		Interface index on dpu hardware
> + * @wb_idx:			Writeback index on dpu hardware
>    * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
>    * @enable_state:	Enable state tracking
>    * @vblank_refcount:	Reference count of vblank request
> @@ -209,6 +210,7 @@ struct dpu_encoder_phys {
>   	enum dpu_enc_split_role split_role;
>   	enum dpu_intf_mode intf_mode;
>   	enum dpu_intf intf_idx;
> +	enum dpu_wb wb_idx;
>   	spinlock_t *enc_spinlock;
>   	enum dpu_enc_enable_state enable_state;
>   	atomic_t vblank_refcount;
> @@ -275,6 +277,7 @@ struct dpu_encoder_phys_cmd {
>    * @parent_ops:		Callbacks exposed by the parent to the phys_enc
>    * @split_role:		Role to play in a split-panel configuration
>    * @intf_idx:		Interface index this phys_enc will control
> + * @wb_idx:			Writeback index this phys_enc will control
>    * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
>    */
>   struct dpu_enc_phys_init_params {
> @@ -283,6 +286,7 @@ struct dpu_enc_phys_init_params {
>   	const struct dpu_encoder_virt_ops *parent_ops;
>   	enum dpu_enc_split_role split_role;
>   	enum dpu_intf intf_idx;
> +	enum dpu_wb wb_idx;
>   	spinlock_t *enc_spinlock;
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> index ba82e54..2f34a31 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
> @@ -103,7 +103,7 @@ static inline struct dpu_hw_intf *dpu_rm_get_intf(struct dpu_rm *rm, enum dpu_in
>    * @rm: DPU Resource Manager handle
>    * @wb_idx: WB index
>    */
> -static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum dpu_intf wb_idx)
> +static inline struct dpu_hw_wb *dpu_rm_get_wb(struct dpu_rm *rm, enum dpu_wb wb_idx)
>   {
>   	return rm->hw_wb[wb_idx - WB_0];
>   }


-- 
With best wishes
Dmitry
