Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E7D7820A5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 00:52:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45E310E05F;
	Sun, 20 Aug 2023 22:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B888310E05F
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Aug 2023 22:52:18 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5805FA2;
 Mon, 21 Aug 2023 00:51:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692571861;
 bh=a4e8VEKO1ZA5st0zk5K/VQkJiIOaA/nfBXzO6me1iPI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XEosBF2EgHsLU6QSEJT+Wxq/PI+Hq7bGsRI5Yfee2Olbe3ETxK8OCoK91AQcWg3qb
 38zkUJoGJkBpTde2F3K+VmRQY9wZa7DmbMEpP22fIoP1TuzBkUdULQiCDhuT0oVjnk
 Sr2Gjj8putVXuQSPSMtWDac1o4ar3Pp7hJgYswqQ=
Date: Mon, 21 Aug 2023 01:52:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v11 3/8] drm: Remove usage of deprecated DRM_INFO in DRM
 core
Message-ID: <20230820225223.GA10135@pendragon.ideasonboard.com>
References: <cover.1692531217.git.code@siddh.me>
 <434cb488766d6c8fb596acc0caea245fc9c115d3.1692531217.git.code@siddh.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <434cb488766d6c8fb596acc0caea245fc9c115d3.1692531217.git.code@siddh.me>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Siddh,

Thank you for the patch.

On Sun, Aug 20, 2023 at 05:10:39PM +0530, Siddh Raman Pant wrote:
> drm_print.h says DRM_INFO is deprecated in favor of drm_info().
> 
> Signed-off-by: Siddh Raman Pant <code@siddh.me>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_client_modeset.c | 2 +-
>  drivers/gpu/drm/drm_connector.c      | 7 ++++---
>  drivers/gpu/drm/drm_drv.c            | 2 +-
>  drivers/gpu/drm/drm_pci.c            | 2 +-
>  4 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_client_modeset.c b/drivers/gpu/drm/drm_client_modeset.c
> index 1b12a3c201a3..ae19734974b5 100644
> --- a/drivers/gpu/drm/drm_client_modeset.c
> +++ b/drivers/gpu/drm/drm_client_modeset.c
> @@ -331,7 +331,7 @@ static bool drm_client_target_cloned(struct drm_device *dev,
>  		DRM_DEBUG_KMS("can clone using 1024x768\n");
>  		return true;
>  	}
> -	DRM_INFO("kms: can't enable cloning when we probably wanted to.\n");
> +	drm_info(dev, "kms: can't enable cloning when we probably wanted to.\n");
>  	return false;
>  }
>  
> diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
> index bf8371dc2a61..1145d9e64c24 100644
> --- a/drivers/gpu/drm/drm_connector.c
> +++ b/drivers/gpu/drm/drm_connector.c
> @@ -168,13 +168,14 @@ static void drm_connector_get_cmdline_mode(struct drm_connector *connector)
>  		return;
>  
>  	if (mode->force) {
> -		DRM_INFO("forcing %s connector %s\n", connector->name,
> -			 drm_get_connector_force_name(mode->force));
> +		drm_info(connector->dev, "forcing %s connector %s\n",
> +			 connector->name, drm_get_connector_force_name(mode->force));
>  		connector->force = mode->force;
>  	}
>  
>  	if (mode->panel_orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN) {
> -		DRM_INFO("cmdline forces connector %s panel_orientation to %d\n",
> +		drm_info(connector->dev,
> +			 "cmdline forces connector %s panel_orientation to %d\n",
>  			 connector->name, mode->panel_orientation);
>  		drm_connector_set_panel_orientation(connector,
>  						    mode->panel_orientation);
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3eda026ffac6..d457f2053c05 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -943,7 +943,7 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
>  	if (drm_core_check_feature(dev, DRIVER_MODESET))
>  		drm_modeset_register_all(dev);
>  
> -	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
> +	drm_info(dev, "Initialized %s %d.%d.%d %s for %s on minor %d\n",
>  		 driver->name, driver->major, driver->minor,
>  		 driver->patchlevel, driver->date,
>  		 dev->dev ? dev_name(dev->dev) : "virtual device",
> diff --git a/drivers/gpu/drm/drm_pci.c b/drivers/gpu/drm/drm_pci.c
> index 39d35fc3a43b..7dfb837d1325 100644
> --- a/drivers/gpu/drm/drm_pci.c
> +++ b/drivers/gpu/drm/drm_pci.c
> @@ -262,7 +262,7 @@ void drm_legacy_pci_exit(const struct drm_driver *driver,
>  		}
>  		mutex_unlock(&legacy_dev_list_lock);
>  	}
> -	DRM_INFO("Module unloaded\n");
> +	drm_info(NULL, "Module unloaded\n");
>  }
>  EXPORT_SYMBOL(drm_legacy_pci_exit);
>  

-- 
Regards,

Laurent Pinchart
