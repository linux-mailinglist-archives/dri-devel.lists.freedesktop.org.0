Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1BE8C9B5E
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 12:35:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CA8310E598;
	Mon, 20 May 2024 10:35:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EWyEbFOI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E2E010E598
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 10:35:20 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5238fe0cfc9so2399889e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 03:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716201318; x=1716806118; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=M77u76U61V3fpnwyE5H4HgvMa1z+7+KqGOKbDArh6qQ=;
 b=EWyEbFOIVyUKN7A+aB5IKCugk+NyhoKkesnGvO1bEwiL4bnUlCGuK/8eoI7yGTzJix
 UcoUGL+z5urifiKSJZXRRZmDrelAJXR2hNgvtdp6yn6rAIdIkJkCeAj6Y+jG5JTA+itj
 T27kQWx5BqyJdOM8DHQHoYlJAF7rAtiodfJ7yrm7JNNX9VGhEKolAKm3Jdoi6uqzLqse
 6CpNpJ1JFRCdGQOELtX8whjAr7k7V4zjCaRrWN0a/ucLo2m0ZlX0D8Zs9wDoh05wxEAo
 qIGVPYaEESZOwM7SZm1Q5rrk8jvRamYjeiGMfepfsoH0cqnvZdxA+LcfLaoJeB0El9KS
 +k7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716201318; x=1716806118;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M77u76U61V3fpnwyE5H4HgvMa1z+7+KqGOKbDArh6qQ=;
 b=g1f8JOKN/FbhH+yfkOIG+h9vtqoX3htxp87sxZOKAaO18vbkruGRmL+C/Go00CzCqx
 b/Upy3lPIFjTQhyjynFqQkMJbNNbJYLFVQnODKy7aU+J+R8YollMiD86GQBv2ZB1RVmQ
 50TjnnxMKr/DsnKR1H8MUc/PHl7IFT0Hw7OCQF0Pfv7GJz6rFZzL3VhE3g+VEFfn/xGf
 3MNchSJTkpm1SQSsPvAAmFm+3qmx7HVG1TyZ+Jp8z4DGuQBf4XtLA+Q1fXC6iYjYAeyz
 8QxUFjl8babh+Cw6rTjFw99189OlSQHA5Coc4hrHs7G8rc2rwn6hXpD9dBHYFKI7OzSd
 lL+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXESjoYe8E+nwL455VClRZ+eoO8d6tjlprYbDCVJ2H1Dgfiul1nPOChSpVsA2626SXjIS9WqSiR9xKPxDUq/HTT/UdeGkOAIXIaEHOsIVWJ
X-Gm-Message-State: AOJu0YzLBZ57chMhoRoaB9jlsjpMei0xjn8I1Ku2YWQdfvg+fOADZFzD
 HNFcOUpo+RwIilNW3M+ZAjEdgDAe5BylaenxcSvos+xtwkFemmYv8pvIye8n+l8=
X-Google-Smtp-Source: AGHT+IG1dvoxsmukaeX1Kus3eIdC+OT63ZQWkr780bFS2L/nBs/Nzh0vDkDrMOtn4xkRBwm8TrAffQ==
X-Received: by 2002:a05:6512:68e:b0:516:c97d:96b4 with SMTP id
 2adb3069b0e04-524079a8708mr2172995e87.2.1716201318383; 
 Mon, 20 May 2024 03:35:18 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52434ae5899sm524387e87.119.2024.05.20.03.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 May 2024 03:35:17 -0700 (PDT)
Date: Mon, 20 May 2024 13:35:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] drm/bridge: analogix: remove unused struct
 'bridge_init'
Message-ID: <la43b5ra7aziiv7dwt4o5zha3px7jarfmk45dwsf24qn6pgcre@pcmcsicjdrus>
References: <20240517232427.230709-1-linux@treblig.org>
 <6tfxkc3foarpfuo6viwmsm4e2ujxjmhpqsku37d4ov6ppufpjr@byrbjs7srqri>
 <ZkqAoG9ZGg0_dC-9@gallifrey>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZkqAoG9ZGg0_dC-9@gallifrey>
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

On Sun, May 19, 2024 at 10:43:44PM +0000, Dr. David Alan Gilbert wrote:
> * Dmitry Baryshkov (dmitry.baryshkov@linaro.org) wrote:
> > On Sat, May 18, 2024 at 12:24:27AM +0100, linux@treblig.org wrote:
> > > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > > 
> > > 'bridge_init' is unused, I think following:
> > > commit 6a1688ae8794 ("drm/bridge: ptn3460: Convert to I2C driver model")
> > > (which is where a git --follow finds it)
> > > Remove it.
> > 
> > Please rephrase the commit message following guidelines in
> > Documentation/process. Use Fixes tags if suitable.
> 
> I specifically don't want to use Fixes in these set because
> there's no need for someone to backport this to older
> kernels that use the original, and many backporters
> use 'Fixes' as an automated means to find stuff they should
> backport.
> 
> Other than that, is there something specific you think I've
> missed?

It's not about missing things. It's about a way it is written.
Consider something like:

The commit aaaaaaa ("drm/bridge: foo bar") has dropped all the users of
the struct bridge_init from the exynos_dp_core, while retainng unused
structure definition. Later on the driver was reworked and the
definition migrated to the analogix_dp driver. Remove unused struct
bridge_init definition.

> 
> (I'm also purposely being less certain here, because --follow
> is showing it in a ptn3460 and I don't quite follow
> why that changes it here).

The mentioned commit is a correct one. Historically exynos_dp_core had
been creating the ptn3460 bridge manually. Later on this was fixed in
the ptn3640 driver and the code was dropped from exynos_dp_core.

> 
> Dave
> 
> > 
> > > 
> > > Build tested.
> > > 
> > > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 5 -----
> > >  1 file changed, 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > index df9370e0ff23..1e03f3525a92 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> > > @@ -36,11 +36,6 @@
> > >  
> > >  static const bool verify_fast_training;
> > >  
> > > -struct bridge_init {
> > > -	struct i2c_client *client;
> > > -	struct device_node *node;
> > > -};
> > > -
> > >  static int analogix_dp_init_dp(struct analogix_dp_device *dp)
> > >  {
> > >  	int ret;
> > > -- 
> > > 2.45.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry
> -- 
>  -----Open up your eyes, open up your mind, open up your code -------   
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/

-- 
With best wishes
Dmitry
