Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E08B05B60
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 15:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E12F10E5BA;
	Tue, 15 Jul 2025 13:20:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="jpTp4tks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3580410E5BA
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 13:20:01 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3a4ef2c2ef3so4073585f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1752585600; x=1753190400; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=RZNdJdvnKf8QKxgnS87V8b+rsQrk+0DHovoGkwxahd4=;
 b=jpTp4tksVjo+C9bF9kwoRfUck/F7RRYZQdmXAJMZq05pI4cXhG/LAH5EwdRL5EKnei
 cRKT8jTiDyGrRjc6/NQz/mvE8pIwFQQ6KnpYCGupbdyCY1P2OZUvv9xykZVD87/mZqGN
 A81cQhnr77LpjLi0RCazsz1qIaKyPmhQgpD+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752585600; x=1753190400;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RZNdJdvnKf8QKxgnS87V8b+rsQrk+0DHovoGkwxahd4=;
 b=btc9K/op+yoN+EHVE2l/yq9mlPTN4yOaDOvbCnfflQq118aBaZ3DjOJpk+AprihIw9
 Q6gSAwa0P+M1lrtcavqXGsjp9k5NmWiGLPoOjWZZsG4qrX04B2Xm67PjnOsNBpu+x2z/
 n2teyPCS7YgxsLEiDvQs8tulFcfZaqYPProioel0SbtvXu9V6LQZ1Ng8ikcvtciPM8YX
 G0UpcqDquQhTv+p/xxL+KDp2IWqmAMS0LJF6vCr0C35UWbXrovEaIx5Hq8SGG4exXPAi
 eT97G/13XR/Y1ERHj98bNblbo24DrbFfRRDw01avDY8WiJYFXeBmK+doKV/PQJPA8TgY
 uGHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvVNjQ9iLrsiKpb5oseSyNFK41C9I6jAYpVZzGRxustGPMpGuzFJ0xWxODc7z0vaW9Y2TfxhVzr/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG1S5MoPSgJAoUUVGwxF4hKENVfCz0O9XamlTbutTbXiJeFZ8e
 QXzIEwjhIy6vYp90/n4gcWpLTtS7N8D9A+nczJOD01sXQ/sIauypT5sxaik1bgL7rq0=
X-Gm-Gg: ASbGncu9uDcg2w/XabTw/6PMGqYpjdtGOQZoxrQLoO7eAg6pmKSaoQrDikfxZepss5c
 IEE+Iw9aO7Xl0i+QbGsI64SIk2QweebgEnk+LFSTfTsujV7oyx51/a8moMnXf/A63IP64F0Wi+P
 VcVj+9rqST8bXx7m4UlrY/1S6kTFk9syRAh8oaE1mMcRADZasDLW8jfM3ca5rn7oYOOs0XekaPs
 9p+n5A3ofA5gfvSG8Tq0I9rmK2I2zjKjpNJmgsxPsh1L0zNiEXmhgMLEQQM0uMh0exUxCxeDE6d
 HBVV0pCNibGWuYHbrrDItsyTEUqTN2DRx1BDImdFVXqOl5hG+L/5aR7lnmSu9OPWw040V+/EhWR
 JxTzEvDbydEWVS1tAM/Ku/JwFSTbXR8tUHA==
X-Google-Smtp-Source: AGHT+IGgOrGKdM3z4rYXREjB5K13TQWQc9hzSbnGlRYyUFMTZTPMvyOf/txGJ4PS42ny0/qCStlXJg==
X-Received: by 2002:a05:6000:290a:b0:3a4:f038:af74 with SMTP id
 ffacd0b85a97d-3b5f2e3ad53mr14816635f8f.51.1752585599669; 
 Tue, 15 Jul 2025 06:19:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d70csm15389832f8f.62.2025.07.15.06.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 06:19:58 -0700 (PDT)
Date: Tue, 15 Jul 2025 15:19:56 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com,
 neil.armstrong@linaro.org, jessica.zhang@oss.qualcomm.com,
 deller@gmx.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 fnkl.kernel@gmail.com, j@jannau.net, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, sven@kernel.org,
 alyssa@rosenzweig.io, neal@gompa.dev,
 support.opensource@diasemi.com, duje.mihanovic@skole.hr,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 02/15] drm/panel: panel-samsung-s6e63m0: Include
 <linux/of.h>
Message-ID: <aHZVfD9Koa-fi5CQ@phenom.ffwll.local>
References: <20250715122643.137027-1-tzimmermann@suse.de>
 <20250715122643.137027-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250715122643.137027-3-tzimmermann@suse.de>
X-Operating-System: Linux phenom 6.12.30-amd64 
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

On Tue, Jul 15, 2025 at 02:24:39PM +0200, Thomas Zimmermann wrote:
> Include <linux/of.h> to declare device_property_read_u32(). Avoids
> dependency on backlight header to include it.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> index ea241c89593b..930948cb615f 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-s6e63m0.c
> @@ -16,6 +16,7 @@
>  #include <linux/export.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/property.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/media-bus-format.h>
> -- 
> 2.50.0
> 

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
