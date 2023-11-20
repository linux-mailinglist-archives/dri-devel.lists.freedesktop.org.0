Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 803767F17CB
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 16:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBC1C10E057;
	Mon, 20 Nov 2023 15:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED8B810E057
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 15:50:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1A9B361307;
 Mon, 20 Nov 2023 15:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A91EC433C7;
 Mon, 20 Nov 2023 15:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700495425;
 bh=hwGdvTC30e2lqKVVWjBXy5T6ES/s37IXoRVGMd2+0pQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OuakXYfH2B3OCYrq02ImXPaLKHHgv1XoOxq2euxeIQWC0Crhms/GQfyHAERvfK69s
 DF1RBMamEUYPuaOfpnaQp1j+CNzucEdp1EpNAPN+hWMv57j1T/49wvYAu20TggHUvr
 9h9mFblafUh5Qh+JN7xv4j9enLyvvjGgt/YK2XvQvOmhX4pbud5Uo9wJI5ysIkZrNw
 BPWdpOl8U5S3cdCW/wUONBUm0CW8H5dyUUZJsDljmdbgfcn5XTMVRFnoX/B5WCXJTP
 PyXPoKPqTJYSNuJDOUBMqvy72xpUWxgQ/NsRdT6CL/dMnTLhYok/ymvlzSQA5CyIvF
 LZZLM4LJ/KWzQ==
Date: Mon, 20 Nov 2023 15:50:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: ssd1307fb: Change
 "solomon,page-offset" default value
Message-ID: <20231120-granola-sturdy-83d054f1b6fa@spud>
References: <20231116180743.2763021-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="4bFoAD9+noYJcHZh"
Content-Disposition: inline
In-Reply-To: <20231116180743.2763021-1-javierm@redhat.com>
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
 Sahaj Sarup <sahaj.sarup@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--4bFoAD9+noYJcHZh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 16, 2023 at 07:07:37PM +0100, Javier Martinez Canillas wrote:
> This is used to specify the page start address offset of the display RAM.
>=20
> The value is used as offset when setting the page start address with the
> SSD130X_SET_PAGE_RANGE command, and the driver currently sets its value to
> 1 if the property is not present in the Device Tree.
>=20
> But the datasheet mentions that the value on reset for the page start is a
> 0, so it makes more sense to also have 0 as the default value for the page
> offset if the property is not present.
>=20
> In fact, using a default value of 1 leads to the display not working when
> the fbdev is attached to the framebuffer console.
>=20
> Reported-by: Sahaj Sarup <sahaj.sarup@linaro.org>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>=20
>  .../devicetree/bindings/display/solomon,ssd1307fb.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.=
yaml b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> index 3afbb52d1b7f..badd81459aaa 100644
> --- a/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml
> @@ -35,7 +35,7 @@ properties:
> =20
>    solomon,page-offset:
>      $ref: /schemas/types.yaml#/definitions/uint32
> -    default: 1
> +    default: 0

I think I saw it pointed out by Maxime elsewhere that this breaks the
ABI. It would be nice if DT defaults matched the hardware's, but I don't
really think it is worth breaking the ABI here. Expanding the property
description to explain the impact of the particular values might help
with incorrect usage.

Thanks,
Conor.

>      description:
>        Offset of pages (band of 8 pixels) that the screen is mapped to
> =20
> --=20
> 2.41.0
>=20

--4bFoAD9+noYJcHZh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVuAPAAKCRB4tDGHoIJi
0rwwAQDwlz5bsqGXaRqTo+gxHO6qWygSskpfqHWje4LOQ/STSAEAjptBSDLIi9s1
DjGRyqKsN280gvpMTdz7FUpAEO1gZwg=
=pjLO
-----END PGP SIGNATURE-----

--4bFoAD9+noYJcHZh--
