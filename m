Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 135AB927B6F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 18:48:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E7E10E04E;
	Thu,  4 Jul 2024 16:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EaQzhY82";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C111710EA5F
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Jul 2024 16:48:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DE8F9624A0;
 Thu,  4 Jul 2024 16:48:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8431DC4AF0A;
 Thu,  4 Jul 2024 16:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720111686;
 bh=XcJtSuXQaEpDB4k3O8CW7Y7Ik25cpq7G3KBR2xOKg+0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EaQzhY82FK+j0bBDDIKvpCTMrTijDwIvjizYlcoOeXU+j8ejLtaXIaZxPf5ncuwnE
 K2RFFfh+m/Nxsq7wJSCC/Zu/9Z2YR70axQwXN6qHj3WkiCYYln0fhQ5m1RQO3zgiDr
 AVAEFxIJCuEd7SJitKzT5Xmyd1fp6COyek4PVD0fcSSX9YUniHvQ4Xg1097DcYYmj4
 HnOhNse4DIQCBHBtO8OiV/q+hjE/utMUhpDw5yMUSxG06LaHbYTOdXDzxK45WdxArm
 0tV+6EnhQcDomG1U+wYvLqhPHaRWjr7F6v12AL1tr3ZijtjWFrHA1/suhBEfmFfEYR
 E9GDs6ztX1+Jg==
Date: Thu, 4 Jul 2024 17:48:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
Cc: neil.armstrong@linaro.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 airlied@gmail.com, daniel@ffwll.ch, mripard@kernel.org,
 dianders@google.com, hsinyi@google.com, awarnecke002@hotmail.com,
 quic_jesszhan@quicinc.com, dmitry.baryshkov@linaro.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] dt-bindings: display: panel: Add compatible for
 starry-er88577
Message-ID: <20240704-cacti-bunny-83fc57eebd8b@spud>
References: <20240704072958.27876-1-lvzhaoxiong@huaqin.corp-partner.google.com>
 <20240704072958.27876-5-lvzhaoxiong@huaqin.corp-partner.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="RykSl8c0tZ5L9jJS"
Content-Disposition: inline
In-Reply-To: <20240704072958.27876-5-lvzhaoxiong@huaqin.corp-partner.google.com>
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


--RykSl8c0tZ5L9jJS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 04, 2024 at 03:29:57PM +0800, Zhaoxiong Lv wrote:
> The starry-er88577 is a 10.1" WXGA TFT-LCD panel. Hence, we=20
> add a new compatible with panel specific config.
>=20
> Signed-off-by: Zhaoxiong Lv <lvzhaoxiong@huaqin.corp-partner.google.com>
> ---
> Changes between V5 and V4:
> -  1. We are compatible with starry-er88577 panels in the boe-th101mb31ig=
002
> -     driver, so add it to the "boe,th101mb31ig002-28a.yaml".

Are you sure that "compatible" is the right word here? It seems like the
devices are rather similar, but compatible would mean that the driver
would work for both without changes. The driver patch (and the lack of a
fallback compatible here) implies that the panels are not actually
compatible.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> v4: https://lore.kernel.org/all/20240620115245.31540-2-lvzhaoxiong@huaqin=
=2Ecorp-partner.google.com/
>=20
> Changes between V4 and V3:
> -  1. Move positions to keep the list sorted.
>=20
> v3: https://lore.kernel.org/all/20240614145609.25432-2-lvzhaoxiong@huaqin=
=2Ecorp-partner.google.com/
>=20
> Changes between V3 and V2:
> -  1. Separate the Starry bindings from kingdisplay, and add it to panel-=
simple-dsi.yaml
>=20
> v2: https://lore.kernel.org/all/20240601084528.22502-4-lvzhaoxiong@huaqin=
=2Ecorp-partner.google.com/
>=20
> Changes between V2 and V1:
> -  1. Add compatible for Starry er88577 in Kingdisplay kd101ne3 dt-bindin=
gs.
> ---
>  .../bindings/display/panel/boe,th101mb31ig002-28a.yaml          | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/boe,th101mb3=
1ig002-28a.yaml b/Documentation/devicetree/bindings/display/panel/boe,th101=
mb31ig002-28a.yaml
> index 32df26cbfeed..2f251703a121 100644
> --- a/Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-=
28a.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/boe,th101mb31ig002-=
28a.yaml
> @@ -17,6 +17,8 @@ properties:
>      enum:
>          # BOE TH101MB31IG002-28A 10.1" WXGA TFT LCD panel
>        - boe,th101mb31ig002-28a
> +        # The Starry-er88577 is a 10.1" WXGA TFT-LCD panel
> +      - starry,er88577
> =20
>    reg: true
>    backlight: true
> --=20
> 2.17.1
>=20

--RykSl8c0tZ5L9jJS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZobSQQAKCRB4tDGHoIJi
0n0BAPwM1wnWItNs6WI3AwZCgk5MoSXvVYzWf9JAa8uWhdN//wEAvt+kBecbADu6
XQe4iZTVmBZ1wU/wBEoU1gPCcr9KZwU=
=2pS9
-----END PGP SIGNATURE-----

--RykSl8c0tZ5L9jJS--
