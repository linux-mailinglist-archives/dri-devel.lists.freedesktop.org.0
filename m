Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 096E3CE7B99
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 18:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E5010E5C7;
	Mon, 29 Dec 2025 17:20:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="g1WmrL1f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5051A10E5C7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 17:20:50 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-47a95efd2ceso84380895e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 09:20:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767028849; x=1767633649; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ujThKWml8uMLDf0KX6SXAAMWz7lsuk/sdoB2hkb6sc8=;
 b=g1WmrL1fXTgcKsCJ2bDqvYfj+4OnEFNJ9MCmrQ8GTJmhS5sKhipIk8zypAYVC3i4Rw
 FpHYg8musMNjDKWW4Wto7UCus2watffT/5XbJEwn2VsZSPZvJVzHmW9RmnVQPyJXvo+J
 ZQ/IQ7jlNfAY5VpFTY1Za7mfWUMja0V9XPJv43E8B3jtfEmuxMzAkT8fjlFKzUMCEQB9
 x/9kjsNt6iCrKz+clCQljlgBH9kmbV09/Cxn+xd9tGu1nujqMCoJF5HFK7e7e+rGR2ib
 PnIR8JP+PKPjcW/JgCyCba6gibAwL1Xw+umgx8pROol1Lg6orJIwMClzlkRoY/yc9AIg
 LpTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767028849; x=1767633649;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ujThKWml8uMLDf0KX6SXAAMWz7lsuk/sdoB2hkb6sc8=;
 b=JLUIMPNPbXpCYTzfYQ/+dFpx+f89G9hnlxWSnecea0+16x0bEVokQHsLMY3yvqfRGu
 ZPeYJ/IhqbxPF7yvrBGrWcv4tpxJfqbBNstlQFV715mrSo2PEqK29TEuN1TNsAEO5FRx
 t1B3EvO4z3FNdSQtFLX19dI/AbQLrAzA1teon4QE0IkwJcMg/xnwl0G8tB4mos32m5+I
 w16ltJug1qNsMLgAxm2uWhs3LIFu8lmoSzqzrLDh24WYHaZz1Vn78OmkQx6pZ+rwPOEH
 yIyBL4ZkzSzJCYJIcHYhj1xA/B+nV09fPEwK3dvQFiwdem0fxUoTtFVtpkplGr5nFIQc
 /ejQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV3Nr5g/QulSBDJ7LJcaUeERLhXeazJEHR6MlbJMVKXJAbs6PhlmoMT4sP0y/LSMW0N82VhQVDkkHI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyulIAzRaM76EzLszLc50Av0Yi2nwcnFQhs8TVUbsnvOXVj28D0
 ETa1LKEbOTOJEGxzhIvmuwa7g3/oFrF6c9achjTvGUoVUvht13YxN+Kn
X-Gm-Gg: AY/fxX65LGRBckGFVzLEeI5XKVzU8UB71gaIgtPYrRA4o8JsIjKSEda/33hB0gQTgON
 03Vhpka+2QNPLytDCnpx7lGHfCD3wqaM6jiRpnZSgi1U+x3XjNE8fGTH92WsbwtNoJAeezNXHjl
 aLTntXG2kuEZU50j97x4TTIB3R92wuNq/XdrUoJn7h7MHei8N+q4neyJKYF6vNs2bOW76gJGm5U
 PSEBoviHSZBa8J+JVGZTvKfHv0wS5B7jxeg48F0nrit3l0ie0b7hBXuIp/rjAQ6vKeKhthpiCUI
 pGQnClZ0rbZyk7k7L7u5V6eqHxDnbMI559/y+zdtarbsbNWmWR2+SWFCou1rpAzxoS38reNLGIP
 TxAOvGIacnxjRf7wnHJu9mXhf4l7h/ZYVxitvkeL0SHqsRn/2+ZGf3g7CILl2c6km7q3pg5jOmy
 FIgatfk7Iajg==
X-Google-Smtp-Source: AGHT+IFrILSmVylZfJiTDXSk9lzVTNGdCw1i+yRhADg/0AM5KWye8SNJlE1bk/NR2SBP5KInjYBesA==
X-Received: by 2002:a05:600c:8208:b0:47b:d949:9ba9 with SMTP id
 5b1f17b1804b1-47d19566f0dmr361853255e9.13.1767028848573; 
 Mon, 29 Dec 2025 09:20:48 -0800 (PST)
Received: from fedora ([94.73.37.171]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47be3ac4c1esm235624195e9.14.2025.12.29.09.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 09:20:48 -0800 (PST)
Date: Mon, 29 Dec 2025 18:20:46 +0100
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
Subject: Re: [PATCH v3 28/33] drm/vkms: Introduce configfs for connector EDID
Message-ID: <aVK4biJig9qKRDHw@fedora>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-28-ba42dc3fb9ff@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-vkms-all-config-v3-28-ba42dc3fb9ff@bootlin.com>
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

On Mon, Dec 22, 2025 at 11:11:30AM +0100, Louis Chauvet wrote:
> Introduce new attributes to configure EDID of a connector:
> - edid_enable - chose if the connector will have an EDID or not
> - edid - raw edid content
> 
> Due to limitation of ConfigFS, the max len of EDID is PAGE_SIZE (4kB on
> x86), it should be sufficient for many tests. One possible evolution is
> using a ConfigFS blob to allow bigger EDID.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/ABI/testing/configfs-vkms | 14 ++++++
>  Documentation/gpu/vkms.rst              |  5 ++-
>  drivers/gpu/drm/vkms/vkms_configfs.c    | 80 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_connector.c   |  3 ++
>  4 files changed, 101 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> index f750e616be54..4061ada5d88b 100644
> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -48,6 +48,20 @@ Description:
>          Value is a bitfield, where 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC,
>          etc. See enum drm_colorspace for full list.
>  
> +What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/edid_enabled
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        Enable or disable EDID for this connector. Value:
> +        1 - enabled, 0 - disabled.
> +
> +What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/edid
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        Content of the EDID for this connector. Ignored if
> +        edid_enabled is not set.
> +
>  What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
>  Date:		Nov 2025
>  Contact:	dri-devel@lists.freedesktop.org
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 1c4a8023374c..60367fd1bd65 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -138,7 +138,7 @@ Last but not least, create one or more connectors::
>  
>    sudo mkdir /config/vkms/my-vkms/connectors/connector0
>  
> -Connectors have 3 configurable attribute:
> +Connectors have 5 configurable attribute:
>  
>  - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
>    as those exposed by the "status" property of a connector)
> @@ -147,6 +147,9 @@ Connectors have 3 configurable attribute:
>    If supported_colorspaces is not 0, the HDR_OUTPUT_METADATA will also be created.
>    Value is a bitfield, 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC... see enum drm_colorspace
>    for full list.
> +- edid_enabled: Enable or not EDID for this connector. Some connectors may not have an
> +  EDID but just a list of modes, this attribute allows to disable EDID property.
> +- edid: Content of the EDID. Ignored if edid_enabled is not set
>  
>  
>  To finish the configuration, link the different pipeline items::
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index 90bf6e6995ae..20f5150e8b24 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -1271,14 +1271,94 @@ static ssize_t connector_supported_colorspaces_store(struct config_item *item,
>  	return count;
>  }
>  
> +static ssize_t connector_edid_enabled_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_connector *connector;
> +	bool enabled;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +		enabled = vkms_config_connector_get_edid_enabled(connector->config);
> +
> +	return sprintf(page, "%d\n", enabled);
> +}
> +
> +static ssize_t connector_edid_enabled_store(struct config_item *item,
> +					    const char *page, size_t count)
> +{
> +	struct vkms_configfs_connector *connector;
> +	struct vkms_config_connector *connector_cfg;
> +	bool enabled;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +	connector_cfg = connector->config;
> +
> +	if (kstrtobool(page, &enabled))
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +	{
> +		vkms_config_connector_set_edid_enabled(connector_cfg, enabled);
> +
> +		if (connector->dev->enabled &&
> +		    vkms_config_connector_get_status(connector_cfg) !=
> +		    connector_status_disconnected)
> +			vkms_trigger_connector_hotplug(connector->dev->config->dev);
> +	}
> +	return count;
> +}
> +
> +static ssize_t connector_edid_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_connector *connector;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +	{
> +		unsigned int len = 0;
> +		const u8 *edid = vkms_config_connector_get_edid(connector->config, &len);
> +
> +		memcpy(page, edid, min(len, PAGE_SIZE));
> +		return min(len, PAGE_SIZE);
> +	}
> +
> +	return -EINVAL;

This return is unreachable, the guard block returns unconditionally.

> +}
> +
> +static ssize_t connector_edid_store(struct config_item *item,
> +				    const char *page, size_t count)
> +{
> +	struct vkms_configfs_connector *connector;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +	{
> +		vkms_config_connector_set_edid(connector->config, page, count);
> +
> +		if (connector->dev->enabled &&
> +		    vkms_config_connector_get_status(connector->config) !=
> +		    connector_status_disconnected)
> +			vkms_trigger_connector_hotplug(connector->dev->config->dev);
> +	}
> +
> +	return count;
> +}
> +
>  CONFIGFS_ATTR(connector_, status);
>  CONFIGFS_ATTR(connector_, type);
>  CONFIGFS_ATTR(connector_, supported_colorspaces);
> +CONFIGFS_ATTR(connector_, edid_enabled);
> +CONFIGFS_ATTR(connector_, edid);
>  
>  static struct configfs_attribute *connector_item_attrs[] = {
>  	&connector_attr_status,
>  	&connector_attr_type,
>  	&connector_attr_supported_colorspaces,
> +	&connector_attr_edid_enabled,
> +	&connector_attr_edid,
>  	NULL,
>  };
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
> index c85d19013720..311858727175 100644
> --- a/drivers/gpu/drm/vkms/vkms_connector.c
> +++ b/drivers/gpu/drm/vkms/vkms_connector.c
> @@ -143,6 +143,9 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
>  
>  	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
>  
> +	if (vkms_config_connector_get_edid_enabled(connector_cfg))
> +		drm_connector_attach_edid_property(&connector->base);
> +
>  	return connector;
>  }
>  
> 
> -- 
> 2.51.2
> 
