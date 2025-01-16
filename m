Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9358A13E4E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 16:54:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EE0C10E9B5;
	Thu, 16 Jan 2025 15:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="MOZaZMo2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2061F10E9B5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 15:54:53 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385f06d0c8eso651115f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 07:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737042891; x=1737647691; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lsIy1hwmOo/E5E4bQodyMN+5T0LtN8lt/FWTPRJwl3E=;
 b=MOZaZMo2dH892ZSDmZYEJOygel5NW6tGaw/NquBHyPjCPT00VxRl/FuEPgVDfQAbPe
 FA5Rkr85oicgc2A19F7JxdBiy5VyyYqAcibHLmi23NBCYEseC5O4hRNC8p3bwNHWsX/4
 4rqqZ6LKsTlyuqD4IlOFlpHEX6LUqqn1kNosBr2ZI4wISfWryKFLGcxx61O6eDyxvsUd
 dY5c1zCXd9PsDbg6Fhcoeod0Ot9H50bQxG7c9IoJiaqo139viYi/gjj57qQ3/9+L8HNY
 S0k5g8tE+O60n7MGq1KgM1c8UC0edUAXs9+8E0YRidE7TqkQUEBO/LKbG8E2d4xyBPGt
 Zxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737042891; x=1737647691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lsIy1hwmOo/E5E4bQodyMN+5T0LtN8lt/FWTPRJwl3E=;
 b=AWNj0l4/Fy0vbPwVXgJImAxG+QX3U/+0IS0lVI5+1XvXR0eFVMD72pXL6Me8j6aHig
 jmfaenRQF5bTg2rLbrEG7o3vCXF7MEe52nayR4WZRjHuOLfEyVoWkJvO2+ztdtyoV/mm
 KkqkUgj+LeB5gPvXcyCfxez41Ijz8VJ+vp+RkGbzsNSNaWcAyrFp/ZbUJDjpR79p2DBT
 spine6Rm0UMhK9aEUvEkqkJ0Z4zf8Z+GlSIFABlvBq3MmlqSuymPertsZElrAaB4aLL1
 B4II+qkZSWQFnGKXMah5tjCqHsTQXrj6HNhACOoK9NL23k0v1v+9G3yIhW2aJf9D8vOw
 d9+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdn+eh8JizbPYUIovVb0LRpLnnY9mPuJnLh5QHZhVHq4L18TXZ9TTRtwTPNf8hueuKZsnOOZ+TRfQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2fVWx9ds6f+dAJMicefcIdDz6jMIewG3ud6OQ9R1DlDNsjR4x
 z7XPhJUyJcmFHieQkRimPu8LMY8I9jk1aGLItrmsADpyRCkTmlCL
X-Gm-Gg: ASbGncstLfgqCQK7Tnt1BPRRa/GdRXM1vhhYB7eJvY55OIyPiOv2ghgzaPcWUAR9A0k
 m/nW+mzPT4KiAZZ44WGQ/wipHjbRyxCrlwPyJIaUo7FV8OmpQQRm9a+8lyxiUu20OjewmQ8xqAA
 /+KBGW23FtM4qJE/Bw3ExCylYnVPdWwk1786ZKGH/EfCdj+MRj0eDZoZeLKKIg6zZ7MyZx6Cg5X
 IdBXoVKIKx+oKMSiWhulrB+uHHJyD11gWJ6+mTkPbcBOIq4zL0vGqaWIg==
X-Google-Smtp-Source: AGHT+IFiwv9j0YjjKuCRjEMarnyqoxBeR54uC4o8HVB2+kJRsjIqAm+8OIc9//IXvsApwoAwjdVFog==
X-Received: by 2002:a05:6000:178a:b0:38a:4184:1529 with SMTP id
 ffacd0b85a97d-38a872d2aa5mr23704329f8f.12.1737042891492; 
 Thu, 16 Jan 2025 07:54:51 -0800 (PST)
Received: from fedora.. ([94.73.34.116]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c16c4c12sm43533845e9.3.2025.01.16.07.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 07:54:50 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
 mcanal@igalia.com, melissa.srw@gmail.com, miquel.raynal@bootlin.com,
 mripard@kernel.org, nicolejadeyee@google.com,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com, simona.vetter@ffwll.ch,
 simona@ffwll.ch, thomas.petazzoni@bootlin.com, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v8 1/8] drm/vkms: Switch to managed for connector
Date: Thu, 16 Jan 2025 16:54:44 +0100
Message-ID: <20250116155446.3461-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114-google-vkms-managed-v8-1-da4254aa3dd5@bootlin.com>
References: <20250114-google-vkms-managed-v8-1-da4254aa3dd5@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

> The current VKMS driver uses non-managed function to create connectors. It
> is not an issue yet, but in order to support multiple devices easily,
> convert this code to use drm and device managed helpers.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Maíra Canal <mcanal@igalia.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

Thanks!

> ---
>  drivers/gpu/drm/vkms/vkms_output.c | 12 ++++--------
>  1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index 8f4bd5aef087b459d37d0cbbf90fe0145090917a..570823ecb28f589e6323036590ec05a2f633bc9b 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -3,11 +3,11 @@
>  #include "vkms_drv.h"
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
>  
>  static const struct drm_connector_funcs vkms_connector_funcs = {
>  	.fill_modes = drm_helper_probe_single_connector_modes,
> -	.destroy = drm_connector_cleanup,
>  	.reset = drm_atomic_helper_connector_reset,
>  	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
> @@ -75,8 +75,8 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  		}
>  	}
>  
> -	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
> -				 DRM_MODE_CONNECTOR_VIRTUAL);
> +	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
> +				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
>  	if (ret) {
>  		DRM_ERROR("Failed to init connector\n");
>  		return ret;
> @@ -88,7 +88,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  			       DRM_MODE_ENCODER_VIRTUAL, NULL);
>  	if (ret) {
>  		DRM_ERROR("Failed to init encoder\n");
> -		goto err_encoder;
> +		return ret;
>  	}
>  	encoder->possible_crtcs = drm_crtc_mask(crtc);
>  
> @@ -110,9 +110,5 @@ int vkms_output_init(struct vkms_device *vkmsdev)
>  
>  err_attach:
>  	drm_encoder_cleanup(encoder);
> -
> -err_encoder:
> -	drm_connector_cleanup(connector);
> -
>  	return ret;
>  }
> 
