Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF94817A84
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10ECA10E2AB;
	Mon, 18 Dec 2023 19:02:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5BB710E299
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 19:02:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E228DCE0F60;
 Mon, 18 Dec 2023 14:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A16B1C433C8;
 Mon, 18 Dec 2023 14:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1702910872;
 bh=1Ejc3DTMkoqF39XaGz2sEGxnABT4TjgOb+bh3SkctYE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iXcytq6h9tCH/7HvVzZRCLC/z6pQGJLUIHrtngZCWYCOt54aLS9VexxGok7fLlRRd
 qB5H3/QFz1eytjNp0CEIcvpXUXg1TkqGVsYtJAzzw7espS8tqc0flDyu0fjgrLsYU1
 qwjVDnglnEoVW7co7iMsIUVg4DSsFX9S3WHSL26SMG0HrOnfvB1CaOW6XZgM7xPRra
 ZXHqeoU6SZEAGYffZW6Yn1sHP24se3KJJq9Z2x84WSUhwvJjvmNCBVOH9/ID+AaFtO
 UnmHDBJJfsTNhxsNcWtoSrC7u5STsDsogDuXxu5zSq73N55LK9bElkoRotmyhKuA3a
 i4i38sM2MTf3A==
Date: Mon, 18 Dec 2023 14:47:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: Add SSD133x OLED controllers
Message-ID: <20231218-example-envision-b41ca8efa251@spud>
References: <20231218132045.2066576-1-javierm@redhat.com>
 <20231218132045.2066576-2-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QqzxdS1EmQ01CbaQ"
Content-Disposition: inline
In-Reply-To: <20231218132045.2066576-2-javierm@redhat.com>
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
Cc: Conor Dooley <conor+dt@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--QqzxdS1EmQ01CbaQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 18, 2023 at 02:20:35PM +0100, Javier Martinez Canillas wrote:
> Add a Device Tree binding schema for the OLED panels based on the
> Solomon SSD133x family of controllers.
>=20
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>=20
> Changes in v2:
> - Unconditionally set the width and height constraints (Conor Dooley).
> - Fix indentation in the DTS examples (Krzysztof Kozlowski).
>=20
>  .../bindings/display/solomon,ssd133x.yaml     | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd=
133x.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd133x.ya=
ml b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
> new file mode 100644
> index 000000000000..8feee9eef0fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
> @@ -0,0 +1,57 @@
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
> +  - properties:
> +      width:
> +        default: 96
> +      height:
> +        default: 64

diff --git a/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml=
 b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
index 8feee9eef0fd..ffc939c782eb 100644
--- a/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
+++ b/Documentation/devicetree/bindings/display/solomon,ssd133x.yaml
@@ -9,24 +9,24 @@ title: Solomon SSD133x OLED Display Controllers
 maintainers:
   - Javier Martinez Canillas <javierm@redhat.com>
=20
+allOf:
+  - $ref: solomon,ssd-common.yaml#
+
 properties:
   compatible:
     enum:
       - solomon,ssd1331
=20
+  width:
+    default: 96
+
+  height:
+    default: 64
+
 required:
   - compatible
   - reg
=20
-allOf:
-  - $ref: solomon,ssd-common.yaml#
-
-  - properties:
-      width:
-        default: 96
-      height:
-        default: 64
-
 unevaluatedProperties: false
=20
 examples:

The properties stuff doesn't need to be in the allOf. Although, I took
the opportunity to look at ssd-common.yaml. How do the height/width here
differ from the vendor prefixed versions in that file?

--QqzxdS1EmQ01CbaQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZYBbgAAKCRB4tDGHoIJi
0nUWAP47tXmu50as8MLPe0wyFtLmpL2ScU7fl+agMnc8GU2sEwEAjVkZfObf4dO6
6QrCJ+/muSgOHjoVmG3AKNOOkz9xDAU=
=YGWG
-----END PGP SIGNATURE-----

--QqzxdS1EmQ01CbaQ--
