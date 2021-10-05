Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9857E423175
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 22:16:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2EEA6E461;
	Tue,  5 Oct 2021 20:16:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F756EC35
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 20:16:51 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633465014; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=LLYWj2cR3RQ0XRJuW8Ce2jrEoU1FZsckcPyjTmeI2us=;
 b=rElxwCdJjsPvhfBH8mHJ9RWtsFO2cDUMJ5JuHc0ohGRpEM68IPwGwfevbNw2uJQ80Hnsgu/s
 MNiVSHXSkW5NYLGnDBiDbdo6HsvSK3f9IYIjU7S+rUYpk6Iu3kTD2xgRxrk80Xp5ZFPgqguG
 pd0DA1GidztMK7z1EixRS9JqjW0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 615cb2a2b8ab9916b3843563 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 20:16:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2AEB9C43619; Tue,  5 Oct 2021 20:16:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B9750C4360C;
 Tue,  5 Oct 2021 20:16:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 05 Oct 2021 13:16:31 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v3 3/5] drm/msm/dp: Support up to 3 DP
 controllers
In-Reply-To: <20211001180058.1021913-4-bjorn.andersson@linaro.org>
References: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
 <20211001180058.1021913-4-bjorn.andersson@linaro.org>
Message-ID: <737b902fd0599d9659f4d22ec143b4a7@codeaurora.org>
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

On 2021-10-01 11:00, Bjorn Andersson wrote:
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
> Lastly, bump the number of struct msm_dp instances carries by priv->dp
> to 3, the currently known maximum number of controllers found in a
> Qualcomm SoC.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v2:
> - Added MSM_DRM_DP_COUNT to link the two 3s
> - Moved NULL check for msm_dp_debugfs_init() to the call site
> - Made struct dp_display_private->id unsigned
> 
> I also implemented added connector_type to each of the DP instances and
> propagated this to dp_drm_connector_init() but later dropped this again 
> per
> Doug's suggestion that we'll base this on the presence/absence of a 
> associated
> drm bridge or panel.
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 66 +++++++++++--------
>  .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  8 ++-
>  drivers/gpu/drm/msm/dp/dp_display.c           | 44 ++++++++++++-
>  drivers/gpu/drm/msm/msm_drv.h                 |  4 +-
>  5 files changed, 90 insertions(+), 34 deletions(-)
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

At this point this is a nit but not sure if this is right to use the 
tile_instance as the index.
In the future if we chose to assign another index to the 
h_tile_instance, this would break.
But I cant think of the use-case for that yet, Hence
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

> 
>  	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>  			dpu_encoder_off_work);
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
> index 5d3ee5ef07c2..ff3477474c5d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -78,6 +78,8 @@ struct dp_display_private {
>  	char *name;
>  	int irq;
> 
> +	unsigned int id;
> +
>  	/* state variables */
>  	bool core_initialized;
>  	bool hpd_irq_on;
> @@ -115,8 +117,18 @@ struct dp_display_private {
>  	struct dp_audio *audio;
>  };
> 
> +struct msm_dp_config {
> +	phys_addr_t io_start[MSM_DRM_DP_COUNT];
> +	size_t num_descs;
> +};
> +
> +static const struct msm_dp_config sc7180_dp_cfg = {
> +	.io_start = { 0x0ae90000 },
> +	.num_descs = 1,
> +};
> +
>  static const struct of_device_id dp_dt_match[] = {
> -	{.compatible = "qcom,sc7180-dp"},
> +	{ .compatible = "qcom,sc7180-dp", .data = &sc7180_dp_cfg },
>  	{}
>  };
> 
> @@ -211,7 +223,7 @@ static int dp_display_bind(struct device *dev,
> struct device *master,
> 
>  	dp->dp_display.drm_dev = drm;
>  	priv = drm->dev_private;
> -	priv->dp = &(dp->dp_display);
> +	priv->dp[dp->id] = &(dp->dp_display);
> 
>  	rc = dp->parser->parse(dp->parser);
>  	if (rc) {
> @@ -249,7 +261,7 @@ static void dp_display_unbind(struct device *dev,
> struct device *master,
> 
>  	dp_power_client_deinit(dp->power);
>  	dp_aux_unregister(dp->aux);
> -	priv->dp = NULL;
> +	priv->dp[dp->id] = NULL;
>  }
> 
>  static const struct component_ops dp_display_comp_ops = {
> @@ -1180,10 +1192,31 @@ int dp_display_request_irq(struct msm_dp 
> *dp_display)
>  	return 0;
>  }
> 
> +static int dp_display_find_id(struct platform_device *pdev)
> +{
> +	const struct msm_dp_config *cfg = 
> of_device_get_match_data(&pdev->dev);
> +	struct resource *res;
> +	int i;
> +
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	if (!res)
> +		return -EINVAL;
> +
> +	for (i = 0; i < cfg->num_descs; i++) {
> +		if (cfg->io_start[i] == res->start)
> +			return i;
> +	}
> +
> +	dev_err(&pdev->dev, "unknown displayport instance\n");
> +	return -EINVAL;
> +}
> +
>  static int dp_display_probe(struct platform_device *pdev)
>  {
>  	int rc = 0;
>  	struct dp_display_private *dp;
> +	int id;
> 
>  	if (!pdev || !pdev->dev.of_node) {
>  		DRM_ERROR("pdev not found\n");
> @@ -1194,8 +1227,13 @@ static int dp_display_probe(struct 
> platform_device *pdev)
>  	if (!dp)
>  		return -ENOMEM;
> 
> +	id = dp_display_find_id(pdev);
> +	if (id < 0)
> +		return id;
> +
>  	dp->pdev = pdev;
>  	dp->name = "drm_dp";
> +	dp->id = id;
> 
>  	rc = dp_init_sub_modules(dp);
>  	if (rc) {
> diff --git a/drivers/gpu/drm/msm/msm_drv.h 
> b/drivers/gpu/drm/msm/msm_drv.h
> index 8b005d1ac899..b20a6dd221f7 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -135,6 +135,8 @@ struct msm_drm_thread {
>  	struct kthread_worker *worker;
>  };
> 
> +#define MSM_DRM_DP_COUNT	3
> +
>  struct msm_drm_private {
> 
>  	struct drm_device *dev;
> @@ -161,7 +163,7 @@ struct msm_drm_private {
>  	/* DSI is shared by mdp4 and mdp5 */
>  	struct msm_dsi *dsi[2];
> 
> -	struct msm_dp *dp;
> +	struct msm_dp *dp[MSM_DRM_DP_COUNT];
> 
>  	/* when we have more than one 'msm_gpu' these need to be an array: */
>  	struct msm_gpu *gpu;
