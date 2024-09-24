Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7609848FC
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 18:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECE8910E714;
	Tue, 24 Sep 2024 16:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GvK37+mp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C75D10E714
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 16:00:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E11475C57B0;
 Tue, 24 Sep 2024 16:00:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2AE1C4CEC4;
 Tue, 24 Sep 2024 16:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727193642;
 bh=RMVPLW4fWUk9yS+HMDAfSQbd+gQJXHQViB5tLV8d35M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GvK37+mp+LghOmr6eoGoJcX94ZEdvjXe7wWGvJCkmU96Jfz4t9wQAMCcHrj456VMu
 CTvjH6AQSibawNgM6pXkiRUbDkbpb5OB2u6GHKkU3OdPWYRsMb7NsThJQgay3GxhP5
 Oof/N2yNvyvOKMabXyy38g7l3rPmArWwRrHFImcMLmP34qUsZxYMlYO/z5HZ4P0Tlj
 1ukf9n15+s9ktGDKRonsgiNiCoFNvXmAw7OCRlWWHp1KQxcofuJX8494GiYt5I/sbF
 IQTyI/Kf+rr/XySGhmQGVFj6Xz+1gwU2CDrVff0GanXwhe+9jxkxPT92QrSGMZJLsG
 hAPsxiBHsx+3w==
Date: Tue, 24 Sep 2024 17:00:34 +0100
From: Conor Dooley <conor@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Macpaul Lin <macpaul.lin@mediatek.com>,
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
Message-ID: <20240924-commute-collision-13ad39717d31@spud>
References: <20240924103156.13119-1-macpaul.lin@mediatek.com>
 <20240924103156.13119-3-macpaul.lin@mediatek.com>
 <ffc1900b-3921-48ca-a2b2-1b798c57e572@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="sWezDfs+NRZqmEro"
Content-Disposition: inline
In-Reply-To: <ffc1900b-3921-48ca-a2b2-1b798c57e572@collabora.com>
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


--sWezDfs+NRZqmEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 01:42:01PM +0200, AngeloGioacchino Del Regno wrote:
> Il 24/09/24 12:31, Macpaul Lin ha scritto:
> > The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
> > to an excessively long 'clocks' property:
> >    display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long
> >=20
> > To resolve this issue, add "maxItems: 3" to the 'clocks' property in
> > the DT schema.
> >=20
> > Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each =
block to individual yaml")
> > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > ---
> >   .../devicetree/bindings/display/mediatek/mediatek,split.yaml     | 1 +
> >   1 file changed, 1 insertion(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediate=
k,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,=
split.yaml
> > index e4affc854f3d..42d2d483cc29 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split=
=2Eyaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split=
=2Eyaml
> > @@ -57,6 +57,7 @@ properties:
> >     clocks:
> >       items:
> >         - description: SPLIT Clock
>=20
> That's at least confusing (granted that it works) - either add a descript=
ion for
> each clock and then set `minItems: 1` (preferred), or remove this "SPLIT =
Clock"
> description and allow a maximum of 3 clocks.
>=20
> Removing the description can be done - IMO - because "SPLIT Clock" is, we=
ll,
> saying that the SPLIT block gets a SPLIT clock ... stating the obvious, a=
nyway.

Right, but what are the other two new clocks? Are they as obvious?
There's no clock-names here to give any more information as to what the
other clocks are supposed to be.

Kinda unrelated, but I think that "SPLIT Clock" probably isn't what the
name of the clock in the IP block is anyway, sounds more like the name
for it on the provider end..

--sWezDfs+NRZqmEro
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvLiIgAKCRB4tDGHoIJi
0jIKAP9UDveIts01lao6hVilWP0TMQRAzvdTTL1WDikEbViR4AD/fS4SyEZ73ptb
5bNB6iILTufZlc7BaAK6cEiNDImPLAw=
=ms3M
-----END PGP SIGNATURE-----

--sWezDfs+NRZqmEro--
