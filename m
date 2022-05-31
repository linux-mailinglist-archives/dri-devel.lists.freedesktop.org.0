Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 946B55390F0
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 14:41:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331DA112836;
	Tue, 31 May 2022 12:41:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C92EE112823
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 12:41:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 64482611EA;
 Tue, 31 May 2022 12:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D415C385A9;
 Tue, 31 May 2022 12:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654000905;
 bh=50k5P2deod6KO8gvHsZ0qJej+m44dwOkD8HE8Gg5bjs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MO2bw7bbdUFxvvki8bhZ3MgawmrbJZNY4ep7dcTpbtkPkBrD1hNo20l60DI3T7Oj1
 nlEdkpQz4meR1xf1XIYnfpCEfnmw3hcFzO7dSl+AV566wl8NggjS3iS6AJi7CzsMZX
 AN27nByTMKymlcyySqfBAbf2gzy8zhdHvemoux4FVUEYrqpGuxQI+T7JGhU0N6HVrH
 foWmceq2jqtCybmNYuVDwkPIWVeUhAcJAKqePfeEoG7aeHhOX0vJwnz4IPCq6XRJS0
 Qh7pYiaRubz31TiwxkjXegOnMv4Tyt7uBHh0AoRxhnqbluKjyV3pK5BlOng75mJBSN
 FCgiuBVpURnIQ==
Date: Tue, 31 May 2022 14:41:42 +0200
From: Mark Brown <broonie@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Subject: Re: [PATCH 03/14] regulator: mt6370: Add mt6370 DisplayBias and
 VibLDO support
Message-ID: <YpYNBo90NETXtjkV@sirena.org.uk>
References: <20220531102809.11976-1-peterwu.pub@gmail.com>
 <20220531102809.11976-4-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hl22OOkO/wMChZ8B"
Content-Disposition: inline
In-Reply-To: <20220531102809.11976-4-peterwu.pub@gmail.com>
X-Cookie: May your camel be as swift as the wind.
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, cy_huang@richtek.com, pavel@ucw.cz, lee.jones@linaro.org,
 linux-leds@vger.kernel.org, daniel.thompson@linaro.org, deller@gmx.de,
 chunfeng.yun@mediatek.com, linux@roeck-us.net, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, chiaen_wu@richtek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--hl22OOkO/wMChZ8B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2022 at 06:27:58PM +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
>=20
> Add mt6370 DisplayBias and VibLDO support.

Other than one small thing this looks nice and clean:

> +	enable_gpio =3D fwnode_gpiod_get_index(of_fwnode_handle(np), "enable", =
0,
> +					     GPIOD_OUT_HIGH |
> +					     GPIOD_FLAGS_BIT_NONEXCLUSIVE,
> +					     desc->name);
> +	if (IS_ERR(enable_gpio)) {
> +		config->ena_gpiod =3D NULL;
> +		return 0;
> +	}

Please just use the OF APIs - due to ACPI's handling of power for
devices the regulator API OF bindings can't be used sensibly on
ACPI so it's better to explicitly work on DT only.  This won't
actually cause problems here but it's a bit clearer.

--hl22OOkO/wMChZ8B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmKWDQUACgkQJNaLcl1U
h9CrHwf/Xn0rciY/VlcVjndWUL/zYX17wRyxPAwxx/DOq/VCeystayvT4671ML/1
6h5ZE7pKGSzHQjyt8x3BXHDAvn0EW5KNrc+lwBTQDrhiE7hbKcXb0cChQBvcM4KJ
m2ETTDdgNoBEkUQwj40OnrL/DIw7NpILWAOaoB+gGwelfj4Lu8LxTcZsRQqdwAGN
Q4lC4mPkae3NP0+tc82DyjtHytJPaX5jCPML4AofpFKs6A95yGyKlARdDgQqVVXP
sbKZA93RwgxZDSH0pxXBaKCBTEwOIjIl5qXbk0OXyvnopAYvVGVe6oFgutC2MPqa
joJC6sXurZO+wFB9H9tlKwq9Au8AOQ==
=WP6+
-----END PGP SIGNATURE-----

--hl22OOkO/wMChZ8B--
