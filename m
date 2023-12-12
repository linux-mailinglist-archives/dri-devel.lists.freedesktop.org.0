Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9855180F395
	for <lists+dri-devel@lfdr.de>; Tue, 12 Dec 2023 17:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A3B10E61D;
	Tue, 12 Dec 2023 16:52:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDD410E61D
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Dec 2023 16:52:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 00E556186E;
 Tue, 12 Dec 2023 16:52:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A87BC433C7;
 Tue, 12 Dec 2023 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702399933;
 bh=70vgThw1MlwxA+zGlJhj1ievu3+naSPsZMUdAK3/L6s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eyiGWeQTKbMokewNJGUKTmnMrZFCYX5PX968J6Xs4uCNtgFqPOt70iChtTHmX3GNh
 hp1EF1apKNX0E4wLCT8AvhMWy4NThQQ9BxTUX9iLucMKJmSTrCIARtgDwlHN2giCHW
 Zlwaqz1ntbA7IsIyoHkkflR74m6K1CY1A0ddsqCDVDZZEyS4q2T9ju22V5pIVPUPG3
 FWWtPB17qfCbGtgx4YUeseWTNbOre3yyDgQRn55o2hkq0mKLI7+/dX1F99cB4rOXOT
 kQJg52qqkSitMcrbOh/4CCBQdgNUVfOdgXw51+/+JgJp3LEOJf1Xjd3rDyPS5pfO82
 izDRJ3g6QaduA==
Date: Tue, 12 Dec 2023 16:52:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: lcdif: Decouple imx8mq from imx6sx
Message-ID: <20231212-yodel-enclose-3e239ab9d5dd@spud>
References: <20231211204138.553141-1-festevam@gmail.com>
 <20231211204138.553141-2-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="GQQcyvBtNUg0Njv8"
Content-Disposition: inline
In-Reply-To: <20231211204138.553141-2-festevam@gmail.com>
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
Cc: marex@denx.de, devicetree@vger.kernel.org, conor+dt@kernel.org,
 Fabio Estevam <festevam@denx.de>, kernel@puri.sm,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, martink@posteo.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--GQQcyvBtNUg0Njv8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 11, 2023 at 05:41:37PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>=20
> On i.MX6SX, the LCDIF has an associated power domain.
>=20
> i.MX8MQ does not have an LCDIF power domain, so allow passing only
> "fsl,imx8mq-lcdif" as compatible string to fix the following
> dt-schema warning:
>=20
> imx8mq-evk.dtb: lcd-controller@30320000: 'power-domains' is a required pr=
operty
> 	from schema $id: http://devicetree.org/schemas/display/fsl,lcdif.yaml#
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--GQQcyvBtNUg0Njv8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXiPuQAKCRB4tDGHoIJi
0pxdAP43e6xNOi4+1AVLEQ5bTqG+tYTbYwXcf+VSh/mBenStoAD/QZF0uFltgKCP
6ssPFcTMa6fsgOaPPduH6CWRfYWuuwk=
=hbPv
-----END PGP SIGNATURE-----

--GQQcyvBtNUg0Njv8--
