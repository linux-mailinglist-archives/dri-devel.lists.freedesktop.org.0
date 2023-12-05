Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A8F805A90
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 17:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A87910E010;
	Tue,  5 Dec 2023 16:55:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0293C10E010
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 16:55:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 20C8CB81BB5;
 Tue,  5 Dec 2023 16:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C03C433C7;
 Tue,  5 Dec 2023 16:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701795348;
 bh=RwcNNAfsT2+STZzMi5x3BGwN32YgoA2d0mKr4ENbGZE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FjFLZ1Rh+du2h3Xb0bSK4KrUOT6fT/mC3PCn1xTExxYL1Y9m6klM24q5lg1anp4fM
 VNee4O0kp/dYn/OjnEz2zyPba6X5OPGM/zHSORp8+8noc+Fs/VoH4RI6HHM1uFtGVO
 23v3U91sGep4k51vdmQE7QGYYBhrzTH4vVQUoTQ9UCG/yUQ1sQqvO8GzKgQtOOnJlu
 ImKOnsrqWdkJzcwZK9yqxYPuTDOg33Ea9YikvpStDx8Ra+JAHSfou0NygtMVmwEplC
 DTm5Ld0nRrs/7yx92WsNscDE1+9aj/9ztHcwj53aZcD1gyHCOuJZgBM2BSDKNvyQ7S
 /67tlhJmHj2Jw==
Date: Tue, 5 Dec 2023 16:55:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Johan Jonker <jbx6244@gmail.com>
Subject: Re: [PATCH v1 1/3] dt-bindings: drm: rockchip: convert
 inno_hdmi-rockchip.txt to yaml
Message-ID: <20231205-agency-paralyses-2a7b6df25c66@spud>
References: <49c6afec-022f-02de-99a0-d409b64da198@gmail.com>
 <3f235189-da75-4e9d-ad68-8cbebca12f6d@gmail.com>
 <3331543a-73fb-3565-47c6-d3303c44ba21@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="7k2kR/ZshohNs10q"
Content-Disposition: inline
In-Reply-To: <3331543a-73fb-3565-47c6-d3303c44ba21@gmail.com>
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
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 hjc@rock-chips.com, mripard@kernel.org, Alex Bee <knaerzche@gmail.com>,
 linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7k2kR/ZshohNs10q
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 09:47:15PM +0100, Johan Jonker wrote:
> On 12/4/23 19:56, Alex Bee wrote:
> > Am 04.12.23 um 18:39 schrieb Johan Jonker:
> >> diff --git a/Documentation/devicetree/bindings/display/rockchip/rockch=
ip,inno-hdmi.yaml b/Documentation/devicetree/bindings/display/rockchip/rock=
chip,inno-hdmi.yaml
> >> new file mode 100644
> >> index 000000000000..96889c86849a
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,inno=
-hdmi.yaml
> >> @@ -0,0 +1,103 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/display/rockchip/rockchip,inno-hdm=
i.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Rockchip Innosilicon HDMI controller
> >> +
> >> +maintainers:
> >> +=A0 - Sandy Huang <hjc@rock-chips.com>
> >> +=A0 - Heiko Stuebner <heiko@sntech.de>
> >> +
> >> +properties:
> >> +=A0 compatible:
> >> +=A0=A0=A0 enum:
> >> +=A0=A0=A0=A0=A0 - rockchip,rk3036-inno-hdmi
> >> +
> >> +=A0 reg:
> >> +=A0=A0=A0 maxItems: 1
> >> +
> >> +=A0 interrupts:
> >> +=A0=A0=A0 maxItems: 1
> >> +
> >> +=A0 clocks:
> >> +=A0=A0=A0 maxItems: 1
>=20
> > The interrupts/clock description exists already in the txt-bindings - s=
o how about:
> >=20
> > +=A0=A0=A0 items:
> > +=A0=A0=A0=A0=A0 - descrition: ....
> >> +
>=20
> It's not common to do so when there's only one clock and nothing special =
to mention.
> Used this style for most of my conversions.=20
> Further rational might be given by Krzysztof and co.

Ye, when there is no ambiguity, having the description is not
required.

--7k2kR/ZshohNs10q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZW9WDgAKCRB4tDGHoIJi
0kOrAP9ylHU9P8zGa7mCfZC4jocgIUPfnviKF/UNsLkrX04RRgEAoOTHJFCbSG0E
PQExNlhDrVVvQL7O9+TCRCb60H04Uwg=
=Ow+j
-----END PGP SIGNATURE-----

--7k2kR/ZshohNs10q--
