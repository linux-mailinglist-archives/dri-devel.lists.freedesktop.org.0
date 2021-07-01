Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852FD3B97FE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 23:12:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFCC6EB72;
	Thu,  1 Jul 2021 21:12:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DA46EB4F
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 21:12:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625173953; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=H8ePaAPjm3Qye4c0a0COw/Ct7+Jugg9ITfv5eW+aqI4=;
 b=QVLcjP3k7gNCL82sRR4Z5967AOY3/yTNHS425FwrLUuVLRDqp88TNTtHU8oaab4JCRs2d5Vb
 Oc4wAoYfs8sLBIEbeeqw5rQOORJel61VHo9Dz5lMAAJWTtS4T2wqvvLRKwlnO/o8WHA4BtJm
 3Lv/xdXjuVSe9TOvVraTe0JHoBw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60de2fbe5d0d101e38578ee5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 01 Jul 2021 21:12:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C1F5BC4338A; Thu,  1 Jul 2021 21:12:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 33143C433D3;
 Thu,  1 Jul 2021 21:12:28 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 01 Jul 2021 14:12:28 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [RFC 2/6] drm/msm/dpu: support setting up two
 independent DSI connectors
In-Reply-To: <20210609211723.2565105-3-dmitry.baryshkov@linaro.org>
References: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
 <20210609211723.2565105-3-dmitry.baryshkov@linaro.org>
Message-ID: <73c474d067bd1f63e6d3457b01de4e2c@codeaurora.org>
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

On 2021-06-09 14:17, Dmitry Baryshkov wrote:
> Move setting up encoders from set_encoder_mode to
> _dpu_kms_initialize_dsi() / _dpu_kms_initialize_displayport(). This
> allows us to support not only "single DSI" and "dual DSI" but also "two
> independent DSI" configurations. In future this would also help adding
> support for multiple DP connectors.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
I will have to see Bjorn's changes to check why it was dependent on this 
cleanup.
Is the plan to call _dpu_kms_initialize_displayport() twice?
But still I am not able to put together where is the dependency on that 
series
with this one. Can you please elaborate on that a little bit?

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 89 ++++++++++++-------------
>  1 file changed, 44 insertions(+), 45 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 1d3a4f395e74..b63e1c948ff2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -471,30 +471,55 @@ static int _dpu_kms_initialize_dsi(struct 
> drm_device *dev,
>  				    struct dpu_kms *dpu_kms)
>  {
>  	struct drm_encoder *encoder = NULL;
> +	struct msm_display_info info;
>  	int i, rc = 0;
> 
>  	if (!(priv->dsi[0] || priv->dsi[1]))
>  		return rc;
> 
> -	/*TODO: Support two independent DSI connectors */
> -	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
> -	if (IS_ERR(encoder)) {
> -		DPU_ERROR("encoder init failed for dsi display\n");
> -		return PTR_ERR(encoder);
> -	}
> -
> -	priv->encoders[priv->num_encoders++] = encoder;
> -
>  	for (i = 0; i < ARRAY_SIZE(priv->dsi); i++) {
>  		if (!priv->dsi[i])
>  			continue;
> 
> +		if (!encoder) {
> +			encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DSI);
> +			if (IS_ERR(encoder)) {
> +				DPU_ERROR("encoder init failed for dsi display\n");
> +				return PTR_ERR(encoder);
> +			}
> +
> +			priv->encoders[priv->num_encoders++] = encoder;
> +
> +			memset(&info, 0, sizeof(info));
> +			info.intf_type = encoder->encoder_type;
> +			info.capabilities = msm_dsi_is_cmd_mode(priv->dsi[i]) ?
> +				MSM_DISPLAY_CAP_CMD_MODE :
> +				MSM_DISPLAY_CAP_VID_MODE;
> +		}
> +
>  		rc = msm_dsi_modeset_init(priv->dsi[i], dev, encoder);
>  		if (rc) {
>  			DPU_ERROR("modeset_init failed for dsi[%d], rc = %d\n",
>  				i, rc);
>  			break;
>  		}
> +
> +		info.h_tile_instance[info.num_of_h_tiles++] = i;
> +
> +		if (!msm_dsi_is_dual_dsi(priv->dsi[i])) {

I would like to clarify the terminology of dual_dsi in the current DSI 
driver before the rest of the reviews.
Today IS_DUAL_DSI() means that two DSIs are driving the same display and 
the two DSIs are operating in master-slave mode
and are being driven by the same PLL.
Usually, dual independent DSI means two DSIs driving two separate panels 
using two separate PLLs ( DSI0 with PLL0 and DSI1 with PLL1)
I assume thats happening due to the foll logic and both DSI PHYs are 
operating in STANDALONE mode:

     if (!IS_DUAL_DSI()) {
         ret = msm_dsi_host_register(msm_dsi->host, true);
         if (ret)
             return ret;

         msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
         ret = msm_dsi_host_set_src_pll(msm_dsi->host, msm_dsi->phy);

> +			rc = dpu_encoder_setup(dev, encoder, &info);
> +			if (rc)
> +				DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> +						encoder->base.id, rc);
> +			encoder = NULL;
> +		}
> +	}
> +
> +	if (encoder) {

We will hit this case only for split-DSI right? ( that is two DSIs 
driving the same panel ).
Even single DSI will be created in the above loop now. So this looks a 
bit confusing at the moment.

I think we need to be more clear on dual-DSI Vs split-DSI to avoid 
confusion in the code about which one means what and the one
which we are currently using. So what about having IS_DUAL_DSI() and 
IS_SPLIT_DSI() to distinguish the terminologies and chaging
DSI driver accordingly.

> +		rc = dpu_encoder_setup(dev, encoder, &info);
> +		if (rc)
> +			DPU_ERROR("failed to setup DPU encoder %d: rc:%d\n",
> +					encoder->base.id, rc);
>  	}
> 
>  	return rc;
> @@ -505,6 +530,7 @@ static int _dpu_kms_initialize_displayport(struct
> drm_device *dev,
>  					    struct dpu_kms *dpu_kms)
>  {
>  	struct drm_encoder *encoder = NULL;
> +	struct msm_display_info info;
>  	int rc = 0;
> 
>  	if (!priv->dp)
> @@ -516,6 +542,7 @@ static int _dpu_kms_initialize_displayport(struct
> drm_device *dev,
>  		return PTR_ERR(encoder);
>  	}
> 
> +	memset(&info, 0, sizeof(info));
>  	rc = msm_dp_modeset_init(priv->dp, dev, encoder);
>  	if (rc) {
>  		DPU_ERROR("modeset_init failed for DP, rc = %d\n", rc);
> @@ -524,6 +551,14 @@ static int _dpu_kms_initialize_displayport(struct
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
> +			encoder->base.id, rc);
>  	return rc;
>  }
> 
> @@ -726,41 +761,6 @@ static void dpu_kms_destroy(struct msm_kms *kms)
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
It seems we can get rid of set_encoder_mode for DP because the way we 
are using it today seems not right.
Ideally, the purpose was that once we read the EDID, the information we 
read like the tile group etc
can be used when we are setting up the encoder. But today, we are just 
hard-coding the number of tiles.
But I just think whether looking ahead, we should still have some 
callback which can be called after
EDID has been read instead of doing it in 
_dpu_kms_initialize_displayport. Perhaps that can be a separate patch.

>  static irqreturn_t dpu_irq(struct msm_kms *kms)
>  {
>  	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
> @@ -863,7 +863,6 @@ static const struct msm_kms_funcs kms_funcs = {
>  	.get_format      = dpu_get_msm_format,
>  	.round_pixclk    = dpu_kms_round_pixclk,
>  	.destroy         = dpu_kms_destroy,
> -	.set_encoder_mode = _dpu_kms_set_encoder_mode,
I would like to get Rob's comment on why we had set_encoder_mode in the 
first place. Its there even in mdp5.

in current msm dsi, the dsi bind will happen only after the panel has 
attached
and the msm_drv's bind will happen only after that since its the 
component master
in that case what was the need for set_encoder_mode  because we will 
know the panel's video/cmd mode in the dsi_bind call
am i missing something about why mdp5 had this?

 From the dpu perspective, since dsi_bind() happens only once panel has 
attached.
>  	.snapshot        = dpu_kms_mdp_snapshot,
>  #ifdef CONFIG_DEBUG_FS
>  	.debugfs_init    = dpu_kms_debugfs_init,
