Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 535C5439851
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 16:15:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4426E0C1;
	Mon, 25 Oct 2021 14:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4151D89CBE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 14:15:12 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 5C8D55C0215;
 Mon, 25 Oct 2021 10:15:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Mon, 25 Oct 2021 10:15:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=s2MHqfw+LInfFzgO01BL4acWrAD
 cKONYay/PKw/oiy4=; b=dYiZR16FH0IqzA0dDnxKN9+jlAzL6FlVsGHpt2LCgoo
 ruzkruuGxSab/YYOeWxVD0KvLfhhXiGqHBpMKnejJblrZyTHSv9M7/5FZB3QIy/6
 eA2bklzwGLJemB9fKKw/xGAm11gmUGuJTaK/wA77pAezHlvjXnVBooVcA0pi0UxP
 dJI04+qZKjeqbKz+2ks1CGmplOVKzRUZ4sJwlad1mqpOkh9esT0iYnV3/+dcW8/C
 DyweG7eLg/fx8A+kOwyxmGRGX0IkLcz/yQKs1yN12EwTw7FKxRA+TDDyfA8GTVaz
 tq8c3xAOG4Tlxw3ObzAdu7Bm2TCScGZ0YHm+beBAt8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=s2MHqf
 w+LInfFzgO01BL4acWrADcKONYay/PKw/oiy4=; b=JgeSRqy23EfCl78Z+HzNFG
 2hiZy4MsBCycc+prkrcJsDHQU280W59OOVEI60GZsM9xjLI7eWi8k+XIaHUxDhsL
 s3naJe9uYJWMpHpAawZ+6ipozArk8qVxR6qDFMuPgRcNoTgirrOIarScU7xxKSGt
 Y7vj3P7zmmW0PX+t/0/C5YwtZfdsoE0l+chHN7BbD+o7Ov+XxlmwDhAVmPRWRWJJ
 XA8GKMIzmqvwQPl+gCeUv99cEd/HGOWbRAZoQwcjMmXwXWqV6tsTs2EEoaGnHOLk
 WhXfcEYfN401BXi3mjr5CwRY4N/fj6PpOhXqIEEavNQLY/0jz9TIaOs7nuhtrKrA
 ==
X-ME-Sender: <xms:7rt2YVPAtvY_knPoFIJroz5aNuSKQ6rcM6SpnXhoB1wTdmE_79ZwWg>
 <xme:7rt2YX-RFMsYH1VTeHlmoNki52kzz3Dyt0SRhag0fboXcfPeCMh7ohlQyQpinDEUt
 pdXjohnYGSogl5BTF0>
X-ME-Received: <xmr:7rt2YURl7ixs-LVR9fQ8l5OutW59OG_SS_F0u0P9_30SLs6_8JriHHwEoLJD-IPEIqHS7UqRNvvvY1_ujt2wBkbwTmT3Udc8BSguSYQ9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrvdefhedgjedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepveevfeffudeviedtgeethffhteeuffetfeffvdehvedvheetteehvdelfffg
 jedvnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7rt2YRuiD-j_LOyFimfFVwCjleuf_uBhdMAI7ToJa1CeflAknhcyYQ>
 <xmx:7rt2YdcLdPHHv-y8-RhAr07rQHSE0zil_bKJeunwMAMEaiGBFIkojQ>
 <xmx:7rt2Yd3QJu4OzUOM4Jbb3C4YP04ST6gr0QXgA8UfPJLQofGaxlyZQA>
 <xmx:77t2YWFoM3ZePRoVCW4gmTvrt-RH9yF3Uqlrip9llIfy6FSHGYLQzQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 25 Oct 2021 10:15:10 -0400 (EDT)
Date: Mon, 25 Oct 2021 16:15:09 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: Regression with mainline kernel on rpi4
Message-ID: <20211025141509.3bojy4fndhapv6ti@gilmour>
References: <CADVatmNZB6yjS6zXqUcY4xsUTyX3pa6VysB6RmT1CGV5LXer6g@mail.gmail.com>
 <CAHk-=wh+y=C5hVhE1X=AvZz+OM5Yp8eLHYGth31pfoJVF7UKKQ@mail.gmail.com>
 <CADVatmPDeSxeY3GTZyC6+G0N76su0E6Y3LF_h6BOcBf5QAtjvg@mail.gmail.com>
 <CAHk-=whASMriPYRdH8kxC_UwObBtwHbPvf7rb58sUEZZyaFxJg@mail.gmail.com>
 <20210924133022.waqgtr5xjjxigong@gilmour>
 <CAKMK7uFxO-ss86k483VJQJiHwcAYxNwD06xSEZStn+fWiRJ6iw@mail.gmail.com>
 <20210928083446.cfji7hmndt6a5nop@gilmour>
 <YVWBP5ZJInH/wt1P@phenom.ffwll.local>
 <20211013150103.p3rea3ny3rjmohtd@gilmour>
 <YWgteNaNeaS9uWDe@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="ypjexi65tpqzaana"
Content-Disposition: inline
In-Reply-To: <YWgteNaNeaS9uWDe@phenom.ffwll.local>
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


--ypjexi65tpqzaana
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 14, 2021 at 03:15:36PM +0200, Daniel Vetter wrote:
> On Wed, Oct 13, 2021 at 05:01:03PM +0200, Maxime Ripard wrote:
> > On Thu, Sep 30, 2021 at 11:19:59AM +0200, Daniel Vetter wrote:
> > > On Tue, Sep 28, 2021 at 10:34:46AM +0200, Maxime Ripard wrote:
> > > > Hi Daniel,
> > > >=20
> > > > On Sat, Sep 25, 2021 at 12:50:17AM +0200, Daniel Vetter wrote:
> > > > > On Fri, Sep 24, 2021 at 3:30 PM Maxime Ripard <maxime@cerno.tech>=
 wrote:
> > > > > >
> > > > > > On Wed, Sep 22, 2021 at 01:25:21PM -0700, Linus Torvalds wrote:
> > > > > > > On Wed, Sep 22, 2021 at 1:19 PM Sudip Mukherjee
> > > > > > > <sudipm.mukherjee@gmail.com> wrote:
> > > > > > > >
> > > > > > > > I added some debugs to print the addresses, and I am gettin=
g:
> > > > > > > > [   38.813809] sudip crtc 0000000000000000
> > > > > > > >
> > > > > > > > This is from struct drm_crtc *crtc =3D connector->state->cr=
tc;
> > > > > > >
> > > > > > > Yeah, that was my personal suspicion, because while the line =
number
> > > > > > > implied "crtc->state" being NULL, the drm data structure docu=
mentation
> > > > > > > and other drivers both imply that "crtc" was the more likely =
one.
> > > > > > >
> > > > > > > I suspect a simple
> > > > > > >
> > > > > > >         if (!crtc)
> > > > > > >                 return;
> > > > > > >
> > > > > > > in vc4_hdmi_set_n_cts() is at least part of the fix for this =
all, but
> > > > > > > I didn't check if there is possibly something else that needs=
 to be
> > > > > > > done too.
> > > > > >
> > > > > > Thanks for the decode_stacktrace.sh and the follow-up
> > > > > >
> > > > > > Yeah, it looks like we have several things wrong here:
> > > > > >
> > > > > >   * we only check that connector->state is set, and not
> > > > > >     connector->state->crtc indeed.
> > > > > >
> > > > > >   * We also check only in startup(), so at open() and not later=
 on when
> > > > > >     the sound streaming actually start. This has been there for=
 a while,
> > > > > >     so I guess it's never really been causing a practical issue=
 before.
> > > > >=20
> > > > > You also have no locking
> > > >=20
> > > > Indeed. Do we just need locking to prevent a concurrent audio setup=
 and
> > > > modeset, or do you have another corner case in mind?
> > > >=20
> > > > Also, generally, what locks should we make sure we have locked when
> > > > accessing the connector and CRTC state? drm_mode_config.connection_=
mutex
> > > > and drm_mode_config.mutex, respectively?
> > > >=20
> > > > > plus looking at ->state objects outside of atomic commit machinery
> > > > > makes no sense because you're not actually in sync with the hw st=
ate.
> > > > > Relevant bits need to be copied over at commit time, protected by=
 some
> > > > > spinlock (and that spinlock also needs to be held over whatever o=
ther
> > > > > stuff you're setting to make sure we don't get a funny out-of-sync
> > > > > state anywhere).
> > > >=20
> > > > If we already have a lock protecting against having both an ASoC an=
d KMS
> > > > function running, it's not clear to me what the spinlock would prev=
ent
> > > > here?
> > >=20
> > > Replicating the irc chat here. With
> > >=20
> > > commit 6c5ed5ae353cdf156f9ac4db17e15db56b4de880
> > > Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Date:   Thu Apr 6 20:55:20 2017 +0200
> > >=20
> > >     drm/atomic: Acquire connection_mutex lock in drm_helper_probe_sin=
gle_connector_modes, v4.
> > >=20
> > > this is already taken care of for drivers and should be all good from=
 a
> > > locking pov.
> >=20
> > So, if I understand this properly, this superseeds your comment on the
> > spinlock for the hw state, but not the comment that we need some locking
> > to synchronize between the audio and KMS path (and CEC?). Right?
>=20
> Other way round. There's 3 things involved here:
> 1. kms output probe code
> 2. kms atomic commit code
> 3. calls from asoc side
>=20
> The above referenced commit makes sure 1&2 are synchronized. The problem
> is that 2&3 are not synchonronized, and from 3, no matter how much locking
> you have, you cannot look at kms state. I.e. not allowed to look at
> crtc->state for example, irrespective of whether you're holding
> drm_modeset_lock or not. This is because the atomic nonblocking commit is
> done without holding any locks, protection is purely down to ownership
> rules of state structures and ordering (through drm_crtc_commit) of
> in-flight nonblocking atomic commits.
>=20
> That's why you need a sperate lock _and_ copy state, so taht 2&3 stay in
> sync.
>=20
> In practice you only care about modeset changes from 2 vs anything from 3,
> and most userspace does modeset atomic commits as blocking commits, which
> means you won't notice that your locking has gaps.
>=20
> btw same problem exists between atomic and (vblank) irq handler. There you
> need a irqsafe spinlock and you also have to copy (because the irq handler
> just cannot access ->state in any safe way, because it doesn't own that
> structure).
>=20
> This is maybe a bit the confusing thing with atomic commit: ->state isn't
> protected by locks, but through ownership rules. Only for atomic check is
> ->state protected by locks, but once we're committed we switch over to
> ownership rules for protection. swap_states() is that point of no return.

Thanks for the clarifications, I just posted a series that should be
implementing this here:
https://lore.kernel.org/dri-devel/20211025141113.702757-1-maxime@cerno.tech/

Maxime

--ypjexi65tpqzaana
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYXa77QAKCRDj7w1vZxhR
xbBFAP4pHttlebRsLgfQPT9362C9Rm4B069Dh4b9cBAHq8Q7rQEA9hQvXedd3EBB
YaUsNNJJBnikVVFy2VvHVJaHbunDawo=
=B6NJ
-----END PGP SIGNATURE-----

--ypjexi65tpqzaana--
