Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0485CCE7BC6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 18:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A47A10E5F6;
	Mon, 29 Dec 2025 17:26:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AqHXJ2rB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E7610E5F6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 17:26:13 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id
 5b1f17b1804b1-47aa03d3326so59127295e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 09:26:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767029172; x=1767633972; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ae5fwqLEzbzqxY2Ws8MB1zw9Sg4yilZoV68uIEmuwGY=;
 b=AqHXJ2rBdy4cmMGbU2yc45TtiH22mE+wFHJ3UTOz2fV4Bw80DtqW8R8z6TCStbuv1h
 9q3/OX8SLhatSvGO/H4jUdevnpzdAe/fpLWAlNt4zK5/uc37yIGrk6RmzoO+8HC+hed4
 Ci3vHlDk0TVErR+b90DvPPmaLMsiYmqod749iTo5C0sQc9Yk6iRXWjyI0/wNoSzr55rU
 Vr1vgCx3G1E+Z1H3TeZ07FijoRMD5zCaw2moOQ4/mSQtVG+pFeEHqkdPdRUy1igSuXvf
 UUrygCou0n70HT5bd/fszNr4fy47FXL9aeEierecPiiBlnkDbgdU2Dd8DCwuf+roC4SR
 4YNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767029172; x=1767633972;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ae5fwqLEzbzqxY2Ws8MB1zw9Sg4yilZoV68uIEmuwGY=;
 b=lRrb9CCXyhxpB1GuMsfyA7F+AlxRieGE+3qeoeTRuIz3+izTRseSCY8NQGnVoUCldd
 mLhj59L962EotLxSAqsdFu30XYXxRK+2TGub05RDVqc54UyqpGeanBeY2bzzLUMUuOZd
 iXxE9q7HkCDnIFhzkmCKFSkA4j2iYY5lH0SgxgH4sNy30uzDVC8nMIWwp7HacQZXnsNs
 WXt9jSHZ/Gyva4vApo7p3gXt0qVVLUI2IvGD5TU37kk2KXPXh5TTFVlQPnpDD6F1os0+
 Q1bTiInn3Kpi7tbS2OPwbEf2Yixn0ACPYctxphuNvFmgCkhAegb0kGb8bB5t3LW3mgPN
 EOIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCrlvVazcLYh51MXpdDzDJb3j5dIK1tKfwXR74eo9SI9iHDyZz3HVcQrNlBdsISWUjBobqREVe/1g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1uKun9sfaCPzZE/AfLhdTgd7IfLy1ozMW3Er5aRVTJFy33FXs
 kHYCiOp4eYSFp3qKUxKnVnWYdEwL9eZfs2CilnyJWWaFj6ZEc/rC4HEu
X-Gm-Gg: AY/fxX6VDYxcRqPLhLrFlygx3q7i7fQ4Jd5wQXKiKzBq02vJt//paOhEGALvZgSZFWA
 h3cVchRXZrLGJwyNtaYoFUJXE5g2HFMRo4Chc/E/pZQb4NfGbXBP3x5KvHsicByVM/EdeOpdTad
 PkhdMyWw+HXEbjAPm4sLTIwvRgLymOS5fb0YTIZvBDgX91ustC57oRxTFoLMsMsLpMyJNNT9VI3
 7MIzhgDMW2UmMn8wUFoyB+sVm4oN0SRSpwolYQ31foYX1HIRn2ptJhKoDzqMWCeFyirRvXrYBOP
 ypfz5XPKNCpBhSF5HP9ffb3a1eH6EKzm72olyyDq/ljhLr2GhDQbs9upVAiglbKo/xNNZB1pD+F
 w80riR7m80OJccmvEwdQCMN6ONSIthe8JiyNUsoHyo7xzku8NcKm09N88QNu1g4NWeY0ekN1Z5p
 wTwAEPyqp9jk8EaBcyy8KP
X-Google-Smtp-Source: AGHT+IEbAPfQK1RuZK+nE8beMDen7Z0FnzbXcsf76kNLQrLVD5yeuJY7YFmRoC0b8XImWAEfK6WHHg==
X-Received: by 2002:a05:600c:37ce:b0:477:8a2a:123e with SMTP id
 5b1f17b1804b1-47d195911admr370622385e9.33.1767029171885; 
 Mon, 29 Dec 2025 09:26:11 -0800 (PST)
Received: from fedora ([94.73.37.171]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324eab2a94sm64024482f8f.43.2025.12.29.09.26.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 09:26:11 -0800 (PST)
Date: Mon, 29 Dec 2025 18:26:09 +0100
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
Subject: Re: [PATCH v3 26/33] drm/vkms: Introduce configfs for connector
 supported colorspace
Message-ID: <aVK5sdhaMdhZlhDQ@fedora>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
 <20251222-vkms-all-config-v3-26-ba42dc3fb9ff@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222-vkms-all-config-v3-26-ba42dc3fb9ff@bootlin.com>
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

On Mon, Dec 22, 2025 at 11:11:28AM +0100, Louis Chauvet wrote:
> Add the attribute supported_colorspaces to configure the supported
> colorspace of a connector. It will allows emulating some HDR features of
> displays. This feature is only supported for HDMI, DP and eDP connectors.
> 
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  Documentation/ABI/testing/configfs-vkms |  8 +++++++
>  Documentation/gpu/vkms.rst              |  7 +++++-
>  drivers/gpu/drm/vkms/vkms_configfs.c    | 40 +++++++++++++++++++++++++++++++++
>  3 files changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/configfs-vkms b/Documentation/ABI/testing/configfs-vkms
> index 5452140cc508..f750e616be54 100644
> --- a/Documentation/ABI/testing/configfs-vkms
> +++ b/Documentation/ABI/testing/configfs-vkms
> @@ -40,6 +40,14 @@ Description:
>          Type of the connector. Possible values match those
>          exposed by the "type" field in drm_connector.
>  
> +What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/supported_colorspaces
> +Date:		Nov 2025
> +Contact:	dri-devel@lists.freedesktop.org
> +Description:
> +        Supported colorspaces for HDMI, DP, and eDP connectors.
> +        Value is a bitfield, where 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC,
> +        etc. See enum drm_colorspace for full list.
> +
>  What:		/sys/kernel/config/vkms/<device>/connectors/<connector>/possible_encoders
>  Date:		Nov 2025
>  Contact:	dri-devel@lists.freedesktop.org
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 41c6f4733663..1c4a8023374c 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -138,11 +138,16 @@ Last but not least, create one or more connectors::
>  
>    sudo mkdir /config/vkms/my-vkms/connectors/connector0
>  
> -Connectors have 2 configurable attribute:
> +Connectors have 3 configurable attribute:
>  
>  - status: Connection status: 1 connected, 2 disconnected, 3 unknown (same values
>    as those exposed by the "status" property of a connector)
>  - type: Type of connector. Same values as exposed by the "type" field in drm_connector.
> +- supported_colorspaces: Supported colorspaces values for HDMI, DP and eDP connectors.
> +  If supported_colorspaces is not 0, the HDR_OUTPUT_METADATA will also be created.
> +  Value is a bitfield, 0x1 = NO_DATA, 0x2 = SMPTE_170M_YCC... see enum drm_colorspace
> +  for full list.
> +
>  
>  To finish the configuration, link the different pipeline items::
>  
> diff --git a/drivers/gpu/drm/vkms/vkms_configfs.c b/drivers/gpu/drm/vkms/vkms_configfs.c
> index d6a85d6c466f..90bf6e6995ae 100644
> --- a/drivers/gpu/drm/vkms/vkms_configfs.c
> +++ b/drivers/gpu/drm/vkms/vkms_configfs.c
> @@ -1233,12 +1233,52 @@ static ssize_t connector_type_store(struct config_item *item,
>  	return count;
>  }
>  
> +static ssize_t connector_supported_colorspaces_show(struct config_item *item, char *page)
> +{
> +	struct vkms_configfs_connector *connector;
> +	int colorspaces;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	scoped_guard(mutex, &connector->dev->lock)
> +	colorspaces = vkms_config_connector_get_supported_colorspaces(connector->config);

Missing identation in this line.

> +
> +	return sprintf(page, "%u", colorspaces);
> +}
> +
> +static ssize_t connector_supported_colorspaces_store(struct config_item *item,
> +						     const char *page, size_t count)
> +{
> +	struct vkms_configfs_connector *connector;
> +	int val, ret;
> +
> +	connector = connector_item_to_vkms_configfs_connector(item);
> +
> +	ret = kstrtouint(page, 10, &val);
> +	if (ret)
> +		return ret;
> +
> +	if ((val & -BIT(DRM_MODE_COLORIMETRY_COUNT)) != 0)
> +		return -EINVAL;
> +
> +	scoped_guard(mutex, &connector->dev->lock) {
> +		if (connector->dev->enabled)
> +			return -EBUSY;
> +
> +		vkms_config_connector_set_supported_colorspaces(connector->config, val);
> +	}
> +
> +	return count;
> +}
> +
>  CONFIGFS_ATTR(connector_, status);
>  CONFIGFS_ATTR(connector_, type);
> +CONFIGFS_ATTR(connector_, supported_colorspaces);
>  
>  static struct configfs_attribute *connector_item_attrs[] = {
>  	&connector_attr_status,
>  	&connector_attr_type,
> +	&connector_attr_supported_colorspaces,
>  	NULL,
>  };
>  
> 
> -- 
> 2.51.2
> 
