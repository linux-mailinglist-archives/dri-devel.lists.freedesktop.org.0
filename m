Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 534B18179D8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDEB10E39D;
	Mon, 18 Dec 2023 18:39:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7055310E10A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:36:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id A94CAB80C62;
 Sun, 17 Dec 2023 20:52:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50317C433C8;
 Sun, 17 Dec 2023 20:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702846348;
 bh=QZQeR7+cmdaZ25HquXncvbA8GkAKTHnMuVHURT1RTW8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WJYeMndjYAHRUb5DIgrE73sgH6cCgJgPn3HWmWmgcdnbyVv5sMwxSuLTEotn5eSjQ
 D2tDqW8OMwyDzL8h39TXrikx2aA4nb9Yty38fBI3fxqtq5R6HgX31gRHQ++Fi/BUbq
 aQ+yGk/c5S8qixlRVGgsgAzzV5arRGEcx+Z7RX/ZONmqITSWIIMnK3BvSF/iDL9Vrz
 /9NKrJZjm9WkjAvMEN823qSHl+TdbF21jVW4WfqE+t3TXhFEjIjVDKAK29LIpS41Oj
 Nubkk8zF2czicG24wwGaS4x92wD259TvlgJ03/7zl5lgrLL1zkeo2O3R92ON3Q6Lu0
 VXtgMHr1NfGKg==
Date: Sun, 17 Dec 2023 20:52:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: Add SSD133x OLED controllers
Message-ID: <20231217-bacteria-amusable-77efb05770a4@spud>
References: <20231217100741.1943932-1-javierm@redhat.com>
 <20231217100741.1943932-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="HF0go/XKn24LL76Q"
Content-Disposition: inline
In-Reply-To: <20231217100741.1943932-2-javierm@redhat.com>
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


--HF0go/XKn24LL76Q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Dec 17, 2023 at 11:07:03AM +0100, Javier Martinez Canillas wrote:
> Add a Device Tree binding schema for the OLED panels based on the
> Solomon SSD133x family of controllers.
>=20
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>=20
>  .../bindings/display/solomon,ssd133x.yaml     | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd=
133x.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd133x.ya=
ml b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
> new file mode 100644
> index 000000000000..eee8d8c9ca35
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/solomon,ssd133x.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Solomon SSD133x OLED Display Controllers
> +
> +maintainers:
> +  - Javier Martinez Canillas <javierm@redhat.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - solomon,ssd1331
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - $ref: solomon,ssd-common.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: solomon,ssd1331
> +    then:
> +      properties:
> +        width:
> +          default: 96
> +        height:
> +          default: 64

Do you envisage a rake of devices that are going to end up in this
binding? Otherwise, why not unconditionally set the constraints?

Cheers,
Conor.

--HF0go/XKn24LL76Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZX9fhgAKCRB4tDGHoIJi
0nZxAP9pT/ccPBJYrxczjDS0WHcjCAxC4mgf7EWpR9GMyB6OZgD+NL3uf89+ZHzM
obuRpn37wflN/lO+6u+cQFe0RY5IHQY=
=pmCw
-----END PGP SIGNATURE-----

--HF0go/XKn24LL76Q--
