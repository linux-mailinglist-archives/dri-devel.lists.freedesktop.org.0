Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3CC3DE3B5
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 02:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61C66E1F2;
	Tue,  3 Aug 2021 00:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DFD26E217
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 00:58:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627952306; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=L91wI3wMyRh86rCU8asTtP5eHLcHNJCjnnsXcpNsE5s=;
 b=G6D/SzLIEZ13adFuEWZuK6/99J3J1sCz85mtLz2tgE4J3EFIwiqvzj9rat/fL96glvARzWxO
 9A2sMOPk5FtreGRM3Uj64AlgIkZ75eL2K4B6WMDHLEu+ukxelWV8EqF37HINh2gID71GJts5
 K9ezje1zuuUK3mmfsdPrJadg0FE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 6108949796a66e66b283b433 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Aug 2021 00:57:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D0908C4338A; Tue,  3 Aug 2021 00:57:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A4DAEC433D3;
 Tue,  3 Aug 2021 00:57:56 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 02 Aug 2021 17:57:56 -0700
From: abhinavk@codeaurora.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson
 <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org, Daniel Vetter
 <daniel@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH 08/11] drm/msm/disp/dpu1: Add support for DSC
 in encoder
In-Reply-To: <20210715065203.709914-9-vkoul@kernel.org>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-9-vkoul@kernel.org>
Message-ID: <70d5abae07b4dbf63d8dbf47ba31262d@codeaurora.org>
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

On 2021-07-14 23:52, Vinod Koul wrote:
> When DSC is enabled in DT, we need to configure the encoder for DSC
> configuration, calculate DSC parameters for the given timing.
> 
> This patch adds that support by adding dpu_encoder_prep_dsc() which is
> invoked when DSC is enabled in DT
correct me if wrong but this commit text is not valid anymore in my 
opinion.
are there any params you are getting from DT now? I thought its all 
coming from the panel
driver directly.
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
agree with dmitry's comment's 
https://patchwork.freedesktop.org/patch/444078/?series=90413&rev=2

instead of dsc being part of priv->dsc it should be per encoder.

On top of his comment, I also think that like on the newer chipsets, 
moving the dsc related
encoder configuration to a dpu_encoder_dce.c will help for future 
expansion of other topologies
and also for other compression algorithms.

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 142 +++++++++++++++++++-
>  1 file changed, 141 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 8d942052db8a..41140b781e66 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -21,12 +21,17 @@
>  #include "dpu_hw_intf.h"
>  #include "dpu_hw_ctl.h"
>  #include "dpu_hw_dspp.h"
> +#include "dpu_hw_dsc.h"
>  #include "dpu_formats.h"
>  #include "dpu_encoder_phys.h"
>  #include "dpu_crtc.h"
>  #include "dpu_trace.h"
>  #include "dpu_core_irq.h"
> 
> +#define DSC_MODE_SPLIT_PANEL		BIT(0)
> +#define DSC_MODE_MULTIPLEX		BIT(1)
> +#define DSC_MODE_VIDEO			BIT(2)
> +
>  #define DPU_DEBUG_ENC(e, fmt, ...) DPU_DEBUG("enc%d " fmt,\
>  		(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
> 
> @@ -135,6 +140,7 @@ enum dpu_enc_rc_states {
>   * @cur_slave:		As above but for the slave encoder.
>   * @hw_pp:		Handle to the pingpong blocks used for the display. No.
>   *			pingpong blocks can be different than num_phys_encs.
> + * @hw_dsc		Handle to the DSC blocks used for the display.
>   * @intfs_swapped:	Whether or not the phys_enc interfaces have been 
> swapped
>   *			for partial update right-only cases, such as pingpong
>   *			split where virtual pingpong does not generate IRQs
> @@ -180,6 +186,7 @@ struct dpu_encoder_virt {
>  	struct dpu_encoder_phys *cur_master;
>  	struct dpu_encoder_phys *cur_slave;
>  	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
> +	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> 
>  	bool intfs_swapped;
> 
> @@ -1008,7 +1015,8 @@ static void dpu_encoder_virt_mode_set(struct
> drm_encoder *drm_enc,
>  	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
>  	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
> -	int num_lm, num_ctl, num_pp;
> +	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
> +	int num_lm, num_ctl, num_pp, num_dsc;
>  	int i, j;
> 
>  	if (!drm_enc) {
> @@ -1061,11 +1069,16 @@ static void dpu_encoder_virt_mode_set(struct
> drm_encoder *drm_enc,
>  	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>  		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
>  		ARRAY_SIZE(hw_dspp));
> +	num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
> +		drm_enc->base.id, DPU_HW_BLK_DSC, hw_dsc, ARRAY_SIZE(hw_dsc));
> 
>  	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
>  		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
>  						: NULL;
> 
> +	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +		dpu_enc->hw_dsc[i] = i < num_dsc ? to_dpu_hw_dsc(hw_dsc[i]) : NULL;
> +
>  	cstate = to_dpu_crtc_state(drm_crtc->state);
> 
>  	for (i = 0; i < num_lm; i++) {
> @@ -1810,10 +1823,133 @@ static void
> dpu_encoder_vsync_event_work_handler(struct kthread_work *work)
>  			nsecs_to_jiffies(ktime_to_ns(wakeup_time)));
>  }
> 
> +static void
> +dpu_encoder_dsc_pclk_param_calc(struct msm_display_dsc_config *dsc, 
> u32 width)
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
> +	dsc->initial_lines = DIV_ROUND_UP(total_pixels, 
> dsc->drm->slice_width);
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
>  void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
>  {
>  	struct dpu_encoder_virt *dpu_enc;
>  	struct dpu_encoder_phys *phys;
> +	struct msm_drm_private *priv;
>  	bool needs_hw_reset = false;
>  	unsigned int i;
> 
> @@ -1841,6 +1977,10 @@ void dpu_encoder_prepare_for_kickoff(struct
> drm_encoder *drm_enc)
>  			dpu_encoder_helper_hw_reset(dpu_enc->phys_encs[i]);
>  		}
>  	}
> +
> +	priv = drm_enc->dev->dev_private;
> +	if (priv->dsc)
> +		dpu_encoder_prep_dsc(dpu_enc, priv->dsc);
>  }
> 
>  void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
