Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0DA4C403F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 09:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 688EC10E4F2;
	Fri, 25 Feb 2022 08:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 734E910E4F2
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 08:40:37 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1D0BE5C01B1;
 Fri, 25 Feb 2022 03:40:34 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 25 Feb 2022 03:40:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; bh=vgxmWpNYEhXiY22ojyb7yCLDVMO2r4GlptIEhC
 UV78E=; b=FFW1+pB82avP4eVO+oihMA1bfdTfFXaFU+IItNY0BV2jPvVXDt3r0p
 2GWTnJ+iw3iMzRr+S0uU8tR5riLHQ//ek1Ee8oefuD2uvHbzwTgbVbxQHiukdKtr
 HoQ8/UurvdR3Fc2DWbPQAkwLWwRmRfxxCeUVOMSRiqC3Qcx/gRPnjVlN5Ct0pNcX
 6fO4z9RwLybtk7O5Y5gAwxtFJU4+585/YZLSgE3A2c5hh9Hem/raBNldEyjjyVso
 /IbqEaXw1KZZ/RKmHDib9QMTmgziI8TCUXP6KmP2zE081D373e+OczeEDKKDGmpW
 Zolkz94zLLzkhK9LtevPE4Ej0yps7Ytg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=vgxmWpNYEhXiY22oj
 yb7yCLDVMO2r4GlptIEhCUV78E=; b=Y6ENBGo4zLmgqLxW5jOVLi3EKC9NPFoKg
 NNvDRvFNWAoyfLdac+kLBTIMz7eiw1ivYbcB6W9d/wVzJz7xRg/ruPGKu++NHZ+x
 8F8jGoUH0GAEY+yjelHy6e30NCy0NqumB3GkDekscTo8h1k0WlyDEK3a8ixJY0qE
 8vYoOujFc37iMt8wDOsOqkvtyp77nZCnOJHkz4PAhRqg7Bu8HDiRxlCTVuOmjUYa
 7auqHwrpiTYWZgRVsBjPcFcXxKFDy1bebj7lYVgNCw10UaT4D8bEbE/VRmfxsJOj
 LDun/hgODXWJWWDPwp71+9k2ApSAVVb6hf4TqST3vY85Nrt9GLqnw==
X-ME-Sender: <xms:AZYYYhWBSXV11xpn1PybFvJwO-ThD4F0D7Nsse1dXKoe3SVXCguQxQ>
 <xme:AZYYYhnwlnfkWyXvpXV0VmIkshrWUc1PQTpTjhcJBHeRSQUiKbQanZRtN71nd7WTd
 1KWSk3thJSVgC7UD7k>
X-ME-Received: <xmr:AZYYYtYIZ4Plk_NuW4UwRX3EtumCwLvIiDumU1bXPe3k0wPGzqhqK--gSzl0OpRBu96QLHw7rnUjLe15CHqF-gRsnup-8DhNlTy3cCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleefgdduudehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:AZYYYkVz-oKml5IwdCECuynGj40mx_nJVXuzGFy1M4wxwDiKbX0yAg>
 <xmx:AZYYYrnWEh5qPu7lZ87RtFqiNSOeIca498a-X3wb-1QhFAQTuWoUAQ>
 <xmx:AZYYYhc_YpzyVKBMmkDvUrPPGAWLUCfElzyN-y9Ny8C-TexHmDvuPQ>
 <xmx:ApYYYpjQ1HpicPaCpzyG1EeXyPaMbRnHMza-N7hUeaYDGkpJVzkx3Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 03:40:32 -0500 (EST)
Date: Fri, 25 Feb 2022 09:40:31 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Marek Vasut <marex@denx.de>
Subject: Re: [RFC][PATCH 0/7] drm/bridge: Add support for selecting DSI host
 HS clock from DSI bridge
Message-ID: <20220225084031.onvyuq62mhmnnzx2@houat>
References: <20220219002844.362157-1-marex@denx.de>
 <20220224154010.n65epa73meznvwo3@houat>
 <1941db81-b2c2-58e5-40d7-47c5fe1fbd37@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bnyi6msln5s5cgsx"
Content-Disposition: inline
In-Reply-To: <1941db81-b2c2-58e5-40d7-47c5fe1fbd37@denx.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bnyi6msln5s5cgsx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 24, 2022 at 09:24:57PM +0100, Marek Vasut wrote:
> On 2/24/22 16:40, Maxime Ripard wrote:
> > Hi,
>=20
> Hi,
>=20
> > On Sat, Feb 19, 2022 at 01:28:37AM +0100, Marek Vasut wrote:
> > > This patch series attempts to address a problem of missing support fo=
r DSI
> > > bridge-to-bridge or panel-to-bridge clock frequency negotiation. The =
problem
> > > has two variants.
> > >=20
> > > First, a DSI->to->x bridge derives its own internal clock from DSI HS=
 clock,
> > > but the DSI HS clock cannot be set to arbitrary values. TS358767 is o=
ne such
> > > bridge in case it operates without Xtal. In that case, the TC358767 d=
river
> > > must be able to negotiate the specific suitable DSI HS clock frequenc=
y for
> > > the chip.
> > >=20
> > > Second, both DSI->to->x bridges and DSI hosts currently calculate, or=
 rather
> > > guess and hope they both guess the same number as their neighbor, the=
 DSI HS
> > > clock frequency from form of PLL=3D(width * height * bpp / lanes / 2)=
=2E This is
> > > dangerous, since the PLL capabilities on both ends of the DSI bus mig=
ht differ
> > > and the DSI host could easily end up generating wildly different cloc=
k than
> > > what the DSI bridge/panel expects to receive.
> > >=20
> > > This series attempts to address these negotiation problems by extendi=
ng the
> > > existing .atomic_get_input_bus_fmts callback into .atomic_get_input_b=
us_cfgs
> > > callback in struct drm_bridge_funcs {}. The extended version returns =
not only
> > > a list of a list of bus formats supported by a bridge, but the entire=
 list of
> > > struct drm_bus_cfg, which currently contains format and bus flags, bu=
t can be
> > > extended with other members, like desired clock frequency, as require=
d.
> > >=20
> > > This series demonstrates such extension by adding the support for neg=
otiating
> > > the DSI clock and by implementing such support in DW DSI Host and TC3=
58767 DSI
> > > bridge.
> >=20
> > We discussed it a bit on IRC as well but there's another issue with
> > this, let's imagine this setup:
> >=20
> > encoder -> DSI-to-DPI bridge -> DPI-to-HDMI bridge -> HDMI Monitor
> >=20
> > HDMI is fairly favorable, and it would probably use pixel clocks of
> > either 148.5, 297 or 594MHz. Let's simplify this a bit and assume your
> > DSI-to-DPI bridge can only operate at a frequency equivalent to 297MHz.
> >=20
> > 594Mhz is going to be used by those new fancy monitors, and thus the
> > preferred mode is likely to be using 594MHz.
> >=20
> > With your solution, it effectively means that when the system will boot
> > up, the preferred mode will be reported to the userspace (and the fbdev
> > emulation), whatever is coming next is going to use it, and you're just
> > going to... refuse it because it never worked in the first place. You'll
> > leave a blank display, and that's it. That's not a great behavior,
> > really.
>=20
> If you cannot support such a panel with this kind of scanout engine, what
> else would you do than blank screen ?

An HDMI monitor typically supports multiple pixel clocks. If you can't
reach one there's usually plenty of other options that could work. And
if there's none, then so be it, we shouldn't report any either.

> > And since you don't get a state until you start a commit, this would
> > need to be able to work without one. Of course, some state parameters
> > will affect the clock (like the bpc count) so it won't be perfect, but
> > we can at least try.
> >=20
> > Another thing is that the clock that needs to be negociated is likely to
> > be device specific. It's probably going to be fairly similar across
> > similar devices (like all the DSI bridges you mentioned are using the HS
> > clock), but I'm not sure we can make that assumption.
>=20
> The bridge (data sink) should be able to figure out what kind of clock it
> needs from the source and then request those, yes. With DSI you can make =
an
> assumption about what kind of clock frequencies each link mode would
> require, but in general, you cannot assume much.

You're modifying the core, you shouldn't be reasoning about DSI, but any
display interface really.

> > I think we could make something that work by asking the previous bridge
> > in the chain for a given clock rate with a given mode, and then filter
> > out / adjust anything we don't like. It would then be able to first
> > check if it can provide that clock in the first place, and then the rate
> > it has, and would be free to forward the query up to the encoder. And
> > since it's tied to the mode, it would work with mode_valid too.
>=20
> It seems to me this is similar to this solution, except it must happen wh=
en
> the mode is available ?

The mode will pretty much always be available. You can't really reason
about a clock rate without a mode.

> But then the question also comes to mind, should
> select_bus_fmt_recursive() be called only after mode is available too
> ?

Most of the drivers that use either atomic_get_input_bus_fmts or
atomic_get_output_bus_fmts don't use the state at all, so yes.

The only exception is the HDMI output format selection in dw-hdmi, but
that's a bit of a mess across drivers, each one going its own separate
way to achieve this.

So, yeah. Usually formats are less important when it comes to whether a
device can actually support a given mode than the clock it feeds from
though, so it has a lesser impact.

Maxime

--bnyi6msln5s5cgsx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYhiV/gAKCRDj7w1vZxhR
xWPrAP0Ui9vY0+cdtXwBDFrDXu2vk7ztfmHtFH0V4R6ZH+JW1AEA87BjRVZVOdb9
0ruK/nCCQ5VzIAX2dRkibHUP9J3QWwI=
=OymR
-----END PGP SIGNATURE-----

--bnyi6msln5s5cgsx--
