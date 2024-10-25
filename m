Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB7E9AFB1A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 09:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 426F210EA0C;
	Fri, 25 Oct 2024 07:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Njl7MCnZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7440810EA0D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 07:30:50 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-42f6bec84b5so18075625e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 00:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729841449; x=1730446249; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=WtHDy1uLFgkmsG/x5nxbwS/MMMaeDjb30sYbzTEX8Zw=;
 b=Njl7MCnZ60asl/1jNRjluwzDq+zBJqkK3HpaqGKbleOx9rTCihwvhh8N/L0NIuBHp2
 CLD7UA4TrqkhsJCLqzZaZjINMoW7Uf+J+nin5ZqjMH7IOJFsl0GIRMDdDL1SjIgoscJI
 BDZlzE8a2zioeLnqS4eNipQissrd5o4TGVgvCfyiHONJyBHouYEKcIW11h1aD5tgLN/Y
 8f92y9cPbB4TdIk9eONqerqHouWEU6MiyDiQ4gJTYbrTMe7TakYbjr8mvDnNfa1+OLBF
 oFvg8lD9ztrdfYyjh/2jJI4e68Bn3Hz5KOiL67MVSVrcm0rxAbaMGDA2GXPNiowbd0fB
 DuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729841449; x=1730446249;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WtHDy1uLFgkmsG/x5nxbwS/MMMaeDjb30sYbzTEX8Zw=;
 b=rV02y0WMLfNKu3V8A5/Bakh9nLHvWXe9oqjnTf5sO9HMnh3LV+QCnr5h/Bll1xtcxF
 jrNIZBvm2gQokl1CDM/aLeXje7+H/DgvEStZ9ESPFLQ6EFvcGrbNJEyGmxAJ76QmgwqO
 U7PRFWsZY41hGpJu7SKH9I3SuefPJFZc3cpbx+BD86hay3S+o9bMHPvbG5sm7A/kS7kk
 FQzJkCDFQ+taOZkuKLjHVtYQSt9s2IPG8lFIn1/n1bMqNMfpEYcVxsra4uYfySfg2PNz
 CwHS8SWR8HlLnxeIjEuxpR14SX113vnQCp41V0zOB3nLjRCNwW92OKXJvp3QCB6mUSW6
 hI6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYhEWphYZHqukguGKahFl8YfrpfHP9jXZg+dJtcNb/jIzAWTXuYQo6r/TugzL5NUJoR0QptJRc+qQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwGF0zOvsRTnfoQDYsdxI974M3v6SPxzzG1RXYbsJtJY1zQ5RfJ
 7XfGTbEaXpGRGjhbW9N/MbcLa88HpHkv6IJ5g9C5AcC0+93Cb3pFV/rZMHScg/8=
X-Google-Smtp-Source: AGHT+IHxF+XBAnXeDnDqIMGQCJ8rtAbnYKULA9dlRYGwuNkgYKpDnNMejLiqlKZPt83EjxSWFFNeTg==
X-Received: by 2002:a05:600c:1c01:b0:431:5a0e:fa2e with SMTP id
 5b1f17b1804b1-4318c715cc0mr39763695e9.21.1729841448665; 
 Fri, 25 Oct 2024 00:30:48 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058b71479sm800087f8f.69.2024.10.25.00.30.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 00:30:48 -0700 (PDT)
Date: Fri, 25 Oct 2024 10:30:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Alex Lanzano <lanzano.alex@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH next] drm/sharp-memory: Fix some checks in
 sharp_memory_probe()
Message-ID: <3c078224-071e-4dd9-bf8d-51dbd0f2a9b2@stanley.mountain>
References: <0d307349-c141-49ee-8b34-67caf5f8b638@stanley.mountain>
 <hojly7qagyszxbgonzqmuuxucdfqwovrjyiktdxpibku6yodum@n7algnce2tts>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <hojly7qagyszxbgonzqmuuxucdfqwovrjyiktdxpibku6yodum@n7algnce2tts>
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

On Thu, Oct 24, 2024 at 11:08:05PM +0200, Uwe Kleine-König wrote:
> On Wed, Oct 23, 2024 at 11:30:31AM +0300, Dan Carpenter wrote:
> > The devm_drm_dev_alloc() function returns error pointers, it never
> > returns NULL.  Change that check to IS_ERR().
> > 
> > The devm_gpiod_get_optional() function returns a mix of error pointers
> > if there is an error, or NULL if there is no GPIO assigned.  Add a check
> > for error pointers.
> > 
> > Fixes: b8f9f21716fe ("drm/tiny: Add driver for Sharp Memory LCD")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >  drivers/gpu/drm/tiny/sharp-memory.c | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
> > index 2d2315bd6aef..1bcdd79166a4 100644
> > --- a/drivers/gpu/drm/tiny/sharp-memory.c
> > +++ b/drivers/gpu/drm/tiny/sharp-memory.c
> > @@ -543,8 +543,8 @@ static int sharp_memory_probe(struct spi_device *spi)
> >  
> >  	smd = devm_drm_dev_alloc(dev, &sharp_memory_drm_driver,
> >  				 struct sharp_memory_device, drm);
> > -	if (!smd)
> > -		return -ENOMEM;
> > +	if (IS_ERR(smd))
> > +		return PTR_ERR(smd);
> >  
> >  	spi_set_drvdata(spi, smd);
> >  
> > @@ -555,6 +555,8 @@ static int sharp_memory_probe(struct spi_device *spi)
> >  		return dev_err_probe(dev, ret, "Failed to initialize drm config\n");
> >  
> >  	smd->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
> > +	if (IS_ERR(smd->enable_gpio))
> > +		return PTR_ERR(smd->enable_gpio);
> >  	if (!smd->enable_gpio)
> >  		dev_warn(dev, "Enable gpio not defined\n");
> 
> Use dev_err_probe() instead of plain returns?
> 

Sure.  Let me resend.

regards,
dan carpenter

