Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D660917772
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 06:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11F0910E275;
	Wed, 26 Jun 2024 04:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="h3iZtvYR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA7C10E275
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 04:34:51 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ec6ddf701cso1221871fa.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 21:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719376489; x=1719981289; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=eMIepVS1eSxsW7V7EoimYfkb4vzWqTie8Ye58Dr6OVY=;
 b=h3iZtvYRrrTV1LLyoYiQYZ5qcRBpvVha8XhbUJ5XlYDKMtF+/kZygQ3A9n7Y4oUgmt
 mLlp1rkyVnje3GMsLxIhcLvfLpRK9oS9/0ymeaSPbnrzmfGbM2e3m0LBuHK7uj1/4Czm
 QL8Qr2Hfb1WNImrPjgN90X2q58g6nqHTVxNEcPbKFkFpFBJyu0UJJCIZiZ6IGuDSC0+b
 Q2sYn9tIQDnC75QBF7BGLx/wbTYN4MGiemVXSmhYCgHMWMX4yAfbuMhw9FhMXx5bkSLe
 XRqKcrn7b6PdK2rcBCOxAPt+UDmhuzCy7gyx14YJ7PyPpIdnhqezmwT08ylMK4B9hfux
 FSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719376489; x=1719981289;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eMIepVS1eSxsW7V7EoimYfkb4vzWqTie8Ye58Dr6OVY=;
 b=akBAJiJFbH1XTMMOLgm2Iqk8Alco3uOjJkYnY0hJzvAaaKRddHFNWyHRjPuAb7c+Si
 R16yTwD03eVQl0G6XBfSJedrExZQLywyhfS1JsFkNrEINhZ3mn5v7RLQPJ8ACNKmCzwa
 sxY4neNipWeHIWztwUz+OGZlsc2sV7NO8ZqAE59jvhF50YliXlkMUXiMdJSQerGLvKMz
 Pcaz2mFZmmvki0KVSv8gJGhPx0xA9ecA/A+8TcX37617BsVj0JSopjqBUNzTn5+4Fqmr
 nSLklygsCxTNZJ2FH861FUe5ouX/FAlG3OIIOSOoN4XjddW0cF6q5ngbVFiAN38hzLEg
 zHGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJgR71v7k6SKdV5vOx317Psx6y3m/BWtMGE8jU2Vda/ikoJOdYkzq0GOqcriAHxhHGKbP05Epa4eOZ5EoZiO3X90zq9rxQ1t8lbheq9Siu
X-Gm-Message-State: AOJu0Yxz0kSC7Io9C/J6tBXLZ5ksbMgwLrc5rrazmWJ9Jn2ZifDFCZGb
 9vAjOyj9R55vQPEJ2wL1BvJobWopxxz5YuMngZ1qYOeKfyelf9H6EcWnBLeELjQ=
X-Google-Smtp-Source: AGHT+IFoiipSbH2UcN2H0t6KyrVhkb9qT8QxkmMpRcQeNkCtjWTOrBPsljvQtVIFtv7+XA09K9WYvg==
X-Received: by 2002:a2e:be28:0:b0:2ec:72d0:42c0 with SMTP id
 38308e7fff4ca-2ec72d0440cmr8424131fa.16.1719376489104; 
 Tue, 25 Jun 2024 21:34:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ec4fec8a35sm12664621fa.43.2024.06.25.21.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 21:34:48 -0700 (PDT)
Date: Wed, 26 Jun 2024 07:34:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: airlied@redhat.com, jfalempe@redhat.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ast: Inline drm_simple_encoder_init()
Message-ID: <n22c255ozkpnbvt45ugfgpqyjmebmgsjblduwurf6yr7ralffd@yvbrl4rsabea>
References: <20240625131815.14514-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625131815.14514-1-tzimmermann@suse.de>
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

On Tue, Jun 25, 2024 at 03:18:09PM GMT, Thomas Zimmermann wrote:
> The function drm_simple_encoder_init() is a trivial helper and
> deprecated. Replace it with the regular call to drm_encoder_init().
> Resolves the dependency on drm_simple_kms_helper.h. No functional
> changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/ast/ast_mode.c | 45 ++++++++++++++++++++++++++++++----
>  1 file changed, 40 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 6695af70768f..2fd9c78eab73 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -45,7 +45,6 @@
>  #include <drm/drm_managed.h>
>  #include <drm/drm_panic.h>
>  #include <drm/drm_probe_helper.h>
> -#include <drm/drm_simple_kms_helper.h>
>  
>  #include "ast_ddc.h"
>  #include "ast_drv.h"
> @@ -1358,6 +1357,14 @@ static int ast_crtc_init(struct drm_device *dev)
>  	return 0;
>  }
>  
> +/*
> + * VGA Encoder
> + */
> +
> +static const struct drm_encoder_funcs ast_vga_encoder_funcs = {
> +	.destroy = drm_encoder_cleanup,
> +};
> +
>  /*
>   * VGA Connector
>   */
> @@ -1411,7 +1418,8 @@ static int ast_vga_output_init(struct ast_device *ast)
>  	struct drm_connector *connector = &ast->output.vga.connector;
>  	int ret;
>  
> -	ret = drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_DAC);
> +	ret = drm_encoder_init(dev, encoder, &ast_vga_encoder_funcs,
> +			       DRM_MODE_ENCODER_DAC, NULL);

What about using drmm_encoder_init() instead? It will call
drm_encoder_cleanup automatically.

-- 
With best wishes
Dmitry
