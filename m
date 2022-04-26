Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BE350FDBC
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:54:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC2910E067;
	Tue, 26 Apr 2022 12:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FA610E067
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:54:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C9C7C5C01AB;
 Tue, 26 Apr 2022 08:54:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 26 Apr 2022 08:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1650977643; x=1651064043; bh=KqyOC63okT
 CBiZ8lJYPrKN9nzXKeDkTwLdtSOukq/2E=; b=cj3X/K838OBL/WFeHgbEJXzedj
 13tSVv8zQe0VlGl9J60aelN/dBdUNf3rokUv6/sX5NxTEwQ+8J/ElQqTrqxTSzq1
 6dVl/PBu6W+iKvdGpcuYBb8duWaaxgRdDtUwRtx+5ueeahia53pk0Ry2KLWfPyy9
 lU5JlrhrXqIIXhJxDZXterHrQzmhi5B97K0cF1LiJtigdlCtIeslvojtp3ufMsRy
 28ZCn5uXH6HtmOxxYv59AaxDo9uaP7kRXax2c5mcG6jPm2PHbWMrxYA/D+NoPQT7
 Va/iuEgBRYDQemTz9iSZq/EBIWCCTZh7aIOT6RytwTCmLuEdYZjFxsx6zhmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650977643; x=
 1651064043; bh=KqyOC63okTCBiZ8lJYPrKN9nzXKeDkTwLdtSOukq/2E=; b=V
 HP4ImsGg2NK1FxzrLMDBrSdd/YbtNX7CciCgJr0nkR6ynG4YEa0siMwH7TSjLc7V
 tnT6t4UUOn2xHQ1B3H515clGBR/iL6WUpBrB1NMZXlBmCkUTT0PR0TLdbhPzbuFE
 xo+3NV9vQc+p0gM/e0K9zat8/5kB3lFmiFhjxX/U2oGz1f/gvCPmt5uRoZygI4mK
 YZwG57aNlhLDB1anaCNx82mXkDaNNW3mfXyOZxUrmC9CkGpEY2gN7cHzOHjq1+2t
 hwS159Jw7/AIJIBDhmuwworreEMvx/bMxQh4/LqCJM415m242Ak45Joe7Jvd4+Lg
 RhLMLGG7rlwIS/QPeL4Xg==
X-ME-Sender: <xms:a-tnYtMPWEPWH14xSlFezZKwQpy_Osr3WAp4N1ASl_HpNc8U6xWnig>
 <xme:a-tnYv9qMKOwum7d77SOVHoYbwC3V_oNIqBinSoHrMBZJLway9nukz8Sl7JDT1C58
 vrBDsQUaeqZ0YizhvQ>
X-ME-Received: <xmr:a-tnYsQAM7jXyMnImpmhQeQbtSMIQF_OEBcglYe4A8-4pzirVI_v_I6q7BWYbuTPerpm5ExISkkKh_P1RtktGX0HKIDyC5GDHLJa0Uo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:a-tnYpvX-jGIfHp6ZwiowwjqD5F_H1gZ_V-0MjISW4V9HtIS0g5TmA>
 <xmx:a-tnYlfTqg4-p6QwsQZVOmNVYxKAZd4OXU-3Aad9SUjUkCZm1FjZxA>
 <xmx:a-tnYl3Ctn9Dgi7PIx5mM0eZzmSMvvCez_yyJDgUa3Y-c7FhcoPJuQ>
 <xmx:a-tnYo8-lhmxmEAwxTi2TwiZdE-RoUXyId5WCn06YoAWtK4rDQpt0A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 08:54:03 -0400 (EDT)
Date: Tue, 26 Apr 2022 14:54:01 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
Message-ID: <20220426125401.yyrhg6aeafdjw4ad@houat>
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat>
 <YmEdAVwZuA7Wo1Ch@aptenodytes> <YmelPCcWCCjALtRU@aptenodytes>
 <YmfYi5G7hMKLAH3T@pendragon.ideasonboard.com>
 <YmfoiD0r8MD/kr1N@aptenodytes>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="y6e5ldbnofa2rtha"
Content-Disposition: inline
In-Reply-To: <YmfoiD0r8MD/kr1N@aptenodytes>
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
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--y6e5ldbnofa2rtha
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 02:41:44PM +0200, Paul Kocialkowski wrote:
> On Tue 26 Apr 22, 14:33, Laurent Pinchart wrote:
> > On Tue, Apr 26, 2022 at 09:54:36AM +0200, Paul Kocialkowski wrote:
> > > On Thu 21 Apr 22, 10:59, Paul Kocialkowski wrote:
> > > > On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
> > > > > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > > > > > + Linus
> > > > > > + Marek
> > > > > > + Laurent
> > > > > > + Robert
> > > > > >=20
> > > > > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson wrote:
> > > > > > >
> > > > > > > Commit '80253168dbfd ("drm: of: Lookup if child node has pane=
l or
> > > > > > > bridge")' attempted to simplify the case of expressing a simp=
le panel
> > > > > > > under a DSI controller, by assuming that the first non-graph =
child node
> > > > > > > was a panel or bridge.
> > > > > > >
> > > > > > > Unfortunately for non-trivial cases the first child node migh=
t not be a
> > > > > > > panel or bridge.  Examples of this can be a aux-bus in the ca=
se of
> > > > > > > DisplayPort, or an opp-table represented before the panel nod=
e.
> > > > > > >
> > > > > > > In these cases the reverted commit prevents the caller from e=
ver finding
> > > > > > > a reference to the panel.
> > > > > > >
> > > > > > > This reverts commit '80253168dbfd ("drm: of: Lookup if child =
node has
> > > > > > > panel or bridge")', in favor of using an explicit graph refer=
ence to the
> > > > > > > panel in the trivial case as well.
> > > > > >=20
> > > > > > This eventually breaks many child-based devm_drm_of_get_bridge
> > > > > > switched drivers.  Do you have any suggestions on how to procee=
d to
> > > > > > succeed in those use cases as well?
> > > > >=20
> > > > > I guess we could create a new helper for those, like
> > > > > devm_drm_of_get_bridge_with_panel, or something.
> > > >=20
> > > > Oh wow I feel stupid for not thinking about that.
> > > >=20
> > > > Yeah I agree that it seems like the best option.
> > >=20
> > > Should I prepare a patch with such a new helper?
> > >=20
> > > The idea would be to keep drm_of_find_panel_or_bridge only for the of=
 graph
> > > case and add one for the child node case, maybe:
> > > drm_of_find_child_panel_or_bridge.
> > >=20
> > > I really don't have a clear idea of which driver would need to be swi=
tched
> > > over though. Could someone (Jagan?) let me know where it would be nee=
ded?
> > >=20
> > > Are there cases where we could both expect of graph and child node?
> > > (i.e. does the new helper also need to try via of graph?)
> >=20
> > I still think we should use OF graph uncondtionally, even in the DSI
> > case. We need to ensure backward-compatibility, but I'd like new
> > bindings (and thus new drivers) to always use OF graph.
>=20
> I just went over the thread on "drm: of: Improve error handling in bridge=
/panel
> detection" again and I'm no longer sure there's actually still an issue t=
hat
> stands, with the fix that allows returning -ENODEV when possible.
>=20
> The remaining issue that was brought up was with a connector node, but it=
 should
> be up to the driver to detect that and avoid calling drm_of_find_panel_or=
_bridge
> in such situations.
>=20
> So with that in mind it feels like the child node approach can be viable
> (and integrated in the same helper).
>=20
> We might still want to favor an explicit OF graph approach, but note that
> dsi-controller.yaml also specifies extra properties that are specific to
> MIPI DSI and I'm not sure there are equivalent definitions for the OF gra=
ph
> approach.
>=20
> What do you think?

I don't think Laurent's point was to move the child node away from its
DSI controller, that part doesn't make much sense. The panel or bridge
is still accessed through the DSI bus, so it very much belongs there.

What he meant I think was that we mandate the OF graph for all panels,
so for panels/bridges controlled through DCS, you would still list the
output through the graph.

Maxime

--y6e5ldbnofa2rtha
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYmfraQAKCRDj7w1vZxhR
xTLvAPwNTRGGtvE//BlyATQ4o/WTVAfO/eP5PRbMPa1jRUc95AD/a/wgPoeGE+ap
VSrVt3Fc47ZURZmI1uOBRoIGcl1Kfgc=
=4Mvq
-----END PGP SIGNATURE-----

--y6e5ldbnofa2rtha--
