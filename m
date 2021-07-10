Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 110CA3C2C15
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 02:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6126EAA6;
	Sat, 10 Jul 2021 00:31:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16ED6EAA6
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jul 2021 00:30:58 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625877061; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HTlz6OnjB0QGUgXJthBavTLO9pwa6lZrqT1cKGoxOeQ=;
 b=FoA64l3syA14UZdVwfGjk4sZ/WgKiLt+0Tx51aeJZgALSONAGOrpwBZqVjqzPN2+nkcuCvim
 t8v0QWCn3qY1tkCdvwrSod24YTmPejozGVdPI4t8AcZ9gl4NOY/A1jm50Itnq2dYDYjkaMxM
 nb5fqYvIo9u2avRh6dUrGnNA2zM=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60e8ea287b2963a282f30fc3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 10 Jul 2021 00:30:32
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2ED73C43143; Sat, 10 Jul 2021 00:30:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B6EE5C433F1;
 Sat, 10 Jul 2021 00:30:29 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 09 Jul 2021 17:30:29 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v2 3/7] drm/msm/dpu: support setting up two
 independent DSI connectors
In-Reply-To: <20210709235024.1077888-4-dmitry.baryshkov@linaro.org>
References: <20210709235024.1077888-1-dmitry.baryshkov@linaro.org>
 <20210709235024.1077888-4-dmitry.baryshkov@linaro.org>
Message-ID: <0a19346363a524e071b12610d9c08647@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-09 16:50, Dmitry Baryshkov wrote:
> Move setting up encoders from set_encoder_mode to
> _dpu_kms_initialize_dsi() / _dpu_kms_initialize_displayport(). This
> allows us to support not only "single DSI" and "bonded DSI" but also 
> "two
> independent DSI" configurations. In future this would also help adding
> support for multiple DP connectors.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 130 ++++++++++++++----------
>  1 file changed, 79 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 1d3a4f395e74..e14eb8f94cd7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -466,17 +466,16 @@ static void dpu_kms_wait_flush(struct msm_kms
> *kms, unsigned crtc_mask)
>  		dpu_kms_wait_for_commit_done(kms, crtc);
>  }
> 
> -static int _dpu_kms_initialize_dsi(struct drm_device *dev,
> -				    struct msm_drm_private *priv,
> -				    struct dpu_kms *dpu_kms)
> +static int _dpu_kms_initialize_dsi_encoder(struct drm_device *dev,
> +					   struct msm_drm_private *priv,
> +					   struct dpu_kms *dpu_kms,
> +					   int dsi_id, int dsi_id1)
>  {
> +	struct msm_dsi *dsi = priv->dsi[dsi_id];
>  	struct drm_encoder *encoder = NULL;
> -	int i, rc = 0;
> -
> -	if (!(priv->dsi[0] || priv->dsi[1]))
> -		return rc;
> +	struct msm_display_info info;
> +	int rc = 0;
> 
> -	/*TODO: Support two independent DSI connectors */
>  	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
>  	if (IS_ERR(encoder)) {
>  		DPU_ERROR("encoder init failed for dsi display\n");
> @@ -485,19 +484,74 @@ static int _dpu_kms_initialize_dsi(struct 
> drm_device *dev,
> 
>  	priv->encoders[priv->num_encoders++] = encoder;
> 
> -	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> -		if (!priv->dsi[i])
> -			continue;
> +	rc = msm_dsi_modeset_init(dsi, dev, encoder);
> +	if (rc) {
> +		DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
> +			  dsi_id, rc);
> +		return rc;
> +	}
> +
> +	memset(&info, 0, sizeof(info));
> +	info.intf_type = encoder->encoder_type;
> +	info.capabilities = msm_dsi_is_cmd_mode(dsi) ?
> +		MSM_DISPLAY_CAP_CMD_MODE :
> +		MSM_DISPLAY_CAP_VID_MODE;
> +	info.h_tile_instance[info.num_of_h_tiles++] = dsi_id;
> 
> -		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
> +	/* For the bonded DSI setup we have second DSI host */
> +	if (dsi_id1 >= 0) {
> +		struct msm_dsi *dsi1 = priv->dsi[dsi_id1];
> +
> +		rc = msm_dsi_modeset_init(dsi1, dev, encoder);
>  		if (rc) {
>  			DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
> -				i, rc);
> -			break;
> +				  dsi_id1, rc);
> +			return rc;
>  		}
> +
> +		info.h_tile_instance[info.num_of_h_tiles++] = dsi_id1;
>  	}
> 
> -	return rc;
> +	rc = dpu_encoder_setup(dev, encoder, &info);
> +	if (rc) {
> +		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> +			  encoder->base.id, rc);
> +		return rc;
> +	}
> +
> +	return 0;
> +}
> +
> +static int _dpu_kms_initialize_dsi(struct drm_device *dev,
> +				    struct msm_drm_private *priv,
> +				    struct dpu_kms *dpu_kms)
> +{
> +	int i, rc = 0;
> +
> +	if (!(priv->dsi[0] || priv->dsi[1]))
> +		return rc;
> +
> +	/*
> +	 * We support following confiurations:
> +	 * - Single DSI host (dsi0 or dsi1)
> +	 * - Two independent DSI hosts
> +	 * - Bonded DSI0 and DSI1 hosts
> +	 *
> +	 *   TODO: Support swapping DSI0 and DSI1 in the bonded setup.
> +	 */
> +	if (priv->dsi[0] && priv->dsi[1] && 
> msm_dsi_is_bonded_dsi(priv->dsi[0]))
> +		return _dpu_kms_initialize_dsi_encoder(dev, priv, dpu_kms, 0, 1);
> +
> +	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> +		if (!priv->dsi[i])
> +			continue;
> +
> +		rc = _dpu_kms_initialize_dsi_encoder(dev, priv, dpu_kms, i, -1);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	return 0;
>  }

Can we simplify this a bit like below?

static int _dpu_kms_initialize_dsi(struct drm_device *dev,
				    struct msm_drm_private *priv,
				    struct dpu_kms *dpu_kms)
{
	int i, rc = 0;

	if (!(priv->dsi[0] || priv->dsi[1]))
		return rc;

	/*
          * We support following confiurations:
	 * - Single DSI host (dsi0 or dsi1)
	 * - Two independent DSI hosts
	 * - Bonded DSI0 and DSI1 hosts
	 *
	 *   TODO: Support swapping DSI0 and DSI1 in the bonded setup.
          for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
		if (!priv->dsi[i])
			continue;

		rc = _dpu_kms_initialize_dsi(dev, priv, dpu_kms); // this API does 
everything except encoder setup
		if (rc)
			return rc;
                 if (!is_bonded_dsi)
                      _dpu_kms_initialize_dsi_encoder(...);
                 else if (dsi_0) // only one encoder setup for dsi_0
                     _dpu_kms_initialize_dsi_encoder(...);

	}
}

Let me know if you think this is a little less complicated.

> 
>  static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> @@ -505,6 +559,7 @@ static int _dpu_kms_initialize_displayport(struct
> drm_device *dev,
>  					    struct dpu_kms *dpu_kms)
>  {
>  	struct drm_encoder *encoder = NULL;
> +	struct msm_display_info info;
>  	int rc = 0;
> 
>  	if (!priv->dp)
> @@ -516,6 +571,7 @@ static int _dpu_kms_initialize_displayport(struct
> drm_device *dev,
>  		return PTR_ERR(encoder);
>  	}
> 
> +	memset(&info, 0, sizeof(info));
>  	rc = msm_dp_modeset_init(priv->dp, dev, encoder);
>  	if (rc) {
>  		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
> @@ -524,6 +580,14 @@ static int _dpu_kms_initialize_displayport(struct
> drm_device *dev,
>  	}
> 
>  	priv->encoders[priv->num_encoders++] = encoder;
> +
> +	info.num_of_h_tiles = 1;
> +	info.capabilities = MSM_DISPLAY_CAP_VID_MODE;
> +	info.intf_type = encoder->encoder_type;
> +	rc = dpu_encoder_setup(dev, encoder, &info);
> +	if (rc)
> +		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> +			  encoder->base.id, rc);
>  	return rc;
>  }
> 
> @@ -726,41 +790,6 @@ static void dpu_kms_destroy(struct msm_kms *kms)
>  	msm_kms_destroy(&dpu_kms->base);
>  }
> 
> -static void _dpu_kms_set_encoder_mode(struct msm_kms *kms,
> -				 struct drm_encoder *encoder,
> -				 bool cmd_mode)
> -{
> -	struct msm_display_info info;
> -	struct msm_drm_private *priv = encoder->dev->dev_private;
> -	int i, rc = 0;
> -
> -	memset(&info, 0, sizeof(info));
> -
> -	info.intf_type = encoder->encoder_type;
> -	info.capabilities = cmd_mode ? MSM_DISPLAY_CAP_CMD_MODE :
> -			MSM_DISPLAY_CAP_VID_MODE;
> -
> -	switch (info.intf_type) {
> -	case DRM_MODE_ENCODER_DSI:
> -		/* TODO: No support for DSI swap */
> -		for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
> -			if (priv->dsi[i]) {
> -				info.h_tile_instance[info.num_of_h_tiles] = i;
> -				info.num_of_h_tiles++;
> -			}
> -		}
> -		break;
> -	case DRM_MODE_ENCODER_TMDS:
> -		info.num_of_h_tiles = 1;
> -		break;
> -	}
> -
> -	rc = dpu_encoder_setup(encoder->dev, encoder, &info);
> -	if (rc)
> -		DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> -			encoder->base.id, rc);
> -}
> -
>  static irqreturn_t dpu_irq(struct msm_kms *kms)
>  {
>  	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> @@ -863,7 +892,6 @@ static const struct msm_kms_funcs kms_funcs = {
>  	.get_format      = dpu_get_msm_format,
>  	.round_pixclk    = dpu_kms_round_pixclk,
>  	.destroy         = dpu_kms_destroy,
> -	.set_encoder_mode = _dpu_kms_set_encoder_mode,
>  	.snapshot        = dpu_kms_mdp_snapshot,
>  #ifdef CONFIG_DEBUG_FS
>  	.debugfs_init    = dpu_kms_debugfs_init,
