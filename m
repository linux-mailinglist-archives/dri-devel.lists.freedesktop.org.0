Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C363F828A07
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 17:32:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3325310E45E;
	Tue,  9 Jan 2024 16:32:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A0C710E45E
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 16:32:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 016A2CE191B;
 Tue,  9 Jan 2024 16:32:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 496CCC433F1;
 Tue,  9 Jan 2024 16:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704817927;
 bh=skn/kd0lj/n94s6TTYlvAU/eDiNdCAKqCSmLkhxw9vs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tf2Lg3mdzPb9Do2w61/NdSYk7cr1pry8fm1LB8dYwfEA8ZDAbUqSFacvBm46hVaCv
 gseCXMnHKgodVEcuMHwx9mGW74dXLkDs4vkkpPbDib6YLe2JKWtfHu859owFxBoeyK
 NXcxRMK3WlwKq9Bfx97hKJKuAZh9PzGsPMnPTGyOGBDOvmuPPRNdhLpTohdLeMq0Yc
 0THnrs4KEHineUuaplpWiAYw1HXBUfkZpR8ocG7HrpQpDstp/NnTZO9W7wkq2NlqJk
 kMVPvzR3tjBhfKv6PdF300V90IoP0A4oOt9TOhETMzpPlwWiDE82v2wqM6NN5R3pM9
 Xe0+LCL9LufmQ==
Date: Tue, 9 Jan 2024 16:32:00 +0000
From: Conor Dooley <conor@kernel.org>
To: Shengyang Chen <shengyang.chen@starfivetech.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: panel: panel-simple: Add
 compatible property for waveshare 7inch touchscreen panel
Message-ID: <20240109-worsening-material-fae02ff4e611@spud>
References: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
 <20240109070949.23957-2-shengyang.chen@starfivetech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="IR02Rzu4WY2FHH6P"
Content-Disposition: inline
In-Reply-To: <20240109070949.23957-2-shengyang.chen@starfivetech.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 keith.zhao@starfivetech.com, tzimmermann@suse.de,
 krzysztof.kozlowski+dt@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 dave.stevenson@raspberrypi.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jack.zhu@starfivetech.com, robh+dt@kernel.org,
 thierry.reding@gmail.com, mripard@kernel.org, quic_jesszhan@quicinc.com,
 changhuang.liang@starfivetech.com, wahrenst@gmx.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--IR02Rzu4WY2FHH6P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 09, 2024 at 03:09:48PM +0800, Shengyang Chen wrote:
> The waveshare 7" 800x480 panel is a clone of Raspberry Pi 7" 800x480 panel
> It can be drived by Raspberry Pi panel's process but it needs different
> timing from Raspberry Pi panel. Add compatible property for it.
>=20
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> Signed-off-by: Shengyang Chen <shengyang.chen@starfivetech.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple=
=2Eyaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 11422af3477e..02f6b1b2ddc9 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -335,6 +335,8 @@ properties:
>        - vivax,tpc9150-panel
>          # VXT 800x480 color TFT LCD panel
>        - vxt,vl050-8048nt-c01
> +        # Waveshare 7" (800x480) touchscreen LCD panel
> +      - waveshare,7inch-touchscreen

Is "7inch-touchscreen" really a specific enough identifier for this
device?

>          # Winstar Display Corporation 3.5" QVGA (320x240) TFT LCD panel
>        - winstar,wf35ltiacd
>          # Yes Optoelectronics YTC700TLAG-05-201C 7" TFT LCD panel
> --=20
> 2.17.1
>=20

--IR02Rzu4WY2FHH6P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ11AAAKCRB4tDGHoIJi
0vx9AQCV8uXH0qEaWc0GOrSxDu6YvkBzMwFW4Q2dCINJB3ujQAEAnK2VBDNXzYLX
fge09RVbAQLbLfs1Z29O1zBmZJrNPAo=
=KAKZ
-----END PGP SIGNATURE-----

--IR02Rzu4WY2FHH6P--
