Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88B6989149
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 22:14:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 080CF10E1CD;
	Sat, 28 Sep 2024 20:14:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JSHM4egy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5C510E1CD
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 20:14:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AF4265C01AC;
 Sat, 28 Sep 2024 20:14:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DA6CC4CEC3;
 Sat, 28 Sep 2024 20:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727554466;
 bh=fyzkp8bwC+pgUCdnd/ipBoI0RRrRQvdTxtU1+uStjnE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JSHM4egySK3ezdTOqKcIpDj8cQX3z1AAr6lqvqqTdKVx0OWDlqhPhp908NTUbGMgv
 PB15gK0cQ4KW+H0wmbEbEltG3rsLnnpqEiN6xrXptgDaQ3UvYh4vQr3wDnyua+GdvM
 nGEJ87/BBQLVLp7Nqh/f79aNFNvEhnyEfQpxaYcNu9rzpOJFzKQ3fz/r6basWILMLI
 R9usdwOLwKR0Q4cmKmYi9dSbLMEQIXtO1s10v2XtQp8H2ZZ6nN6t2VIantBsAjiEKp
 6HP6A7RaJC4LveccmPV0bZCLchG4RoSA5OgIKEOlwdM8iVvVEPty8Bf2j1haujXQqH
 6imGmxrESn6FQ==
Date: Sat, 28 Sep 2024 21:14:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Moudy Ho =?utf-8?B?KOS9leWul+WOnyk=?= <Moudy.Ho@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Macpaul Lin =?utf-8?B?KOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
 Pablo Sun =?utf-8?B?KOWtq+avk+e/lCk=?= <pablo.sun@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Chris-qj Chen =?utf-8?B?KOmZs+Wlh+mAsik=?= <Chris-qj.Chen@mediatek.com>,
 Bear Wang =?utf-8?B?KOiQqeWOn+aDn+W+tyk=?= <bear.wang@mediatek.com>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "mripard@kernel.org" <mripard@kernel.org>,
 Macross Chen =?utf-8?B?KOmZs+izoueiqSk=?= <macross.chen@mediatek.com>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "macpaul@gmail.com" <macpaul@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 Yong Wu =?utf-8?B?KOWQtOWLhyk=?= <Yong.Wu@mediatek.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 Alexandre Mergnat <amergnat@baylibre.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Sen Chu =?utf-8?B?KOWCqOajrik=?= <Sen.Chu@mediatek.com>,
 "will@kernel.org" <will@kernel.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: [PATCH 3/6] dt-bindings: display: mediatek: Fix clocks count
 constraint for new SoCs
Message-ID: <20240928-hummus-carol-0f09081f892d@spud>
References: <20240924103156.13119-1-macpaul.lin@mediatek.com>
 <20240924103156.13119-3-macpaul.lin@mediatek.com>
 <ffc1900b-3921-48ca-a2b2-1b798c57e572@collabora.com>
 <20240924-commute-collision-13ad39717d31@spud>
 <2821ef09-1b32-082d-69d1-e09a3a302447@mediatek.com>
 <20240925-satisfy-epidermal-bd414891479a@spud>
 <7a1315ef-4be5-4528-858b-9f07c814636d@collabora.com>
 <93d9ffbe466ff61d5426b6f158a4b8464f56824d.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="AcDfy0agmX9jcKA8"
Content-Disposition: inline
In-Reply-To: <93d9ffbe466ff61d5426b6f158a4b8464f56824d.camel@mediatek.com>
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


--AcDfy0agmX9jcKA8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 02:27:14AM +0000, Moudy Ho (=E4=BD=95=E5=AE=97=E5=
=8E=9F) wrote:
> On Thu, 2024-09-26 at 11:38 +0200, AngeloGioacchino Del Regno wrote:
> > Il 25/09/24 16:34, Conor Dooley ha scritto:
> > > On Wed, Sep 25, 2024 at 04:42:59PM +0800, Macpaul Lin wrote:
> > > >=20
> > > > On 9/25/24 00:00, Conor Dooley wrote:
> > > > > On Tue, Sep 24, 2024 at 01:42:01PM +0200, AngeloGioacchino Del
> > > > > Regno wrote:
> > > > > > Il 24/09/24 12:31, Macpaul Lin ha scritto:
> > > > > > > The display node in mt8195.dtsi was triggering a CHECK_DTBS
> > > > > > > error due
> > > > > > > to an excessively long 'clocks' property:
> > > > > > >      display@14f06000: clocks: [[31, 14], [31, 43], [31,
> > > > > > > 44]] is too long
> > > > > > >=20
> > > > > > > To resolve this issue, add "maxItems: 3" to the 'clocks'
> > > > > > > property in
> > > > > > > the DT schema.
> > > > > > >=20
> > > > > > > Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp:
> > > > > > > split each block to individual yaml")
> > > > > > > Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> > > > > > > ---
> > > > > > >     .../devicetree/bindings/display/mediatek/mediatek,split
> > > > > > > .yaml     | 1 +
> > > > > > >     1 file changed, 1 insertion(+)
> > > > > > >=20
> > > > > > > diff --git
> > > > > > > a/Documentation/devicetree/bindings/display/mediatek/mediat
> > > > > > > ek,split.yaml
> > > > > > > b/Documentation/devicetree/bindings/display/mediatek/mediat
> > > > > > > ek,split.yaml
> > > > > > > index e4affc854f3d..42d2d483cc29 100644
> > > > > > > ---
> > > > > > > a/Documentation/devicetree/bindings/display/mediatek/mediat
> > > > > > > ek,split.yaml
> > > > > > > +++
> > > > > > > b/Documentation/devicetree/bindings/display/mediatek/mediat
> > > > > > > ek,split.yaml
> > > > > > > @@ -57,6 +57,7 @@ properties:
> > > > > > >       clocks:
> > > > > > >         items:
> > > > > > >           - description: SPLIT Clock
> > > > > >=20
> > > > > > That's at least confusing (granted that it works) - either
> > > > > > add a description for
> > > > > > each clock and then set `minItems: 1` (preferred), or remove
> > > > > > this "SPLIT Clock"
> > > > > > description and allow a maximum of 3 clocks.
> > > > > >=20
> > > > > > Removing the description can be done - IMO - because "SPLIT
> > > > > > Clock" is, well,
> > > > > > saying that the SPLIT block gets a SPLIT clock ... stating
> > > > > > the obvious, anyway.
> > > > >=20
> > > > > Right, but what are the other two new clocks? Are they as
> > > > > obvious?
> > > > > There's no clock-names here to give any more information as to
> > > > > what the
> > > > > other clocks are supposed to be.
> > > > >=20
> > > > > Kinda unrelated, but I think that "SPLIT Clock" probably isn't
> > > > > what the
> > > > > name of the clock in the IP block is anyway, sounds more like
> > > > > the name
> > > > > for it on the provider end..
> > > >=20
> > > >=20
>  * Thanks for the suggestions. I think Moudy could help on the new
>    fixes
> > > > for both DT schem and mt8195.dtsi. This patch could be separated
> > > > from
> > > > origin patch set.
> > >=20
> > > Not sure what you mean about separating it, if you mean correcting
> > > the
> > > description for the split clock sure. The other stuff I mentioned
> > > needs
> > > to be resolved before I'm willing to ack this.
> >=20
> > He means separating this patch from the rest of the series that he
> > pushed - which
> > is okay, as it's a bit mixed anyway :-)
> >=20
> > Besides ... Moudy, can you please help to clarify the description of
> > those clocks?
>=20
> May I address the check error by adding 2 functional descriptions and
> specifying 'minIeims: 1' for this property, and apply the limit by
> setting 'maxItems: 3' in MT8195 additional condition?


That sounds reasonable

--AcDfy0agmX9jcKA8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZvhjmQAKCRB4tDGHoIJi
0t5tAP9AhQrQg5BdiPm51hIYX60FP2j5MfqK3fnJyGLtjY+MhgEAnLtFBSFfQFkq
wjGbq54IMzZ/w/JrwtVg7Y9ctV0+GAc=
=/UTH
-----END PGP SIGNATURE-----

--AcDfy0agmX9jcKA8--
