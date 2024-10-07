Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55064992630
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 09:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E90B10E317;
	Mon,  7 Oct 2024 07:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="t5XwghUt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B5A10E316
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 07:40:54 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-5c40aea5c40so8002324a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Oct 2024 00:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1728286853; x=1728891653;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=KWJKfNtCPiadgKKpV44m6e67/qtZJV5vu299cJKq5tw=;
 b=t5XwghUtfaesagkAdBWFxuLOGYgeoibI8UUqOkABUs9btcYFnaq5xj4hR8ZK7mjbkS
 fu9/aBtHp7jwWspp6VWeJIv2slDY0bq2w3S4H2I7r64IaZFf7hmntHZyjkgy58iQtyi/
 cMmGrHxdNQi+f2SfPIsmVjghFOO1w9ZZmC2cP0PUHjGuvBQCqfZmDyQacdd1zHQXRgzZ
 mXyhudX257h7WQQ0yqDpRfs2vljWrDDSm8/Y5A6moaQWFhKqOaQjzIXpI9VzFssx9Jiu
 cBA+U2uhZ9Jo+4x2xvjiOtlOH9//+PIO5gAHzKRRczH6i71+jm/lu26rojaFXRcxgB6H
 Srqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728286853; x=1728891653;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KWJKfNtCPiadgKKpV44m6e67/qtZJV5vu299cJKq5tw=;
 b=pHtZ/9/wqcWiieTjN+IR5fGdinhhGiRuVfipI22+yegjeS+Yor7mJLz6yyg8IZ4zuW
 /1+RvZ2RpTiK1o0Aoft1yUqNCBxDFhTVmvIsiql2YZwmsY5i6BQ5fSWkYxLU5HCuPwZM
 DotGglXI3no9teCyyyLHWeWSRCblnwk5lwQtyOts8aBzEdLqo+Qdhf6P4wfCdUN+jBOH
 4a2tdDKvCk4gXjbh8G0v0PhcdHKLKE5w2IK9pXlzHWYr/dXQPfbqzTewApeNl98GMdzP
 mZ2lcG6kYE8XO1JiMayrFbPquLppTnE2HbcJAQYbZ7JrIhyC1xr+RD+xWD/PpfdzFxdJ
 LP4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUupDd+5I5IQhlIshsqE0oWcrVBVAnX3uBD1WpgOsQMfRAvoWOAwk34Y5UZ2ZGZT7LGf0hrB0/2IHo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy9lupLaFQTG5iuP4V2wlFiIm2amcCMe3lP1j8ObP6XjBtgcbQJ
 v2krT98zPjO2Aemjd4W5ws4WjvXAYBYKW2T08XAxdtN5KemwY188kCad0OwwJTM=
X-Google-Smtp-Source: AGHT+IF//KDeerBcPYweQBWGXHGNK7a6K40VAoRzC9NTXizIxqpvNDX3VoTgSZDIg96mO42u95txWA==
X-Received: by 2002:a05:6402:510d:b0:5c8:81a6:f14c with SMTP id
 4fb4d7f45d1cf-5c8d2f3b9f3mr13100141a12.9.1728286853116; 
 Mon, 07 Oct 2024 00:40:53 -0700 (PDT)
Received: from localhost (p5dc68d3d.dip0.t-ipconnect.de. [93.198.141.61])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c8e05ac2casm2877129a12.34.2024.10.07.00.40.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 00:40:52 -0700 (PDT)
Date: Mon, 7 Oct 2024 09:40:51 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linuxfoundation.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v9 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <62sidvqna6q6s2dqzs6s7ftxwfyootptda6n4fww6tyjdwyhuh@ylifsc3f5ff6>
References: <20241007013036.3104877-1-lanzano.alex@gmail.com>
 <20241007013036.3104877-3-lanzano.alex@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bkeu5bpplnv4ln4m"
Content-Disposition: inline
In-Reply-To: <20241007013036.3104877-3-lanzano.alex@gmail.com>
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


--bkeu5bpplnv4ln4m
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Helo Alex,

On Sun, Oct 06, 2024 at 09:30:06PM -0400, Alex Lanzano wrote:
> +static int sharp_memory_init_pwm_vcom_signal(struct sharp_memory_device *smd)
> +{
> +	struct pwm_state pwm_state;
> +	struct device *dev = &smd->spi->dev;
> +
> +	smd->pwm_vcom_signal = devm_pwm_get(dev, NULL);
> +	if (IS_ERR(smd->pwm_vcom_signal))
> +		return dev_err_probe(dev, -EINVAL, "Could not get pwm device\n");

s/-EINVAL/PTR_ERR(smd->pwm_vcom_signal)/

> +	pwm_init_state(smd->pwm_vcom_signal, &pwm_state);
> +	pwm_set_relative_duty_cycle(&pwm_state, 1, 10);
> +	pwm_state.enabled = true;
> +	pwm_apply_might_sleep(smd->pwm_vcom_signal, &pwm_state);

Error checking for pwm_apply_might_sleep() please.

> +	return 0;
> +}
> [...]
> +	} else if (!strcmp("pwm", vcom_mode_str)) {
> +		smd->vcom_mode = SHARP_MEMORY_PWM_VCOM;
> +		ret = sharp_memory_init_pwm_vcom_signal(smd);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to initialize external COM signal\n");

sharp_memory_init_pwm_vcom_signal() already emits an error message, so you
have two here. One should be enough.

> +	} else {
> +		return dev_err_probe(dev, -EINVAL, "Invalid value set for vcom-mode\n");
> +	}
> [...]

Best regards
Uwe

--bkeu5bpplnv4ln4m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcDkIAACgkQj4D7WH0S
/k7h2gf/eEHlwAqR7oTCVvouxztY4+TYaE0xRY3n+Kwl1dNP692bNGSB5xz8llDm
fCpOvHstEF3v44e78Kk5+2E8ROCtMxYteMl+GvncKCFIjKyM4ECrPJOgudMqbCsy
+47UVwwNIVFfvCqc06oFOtHPwur4WTlaLM8OuAoblvtEZkPkzrWJM7vzRHv0Mmq0
l3Lg1qF5ham2OM1pJZCNE/IgFT+aIQW2K5Rp/XfiLjIGShVc8x4KtGhb8Dozk01Z
yzD4+rGlHSawPpJaKq7HYj+P9odCkgVo5oR1fd0RHWFPjgy4fB+V3Id04uava27X
0UFlrJ2BVl1u0cUjR/RZCDp7adKpxw==
=8rmd
-----END PGP SIGNATURE-----

--bkeu5bpplnv4ln4m--
