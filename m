Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1582C7D226E
	for <lists+dri-devel@lfdr.de>; Sun, 22 Oct 2023 11:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1B5210E06B;
	Sun, 22 Oct 2023 09:54:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4472D10E06E
 for <dri-devel@lists.freedesktop.org>; Sun, 22 Oct 2023 09:54:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 17A0F608CC;
 Sun, 22 Oct 2023 09:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE2B6C433C7;
 Sun, 22 Oct 2023 09:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1697968448;
 bh=624DD86ruJdAKpRg5DvcZ6DGc3A5gO4DA0XsTE9YA0A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Eg4EW7zJrsPBLSVaMUUnDDNajHiROoE+x3HBZGuDv6Tr9dMd4wz4iI3QVbM/tPniz
 1TfwJNEPsBnUxThdnNrY/rZoTl9pJdxhJkMxT497V0bTNpRgL6FR+FF2uhL51BNp20
 mWUMBTt7MYZwM/aPak79Fro/jb/mqhv2smWYyz+hY1SK/5w8AViUICDGlZiCopPtBu
 sjL9T6AfHrQJL0W/MQOtgEXzmamuchjR89WTBSCvTcboRboFzDRBkFpjb5IRQLooLV
 q94UDvDjDc6jIM/0t/y2IzemQvfNgWHIMfVpU8ugMWB+5e8ZSD2QoZrGuqaeBcbtKM
 /MGmbIpQ/+pfA==
Date: Sun, 22 Oct 2023 10:54:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH] dt-bindings: display: ssd132x: Remove '-' before
 compatible enum
Message-ID: <20231022-sandbox-reverend-7651a2e00a7d@spud>
References: <20231020223029.1667190-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AzbL4NimfEVzMx25"
Content-Disposition: inline
In-Reply-To: <20231020223029.1667190-1-javierm@redhat.com>
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
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--AzbL4NimfEVzMx25
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 21, 2023 at 12:30:17AM +0200, Javier Martinez Canillas wrote:
> This is a leftover from when the binding schema had the compatible string
> property enum as a 'oneOf' child and the '-' was not removed when 'oneOf'
> got dropped during the binding review process.
>=20
> Reported-by: Rob Herring <robh@kernel.org>
> Closes: https://lore.kernel.org/dri-devel/CAL_Jsq+h8DcnpKqhokQOODCc8+Qi3M=
0PrxRFKz_Y4v37yMJvvA@mail.gmail.com/
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>=20
>  .../devicetree/bindings/display/solomon,ssd132x.yaml      | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd132x.ya=
ml b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
> index 0aa41bd9ddca..37975ee61c5a 100644
> --- a/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd132x.yaml
> @@ -11,10 +11,10 @@ maintainers:
> =20
>  properties:
>    compatible:
> -    - enum:
> -        - solomon,ssd1322
> -        - solomon,ssd1325
> -        - solomon,ssd1327
> +    enum:
> +      - solomon,ssd1322
> +      - solomon,ssd1325
> +      - solomon,ssd1327
> =20
>  required:
>    - compatible
> --=20
> 2.41.0
>=20

--AzbL4NimfEVzMx25
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTTxOwAKCRB4tDGHoIJi
0oktAQDIz4f+vI7vkhhIDLAgUw9zdMfHk5TeYQwpzVwoeucoCAEAmzoJ7v2hDg0C
eX6hl7pSU/Oi61+XBX2HNiVYH3ykpgI=
=UhsP
-----END PGP SIGNATURE-----

--AzbL4NimfEVzMx25--
