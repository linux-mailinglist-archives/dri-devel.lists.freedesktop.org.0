Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40AE67BB710
	for <lists+dri-devel@lfdr.de>; Fri,  6 Oct 2023 13:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 889A210E1F3;
	Fri,  6 Oct 2023 11:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1764910E1F2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Oct 2023 11:58:59 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50433d8385cso2731693e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Oct 2023 04:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696593537; x=1697198337; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=z2YpB56g1ZO1fSiYdcPlJQvvw/UXo2TENQoVjkamjCU=;
 b=CUpb5twpux4gIGsBsVg2F5CJMVYDo+53c393pRobuKwBjDygfggo1jxEZ53HDdj49V
 GJuS+2teFoVTw6kmQ7Yk8XqWdx01bsI+Qne6op3k3PEgoKhFSueoBYN9riUHd8LVD9iy
 MiVQFzGoxS54Pal1sfAjn1ObJuWACKEJkpHIk0Cs6NmCL/isLE9w30/9NJEeACjy8nb+
 xZe7Ry5C56tP+59wdF5Yv2VSbdafvXAVfdG2rXZxFi3lZ+e2yaYpXg9i81T717ZQy5k5
 Xel/+JNJj87U7TzqGbyaSUsK4Ak80wgYhUKgqc5c9qk37hKyJMm2Xyt/FqJamDoz2ItY
 0Qyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696593537; x=1697198337;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=z2YpB56g1ZO1fSiYdcPlJQvvw/UXo2TENQoVjkamjCU=;
 b=QjGQXibEHPDyqed+6X9sLuvA5gUjjs2IeY6BH85JEmtFa4riSWeW5svYP1x8vm/97y
 Et/t0Xx+7KdAszr9oQ2wi4Ipjc5f78wGS/1F3IS4ubYqfofRnkFH/So31rq0Hl08W1/p
 EFbT1r2OWbjPOckkXRXTVaxdDremLbsBz5VWjnUYS7Oo+RhGdpJNponbWYu+by4VABNc
 djWok+EB5zz/oFJo7MX6zlRleNRu5cThdQRR36bBeT9xDqqrxp0I+SeuTHygetimhOmW
 ZzZoQ4C+idUQry8flE5gtJ3bHxf5hshnE9OZj1inE/FA4kWEmJwCYdrGbYsH4VEX/5b0
 CiBA==
X-Gm-Message-State: AOJu0YxC2ob8oKs1pLisI1cGntes6RZ0bTwpIw/YczWHLEriEri7HDC4
 3looGbi83CW+ICK8nciJXqDzNA==
X-Google-Smtp-Source: AGHT+IH84a71c5BUHDM1pKyIDMouzqtoIUSHA953dJgVF6Zwilo+8mTZnAaSlaCCnjxKHEIfmAhrJA==
X-Received: by 2002:a19:5e48:0:b0:500:91ac:c0b5 with SMTP id
 z8-20020a195e48000000b0050091acc0b5mr6202802lfi.30.1696593537025; 
 Fri, 06 Oct 2023 04:58:57 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a19ad09000000b00503fb2e5594sm275387lfc.211.2023.10.06.04.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Oct 2023 04:58:56 -0700 (PDT)
Message-ID: <520c3a22-4e16-4346-a20c-26adbc6bc0d6@linaro.org>
Date: Fri, 6 Oct 2023 14:58:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] drm/msm/dp: move of_dp_aux_populate_bus() to eDP
 probe()
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org,
 dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
 agross@kernel.org, andersson@kernel.org
References: <1696436821-14261-1-git-send-email-quic_khsieh@quicinc.com>
 <1696436821-14261-8-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1696436821-14261-8-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 marijn.suijten@somainline.org, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/10/2023 19:27, Kuogee Hsieh wrote:
> Currently eDP population is done at msm_dp_modeset_init() which happen
> at binding time. Move eDP population to be done at display probe time
> so that probe deferral cases can be handled effectively.
> wait_for_hpd_asserted callback is added during drm_dp_aux_init()
> to ensure eDP's HPD is up before proceeding eDP population.
> 
> Changes in v5:
> -- inline dp_display_auxbus_population() and delete it
> 
> Changes in v4:
> -- delete duplicate initialize code to dp_aux before drm_dp_aux_register()
> -- delete of_get_child_by_name(dev->of_node, "aux-bus") and inline the function
> -- not initialize rc = 0
> 
> Changes in v3:
> -- add done_probing callback into devm_of_dp_aux_populate_bus()
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>   drivers/gpu/drm/msm/dp/dp_aux.c     | 34 ++++++++++++++++-----
>   drivers/gpu/drm/msm/dp/dp_display.c | 59 +++++++++++++++----------------------
>   2 files changed, 51 insertions(+), 42 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
> index 10b6eeb..03f4951 100644
> --- a/drivers/gpu/drm/msm/dp/dp_aux.c
> +++ b/drivers/gpu/drm/msm/dp/dp_aux.c
> @@ -479,7 +479,6 @@ void dp_aux_deinit(struct drm_dp_aux *dp_aux)
>   
>   int dp_aux_register(struct drm_dp_aux *dp_aux)
>   {
> -	struct dp_aux_private *aux;
>   	int ret;
>   
>   	if (!dp_aux) {
> @@ -487,12 +486,7 @@ int dp_aux_register(struct drm_dp_aux *dp_aux)
>   		return -EINVAL;
>   	}
>   
> -	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> -
> -	aux->dp_aux.name = "dpu_dp_aux";
> -	aux->dp_aux.dev = aux->dev;
> -	aux->dp_aux.transfer = dp_aux_transfer;
> -	ret = drm_dp_aux_register(&aux->dp_aux);
> +	ret = drm_dp_aux_register(dp_aux);
>   	if (ret) {
>   		DRM_ERROR("%s: failed to register drm aux: %d\n", __func__,
>   				ret);
> @@ -507,6 +501,21 @@ void dp_aux_unregister(struct drm_dp_aux *dp_aux)
>   	drm_dp_aux_unregister(dp_aux);
>   }
>   
> +static int dp_wait_hpd_asserted(struct drm_dp_aux *dp_aux,
> +				 unsigned long wait_us)
> +{
> +	int ret;
> +	struct dp_aux_private *aux;
> +
> +	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
> +
> +	pm_runtime_get_sync(aux->dev);
> +	ret = dp_catalog_aux_wait_for_hpd_connect_state(aux->catalog);
> +	pm_runtime_put_sync(aux->dev);
> +
> +	return ret;
> +}
> +
>   struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
>   			      bool is_edp)
>   {
> @@ -530,6 +539,17 @@ struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog,
>   	aux->catalog = catalog;
>   	aux->retry_cnt = 0;
>   
> +	/*
> +	 * Use the drm_dp_aux_init() to use the aux adapter
> +	 * before registering AUX with the DRM device so that
> +	 * msm eDP panel can be detected by generic_dep_panel_probe().
> +	 */
> +	aux->dp_aux.name = "dpu_dp_aux";
> +	aux->dp_aux.dev = dev;
> +	aux->dp_aux.transfer = dp_aux_transfer;
> +	aux->dp_aux.wait_hpd_asserted = dp_wait_hpd_asserted;
> +	drm_dp_aux_init(&aux->dp_aux);
> +
>   	return &aux->dp_aux;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 79e56d9..df15145 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1207,6 +1207,17 @@ static const struct msm_dp_desc *dp_display_get_desc(struct platform_device *pde
>   	return NULL;
>   }
>   
> +static int dp_auxbus_done_probe(struct drm_dp_aux *aux)
> +{
> +	int rc;
> +
> +	rc = component_add(aux->dev, &dp_display_comp_ops);
> +	if (rc)
> +		DRM_ERROR("eDP component add failed, rc=%d\n", rc);
> +
> +	return rc;
> +}
> +
>   static int dp_display_probe(struct platform_device *pdev)
>   {
>   	int rc = 0;
> @@ -1272,10 +1283,18 @@ static int dp_display_probe(struct platform_device *pdev)
>   	if (rc)
>   		goto err;
>   
> -	rc = component_add(&pdev->dev, &dp_display_comp_ops);
> -	if (rc) {
> -		DRM_ERROR("component add failed, rc=%d\n", rc);
> -		goto err;
> +	if (dp->dp_display.is_edp) {
> +		rc = devm_of_dp_aux_populate_bus(dp->aux, dp_auxbus_done_probe);
> +		if (rc) {
> +			DRM_ERROR("eDP auxbus population failed, rc=%d\n", rc);
> +			goto err;
> +		}
> +	} else {
> +		rc = component_add(&pdev->dev, &dp_display_comp_ops);
> +		if (rc) {
> +			DRM_ERROR("component add failed, rc=%d\n", rc);
> +			goto err;
> +		}
>   	}
>   
>   	return rc;
> @@ -1291,7 +1310,6 @@ static int dp_display_remove(struct platform_device *pdev)
>   
>   	component_del(&pdev->dev, &dp_display_comp_ops);
>   	dp_display_deinit_sub_modules(dp);
> -

Nit: irrelevant to this patch.

>   	platform_set_drvdata(pdev, NULL);
>   
>   	return 0;
> @@ -1388,29 +1406,8 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>   {
>   	int rc;
>   	struct dp_display_private *dp_priv;
> -	struct device_node *aux_bus;
> -	struct device *dev;
>   
>   	dp_priv = container_of(dp, struct dp_display_private, dp_display);
> -	dev = &dp_priv->pdev->dev;
> -	aux_bus = of_get_child_by_name(dev->of_node, "aux-bus");
> -
> -	if (aux_bus && dp->is_edp) {
> -		/*
> -		 * The code below assumes that the panel will finish probing
> -		 * by the time devm_of_dp_aux_populate_ep_devices() returns.
> -		 * This isn't a great assumption since it will fail if the
> -		 * panel driver is probed asynchronously but is the best we
> -		 * can do without a bigger driver reorganization.
> -		 */
> -		rc = of_dp_aux_populate_bus(dp_priv->aux, NULL);
> -		of_node_put(aux_bus);
> -		if (rc)
> -			goto error;
> -	} else if (dp->is_edp) {
> -		DRM_ERROR("eDP aux_bus not found\n");
> -		return -ENODEV;
> -	}
>   
>   	/*
>   	 * External bridges are mandatory for eDP interfaces: one has to
> @@ -1423,17 +1420,9 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>   	if (!dp->is_edp && rc == -ENODEV)
>   		return 0;
>   
> -	if (!rc) {
> +	if (!rc)
>   		dp->next_bridge = dp_priv->parser->next_bridge;
> -		return 0;
> -	}
>   
> -error:
> -	if (dp->is_edp) {
> -		of_dp_aux_depopulate_bus(dp_priv->aux);
> -		dp_display_host_phy_exit(dp_priv);
> -		dp_display_host_deinit(dp_priv);
> -	}
>   	return rc;
>   }
>   

-- 
With best wishes
Dmitry

