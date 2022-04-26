Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D710C50FD4A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DEB910E6C9;
	Tue, 26 Apr 2022 12:41:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAD410E6C9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:41:51 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EB464C000A;
 Tue, 26 Apr 2022 12:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650976909;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pzdJ46PqwD6NvLn4OGquoCJPE0sWtsTMeA7LqT/UYHM=;
 b=I7l2D0AQ5c8Pb7XRX4EWfk8Hv0ghS3I8GtmRjT3o7zcBkDgc2+yipAATSCEurgEprphx5e
 IDPdQxaC8J0mOPhvHnLyX86wNF9r1M9VqlM8t8emXWzQ5ZG2F2uaBH1zgcKQpWXobSFqeI
 wOyFcQ2VpJz78gbOprFVS+WXPo5fGBg3lgJFmuHvWZ9FNhLgtngBwsgZU8bwj6ktzkcVNl
 cid7IlIsS2e46ii9r7ne3HTIEV+hi7Nd9fSDVyrDp9ztc5alBZmaNKIXOBmDBTgPEKH/Vo
 MHM2jwHaITn0N5A+Y5mGnBEo5CydvrhXUpmA9VV8NRoJ3Vxgg1CHwa7ys2Zlcw==
Date: Tue, 26 Apr 2022 14:41:44 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
Message-ID: <YmfoiD0r8MD/kr1N@aptenodytes>
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat>
 <YmEdAVwZuA7Wo1Ch@aptenodytes> <YmelPCcWCCjALtRU@aptenodytes>
 <YmfYi5G7hMKLAH3T@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="F9z/MV/lH/oeMk3y"
Content-Disposition: inline
In-Reply-To: <YmfYi5G7hMKLAH3T@pendragon.ideasonboard.com>
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
Cc: David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Maxime Ripard <maxime@cerno.tech>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--F9z/MV/lH/oeMk3y
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 26 Apr 22, 14:33, Laurent Pinchart wrote:
> On Tue, Apr 26, 2022 at 09:54:36AM +0200, Paul Kocialkowski wrote:
> > On Thu 21 Apr 22, 10:59, Paul Kocialkowski wrote:
> > > On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
> > > > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > > > > + Linus
> > > > > + Marek
> > > > > + Laurent
> > > > > + Robert
> > > > >=20
> > > > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson wrote:
> > > > > >
> > > > > > Commit '80253168dbfd ("drm: of: Lookup if child node has panel =
or
> > > > > > bridge")' attempted to simplify the case of expressing a simple=
 panel
> > > > > > under a DSI controller, by assuming that the first non-graph ch=
ild node
> > > > > > was a panel or bridge.
> > > > > >
> > > > > > Unfortunately for non-trivial cases the first child node might =
not be a
> > > > > > panel or bridge.  Examples of this can be a aux-bus in the case=
 of
> > > > > > DisplayPort, or an opp-table represented before the panel node.
> > > > > >
> > > > > > In these cases the reverted commit prevents the caller from eve=
r finding
> > > > > > a reference to the panel.
> > > > > >
> > > > > > This reverts commit '80253168dbfd ("drm: of: Lookup if child no=
de has
> > > > > > panel or bridge")', in favor of using an explicit graph referen=
ce to the
> > > > > > panel in the trivial case as well.
> > > > >=20
> > > > > This eventually breaks many child-based devm_drm_of_get_bridge
> > > > > switched drivers.  Do you have any suggestions on how to proceed =
to
> > > > > succeed in those use cases as well?
> > > >=20
> > > > I guess we could create a new helper for those, like
> > > > devm_drm_of_get_bridge_with_panel, or something.
> > >=20
> > > Oh wow I feel stupid for not thinking about that.
> > >=20
> > > Yeah I agree that it seems like the best option.
> >=20
> > Should I prepare a patch with such a new helper?
> >=20
> > The idea would be to keep drm_of_find_panel_or_bridge only for the of g=
raph
> > case and add one for the child node case, maybe:
> > drm_of_find_child_panel_or_bridge.
> >=20
> > I really don't have a clear idea of which driver would need to be switc=
hed
> > over though. Could someone (Jagan?) let me know where it would be neede=
d?
> >=20
> > Are there cases where we could both expect of graph and child node?
> > (i.e. does the new helper also need to try via of graph?)
>=20
> I still think we should use OF graph uncondtionally, even in the DSI
> case. We need to ensure backward-compatibility, but I'd like new
> bindings (and thus new drivers) to always use OF graph.

I just went over the thread on "drm: of: Improve error handling in bridge/p=
anel
detection" again and I'm no longer sure there's actually still an issue that
stands, with the fix that allows returning -ENODEV when possible.

The remaining issue that was brought up was with a connector node, but it s=
hould
be up to the driver to detect that and avoid calling drm_of_find_panel_or_b=
ridge
in such situations.

So with that in mind it feels like the child node approach can be viable
(and integrated in the same helper).

We might still want to favor an explicit OF graph approach, but note that
dsi-controller.yaml also specifies extra properties that are specific to
MIPI DSI and I'm not sure there are equivalent definitions for the OF graph
approach.

What do you think?

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--F9z/MV/lH/oeMk3y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmJn6IgACgkQ3cLmz3+f
v9HfiAgAnddNYvh4bfTN9pfsyRPlJs7rKSuXMBHlH9jQ0Xa27352HuuJk/ScBKfo
PbezLdXEQ0SDOr3FJDnNzyl/jLsa0yV/cZssvaHxyv6a3fFFYksLWXAXnsbNfnNL
0AbIyEZT60n6F0j/fu9i76WgSbl+trzuuIcR5Ww+3n0RCmuhzX7nYVHVrlu7fqxh
iwpxgw1rK5hrCpaRRQkdoV/rt5keYkMPcJeHSRzfz3RrvNwDOwCP8r4ct5GvlOPu
/H/Pps5VDazKGxcAz5XU8WEAnKenXEnuwVKjcTlBGV1DWnmeZ5l5/Lj/HGhUzkR8
rO3j2wR98TchcaUL18WFS2V2CW2SFw==
=+4mx
-----END PGP SIGNATURE-----

--F9z/MV/lH/oeMk3y--
