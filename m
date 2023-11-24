Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BC77F721A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 11:52:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92EE910E050;
	Fri, 24 Nov 2023 10:52:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC18110E050
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:52:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A4EA8CE28D5;
 Fri, 24 Nov 2023 10:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F995C433C7;
 Fri, 24 Nov 2023 10:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700823168;
 bh=eEX4tBGuafbo1X94/+okj0mvehs96kjdE/PmoG3Gt40=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TWNnJzORCs/6+M4b46F3hx+3/IWccwtPeWfYeltqWKFXDpcpipaQX9WAyRPio/iW6
 dT7asdlQ3YGaL9ZhZNAVMAD9vf/Fm2tpYAc2Dw81kZZhSy6eh8qdMsHWVpJKS8rKW8
 LrHBjfrRHBcy1epv3XqKr/bPIt+6Kh6H9aCeWD2WuVvvOGe3++GJYZyUXzes3/oYgV
 hwwvDOXJ01mgZjRMHRXdl9+iiry6ZbL+Hg3hwJTmi8BAYefWUqLBrz/qGPQILpO3Wi
 ss2kaIOsVnHMNP3NwswRovinHhmhs/biEjG9PYb2zfXRKnAy6DclYLFrxrPz0SqG4e
 COia8kKbBFP2A==
Date: Fri, 24 Nov 2023 11:52:46 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 11/12] DONOTMERGE: arm64: meson: khadas-vim3l: add DSI
 panel
Message-ID: <bn5tpzvohmgac4m46fruxbi6quja624tm2fefyj7f3ngo3enno@2ueiodd6qxbd>
References: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-0-95256ed139e6@linaro.org>
 <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-11-95256ed139e6@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4j755csbj5bgclkr"
Content-Disposition: inline
In-Reply-To: <20231124-amlogic-v6-4-upstream-dsi-ccf-vim3-v9-11-95256ed139e6@linaro.org>
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
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>, linux-clk@vger.kernel.org,
 Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jagan Teki <jagan@amarulasolutions.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Remi Pommarel <repk@triplefau.lt>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4j755csbj5bgclkr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 24, 2023 at 09:41:22AM +0100, Neil Armstrong wrote:
> This add nodes to support the Khadas TS050 panel on the
> Khadas VIM3 & VIM3L boards.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../boot/dts/amlogic/meson-g12b-khadas-vim3.dtsi   |  2 +-
>  arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi | 74 ++++++++++++++++=
++++++
>  .../boot/dts/amlogic/meson-sm1-khadas-vim3l.dts    |  2 +-
>  3 files changed, 76 insertions(+), 2 deletions(-)

Generally, those kind of patches still have value. Now that we are
accepting overlays, could this be converted to one and merged maybe?

Maxime

--4j755csbj5bgclkr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWCAfgAKCRDj7w1vZxhR
xS+jAQDMt1rk04cC2Xg84EGUExSHFlcX9BTotBbFO5Zv9W4P/AD+PP2oNqHk906G
kwuJWtCVvyW0H04jWPVuknzUNcmmiQs=
=YClS
-----END PGP SIGNATURE-----

--4j755csbj5bgclkr--
