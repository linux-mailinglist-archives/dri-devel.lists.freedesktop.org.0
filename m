Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE0BA23ACC
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 09:41:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8738B10E395;
	Fri, 31 Jan 2025 08:41:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QCZjZg8u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D02310E395
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 08:41:03 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-38634c35129so1320022f8f.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 00:41:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738312862; x=1738917662; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nFCMfZy+LRqyqtC/JDVJZId3JJ+MKq0oFH9I3MWAyHI=;
 b=QCZjZg8uaVf+D2SvKvzzC3OSdPCd5rxPcr8nLx9nUWMzopMMIuhc7waX/dVijYIJye
 td0NKgD8oc0dU74QrrWiSNQOvMCLgVaWc8IQY0Wr/oP9MnnUr6WmaaGwP6T9SfDnGHeW
 qUjkJHHMYNUi3gLttmdTZMLORoD8qmGxuPrYKROSq76HHgcyHCeC9AHDupQUhd3KyAdb
 aHS3ILYluWXChHi7GkYut2UqcmP8sPJCtdfV7i4mcFGnaJ/KrZxPBPTtTEsVuoFMkeae
 xV0Lxbu6oBa4lRmfM1DWGTBmiayPvH1E8ErCY/tLgONCc5MKmGO/HQtsClZnuG1KXYqp
 uSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738312862; x=1738917662;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nFCMfZy+LRqyqtC/JDVJZId3JJ+MKq0oFH9I3MWAyHI=;
 b=FdNkvfPdW0qdRJJFdriIK669nP4BVhPSSU9fwRjiC8/xBkbr3X/HX37yTvXaRegRmW
 WcsnR2Xsg9bts9HIJkjSb2QPglcx1INciqS9jBSf7PdTX9RuPij1OIDjsVf8rBwbp2N/
 N8Ksl8Xe5AaBmy6oSHxItPwg3wWTYh5f+9hNomw3YgYCWe45hFs9UjYy+eZxMX1SJVlF
 XWC5niD48c+L4sn+u71OrqTG/QVPn4lG3P+wlYybysWzaYb0GE7VoM8IiJxUYo/mO8y5
 zzcO7vK6MrkhACGhSyF/CNv6Dkr6WgwMNr9o5QUOG4V3h4Mg3a6WjicU49uS7DuJwUhX
 l5XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7p2FYZisgaKNRNrMTheNy8R+GPXVoxWvvz55wq4Vi2zpzaic+B3LHNQab6ZgLTAEvjN0PqlDgArE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw4VU/fdyWn0LYCfhxDEZRVbuU+0Fd0NiE9lIWA3ReXF+UqD9Jl
 IJ4qjJPXf2gKjBpxCliCILRUKQMf+0GiKTIrLS7kvAXxXUgQDvfw
X-Gm-Gg: ASbGncvn4szP6FLt1Lu57iXo9JQjo7WQctGSOlo9ptN91mJbdI0LGLv6SofiubIoq78
 Ivb7xWLbfLdoaX1CrpfCxd6zJ16psfA0VOx29oVca8KYXVrX8yXM+5w6/6TVtrNDYZnQ/4R7SjL
 ZGa4sIkglpVs9wGRurh94roArWODM4y3BUKI+3iSeZnTUSxSL6cVsdE8seUIMm/snN+xm/Ml2fG
 QYqShcgCybEdmPHHZ+zEdj/dH5L2OumB4skrEWCj6weQ9VyPUxBrDZAgcKzYSIJp9LhivW4efRi
 A4J7I5NbXmRo68/2
X-Google-Smtp-Source: AGHT+IHza/p5nBamqbZvAahq9OiWU9HSheTWC1m4yiDjCZM7Eo+JyoR3cTHvjgCNhCUoDSwuWUl8qQ==
X-Received: by 2002:a05:6000:1842:b0:38c:5e03:5d9 with SMTP id
 ffacd0b85a97d-38c5e0309bcmr3870061f8f.16.1738312861839; 
 Fri, 31 Jan 2025 00:41:01 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c101599sm3991904f8f.23.2025.01.31.00.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 00:41:01 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: airlied@gmail.com, arthurgrillo@riseup.net, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mairacanal@riseup.net, marcheu@google.com, melissa.srw@gmail.com,
 miquel.raynal@bootlin.com, mripard@kernel.org, nicolejadeyee@google.com,
 pekka.paalanen@haloniitty.fi, rdunlap@infradead.org,
 rodrigosiqueiramelo@gmail.com, seanpaul@google.com, simona.vetter@ffwll.ch,
 simona@ffwll.ch, thomas.petazzoni@bootlin.com, tzimmermann@suse.de,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v16 4/7] drm: Export symbols to use in tests
Date: Fri, 31 Jan 2025 09:40:55 +0100
Message-ID: <20250131084056.2889-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250121-yuv-v16-4-a61f95a99432@bootlin.com>
References: <20250121-yuv-v16-4-a61f95a99432@bootlin.com>
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

> The functions drm_get_color_encoding_name and drm_get_color_range_name
> are useful for clarifying test results. Therefore, export them so they
> can be used in tests built as modules.
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Nice and simple, in the next version:

Reviewed-by: José Expósito <jose.exposito89@gmail.com>

> ---
>  drivers/gpu/drm/drm_color_mgmt.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
> index 3969dc548cff605cbdd3d56dceafb2ca00a5c886..b73a998352d175a26c69e0878da28a6288cfc8b7 100644
> --- a/drivers/gpu/drm/drm_color_mgmt.c
> +++ b/drivers/gpu/drm/drm_color_mgmt.c
> @@ -28,6 +28,7 @@
>  #include <drm/drm_device.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_print.h>
> +#include <kunit/visibility.h>
>  
>  #include "drm_crtc_internal.h"
>  
> @@ -494,6 +495,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
>  
>  	return color_encoding_name[encoding];
>  }
> +EXPORT_SYMBOL_IF_KUNIT(drm_get_color_encoding_name);
>  
>  /**
>   * drm_get_color_range_name - return a string for color range
> @@ -509,6 +511,7 @@ const char *drm_get_color_range_name(enum drm_color_range range)
>  
>  	return color_range_name[range];
>  }
> +EXPORT_SYMBOL_IF_KUNIT(drm_get_color_range_name);
>  
>  /**
>   * drm_plane_create_color_properties - color encoding related plane properties
> 
