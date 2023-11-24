Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 566B87F73DB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 13:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4501D10E1CE;
	Fri, 24 Nov 2023 12:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E70110E1D2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 12:31:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 627D8CE2935;
 Fri, 24 Nov 2023 12:31:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542B6C433C9;
 Fri, 24 Nov 2023 12:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700829074;
 bh=tAap/i24iWrMnBAbBq4n2i8qwIMwaOlc9deTHTR+nTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gpERsoufGLxc1hxyDAPPD7rZ1tfR4vwx+Xv28yU6m7sD0mNb6bR5aEaOaHGvZ3S1C
 Z+eWKzk2Z6//2Zln4eVbhsPM+ZwC9j3SFbDFt14010chLxOrj9/KQN0GNauCXqK1TO
 dI53lq2m1bRmes5tX2MSRVZbQ2UCQru8lsScHZKlfLjSU8tIRnYP3Agy3ddNBXVi70
 zahOFZ9MV8HzzxMGOAbeFHAyfOWyl5fRWNdI3XeTEP2Hmt3yyUJx4liqNYDGZAR0wf
 m4n94Wsy8zZ7509JSVWkxp2yDj+ExSLrglqTHEcP9mhFIx49uTRKEfRH3Wktt9PSlA
 g0Sh68Xh2OZcw==
Date: Fri, 24 Nov 2023 12:31:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Shengyang Chen <shengyang.chen@starfivetech.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: panel: raspberrypi: Add
 compatible property for waveshare 7inch touchscreen panel
Message-ID: <20231124-lesser-sinister-7f9cd7b80e35@spud>
References: <20231124104451.44271-1-shengyang.chen@starfivetech.com>
 <20231124104451.44271-2-shengyang.chen@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6rp6o7CTZMQn9QKM"
Content-Disposition: inline
In-Reply-To: <20231124104451.44271-2-shengyang.chen@starfivetech.com>
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
Cc: dri-devel@lists.freedesktop.org, eric@anholt.net, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 quic_jesszhan@quicinc.com, devicetree@vger.kernel.org, conor+dt@kernel.org,
 mripard@kernel.org, robh+dt@kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, neil.armstrong@linaro.org,
 keith.zhao@starfivetech.com, linux-kernel@vger.kernel.org,
 jack.zhu@starfivetech.com, tzimmermann@suse.de,
 changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--6rp6o7CTZMQn9QKM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 24, 2023 at 06:44:50PM +0800, Shengyang Chen wrote:
> The waveshare 7inch touchscreen panel is a kind of raspberrypi pi
> panel

Can you be more specific about what "is a kind of rpi panel" means?
Are they using identical chips as controllers or something like that?

> and it can be drived by panel-raspberrypi-touchscreen.c.
> Add compatible property for it.
>=20
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> Signed-off-by: Shengyang Chen <shengyang.chen@starfivetech.com>
> ---
>  .../bindings/display/panel/raspberrypi,7inch-touchscreen.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/raspberrypi,=
7inch-touchscreen.yaml b/Documentation/devicetree/bindings/display/panel/ra=
spberrypi,7inch-touchscreen.yaml
> index 22a083f7bc8e..e4e6cb4d4e5b 100644
> --- a/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-t=
ouchscreen.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/raspberrypi,7inch-t=
ouchscreen.yaml
> @@ -22,7 +22,9 @@ description: |+
> =20
>  properties:
>    compatible:
> -    const: raspberrypi,7inch-touchscreen-panel
> +    enum:
> +      - raspberrypi,7inch-touchscreen-panel
> +      - waveshare,7inch-touchscreen-panel
> =20
>    reg:
>      const: 0x45
> --=20
> 2.17.1
>=20

--6rp6o7CTZMQn9QKM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZWCXiwAKCRB4tDGHoIJi
0i61AQCwXh07gxbDq8SOnnI05/Qvw5TV2XV1uBpFa4IR3vUM5wEA0CuPaXJnEaU2
MClktifS0gc4Nm9iKOu+bf1Ixz945g0=
=AgXz
-----END PGP SIGNATURE-----

--6rp6o7CTZMQn9QKM--
