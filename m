Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71ED13DC19E
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 01:37:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C48A6E479;
	Fri, 30 Jul 2021 23:37:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1D386E34B
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jul 2021 23:37:45 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1627688266; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=4rmJMgcNP8dz11ZGS+KLyMRiboqVKCtFl+kC5KAnbF4=;
 b=eiK70Y/lzcHnRTxpAIA107oBpYt9AAYF0cOD+WITEg/czAl02VTqnyFfGvSwzf/YEUlxm1bq
 FshfyF6ae8E1Sy3MbdU8IhBkivzunTrmWiSVWGJ3aY4Y32fMl6aoa1PONXfpQH2+OUS4Thk5
 rBZgX5zFdkDSf5ABHolz+d4B4Dk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 61048d49b653fbdadd16cd49 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Jul 2021 23:37:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3F2B5C433F1; Fri, 30 Jul 2021 23:37:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 29742C4338A;
 Fri, 30 Jul 2021 23:37:42 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 30 Jul 2021 16:37:42 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Stephen Boyd
 <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 1/5] drm/msm/dp: Remove global g_dp_display
 variable
In-Reply-To: <20210725042436.3967173-2-bjorn.andersson@linaro.org>
References: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
 <20210725042436.3967173-2-bjorn.andersson@linaro.org>
Message-ID: <51b482e276c6fedc91d70797aca35da6@codeaurora.org>
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

On 2021-07-24 21:24, Bjorn Andersson wrote:
> As the Qualcomm DisplayPort driver only supports a single instance of
> the driver the commonly used struct dp_display is kept in a global
> variable. As we introduce additional instances this obviously doesn't
> work.
> 
> Replace this with a combination of existing references to adjacent
> objects and drvdata.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 78 ++++++++++++++---------------
>  1 file changed, 37 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index 70b319a8fe83..8696b36d30e4 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -27,7 +27,6 @@
>  #include "dp_audio.h"
>  #include "dp_debug.h"
> 
> -static struct msm_dp *g_dp_display;
>  #define HPD_STRING_SIZE 30
> 
>  enum {
> @@ -122,6 +121,13 @@ static const struct of_device_id dp_dt_match[] = {
>  	{}
>  };
> 
> +static struct dp_display_private *dev_to_dp_display_private(struct 
> device *dev)
> +{
> +	struct msm_dp *dp = dev_get_drvdata(dev);
> +
> +	return container_of(dp, struct dp_display_private, dp_display);
> +}
> +
>  static int dp_add_event(struct dp_display_private *dp_priv, u32 event,
>  						u32 data, u32 delay)
>  {
> @@ -198,14 +204,16 @@ static int dp_display_bind(struct device *dev,
> struct device *master,
>  			   void *data)
>  {
>  	int rc = 0;
> -	struct dp_display_private *dp;
> +	struct dp_display_private *dp = dev_to_dp_display_private(dev);
>  	struct drm_device *drm;
>  	struct msm_drm_private *priv;
> 
>  	drm = dev_get_drvdata(master);
> 
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> +	if (!dp) {
> +		DRM_ERROR("DP driver bind failed. Invalid driver data\n");
> +		return -EINVAL;
> +	}
> 
>  	dp->dp_display.drm_dev = drm;
>  	priv = drm->dev_private;
> @@ -240,12 +248,14 @@ static int dp_display_bind(struct device *dev,
> struct device *master,
>  static void dp_display_unbind(struct device *dev, struct device 
> *master,
>  			      void *data)
>  {
> -	struct dp_display_private *dp;
> +	struct dp_display_private *dp = dev_to_dp_display_private(dev);
>  	struct drm_device *drm = dev_get_drvdata(master);
>  	struct msm_drm_private *priv = drm->dev_private;
> 
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> +	if (!dp) {
> +		DRM_ERROR("Invalid DP driver data\n");
> +		return;
> +	}
> 
>  	dp_power_client_deinit(dp->power);
>  	dp_aux_unregister(dp->aux);
> @@ -376,17 +386,14 @@ static void dp_display_host_deinit(struct
> dp_display_private *dp)
>  static int dp_display_usbpd_configure_cb(struct device *dev)
>  {
>  	int rc = 0;
> -	struct dp_display_private *dp;
> +	struct dp_display_private *dp = dev_to_dp_display_private(dev);
> 
> -	if (!dev) {
> -		DRM_ERROR("invalid dev\n");
> -		rc = -EINVAL;
> +	if (!dp) {
> +		DRM_ERROR("no driver data found\n");
> +		rc = -ENODEV;
>  		goto end;
>  	}
> 
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> -
>  	dp_display_host_init(dp, false);
> 
>  	rc = dp_display_process_hpd_high(dp);
> @@ -397,17 +404,14 @@ static int dp_display_usbpd_configure_cb(struct
> device *dev)
>  static int dp_display_usbpd_disconnect_cb(struct device *dev)
>  {
>  	int rc = 0;
> -	struct dp_display_private *dp;
> +	struct dp_display_private *dp = dev_to_dp_display_private(dev);
> 
> -	if (!dev) {
> -		DRM_ERROR("invalid dev\n");
> -		rc = -EINVAL;
> +	if (!dp) {
> +		DRM_ERROR("no driver data found\n");
> +		rc = -ENODEV;
>  		return rc;
>  	}
> 
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> -
>  	dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
> 
>  	return rc;
> @@ -466,15 +470,15 @@ static int dp_display_usbpd_attention_cb(struct
> device *dev)
>  {
>  	int rc = 0;
>  	u32 sink_request;
> -	struct dp_display_private *dp;
> +	struct dp_display_private *dp = dev_to_dp_display_private(dev);
> +	struct dp_usbpd *hpd;
> 
> -	if (!dev) {
> -		DRM_ERROR("invalid dev\n");
> -		return -EINVAL;
> +	if (!dp) {
> +		DRM_ERROR("no driver data found\n");
> +		return -ENODEV;
>  	}
> 
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> +	hpd = dp->usbpd;
hpd is unused here. It was removed with 
https://patches.linaro.org/patch/416670/

> 
>  	/* check for any test request issued by sink */
>  	rc = dp_link_process_request(dp->link);
> @@ -638,7 +642,7 @@ static int dp_hpd_unplug_handle(struct
> dp_display_private *dp, u32 data)
>  	dp_add_event(dp, EV_DISCONNECT_PENDING_TIMEOUT, 0, 
> DP_TIMEOUT_5_SECOND);
> 
>  	/* signal the disconnect event early to ensure proper teardown */
> -	dp_display_handle_plugged_change(g_dp_display, false);
> +	dp_display_handle_plugged_change(&dp->dp_display, false);
> 
>  	/* enable HDP plug interrupt to prepare for next plugin */
>  	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, 
> true);
> @@ -832,9 +836,7 @@ static int dp_display_prepare(struct msm_dp *dp)
>  static int dp_display_enable(struct dp_display_private *dp, u32 data)
>  {
>  	int rc = 0;
> -	struct msm_dp *dp_display;
> -
> -	dp_display = g_dp_display;
> +	struct msm_dp *dp_display = &dp->dp_display;
> 
>  	if (dp_display->power_on) {
>  		DRM_DEBUG_DP("Link already setup, return\n");
> @@ -869,9 +871,7 @@ static int dp_display_post_enable(struct msm_dp 
> *dp_display)
> 
>  static int dp_display_disable(struct dp_display_private *dp, u32 data)
>  {
> -	struct msm_dp *dp_display;
> -
> -	dp_display = g_dp_display;
> +	struct msm_dp *dp_display = &dp->dp_display;
> 
>  	if (!dp_display->power_on)
>  		return 0;
> @@ -1229,14 +1229,13 @@ static int dp_display_probe(struct
> platform_device *pdev)
>  	}
> 
>  	mutex_init(&dp->event_mutex);
> -	g_dp_display = &dp->dp_display;
> 
>  	/* Store DP audio handle inside DP display */
> -	g_dp_display->dp_audio = dp->audio;
> +	dp->dp_display.dp_audio = dp->audio;
> 
>  	init_completion(&dp->audio_comp);
> 
> -	platform_set_drvdata(pdev, g_dp_display);
> +	platform_set_drvdata(pdev, &dp->dp_display);
> 
>  	rc = component_add(&pdev->dev, &dp_display_comp_ops);
>  	if (rc) {
> @@ -1249,10 +1248,7 @@ static int dp_display_probe(struct 
> platform_device *pdev)
> 
>  static int dp_display_remove(struct platform_device *pdev)
>  {
> -	struct dp_display_private *dp;
> -
> -	dp = container_of(g_dp_display,
> -			struct dp_display_private, dp_display);
> +	struct dp_display_private *dp = platform_get_drvdata(pdev);
> 
>  	dp_display_deinit_sub_modules(dp);
