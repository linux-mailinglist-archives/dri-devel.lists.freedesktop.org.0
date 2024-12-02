Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 613A19E0651
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 16:08:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E244310E79D;
	Mon,  2 Dec 2024 15:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bpQLzgI0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73C810E790;
 Mon,  2 Dec 2024 15:07:59 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 41B7AA40EDD;
 Mon,  2 Dec 2024 15:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20ACDC4CEDA;
 Mon,  2 Dec 2024 15:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733152078;
 bh=Znclq/zzTXpSoR6+meWmkAfqzY+2c5VrITqNiZrZqQM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bpQLzgI0JGP8xrDGf/kxIl5TcRYS37pFNZ115YibxagwtFonaQVpXcnjcFCBesx3B
 949hAUEU7V8hMO+LYZt5K9RoG1oWOicf8GB2dP/e72EYziw9XjcjRTTXecFqFztOhO
 /TdhiuM+9mIty2DC6bG6Bdmj8BF+UblnejQPA8sWKhiT2g520du3JwuGBwMDznZEX1
 hU+f8CF0pf7Yz5Lcwvbo/JAohSaSOhVFI2o+dBFCXvvN7HbmM37RiqtVwNlt/50W51
 vi8YO9RJKP2G5fjRx1lBrBhFJEUMJVg3XG9wveQItOQ8XLZd6706/25lF8G4S/PNWp
 cWephrEHpVXvg==
Date: Mon, 2 Dec 2024 16:07:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Imre Deak <imre.deak@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Dave Airlie <airlied@redhat.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
Message-ID: <20241202-bald-finicky-coyote-e9ff4c@houat>
References: <20241126161859.1858058-1-imre.deak@intel.com>
 <20241126161859.1858058-2-imre.deak@intel.com>
 <Z0nO-bwpbWPVryd6@ideak-desk.fi.intel.com>
 <20241129-wild-cobra-of-thunder-829d1f@houat>
 <Z0nn0VzawSCdOCKY@ideak-desk.fi.intel.com>
 <20241202-real-benevolent-skunk-a9f5e0@houat>
 <87ldwy5lvb.fsf@intel.com>
 <Z021G3tmmRTi4iyl@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="zlixp4geqfwx2xs4"
Content-Disposition: inline
In-Reply-To: <Z021G3tmmRTi4iyl@ideak-desk.fi.intel.com>
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


--zlixp4geqfwx2xs4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 1/4] drm/dp: Add a way to init/add a connector in
 separate steps
MIME-Version: 1.0

On Mon, Dec 02, 2024 at 03:24:43PM +0200, Imre Deak wrote:
> On Mon, Dec 02, 2024 at 02:07:36PM +0200, Jani Nikula wrote:
> > On Mon, 02 Dec 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > > It's not about whether we have a problem or not: you introduce new
> > > framework functions, you need to have kunit tests to check their
> > > behaviour.
> >=20
> > I don't fundamentally disagree with that goal, but it does seem like a
> > pretty drastic policy change. I don't recall a discussion where we made
> > that decision, nor can I find any documentation stating this. Or what
> > exactly the requirement is; it's totally unclear to me.
> >=20
> > Had I been involved, I would've pointed out that while adding tests is
> > good, it inevitably increases the friction of adding new stuff to drm
> > core. It's super tempting for people to just get their jobs done. If
> > doing the right thing adds yet another hurdle, we may see more stuff
> > being added in drivers instead of drm core.
> >=20
> > (Case in point, we already hacked around the problem being solved here
> > with commit d58f65df2dcb ("drm/i915/dp_mst: Fix connector initialization
> > in intel_dp_add_mst_connector()"). We could've just dropped the ball
> > right there.)
>=20
> Fwiw, in this case adding tests for drm_connector_init_core() and
> drm_connector_add() looks simple enough.
>=20
> IIUC it's the 3 testcases in drmm_connector_init_tests[] performed for
> drm_connector_init_core() and additional 3 test cases checking that (1)
> drm_connector_init_core() doesn't add the connector to the connector
> list, (2) drm_connector_add() adds it and (3) drm_connector_add() fails
> (by not adding the connector to the list and emitting a dmesg WARN) if
> drm_connector_init_core() was not called for the connector previously.
> For the last test I actually need to add the corresponding assert/early
> return to drm_connector_add().
>=20
> If Maxim could confirm the above, I could resend the patchset adding
> these tests.

Yep, sounds great, thanks!
Maxime

--zlixp4geqfwx2xs4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ03NSwAKCRAnX84Zoj2+
dm1SAYC5dcscCqJzr68dXCO5+48WpeGh/Ekh0Ojqf69MbFSay4iiFW1UjPIgE8if
qd5FAIcBgKpIIgO8h1VjlWTo8ZpYnYtLzn4SRLihYzQIfDKFK86iHpiu7g9D9cEn
qFfbYTW+wQ==
=5UCA
-----END PGP SIGNATURE-----

--zlixp4geqfwx2xs4--
