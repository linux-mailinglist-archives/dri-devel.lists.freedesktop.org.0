Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D45F476E393
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 10:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0254A10E5DD;
	Thu,  3 Aug 2023 08:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36A8310E5E5
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Aug 2023 08:49:01 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7030C61CDB;
 Thu,  3 Aug 2023 08:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57432C433C8;
 Thu,  3 Aug 2023 08:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691052539;
 bh=Y0NT9+jhy+SVCkNdodtcTuuD4m428dSBnf4RYExMCVI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hHSTdN7CY3d5RkxhKKUgxwBcIL10XDgXnREDhjjZryufbi7C0wF4l6SlExsQqxxQj
 xg+t2ORgMKOv0KYPjlEAQgKT5HK0o3evOXpdnBOcYQVtPCGXVXG7j5jRdCRDMZGqXG
 6HN5DnhVWpql+3EltG4mKh5iAhCM/V774rBWvN169MQmbQ4k2ejwbRxXZTRi4tTjEZ
 9hIxXmLiLi3P/f1nNSSKg3MgCtxL5g28aVxxBVNBEFuZJKFQiU4Tx7Na2UGaz0nVUB
 r5xWJyw2X9S0w+CRYDRXsyUK2SGiH1yB+U2lGHEkQPxOmx/heU9fP2RsVI4xSK9S+S
 uuszv6UIh1+xw==
Date: Thu, 3 Aug 2023 10:48:57 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 0/4] drm/panel: sitronix-st7789v: add support for partial
 mode
Message-ID: <ekmwiy3iuvtqtb6hwjbba2ia3aemt3dxmx6dj3zh6ljfmuim4w@4jzhqdenxth4>
References: <20230718-feature-lcd-panel-v1-0-e9a85d5374fd@wolfvision.net>
 <292c3e7d-82ea-2631-bd4b-ef747f56287c@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2sas7p43tngc2au2"
Content-Disposition: inline
In-Reply-To: <292c3e7d-82ea-2631-bd4b-ef747f56287c@linaro.org>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--2sas7p43tngc2au2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 10:11:22AM +0200, Neil Armstrong wrote:
> Hi,
>=20
> On 18/07/2023 17:31, Michael Riesch wrote:
> > Hi all,
> >=20
> > This series adds support for the partial display mode to the Sitronix
> > ST7789V panel driver. This is useful for panels that are partially
> > occluded by design, such as the Jasonic JT240MHQS-HWT-EK-E3. Support
> > for this particular panel is added as well.
> >=20
> > Note: This series is already based on
> > https://lore.kernel.org/lkml/20230714013756.1546769-1-sre@kernel.org/
>=20
> I understand Maxime's arguments, but by looking closely at the code,
> this doesn't look like an hack at all and uses capabilities of the
> panel controller to expose a smaller area without depending on any
> changes or hacks on the display controller side which is coherent.
>=20
> Following's Daniel's summary we cannot compare it to TV overscan
> because overscan is only on *some* displays, we can still get 100%
> of the picture from the signal.

Still disagree on the fact that it only affects some display. But it's
not really relevant for that series.

I think I'll still like to have something clarified before we merge it:
if userspace forces a mode, does it contain the margins or not? I don't
have an opinion there, I just think it should be documented.

Maxime

--2sas7p43tngc2au2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZMtp+AAKCRDj7w1vZxhR
xYu2AP9gN0xpGj30YXB2Oo/JNDobI7gGge8/IziOAnjHaTA73gEAnn8sMJU25ESF
ljJwLfmQB/zyjUPIdhEsxmn1uQD9sAg=
=IrPc
-----END PGP SIGNATURE-----

--2sas7p43tngc2au2--
