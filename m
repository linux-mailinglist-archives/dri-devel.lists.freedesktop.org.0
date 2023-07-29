Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26138767E22
	for <lists+dri-devel@lfdr.de>; Sat, 29 Jul 2023 12:19:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB63E10E106;
	Sat, 29 Jul 2023 10:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D182B10E106
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Jul 2023 10:19:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3E4C860B5C;
 Sat, 29 Jul 2023 10:19:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39F8CC433C8;
 Sat, 29 Jul 2023 10:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690625966;
 bh=SGtv9ueXUw5ROsvDtQ2C53JCWVPJ4Vejh1uB8vdlPIE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=USlbJC7rKvEQ1lJJpOPJdLHXMb7QO/z+T2Uk0ZyVF4Owo0gcVyUs5Fhe9T6cuQ66M
 zSHxUpRZglDNvKF8YumjfcQ4ZfA/XbFbopB7cl4J8E+Bi8pXh3HfOlnU5UW0VWGa0i
 yl62hQ8MdWmXINovyzYNVHLE7tmzonEwNRhYt/F/ntWNJLnMFCMFPFsppKlUR+TTPU
 ZPm8E7BFoMdxMjJJ+mLx2CXjfWjZWSX9ufsFLuL9iDAe7JnhNArUYHiZnia6XtL4z1
 jRhzixpUBzj0E8xaMiCuNuUKt4Dw+JmNXzasxcTd2G8b5S/PDdKxPFPfVFJIHunLke
 jY8yPLUl0gncg==
Date: Sat, 29 Jul 2023 11:19:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Johannes Zink <j.zink@pengutronix.de>
Subject: Re: [PATCH v4 2/3] dt-bindings: display: simple: support non-default
 data-mapping
Message-ID: <20230729-tinker-provolone-a88d55c07cad@spud>
References: <20230523-simplepanel_support_nondefault_datamapping-v4-0-e6e7011f34b5@pengutronix.de>
 <20230523-simplepanel_support_nondefault_datamapping-v4-2-e6e7011f34b5@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="29+43n6rtm9QyKNM"
Content-Disposition: inline
In-Reply-To: <20230523-simplepanel_support_nondefault_datamapping-v4-2-e6e7011f34b5@pengutronix.de>
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


--29+43n6rtm9QyKNM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 04:16:56PM +0200, Johannes Zink wrote:
> Some Displays support more than just a single default LVDS data mapping,
> which can be used to run displays on only 3 LVDS lanes in the jeida-18
> data-mapping mode.
>=20
> Add an optional data-mapping property to allow overriding the default
> data mapping. As it does not generally apply to any display and bus, use
> it selectively on the innolux,g101ice-l01, which supports changing the
> data mapping via a strapping pin.
>=20
> Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
>=20
> ---
>=20
> Changes:
>=20
> v3 -> v4: none
>=20
> v2 -> v3: - worked in Laurent's review findings (thanks for reviewing
> 	    my work): fix typos in commit message

I gave you one for this patch too, no?
https://lore.kernel.org/all/20230523-jaywalker-modify-500ec1d79223@spud/
Any reason in particular you didn't pick up the tags? Here it is
against, since all that appears to have changed is some typos.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>



--29+43n6rtm9QyKNM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMTnqAAKCRB4tDGHoIJi
0qDdAQC6hoL2rP9Qad7gAl95uZSKR8LaTd4EGwoUOCSlU+koGQD+NZlH+6nMEZfP
l5DHGMPl9XH8LuO9+3NSxY5HhJM7AQA=
=b1Vl
-----END PGP SIGNATURE-----

--29+43n6rtm9QyKNM--
