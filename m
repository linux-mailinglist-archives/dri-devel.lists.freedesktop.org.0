Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E30451A348
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 17:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD8C10E126;
	Wed,  4 May 2022 15:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA72D10E126
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 15:09:02 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 79A68320095B;
 Wed,  4 May 2022 11:09:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 04 May 2022 11:09:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1651676939; x=1651763339; bh=UEdjlSWbPN
 odoYMxMQh4+HmwveeXvhVk46I6Hzv0bH0=; b=SsZLYZ68asGqDK4yqfCQO//8Qq
 99Hf8tuc1JAf07YZBpL/VAp/1Tew1HQnKZhA4+k0KbVqHyPbGHrrIql/NHkFLRo8
 vGxOBmbdIMOgaDm7fOtye/dGuHtDosM4hzcagiUxIkAFT04j+md0j8mDuDdUpQl1
 1GFrOOaZ5b72FC4h1BPwQTBkOtBNJ1krM1MDLX7o/91ah6MNjmUXdD7aQkr1pAcI
 COUeNGGVAOf+AQsrNjaJiQhw28APXGXCvjenCMD3qK68a56v4TLtSjKfIYZPkEKr
 xT++qXSMZi0yxQbPxySKS0fvUJ74TjtvxYXYB/s/qPnY+xRsOAlaMoUMLqpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651676939; x=
 1651763339; bh=UEdjlSWbPNodoYMxMQh4+HmwveeXvhVk46I6Hzv0bH0=; b=i
 QpXcN+gGu/9LPcZEFG7KhtY++OihFWOUiRLnb0FC04O3HjEIMQ9GJAsY0h1RUJ0Q
 OoxCRyddG96WsIlDklKKMp76NBLK7ByqcFoDPQGjoRkYvO2NRyTQy4U6+iTvQSe7
 sxPgedAVLwKt0lcuQiNuTzUhedHcyb56VKegaCc7avdZ0Ef5pnjhIdbb5kuNOt/i
 pMtp7OxTropz7QSZNbxLcpG8ZzL4/Zi5N0oU+p1EdnE0XfrDDqOupDXBc3A6y4ob
 Q4VhBRe8cJWokGkH8Q1kQCNGHhQcGzz4ISSINKPNkvH85izBbpcEZ2KmXUrDaic7
 oR0vMDo+/V8bV0FcUHz6g==
X-ME-Sender: <xms:CpdyYrvH0o6H-uuEIsslAHV5sYclYo8JqCTBocPrPDGwK8FHhXdLXQ>
 <xme:CpdyYscoi8GEfV41OOmS-0rSl4vbhinI8ABpnqHtG9qCVQCXYXzGu86NREv-elnou
 h1yvOlZm8ySNU3Ql8I>
X-ME-Received: <xmr:CpdyYux-t4_qxLNLvWoWRXXHU0AhJfSFgoG60kVPqSKc5nM29nwzTdYih64h0-Nr1UAPCklntR1nSYuaYU4RwrcRsTMdBsvgyPGXl5k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdelgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheehfffh
 vedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:CpdyYqN-nPsL6Wcxf5bSpocyOvyLQDGCKgce8jbI0CBZ9qUkK4L0kg>
 <xmx:CpdyYr8h8A_UmccuwJAzOy1DJTFz_NUkoplDF1ESUR5ucpmpkcNQ9w>
 <xmx:CpdyYqWUisZ93c6IRgjz_0-0z4-ZKqwzuSElzMTVKmYC6wgHOyNUYA>
 <xmx:C5dyYhdAcacNObNVMScaSOsYDPcAkhUtuCU7VYBeGGvjERzwadK7uQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 May 2022 11:08:58 -0400 (EDT)
Date: Wed, 4 May 2022 17:08:57 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 2/2] Revert "drm: of: Lookup if child node has panel or
 bridge"
Message-ID: <20220504150857.7dhg3gtlgiwadhlm@houat>
References: <CAMty3ZAw7DUSnBePC05qC8Gn6ESKiu+FHw4a-HPPc05VX1hqhg@mail.gmail.com>
 <20220421082358.ivpmtak3ednvddrc@houat>
 <YmEdAVwZuA7Wo1Ch@aptenodytes> <YmelPCcWCCjALtRU@aptenodytes>
 <CAMty3ZBwguzvC8A9xA5c0enfoFRGS=4wWCzpfakTUXrsRS9GyA@mail.gmail.com>
 <20220427143410.bectqumq62qmlv5x@houat>
 <CAMty3ZDk-M3hW97_GY4-z=f+cKs1Sg4Jbq5L7L4zHgXURhFuZA@mail.gmail.com>
 <YmsSdmOEpSz4okt2@pendragon.ideasonboard.com>
 <20220429154645.47tsii47vjxqklca@houat>
 <YmwM5/oikfRt2ExQ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qfv6kjxcghrfgsyc"
Content-Disposition: inline
In-Reply-To: <YmwM5/oikfRt2ExQ@pendragon.ideasonboard.com>
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
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qfv6kjxcghrfgsyc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 29, 2022 at 07:05:59PM +0300, Laurent Pinchart wrote:
> Hi Maxime,
>=20
> On Fri, Apr 29, 2022 at 05:46:45PM +0200, Maxime Ripard wrote:
> > On Fri, Apr 29, 2022 at 01:17:26AM +0300, Laurent Pinchart wrote:
> > > On Thu, Apr 28, 2022 at 02:09:42PM +0530, Jagan Teki wrote:
> > > > On Wed, Apr 27, 2022 at 8:04 PM Maxime Ripard wrote:
> > > > > On Tue, Apr 26, 2022 at 01:40:31PM +0530, Jagan Teki wrote:
> > > > > > On Tue, Apr 26, 2022 at 1:24 PM Paul Kocialkowski wrote:
> > > > > > > On Thu 21 Apr 22, 10:59, Paul Kocialkowski wrote:
> > > > > > > > On Thu 21 Apr 22, 10:23, Maxime Ripard wrote:
> > > > > > > > > On Thu, Apr 21, 2022 at 01:15:54PM +0530, Jagan Teki wrot=
e:
> > > > > > > > > > + Linus
> > > > > > > > > > + Marek
> > > > > > > > > > + Laurent
> > > > > > > > > > + Robert
> > > > > > > > > >
> > > > > > > > > > On Thu, Apr 21, 2022 at 4:40 AM Bjorn Andersson wrote:
> > > > > > > > > > >
> > > > > > > > > > > Commit '80253168dbfd ("drm: of: Lookup if child node =
has panel or
> > > > > > > > > > > bridge")' attempted to simplify the case of expressin=
g a simple panel
> > > > > > > > > > > under a DSI controller, by assuming that the first no=
n-graph child node
> > > > > > > > > > > was a panel or bridge.
> > > > > > > > > > >
> > > > > > > > > > > Unfortunately for non-trivial cases the first child n=
ode might not be a
> > > > > > > > > > > panel or bridge.  Examples of this can be a aux-bus i=
n the case of
> > > > > > > > > > > DisplayPort, or an opp-table represented before the p=
anel node.
> > > > > > > > > > >
> > > > > > > > > > > In these cases the reverted commit prevents the calle=
r from ever finding
> > > > > > > > > > > a reference to the panel.
> > > > > > > > > > >
> > > > > > > > > > > This reverts commit '80253168dbfd ("drm: of: Lookup i=
f child node has
> > > > > > > > > > > panel or bridge")', in favor of using an explicit gra=
ph reference to the
> > > > > > > > > > > panel in the trivial case as well.
> > > > > > > > > >
> > > > > > > > > > This eventually breaks many child-based devm_drm_of_get=
_bridge
> > > > > > > > > > switched drivers.  Do you have any suggestions on how t=
o proceed to
> > > > > > > > > > succeed in those use cases as well?
> > > > > > > > >
> > > > > > > > > I guess we could create a new helper for those, like
> > > > > > > > > devm_drm_of_get_bridge_with_panel, or something.
> > > > > > > >
> > > > > > > > Oh wow I feel stupid for not thinking about that.
> > > > > > > >
> > > > > > > > Yeah I agree that it seems like the best option.
> > > > > > >
> > > > > > > Should I prepare a patch with such a new helper?
> > > > > > >
> > > > > > > The idea would be to keep drm_of_find_panel_or_bridge only fo=
r the of graph
> > > > > > > case and add one for the child node case, maybe:
> > > > > > > drm_of_find_child_panel_or_bridge.
> > > > > > >
> > > > > > > I really don't have a clear idea of which driver would need t=
o be switched
> > > > > > > over though. Could someone (Jagan?) let me know where it woul=
d be needed?
> > > > > >
> > > > > > sun6i_mipi_dsi
> > > > >
> > > > > It doesn't look like sun6i_mipi_dsi is using devm_drm_of_get_brid=
ge at all?
> > > >=20
> > > > Correct, patch for this on the mailing list.
> > >=20
> > > I've lost track of how we're solving the fallout of this for v5.18. I
> > > have received a report that the original commit (80253168dbfd) also
> > > broke the rcar-du driver. Could you please provide a git branch (based
> > > on drm-fixes or drm-misc-fixes) with any patch that you plan to get
> > > merged in v5.18, to let me test them locally ?
> >=20
> > Was that report about 5.18 or drm-misc-next? It appears that all the
> > drivers conversions are in drm-misc-next.
>=20
> v5.18-rc2. I've double-checked, and it has been bisected to commit
> 67bae5f28c89, which is a fix of the commit this patch reverts
> (80253168dbfd).

We've reverted 67bae5f28c89 in -rc4, so it should work just fine now

Maxime

--qfv6kjxcghrfgsyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYnKXCAAKCRDj7w1vZxhR
xdIjAQCFn3vpzZMcN+0pRgWibfT9JVeBJr8XuM6qdmRpPJ46SgEAsz+6o/m6DC24
bTocO9sA/LABD7/OqSwSMVfnDNlieAw=
=qF30
-----END PGP SIGNATURE-----

--qfv6kjxcghrfgsyc--
