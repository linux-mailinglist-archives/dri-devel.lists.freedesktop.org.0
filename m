Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 728947F769D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 15:42:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9C110E223;
	Fri, 24 Nov 2023 14:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DBC110E0F8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 14:41:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id C5119B830EA;
 Fri, 24 Nov 2023 14:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6B4C433CB;
 Fri, 24 Nov 2023 14:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700836911;
 bh=sN2GV7ooCULXSqP4A45dgDJT99C/q8vC8n4JoqkQwkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tZlkN8TCzfmvQw+zzZzoOpOxWzQXubQmb+3KG6Pfqe6wOFk8DbHTn9r34srQLIBus
 +o2w6oBIEL2mjiwOjv0VeYMAp5wGtsfFjUkiw33gECaIJG5pcIV325wWOFM7uG03JI
 I9naTpaw78L/lfvDeYQT4Zg595YZXDZrCdsmCawd7Ej3YHUVAjUnpbQkzjy0iOVapE
 dzR3++E+TIqzu6LQo1qQxiRLZm1K1w/3o8hYpUzKgtg2TGzQssQQYd11Amp37xOs7a
 vA4DjYXZ/raNg4NI1JTeWa69+CkHTGEiuTWccZi0yl5rg7GPlGkQF4buv3e58zYSND
 CbXINWXgZKFGQ==
Date: Fri, 24 Nov 2023 14:41:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 04/12] dt-bindings: phy:
 amlogic,g12a-mipi-dphy-analog: drop unneeded reg property and example
Message-ID: <20231124-vowel-reversing-619f7c4e5060@spud>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-4-95256ed139e6@linaro.org>
 <20231124-felt-tip-everybody-f2a6836e52af@spud>
 <c3a07912-07da-4965-94b8-3c0d8889ddc4@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="xgsO/76B+uGPTN6M"
Content-Disposition: inline
In-Reply-To: <c3a07912-07da-4965-94b8-3c0d8889ddc4@linaro.org>
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Ripard <mripard@kernel.org>, Remi Pommarel <repk@triplefau.lt>,
 linux-amlogic@lists.infradead.org, Nicolas Belin <nbelin@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--xgsO/76B+uGPTN6M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 02:50:58PM +0100, Neil Armstrong wrote:
> Hi Conor,
>=20
> On 24/11/2023 13:36, Conor Dooley wrote:
> > On Fri, Nov 24, 2023 at 09:41:15AM +0100, Neil Armstrong wrote:
> > > The amlogic,g12a-mipi-dphy-analog is a feature of the simple-mfd
> > > amlogic,meson-axg-hhi-sysctrl system control register zone which is an
> > > intermixed registers zone, thus it's very hard to define clear ranges=
 for
> > > each SoC controlled features even if possible.
> > >=20
> > > The amlogic,g12a-mipi-dphy-analog was wrongly documented as an indepe=
ndent
> > > register range, which is not the reality, thus fix the bindings by dr=
opping
> > > the reg property now it's referred from amlogic,meson-gx-hhi-sysctrl.=
yaml
> > > and documented as a subnode of amlogic,meson-axg-hhi-sysctrl.
> > >=20
> > > Also drop the unnecessary example, the top level bindings example sho=
uld
> > > be enough.
> > >=20
> > > Fixes: 76ab79f9726c ("dt-bindings: phy: add Amlogic G12A Analog MIPI =
D-PHY bindings")
> > > Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> >=20
> > I feel like I left a tag on this one before, but I can't remember.
> > Perhaps I missed the conclusion to the discussion to the discussion with
> > Rob about whether having "reg" was desirable that lead to a tag being
> > dropped?
>=20
> I checked again and nope, not tag, but Rob's question was legitimate and =
I reworded
> and clarified the commit message following your reviews.
> On the other side you suggested a Fixes tag, which I added.
>=20
> The rewording is about why reg doesn't make sense on the nature of the me=
mory
> region and it doesn't make sense here like other similar nodes.

Okay, I thought that I had given you one. Perhaps I forgot to send, or
Rob's message came in between me asking about the Fixes tag & replying
with an Ack. Sorry about that,
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--xgsO/76B+uGPTN6M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWC2JwAKCRB4tDGHoIJi
0rfLAQCNolGZjIZg5rXxw9C1OMazRjRDdxd0RzNgb5+TM66JZQD8CbqSE3MjrSJn
SkJrWLo0HrWEEIlIb569LlFJT5w6QQ0=
=UnJl
-----END PGP SIGNATURE-----

--xgsO/76B+uGPTN6M--
