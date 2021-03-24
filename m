Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B7D347584
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 11:11:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9636E9A9;
	Wed, 24 Mar 2021 10:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15B3D6E9AA
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:11:17 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 12751D6D;
 Wed, 24 Mar 2021 06:11:15 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 24 Mar 2021 06:11:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=+wQbldXodj/75p2l96uhI6Hek8z
 qcssRoaEMguqNWGM=; b=TL21/JHiqptwbT7hJ3+/ZmItwMc3LKk7LrRBg3BiB+2
 0oE/xykRj8ur8gwWgEy4Z7QwQU8kIGSoDqwIAdGY74mp3FkZQ2afaMLl3v1yUclX
 5PnDYYD7EhivFmGYIEgCd3iUjPPdqK6/sjV+GHEzYFDjAvawO7V/29+qByntk5/q
 IENXTFMgB2MyOmFriJlvCoiOYnAr9GgzRS/UlKaiC4iYVy8HFBBH3b51nod1LCsP
 B7f23i+vSTu2yfWAfJl6399I5VaXiLeoJbtUXutEBDWmXusB8JumbAu1+wJg3vuF
 7r4HZ4Zemhfmb47Q8Z7hzntl5DiUnWiBA1+JTFuh4Wg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+wQbld
 Xodj/75p2l96uhI6Hek8zqcssRoaEMguqNWGM=; b=C20aS6qvips2PFG84xF/JZ
 +siHrFDdTkoZvgqXUNtt3iGVEAIu8UtjzJL1ZmuGePHi81mNXTEtucVKm98beXMh
 uV9+q/oZuEIOs2JYuuAtx/qbE8XbyHkXTbc7GCbVJivwEvDjRQZdA2pxrokWdKLc
 D2VMDThyTcAJcHfpYdCH4ea3UlTkHZNuZIz33o8BQm0J7hy9fFci3hyms+Tcdf7h
 Olr7pzBMBjqm+6tzP50US+8FZkqg73ki7a8TBSDB9AF8ZhuPB8yZnQqtPlJWwZMg
 /rDKL8D5FrqMUrR8dEf0M2UgEb0M5TdQIqSpvDXBgLlYwEXE3fQY9MXcvChud1AA
 ==
X-ME-Sender: <xms:QBBbYLGRKXp7I9RXURuAAGVfUK4JYN7kr1ywmpyFPuTknkDensSszQ>
 <xme:QBBbYIUqunFZqSme0dpncKyRWzPRVJtWEeWGmpghKg0EOTJUpeCo9wo76WrIP5Ie_
 fUI_NfxYxnN7dL_mIY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudegkedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepledtrdekledrieekrd
 ejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:QBBbYNLwcy4JR42FSnJG329UPefxRa_z_y4ZBMz_6xfAECL-UENFqA>
 <xmx:QBBbYJGhNVQI2pHTpPDAMRMU1eWUXppWsiGw5g5h6kq6qWFbSZi4aw>
 <xmx:QBBbYBXV7fWOL2Bdoi4cKVHg3Blq_tgmQZ62Phzm93_zEctFsBA0BQ>
 <xmx:QhBbYAFgR2s7nMnwohLsO-8n2j52bh8caHecBi79ZBO2Y1voyq5hDw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 68161108005C;
 Wed, 24 Mar 2021 06:11:12 -0400 (EDT)
Date: Wed, 24 Mar 2021 11:11:09 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v4 1/4] drm: sun4i: dsi: Use drm_of_find_panel_or_bridge
Message-ID: <20210324101109.k46k3l7bksvxhll5@gilmour>
References: <20210322140152.101709-1-jagan@amarulasolutions.com>
 <20210322140152.101709-2-jagan@amarulasolutions.com>
 <YFpxYpA+EIZm7sOf@pendragon.ideasonboard.com>
 <f47bc0ad-dbd6-05b5-aaec-2e3256e3715a@sholland.org>
 <CAMty3ZDOVeMeYTsuF8n4EQTG6eEbj6e33TuTPrFiMWG4RhRdSw@mail.gmail.com>
 <YFsIkGH2cRgWk8z9@pendragon.ideasonboard.com>
 <CAMty3ZBGnz_a4_HO_TZ-zPNJwHMcVJyrBi3kZX2=a6G47Ze-yw@mail.gmail.com>
 <YFsMl2CB0ZmpJiKf@pendragon.ideasonboard.com>
MIME-Version: 1.0
In-Reply-To: <YFsMl2CB0ZmpJiKf@pendragon.ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Samuel Holland <samuel@sholland.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chen-Yu Tsai <wens@csie.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0975975783=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0975975783==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kp676o7nybn544nt"
Content-Disposition: inline


--kp676o7nybn544nt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 24, 2021 at 11:55:35AM +0200, Laurent Pinchart wrote:
> Hi Jagan,
>=20
> On Wed, Mar 24, 2021 at 03:19:10PM +0530, Jagan Teki wrote:
> > On Wed, Mar 24, 2021 at 3:09 PM Laurent Pinchart wrote:
> > > On Wed, Mar 24, 2021 at 02:44:57PM +0530, Jagan Teki wrote:
> > > > On Wed, Mar 24, 2021 at 8:18 AM Samuel Holland wrote:
> > > > > On 3/23/21 5:53 PM, Laurent Pinchart wrote:
> > > > > > On Mon, Mar 22, 2021 at 07:31:49PM +0530, Jagan Teki wrote:
> > > > > >> Replace of_drm_find_panel with drm_of_find_panel_or_bridge
> > > > > >> for finding panel, this indeed help to find the bridge if
> > > > > >> bridge support added.
> > > > > >>
> > > > > >> Added NULL in bridge argument, same will replace with bridge
> > > > > >> parameter once bridge supported.
> > > > > >>
> > > > > >> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > > > >
> > > > > > Looks good, there should be no functional change.
> > > > >
> > > > > Actually this breaks all existing users of this driver, see below.
> > > > >
> > > > > > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.co=
m>
> > > > > >
> > > > > >> ---
> > > > > >> Changes for v4, v3:
> > > > > >> - none
> > > > > >>
> > > > > >>  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 11 ++++++++---
> > > > > >>  1 file changed, 8 insertions(+), 3 deletions(-)
> > > > > >>
> > > > > >> diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/=
gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > > >> index 4f5efcace68e..2e9e7b2d4145 100644
> > > > > >> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > > >> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > > > > >> @@ -21,6 +21,7 @@
> > > > > >>
> > > > > >>  #include <drm/drm_atomic_helper.h>
> > > > > >>  #include <drm/drm_mipi_dsi.h>
> > > > > >> +#include <drm/drm_of.h>
> > > > > >>  #include <drm/drm_panel.h>
> > > > > >>  #include <drm/drm_print.h>
> > > > > >>  #include <drm/drm_probe_helper.h>
> > > > > >> @@ -963,10 +964,14 @@ static int sun6i_dsi_attach(struct mipi_=
dsi_host *host,
> > > > > >>                          struct mipi_dsi_device *device)
> > > > > >>  {
> > > > > >>      struct sun6i_dsi *dsi =3D host_to_sun6i_dsi(host);
> > > > > >> -    struct drm_panel *panel =3D of_drm_find_panel(device->dev=
=2Eof_node);
> > > > >
> > > > > This is using the OF node of the DSI device, which is a direct ch=
ild of
> > > > > the DSI host's OF node. There is no OF graph involved.
> > > > >
> > > > > >> +    struct drm_panel *panel;
> > > > > >> +    int ret;
> > > > > >> +
> > > > > >> +    ret =3D drm_of_find_panel_or_bridge(dsi->dev->of_node, 0,=
 0,
> > > > > >> +                                      &panel, NULL);
> > > > >
> > > > > However, this function expects to find the panel using OF graph. =
This
> > > > > does not work with existing device trees (PinePhone, PineTab) whi=
ch do
> > > > > not use OF graph to connect the panel. And it cannot work, becaus=
e the
> > > > > DSI host's binding specifies a single port: the input port from t=
he
> > > > > display engine.
> > > >
> > > > Thanks for noticing this. I did understand your point and yes, I did
> > > > mention the updated pipeline in previous versions and forgot to add=
 it
> > > > to this series.
> > > >
> > > > Here is the updated pipeline to make it work:
> > > >
> > > > https://patchwork.kernel.org/project/dri-devel/patch/20190524104252=
=2E20236-1-jagan@amarulasolutions.com/
> > > >
> > > > Let me know your comments on this, so I will add a patch for the
> > > > above-affected DTS files.
> > >
> > > DT is an ABI, we need to ensure backward compatibility. Changes in
> > > kernel drivers can't break devices that have an old DT.
> >=20
> > Thanks for your point.
> >=20
> > So, we need to choose APIs that would compatible with the old DT and
> > new DT changes. Am I correct?
>=20
> Yes, that's correct.

However, I see no particular reason to change the DT binding in this
case. The DSI devices are supposed to be described through a subnode of
their DSI controller, that's the generic binding and except for very odd
devices (and a bridge like this one is certainly not one), I see no
reason to deviate from that.

Maxime

--kp676o7nybn544nt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYFsQPQAKCRDj7w1vZxhR
xTMWAPoCqODHVwflYc37O1/gdVmLbZhcAVai6G99UtzoYOo5ygEArcWtqJ+TiVFf
Y9qWwugKta+xfxFuIgIPVB46nGBixA4=
=NGvV
-----END PGP SIGNATURE-----

--kp676o7nybn544nt--

--===============0975975783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0975975783==--
