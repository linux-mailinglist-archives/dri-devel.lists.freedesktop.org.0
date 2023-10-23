Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E33597D4CC0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 11:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA8610E310;
	Tue, 24 Oct 2023 09:42:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1079E10E310
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 09:42:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 69F4C62AEA;
 Tue, 24 Oct 2023 09:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8E7AC433C7;
 Tue, 24 Oct 2023 09:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698140563;
 bh=+14DuUiWFelobgtw27t7MzO5DykGmmwJr6gFwtV7YP0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IlIlRtHfwChp12r/0geAv7foHIFj4F2orI7Jb0p1RvIYiQStXWtQw7lE7Gw118XVB
 Xl5cv5Q3078g0l2Qlv0UxOTkK1/LpP1djs8/gZkrBwIDGQbL0GoxJokHNBnR/INcVv
 8iReyZOdayCqgsMLUib6ZmQqVN/ZwyzEEhUkrYphdtDEmI3ytmPx5oBSmuT60Nduno
 TmWYTbtSTspO9CSQp8VYYKmqKNhxJZjpVOKxu4jfH7iX0F3XdxPZnJQSM0bWls3KMH
 ndRaAPijAd3NlJe7x//QxkZkyc+3yQNLo8GFyz2YTZA1s6sFqWXi68cTuHjCpkj+aH
 0sLEzrI82z/Bw==
Date: Mon, 23 Oct 2023 17:05:00 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Helen Koike <helen.koike@collabora.com>
Subject: Re: [PATCH] drm/doc: ci: Require more context for flaky tests
Message-ID: <mmjjwyz274q4myvrymtcfk6x2qvx6zqcwzxox4jfytk4zkha6b@xgkstkku7ytq>
References: <20231019094609.251787-1-mripard@kernel.org>
 <ba2cd566-328d-4a47-9ab8-05817c14f0bd@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ddvskc2jmmeffgm6"
Content-Disposition: inline
In-Reply-To: <ba2cd566-328d-4a47-9ab8-05817c14f0bd@collabora.com>
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
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ddvskc2jmmeffgm6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 19, 2023 at 01:51:59PM -0300, Helen Koike wrote:
>=20
>=20
> On 19/10/2023 06:46, Maxime Ripard wrote:
> > Flaky tests can be very difficult to reproduce after the facts, which
> > will make it even harder to ever fix.
> >=20
> > Let's document the metadata we agreed on to provide more context to
> > anyone trying to address these fixes.
> >=20
> > Link: https://lore.kernel.org/dri-devel/CAPj87rPbJ1V1-R7WMTHkDat2A4nwSd=
61Df9mdGH2PR=3DZzxaU=3DQ@mail.gmail.com/
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >   Documentation/gpu/automated_testing.rst | 13 +++++++++++++
> >   1 file changed, 13 insertions(+)
> >=20
> > diff --git a/Documentation/gpu/automated_testing.rst b/Documentation/gp=
u/automated_testing.rst
> > index 469b6fb65c30..2dd0e221c2c3 100644
> > --- a/Documentation/gpu/automated_testing.rst
> > +++ b/Documentation/gpu/automated_testing.rst
> > @@ -67,6 +67,19 @@ Lists the tests that for a given driver on a specifi=
c hardware revision are
> >   known to behave unreliably. These tests won't cause a job to fail reg=
ardless of
> >   the result. They will still be run.
> > +Each new flake entry must be associated with a link to a bug report to
>=20
> What do you mean by but report? Just a link to an email to the mailing li=
st
> is enough?

Yes, a mail to the maintainers of that driver is enough. Waiting for an
actual fix would take too long, but at least that way we have the
opportunity to come back later on and see if there's progress.

> Also, I had made a mistake to the first flakes lists, which I corrected w=
ith
> https://www.spinics.net/lists/kernel/msg4959629.html (there was a bug in =
my
> script which ended up erroneous adding a bunch of tests in the flake list,
> so I cleaned them up), I would like to kind request to let me add those
> documentation in a future patch to not block that patch series.

Sounds fair, especially since you remove a significant number of them

Maxime

--ddvskc2jmmeffgm6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZTaLnAAKCRDj7w1vZxhR
xZ1uAP43/apOso8h2zdK5nDAPDoYMUmHpJ6JVYicnW7xNvVBsgD+JdQQ4kGf76/3
DBFf0hYwlrdAWzyiCH/aBN43Yk0ehwQ=
=Dn5h
-----END PGP SIGNATURE-----

--ddvskc2jmmeffgm6--
