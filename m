Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77333918606
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2024 17:38:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC90D10E915;
	Wed, 26 Jun 2024 15:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KlsXJL/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237F010E915
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 15:38:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7673361A8E;
 Wed, 26 Jun 2024 15:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F20C116B1;
 Wed, 26 Jun 2024 15:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719416336;
 bh=b15Hg210z4EL1SOAWGuFlnF2GxD3SazHyJ2VDPmInEk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KlsXJL/moHiFFn2jx7dIHhNN7zdPay+XnxCl1s8uk13N0AKzXG8Ah+mBaArx1lI5Y
 WNSmGHQ1tyjqSNpnKSepSB0yc/Xn9RCY/lpJoNSJbP7SdXOEh7oWee5FZ7CImYUap8
 enTic8LswQTv+qC9SM+5K4Oa5qRmW1X+vm/O49tGMPYB5ZfYYDkRZ59BlgEFjI41ql
 qP1i8XHFELskhshRpneNzOwyUxr501u2QERkmTyWVLiadlcGbGJxvWUFzZ1NK5Re9K
 fGAcR907XY8wySLmd7I/b8RGC6UYpRhAEDCMiVwwhNqqLl1ZV8HQXGJkkzSaHTl43P
 fg1rbeXyfy3Qw==
Date: Wed, 26 Jun 2024 16:38:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: display: panel: correct Anbernic RG35XX
 panel example
Message-ID: <20240626-duo-outage-1601a51239b9@spud>
References: <20240626112005.248576-1-ryan@testtoast.com>
 <20240626112005.248576-4-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dgzzThEjxvXjkW+/"
Content-Disposition: inline
In-Reply-To: <20240626112005.248576-4-ryan@testtoast.com>
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


--dgzzThEjxvXjkW+/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 11:17:50PM +1200, Ryan Walklin wrote:
> make dt_bindings_check reports that sck-gpios and num-chipselects are
> required for spi nodes, therefore add these to the example.
>=20
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

huh, are you sure it does? It doesn't for me...

> ---
>  .../bindings/display/panel/anbernic,rg35xx-panel.yaml          | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/anbernic,rg3=
5xx-panel.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,r=
g35xx-panel.yaml
> index a7d5ad0f29389..610601c1594f3 100644
> --- a/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-pan=
el.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/anbernic,rg35xx-pan=
el.yaml
> @@ -40,6 +40,9 @@ examples:
>          #address-cells =3D <1>;
>          #size-cells =3D <0>;
>=20
> +        sck-gpios =3D <&pio 8 9 GPIO_ACTIVE_HIGH>; // PI9
> +        num-chipselects =3D <1>;
> +
>          panel@0 {
>              compatible =3D "anbernic,rg35xx-panel";
>              reg =3D <0>;
> --=20
> 2.45.2
>=20

--dgzzThEjxvXjkW+/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnw2CgAKCRB4tDGHoIJi
0k4WAQCeFXubyWEYxMjUj+AKDeIHuh6tr43Hf8kr8IKu+uA9eAD7BTMhbmysri3Z
AfDfVCH099k/ebvZ6nNr9HGEFAFjows=
=qKYB
-----END PGP SIGNATURE-----

--dgzzThEjxvXjkW+/--
