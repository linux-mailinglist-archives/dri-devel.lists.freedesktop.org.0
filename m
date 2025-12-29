Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34743CE7BA5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 18:24:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F73810E5D9;
	Mon, 29 Dec 2025 17:24:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="D9oTVV8I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82EC10E5D9
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 17:24:14 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-4327778df7fso1586436f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 09:24:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767029053; x=1767633853; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Is+BjYELOU6FjihtrsgHdu+zn60dvtmelOgIKE/GkpE=;
 b=D9oTVV8IObK8VadjOPkIuiMk3jHVSuDBy0G9QPW2unXvZbHsJTTrAvU8TP7kttpSSF
 pI9fcJASTw+U5gCBTVXHRaEvX6RuxzLS6XXaBReZjj7rwq6rVjNGb9OBdQCq+OsXnUSn
 UFxI57QPvjq6pBF96onAT0ID6fB4cgU6pWP7LZmwMlL2k09rA8Rz3o5Q+CwxE7SLcpIS
 8l/D0j1t4/fjauHVTW7FDwFI9UEos4kQwEd3LkEjVayWoAJ7vDMU4fBhDYVYmwDOOdrt
 iISfhFITTmtidsTomYsr1UhIXBIgH8JqcTAw+OxBLwhF5VyVQ1573G/0WK3Vf+aUTRtw
 TzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767029053; x=1767633853;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Is+BjYELOU6FjihtrsgHdu+zn60dvtmelOgIKE/GkpE=;
 b=jV6eP2GAREMRKV1noTvhDJld8m2GcreiPEMVT7yy2vC3zsHJ/emUjNeZi49ZhmfT9W
 6ss3Bl0X0Xqzy6Rv48NrsAw7gFvqEYK/A47weaOSV5Q30wRjsxDVk0id+UHEb1/glmDV
 4NQQPrxRrjG3L1H0wsPgq4Mo14dLQ+oJaMnDc+00Lcv7ZaQ/kb1LVL1OxncFcZqVsmIz
 RkrrFYYTaLU3mZr4HgxKF2/zyfR1falv+sP657FxZf44WRd2M5E73Jgo1qpgkI/Wrbmw
 8bSlRYsokBS1UZamfNFfbdBo6vHOFgoeTArDYWICSMce/swFO+DLRDKKUL9y83BIAeH5
 S3jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJ3MGDIFlqvAin8NbcsxsT8caa06UnwnRmIWRTxHugCLgpm+MCsN6v08/zGc9NItKuS2B9wdCQMlU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzgIDp7SI6tT5CXntMvulg5A0rhC71DnID0LmSStrbugawYEH2c
 nu00GLyqmLa1Mst/5YAc+WVGHKYvjq/JOXbd+3bgEycYO1dPTJEuLZt3
X-Gm-Gg: AY/fxX4UJ+llcxn3OTPGjak3rwxaTbr3dDwvDlEByOjMeCrDkNOy8qxbr6U8lvErf4g
 oowE9pvjkoGG2Hx7QjODNVt7lF7Pb9Bka7ZLKFTJ+D8G3Fbk6lrVifRaOwnJn6xk1XnAKl4N8rf
 eC3qJnwkROKdnnqEhmTrHgohZ6TyeFivZYU6Pim51HvbnWEaMKQjdSiBaoSbaEvhjarL3y8fozx
 W2KWiDm7oBXKiEN3h5mvdmYOHamaqNeVA+VAxx3AVhdb4eCBfGPbxr6AN91JJs6dlxQwD30MIJ3
 JZoPjObJRY2k5Z9FlQqaKp7u/CFcmNO+MxO+XldBWJrS7cGgzdZqmGPJjoD47dOt4mkkjdNcSnp
 cU+VOlG/5HRP2sWAv+2WxDjgrP+GuRJD2LmZYCUUJbXhwc4ZUqpMhN3/uDgfND6T00N3OB3sW6N
 qUXzPiNIIflg==
X-Google-Smtp-Source: AGHT+IFUYYJiXk5vDyIxA7187o6+sbSBSV7PUMGC6bnELEkTRcsCNUIjDa8pXfmgXR1aZY/nCkjnhQ==
X-Received: by 2002:a05:6000:2dc7:b0:430:f449:5f18 with SMTP id
 ffacd0b85a97d-4324e50b88emr36388839f8f.46.1767029053151; 
 Mon, 29 Dec 2025 09:24:13 -0800 (PST)
Received: from fedora ([94.73.37.171]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1b36fsm62985046f8f.5.2025.12.29.09.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 09:24:12 -0800 (PST)
Date: Mon, 29 Dec 2025 18:24:11 +0100
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
Message-ID: <aVK5OyydXrQfIcc7@fedora>
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

Sorry for the additional email. I forgot to mention that this brace should go
in the same line.

> +		unsigned int len = 0;
> +		const u8 *edid = vkms_config_connector_get_edid(connector->config, &len);
> +
> +		memcpy(page, edid, min(len, PAGE_SIZE));
> +		return min(len, PAGE_SIZE);
> +	}
> +
> +	return -EINVAL;
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
