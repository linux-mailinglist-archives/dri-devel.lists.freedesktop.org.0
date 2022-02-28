Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 161034C7D0B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 23:09:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E28DD10E5F2;
	Mon, 28 Feb 2022 22:09:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBAD410E5F2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 22:09:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3F5AEB8169A;
 Mon, 28 Feb 2022 22:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D10FC340EE;
 Mon, 28 Feb 2022 22:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646086180;
 bh=C3m4pnnTAF+o+8Z+tsT22TMwOAoIvmDl7rQIHuiLdMA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BdRbVBZNF8SyrlpXKAsHjo1A6k3f944Uzsh5hy2UmK5ywn8cPtoiWatoTWpomjQzc
 x44Jv7/Wzxo8T+fSgsmyLRYgbKXOQkqEy86p/ln+HE5A679Zvs+XoyM7aJWc8wSHt6
 ACqagutJzp7I7JrJGyMxpDRREGY/HUyTANKgF4FJ/99jkm+o2X+/pda0xDuvY8MbdY
 Sv4Zfi/zQD1hFPf6GsOnP6lA5hiuplekt76UNCcR1YonNLI47HOJfCmRDkLAT1NcBE
 yuQHyRRcOkNLJGUq9zBF6RREf+bF8FScygNYfOz5OBENPb041Vfalb0bt696k7uf4U
 g+dDDXgOJFcHA==
Date: Mon, 28 Feb 2022 22:09:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: Another pass removing cases of 'allOf'
 containing a '$ref'
Message-ID: <Yh1IG9daOUOB52rf@sirena.org.uk>
References: <20220228213802.1639658-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xC2AwCckB4yHmCdp"
Content-Disposition: inline
In-Reply-To: <20220228213802.1639658-1-robh@kernel.org>
X-Cookie: Killing turkeys causes winter.
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
Cc: alsa-devel@alsa-project.org, linux-usb@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sre@kernel.org>, linux-phy@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Pavel Machek <pavel@ucw.cz>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Guenter Roeck <groeck@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 linux-leds@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Richard Weinberger <richard@nod.at>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-kernel@lists.infradead.org,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xC2AwCckB4yHmCdp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 03:38:02PM -0600, Rob Herring wrote:
> Another pass at removing unnecessary use of 'allOf' with a '$ref'.
>=20
> json-schema versions draft7 and earlier have a weird behavior in that
> any keywords combined with a '$ref' are ignored (silently). The correct
> form was to put a '$ref' under an 'allOf'. This behavior is now changed
> in the 2019-09 json-schema spec and '$ref' can be mixed with other
> keywords.

Acked-by: Mark Brown <broonie@kernel.org>

--xC2AwCckB4yHmCdp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmIdSBoACgkQJNaLcl1U
h9Brnwf9Gb7P9H3jku9OngoretGUxGN4DtDmr+0Bvk7ZZFkSIVQYVBROL0mmUfer
wPLiKHS48VJM6irhxRMqHLa1CrIeAmJHZpkg0R1JH1Iw36fWPZiBTfrDG8qubOti
l/cEx7Jmxoj2EtB8xcTpbYGqwOqSZtDkAz1smUIh3coKzArwCPjkAYE59GjQ28SS
F+P6ze1awYqRh/vkZC5ge03hrBhxOKU1iVyqv4iRfWtwCXRxYM3aPTs4aLB/T0NW
svINogVRgGsGVmY7gRufv1wI7bJle7+MP7byPwsqzx2AXthe0fYt3x457mV59wjc
Ej2pLNgE/IiOKyZ8gmWU8kkWHOh2hQ==
=Hxgn
-----END PGP SIGNATURE-----

--xC2AwCckB4yHmCdp--
