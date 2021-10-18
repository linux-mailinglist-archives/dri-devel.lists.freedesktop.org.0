Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C487432A0A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 01:10:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FAC6EAA6;
	Mon, 18 Oct 2021 23:10:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64BD56EAA6
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 23:10:39 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634598641; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=VuEA9KtL3nwPTGvwfQkUd/7YKQgZc4rScxqyoVjdkV0=;
 b=aXRvomOzmr7rZoViQ5po7NLiM6jtTodt8nlelRlh5vSrtsILXfy0325qzh1qEwsCmkPHb3CE
 dQbYytu7fC3S7vWZxrLA/5c9XiU6AAZhMLHH2UUMJEqE4aM84pmhcGij4z6lNLkxt97n1/C0
 33U+/KFeJzuSZKBpSyoskYFm29E=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 616dfee9fd91319f0f1bb8cb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 Oct 2021 23:10:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C8A1FC4360C; Mon, 18 Oct 2021 23:10:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E24EFC43460;
 Mon, 18 Oct 2021 23:10:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 18 Oct 2021 16:10:30 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v5 5/7] drm/msm/dp: Support up to 3 DP
 controllers
In-Reply-To: <20211016221843.2167329-6-bjorn.andersson@linaro.org>
References: <20211016221843.2167329-1-bjorn.andersson@linaro.org>
 <20211016221843.2167329-6-bjorn.andersson@linaro.org>
Message-ID: <cc72a764f9a8c5cfda9447de9c79bc97@codeaurora.org>
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

On 2021-10-16 15:18, Bjorn Andersson wrote:
> Based on the removal of the g_dp_display and the movement of the
> priv->dp lookup into the DP code it's now possible to have multiple
> DP instances.
> 
> In line with the other controllers in the MSM driver, introduce a
> per-compatible list of base addresses which is used to resolve the
> "instance id" for the given DP controller. This instance id is used as
> index in the priv->dp[] array.
> 
> Then extend the initialization code to initialize struct drm_encoder 
> for
> each of the registered priv->dp[] and update the logic for associating
> each struct msm_dp with the struct dpu_encoder_virt.
> 
> A new enum is introduced to document the connection between the
> instances referenced in the dpu_intf_cfg array and the controllers in
> the DP driver and sc7180 is updated.
> 
> Lastly, bump the number of struct msm_dp instances carries by priv->dp
> to 3, the currently known maximum number of controllers found in a
> Qualcomm SoC.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
> 
> Changes since v4:
> - MSM_DP_CONTROLLER_n introduced to clarify the relationship between 
> the intf
>   specification and the indices of the msm_dp_desc
> - Unnecessary parenthesis around dp->dp_display was dropped
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 66 +++++++++++--------
>  .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  8 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c           | 20 ++++--
>  drivers/gpu/drm/msm/msm_drv.h                 |  9 ++-
>  6 files changed, 68 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index b7f33da2799c..9cd9539a1504 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -2173,7 +2173,7 @@ int dpu_encoder_setup(struct drm_device *dev,
> struct drm_encoder *enc,
>  				dpu_encoder_vsync_event_handler,
>  				0);
>  	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
> -		dpu_enc->dp = priv->dp;
> +		dpu_enc->dp = priv->dp[disp_info->h_tile_instance[0]];
> 
>  	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>  			dpu_encoder_off_work);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 60eed3128b54..47d5d71eb5d3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -900,7 +900,7 @@ static const struct dpu_intf_cfg sdm845_intf[] = {
>  };
> 
>  static const struct dpu_intf_cfg sc7180_intf[] = {
> -	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, 0, 24,
> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
> +	INTF_BLK("intf_0", INTF_0, 0x6A000, INTF_DP, MSM_DP_CONTROLLER_0,
> 24, INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>  	INTF_BLK("intf_1", INTF_1, 0x6A800, INTF_DSI, 0, 24,
> INTF_SC7180_MASK, MDP_SSPP_TOP0_INTR, 26, 27),
>  };
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index f655adbc2421..875b07e7183d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -188,6 +188,7 @@ static int dpu_kms_debugfs_init(struct msm_kms
> *kms, struct drm_minor *minor)
>  	struct dentry *entry;
>  	struct drm_device *dev;
>  	struct msm_drm_private *priv;
> +	int i;
> 
>  	if (!p)
>  		return -EINVAL;
> @@ -203,8 +204,10 @@ static int dpu_kms_debugfs_init(struct msm_kms
> *kms, struct drm_minor *minor)
>  	dpu_debugfs_vbif_init(dpu_kms, entry);
>  	dpu_debugfs_core_irq_init(dpu_kms, entry);
> 
> -	if (priv->dp)
> -		msm_dp_debugfs_init(priv->dp, minor);
> +	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
> +		if (priv->dp[i])
> +			msm_dp_debugfs_init(priv->dp[i], minor);
> +	}
> 
>  	return dpu_core_perf_debugfs_init(dpu_kms, entry);
>  }
> @@ -544,35 +547,42 @@ static int
> _dpu_kms_initialize_displayport(struct drm_device *dev,
>  {
>  	struct drm_encoder *encoder = NULL;
>  	struct msm_display_info info;
> -	int rc = 0;
> +	int rc;
> +	int i;
> 
> -	if (!priv->dp)
> -		return rc;
> +	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
> +		if (!priv->dp[i])
> +			continue;
> 
> -	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
> -	if (IS_ERR(encoder)) {
> -		DPU_ERROR("encoder init failed for dsi display\n");
> -		return PTR_ERR(encoder);
> -	}
> +		encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS);
> +		if (IS_ERR(encoder)) {
> +			DPU_ERROR("encoder init failed for dsi display\n");
> +			return PTR_ERR(encoder);
> +		}
> 
> -	memset(&info, 0, sizeof(info));
> -	rc = msm_dp_modeset_init(priv->dp, dev, encoder);
> -	if (rc) {
> -		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
> -		drm_encoder_cleanup(encoder);
> -		return rc;
> -	}
> +		memset(&info, 0, sizeof(info));
> +		rc = msm_dp_modeset_init(priv->dp[i], dev, encoder);
> +		if (rc) {
> +			DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
> +			drm_encoder_cleanup(encoder);
> +			return rc;
> +		}
> 
> -	priv->encoders[priv->num_encoders++] = encoder;
> +		priv->encoders[priv->num_encoders++] = encoder;
> 
> -	info.num_of_h_tiles = 1;
> -	info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
> -	info.intf_type = encoder->encoder_type;
> -	rc = dpu_encoder_setup(dev, encoder, &info);
> -	if (rc)
> -		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> -			  encoder->base.id, rc);
> -	return rc;
> +		info.num_of_h_tiles = 1;
> +		info.h_tile_instance[0] = i;
> +		info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
> +		info.intf_type = encoder->encoder_type;
> +		rc = dpu_encoder_setup(dev, encoder, &info);
> +		if (rc) {
> +			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> +				  encoder->base.id, rc);
> +			return rc;
> +		}
> +	}
> +
> +	return 0;
>  }
> 
>  /**
> @@ -792,6 +802,7 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
>  {
>  	struct msm_drm_private *priv;
>  	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> +	int i;
> 
>  	if (!dpu_kms || !dpu_kms->dev)
>  		return -EINVAL;
> @@ -800,7 +811,8 @@ static int dpu_irq_postinstall(struct msm_kms *kms)
>  	if (!priv)
>  		return -EINVAL;
> 
> -	msm_dp_irq_postinstall(priv->dp);
> +	for (i = 0; i < ARRAY_SIZE(priv->dp); i++)
> +		msm_dp_irq_postinstall(priv->dp[i]);
> 
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> index cabe15190ec1..2e1acb1bc390 100644
> --- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> +++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
> @@ -126,8 +126,12 @@ void msm_disp_snapshot_capture_state(struct
> msm_disp_state *disp_state)
>  	priv = drm_dev->dev_private;
>  	kms = priv->kms;
> 
> -	if (priv->dp)
> -		msm_dp_snapshot(disp_state, priv->dp);
> +	for (i = 0; i < ARRAY_SIZE(priv->dp); i++) {
> +		if (!priv->dp[i])
> +			continue;
> +
> +		msm_dp_snapshot(disp_state, priv->dp[i]);
> +	}
> 
>  	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>  		if (!priv->dsi[i])
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index c663cd619925..d3c9d7273354 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -79,6 +79,8 @@ struct dp_display_private {
>  	char *name;
>  	int irq;
> 
> +	unsigned int id;
> +
>  	/* state variables */
>  	bool core_initialized;
>  	bool hpd_irq_on;
> @@ -128,7 +130,7 @@ struct msm_dp_config {
> 
>  static const struct msm_dp_config sc7180_dp_cfg = {
>  	.descs = (const struct msm_dp_desc[]) {
> -		{ .io_start = 0x0ae90000, .connector_type = 
> DRM_MODE_CONNECTOR_DisplayPort },
> +		[MSM_DP_CONTROLLER_0] = { .io_start = 0x0ae90000, .connector_type =
> DRM_MODE_CONNECTOR_DisplayPort },
>  	},
>  	.num_descs = 1,
>  };
> @@ -229,7 +231,7 @@ static int dp_display_bind(struct device *dev,
> struct device *master,
> 
>  	dp->dp_display.drm_dev = drm;
>  	priv = drm->dev_private;
> -	priv->dp = &(dp->dp_display);
> +	priv->dp[dp->id] = &dp->dp_display;
> 
>  	rc = dp->parser->parse(dp->parser, dp->dp_display.connector_type);
>  	if (rc) {
> @@ -269,7 +271,7 @@ static void dp_display_unbind(struct device *dev,
> struct device *master,
> 
>  	dp_power_client_deinit(dp->power);
>  	dp_aux_unregister(dp->aux);
> -	priv->dp = NULL;
> +	priv->dp[dp->id] = NULL;
>  }
> 
>  static const struct component_ops dp_display_comp_ops = {
> @@ -1200,7 +1202,8 @@ int dp_display_request_irq(struct msm_dp 
> *dp_display)
>  	return 0;
>  }
> 
> -static const struct msm_dp_desc *dp_display_get_desc(struct
> platform_device *pdev)
> +static const struct msm_dp_desc *dp_display_get_desc(struct
> platform_device *pdev,
> +						     unsigned int *id)
>  {
>  	const struct msm_dp_config *cfg = 
> of_device_get_match_data(&pdev->dev);
>  	struct resource *res;
> @@ -1210,9 +1213,12 @@ static const struct msm_dp_desc
> *dp_display_get_desc(struct platform_device *pde
>  	if (!res)
>  		return NULL;
> 
> -	for (i = 0; i < cfg->num_descs; i++)
> -		if (cfg->descs[i].io_start == res->start)
> +	for (i = 0; i < cfg->num_descs; i++) {
> +		if (cfg->descs[i].io_start == res->start) {
> +			*id = i;
>  			return &cfg->descs[i];
> +		}
> +	}
> 
>  	dev_err(&pdev->dev, "unknown displayport instance\n");
>  	return NULL;
> @@ -1233,7 +1239,7 @@ static int dp_display_probe(struct 
> platform_device *pdev)
>  	if (!dp)
>  		return -ENOMEM;
> 
> -	desc = dp_display_get_desc(pdev);
> +	desc = dp_display_get_desc(pdev, &dp->id);
>  	if (!desc)
>  		return -EINVAL;
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
> b/drivers/gpu/drm/msm/msm_drv.h
> index 8b005d1ac899..bfd5022a9e6d 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -68,6 +68,13 @@ enum msm_mdp_plane_property {
>  	PLANE_PROP_MAX_NUM
>  };
> 
> +enum msm_dp_controller {
> +	MSM_DP_CONTROLLER_0,
> +	MSM_DP_CONTROLLER_1,
> +	MSM_DP_CONTROLLER_2,
> +	MSM_DP_CONTROLLER_COUNT,
> +};
> +
>  #define MSM_GPU_MAX_RINGS 4
>  #define MAX_H_TILES_PER_DISPLAY 2
> 
> @@ -161,7 +168,7 @@ struct msm_drm_private {
>  	/* DSI is shared by mdp4 and mdp5 */
>  	struct msm_dsi *dsi[2];
> 
> -	struct msm_dp *dp;
> +	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
> 
>  	/* when we have more than one 'msm_gpu' these need to be an array: */
>  	struct msm_gpu *gpu;
