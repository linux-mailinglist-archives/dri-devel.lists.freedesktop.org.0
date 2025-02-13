Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E86B6A3478D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 16:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC4710E028;
	Thu, 13 Feb 2025 15:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gE/MuZCt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44E0410E028
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 15:36:10 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-38f24fc466aso722658f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 07:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739460968; x=1740065768; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=4IcXbcGrIKkvklFTibYCnGdgsV2fdSKmU8Z5nD/hPYI=;
 b=gE/MuZCt4eHyO6ytUAGaw28WPUSIkrFiazeCGnyqlHbCckX0hXCg/GH6ktzDx8O6PK
 +CfNv0NDfcgndhm4V9SjElf/yo4ZA1H3yM3GImjDMQvjK+/EFNE97wEiLh3Dhk+1Nsg5
 9xGhZwCmEHn3goseHTqPkYw7mDISFvcTJ6wXea0p6iVaoirH7IEg/68FePKWDtnKNkU9
 KJm96WemOg7yCcW4fokhcVncB30WdJfBNwJdyW1BAqWKPcCKS5UH4RUiccmiH4u/5cZx
 0NACznT6V4q9brLLm9dJ36N8Tj0x5dh3McFVgKi1WXB7KM1iLioPoyU2fijmcEcveI+6
 BhZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739460968; x=1740065768;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4IcXbcGrIKkvklFTibYCnGdgsV2fdSKmU8Z5nD/hPYI=;
 b=gw6YjSAhJI65ZVGn15+xvv5be6YNU8L+hpJNK9kB5ekdMQ75HU2c+Hrl+zCD1YnIpR
 wgsPHmuWQ0fZpL6MjtCp4swZTYfWUAj3FzMC3eaxj8N9aTWZ7CP6swRytCJK9Np671BF
 9Yy6Tj3NEUeRJsZ1kA6wfyaB8LUqDBPyY7kDlL+b0OSvtEXxrtmCWwTVmc3K9uMKKhPt
 3RSZJYEExsGbVhuXNiKlPnTKYNqf3iO3bec2b362bjNo6qqmK3xit8564jBuuBKr//ws
 RRdJ2NgtWzMHgJaQ9sOdiZL2HEWIuFNDu2kKOHJU4NWfUg9Rh/3gWCnup/JjM3ESFdAU
 wj2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVs9qqES2lPJL3ODxNzLjqabSQn6NRnkBpe1VmgOV9oshJ8RhIIyydzabdYXfXeqsFegmI6dvj/H/w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGZRF6Hni80/p8Pqki5WpaikMz8XTIqT/XHltiDWXj+QGeU8Ph
 0eXzAHYC3glb7c3kNcQ7ekRi/FJdUfrm9PGADfGfWvOHDsGLlOEd
X-Gm-Gg: ASbGncs+/wn2elUBOOLSCgiJP+/p6ltdT40yVaGDAGsJ+pl3Jsjlr/q/mHiiJMjZQx+
 hbRL7Pma0nslSL8ORFZCQoWIMb8Ojtd1xKbTo9kxiOjQCwomYXhN/5ocmVIRuENlLSwGp1Hch2Y
 eNrBTKuENfZauwQSj+txRThybxCvr4WxtNKlW6oaZPVoRojhK/6DRX6kXEAU5YWE+EflNB2ZmD9
 CrmjrlIxI7c9LiAYeGBh+oqTR+Yl8PvPy+rRZTZJJYh/HIfOmoOwJCWfGEEPWcNB6zZUMrEP75l
 Sk9crFXVFu32i9Y=
X-Google-Smtp-Source: AGHT+IGSGpgSdvmbWbgThw8kS11u5smsNhtdHae1iKQRr9jaVX3eewQTbXi+1AvJUCh2KKRudVkMkw==
X-Received: by 2002:a05:6000:2a5:b0:385:fa3d:1988 with SMTP id
 ffacd0b85a97d-38dea259847mr7583799f8f.8.1739460968248; 
 Thu, 13 Feb 2025 07:36:08 -0800 (PST)
Received: from fedora ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f25a0fa1esm2154028f8f.100.2025.02.13.07.36.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 07:36:07 -0800 (PST)
Date: Thu, 13 Feb 2025 16:36:06 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 05/15] drm/vkms: Extract vkms_config header
Message-ID: <Z64RZu4HdoBOzroM@fedora>
References: <20250211110912.15409-1-jose.exposito89@gmail.com>
 <20250211110912.15409-6-jose.exposito89@gmail.com>
 <Z636vaJLmJ9RGI6L@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z636vaJLmJ9RGI6L@louis-chauvet-laptop>
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

On Thu, Feb 13, 2025 at 02:59:25PM +0100, Louis Chauvet wrote:
> On 11/02/25 - 12:09, José Expósito wrote:
> > Creating a new vkms_config structure will be more complex once we
> > start adding more options.
> > 
> > Extract the vkms_config structure to its own header and source files
> > and add functions to create and delete a vkms_config and to initialize
> > debugfs.
> > 
> > Refactor, no functional changes.
> > 
> > Co-developed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> 
> This does not build in module, can you add this in the next version?

Interesting. I have "CONFIG_DRM_VKMS=m" in my config and it compiles here.

What do you have as module? CONFIG_DRM_VKMS_KUNIT_TESTS=m?

I'll rebuild every patch to make sure there are no errors.

Thanks for the heads up!
Jose
 
> diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
> index 152b2ecd6aef..42caa421876e 100644
> --- a/drivers/gpu/drm/vkms/vkms_config.c
> +++ b/drivers/gpu/drm/vkms/vkms_config.c
> @@ -4,6 +4,7 @@
> 
>  #include <drm/drm_print.h>
>  #include <drm/drm_debugfs.h>
> +#include <kunit/visibility.h>
> 
>  #include "vkms_config.h"
> 
> @@ -17,11 +18,13 @@ struct vkms_config *vkms_config_create(void)
> 
>         return config;
>  }
> +EXPORT_SYMBOL_IF_KUNIT(vkms_config_create);
> 
>  void vkms_config_destroy(struct vkms_config *config)
>  {
>         kfree(config);
>  }
> +EXPORT_SYMBOL_IF_KUNIT(vkms_config_destroy);
> 
>  static int vkms_config_show(struct seq_file *m, void *data)
>  {
> 
> With this:
> 
> Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
