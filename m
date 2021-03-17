Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE8F633F0D6
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 14:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01FE56E157;
	Wed, 17 Mar 2021 13:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A636E157
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 13:04:14 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7564D580E7F;
 Wed, 17 Mar 2021 09:04:09 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Wed, 17 Mar 2021 09:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm2; bh=X+JMiDx99qnQ/mxxmcAoaRsPbxj
 JwehnTGBW3syNHdo=; b=gZ/NzPQ9Sn9gKoebwaDWUgubC9eFxS28y1o0vtvWT1c
 VKEI3qtEUci+2fErGACQpXX5Gn239zrAS4O2LEoqpC+kiZlbnID9upJsNCSLg/g7
 DJotrib56+DjwEh6/eFPteTDvwNoKjXvAiMnKhyxTuDMuvk/EaFndKf23aInyrKI
 WhCQbh9lCe1mM9ZepAg5biR2vu5U+/QJU4JemLT9VmZpMUdv1RjqQcNVCBkiClaA
 lyPe3UBWqFpnM0p6bQ+EylSWC3OkUoiz9QntWIiaDuTLBrPssIfUBWffyMSc9ZSJ
 PS9pqGsOSHGOiysGFLX4C8AHFBS5JPd4TvQHzs/Geog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=X+JMiD
 x99qnQ/mxxmcAoaRsPbxjJwehnTGBW3syNHdo=; b=c/y3e1kDlsRT4cw9YPuwQ9
 lTY+t+ma6H39aFSOW8cVxUYULFDEHVjDVckyEW5NOvw8n9tJg6j79w1I3Pib1V7U
 PW8rt+rUFHJkybmGBl0woetlAUbPJpjy4o5ig4k/cjzoj4+Qn4+dhHScAcUBeG7H
 Ntm37jG03VoVbb59J/R9GUV+BSrKDPq43PQAwGZOg/TE9rjFJquaFdpDY4HUurmC
 L6a3csTquiJR11ZzPyblQB4tzY2bnE4ENlhwyNzqrJhWB496v/GZaJQUSspB9Zen
 icTOuq6inmfS9iyc0BgPwBJfEpXRtjaD/kwgWRIsDyXE97AkBQxT3oov3IZFuUEg
 ==
X-ME-Sender: <xms:R_5RYKhE4CtE07FgwxujBMngkrLSgVUA2hGqivmNZ055v0PVz5QrYA>
 <xme:R_5RYK-sgY-qBujajLny9iExxYT8hjT2I3VSZ8ZNzq23qkOVI-EN_i68hENaTxZSV
 yisJPfoKcuNSyjMm-c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefgedggeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:R_5RYO-11C96E3GKBscqizjXUrIIGZeBMkTSQ6XxHcNV9R1MfJJsLg>
 <xmx:R_5RYLAdBTW2reoiCCyLODeJZjSHLwwkqUHshHANArqOvnaJdSrfRw>
 <xmx:R_5RYGzNGDmuDoYvfMdxdvcupDH6dcSQ5e4eAO3i21e9BgpZExWkXQ>
 <xmx:Sf5RYPXnzC6ncf8RZUETsmbbF1VUZ2Qudnk5DBbDHJ9qdweYaMGD1w>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 16E5A24005B;
 Wed, 17 Mar 2021 09:04:07 -0400 (EDT)
Date: Wed, 17 Mar 2021 14:04:04 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 1/8] clk: Add range accessors
Message-ID: <20210317130404.djerabewynzhvfol@gilmour>
References: <20210225155909.1853812-1-maxime@cerno.tech>
 <20210225155909.1853812-2-maxime@cerno.tech>
 <161472713858.1478170.9594904338107431350@swboyd.mtv.corp.google.com>
 <20210303084527.rziaoiqsr7r4bhcv@gilmour>
 <161594320095.1478170.16988206902476583714@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
In-Reply-To: <161594320095.1478170.16988206902476583714@swboyd.mtv.corp.google.com>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Mike Turquette <mturquette@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============1894621264=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1894621264==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="23ldu23v25ksbcb5"
Content-Disposition: inline


--23ldu23v25ksbcb5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 16, 2021 at 06:06:40PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2021-03-03 00:45:27)
> > Hi Stephen,
> >=20
> > On Tue, Mar 02, 2021 at 03:18:58PM -0800, Stephen Boyd wrote:
> > > Quoting Maxime Ripard (2021-02-25 07:59:02)
> > > > Some devices might need to access the current available range of a =
clock
> > > > to discover their capabilities. Let's add those accessors.
> > >=20
> > > This needs more than two sentences to describe what's required.
> > >=20
> > > >=20
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > ---
> > > >  drivers/clk/clk.c   | 30 ++++++++++++++++++++++++++++++
> > > >  include/linux/clk.h | 16 ++++++++++++++++
> > > >  2 files changed, 46 insertions(+)
> > > >=20
> > > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > > index 8c1d04db990d..b7307d4f090d 100644
> > > > --- a/drivers/clk/clk.c
> > > > +++ b/drivers/clk/clk.c
> > > > @@ -2407,6 +2407,36 @@ int clk_set_max_rate(struct clk *clk, unsign=
ed long rate)
> > > >  }
> > > >  EXPORT_SYMBOL_GPL(clk_set_max_rate);
> > > > =20
> > > > +long clk_get_min_rate(struct clk *clk)
> > >=20
> > > I need to read the rest of the patches but I don't see the justificat=
ion
> > > for this sort of API vs. having the consumer constrain the clk freque=
ncy
> > > that it wants. Is the code that's setting the min/max constraints not
> > > the same as the code that's calling this API? Would an OPP table bett=
er
> > > serve this so the device knows what frequencies are valid?s Please
> > > provide the use case/justification in the commit text.
> >=20
> > The patch that uses it is the patch 4
> >=20
> > The issue I'm trying to solve is that all the RaspberryPi have a
> > configuration file for the firmware, and the firmware is in charge of
> > the clocks communicating through a mailbox interface.
> >=20
> > By default, one of the main clocks in the system can only reach 500MHz,
> > and that's the range reported by the firmware when queried. However, in
> > order to support display modes with a fairly high bandwidth such as 4k
> > at 60Hz, that clock needs to be raised to at least 550MHz, and the
> > firmware configuration has a special parameter for that one. Setting
> > that parameter will increase the range of the clock to have proper
> > boundaries for that display mode.
> >=20
> > If a user doesn't enable it and tries to use those display modes, the
> > display will be completely blank.
> >=20
> > There's no way to query the firmware configuration directly, so we can
> > instead query the range of the clock and see if the firmware enables us
> > to use those modes, warn the user and ignore the modes that wouldn't
> > work. That's what those accessors are here for
>=20
> How does the clk driver query the firmware but it can't be done
> directly by the drm driver?=20

The configuration is done through a text file accessed by the firmware.
What I meant was that the kernel cannot access the content of that file
to make sure the right options have been enabled.

However, it can indeed communicate with the firmware through the extent
of the API it provides, but it's fairly limited. In our case, the only
way to tell is to look for side effects of the configuration option, ie
the maximum rate of the clock that has been increased.

> > > Why two functions instead of one function to get both min and max?
> >=20
> > Since we have clk_set_min_rate and clk_set_max_rate, it made sense to me
> > to mirror that, but I'd be happy to change if you think otherwise
>=20
> Does using clk_round_rate() work just as well?

I guess it could work too, I'll try it out

Maxime

--23ldu23v25ksbcb5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYFH+RAAKCRDj7w1vZxhR
xTn+AP0eeKcFH5a9IEZWMRDaQf9BoLcamyE1qvq3VAwkdZ9S+QD+JLlEVK7b9TwI
f7ZZ1kf7GGk38kE+DF6nSH3ae7+BxwE=
=IVWD
-----END PGP SIGNATURE-----

--23ldu23v25ksbcb5--

--===============1894621264==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1894621264==--
