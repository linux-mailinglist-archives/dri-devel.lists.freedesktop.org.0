Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09629A42C3A
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 20:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638D910E4D4;
	Mon, 24 Feb 2025 19:01:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VORHk7Wq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D08C10E4D4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 19:01:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E58DB5C54C3;
 Mon, 24 Feb 2025 19:00:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EB93C4CED6;
 Mon, 24 Feb 2025 19:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740423674;
 bh=tn7rMLzZMtYRYg7sNSmwLOytEKHtBv8WoWbob9xBWAM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VORHk7Wqt7FpXC7lv2ML0sepJs4sW6mDdIpTFKoV7wPrw0aR0r5iCxp8oLZLtoV0Y
 540ePSSJ0hU/aKR0bzvf8f/bPJf5wVzaDukJaEB5j0TRYA+99jJRCQ4S1tclH1EsVk
 395bkLFZhWxRREnrZo82NjoVBq+EYH9knwECJQhCvGguyL2NryDJ6Iztn0zVp1KOB1
 okSrPhygsQc3THoomI+G3QF/b3gCLzBmk+ew1EnHT5kwVUAZduTsUgpLNmkPfeGf/b
 GELUYLGonFzMCDJZMLWQ6selS3CyorJXMcDE/aAp0mj0qIeTCDm1eNFicwNARHIuja
 BTIyXR32KjUFA==
Date: Mon, 24 Feb 2025 19:01:08 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunny Shen =?utf-8?B?KOayiOWnjeWnjSk=?= <Sunny.Shen@mediatek.com>
Cc: Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "robh@kernel.org" <robh@kernel.org>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules
 for MT8196
Message-ID: <20250224-dreamland-tactile-bdb58daf6060@spud>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-2-sunny.shen@mediatek.com>
 <20250211-feed-shed-4b32f146cc54@spud>
 <029f9fd7ab898769a7ae627b160e1dce446ccc9e.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Kj7+TgqWhvqCa97w"
Content-Disposition: inline
In-Reply-To: <029f9fd7ab898769a7ae627b160e1dce446ccc9e.camel@mediatek.com>
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


--Kj7+TgqWhvqCa97w
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 23, 2025 at 05:49:45PM +0000, Sunny Shen (=E6=B2=88=E5=A7=8D=E5=
=A7=8D) wrote:
> On Tue, 2025-02-11 at 17:54 +0000, Conor Dooley wrote:
> > On Tue, Feb 11, 2025 at 10:52:50AM +0800, Sunny Shen wrote:
> > > Add MDP-RSZ hardware description for MediaTek MT8196 SoC

> > > +examples:
> > > +=C2=A0 - |
> > > +=C2=A0=C2=A0=C2=A0 soc {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <2>;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <2>;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disp_mdp_rsz0: disp-mdp-r=
sz0@321a0000 {
> >=20
> > And "disp-mdp-rsz0" isn't anything close to a generic node name.
>=20
> Will modify "disp-mdp-rsz0@321a0000" to "mdp-rsz@321a0000"

I don't think that's an improvement. Hint: full words would be a good
place to start

--Kj7+TgqWhvqCa97w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7zB9AAKCRB4tDGHoIJi
0movAP0T4ZSKqBTGVXYcSVdKvK8Atq3J5/N6tEb8HcMi9xx9UQEAkfBR5ULg8Sm6
kSeROWLffX6nrBC9VVNWJbYYIa/a0AI=
=v5zV
-----END PGP SIGNATURE-----

--Kj7+TgqWhvqCa97w--
