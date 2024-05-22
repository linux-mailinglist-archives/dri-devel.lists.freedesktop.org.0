Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07EE88CC42E
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 17:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F42510E202;
	Wed, 22 May 2024 15:35:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fJCaiQjL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6EC10E202
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 15:35:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 57ECA62A2A;
 Wed, 22 May 2024 15:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DE9C2BD11;
 Wed, 22 May 2024 15:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716392151;
 bh=Qd+NDxGOZ2bJf9sIDqREHnfFavqyfD7ddBDGDAxcjbk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fJCaiQjLOSkJeC8737kXYulTF1E8kx+viQmK6R8A79ohnS0Ia2oKO7niWQO25ldGP
 YcrmWJcjzgvYYamWATddny5NL8foEzHP71g5oKW+oZV2cvD+IbmF/V50RAHLsngVuW
 8T6ALDPEmvK1nPQML2+v2HFyWk40+BCuyzs1d7AFmd7wuIRr9poXzP7qvb3kGF5LA7
 k3x18K6WyK0m64ECtrMbp0YEnAQ1NR5l1clMI2yrI91yteJvWEX4i9zH6bLxnWIz8d
 6yzROBcTARIC05vmq7n0pwnrFEtY8Rk4mGhd5bjzNdXdFWL2JL9AbLdWWc5sMj7OYr
 0Q+7VSasTFxdw==
Date: Wed, 22 May 2024 16:35:44 +0100
From: Conor Dooley <conor@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 linux-kernel@vger.kernel.org, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>, Chris Morgan <macromorgan@hotmail.com>,
 Diederik de Haas <didi.debian@cknow.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: display: vop2: Add VP clock resets
Message-ID: <20240522-slimness-dullness-bb807f053c89@spud>
References: <20240514152328.21415-1-detlev.casanova@collabora.com>
 <13628421.uLZWGnKmhe@arisu>
 <20240521-silver-exciting-bb3725dc495d@spud>
 <3334403.5fSG56mABF@arisu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="O1xKPYmQ4qbvZFbX"
Content-Disposition: inline
In-Reply-To: <3334403.5fSG56mABF@arisu>
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


--O1xKPYmQ4qbvZFbX
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2024 at 11:31:36AM -0400, Detlev Casanova wrote:
> On Tuesday, May 21, 2024 2:31:51 P.M. EDT Conor Dooley wrote:
> > On Tue, May 21, 2024 at 01:15:46PM -0400, Detlev Casanova wrote:
> > > On Wednesday, May 15, 2024 12:33:22 P.M. EDT Heiko St=FCbner wrote:
> > > > Am Mittwoch, 15. Mai 2024, 18:19:29 CEST schrieb Conor Dooley:
> > > > > On Tue, May 14, 2024 at 11:19:47AM -0400, Detlev Casanova wrote:
> > > > > > Add the documentation for VOP2 video ports reset clocks.
> > > > > > One reset can be set per video port.
> > > > > >=20
> > > > > > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > > > >=20
> > > > > Are these resets valid for all VOPs or just the one on 3588?
> > > >=20
> > > > Not in that form.
> > > > I.e. rk3588 has 4 video-ports (0-3), while rk3568 has 3 (0-2).
> > > >=20
> > > > So the binding should take into account that rk3568 also has the
> > > > SRST_VOP0 ... SRST_VOP2.
> > >=20
> > > That is what is set in the example and the reason why I set minItems =
to 3
> > > in the main bindings.
> > > Then, the rk3588 specific part sets it to 4.
> > >=20
> > > Isn't that enough ?
> >=20
> > Not quite - you need to restrict maxItems to 3 for the other devices if
> > the clocks are not valid. What you've got says that 4 clocks are
> > possible but not needed on !rk3588.
> >=20
> I don't understand what "properties: resets: minItems: 3" means then. I=
=20
> thought it means that all devices should have at least 3 resets. Then the=
=20
> allOf below specifies the special case of rk3588 which has a minimum of 4=
=20
> resets.

The change you made to the bindings allows someone to define either 3
(because of minItems 3) or 4 (because there are 4 items in the list) resets
for the rk3568.

> Do I need to add=20
>         resets:
>           minItems: 3
>         reset-names:
>           minItems: 3
> in the "else:" ?

No, you need to add maxItems: 3 to the else.

> So in that case, I can remove "properties: resets: minItems: 3" above ?
>=20
> Also, what do you mean "If the clocks are not valid" ?

s/clocks/resets/ ;)

--O1xKPYmQ4qbvZFbX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZk4Q0AAKCRB4tDGHoIJi
0s0DAQDoOkPVLDr+HE00hhznKtcPPj+CcSSPyDVA/6sDIBivXQEAsVedCSlfxbXc
k7i+X+yRjsbEqstU9Tavi7c6NTEiuQI=
=aFFV
-----END PGP SIGNATURE-----

--O1xKPYmQ4qbvZFbX--
