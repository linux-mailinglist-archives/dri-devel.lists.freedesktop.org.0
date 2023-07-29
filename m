Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92969767E1B
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 12:17:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB4D10E079;
	Sat, 29 Jul 2023 10:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3905710E079
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 10:17:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3BB7660B5A;
 Sat, 29 Jul 2023 10:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281EBC433C8;
 Sat, 29 Jul 2023 10:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690625827;
 bh=LLtK0W9au1ec/B+PX7duXrAoJ45Fx1caP/dPstfZ0Gc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mBAwhR6XU6Ggmt71z8g76/UQJ38iYkzIu3WzEKxhs4cCYqMryWH0Ng2h+ko2OY4wD
 +EUY0XPSMrcRNvQtQG9OYdZdvgOWBS1ULOkoDE2vu0Bq6mLwwnGtk2cTmUClhCyJNq
 7vsEUYu/rBJeOoVB9/M2cG8JADRNNl5oe2Gczer7rn5UlOSRBrJY5nka6mlMFvx3Dj
 5xdNLsRCGnuHgcngTCLeqP9YoZs1U8BpISgradzjBx/i3E3tjhBJO2EAGvV2I03kim
 88BuIdGTYdlYMnw2a19IUVZLnQUz9KqoYyM9nyFEdAPFWZVNTsPrCib1GVtpn4O6Im
 kNSSJ8ZDg2tsw==
Date: Sat, 29 Jul 2023 11:17:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Johannes Zink <j.zink@pengutronix.de>
Subject: Re: [PATCH v4 1/3] dt-bindings: display: move LVDS data-mapping
 definition to separate file
Message-ID: <20230729-ultimatum-rickety-b26e118eaeb0@spud>
References: <20230523-simplepanel_support_nondefault_datamapping-v4-0-e6e7011f34b5@pengutronix.de>
 <20230523-simplepanel_support_nondefault_datamapping-v4-1-e6e7011f34b5@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="moll4ESZB2UhCi3o"
Content-Disposition: inline
In-Reply-To: <20230523-simplepanel_support_nondefault_datamapping-v4-1-e6e7011f34b5@pengutronix.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dan Carpenter <error27@gmail.com>, devicetree@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 patchwork-jzi@pengutronix.de, kernel@pengutronix.de,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--moll4ESZB2UhCi3o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 04:16:55PM +0200, Johannes Zink wrote:
> As the LVDS data-mapping property is required in multiple bindings: move
> it to separate file and include instead of duplicating it.
>=20
> Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
>=20
> ---
>=20
> Changes:
>=20
> v3 -> v4: none
>=20
> v2 -> v3: worked in Conor's and Laurent's review findings (thank you
>           for reviewing my work): drop +| on description

I think both Laurent & I provided reviewed-bys on v2. Is there a reason
you did not include them? Here's mine back again:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
and here's a link to Laurent's:
https://lore.kernel.org/all/20230602153239.GK26944@pendragon.ideasonboard.c=
om/

--moll4ESZB2UhCi3o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMTnHQAKCRB4tDGHoIJi
0ghuAP9U/DSQJSkadJ2XepyP6FsnHzyMueedqxt+5GWrjXizTAD/Z9CRNc8Uhre8
FOOH1OA4iX1wA5ArCf5tLfEgJzx4cw8=
=ipsV
-----END PGP SIGNATURE-----

--moll4ESZB2UhCi3o--
