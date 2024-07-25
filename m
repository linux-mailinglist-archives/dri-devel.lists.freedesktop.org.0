Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C7693BF23
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2024 11:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7C910E09D;
	Thu, 25 Jul 2024 09:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=manjaro.org header.i=@manjaro.org header.b="OEqmsNzu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25FCD10E09D
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2024 09:33:58 +0000 (UTC)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
 t=1721900036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftboGbAMunxAO4+cPMRch4E/ukDKcT8aii0ePtJNgZM=;
 b=OEqmsNzuwGqFduFXmrMacdbTUo+E6LIynswzDXCif4+33hqVHg3eB7zB7PznRuRWSOAlOL
 gn6ojfZuue2msva48byR7iF+GgPh3Og7go0k1YUZvShhZlmK0mT44kCD5Up61AK0D/ph7D
 FBO5zCg7O4M7SzaL5Uvb7FBKOHsCJ0XLhY/oYofBFhG49YXQPKA4qEXqpJ6zbLlzt7ssc8
 EvA13CE1/qyKoOC9j/rUribYJxM9Of9qC2b/XNnDDdXIdIKFri3mQ0ZnAnaKcMo/zW+SnP
 imsl4EkSdJnUhj19AWo5iwqMf2cEe4IdolUFKZwYIYuTC9JcWi9P7PXmgQrE/Q==
Date: Thu, 25 Jul 2024 11:33:55 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org
Cc: heiko@sntech.de, hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/rockchip: cdn-dp: Clean up a few logged messages
In-Reply-To: <92db74a313547c087cc71059428698c4ec37a9ae.1720048818.git.dsimic@manjaro.org>
References: <92db74a313547c087cc71059428698c4ec37a9ae.1720048818.git.dsimic@manjaro.org>
Message-ID: <62c163be6ba3eeb9af82672d41e93b78@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
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

Hello all,

Just checking, is this patch good enough to be accepted?  If not, is 
there
some other preferred way for cleaning up the produced messages?

On 2024-07-04 01:32, Dragan Simic wrote:
> Clean up a few logged messages, which were previously worded as rather
> incomplete sentences separated by periods.  This was both a bit 
> unreadable
> and grammatically incorrect, so convert them into partial sentences 
> separated
> (or connected) by semicolons, together with some wording improvements.
> 
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> ---
>  drivers/gpu/drm/rockchip/cdn-dp-core.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> index bd7aa891b839..ee9def197095 100644
> --- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
> +++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
> @@ -969,46 +969,44 @@ static void cdn_dp_pd_event_work(struct 
> work_struct *work)
> 
>  	/* Not connected, notify userspace to disable the block */
>  	if (!cdn_dp_connected_port(dp)) {
> -		DRM_DEV_INFO(dp->dev, "Not connected. Disabling cdn\n");
> +		DRM_DEV_INFO(dp->dev, "Not connected; disabling cdn\n");
>  		dp->connected = false;
> 
>  	/* Connected but not enabled, enable the block */
>  	} else if (!dp->active) {
> -		DRM_DEV_INFO(dp->dev, "Connected, not enabled. Enabling cdn\n");
> +		DRM_DEV_INFO(dp->dev, "Connected, not enabled; enabling cdn\n");
>  		ret = cdn_dp_enable(dp);
>  		if (ret) {
> -			DRM_DEV_ERROR(dp->dev, "Enable dp failed %d\n", ret);
> +			DRM_DEV_ERROR(dp->dev, "Enabling dp failed: %d\n", ret);
>  			dp->connected = false;
>  		}
> 
>  	/* Enabled and connected to a dongle without a sink, notify userspace 
> */
>  	} else if (!cdn_dp_check_sink_connection(dp)) {
> -		DRM_DEV_INFO(dp->dev, "Connected without sink. Assert hpd\n");
> +		DRM_DEV_INFO(dp->dev, "Connected without sink; assert hpd\n");
>  		dp->connected = false;
> 
>  	/* Enabled and connected with a sink, re-train if requested */
>  	} else if (!cdn_dp_check_link_status(dp)) {
>  		unsigned int rate = dp->max_rate;
>  		unsigned int lanes = dp->max_lanes;
>  		struct drm_display_mode *mode = &dp->mode;
> 
> -		DRM_DEV_INFO(dp->dev, "Connected with sink. Re-train link\n");
> +		DRM_DEV_INFO(dp->dev, "Connected with sink; re-train link\n");
>  		ret = cdn_dp_train_link(dp);
>  		if (ret) {
>  			dp->connected = false;
> -			DRM_DEV_ERROR(dp->dev, "Train link failed %d\n", ret);
> +			DRM_DEV_ERROR(dp->dev, "Training link failed: %d\n", ret);
>  			goto out;
>  		}
> 
>  		/* If training result is changed, update the video config */
>  		if (mode->clock &&
>  		    (rate != dp->max_rate || lanes != dp->max_lanes)) {
>  			ret = cdn_dp_config_video(dp);
>  			if (ret) {
>  				dp->connected = false;
> -				DRM_DEV_ERROR(dp->dev,
> -					      "Failed to config video %d\n",
> -					      ret);
> +				DRM_DEV_ERROR(dp->dev, "Failed to configure video: %d\n", ret);
>  			}
>  		}
>  	}
