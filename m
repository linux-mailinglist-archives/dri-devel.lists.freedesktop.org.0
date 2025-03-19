Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B374A699E4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Mar 2025 21:00:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0A0A10E35D;
	Wed, 19 Mar 2025 20:00:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mxFh5poV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A9910E35D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Mar 2025 20:00:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 71436A49317;
 Wed, 19 Mar 2025 19:54:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A385C4CEE4;
 Wed, 19 Mar 2025 20:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742414425;
 bh=kvoI88amUV+xRQVe583X4SdWMaeA6WhkypywOswnqf4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mxFh5poViDzonov3bqtwSZczfyVmPZc4ZtVjBkjdMg2kWZ2jhP/7DiDr9I74fsIqL
 2vGOFc/yiYEP1vSib4nL/ZsSObNw6nnzlArcjwL+oavUbM4DDibdienY7IbY+MiKed
 EP2HA9zalA5zNExD52ZqdrudbRRf9zSPlZxjYOWW/SHHnqhkjQBu3/gfJTH+cIsYF1
 IJh2sZo6SM3UCUS+qvh5gyhBb5MXTpFqXi/kFbO4iQOlC5I4w8hL/Moq+LUNYpOhUC
 EcQMMvjtic7T2IxiilyYJSXtBeagiSSxbuNRXDFZvHoS9qm9q/9MrmFl2Z3CKAAHTq
 /jkKzOmFBoosg==
Date: Wed, 19 Mar 2025 20:00:19 +0000
From: Conor Dooley <conor@kernel.org>
To: Sunny Shen =?utf-8?B?KOayiOWnjeWnjSk=?= <Sunny.Shen@mediatek.com>
Cc: "robh@kernel.org" <robh@kernel.org>,
 Nancy Lin =?utf-8?B?KOael+aso+ieoik=?= <Nancy.Lin@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 Singo Chang =?utf-8?B?KOW8teiIiOWciyk=?= <Singo.Chang@mediatek.com>,
 Paul-pl Chen =?utf-8?B?KOmZs+afj+mclik=?= <Paul-pl.Chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "treapking@chromium.org" <treapking@chromium.org>
Subject: Re: [PATCH 1/5] dt-bindings: display: mediatek: mdp-rsz: Add rules
 for MT8196
Message-ID: <20250319-footnote-trusting-230e509bed07@spud>
References: <20250211025317.399534-1-sunny.shen@mediatek.com>
 <20250211025317.399534-2-sunny.shen@mediatek.com>
 <20250211-feed-shed-4b32f146cc54@spud>
 <029f9fd7ab898769a7ae627b160e1dce446ccc9e.camel@mediatek.com>
 <20250224-dreamland-tactile-bdb58daf6060@spud>
 <76a6fc25a09dfddb55fdaf0a9d7dcf9a6129b00f.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="YDfFiUDQR01e6m8O"
Content-Disposition: inline
In-Reply-To: <76a6fc25a09dfddb55fdaf0a9d7dcf9a6129b00f.camel@mediatek.com>
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


--YDfFiUDQR01e6m8O
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 18, 2025 at 03:14:07AM +0000, Sunny Shen (=E6=B2=88=E5=A7=8D=E5=
=A7=8D) wrote:
> On Mon, 2025-02-24 at 19:01 +0000, Conor Dooley wrote:
> > On Sun, Feb 23, 2025 at 05:49:45PM +0000, Sunny Shen (=E6=B2=88=E5=A7=
=8D=E5=A7=8D) wrote:
> > > On Tue, 2025-02-11 at 17:54 +0000, Conor Dooley wrote:
> > > > On Tue, Feb 11, 2025 at 10:52:50AM +0800, Sunny Shen wrote:
> > > > > Add MDP-RSZ hardware description for MediaTek MT8196 SoC
> >=20
> > > > > +examples:
> > > > > +=C2=A0 - |
> > > > > +=C2=A0=C2=A0=C2=A0 soc {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =3D <2=
>;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D <2>;
> > > > > +
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disp_mdp_rsz0: disp-m=
dp-rsz0@321a0000 {
> > > >=20
> > > > And "disp-mdp-rsz0" isn't anything close to a generic node name.
> > >=20
> > > Will modify "disp-mdp-rsz0@321a0000" to "mdp-rsz@321a0000"
> >=20
> > I don't think that's an improvement. Hint: full words would be a good
> > place to start
>=20
> =C2=A0
> Hi Conor,
>=20
> About full words,=C2=A0
> Do you mean words like this?=C2=A0
> multimedia-display-path-resizer?
> or mdp-resizer?

These are both improvements on what you've got right now.

> We found that "mdp-rsz" this kind of word is used at
> https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/mediate=
k/mt8183.dtsi
>=20
> I'm not sure what will be better.
> Can you provide more detailed suggestion about this naming?

--YDfFiUDQR01e6m8O
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ9siUwAKCRB4tDGHoIJi
0qM6AP9QHiOJ1JZ8DbtI6sWT9DS41P7u5He+sMBB04jH28AtPgD9E9HooK6Of1XJ
+RkppxwWFhpzQPVFfQGxAiZm0J9taQo=
=bzKn
-----END PGP SIGNATURE-----

--YDfFiUDQR01e6m8O--
