Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C46716ACC
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 19:23:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710B810E00A;
	Tue, 30 May 2023 17:23:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984D110E00A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 17:23:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9047863114;
 Tue, 30 May 2023 17:23:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A21C433D2;
 Tue, 30 May 2023 17:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685467431;
 bh=UzR1fj++02HkyWwFEbtMSGXQjQFGcPmg+nk6CBoorTQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XRVqqSg7l3gtvrJQiZxWUs3sW3dpPsMZeLs0xK9uSL6mJjYdIfftdEHjGyAasA93F
 vp0gLpUnS8qcpk9a3/voHcP+fe0HcgZAQiKxsgSvam2RRuNhrt3VDiHL2skxmXmfz0
 UHgEUyQ6JGLAJM989kYc/NlVsmrAxHCIIr/mJrjU+z/jyfCIDmpYobEEaG7Jdff0aL
 ptUgFtjkatqQWlWJzTIrFj/ck17aguEcEqHWg/QiVbq37aW3cLY4mOtG4O/KNC2yLK
 zZBBLpYcKu8Wous2xnJ4zlBIq3hDm3aDhdBZB4h0Yjhi4MLkcdhGk2cSj+YnhXzP9N
 A6/p2tUZSaTqw==
Date: Tue, 30 May 2023 18:23:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 16/17] dt-bindings: arm: amlogic: Document the MNT
 Reform 2 CM4 adapter with a BPI-CM4 Module
Message-ID: <20230530-switch-riverbank-8a2ae8e5ea4a@spud>
References: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-0-56eb7a4d5b8e@linaro.org>
 <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-16-56eb7a4d5b8e@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="U7YSC210J2lnKh/+"
Content-Disposition: inline
In-Reply-To: <20230512-amlogic-v6-4-upstream-dsi-ccf-vim3-v5-16-56eb7a4d5b8e@linaro.org>
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
 linux-phy@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-clk@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Nicolas Belin <nbelin@baylibre.com>,
 "Lukas F. Hartmann" <lukas@mntre.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--U7YSC210J2lnKh/+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 30, 2023 at 09:38:17AM +0200, Neil Armstrong wrote:
> The MNT Reform 2 CM4 adapter can be populated with any Raspberry Pi CM4
> compatible module such as a BPI-CM4 Module, document that.
>=20
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

--U7YSC210J2lnKh/+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZHYxIAAKCRB4tDGHoIJi
0jYwAQCUXtrTR7MIODftWUrB77h5/mo+g9I8GUIGCkjmSOVnAwD/fepTgXRQjx2p
dKfe5rmv2Fw9D0GFz7KPFbFjaNP3Wgc=
=vEeV
-----END PGP SIGNATURE-----

--U7YSC210J2lnKh/+--
