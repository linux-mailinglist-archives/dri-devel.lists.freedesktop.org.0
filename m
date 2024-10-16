Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A859A0578
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 11:27:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DB510E6D5;
	Wed, 16 Oct 2024 09:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="R1uRfPS3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81ADD10E6D5
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 09:27:39 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a9a3da96a8aso71880666b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 02:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729070858; x=1729675658;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=xkTWYiGZQ+keiIE1fDd/NGylZkJ/o8QzKwt0lHenVNU=;
 b=R1uRfPS35OprcqO97aFq4Pax6+wD2xNU3seLZL+TcZazNnn/BCAC5R7zKxTzmZTL2R
 FpI1tGlUNl2cbZWJTjZFZNjXOJLMEg88OiMll7Vk62hBUQRZLOauqZjqHh3ufEqfi1zT
 k8olRTWLWU/52jkGIYIrWqn5nFj27yV/U49sPuy8ZMngyhcCDiDVbr0+ppW+QoXdwAaC
 utrtdHKeO6o9x/NKQB8oREDfl8RbpZkbU8V37tP1rdyE4dSY2LN/gQlmIBm/Ejjq/vVP
 SFr7mEvvzkTRk1tXbUPhydKQpcMuCZjcQ7yb+iidbzCeQ1oDCaxZCtMnLjCDDodtJsg3
 BZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729070858; x=1729675658;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xkTWYiGZQ+keiIE1fDd/NGylZkJ/o8QzKwt0lHenVNU=;
 b=C+ByTMz90iM2qDOBzdI2R1InuRPWgTd36rq7nMcdhn3qw+yOgG2sv6X0vBpjGaS09F
 tzGGP9LwAgxk0ExrsfPI8SEiEgS73ltod98Nb4cXA+xpcpsM7gVqqULKLl6XaKaXGZBc
 vWXry5l7LQ7Di6JfD5HAraT6CB9G81RyzB2vT68WFfg9sGenx2Fm1tFoTDJwS0ygPyyV
 aGtg2zD7+L6uwmUj+bkuFXSQ1dsmSpn8X0S60LJtXYM7dcP8IOeDSH2qMtpYof5axrmw
 hFOPwDjvmjQQjBB0ODv0JTaerGtpOfmll1QtwZsfU4V6o//YjDqi0bFw5HT9KigoDf3x
 xT7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4mfRg6alqeFeMAO4RgPG9SBZNhqJnr5ZhQsXHw7IL6Havj7MYvtc99v+MrAZYS4QbWqhGkd+RqLQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywf0vN4mbJU2R0U2h7RJ6qsqEJExmQEn3pIAiEGrkncAlTgaUKz
 dvw9RMhXqpyPJ3OCNltt+NAK7hTQIkkQq4jzWh/pJaJteSfDf+tbqp+mtqieiCg=
X-Google-Smtp-Source: AGHT+IHsN4Gvg9FXmit1XET1Omd/eAaw9Bqv6hVqc+m9T0ybnBbiCdCdwTlYq6+4D4QNBZh5AvCM+Q==
X-Received: by 2002:a17:907:7da6:b0:a99:5687:496 with SMTP id
 a640c23a62f3a-a9a3370fc51mr241819266b.30.1729070857783; 
 Wed, 16 Oct 2024 02:27:37 -0700 (PDT)
Received: from localhost
 (p200300f65f19e3002f38cf427133ca7b.dip0.t-ipconnect.de.
 [2003:f6:5f19:e300:2f38:cf42:7133:ca7b])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a29844cc9sm160331866b.182.2024.10.16.02.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Oct 2024 02:27:37 -0700 (PDT)
Date: Wed, 16 Oct 2024 11:27:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
 Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Yao <markyao0591@gmail.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, 
 kernel@collabora.com, Alexandre ARNOUD <aarnoud@me.com>, 
 Luis de Arquer <ldearquer@gmail.com>, Algea Cao <algea.cao@rock-chips.com>
Subject: Re: [PATCH v9 3/3] drm/rockchip: Add basic RK3588 HDMI output support
Message-ID: <3wjk75z2ozz2lg7qx6by3phjoe2brov6rz4jezpowrreedjua6@wt2js5hzqqdi>
References: <20241010-b4-rk3588-bridge-upstream-v9-0-68c47dde0410@collabora.com>
 <20241010-b4-rk3588-bridge-upstream-v9-3-68c47dde0410@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="kxr7txtbzz25ydaa"
Content-Disposition: inline
In-Reply-To: <20241010-b4-rk3588-bridge-upstream-v9-3-68c47dde0410@collabora.com>
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


--kxr7txtbzz25ydaa
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v9 3/3] drm/rockchip: Add basic RK3588 HDMI output support
MIME-Version: 1.0

Hello,

On Thu, Oct 10, 2024 at 01:40:51AM +0300, Cristian Ciocaltea wrote:
> +struct platform_driver dw_hdmi_qp_rockchip_pltfm_driver = {
> +	.probe  = dw_hdmi_qp_rockchip_probe,
> +	.remove_new = dw_hdmi_qp_rockchip_remove,
> +	.driver = {
> +		.name = "dwhdmiqp-rockchip",
> +		.pm = &dw_hdmi_qp_rockchip_pm,
> +		.of_match_table = dw_hdmi_qp_rockchip_dt_ids,
> +	},
> +};

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers. Please just drop "_new".

Additionally I suggest to drop one of the white spaces between .probe
and =.

Best regards
Uwe

--kxr7txtbzz25ydaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmcPhwUACgkQj4D7WH0S
/k711wf8DoNI0nAJrwWSlZ6jh7cUNs9hFjDKDxrrmJWOmI/UNFwavdEYgYH50Gwd
0g2uYmZW7C9N3fJlT4+gYj9ReVz3+SEPGgrgp8NFdoyAvrqx1pbJ9WRX9Oo5X48J
jEm0/qX2zpy6mUD9EMbU8SbckuNB7WtlsKF/ruOFztTR+ieEe3WEpmRVZfBrWUyH
OMC2rev1TYtyQT3hN0fG8lbee3IMRjopaFXRNZEq9wHLYgienLj6eheiEm51gb5x
PeXUp+b+wQnUTWOoX1POE07IjfK0oUDvhOLIP74zGPwXeOCpMidZQeHjTtIq2gYM
d/mVwN0enReCIbhebaBqmfP4cd3vTQ==
=REG3
-----END PGP SIGNATURE-----

--kxr7txtbzz25ydaa--
