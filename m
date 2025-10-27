Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE957C0CAE0
	for <lists+dri-devel@lfdr.de>; Mon, 27 Oct 2025 10:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64CD10E40E;
	Mon, 27 Oct 2025 09:35:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hG0wo7i7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE01E10E40E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 09:35:41 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-475dd559b0bso25630525e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Oct 2025 02:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761557740; x=1762162540; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6YOqLOsjgvD3HmEpKNNqQwgAToijdl+SaKUuDAAgKUE=;
 b=hG0wo7i7gx5UJd0gRXofW5oh18iTPAKNdESc7qdaDxkPNgyUjEcf+tCyUiyx+BezqB
 iyjeeQjvaVdB068/zhCvQ/NjSmwi4wSBFcYlAvsqpWPyy42rTTlc7X9vq/L3qjjfO5LG
 bSUcYuMs5ptRXyQEE4AI1DCtqE8AvLU2SvPKz9/iuKDmpJFX2GbfNqtoprAasWiAtUAe
 aK5gNu0DvHG1MuNP1un/DgkCClOPjtwQSNN2UszoRyQjhEnFbhZpEGbnK41qC6SX2eKZ
 XZTjzJ/6k3jLq/KdExfwESefPuB/P3MXVy8E0uAMxowzawK7hmqTlJCSXK3NgLktqe9E
 i9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761557740; x=1762162540;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6YOqLOsjgvD3HmEpKNNqQwgAToijdl+SaKUuDAAgKUE=;
 b=lXEJLEACzQwCP51/I47zaX+2PAQcnubNN3Kwlbehw5IDQbtyK8xQ2M5cBLwMGwCGMb
 vLsHVKxauk6+TLt141WDoJIBhhgUfGjFJtP9tMWV3Uxe+DwZam0+CiqvkdqjiEHj64WX
 Fd9VjkIcIRjMDI4ayIp/wOYItxrbmqnZSQTTWzx0h6ymcq7LQ55KNomZtGxCFS40dVeM
 7sWUE191x17nIjNAmJBinSNKlUxP5dzY18I85VaTbmmZuLf94ztBEJGMib9Zs7iVNE7D
 kpXz4eB+lc6p66LqAKlF6i8IgvbFoegxtYoRvVK70Nn9jXuna/dWrb+66YC+2rArj86v
 U9cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVxJR+6HXkRcu+qWFpe8rjR97lV7Xz1wdXIySXmsJhUT3CNLolCGhwJu7CjN6cD7YAmBsG3+dlnD0A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzqylvxDEDUzBNB58qn5LSHN6sHERUh/CAceSOCUPbA9ROtAlMK
 2IntXRii7l3/1LFEfSrPc+67NpmbiiROn2N2mzhZXfqe704+TzRXj8aL
X-Gm-Gg: ASbGnct7aJZ4JCmU53xJxJiPcHqh6RRcBZb2rAF+p0oJOoz5wc6i3N8G3NpvtmZ8nPq
 bW1ck/R2PxnSMFsswUhwziPc31ITGBHmfd3ux1SnXPVYVinPDaSdno0YQd3XYUdxcQeaXvMh0G9
 3Wo5eHbMzCsQF01gSkQqXXtvAeJRYiUxh1sHGIQKWzoQ+G/nRQSt5VmCmW+I6dhRI4wGd5mlBij
 kH0aPL7YnBIJOAw1jLhSzavKEye9OCy15PrGK63WJa0Q0KuTOcfQthxIf6jc+TeDzCbzCupI8EK
 f5defSTMwO6BESM86IxBRVQFK4v97xiJhf5eXOvhsCw5aklweRaA29p/gM6ne6qyWuPElGJMCZf
 3jPT+zGQ167cvE0Ky6VUi7SfUCIrN08TEQL5Cs4eaoWC6cX8HXjrhdjQ9WJw1xJHKDGscyBWBoB
 Q6hkl240NM
X-Google-Smtp-Source: AGHT+IFmnLTW/ZjkapgUduw0uLpX3pFJyDGuV0GxSTKLvnyxWajP7bnM7PWAmAx3tMJP6BGM4OVYbw==
X-Received: by 2002:a05:600c:540b:b0:46e:7247:cbc0 with SMTP id
 5b1f17b1804b1-475d2e95fe2mr95277105e9.18.1761557740195; 
 Mon, 27 Oct 2025 02:35:40 -0700 (PDT)
Received: from fedora ([94.73.38.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dcbe5587sm146645965e9.0.2025.10.27.02.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 02:35:39 -0700 (PDT)
Date: Mon, 27 Oct 2025 10:35:38 +0100
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
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 16/22] drm/vkms: Introduce config for connector supported
 colorspace
Message-ID: <aP886ompK4qo-Uvl@fedora>
References: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
 <20251018-vkms-all-config-v1-16-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251018-vkms-all-config-v1-16-a7760755d92d@bootlin.com>
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

On Sat, Oct 18, 2025 at 04:01:16AM +0200, Louis Chauvet wrote:
> To emulate some HDR features of displays, it is required to expose some
> properties on HDMI, eDP and DP connectors.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/tests/vkms_config_test.c |  3 +++
>  drivers/gpu/drm/vkms/vkms_config.c            |  1 +
>  drivers/gpu/drm/vkms/vkms_config.h            | 26 ++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_connector.c         | 15 +++++++++++++++
>  4 files changed, 45 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> index 8633210342a4..a89ccd75060d 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
> @@ -187,6 +187,9 @@ static void vkms_config_test_default_config(struct kunit *test)
>  	vkms_config_for_each_connector(config, connector_cfg) {
>  		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_type(connector_cfg),
>  				DRM_MODE_CONNECTOR_VIRTUAL);
> +		KUNIT_EXPECT_EQ(test,
> +				vkms_config_connector_get_supported_colorspaces(connector_cfg),
> +				0);
>  	}
>  
>  	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 20750c9f6d08..56e2082b91c9 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -772,6 +772,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
>  	connector_cfg->config = config;
>  	connector_cfg->status = connector_status_connected;
>  	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
> +	vkms_config_connector_set_supported_colorspaces(connector_cfg, 0);
>  	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
>  
>  	list_add_tail(&connector_cfg->link, &config->connectors);
> diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
> index 36d289a010f6..ec614c2d4a30 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.h
> +++ b/drivers/gpu/drm/vkms/vkms_config.h
> @@ -141,6 +141,7 @@ struct vkms_config_connector {
>  
>  	int type;
>  	enum drm_connector_status status;
> +	u32 supported_colorspaces;

I don't know much about the specifics of colorspaces, so I'd appreciate some
additional feedback in the connector code.

Here we could add some docs and also print the value in vkms_config_show().

>  	struct xarray possible_encoders;
>  
>  	/* Internal usage */
> @@ -239,6 +240,31 @@ struct vkms_config *vkms_config_default_create(bool enable_cursor,
>   */
>  void vkms_config_destroy(struct vkms_config *config);
>  
> +/**
> + * vkms_config_connector_set_supported_colorspaces() - Set the supported colorspaces for a connector
> + * @connector_cfg: Connector configuration to modify
> + * @supported_colorspaces: Bitmask of supported colorspaces (DRM_COLOR_YCBCR_*)
> + */
> +static inline void
> +vkms_config_connector_set_supported_colorspaces(struct vkms_config_connector *connector_cfg,
> +						u32 supported_colorspaces)
> +{
> +	connector_cfg->supported_colorspaces = supported_colorspaces;
> +}
> +
> +/**
> + * vkms_config_connector_get_supported_colorspaces() - Get the supported colorspaces for a connector
> + * @connector_cfg: Connector configuration to query
> + *
> + * Returns:
> + * Bitmask of supported colorspaces (DRM_COLOR_YCBCR_*)
> + */
> +static inline u32
> +vkms_config_connector_get_supported_colorspaces(struct vkms_config_connector *connector_cfg)
> +{
> +	return connector_cfg->supported_colorspaces;
> +}
> +
>  /**
>   * vkms_config_get_device_name() - Return the name of the device
>   * @config: Configuration to get the device name from
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index 5a87dc2d4c63..cc59d13c2d22 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -84,6 +84,21 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
>  	if (ret)
>  		return ERR_PTR(ret);
>  
> +	if (vkms_config_connector_get_supported_colorspaces(connector_cfg)) {
> +		if (connector_cfg->type == DRM_MODE_CONNECTOR_HDMIA) {
> +			drm_mode_create_hdmi_colorspace_property(&connector->base,
> +								 vkms_config_connector_get_supported_colorspaces(connector_cfg));
> +			drm_connector_attach_hdr_output_metadata_property(&connector->base);
> +			drm_connector_attach_colorspace_property(&connector->base);
> +		} else if (connector_cfg->type == DRM_MODE_CONNECTOR_DisplayPort ||
> +			   connector_cfg->type == DRM_MODE_CONNECTOR_eDP) {
> +			drm_mode_create_dp_colorspace_property(&connector->base,
> +							       vkms_config_connector_get_supported_colorspaces(connector_cfg));
> +			drm_connector_attach_hdr_output_metadata_property(&connector->base);
> +			drm_connector_attach_colorspace_property(&connector->base);
> +		}
> +	}
> +
>  	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
>  
>  	return connector;
> 
> -- 
> 2.51.0
> 
