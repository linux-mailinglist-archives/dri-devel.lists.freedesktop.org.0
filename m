Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 197DA950BD7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6839A10E3C9;
	Tue, 13 Aug 2024 17:59:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="GsAJlN+v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD6010E3BB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:59:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0F2BCE0005;
 Tue, 13 Aug 2024 17:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723571946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+HeVjGkIRk7pCO8G/J2z1a9QBKQyBR6gTxTLCR+gvXs=;
 b=GsAJlN+vp0Yylx+n2P1tXJbsNCQwtx8dALImuibtnEmQ6vz9gbCrmH8Cx9QM4lhX1SUAuk
 UnxfALb+wiAKCl5zuhjCEEGfI6UPDynYfjLWf3vp/3x2MDv9xDe1Me59orox8YCVul/y8i
 yjF9kqnHFdfz1efY6O++sgZ6R0SsIbzlpdJaPTl2DVXle7oHCoRpw0TdwdK4Gqu9F2t7Op
 wPKSY25UeTWWqgFWcVz5lToavnURxAIg0XMsVsSxgu1lF/H0/AHveXPj+Lt0LvM/GcVnmk
 SO6qQHr0X7J1Hw0V5/K+yO1zaxumn9qloO09jHS6IXSeGkSTCAG3c9Cmg4/lYw==
Date: Tue, 13 Aug 2024 19:58:58 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 10/17] drm/vkms: Allow to change connector status
Message-ID: <Zrue4jb9ikn-_n-j@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
 <20240813105134.17439-11-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240813105134.17439-11-jose.exposito89@gmail.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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

Le 13/08/24 - 12:44, José Expósito a écrit :
> Store the connector status in vkms_config_connector and use the stored
> value to update the connector status in the drm_connector_funcs.detect()
> function.

I did not work on this part, so my comments may be not relevant.
 
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_config.c | 18 ++++++++++++++++--
>  drivers/gpu/drm/vkms/vkms_config.h | 12 +++++++++++-
>  drivers/gpu/drm/vkms/vkms_output.c | 20 ++++++++++++++++++++
>  3 files changed, 47 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index d95a42a6745a..e8e5c02c9d43 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -3,6 +3,7 @@
>  #include <linux/slab.h>
>  
>  #include <drm/drm_print.h>
> +#include <drm/drm_probe_helper.h>
>  #include <drm/drm_debugfs.h>
>  
>  #include "vkms_config.h"
> @@ -56,7 +57,7 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>  	if (IS_ERR(encoder_cfg))
>  		return ERR_CAST(encoder_cfg);
>  
> -	connector_cfg = vkms_config_add_connector(config, BIT(0));
> +	connector_cfg = vkms_config_add_connector(config, BIT(0), connector_status_connected);
>  	if (IS_ERR(connector_cfg))
>  		return ERR_CAST(connector_cfg);
>  
> @@ -124,6 +125,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
>  	list_for_each_entry(connector_cfg, &vkmsdev->config->connectors, list) {
>  		seq_printf(m, "connector(%d).possible_encoders=%d\n", n,
>  			   connector_cfg->possible_encoders);
> +		seq_printf(m, "connector(%d).status=%d\n", n,
> +			   connector_cfg->status);
>  		n++;
>  	}
>  
> @@ -229,7 +232,8 @@ void vkms_config_destroy_encoder(struct vkms_config *config,
>  }
>  
>  struct vkms_config_connector *vkms_config_add_connector(struct vkms_config *config,
> -							uint32_t possible_encoders)
> +							uint32_t possible_encoders,
> +							enum drm_connector_status status)
>  {
>  	struct vkms_config_connector *connector_cfg;
>  
> @@ -238,6 +242,7 @@ struct vkms_config_connector *vkms_config_add_connector(struct vkms_config *conf
>  		return ERR_PTR(-ENOMEM);
>  
>  	connector_cfg->possible_encoders = possible_encoders;
> +	connector_cfg->status = status;
>  	list_add_tail(&connector_cfg->list, &config->connectors);
>  
>  	return connector_cfg;
> @@ -249,3 +254,12 @@ void vkms_config_destroy_connector(struct vkms_config *config,
>  	list_del(&connector_cfg->list);
>  	kfree(connector_cfg);
>  }
> +
> +void vkms_update_connector_status(struct vkms_config *config,
> +				  struct vkms_config_connector *connector_cfg,
> +				  enum drm_connector_status status)
> +{
> +	connector_cfg->status = status;
> +	if (config->dev)
> +		drm_kms_helper_hotplug_event(&config->dev->drm);
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 25dab63e7ae7..3237406fa3a3 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -6,6 +6,8 @@
>  #include <linux/list.h>
>  #include <linux/types.h>
>  
> +#include <drm/drm_connector.h>
> +
>  struct vkms_device;
>  
>  struct vkms_config_plane {
> @@ -29,6 +31,9 @@ struct vkms_config_encoder {
>  struct vkms_config_connector {
>  	struct list_head list;
>  	uint32_t possible_encoders;
> +	enum drm_connector_status status;
> +	/* only set when instantiated */
> +	struct drm_connector *connector;

It seems very strange to have a "dynamic" field (status) in a 
configuration structure.

>  };
>  
>  struct vkms_config {
> @@ -72,8 +77,13 @@ void vkms_config_destroy_encoder(struct vkms_config *config,
>  
>  /* Connectors */
>  struct vkms_config_connector *vkms_config_add_connector(struct vkms_config *config,
> -							uint32_t possible_encoders);
> +							uint32_t possible_encoders,
> +							enum drm_connector_status status);
>  void vkms_config_destroy_connector(struct vkms_config *config,
>  				   struct vkms_config_connector *connector_cfg);
>  
> +void vkms_update_connector_status(struct vkms_config *config,
> +				  struct vkms_config_connector *connector_cfg,
> +				  enum drm_connector_status status);
> +
>  #endif /* _VKMS_CONFIG_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index a5b1ab326cdd..511cc2c14c44 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -7,7 +7,25 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
>  
> +static enum drm_connector_status vkms_connector_detect(struct drm_connector *connector,
> +						       bool force)
> +{
> +	struct vkms_device *vkmsdev = drm_device_to_vkms_device(connector->dev);
> +	enum drm_connector_status status = connector->status;
> +	struct vkms_config_connector *connector_cfg;
> +
> +	list_for_each_entry(connector_cfg, &vkmsdev->config->connectors, list) {
> +		if (connector_cfg->connector == connector) {
> +			status = connector_cfg->status;
> +			break;
> +		}
> +	}

To avoid this, maybe we can create a vkms_connector:

	struct vkms_connector {
		int status;
		struct drm_connector base;
	};

and use container_of?

> +
> +	return status;
> +}
> +
>  static const struct drm_connector_funcs vkms_connector_funcs = {
> +	.detect = vkms_connector_detect,
>  	.fill_modes = drm_helper_probe_single_connector_modes,
>  	.reset = drm_atomic_helper_connector_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> @@ -155,6 +173,8 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  		connector = vkms_connector_init(vkmsdev, connector_cfg->possible_encoders);
>  		if (IS_ERR(connector))
>  			return PTR_ERR(connector);
> +
> +		connector_cfg->connector = connector;
>  	}
>  
>  	drm_mode_config_reset(dev);
> -- 
> 2.46.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
