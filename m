Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CFA54DE35
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 11:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA765113CC2;
	Thu, 16 Jun 2022 09:32:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4342A113CD0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 09:32:46 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id A3DA75C08DE;
 Thu, 16 Jun 2022 05:32:45 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 16 Jun 2022 05:32:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1655371965; x=1655458365; bh=RiDLkF+e0U
 j4+kBcfiJpRUrbXRoo6jTFp0nbmuev748=; b=n5FRRtrDN9qo9vcwQtT2qSGNT3
 f97M+1FiPZMhv3/q5hinqO6GdPuZKbhRH4588cBBn4oZtHTCSjYT+KOxq7XaeQp/
 P6jvURNzc5jWH8ll8q0DS2rNoT4PdQqQgSOvaVdCKRFsRF/1m05jxiDmznGqVjDt
 0ywTDmzd5sFU3oWV+LuSvr1QpC/VtX4NcCZLo2ZZedq0yt6Wzyo3dGhgAZPl4rcr
 lp99/hJ6hRGlDnlFE+kLZZ1l0G9Hrle5zZda1ERqwy/W4JTGDKsyVy0g6JI7iFte
 p1ljG+6ZErj05BMYKlS3nH7uy/Iz5pwyqE/ZulneNQS8WTQSKCXOqUDmoATA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1655371965; x=1655458365; bh=RiDLkF+e0Uj4+kBcfiJpRUrbXRoo
 6jTFp0nbmuev748=; b=LKhDUgNqhUZso3etoASietr3iObfDyiaVmsn5swe5hvx
 vGqQCW/8d3VncSfuJzIwqI4Rea6uRk2HhQaYNkq9LzIodINijItxyfvt+UOnpVUE
 RhR5sv5VyYYlZH/zOBE7y2dRY3JCQxyfQaKtlY2mZsc1teeqz9NUqloxUsW7V/cD
 OOgkaAIURfvvzNrWRtIP7SaiyNDAfljMUhG0cFQjYkoeZ2K4ITOY/lMXDaaNnKVc
 Ryke1HI3A4idBDASzCbYmP1Xv7PTY3K0q01jbRn78oIserwVQFB9pCF8KEcLMX0J
 lgH10443HF59JtQRC3OVA0Dbe+4P/poktLimV6tCeA==
X-ME-Sender: <xms:vfiqYpzU8MrBN-6oZ6w1vYVfePAC1GS5gYR6YyeUYJLu5qrjvnqxtA>
 <xme:vfiqYpTKVFclvJozXQjrOotExaDKZbRgqqJOppL0LHBqGJB1kkrqgx-HaFfCYsYi5
 ns1sR1q833UL-uifuY>
X-ME-Received: <xmr:vfiqYjWR62zkWFXcQPvLdeQ8YH-gVXRjwZVWLA3pI8RdMbpRb5bA1_iiov1SaWDDAvdMYUtCFksVkZt9T0qe6MmWqhorulMWj7AkdJc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvfedgudduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:vfiqYrjdgRye9rNw2sc_Qmo5FPgSK1CZ3rt_sD2jFc46Ch3vjNqyKg>
 <xmx:vfiqYrB7YgJ6OAdnxYAh5YOrli0hTQqKrmtVZFqyheLMBnFVTzmrcw>
 <xmx:vfiqYkJmNaYD7FnXhaEVg5AkR7y2Up0x3fDGMylBz6Ovw5y6MYnBXw>
 <xmx:vfiqYuNOv2brUEP8tD_n0-pwPXKmaW60VzN05jl3wJmayChPMmDWSQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 05:32:44 -0400 (EDT)
Date: Thu, 16 Jun 2022 11:32:43 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/64] drm/crtc: Introduce drmm_crtc_init_with_planes
Message-ID: <20220616093243.t6fchtg4nu5lv4jy@houat>
References: <20220610092924.754942-3-maxime@cerno.tech>
 <d975dc1d-7573-7976-427f-e941cbfa0caf@suse.de>
 <20220614073716.zwshdcf3q5fjobuq@houat>
 <ef19ba8b-ec66-9a00-5456-b4eefbec95cd@suse.de>
 <20220614090440.dwfvsmqnsd7fo24c@houat>
 <07fca319-f6b4-e022-3291-24c3f6439a86@suse.de>
 <20220614120952.b32i46qfz476mspq@houat>
 <4ae26a1a-9f53-8db6-634b-c5405971e1b1@suse.de>
 <20220615083259.nvf46giedkmr5buj@houat>
 <319ef2e1-6af9-fec8-90a1-b2b81ec3de4f@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qppeb3fzgjlcefzm"
Content-Disposition: inline
In-Reply-To: <319ef2e1-6af9-fec8-90a1-b2b81ec3de4f@suse.de>
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


--qppeb3fzgjlcefzm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2022 at 12:34:46PM +0200, Thomas Zimmermann wrote:
> Hi
>=20
> Am 15.06.22 um 10:32 schrieb Maxime Ripard:
> [...]
> > > See, helpers should be useful to many drivers. If we add them, we als=
o add a
> > > resources and maintenance overhead to our libraries. And right now, t=
hese
> > > new functions appear to work around the design of the vc4 driver's da=
ta
> > > structures.  If you want to keep them, maybe let's first merge them i=
nto vc4
> > > (something like vc4_crtc_init_with_planes(), etc). If another driver =
with a
> > > use case comes along, we can still move them out easily.
> >=20
> > Not that I disagree, but there's also the fact that people will start
> > using helpers because they are available.
> >=20
> > You mentioned drmm_crtc_alloc_with_planes(). It was introduced in 5.12
> > with a single user (ipuv3-crtc.c). And then, because it was available,
> > in 5.17 was merged the Unisoc driver that was the second user of that
> > function.
>=20
> OTOH, it actually took 5 releases to find another user. Maybe we need to
> look harder for possible reuse of helpers, but I wouldn't count 5 releases
> as a good track record.

Indeed, but I'm not sure it's due to the helper itself. I'm fairly sure
nobody really cared or knows about the lifetime issues solved by the
drm-managed functions, and so nobody feels an urge to convert.

And one can't ask during review to use it if they're not aware of the
helpers existence. Between 5.12 and 5.17, only hyperv and sprd were
merged. 50% of the new drivers using it is not too bad.

> > drmm_simple_encoder_alloc() and drmm_universal_plane_alloc() are in the
> > same situation and we wouldn't have had that discussion if it was kept
> > in the imx driver.
> >=20
> > The helper being there allows driver authors to discover them easily,
> > pointing out an issue that possibly wasn't obvious to the author, and we
> > can also point during review that the helpers are there to be used.
> >=20
> > None of that would be possible if we were to keep them in a driver,
> > because no one but the author would know about it.
> >=20
> > My feeling is that the rule you mention works great when you know that
> > some deviation is going to happen. But we're replacing an init function
> > that has been proved good enough here, so it's not rocket science
> > really.
> >=20
> > drmm_mutex_init() is a great example of that actually. You merged it
> > recently with two users. We could have used the exact same argument that
> > it belonged in those drivers because it wasn't generic enough or
> > something. But it's trivial, so it was a good decision to merge it as a
> > helper. And because you did so, I later found out that mutex_destroy()
> > was supposed to be called in the first place, I converted vc4 to
> > drmm_mutex_init(), and now that bug is fixed.
>=20
> But when I added it, there actually were two users. I would not have added
> drmm_mutex_init() if it was only useful for a single driver.
>=20
> In other cases, we tend to push single-user helpers into the drivers. That
> happened several times with TTM. Code was moved into vmwgfx, because there
> where no other users.

Yeah, and I introduced some in that series too. It makes sense to have
that restriction for stuff that we're not really sure about. But for
strict equivalents to functions that already exists with the same API
I'm not sure that restriction makes sense.

In fact, we also merged recently devm_drm_bridge_add with a single user
and that was fine too, because that function has been there for a while
and we know it's not going to change much.

> Anyway, as you insist on using this helper, go for it. But please, at lea=
st
> reimplement drm_crtc_alloc_with_planes() on top of a shared internal
> implementation. AFAICT drm_crtc_alloc_with_planes() is drmm_kzalloc +
> drmm_crtc_init_with_planes().

Ack

> Same for other related helpers in the other patches, if there are any.

drmm_encoder_alloc() and drmm_simple_encoder_alloc() are in the same
situation, I'll fix those too.

Maxime

--qppeb3fzgjlcefzm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHQEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYqr4uwAKCRDj7w1vZxhR
xUFQAQDgX8zfkL+gZpUWNk2m327eeCqzXbWzO/ycbZ+TcfZJdwD412SUeaQP/OqM
1aem3lROlh4W1zXjueJnuLHddgj4Bw==
=tCuv
-----END PGP SIGNATURE-----

--qppeb3fzgjlcefzm--
