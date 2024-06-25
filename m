Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51039916D46
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 17:40:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 282D110E156;
	Tue, 25 Jun 2024 15:40:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H18peeYI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D402C10E156
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 15:40:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 005BFCE1BFE;
 Tue, 25 Jun 2024 15:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D00C32781;
 Tue, 25 Jun 2024 15:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719330002;
 bh=0lIVL5LOuvr4K83pE1uWBGRTWk0mnBboFZGyCtN8IeU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=H18peeYI8vZqSb/OE1+269yJLfWjEOuxZFXKNQBnvFqPgCQiQFxqm21pjzwlzBma4
 GI73uLA3JKkjWStrrscRcYCmIMdc/OZr0Gr5zjgBn/VC7HFkVRaCK22VMJmDuPWGha
 7wlWysDjbH42SGkOcJBowcsElY2co9lk4ASQqpcOx/0yQegbQFNys6EQTHjapZCb3J
 k4pKncSrczMSwIW82mRpQGGtLMV0jvoxMqYneVyXP+cTE7rEmOO41ZOQnSwUmZtWi/
 o8r4EHekhHiHO3f+rPhmo6XwquCs928TLV9g1fMaMVJPvuiWFVCN7x07zh2/latnbZ
 vdO0/qYXg0kag==
Date: Tue, 25 Jun 2024 16:39:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: megi@xff.cz, javierm@redhat.com, neil.armstrong@linaro.org,
 quic_jesszhan@quicinc.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: himax-hx8394: remove
 reset-gpio from required properties
Message-ID: <20240625-output-mulled-3359cccf8026@spud>
References: <20240625090853.343176-1-manikandan.m@microchip.com>
 <20240625090853.343176-2-manikandan.m@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="1uGbep+XqW2Q09B8"
Content-Disposition: inline
In-Reply-To: <20240625090853.343176-2-manikandan.m@microchip.com>
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


--1uGbep+XqW2Q09B8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 02:38:50PM +0530, Manikandan Muralidharan wrote:
> Remove "reset-gpio" property from required properties list and
> make it optional.When interfaced with some boards where reset line is not
> populated it leads to driver probe issues.
>=20
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
>  .../devicetree/bindings/display/panel/himax,hx8394.yaml          | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/himax,hx8394=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> index 644387e4fb6f..017cb19ed64f 100644
> --- a/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/himax,hx8394.yaml
> @@ -46,7 +46,6 @@ properties:
>  required:
>    - compatible
>    - reg
> -  - reset-gpios

If this is just the case for the new microchip panel, please make the
removal of required be conditional for that panel only and squash both
binding patches.

Thanks,
Conor.

--1uGbep+XqW2Q09B8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnrkzAAKCRB4tDGHoIJi
0tOQAQCdhZcIDLHCxvfe6q0sv3KmUz03/hJO6J5RuCYZDHv0qgD/cZGAW1PNYQZw
hnpVyowrcN1JhR3zggr0FGsVg7adEwY=
=pmhh
-----END PGP SIGNATURE-----

--1uGbep+XqW2Q09B8--
