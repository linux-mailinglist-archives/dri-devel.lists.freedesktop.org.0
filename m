Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D4A9ACB92
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 15:49:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A6F10E1DD;
	Wed, 23 Oct 2024 13:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CExEHVwj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A332710E1DD
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 13:49:49 +0000 (UTC)
Received: by mail-qv1-f51.google.com with SMTP id
 6a1803df08f44-6cc2ea27a50so7991746d6.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 06:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729691388; x=1730296188; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1E9hSMuxhJivqZkBd/5Upa72MwomOmtz47hUjemKq0U=;
 b=CExEHVwj7EWWIdsTIm6RrIoXcCj3qZyhCo+7F/ggGeR/E2cz9QGu7dUVVhs8YpoPwB
 hA1pE8myzGOgMfett1a/kLaXjKZLGL9c7wqd3+ukspU97RNbXIviPq0h9++Hcc7kO28M
 Iqw9BeDWJMXDuANm81GEYadJsySo3BG+VWnfdCC7v+5yxVnJMJeteby+BoXKonFTcHbg
 qXcl9y4HkfTf1/e62rjpc2/UBQs3s+EBkVyrAOZJvB/fameZorQa6KOxHbb7b+0OFEO3
 KfkHIvhIgjfiUOQmUJwgKHuau5NqzIDj+kigfnBgM+rOJyWjIHY/pi3f1OTpTMRcrxPb
 3cHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729691388; x=1730296188;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1E9hSMuxhJivqZkBd/5Upa72MwomOmtz47hUjemKq0U=;
 b=V//psRObUhBVkQwlrCJUb3XjO/eztPmuO6DneO1JH9zMrWYY5xy4qJXMgi38PcvwuP
 R0pPoYv0mJ8kNJ+Q3YvmLo2/om3KPKs7XAhIEvadMlyPz7T6thx2hPZ/eFOSZUG0aKvs
 z08Ildm0LVO8HmvuuEwiS2WX570mlD7xFUrK/Ahnnm/AJWzuIBNtmrUqPP1BnEPd2cgr
 ZJGZuAt0XaQtaHUUgJBsKdin3vObR+irHzgRggTRlaoWB60kQxDv84LDz2gGV6ASkRu/
 OTGeXvEdmzxPN7baNZYRrRwHldulb/F6JF2Xt+qKJf/4adyCqtCbLcKDliikLz6XIXyG
 kySw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUaK9YF/tEpGi0JsUJFLrUPdskwyldkOV8IRMhtVygUFCMcdLob1SSJPFhNszpHmoeHq9VI2n0kq4U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyD1QnGlCgmPbwt2Vd5WCMdM4b9TLYLzBrU9ktprXZ4OMkiRpMD
 2AXvhGlomS7AgmwmFlsGEfHc72XhD7EOd7skPXGeAHAPCM21D126
X-Google-Smtp-Source: AGHT+IHwhJhDy3VRo4azo5fv6sWbQE1FDHxxvau6WVw6GJudrJZpRkuESW6AiLhrRy7U3PBV/WrnGA==
X-Received: by 2002:a05:6214:29e1:b0:6cb:fc3f:6cc7 with SMTP id
 6a1803df08f44-6ce21a7fdcdmr119843906d6.15.1729691388619; 
 Wed, 23 Oct 2024 06:49:48 -0700 (PDT)
Received: from yoga ([2600:1001:b14e:1ecb:a95c:b3fb:e1a8:befd])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6ce0091ad77sm39274006d6.67.2024.10.23.06.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 06:49:48 -0700 (PDT)
Date: Wed, 23 Oct 2024 09:49:44 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>, 
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/sharp-memory: Fix some checks in
 sharp_memory_probe()
Message-ID: <x6dadpm2zmuuih4ndnpff5ljt2hy5geikjeejwy6v33qzaspsa@grxia5jw6y2j>
References: <0d307349-c141-49ee-8b34-67caf5f8b638@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0d307349-c141-49ee-8b34-67caf5f8b638@stanley.mountain>
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

On Wed, Oct 23, 2024 at 11:30:31AM +0300, Dan Carpenter wrote:
> The devm_drm_dev_alloc() function returns error pointers, it never
> returns NULL.  Change that check to IS_ERR().
> 
> The devm_gpiod_get_optional() function returns a mix of error pointers
> if there is an error, or NULL if there is no GPIO assigned.  Add a check
> for error pointers.
> 
> Fixes: b8f9f21716fe ("drm/tiny: Add driver for Sharp Memory LCD")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/tiny/sharp-memory.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
> index 2d2315bd6aef..1bcdd79166a4 100644
> --- a/drivers/gpu/drm/tiny/sharp-memory.c
> +++ b/drivers/gpu/drm/tiny/sharp-memory.c
> @@ -543,8 +543,8 @@ static int sharp_memory_probe(struct spi_device *spi)
>  
>  	smd = devm_drm_dev_alloc(dev, &sharp_memory_drm_driver,
>  				 struct sharp_memory_device, drm);
> -	if (!smd)
> -		return -ENOMEM;
> +	if (IS_ERR(smd))
> +		return PTR_ERR(smd);
>  
>  	spi_set_drvdata(spi, smd);
>  
> @@ -555,6 +555,8 @@ static int sharp_memory_probe(struct spi_device *spi)
>  		return dev_err_probe(dev, ret, "Failed to initialize drm config\n");
>  
>  	smd->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
> +	if (IS_ERR(smd->enable_gpio))
> +		return PTR_ERR(smd->enable_gpio);
>  	if (!smd->enable_gpio)
>  		dev_warn(dev, "Enable gpio not defined\n");
>  
> -- 
> 2.45.2
> 

Reviewed-by: Alex Lanzano <lanzano.alex@gmail.com>
