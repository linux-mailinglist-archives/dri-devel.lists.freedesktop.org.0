Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E493DADED
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 22:54:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379706EE6B;
	Thu, 29 Jul 2021 20:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C09C6EE6B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 20:54:22 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u3so13388703lff.9
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 13:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=TtzwERWqudonvRzbHNkdWZ3kWhB6I2ZbAEA6C8drPI4=;
 b=AKrHUAeEQMD/pDXxpO9Be7WVc1QxuY+OIn7U5Cz9CHYR+v9R9/PbMFXBmHtOZFcC3N
 WSUoVDpLwvHfhx6iA43CPTTk6fjsoAikNPqjS9JMs0xybGkWYmq6BFVO7QkOWoIhoe3Q
 6kkD18rDvNpAb6Z94cmggC/DWZ3blKLlL2SxxyQ6nZpBgKTnx7HouPcZrYGarreSiypg
 ftZNSgfBImqEfIK/euL8TumebckyDYgS6ZjVXf0Drsqumyv+FOR0D35pLvP3/fma/uyF
 dNFpxs++iJ+xMy3KBLZROeZNdf4oUhx98gzSPS7Ch+n6AmK9cST2ZANSdt1Hq7UeQww0
 cEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TtzwERWqudonvRzbHNkdWZ3kWhB6I2ZbAEA6C8drPI4=;
 b=btzdaFmJiXPX1Xe/3+DKPQF1OCINRHnaidvsFU7ZT0wwQWAlrP+ccOZ67C7yj4FNk+
 UTPk0NngPhss++nqzTDWOodL8J0LnO0EdmyadGeHGjWG+I0mwfrZ/AMLHuoUJNpgE2oq
 ti6F5DfMJAVemO/xVCwxI2qShk98qYBt6MqnPkcWKeJSD5fi2lAOdA5PNdtcX96E80+0
 nSp572AfoFxdgzeIVZAVuVNYBqofa75//qexj07Iwe4qps7bvIFAXGoCbY1VyKPdVyBn
 wO1BfVfGPFu3IyYQWjXLaX75hUZIHwiGmKLxlM+hTb9B7szI4K/460udV1ZV7ILKr4Lu
 A5pA==
X-Gm-Message-State: AOAM5314qnijcPyHzx7RqNFfxbmo0HnJ0LHBFzjzAPqlZ8iepqamv+Fp
 3AOZNxqcvGVroeiD4il1z5giJg==
X-Google-Smtp-Source: ABdhPJyxff8NyRMmiPjAya/ZL8U+X+NI3ZNSsZvtdNrtSaW+lyLrI7pCzr+J+94xTaRWsUewMWD8TA==
X-Received: by 2002:ac2:5504:: with SMTP id j4mr5331173lfk.220.1627592060673; 
 Thu, 29 Jul 2021 13:54:20 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p28sm394865lfd.156.2021.07.29.13.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 13:54:20 -0700 (PDT)
Subject: Re: [PATCH 08/11] drm/msm/disp/dpu1: Add support for DSC in encoder
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-9-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <0227846a-47b1-96e7-f14c-7dc3b4f1ba47@linaro.org>
Date: Thu, 29 Jul 2021 23:54:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210715065203.709914-9-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/07/2021 09:52, Vinod Koul wrote:
> When DSC is enabled in DT, we need to configure the encoder for DSC
> configuration, calculate DSC parameters for the given timing.
> 
> This patch adds that support by adding dpu_encoder_prep_dsc() which is
> invoked when DSC is enabled in DT
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 142 +++++++++++++++++++-
>   1 file changed, 141 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 8d942052db8a..41140b781e66 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -21,12 +21,17 @@
>   #include "dpu_hw_intf.h"
>   #include "dpu_hw_ctl.h"
>   #include "dpu_hw_dspp.h"
> +#include "dpu_hw_dsc.h"
>   #include "dpu_formats.h"
>   #include "dpu_encoder_phys.h"
>   #include "dpu_crtc.h"
>   #include "dpu_trace.h"
>   #include "dpu_core_irq.h"
>   
> +#define DSC_MODE_SPLIT_PANEL		BIT(0)
> +#define DSC_MODE_MULTIPLEX		BIT(1)
> +#define DSC_MODE_VIDEO			BIT(2)

This should go into dpu_hw_dsc.h. Ah. They are already defined there and 
just redefined there. Remove the defines here.

It might be cleaner to add bool flags to struct msm_display_dsc_config 
and then calculate common mode in the dpu_hw_dsc_config().


> +
>   #define DPU_DEBUG_ENC(e, fmt, ...) DPU_DEBUG("enc%d " fmt,\
>   		(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
>   
> @@ -135,6 +140,7 @@ enum dpu_enc_rc_states {
>    * @cur_slave:		As above but for the slave encoder.
>    * @hw_pp:		Handle to the pingpong blocks used for the display. No.
>    *			pingpong blocks can be different than num_phys_encs.
> + * @hw_dsc		Handle to the DSC blocks used for the display.
>    * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
>    *			for partial update right-only cases, such as pingpong
>    *			split where virtual pingpong does not generate IRQs
> @@ -180,6 +186,7 @@ struct dpu_encoder_virt {
>   	struct dpu_encoder_phys *cur_master;
>   	struct dpu_encoder_phys *cur_slave;
>   	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>   
>   	bool intfs_swapped;
>   
> @@ -1008,7 +1015,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>   	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
> -	int num_lm, num_ctl, num_pp;
> +	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> +	int num_lm, num_ctl, num_pp, num_dsc;
>   	int i, j;
>   
>   	if (!drm_enc) {
> @@ -1061,11 +1069,16 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
>   	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>   		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
>   		ARRAY_SIZE(hw_dspp));
> +	num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +		drm_enc->base.id, DPU_HW_BLK_DSC, hw_dsc, ARRAY_SIZE(hw_dsc));
>   
>   	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
>   		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
>   						: NULL;
>   
> +	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +		dpu_enc->hw_dsc[i] = i < num_dsc ? to_dpu_hw_dsc(hw_dsc[i]) : NULL;
> +
>   	cstate = to_dpu_crtc_state(drm_crtc->state);
>   
>   	for (i = 0; i < num_lm; i++) {
> @@ -1810,10 +1823,133 @@ static void dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
>   			nsecs_to_jiffies(ktime_to_ns(wakeup_time)));
>   }
>   
> +static void
> +dpu_encoder_dsc_pclk_param_calc(struct msm_display_dsc_config *dsc, u32 width)
> +{
> +	int slice_count, slice_per_intf;
> +	int bytes_in_slice, total_bytes_per_intf;
> +
> +	if (!dsc || !dsc->drm->slice_width || !dsc->drm->slice_count) {
> +		DPU_ERROR("Invalid DSC/slices\n");
> +		return;
> +	}
> +
> +	slice_count = dsc->drm->slice_count;
> +	slice_per_intf = DIV_ROUND_UP(width, dsc->drm->slice_width);
> +
> +	/*
> +	 * If slice_count is greater than slice_per_intf then default to 1.
> +	 * This can happen during partial update.
> +	 */
> +	if (slice_count > slice_per_intf)
> +		slice_count = 1;
> +
> +	bytes_in_slice = DIV_ROUND_UP(dsc->drm->slice_width *
> +				      dsc->drm->bits_per_pixel, 8);
> +	total_bytes_per_intf = bytes_in_slice * slice_per_intf;
> +
> +	dsc->eol_byte_num = total_bytes_per_intf % 3;
> +	dsc->pclk_per_line =  DIV_ROUND_UP(total_bytes_per_intf, 3);
> +	dsc->bytes_in_slice = bytes_in_slice;
> +	dsc->bytes_per_pkt = bytes_in_slice * slice_count;
> +	dsc->pkt_per_line = slice_per_intf / slice_count;
> +}
> +
> +static void
> +dpu_encoder_dsc_initial_line_calc(struct msm_display_dsc_config *dsc,
> +				  u32 enc_ip_width)
> +{
> +	int ssm_delay, total_pixels, soft_slice_per_enc;
> +
> +	soft_slice_per_enc = enc_ip_width / dsc->drm->slice_width;
> +
> +	/*
> +	 * minimum number of initial line pixels is a sum of:
> +	 * 1. sub-stream multiplexer delay (83 groups for 8bpc,
> +	 *    91 for 10 bpc) * 3
> +	 * 2. for two soft slice cases, add extra sub-stream multiplexer * 3
> +	 * 3. the initial xmit delay
> +	 * 4. total pipeline delay through the "lock step" of encoder (47)
> +	 * 5. 6 additional pixels as the output of the rate buffer is
> +	 *    48 bits wide
> +	 */
> +	ssm_delay = ((dsc->drm->bits_per_component < 10) ? 84 : 92);
> +	total_pixels = ssm_delay * 3 + dsc->drm->initial_xmit_delay + 47;
> +	if (soft_slice_per_enc > 1)
> +		total_pixels += (ssm_delay * 3);
> +	dsc->initial_lines = DIV_ROUND_UP(total_pixels, dsc->drm->slice_width);
> +}
> +
> +static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
> +				     struct dpu_hw_pingpong *hw_pp,
> +				     struct msm_display_dsc_config *dsc,
> +				     u32 common_mode)
> +{
> +	if (hw_dsc->ops.dsc_config)
> +		hw_dsc->ops.dsc_config(hw_dsc, dsc, common_mode);
> +
> +	if (hw_dsc->ops.dsc_config_thresh)
> +		hw_dsc->ops.dsc_config_thresh(hw_dsc, dsc);
> +
> +	if (hw_pp->ops.setup_dsc)
> +		hw_pp->ops.setup_dsc(hw_pp);
> +
> +	if (hw_pp->ops.enable_dsc)
> +		hw_pp->ops.enable_dsc(hw_pp);

I think, we do not need to split these operations, I'd suggest having 
just hw_dsc->ops.dsc_config() and hw_pp->ops.enable_dsc(), merging 
dsc_config_thres() and setup_dsc() into respective methods.

> +}
> +
> +static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> +				 struct msm_display_dsc_config *dsc)
> +{
> +	/* coding only for 2LM, 2enc, 1 dsc config */
> +	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
> +	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> +	int this_frame_slices;
> +	int intf_ip_w, enc_ip_w;
> +	int dsc_common_mode;
> +	int pic_width, pic_height;
> +	int i;
> +
> +	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
> +		hw_pp[i] = dpu_enc->hw_pp[i];
> +		hw_dsc[i] = dpu_enc->hw_dsc[i];
> +
> +		if (!hw_pp[i] || !hw_dsc[i]) {
> +			DPU_ERROR_ENC(dpu_enc, "invalid params for DSC\n");
> +			return;
> +		}
> +	}
> +
> +	dsc_common_mode = 0;
> +	pic_width = dsc->drm->pic_width;
> +	pic_height = dsc->drm->pic_height;
> +
> +	dsc_common_mode = DSC_MODE_MULTIPLEX | DSC_MODE_SPLIT_PANEL;
> +	if (enc_master->intf_mode == INTF_MODE_VIDEO)
> +		dsc_common_mode |= DSC_MODE_VIDEO;
> +
> +	this_frame_slices = pic_width / dsc->drm->slice_width;
> +	intf_ip_w = this_frame_slices * dsc->drm->slice_width;
> +
> +	dpu_encoder_dsc_pclk_param_calc(dsc, intf_ip_w);
> +
> +	/*
> +	 * dsc merge case: when using 2 encoders for the same stream,
> +	 * no. of slices need to be same on both the encoders.
> +	 */
> +	enc_ip_w = intf_ip_w / 2;
> +	dpu_encoder_dsc_initial_line_calc(dsc, enc_ip_w);
> +
> +	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +		dpu_encoder_dsc_pipe_cfg(hw_dsc[i], hw_pp[i], dsc, dsc_common_mode);
> +}
> +
>   void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
>   {
>   	struct dpu_encoder_virt *dpu_enc;
>   	struct dpu_encoder_phys *phys;
> +	struct msm_drm_private *priv;
>   	bool needs_hw_reset = false;
>   	unsigned int i;
>   
> @@ -1841,6 +1977,10 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
>   			dpu_encoder_helper_hw_reset(dpu_enc->phys_encs[i]);
>   		}
>   	}
> +
> +	priv = drm_enc->dev->dev_private;
> +	if (priv->dsc)
> +		dpu_encoder_prep_dsc(dpu_enc, priv->dsc);

Not quite. This makes dsc config global, while we can have several 
encoders enabled at once (think of DSI + DP). So the dsc should be a 
per-encoder setting rather than global.

>   }
>   
>   void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
> 


-- 
With best wishes
Dmitry
