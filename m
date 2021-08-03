Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BA13DE389
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 02:25:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204856E141;
	Tue,  3 Aug 2021 00:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545076E05F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 00:25:00 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627950304; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=hkpyI7Uoz+e4IQsxRQvfWnyB0MT3Cv9l9NvcdTelAwA=;
 b=cit0JJyoJcQs2OYAGYu4iWeHPen/OUg2w9lAt4wOPgL3RHFVmaEVPU0JNIX9yWfm2nkVUjtb
 OSJPCahlYdszhO9gam243SwhfX5zg4Y5eQSYb80HTQJ7fItQxgAlCByGPW1QwQgGkDoWI8oH
 u2qiW2T4iws22YWmtLp2n9+9ASk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61088ccdb653fbdadd1d3d6a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Aug 2021 00:24:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 0C51DC43460; Tue,  3 Aug 2021 00:24:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id F2BFDC433D3;
 Tue,  3 Aug 2021 00:24:43 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 02 Aug 2021 17:24:43 -0700
From: abhinavk@codeaurora.org
To: Vinod Koul <vkoul@kernel.org>
Cc: Rob Clark <robdclark@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, Bjorn Andersson
 <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org, Daniel Vetter
 <daniel@ffwll.ch>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: Re: [Freedreno] [PATCH 07/11] drm/msm/disp/dpu1: Don't use DSC with
 mode_3d
In-Reply-To: <20210715065203.709914-8-vkoul@kernel.org>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-8-vkoul@kernel.org>
Message-ID: <cd5d1e1fb3a8ce1a9970c29a39df1b4b@codeaurora.org>
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

On 2021-07-14 23:51, Vinod Koul wrote:
> We cannot enable mode_3d when we are using the DSC. So pass
> configuration to detect DSC is enabled and not enable mode_3d
> when we are using DSC
> 
> We add a helper dpu_encoder_helper_get_dsc_mode() to detect dsc
> enabled and pass this to .setup_intf_cfg()
> 
This is not entirely correct. This is true only for the 2-2-1 topology 
you are using
on this panel.

When you are using 2-2-1, you are using 2 LMs, 2 DSCs and 1 DSI.
So 3D mux shouldnt be used.

If you are using something like 4-2-1 or 4-2-2, then you have 4LMs,
2 DSCs and 2/1 DSI.

Here you need the 3D mux to convert the data from 4LMs to 2 DSCs.

So please correct the commit text here and also add a check for the 
topology.

> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h     | 11 +++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c |  2 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c           |  5 +++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h           |  2 ++
>  4 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> index ecbc4be98980..d43b804528eb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
> @@ -336,6 +336,17 @@ static inline enum dpu_3d_blend_mode
> dpu_encoder_helper_get_3d_blend_mode(
>  	return BLEND_3D_NONE;
>  }
> 
> +static inline bool dpu_encoder_helper_get_dsc_mode(struct
> dpu_encoder_phys *phys_enc)
> +{
> +	struct drm_encoder *drm_enc = phys_enc->parent;
> +	struct msm_drm_private *priv = drm_enc->dev->dev_private;
> +
> +	if (priv->dsc)
> +		return true;
> +
> +	return false;
> +}
Check whether DSC is enabled and only if its 2-2-1 topology.
This needs to be reworked when other topologies are supported.

> +
>  /**
>   * dpu_encoder_helper_split_config - split display configuration
> helper function
>   *	This helper function may be used by physical encoders to configure
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index b2be39b9144e..5fe87881c30c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -69,6 +69,8 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>  	intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_CMD;
>  	intf_cfg.stream_sel = cmd_enc->stream_sel;
>  	intf_cfg.mode_3d = dpu_encoder_helper_get_3d_blend_mode(phys_enc);
> +	intf_cfg.dsc = dpu_encoder_helper_get_dsc_mode(phys_enc);
> +
>  	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>  }
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index aeea6add61ee..f059416311ee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -121,7 +121,7 @@ static u32 dpu_hw_ctl_get_pending_flush(struct
> dpu_hw_ctl *ctx)
>  	return ctx->pending_flush_mask;
>  }
> 
> -static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
> +static void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>  {
>  	DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, BIT(0) | BIT(1) | BIT(2) | 
> BIT(3));
> 
> @@ -522,7 +522,8 @@ static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl 
> *ctx,
> 
>  	intf_cfg |= (cfg->intf & 0xF) << 4;
> 
> -	if (cfg->mode_3d) {
> +	/* In DSC we can't set merge, so check for dsc too */
> +	if (cfg->mode_3d && !cfg->dsc) {
>  		intf_cfg |= BIT(19);
>  		intf_cfg |= (cfg->mode_3d - 0x1) << 20;
>  	}
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index 806c171e5df2..347a653c1e01 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -39,6 +39,7 @@ struct dpu_hw_stage_cfg {
>   * @mode_3d:               3d mux configuration
>   * @merge_3d:              3d merge block used
>   * @intf_mode_sel:         Interface mode, cmd / vid
> + * @dsc:                   DSC is enabled
>   * @stream_sel:            Stream selection for multi-stream 
> interfaces
>   */
>  struct dpu_hw_intf_cfg {
> @@ -46,6 +47,7 @@ struct dpu_hw_intf_cfg {
>  	enum dpu_3d_blend_mode mode_3d;
>  	enum dpu_merge_3d merge_3d;
>  	enum dpu_ctl_mode_sel intf_mode_sel;
> +	bool dsc;
>  	int stream_sel;
>  };
