Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 614496799C2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 14:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A2D710E234;
	Tue, 24 Jan 2023 13:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18C5310E0D0;
 Tue, 24 Jan 2023 13:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674567715; x=1706103715;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=id9BiI2WE7yN2TbgreHQ7n9PbufSJ8AzzKrzesL8QYs=;
 b=LWkYT/k4bvhK9ga+FWIpmsaffFgb+3X1vqIXi3471jE3V6/aFwjjFBfv
 s7+Ks46f/btzKJONOJcFxkKvjXedUL4ZkaFdS92UHZ2I3WyLl0d8G8sjX
 T8s2DRM1OmjfOgLLXWFLsHwazWdnn7OKfq1zHHexvq0+w+yDSUTjJPyrJ
 f3HxFWasRvsg4xlxojlj3PPG/ndc0K2BT8PTO2zgURafqrCqm9hrtZVwi
 otc1CG/TzBHQCQFWlCAVv1VzQCy4DQ0+bH4AeKvlgMVp8aV/N2E8epVoa
 +cEh3QndBRd9WUKrt5TPhmkhKQTVod2QwuyJpZaUHgL+d2lUFwZRHD1Fh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="388640002"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="388640002"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 05:41:53 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="612049061"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="612049061"
Received: from pesir-mobl.ger.corp.intel.com (HELO localhost) ([10.252.57.197])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 05:41:49 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v3 1/2] drm/probe_helper: extract two helper functions
In-Reply-To: <20230124104548.3234554-1-dmitry.baryshkov@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230124104548.3234554-1-dmitry.baryshkov@linaro.org>
Date: Tue, 24 Jan 2023 15:41:46 +0200
Message-ID: <87pmb46odh.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, intel-gfx@lists.freedesktop.org,
 Chen-Yu Tsai <wenst@chromium.org>, dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, freedreno@lists.freedesktop.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 24 Jan 2023, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> Extract drm_kms_helper_enable_hpd() and drm_kms_helper_disable_hpd(),
> two helpers that enable and disable HPD handling on all device's
> connectors.

Thanks for separating this, it makes the other patch easier to read.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/drm_probe_helper.c | 68 ++++++++++++++++++------------
>  1 file changed, 41 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
> index 95aeeed33cf5..ab787d71fa66 100644
> --- a/drivers/gpu/drm/drm_probe_helper.c
> +++ b/drivers/gpu/drm/drm_probe_helper.c
> @@ -222,6 +222,45 @@ drm_connector_mode_valid(struct drm_connector *connector,
>  	return ret;
>  }
>  
> +static void drm_kms_helper_disable_hpd(struct drm_device *dev)
> +{
> +	struct drm_connector *connector;
> +	struct drm_connector_list_iter conn_iter;
> +
> +	drm_connector_list_iter_begin(dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		const struct drm_connector_helper_funcs *funcs =
> +			connector->helper_private;
> +
> +		if (funcs && funcs->disable_hpd)
> +			funcs->disable_hpd(connector);
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +}
> +
> +static bool drm_kms_helper_enable_hpd(struct drm_device *dev)
> +{
> +	bool poll = false;
> +	struct drm_connector *connector;
> +	struct drm_connector_list_iter conn_iter;
> +
> +	drm_connector_list_iter_begin(dev, &conn_iter);
> +	drm_for_each_connector_iter(connector, &conn_iter) {
> +		const struct drm_connector_helper_funcs *funcs =
> +			connector->helper_private;
> +
> +		if (funcs && funcs->enable_hpd)
> +			funcs->enable_hpd(connector);
> +
> +		if (connector->polled & (DRM_CONNECTOR_POLL_CONNECT |
> +					 DRM_CONNECTOR_POLL_DISCONNECT))
> +			poll = true;
> +	}
> +	drm_connector_list_iter_end(&conn_iter);
> +
> +	return poll;
> +}
> +
>  #define DRM_OUTPUT_POLL_PERIOD (10*HZ)
>  /**
>   * drm_kms_helper_poll_enable - re-enable output polling.
> @@ -241,26 +280,12 @@ drm_connector_mode_valid(struct drm_connector *connector,
>  void drm_kms_helper_poll_enable(struct drm_device *dev)
>  {
>  	bool poll = false;
> -	struct drm_connector *connector;
> -	struct drm_connector_list_iter conn_iter;
>  	unsigned long delay = DRM_OUTPUT_POLL_PERIOD;
>  
>  	if (!dev->mode_config.poll_enabled || !drm_kms_helper_poll)
>  		return;
>  
> -	drm_connector_list_iter_begin(dev, &conn_iter);
> -	drm_for_each_connector_iter(connector, &conn_iter) {
> -		const struct drm_connector_helper_funcs *funcs =
> -			connector->helper_private;
> -
> -		if (funcs && funcs->enable_hpd)
> -			funcs->enable_hpd(connector);
> -
> -		if (connector->polled & (DRM_CONNECTOR_POLL_CONNECT |
> -					 DRM_CONNECTOR_POLL_DISCONNECT))
> -			poll = true;
> -	}
> -	drm_connector_list_iter_end(&conn_iter);
> +	poll = drm_kms_helper_enable_hpd(dev);
>  
>  	if (dev->mode_config.delayed_event) {
>  		/*
> @@ -810,24 +835,13 @@ EXPORT_SYMBOL(drm_kms_helper_is_poll_worker);
>  
>  static void drm_kms_helper_poll_disable_fini(struct drm_device *dev, bool fini)
>  {
> -	struct drm_connector *connector;
> -	struct drm_connector_list_iter conn_iter;
> -
>  	if (!dev->mode_config.poll_enabled)
>  		return;
>  
>  	if (fini)
>  		dev->mode_config.poll_enabled = false;
>  
> -	drm_connector_list_iter_begin(dev, &conn_iter);
> -	drm_for_each_connector_iter(connector, &conn_iter) {
> -		const struct drm_connector_helper_funcs *funcs =
> -			connector->helper_private;
> -
> -		if (funcs && funcs->disable_hpd)
> -			funcs->disable_hpd(connector);
> -	}
> -	drm_connector_list_iter_end(&conn_iter);
> +	drm_kms_helper_disable_hpd(dev);
>  
>  	cancel_delayed_work_sync(&dev->mode_config.output_poll_work);
>  }

-- 
Jani Nikula, Intel Open Source Graphics Center
