Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD96442316A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 22:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AACC16EC30;
	Tue,  5 Oct 2021 20:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5096B6EC30
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 20:13:35 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633464817; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=YLC/Q/jdvQ6/AOXqkmsIgNmFnLhtq0kwWRcsTJ1mOpY=;
 b=Gs7XBewCWbiUnLtrmJmJsiVvC7USyR8Ti/S31dDfI9Oq+PQR52VCnBrhomfV18EH+sni8/64
 iS3Z2QOUbc6Uu3lLdHDmVu85uFXS8TUgWcWxgGMePLBcyEJMrdmLxEdymLIl1siMVuYQ6T7L
 XsiNOCGrwAzYqQ4VVKt0Fkajezo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 615cb1d59ebaf35aaae96030 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 20:13:09
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 22A7FC43460; Tue,  5 Oct 2021 20:13:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 907DEC4338F;
 Tue,  5 Oct 2021 20:13:08 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 05 Oct 2021 13:13:08 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [Freedreno] [PATCH v3 2/5] drm/msm/dp: Modify prototype of
 encoder based API
In-Reply-To: <20211001180058.1021913-3-bjorn.andersson@linaro.org>
References: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
 <20211001180058.1021913-3-bjorn.andersson@linaro.org>
Message-ID: <1b86ea5b536d11335ec457fb729886ce@codeaurora.org>
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
> Functions in the DisplayPort code that relates to individual instances
> (encoders) are passed both the struct msm_dp and the struct 
> drm_encoder. But
> in a situation where multiple DP instances would exist this means that
> the caller need to resolve which struct msm_dp relates to the struct
> drm_encoder at hand.
> 
> Store a reference to the struct msm_dp associated with each
> dpu_encoder_virt to allow the particular instance to be associate with
> the encoder in the following patch.
> 
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
> 
> Changes since v2:
> - None
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 23 ++++++++++++---------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 0e9d3fa1544b..b7f33da2799c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -168,6 +168,7 @@ enum dpu_enc_rc_states {
>   * @vsync_event_work:		worker to handle vsync event for autorefresh
>   * @topology:                   topology of the display
>   * @idle_timeout:		idle timeout duration in milliseconds
> + * @dp:				msm_dp pointer, for DP encoders
>   */
>  struct dpu_encoder_virt {
>  	struct drm_encoder base;
> @@ -206,6 +207,8 @@ struct dpu_encoder_virt {
>  	struct msm_display_topology topology;
> 
>  	u32 idle_timeout;
> +
> +	struct msm_dp *dp;
>  };
> 
>  #define to_dpu_encoder_virt(x) container_of(x, struct 
> dpu_encoder_virt, base)
> @@ -1000,8 +1003,8 @@ static void dpu_encoder_virt_mode_set(struct
> drm_encoder *drm_enc,
> 
>  	trace_dpu_enc_mode_set(DRMID(drm_enc));
> 
> -	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp)
> -		msm_dp_display_mode_set(priv->dp, drm_enc, mode, adj_mode);
> +	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS)
> +		msm_dp_display_mode_set(dpu_enc->dp, drm_enc, mode, adj_mode);
> 
>  	list_for_each_entry(conn_iter, connector_list, head)
>  		if (conn_iter->encoder == drm_enc)
> @@ -1182,9 +1185,8 @@ static void dpu_encoder_virt_enable(struct
> drm_encoder *drm_enc)
> 
>  	_dpu_encoder_virt_enable_helper(drm_enc);
> 
> -	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
> -		ret = msm_dp_display_enable(priv->dp,
> -						drm_enc);
> +	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
> +		ret = msm_dp_display_enable(dpu_enc->dp, drm_enc);
>  		if (ret) {
>  			DPU_ERROR_ENC(dpu_enc, "dp display enable failed: %d\n",
>  				ret);
> @@ -1224,8 +1226,8 @@ static void dpu_encoder_virt_disable(struct
> drm_encoder *drm_enc)
>  	/* wait for idle */
>  	dpu_encoder_wait_for_event(drm_enc, MSM_ENC_TX_COMPLETE);
> 
> -	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
> -		if (msm_dp_display_pre_disable(priv->dp, drm_enc))
> +	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
> +		if (msm_dp_display_pre_disable(dpu_enc->dp, drm_enc))
>  			DPU_ERROR_ENC(dpu_enc, "dp display push idle failed\n");
>  	}
> 
> @@ -1253,8 +1255,8 @@ static void dpu_encoder_virt_disable(struct
> drm_encoder *drm_enc)
> 
>  	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
> 
> -	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
> -		if (msm_dp_display_disable(priv->dp, drm_enc))
> +	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
> +		if (msm_dp_display_disable(dpu_enc->dp, drm_enc))
>  			DPU_ERROR_ENC(dpu_enc, "dp display disable failed\n");
>  	}
> 
> @@ -2170,7 +2172,8 @@ int dpu_encoder_setup(struct drm_device *dev,
> struct drm_encoder *enc,
>  		timer_setup(&dpu_enc->vsync_event_timer,
>  				dpu_encoder_vsync_event_handler,
>  				0);
> -
> +	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
> +		dpu_enc->dp = priv->dp;
> 
>  	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
>  			dpu_encoder_off_work);
