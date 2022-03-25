Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 678B94E7491
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 14:56:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6A9C10E715;
	Fri, 25 Mar 2022 13:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AA410E593
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 13:56:45 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 546195C00B1;
 Fri, 25 Mar 2022 09:56:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 25 Mar 2022 09:56:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; bh=uISTF9UHOawCQNUcHFs7U5CXWtiIWhb21xqj/m
 N10no=; b=REbkWW/AGvRrjyTaqJaPA7rjmWHzS/6OB+gKB7+jphi4NgSkaOMbe2
 L4bY7GFmEJVIxmNFOc/07Yrpzbe/NhdhSUfourWowehnBdRC9g8C2LL35GIrUFSL
 Wh5CcBvqH8qQZYwdTao/U6NSujOxuI7kZ3bHg/i6eone1o0oIzvKMjv1PDOgWN+w
 gEUYPeOGR0MIwb11a9VydKs3Dltv+6s3RoP7976GKIU7zLTbasEuYzlnBO0AAAmK
 zKsuAAq2VZ4a5TLU4lR9iiHBdMqNBg4WkhdVLUy4SUGYIc1ILouXYRKIW26Tpurg
 XIXcz3jjoJXoPfuVUFVx1YOi9Qns5aEA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=uISTF9UHOawCQNUcH
 Fs7U5CXWtiIWhb21xqj/mN10no=; b=chbA6RcBfLYOd8mrtlD2UaQPS+KA5kG7A
 UGtyoS+Z/Swk+XBOquWsf9DinG/47UPClv5fX+97jecaM6fIRhwytvE2ojZaKKag
 hh3M44LE4CwPF7qDdg4sZoDzqxT7lY3xcy4K2bZDss++x5SGHi4TLWx6oHolXDoh
 KbxqVoF/wqCayaDpDnoVvfgXzftLBU8Mlnkn0t6SY/25HjNc3HgmpZYpYC7XG/HY
 6UZeHL101QYdxYUR+znyY0JTUq4TpR4oy1YTOqDAHZfGqB5Z4rIeQv61tEYBo8rd
 jK/t0vkYtbZX6PdVdPLIomE10z+GmOhEiKF4zZdwWBj+e0MJHuNAA==
X-ME-Sender: <xms:Gso9YhFzuecBdmLdbUPP_aUyWfSWtIlCsORPXI0zSUa72IDEBEZEjQ>
 <xme:Gso9YmVg-WBxzwkrLszkFhKjm-p_3s1LclGpR1vFuw30ANB7bnz4skuBI7Cj0YxCu
 8aeSUU_hYFFnbM3zE4>
X-ME-Received: <xmr:Gso9YjIhRcH9QSlWkAgqSGolLvcbTYqX2tJM4dTc6bA8COYakUWxstbTcX-aCrp2U_ClZJcsH3BRuO_nLn_2AK93Qp0jhuFyA_ktjUc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddgheeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepleekgeehhfdutdeljefgleejffehfffgieejhffgueefhfdtveetgeehieeh
 gedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Gso9YnF6PaF1Ykiuf-tkcn5YrHr4hP6SZ5mxML1hYk0SeaJaWfkEVA>
 <xmx:Gso9YnVsnv2SeIW7odbmMRThm-eU15L0hUkDIIooSyHyZygh4ozq-w>
 <xmx:Gso9YiPop0RnUJbX43BOL3HndBvAdgnVULbYWish85G25AwbjdIutQ>
 <xmx:G8o9YucCpfS4j3-3ufqK6d1BOCsKOn45otFjL9oTRG6JFa5S8M23-Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 09:56:42 -0400 (EDT)
Date: Fri, 25 Mar 2022 14:56:40 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: Parallel modesets and private state objects broken, where to go
 with MST?
Message-ID: <20220325135640.kooewokfxocdkkvv@houat>
References: <3c8a7bec021ba663cc0a55bdedb7030a555457dd.camel@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="nfoqregzmabftlph"
Content-Disposition: inline
In-Reply-To: <3c8a7bec021ba663cc0a55bdedb7030a555457dd.camel@redhat.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nfoqregzmabftlph
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lyude,

On Mon, Mar 14, 2022 at 06:16:36PM -0400, Lyude Paul wrote:
> Hi! First a little bit of background: I've recently been trying to get ri=
d of
> all of the non-atomic payload bandwidth management code in the MST helper=
s in
> order to make it easier to implement DSC and fallback link rate retraining
> support down the line. Currently bandwidth information is stored in two
> places, partially in the MST atomic state and partially in the mst manage=
r's
> payload table (which exists outside of the atomic state and has its own
> locking). The portions in the atomic state are used to try to determine i=
f a
> given display configuration can fit within the given bandwidth limitations
> during the atomic check phase, and are implemented through the use of pri=
vate
> state objects.

Yeah, this looks awfully similar to what vc4 is doing.

The way the hardware is setup is that there's a device (HVS) that does
the composition of all planes, over 3 FIFO, and each FIFO can be output
to a CRTC with a mux. The HVS then needs to raise its internal clock
rate depending on the load (based on the resolution and number of
planes, mostly) of each FIFO.

Thus we have a private object (vc4_hvs_state) that lists all the FIFOs,
with their associated loads, and we pull that state in for each commit.

> My current goal has been to move as much of this as possible over to the
> atomic state and entirely get rid of the payload table along with it's lo=
cks.
> My main reason for doing this is that it both decomplicates things quite a
> bit, and I'm really also hoping that getting rid of that payload code will
> make it clearer to others how it works - and stop the influx of bandaid
> patches (e.g. adding more and more special cases to MST to fix poorly
> understood issues being hit in one specific driver and nowhere else) that=
 I've
> had to spend way more time then I'd like trying to investigate and review.
>=20
> So, the actual problem: following a conversation with Daniel Vetter today=
 I've
> gotten the impression that private modesetting objects are basically just
> broken with parallel modesets? I'm still wrapping my head around all of t=
his
> honestly, but from what I've gathered: CRTC atomic infra knows how to do =
waits
> in the proper places for when other CRTCs need to be waited on to continu=
e a
> modeset, but there's no such tracking with private objects. If I understa=
nd
> this correctly, that means that even if two CRTC modesets require pulling=
 in
> the same private object state for the MST mgr: we're only provided a guar=
antee
> that the atomic checks pulling in that private object state won't
> concurrently. But when it comes to commits, it doesn't sound like there's=
 any
> actual tracking for this and as such - two CRTC modesets which have both
> pulled in the MST private state object are not prevented from running
> concurrently.

Yeah, in our case the issue was two-fold:

 - The first one is that since the load is shared over each CRTC, we
   need, for each commit, to have the global load. This is non-obvious
   because you might get some new states that only affect a single CRTC,
   or a plane but not its CRTC, so making sure we always get the entire
   picture was a bit challenging.

   You'll need to pull the state at each commit in atomic_check, and
   then basically remove the old state of whatever is in your commit,
   and add the new stuff. Just iterating over all the connectors in a
   state for example won't work.


 - Then, indeed, there's a race issue. IIRC, the basic idea is that if
   two (non-blocking) commits don't share any resources (so like both
   have a single plane, CRTC and connector, but none shared), there's no
   execution ordering guaranteed by default. But there is one in the
   structures: you still have your old and new states.

   So if you commit your changes like this:

   * Initial State
   * State 1
   * State 2

   Your old private object in state 1 will be the initial state one, the
   new will be the one from state 1. And for state 2, the old will be
   state 1, the new will be state 2.

   But if state 2 gets committed first, then your old state is weird
   already, because it's actually the next one. It get worse when state
   1 gets committed since the old state is the initial state, but since
   state 2 has been committed the initial state has been freed already.

> This unfortunately throws an enormous wrench into the MST atomic conversi=
on
> I've been working on - as I was under the understanding while writing the=
 code
> for this that all objects in an atomic state are blocked from being used =
in
> any new atomic commits (not checks, as parallel checks should be fine in =
my
> case) until there's no commits active with said object pulled into the at=
omic
> state. I certainly am not aware of any way parallel modesetting could act=
ually
> be supported on MST, so it's not really a feature we want to deal with at=
 all
> besides stopping it from happening. This also unfortunately means that the
> current atomic modesetting code we have for MST is potentially broken,
> although I assume we've never hit any real world issues with it because o=
f the
> non-atomic locking we currently have for the payload table.
>=20
> So, Daniel had mentioned that supposedly you've been dealing with similar
> issues with VC4 and might have already made progress on coming up with wa=
ys to
> deal with it.

This is all upstream already :)

You can have a look at vc4_atomic_commit_setup, that pull the HVS state
in, and associates the drm_crtc_commit to the HVS state.

Then, vc4_atomic_commit_tail, we'll wait for the old HVS state
drm_crtc_commit before moving forward.

It's not really challenging: the basic idea is that whenever your commit
start you would wait for the drm_crtc_commit to be completed, forcing
the ordering.

This requires some code in atomic_commit path though, so it might be
difficult to integrate properly in the drivers that would use MST.

It would be an interesting discussion, I have a similar issue with HDMI
scrambling support: I'd like to have most of the logic generic, but
making sure all the HDMI drivers (but only them) use that generic code
properly is challenging.

Maxime

--nfoqregzmabftlph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYj3KGAAKCRDj7w1vZxhR
xeTdAP9JkHTQpu4+bGak1+dFfUKzJcKJaARTlPzaGoTQOflBsAEAskwfRN3N75Oq
skLyGbeCPdsnFoPqaiXdo3iLy0poYgk=
=dXG2
-----END PGP SIGNATURE-----

--nfoqregzmabftlph--
