Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF50817A6D
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:00:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24CA810E384;
	Mon, 18 Dec 2023 18:59:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E9BC10E277
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:51:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id CB2A6B80B66;
 Sun, 17 Dec 2023 21:43:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FF3CC433C8;
 Sun, 17 Dec 2023 21:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702849419;
 bh=ttHVxZrSl0fzPqXZ/8WzdupCtgmAwzVZdpIUtIeSJd0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=twzqiBMvBBonVZLV/2nXWJRdlkicH/UcNNNRecOo0pRinoOSn3+4ywPuL+byA3TI7
 jL2VhDL/HvKCO0JHjCDpR82blUWfrx1uoQ60IAsrTVQaXxGgIxdaEhV7nqkAFp6igE
 xBDvqZVnDNI9ETHGAfNtpk5Yi55EZdPX0YIlY2XbgkIbqv4lImAxt73kELE2nv+Gfw
 n1D2yywvZvdV8svhzqB9JAuzG7qO1Oyxg0gGTbmy1UWAWYs/Fqzi5PBJYdUrmWTc2u
 KKK0MOc69dsL96sHo7YPi/0nN77KnQfDSeshj/Ld1vYnJD0Yr4xDeFUKKkS8NPYnig
 YWLf1Sx096RHw==
Date: Sun, 17 Dec 2023 21:43:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: Add SSD133x OLED controllers
Message-ID: <20231217-hunk-cross-4bf51740957c@spud>
References: <20231217100741.1943932-1-javierm@redhat.com>
 <20231217100741.1943932-2-javierm@redhat.com>
 <20231217-bacteria-amusable-77efb05770a4@spud>
 <87fs00ms4b.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="uvs7ymLunVDhuv2O"
Content-Disposition: inline
In-Reply-To: <87fs00ms4b.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--uvs7ymLunVDhuv2O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 17, 2023 at 10:33:24PM +0100, Javier Martinez Canillas wrote:
> Conor Dooley <conor@kernel.org> writes:
>=20
> Hello Connor,
>=20
> > On Sun, Dec 17, 2023 at 11:07:03AM +0100, Javier Martinez Canillas wrot=
e:
>=20
> [...]
>=20
> >> +properties:
> >> +  compatible:
> >> +    enum:
> >> +      - solomon,ssd1331
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +
> >> +allOf:
> >> +  - $ref: solomon,ssd-common.yaml#
> >> +
> >> +  - if:
> >> +      properties:
> >> +        compatible:
> >> +          contains:
> >> +            const: solomon,ssd1331
> >> +    then:
> >> +      properties:
> >> +        width:
> >> +          default: 96
> >> +        height:
> >> +          default: 64
> >
> > Do you envisage a rake of devices that are going to end up in this
> > binding? Otherwise, why not unconditionally set the constraints?
> >
>=20
> Because these are only for the default width and height, there can be
> panels using the same controller but that have a different resolution.
>=20
> For example, there are panels using the SSD1306 controller that have
> 128x32 [0], 64x32 [1] or 128x64 [2] resolutions.

This, as you know, does not matter here.

> But answering your question, yes I think that more devices for this
> SSD133x family are going to be added later. Looking at [3], there is
> at least SSD1333 that has a different default resolutions (176x176).

That's fair enough though. I'd probably err on the side of introducing
this complexity when the other users actually show up though.

>=20
> I think that even the SSD135x family could be supported by the same
> modsetting pipeline, but I need to get one to figure it out.
>=20
> [0]: https://es.aliexpress.com/item/1005003648174074.html
> [1]: https://www.buydisplay.com/white-0-49-inch-oled-display-64x32-iic-i2=
c-ssd1306-connector-fpc
> [2]: https://es.aliexpress.com/item/1005001582340858.html?gatewayAdapt=3D=
glo2esp
> [3]: https://www.solomon-systech.com/product-search/?technology=3Doled-di=
splay
>=20
> > Cheers,
> > Conor.
>=20
> --=20
> Best regards,
>=20
> Javier Martinez Canillas
> Core Platforms
> Red Hat
>=20

--uvs7ymLunVDhuv2O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZX9rhQAKCRB4tDGHoIJi
0urZAQDdCk0O4EIhlmjwki+Jl0RqsfAslhFufBpKGUbKX4BvywD7Bb1X9ZmooXs8
SNyUI6YvgDljaImUgx8KU/1k38YgfQA=
=0pmm
-----END PGP SIGNATURE-----

--uvs7ymLunVDhuv2O--
