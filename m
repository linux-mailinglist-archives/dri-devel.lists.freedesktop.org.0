Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A937C5889
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 17:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FEC10E51F;
	Wed, 11 Oct 2023 15:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C04910E51F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 15:51:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A192E612E8;
 Wed, 11 Oct 2023 15:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C70CC433C9;
 Wed, 11 Oct 2023 15:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697039463;
 bh=PLeMZ6vh0vntTHPjCPvZn2GE9xFVxH55OIhhSE0gOQo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gNdfkI4lqtBrXALkO59Dd7Z11c9h0pTr+6r9GJ/dG7tDVlTUtLIFaabZaBDneBzke
 TJhX+TYWpOW6VWMmhQKufhlGz0w00bwJxKVIeeaD7xTaZPBhFUVbsEeB9Y5OWhl/6u
 fCr9JCFdUpozUMvIB/ITI1YnbNYlxcIOS3+Awdk9poaHJDh2zrs3+wWsisvzfXiF8D
 qF9cJQfJXnzAyY/ee8Enla7pNQengb27m9cYh/eq3TTjvnUF74uVaX2H0solZBwpf6
 sgiNmOrplLelvbYlLeOV/ne4zc9plB5txwrirdFP4nb+dsbWodIE1QdIw5Sxlp+yMX
 3ZA+f/OkP8jow==
Date: Wed, 11 Oct 2023 16:50:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 8/8] dt-bindings: display: Add SSD132x OLED controllers
Message-ID: <20231011-dreamily-pristine-0335c0536fe2@spud>
References: <20231009183522.543918-1-javierm@redhat.com>
 <20231009183522.543918-9-javierm@redhat.com>
 <20231010-headache-hazard-834a3338c473@spud>
 <87y1g9sm4q.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+g2BciVZzlF4XWZi"
Content-Disposition: inline
In-Reply-To: <87y1g9sm4q.fsf@minerva.mail-host-address-is-not-set>
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
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--+g2BciVZzlF4XWZi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 11, 2023 at 08:34:29AM +0200, Javier Martinez Canillas wrote:
> Conor Dooley <conor@kernel.org> writes:
> >> +  # Only required for SPI
> >> +  dc-gpios:
> >> +    description:
> >> +      GPIO connected to the controller's D/C# (Data/Command) pin,
> >> +      that is needed for 4-wire SPI to tell the controller if the
> >> +      data sent is for a command register or the display data RAM
> >> +    maxItems: 1
> >> +
> >> +  solomon,height:
> >> +    $ref: /schemas/types.yaml#/definitions/uint32
> >> +    description:
> >> +      Height in pixel of the screen driven by the controller.
> >> +      The default value is controller-dependent.
> >
> > You probably know better than me, operating in drm stuff, but are there
> > really no generic properties for the weidth/height of a display?
> >
>=20
> There are some common properties, such as the width-mm and height-mm for
> the panel-common:
>=20
> Documentation/devicetree/bindings/display/panel/panel-common.yaml
>=20
> But those are to describe the physical area expressed in millimeters and
> the Solomon drivers (the old ssd1307fb fbdev driver and the new ssd130x
> DRM driver for backward compatibility with existing DTB) express the width
> and height in pixels.
>=20
> That's why are Solomon controller specific properties "solomon,width" and
> "solomon,height".

Okay. Thanks for the explanation.

--+g2BciVZzlF4XWZi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZSbEYgAKCRB4tDGHoIJi
0vg+AP9qgrJ5Qf8QigHTgZvEvzxw6+z0B8m0yjL2xNjvKu/PHgEAn/HzxnfWWJOJ
6njIlKh6cJNLTsd61CRJdjG0rB9cYgM=
=cyVL
-----END PGP SIGNATURE-----

--+g2BciVZzlF4XWZi--
