Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E765550FDD6
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 14:55:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB33610E238;
	Tue, 26 Apr 2022 12:55:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B3FB10E238
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 12:55:47 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id BD53C5C0118;
 Tue, 26 Apr 2022 08:55:46 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 26 Apr 2022 08:55:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1650977746; x=1651064146; bh=VyZAdGl8C8
 i715U0d6sExgdmQCSXB0Of5dCmp0HBEBk=; b=a9jyohDAiaE0mNa5tsnZCrSbcd
 Kx14nTwUxia30K6c33g9UkMtbME7bvlGLpy4Ut1T0oRoniVKv6HAybyGXY1XETIk
 ptLjzKE1Hox56/J6/m4HU62I12925l75i8NZsiXOX4IEHOjhNdxGGpCZ+ljVWlOt
 xpspmeb13PdLVc3P1Mxb80IB7rjzf2EfzewbhINNS30EmWpB3OmpabQ9vY3gXVSo
 09vHYYjbQieA6oAmZmVWG4MrChUg+zT5w3d07LYMcWu1FmCntAW6jEHJfRkrT6HB
 ncV3/bRPwth+qK+yaFicuYxntecsLTjmVC7uLtav8sH8vQ8YJLF38yzqeQMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650977746; x=
 1651064146; bh=VyZAdGl8C8i715U0d6sExgdmQCSXB0Of5dCmp0HBEBk=; b=Z
 yl0j64TdFRHKgRljeGqQSxmcS8vB10l9vr4jWhFAJPqH2RGzG+bPQn7ou/rvXkEC
 nLbanxLbgOPwSv0L2KTIw770n61Hzmhn9vRQQBZs+ozRMszW82qgsQKHaurwo9vg
 qQhe2tSYcIUpH2c5sf3mGi0StpfVA+hpudIWAReI7+ijK4MMD9/HrDHb6M05ishu
 FkOE/BfYHIAfkecCH/cDsS4HD/AJ+gP31jHhw9v1ttOwmy+8yZeybYTX2X/oefQb
 aDXyoOrMUGRxDWw8ctY6Vt+ZKKmYfcPfee4FnOfTc2uwZlAQWxYaqn/I58QTQPqU
 Nom5qYv4PRLM6kMcjjS1w==
X-ME-Sender: <xms:0utnYmLXLoKzekZqpRw5eoR_yqfB2ibTz_YNLxU36bSWmRHtzrZwyA>
 <xme:0utnYuLcwVU_eX-teFKzc9DJruvKAiF5RZnpAmuJQkuvmpZN7DBqfkCQkOza1HGGi
 m6wErAiVOK6PgIoI6Q>
X-ME-Received: <xmr:0utnYmtwtkO_o6KDp4ctE2-hEK5FFFlK8swU8wofo80jqQJIw-r21Pw5cyeXI2felU-ibHxz3XxlZBy6Gt-6gYeazOduCNq1XNPoYT4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudefgdehgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:0utnYrZrNW_G5F9RiSmJhqUWDshSISMjixUlCw6eSfqw6ew85Kdhzg>
 <xmx:0utnYtYkkLSCWFbiXqujgV82_UKEOXGuUWkDdWgZYP3-GJzvT1fNyw>
 <xmx:0utnYnCPpmz7eKOYDa_2TFrgGaQnmlJc_l0zpHHvXWZoQPQBz1fluw>
 <xmx:0utnYhpiPAiekXwpx5OKGyL2IDIRB5GfBX9eaLo6XP9d4TP43HXVvw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 26 Apr 2022 08:55:45 -0400 (EDT)
Date: Tue, 26 Apr 2022 14:55:44 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
Message-ID: <20220426125544.mroteu3hvyvlyb6g@houat>
References: <20220420231230.58499-1-bjorn.andersson@linaro.org>
 <20220420231230.58499-2-bjorn.andersson@linaro.org>
 <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat>
 <YmEdAVwZuA7Wo1Ch@aptenodytes> <YmelPCcWCCjALtRU@aptenodytes>
 <YmfYi5G7hMKLAH3T@pendragon.ideasonboard.com>
 <YmfoiD0r8MD/kr1N@aptenodytes>
 <20220426125401.yyrhg6aeafdjw4ad@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="f3ucqbymt5myqdco"
Content-Disposition: inline
In-Reply-To: <20220426125401.yyrhg6aeafdjw4ad@houat>
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


--f3ucqbymt5myqdco
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 26, 2022 at 02:54:01PM +0200, Maxime Ripard wrote:
> On Tue, Apr 26, 2022 at 02:41:44PM +0200, Paul Kocialkowski wrote:
> > On Tue 26 Apr 22, 14:33, Laurent Pinchart wrote:
> > > On Tue, Apr 26, 2022 at 09:54:36AM +0200, Paul Kocialkowski wrote:
> > > > On Thu 21 Apr 22, 10:59, Paul Kocialkowski wrote:
> > > > > On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
> > > > > > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrote:
> > > > > > > + Linus
> > > > > > > + Marek
> > > > > > > + Laurent
> > > > > > > + Robert
> > > > > > >=20
> > > > > > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson wrote:
> > > > > > > >
> > > > > > > > Commit '80253168dbfd ("drm: of: Lookup if child node has pa=
nel or
> > > > > > > > bridge")' attempted to simplify the case of expressing a si=
mple panel
> > > > > > > > under a DSI controller, by assuming that the first non-grap=
h child node
> > > > > > > > was a panel or bridge.
> > > > > > > >
> > > > > > > > Unfortunately for non-trivial cases the first child node mi=
ght not be a
> > > > > > > > panel or bridge.  Examples of this can be a aux-bus in the =
case of
> > > > > > > > DisplayPort, or an opp-table represented before the panel n=
ode.
> > > > > > > >
> > > > > > > > In these cases the reverted commit prevents the caller from=
 ever finding
> > > > > > > > a reference to the panel.
> > > > > > > >
> > > > > > > > This reverts commit '80253168dbfd ("drm: of: Lookup if chil=
d node has
> > > > > > > > panel or bridge")', in favor of using an explicit graph ref=
erence to the
> > > > > > > > panel in the trivial case as well.
> > > > > > >=20
> > > > > > > This eventually breaks many child-based devm_drm_of_get_bridge
> > > > > > > switched drivers.  Do you have any suggestions on how to proc=
eed to
> > > > > > > succeed in those use cases as well?
> > > > > >=20
> > > > > > I guess we could create a new helper for those, like
> > > > > > devm_drm_of_get_bridge_with_panel, or something.
> > > > >=20
> > > > > Oh wow I feel stupid for not thinking about that.
> > > > >=20
> > > > > Yeah I agree that it seems like the best option.
> > > >=20
> > > > Should I prepare a patch with such a new helper?
> > > >=20
> > > > The idea would be to keep drm_of_find_panel_or_bridge only for the =
of graph
> > > > case and add one for the child node case, maybe:
> > > > drm_of_find_child_panel_or_bridge.
> > > >=20
> > > > I really don't have a clear idea of which driver would need to be s=
witched
> > > > over though. Could someone (Jagan?) let me know where it would be n=
eeded?
> > > >=20
> > > > Are there cases where we could both expect of graph and child node?
> > > > (i.e. does the new helper also need to try via of graph?)
> > >=20
> > > I still think we should use OF graph uncondtionally, even in the DSI
> > > case. We need to ensure backward-compatibility, but I'd like new
> > > bindings (and thus new drivers) to always use OF graph.
> >=20
> > I just went over the thread on "drm: of: Improve error handling in brid=
ge/panel
> > detection" again and I'm no longer sure there's actually still an issue=
 that
> > stands, with the fix that allows returning -ENODEV when possible.
> >=20
> > The remaining issue that was brought up was with a connector node, but =
it should
> > be up to the driver to detect that and avoid calling drm_of_find_panel_=
or_bridge
> > in such situations.
> >=20
> > So with that in mind it feels like the child node approach can be viable
> > (and integrated in the same helper).
> >=20
> > We might still want to favor an explicit OF graph approach, but note th=
at
> > dsi-controller.yaml also specifies extra properties that are specific to
> > MIPI DSI and I'm not sure there are equivalent definitions for the OF g=
raph
> > approach.
> >=20
> > What do you think?
>=20
> I don't think Laurent's point was to move the child node away from its
> DSI controller, that part doesn't make much sense. The panel or bridge
> is still accessed through the DSI bus, so it very much belongs there.
>=20
> What he meant I think was that we mandate the OF graph for all panels,
> so for panels/bridges controlled through DCS, you would still list the
> output through the graph.

Also, we're already in a bit of a mess right now. I don't think rushing
that kind of patches in a (late) rc is making much sense, but as I said,
if you want to start working on this, then I'll take a revert for the
next rc, and then we can work calmly on this.

Maxime

--f3ucqbymt5myqdco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYmfr0AAKCRDj7w1vZxhR
xbUmAP4tSJlyOhHnj4lT5D2bTAsRwi9EitxuW/l4CeXST2l+oQEAyXWYMaL9Brk1
ry6z8FHTykQJVq8rXR4AIswrqw/slAw=
=eYQz
-----END PGP SIGNATURE-----

--f3ucqbymt5myqdco--
