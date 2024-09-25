Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 273279860D8
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 16:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CFA10E04D;
	Wed, 25 Sep 2024 14:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oq2W/6ik";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D3510E04D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 14:34:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C7CEBA401DB;
 Wed, 25 Sep 2024 14:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A959C4CEC3;
 Wed, 25 Sep 2024 14:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727274890;
 bh=dpQ/czRVTd2i1LaIRTZfUT2aSTnHS8M++kos8GBDjMI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oq2W/6ik4uHLxVqum7YpvzS6LKLKV+OtW5nJejIsnO+dt6aPiWsX6Iu72+JNHxp5c
 plKWY3hpOzeu/5aI9yuTbcd7R6afZgYPnp9EhpBs3UmUIqcnAa9pQfBSbI6ZyjuASL
 efhuhosNlwbOgW2Jc5mprIaPgqH3LNfsln3GtwEqYN2FTANtuYgXovIdp9OiTGlbk+
 AeOi7fNWgTc28lIOEiUBafHDcjJKWPe57zxZMlcSreeVvuGqz7bJFvjjWs3EQaesL/
 /5Rv3qZ/D64TvEObsrENGUlIpm2ricXIpygIvJX/H3tluPMBOqQNisr9N0biGpU/1Q
 04m4OM2IV/SWA==
Date: Wed, 25 Sep 2024 15:34:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 moudy.ho@mediatek.com, macross.chen@mediatek.com,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>,
 Bear Wang <bear.wang@mediatek.com>,
 Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 Sen Chu <sen.chu@mediatek.com>, Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 3/6] dt-bindings: display: mediatek: Fix clocks count
 constraint for new SoCs
Message-ID: <20240925-satisfy-epidermal-bd414891479a@spud>
References: <20240924103156.13119-1-macpaul.lin@mediatek.com>
 <20240924103156.13119-3-macpaul.lin@mediatek.com>
 <ffc1900b-3921-48ca-a2b2-1b798c57e572@collabora.com>
 <20240924-commute-collision-13ad39717d31@spud>
 <2821ef09-1b32-082d-69d1-e09a3a302447@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="J8wSVO8x24H35hg9"
Content-Disposition: inline
In-Reply-To: <2821ef09-1b32-082d-69d1-e09a3a302447@mediatek.com>
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


--J8wSVO8x24H35hg9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 04:42:59PM +0800, Macpaul Lin wrote:
>=20
> On 9/25/24 00:00, Conor Dooley wrote:
> > On Tue, Sep 24, 2024 at 01:42:01PM +0200, AngeloGioacchino Del Regno wr=
ote:
> > > Il 24/09/24 12:31, Macpaul Lin ha scritto:
> > > > The display node in mt8195.dtsi was triggering a CHECK_DTBS error d=
ue
> > > > to an excessively long 'clocks' property:
> > > >     display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too=
 long
> > > >=20
> > > > To resolve this issue, add "maxItems: 3" to the 'clocks' property in
> > > > the DT schema.
> > > >=20
> > > > Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split e=
ach block to individual yaml")
> > > > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > > > ---
> > > >    .../devicetree/bindings/display/mediatek/mediatek,split.yaml    =
 | 1 +
> > > >    1 file changed, 1 insertion(+)
> > > >=20
> > > > diff --git a/Documentation/devicetree/bindings/display/mediatek/med=
iatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/media=
tek,split.yaml
> > > > index e4affc854f3d..42d2d483cc29 100644
> > > > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,s=
plit.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,s=
plit.yaml
> > > > @@ -57,6 +57,7 @@ properties:
> > > >      clocks:
> > > >        items:
> > > >          - description: SPLIT Clock
> > >=20
> > > That's at least confusing (granted that it works) - either add a desc=
ription for
> > > each clock and then set `minItems: 1` (preferred), or remove this "SP=
LIT Clock"
> > > description and allow a maximum of 3 clocks.
> > >=20
> > > Removing the description can be done - IMO - because "SPLIT Clock" is=
, well,
> > > saying that the SPLIT block gets a SPLIT clock ... stating the obviou=
s, anyway.
> >=20
> > Right, but what are the other two new clocks? Are they as obvious?
> > There's no clock-names here to give any more information as to what the
> > other clocks are supposed to be.
> >=20
> > Kinda unrelated, but I think that "SPLIT Clock" probably isn't what the
> > name of the clock in the IP block is anyway, sounds more like the name
> > for it on the provider end..
>=20
> Thanks for the suggestions. I think Moudy could help on the new fixes
> for both DT schem and mt8195.dtsi. This patch could be separated from
> origin patch set.

Not sure what you mean about separating it, if you mean correcting the
description for the split clock sure. The other stuff I mentioned needs
to be resolved before I'm willing to ack this.

--J8wSVO8x24H35hg9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvQfggAKCRB4tDGHoIJi
0kZaAQDow3QEAY+WQ0ufqkVPpT6Klr1sLJA3DGBOMb0OR2mFBAD+LZNm99NaPFvR
YY8n+V0cs0h8KfWB99zY2q0PPvHvNwc=
=5wf9
-----END PGP SIGNATURE-----

--J8wSVO8x24H35hg9--
