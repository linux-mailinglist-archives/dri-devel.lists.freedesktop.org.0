Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A2F90D391
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 16:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C658910E0C2;
	Tue, 18 Jun 2024 14:08:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VZVNtlQw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 292BB10E695
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2024 14:08:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 787B2CE1B5A;
 Tue, 18 Jun 2024 14:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20EA3C3277B;
 Tue, 18 Jun 2024 14:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718719689;
 bh=e+HSLddOkm2/Sj6Zn5jFRLDHmKKgRXjOeFGjF2yjM4U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VZVNtlQwjcTmZjYMMCZ1ePxskEKgtoJOhbQLImw252VXz8mEaDd+XWr5Ks92lHsae
 SAi+wlOnNFUeaEipg8JFoItdvbIyZD/7xSMhxz379HThnTOip3guJJslNRCSb2b59c
 M3NDhZZX2JRHRUBe5PGZhRnOrgPM92bUdGtwrBnRT3arEAlgTlQF0TD3WzFK6JzMXO
 ye56tndYgPkkCTJgkqaYx9SwAOZfzeWtFhBP4b4O4xgY/LEAFnPsprFuxME49hXGVW
 fdSCMjNYckIflyycYVbGDPl5k8RxGISdtdkI1MEusJ3g/hksNtF2FhzLoC8JzVuQZL
 eAcIhE0INBVhA==
Date: Tue, 18 Jun 2024 15:08:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Dzmitry Sankouski <dsankouski@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Pavel Machek <pavel@ucw.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Chanwoo Choi <cw00.choi@samsung.com>, phone-devel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-input@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 18/23] regulator: add s2dos05 regulator support
Message-ID: <4eab619f-6da9-4aff-b956-69d8e2ecd47f@sirena.org.uk>
References: <20240618-starqltechn_integration_upstream-v3-0-e3f6662017ac@gmail.com>
 <20240618-starqltechn_integration_upstream-v3-18-e3f6662017ac@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QRV+Pq6HQyJzYjJF"
Content-Disposition: inline
In-Reply-To: <20240618-starqltechn_integration_upstream-v3-18-e3f6662017ac@gmail.com>
X-Cookie: If you can read this, you're too close.
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


--QRV+Pq6HQyJzYjJF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2024 at 04:59:52PM +0300, Dzmitry Sankouski wrote:

> index 000000000000..3c58a1bd2262
> --- /dev/null
> +++ b/drivers/regulator/s2dos05-regulator.c
> @@ -0,0 +1,362 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * s2dos05.c - Regulator driver for the Samsung s2dos05
> + *

Please make the entire comment a C++ one so things look more
intentional.

> +static int s2m_enable(struct regulator_dev *rdev)
> +{
> +	struct s2dos05_data *info = rdev_get_drvdata(rdev);
> +	struct regmap *regmap = info->regmap;
> +
> +	return regmap_update_bits(regmap, rdev->desc->enable_reg,
> +				  rdev->desc->enable_mask,
> +					rdev->desc->enable_mask);
> +}

Please use the generic regmap helpers rather than open coding them.

> +	reg_np = of_get_child_by_name(dev->parent->of_node, "regulators");
> +	if (!reg_np) {
> +		dev_err(dev, "could not find regulators sub-node\n");
> +		return -EINVAL;
> +	}
> +
> +	err = of_regulator_match(dev, reg_np, rdata, rdev_num);
> +	of_node_put(reg_np);

Use of_match for this rather than open coding.

> +	s2dos05 = devm_kzalloc(dev, sizeof(struct s2dos05_data),
> +				GFP_KERNEL);

> +	rdata = kcalloc(rdev_num, sizeof(*rdata), GFP_KERNEL);
> +	if (!rdata)
> +		return -ENOMEM;

Mixing devm_ and regular allocations seems likely to go wrong, please be
consistent.

--QRV+Pq6HQyJzYjJF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZxlL8ACgkQJNaLcl1U
h9BUoQf/eoepXVUUG5VxOIXF3ILdV3eQfuvpBzl2rvMupKg2phY9zGdjfvGb2TUK
OtJF5QmEZoR/bJws+dbUekyyTCUORDrragOz9+cX9RmKfWUVocq3aClTAAUUXCJQ
LNyP0RdsbLYS6+BSXQH5cBzgYjq1cjA+Cj+tKb/henUbQbI6snEcUyYTVgtyetJl
fBLrkaotq7CZeAUroZ95qFtToQSCn7IpzU+Z9ObxIlYdiycoicJwOTmro3Q2JMqW
ySuBH/s2hBHnLi34G6JUIM94j406/nm3wQMn+7Zdw+KnGz1gOxAjFZW3s0lNi7be
lgGIGtE0qxquHQw9TITrSQl2iXbZaA==
=y3Sn
-----END PGP SIGNATURE-----

--QRV+Pq6HQyJzYjJF--
