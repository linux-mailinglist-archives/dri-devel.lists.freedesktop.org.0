Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCED19867FE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 23:07:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44AEE10EA69;
	Wed, 25 Sep 2024 21:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pHG4hJ1t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A60710EA6A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 21:07:05 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42e5e758093so2153165e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 14:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1727298424; x=1727903224;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=1eUf1b5sBeEa+R24gGQ9aEEgDksXQ+YlPL6/W/duLKU=;
 b=pHG4hJ1taoRiuvkcPTmtC269qM9axUs4b51uRgevZYksFlnehg6+iOloMQ20bGZ2PX
 f9f6RCx0dN7UQGoacUPB33V337lj8NYEq7gftOWIBBRZYLEhbVemR61VLod7ZQL+sQBf
 0+m9Znq+BwQ3WiDtq2xI5uLYUDrhL/zmDl+4uZlHms4iz4ZLIzvY+KjS5U1iCDpwNGfy
 7oZKnoDmp/bb11AM3skiXRpGd5Gcq1qpvNoygcsKiPh8uOzemsnVJM8HzrAQurp7ikJh
 3HJxcbfVxRB0OvpBttMwd535X4LeHfRUQNH9nBavohGEg/dDSxzoDJELrztaSvivCGth
 4xQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727298424; x=1727903224;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1eUf1b5sBeEa+R24gGQ9aEEgDksXQ+YlPL6/W/duLKU=;
 b=LMPL5VtsUOoH0ExuRE5z4SJS5oQ3By7WCGUkb/PmnZlNV+NfgJxLZXqqFPYaOyieYQ
 +116szY6+ljRcwpyUvzNv3Gq1uYk99TktmjhzcyWTpVzr6oXvBZmZaCBoW4/owO1Vk9K
 S8DSiiQdpVDZ+J5M3SuRdKdm99iTK7S6zq50UCYqyvmUy8yzi9rdFEEQidJ0vVRQH4k1
 HiCLzSaCcbI92iJ+VwBBUNBUOI0h1SLeiGEFZ7Tl62gasc28AQbIzmwccx3iAPP5Md3b
 yj37tkj+e/KQnQqR0zGISpYZ7aRhy3z4c3s2/f430xN4YXbTD5zEQp2KDfzMmKh/uwiQ
 8TdQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0LJ3sROWkyQ1fEiCaMomuC93S3mSRHQJ57arD86kDWAC4SpJEXuyL2mrccgnPDBJZ2W9ehtNdhmU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJWaa68jmj+NvugQ3I0ZAmEL4TtJWO2il2gkTY4O1vU8WcOvEy
 b82G+g0XoTgaGulfNMDhKN4tF8/XBaTAd39HguiXxWViEn3PIJO8quRJr/lHjkw=
X-Google-Smtp-Source: AGHT+IHDoFkGKB1bUmLWhLANh/i/kng9W0x9TR8bISvn6Efb45zS2dgcqducbkWBM86Lea49/HxWBA==
X-Received: by 2002:a5d:6c61:0:b0:371:9360:c4a8 with SMTP id
 ffacd0b85a97d-37cc246702cmr3213015f8f.6.1727298423544; 
 Wed, 25 Sep 2024 14:07:03 -0700 (PDT)
Received: from localhost (lfbn-nic-1-357-249.w90-116.abo.wanadoo.fr.
 [90.116.189.249]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37cbc2cec21sm4796837f8f.52.2024.09.25.14.07.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2024 14:07:02 -0700 (PDT)
Date: Wed, 25 Sep 2024 23:07:00 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Mehdi Djait <mehdi.djait@bootlin.com>, christophe.jaillet@wanadoo.fr,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org
Subject: Re: [PATCH v6 2/2] drm/tiny: Add driver for Sharp Memory LCD
Message-ID: <q2njnpzpkd3xrrv6icr5wq6uztja3wfmy2x2ldreqemzbwkedv@ixywmn7qy34q>
References: <20240905124432.834831-1-lanzano.alex@gmail.com>
 <20240905124432.834831-3-lanzano.alex@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gufllnff6auc6cvc"
Content-Disposition: inline
In-Reply-To: <20240905124432.834831-3-lanzano.alex@gmail.com>
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


--gufllnff6auc6cvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello,

On Thu, Sep 05, 2024 at 08:44:00AM -0400, Alex Lanzano wrote:
> +static void sharp_memory_crtc_enable(struct drm_crtc *crtc,
> +				     struct drm_atomic_state *state)
> +{
> +	struct pwm_state pwm_state;
> +	struct sharp_memory_device *smd = drm_to_sharp_memory_device(crtc->dev);
> +
> +	sharp_memory_clear_display(smd);
> +
> +	if (smd->enable_gpio)
> +		gpiod_set_value(smd->enable_gpio, 1);
> +
> +	switch (smd->vcom_mode) {
> +	case SHARP_MEMORY_SOFTWARE_VCOM:
> +		smd->sw_vcom_signal = kthread_run(sharp_memory_sw_vcom_signal_thread,
> +						  smd, "sw_vcom_signal");
> +		break;
> +
> +	case SHARP_MEMORY_EXTERNAL_VCOM:
> +		break;
> +
> +	case SHARP_MEMORY_PWM_VCOM:
> +		pwm_get_state(smd->pwm_vcom_signal, &pwm_state);

I'd prefer using pwm_init_state() here instead of pwm_get_state(), The
former only depends on machine description (probably device tree), the
latter depends on what happend before to the PWM. While it probably
doesn't make a difference in practise, the former is more deterministic.

> +		pwm_state.period =    1000000000;
> +		pwm_state.duty_cycle = 100000000;

Unusual indention.

The device tree (and also ACPI) defines a default period for a PWM. If
you used pwm_init_state() -- as suggested above -- you could just use
pwm_set_relative_duty_cycle(smd->pwm_vcom_signal, 1, 10); here.

> +		pwm_state.enabled = true;
> +		pwm_apply_might_sleep(smd->pwm_vcom_signal, &pwm_state);
> +		break;
> +	}
> +}
> +
> +static void sharp_memory_crtc_disable(struct drm_crtc *crtc,
> +				      struct drm_atomic_state *state)
> +{
> +	struct sharp_memory_device *smd = drm_to_sharp_memory_device(crtc->dev);
> +
> +	sharp_memory_clear_display(smd);
> +
> +	if (smd->enable_gpio)
> +		gpiod_set_value(smd->enable_gpio, 0);
> +
> +	switch (smd->vcom_mode) {
> +	case SHARP_MEMORY_SOFTWARE_VCOM:
> +		kthread_stop(smd->sw_vcom_signal);
> +		break;
> +
> +	case SHARP_MEMORY_EXTERNAL_VCOM:
> +		break;
> +
> +	case SHARP_MEMORY_PWM_VCOM:
> +		pwm_disable(smd->pwm_vcom_signal);

What is the objective here? Do you want to save energy and don't care
about the output? Or do you want the PWM to emit the inactive level?
Note that for the second case, pwm_disable() is wrong, as depending on
the underlying hardware the PWM might continue to toggle or emit a
constant active level.

> +		break;
> +	}
> +}
> +
> [...]
> +
> +static int sharp_memory_init_pwm_vcom_signal(struct sharp_memory_device *smd)
> +{
> +	struct pwm_state state;
> +	struct device *dev = &smd->spi->dev;
> +
> +	smd->pwm_vcom_signal = devm_pwm_get(dev, NULL);
> +	if (IS_ERR(smd->pwm_vcom_signal))
> +		return dev_err_probe(dev, -EINVAL, "Could not get pwm device\n");
> +
> +	pwm_init_state(smd->pwm_vcom_signal, &state);
> +	state.enabled = false;
> +	pwm_apply_might_sleep(smd->pwm_vcom_signal, &state);

Same question as above. If you care about the output level, use

	{
		.period = ...,
		.duty_cycle = 0,
		.enabled = true,
	}

> +
> +	return 0;
> +}

Best regards
Uwe

--gufllnff6auc6cvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmb0e1oACgkQj4D7WH0S
/k68sgf+KYIiaD1KzjAI6h4LyzOtgTo4g9sAIrf/9XEfC8Ym5WDznk4zxlf18J2J
jfvTI4VtUF6UvCcEQASWeyHcRnhLnWFa0ZL+qGcMNb+vkXkQcFtToUPA8urOSGM7
KeXUFqbrZ9S3u3TKtBJ5NJRbyu+AtU7W/VQn2FVf8AUPuzuJpltmw7YfWdbHgG6H
QZUlQzzAIqtD+MVMp2r3zWFQXiIdoBVtahQMv672eU10Fx+wRiwgL10swYM6MWKd
uNK998JsuZV24+I8w/2gNAprjRl+0cI5k4v0oS4hoV97m3+7+3KBQsWZW8sp+oSY
lZPkNJXisBhHLM+yBvp5M3FJWULTaQ==
=MZIJ
-----END PGP SIGNATURE-----

--gufllnff6auc6cvc--
