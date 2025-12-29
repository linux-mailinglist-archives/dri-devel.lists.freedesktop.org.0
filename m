Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4252FCE7B50
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 18:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5845310E5A1;
	Mon, 29 Dec 2025 17:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gwNa/aA+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5CD710E5A1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 17:09:39 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-477632b0621so57641495e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 09:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767028178; x=1767632978; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6O6+tk5h/BOteODO+69MaKipjConnQRO/Y3Z/JkS2Zw=;
 b=gwNa/aA+0nmmhs2nLup9Ovt/5F7WUv9PeomgSVrBdmAqy5AbOAeyRKDeX2gXxmb9Ho
 bQl7dbck62k7mdclAF/Sd4+Wh/Lmaxd/inmo2opXoRLzoQkS0NcXD/sDzQWrbYuPKQb5
 TRYiMVEq5J91TdpB31OPYNv71nwc427ZwLlr6GGQu1kjtnKBNvRsYkfvquIEMTasQafW
 ExLea2XvbpK06LEKQ7UvZWJW7LiyvIKXA+RBwQPmdUSQhNxOL2UBR2bmVgL7dBM1dPjN
 VgtpC3dF15bL8GmZpBTXhjIH08mU04WEfiCbYEOQVPpnEewZZd7y/KbBSKVuSEDmR+ok
 P/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767028178; x=1767632978;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6O6+tk5h/BOteODO+69MaKipjConnQRO/Y3Z/JkS2Zw=;
 b=xJ3hYnYxRpwDMSdTPP80yyI5k7d/ITLG9UP/WCTi+lqsXb8GazxyBvtOLBI/SVd7/S
 ggSwEm6IZtks7qhYS5ReYEKee+3YzZKFREQp8IFUlb3sHlk/TXjpL3hNNqXTChPhuxXx
 4ejjB9VhTNjbjSMpyCYrLUgWj1G5wNqFfaXLZhI88uqzvtdF7Cs0QYLHzyQvVIf7jp26
 7oUBk9oLe6fivMCx+Uu9ggoquBQIK2iDbXIxcUlAugYBVYl5br81C7iemmDP83WCVZft
 Sb6djz3t//YlXExXII7RjiqtlA4yAc5d/km//kEw5DBGA+rV9ikDK32HVx7YunOvueVR
 VI8Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ8PTzNmkx6Yzn76rL4m51gjPK03Q+UnnHaeScVkygXIuhuuWV8i6i9pBAj4oGhoe0Vr+S3BNgEYg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVaMaHpuJ7pa2z4mom34xDb1ezWBLcna3i3L7RE62zs/mlFz7I
 2s8inxYp9j5vKR7DF1WXRGDKvtNyD7VZ0GV1ApwXCp0yTd6Ds1i80Ezq
X-Gm-Gg: AY/fxX6xECa/6WIAi4x7s8hfORHlLwbIPenuXwSL+d04nzTmU7VKiygWCwAe8NT5xHV
 XZ0B++gLlfBAHtzXt/qHGooeUPb9Mm5d6tCGkZri44GoaE75hlhUsMTFGuFpjYqBPQDfOMN7KSn
 LH1zHieUmkJfpxoA3xNZyOp50KC1Lkqizcq1a24fl7S9advgOmJE3SdZhNEq0mYzJg61FFKHZ2c
 87dQp2sshz3zyAuaG7PsV1tb/Z609WZ3nSlQ/RoULY2mk+Mc/eP26Dg3w7e7zR/2HAxkMYyMALR
 1KbWpd/uiuqq9hCeR/BA7iTEp2b2l4x7zTkPeNCagDYVzZprQBVM94beLyHViL1WG7l1GcR7qM1
 CP4eeaosTYoXHYcVtoO9rZ21uLKkMKd2y/92SMGfFdOEGHedpnejGCh33VvL3GkYX3nFziFfQ+V
 r1hBAtu2BX2jWoGHKtjAvL
X-Google-Smtp-Source: AGHT+IGBKFcaFsNGe1AsIBsQYOzgDRS5osMCiE0B5NHZqdGkmGV0E+4GLX8TxkrEWyGhl5Lz4KJpsQ==
X-Received: by 2002:a05:6000:178e:b0:430:b100:f594 with SMTP id
 ffacd0b85a97d-4324e50d9bcmr37799197f8f.50.1767028177789; 
 Mon, 29 Dec 2025 09:09:37 -0800 (PST)
Received: from fedora ([94.73.37.171]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea227e0sm65088089f8f.17.2025.12.29.09.09.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 09:09:37 -0800 (PST)
Date: Mon, 29 Dec 2025 18:09:35 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 victoria@system76.com, sebastian.wick@redhat.com,
 thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 32/33] drm/vkms: Allow to hot-add connectors
Message-ID: <aVK1z_WUUQ-5frII@fedora>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-32-ba42dc3fb9ff@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251222-vkms-all-config-v3-32-ba42dc3fb9ff@bootlin.com>
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

On Mon, Dec 22, 2025 at 11:11:34AM +0100, Louis Chauvet wrote:
> In order to allow creating dynamic connector, add the required
> infrastructure in vkms_connector.
> 
> [Louis Chauvet: use drm_atomic_helper_connector_reset instead of
> drm_mode_config_reset because connector is not yet registered]
> 
> Co-developed-by: José Expósito <jose.exposito89@gmail.com>
> Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_connector.c | 81 +++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_connector.h | 33 ++++++++++++++
>  drivers/gpu/drm/vkms/vkms_output.c    |  9 ++++
>  3 files changed, 123 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index 3ad614642355..616036494937 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -163,9 +163,90 @@ struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
>  	return connector;
>  }
>  
> +static void vkms_connector_dynamic_destroy(struct drm_connector *connector)
> +{
> +	struct drm_device *dev = connector->dev;
> +	struct vkms_connector *vkms_connector;
> +
> +	drm_connector_cleanup(connector);
> +
> +	vkms_connector = drm_connector_to_vkms_connector(connector);
> +	drmm_kfree(dev, vkms_connector);
> +}
> +
> +static const struct drm_connector_funcs vkms_dynamic_connector_funcs = {
> +	.fill_modes = drm_helper_probe_single_connector_modes,
> +	.reset = drm_atomic_helper_connector_reset,
> +	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
> +	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> +	.destroy = vkms_connector_dynamic_destroy,
> +	.detect = vkms_connector_detect,
> +};
> +
>  void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  
>  	drm_kms_helper_hotplug_event(dev);
>  }
> +
> +struct vkms_connector *vkms_connector_hot_add(struct vkms_device *vkmsdev,
> +					      struct vkms_config_connector *connector_cfg)
> +{
> +	struct vkms_config_encoder *encoder_cfg;
> +	struct vkms_connector *connector;
> +	int ret;
> +	unsigned long idx = 0;
> +
> +	connector = drmm_kzalloc(&vkmsdev->drm, sizeof(*connector), GFP_KERNEL);
> +	if (IS_ERR(connector))

I need to test this patch carefully, but in a first review I noticed that this
"if" should check for NULL, not for error.

Jose

> +		return connector;
> +	ret = drm_connector_dynamic_init(&vkmsdev->drm,
> +					 &connector->base,
> +					 &vkms_dynamic_connector_funcs,
> +					 connector_cfg->type,
> +					 NULL);
> +	if (ret)
> +		return ERR_PTR(ret);
> +	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
> +
> +	vkms_config_connector_for_each_possible_encoder(connector_cfg, idx, encoder_cfg) {
> +		ret = drm_connector_attach_encoder(&connector->base,
> +						   encoder_cfg->encoder);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
> +
> +	drm_atomic_helper_connector_reset(&connector->base);
> +
> +	vkms_connector_init(vkmsdev, connector, connector_cfg);
> +
> +	ret = drm_connector_dynamic_register(&connector->base);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return connector;
> +}
> +
> +void vkms_connector_hot_remove(struct vkms_device *vkmsdev,
> +			       struct vkms_connector *connector)
> +{
> +	drm_connector_unregister(&connector->base);
> +	drm_mode_config_reset(&vkmsdev->drm);
> +	drm_connector_put(&connector->base);
> +}
> +
> +int vkms_connector_hot_attach_encoder(struct vkms_device *vkmsdev,
> +				      struct vkms_connector *connector,
> +				      struct drm_encoder *encoder)
> +{
> +	int ret;
> +
> +	ret = drm_connector_attach_encoder(&connector->base, encoder);
> +	if (ret)
> +		return ret;
> +
> +	drm_mode_config_reset(&vkmsdev->drm);
> +
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
> index 85f9082c710e..a235a518d5a0 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.h
> +++ b/drivers/gpu/drm/vkms/vkms_connector.h
> @@ -34,4 +34,37 @@ struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
>   */
>  void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
>  
> +/**
> + * vkms_connector_hot_add() - Create a connector after the device is created
> + * @vkmsdev: Device to hot-add the connector to
> + * @connector_cfg: Connector's configuration
> + *
> + * Returns:
> + * A pointer to the newly created connector or a PTR_ERR on failure.
> + */
> +struct vkms_connector *vkms_connector_hot_add(struct vkms_device *vkmsdev,
> +					      struct vkms_config_connector *connector_cfg);
> +
> +/**
> + * vkms_connector_hot_remove() - Remove a connector after a device is created
> + * @vkmsdev: Device to containing the connector to be removed
> + * @connector: The connector to hot-remove
> + */
> +void vkms_connector_hot_remove(struct vkms_device *vkmsdev,
> +			       struct vkms_connector *connector);
> +
> +/**
> + * vkms_connector_hot_attach_encoder() - Attach a connector to a encoder after
> + * the device is created.
> + * @vkmsdev: Device containing the connector and the encoder
> + * @connector: Connector to attach to @encoder
> + * @encoder: Target encoder
> + *
> + * Returns:
> + * 0 on success or an error on failure.
> + */
> +int vkms_connector_hot_attach_encoder(struct vkms_device *vkmsdev,
> +				      struct vkms_connector *connector,
> +				      struct drm_encoder *encoder);
> +
>  #endif /* _VKMS_CONNECTOR_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 13c4ca5fd39d..50f7d88dee8b 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -117,5 +117,14 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  
>  	drm_mode_config_reset(dev);
>  
> +	vkms_config_for_each_connector_dynamic(vkmsdev->config, connector_cfg) {
> +		if (connector_cfg->enabled) {
> +			connector_cfg->connector = vkms_connector_hot_add(vkmsdev, connector_cfg);
> +
> +			if (IS_ERR(connector_cfg->connector))
> +				return PTR_ERR(connector_cfg->connector);
> +		}
> +	}
> +
>  	return 0;
>  }
> 
> -- 
> 2.51.2
> 
