Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4092F54AFF0
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 14:10:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD7AB10F0BC;
	Tue, 14 Jun 2022 12:10:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3BB10F0BC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 12:09:58 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A6EA05C0126;
 Tue, 14 Jun 2022 08:09:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 14 Jun 2022 08:09:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655208595; x=1655294995; bh=n6cRooOMdl
 z7byix0zVR4vQAb9dLZ1ruw+3UL1WJrCY=; b=OGg0aUzvYLJriIib0YOXdOB5xC
 fBKwRCJ0/7+QrP+TneFnrvhSznFqmcedYxwhxRNIkRxxF+3U8ZkG9DEqyUlPJZWU
 ilHmvpBy2W8iRZdIa65r4uGto2/fHQsfzeyIEdEmU+2rmJCusTicaPijf50febVk
 +Mdjfza4HOdqpdumhztAPoOoOeVcUg/mu3Bs+KykUqA4T5f/yQsUetj5dApX+n9s
 ue1b52ZebY1k+ZB3/poIOz19f2VsjWJ4gyVez0F2ShIlqsj8bD46dztvApQXAuGY
 UmRE5LlXg4e0CZ+/p0H1hjadGZITDUiVkiciPLJ+wSvRo/Oh01k3vVXWe67Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655208595; x=1655294995; bh=n6cRooOMdlz7byix0zVR4vQAb9dL
 Z1ruw+3UL1WJrCY=; b=hi1X2crBWldrLeeaf1S79TG7Me671CPPlG1yS9YVAWKX
 8TGY7Y+lEyrP+3a5sKzdFU+OzUzACC8sbCmPfFjPGC2odr4ToTfSiUtTWb0gDil/
 JxBz1D5+7MaZdtLd5ppT/ovBWeqY8V7zy1urmafJ2Gb7Gg07IlUUzFJAcL6pHvTp
 twYNpX8hg3ZO4zrwiDwMn41ugBeiYnRHNuqCZAAXeVFCMPgk4h1qACTG5DQ/cPm5
 ERgJyNaKAtIzfxgrotHnTyGIUYgKDD5VZnrmte5ZwfhcVZj99bK2oOgp2b9uIw7Q
 nkHqSlmWBuj04czy5rsDuTyGGtTQB9Fl7w/jWvS72Q==
X-ME-Sender: <xms:knqoYsKUOIS94zGry4wOkUQGrrZ3Z9aO6qg6a_aZN4-CGNOLB2Pnog>
 <xme:knqoYsK-i8g1ljBU3eHO0u5wh3Y8kCEK0qONiyeevWnhP7nTqtX_8YIiJxWSERq2P
 oc4VR2_f4GFBbjtCcw>
X-ME-Received: <xmr:knqoYsvcGv_WTfB2WCRHIaNmSKeq7aQDHkPiAT_mt1JUZ_ie9Vy0CmFQUWGfcH1iyJFJO4MIEd0gDMjpEPkQnSRhzhbnxu_vdryOw-U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudduledggeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvleffteffvdegvdfhfeevteekffetgeegffetgfeuhfdtfeehgfeileeh
 ffegffenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpsghoohhtlhhinh
 drtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghr
 rghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:knqoYpbQ1Zp44ptb6HGp55pVeDvCMyjBDMOw0e3bGES04nnc1Yx8wQ>
 <xmx:knqoYjZY_KC4frSDvX8r1rTSfbjTZyhHBkkdWjYKJ0m67bSLCs98rA>
 <xmx:knqoYlCvYOnjBYYkO1zy3Yld6OlSgyf6uHgu57i8O2UWEwqXaTqMbQ>
 <xmx:k3qoYin26YE_hwQsa65_3DM0mGHD4LbgKg_pojJZtR5p5jN1doNFBQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 14 Jun 2022 08:09:54 -0400 (EDT)
Date: Tue, 14 Jun 2022 14:09:52 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/64] drm/crtc: Introduce drmm_crtc_init_with_planes
Message-ID: <20220614120952.b32i46qfz476mspq@houat>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-3-maxime@cerno.tech>
 <d975dc1d-7573-7976-427f-e941cbfa0caf@suse.de>
 <20220614073716.zwshdcf3q5fjobuq@houat>
 <ef19ba8b-ec66-9a00-5456-b4eefbec95cd@suse.de>
 <20220614090440.dwfvsmqnsd7fo24c@houat>
 <07fca319-f6b4-e022-3291-24c3f6439a86@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="gsmghfy7i6uzeuhy"
Content-Disposition: inline
In-Reply-To: <07fca319-f6b4-e022-3291-24c3f6439a86@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--gsmghfy7i6uzeuhy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2022 at 01:47:28PM +0200, Thomas Zimmermann wrote:
> Am 14.06.22 um 11:04 schrieb Maxime Ripard:
> > On Tue, Jun 14, 2022 at 10:29:20AM +0200, Thomas Zimmermann wrote:
> > > Am 14.06.22 um 09:37 schrieb Maxime Ripard:
> > > > Hi Thomas,
> > > >=20
> > > > On Mon, Jun 13, 2022 at 01:23:54PM +0200, Thomas Zimmermann wrote:
> > > > > Am 10.06.22 um 11:28 schrieb Maxime Ripard:
> > > > > > The DRM-managed function to register a CRTC is
> > > > > > drmm_crtc_alloc_with_planes(), which will allocate the underlyi=
ng
> > > > > > structure and initialisation the CRTC.
> > > > > >=20
> > > > > > However, we might want to separate the structure creation and t=
he CRTC
> > > > > > initialisation, for example if the structure is shared across m=
ultiple
> > > > > > DRM entities, for example an encoder and a connector.
> > > > > >=20
> > > > > > Let's create an helper to only initialise a CRTC that would be =
passed as
> > > > > > an argument.
> > > > >=20
> > > > > Before I review all of thes patches, one question. it's yet not c=
lear to me
> > > > > why drm_crtc_init_with_planes() wouldn't work. (I know we discuss=
ed this on
> > > > > IRC.)
> > > > >=20
> > > > > If you're calling drmm_mode_config_init(), it will clean up all t=
he CRTC,
> > > > > encoder connector, etc. data structures for you. For CRTC instanc=
es in
> > > > > kmalloced memory, wouldn't it be simpler to put the corresponding=
 kfree into
> > > > > vc4_crtc_destroy()?
> > > >=20
> > > > My intent was to remove as much of the lifetime handling and
> > > > memory-management from drivers as possible.
> > > >=20
> > > > My feeling is that while the solution you suggest would definitely =
work,
> > > > it relies on drivers authors to know about this, and make the effor=
t to
> > > > convert the drivers themselves. And then we would have to review th=
at,
> > > > which we will probably miss (collectively), because it's a bit obsc=
ure.
> > > >=20
> > > > While with either the drmm_alloc_* functions, or the new functions I
> > > > introduce there, we can just deprecate the old ones, create a TODO =
entry
> > > > and a coccinelle script and trust that it works properly.
> > >=20
> > > Thanks for explaining the motivation.
> > >=20
> > > I would not want to deprecate any of the existing functions, as they =
work
> > > for many drivers. The drmm_ functions add additional overhead that not
> > > everyone is willing to pay.
> >=20
> > I'm a bit confused. drm_crtc_init_with_planes() at the moment has:
> >=20
> > * Note: consider using drmm_crtc_alloc_with_planes() instead of
> > * drm_crtc_init_with_planes() to let the DRM managed resource infrastru=
cture
> > * take care of cleanup and deallocation.
> >=20
> > Just like drm_encoder_init(), drm_simple_encoder_init() and
> > drm_universal_plane_init(), so all the functions we have a drmm_* helper
> > for.
> >=20
> > And we have a TODO-list item that heavily hints at using them:
> > https://dri.freedesktop.org/docs/drm/gpu/todo.html#object-lifetime-fixes
> >=20
> > So it looks like we're already well on the deprecation path?
>=20
> AFAIU that TODO item is about replacing devm_kzalloc() with drmm_kzalloc(=
).
> It's not about the plain init functions, such as drm_crtc_init_with_plane=
s()
> or drm_universal_plane_init(). Many simple drivers allocate their
> modesetting pipeline's components first and then build the pipeline with =
the
> drm_ functions. I don't think we can take that away from them.

Sure, that's exactly what those first patches are about? It allows to
use a DRM managed initialization without disrupting the drivers
structure too much?

> The concern I have is that we're adding lots of helpers for all kind of
> scenarios and end up with a lot of duplication (and fragmentation among
> drivers).

I can see two: whether you want to allocate / init, or just init?
We're not going to have more than that.

> For example, drmm_crtc_alloc_with_planes() really isn't much used
> by anything. [1]

Not that I disagree here, but it might be that it isn't the most helpful
helper?

In vc4 case, we just can't use it easily.

Our CRTC driver is shared between the "regular" CRTCs in the display
path, and another instance dedicated to the writeback connector.

The shared stuff is initialized through vc4_crtc_init():
https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/vc4/vc4_crtc=
=2Ec#L1120

It initializes the structure, set up the planes, etc. Basically
everything that our CRTC controller will be doing, and would be shared
by both cases.

However, since the writeback and regular CRTC structures are different,
we can't really make that function allocate the backing structure
either.

We could do some compiler magic to pass the total size and the offset to
that function, just like what drmm_crtc_alloc_with_planes is doing, but
then we would have the same issue with the writeback stuff that needs to
initialize the encoder and connector.

So we would need a drmm_encoder_init anyway.

> Same for drmm_universal_plane_alloc(). [2]
>=20
> Instead of adding new helpers, it would be better to build upon
> drmm_crtc_alloc_with_planes(), drmm_univeral_plane_alloc(), etc.
>=20
> For example, a good starting point would be vc4_plane_init(). It could al=
loc
> with drmm_univeral_plane_alloc(), which would replace devm_kzalloc() [3] =
and
> drm_univeral_plane_alloc() [4] in one step. From what I understand, that's
> what your patchset wants to do. But it looks like you're effectively
> open-coding drmm_universl_plane_alloc().

Where I could use the alloc helper, I did. See the following patch that
does exactly what you described:
https://lore.kernel.org/dri-devel/20220610092924.754942-17-maxime@cerno.tec=
h/

> With vc4_plane_init() correctly managed, the next candidate could be
> vc4_crtc_init(). You probably want to pull vc4_plane_init() [5] into
> callers. to get it out of the way. If you move calls to devm_kzalloc() [6]
> and drm_crtc_init_with_planes() [7] closer together, you can replace them
> with drmm_crtc_alloc_with_planes().

See above

Maxime

--gsmghfy7i6uzeuhy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYqh6kAAKCRDj7w1vZxhR
xTxiAQD7Xjr5VCBuqI9/sXjT8dkn6V2uzdtD9HPierKUD12scgEAp8JtT+VYYgJV
0CjbEKcFAImbn5WE1nYTHU/phjFD0gY=
=SwR6
-----END PGP SIGNATURE-----

--gsmghfy7i6uzeuhy--
