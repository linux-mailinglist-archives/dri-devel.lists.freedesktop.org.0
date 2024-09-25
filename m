Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E669985D0A
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 14:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A838710E826;
	Wed, 25 Sep 2024 12:59:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TQCWuHay";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD1B310E826;
 Wed, 25 Sep 2024 12:59:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B1F5AA44213;
 Wed, 25 Sep 2024 12:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7B5C4CEC7;
 Wed, 25 Sep 2024 12:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727269190;
 bh=YuqKqRo+qUX+JyzkcMQVGkSwgTpg8Q2LS/D1v20fziQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TQCWuHayNuauzEbhKLt+LUsSTk23hwtFXXmq79gF8jweYG1dft9pUvoscGnpkl/nO
 bsPhZiOYmSLahrVTNohqe12biW384zvZgxZS6WLp4Qor2Q/gYJPW58QrxM7woBaHLn
 2lvw86R/ZrP5xtTM9aCdkvPiEe5qt0i9qcfTmbt1PBJ5w3UpVcNJ8LD9KLizFhCYw6
 oi+UnWU0DR6qO/LnlawhG8vJqyTXLXcK8BbZmBOaX1o+crxqaeKYHiShqkZ40DlVZb
 vcj5LjlFSTBFdoAPtNjjHl9WCT+UX7zdXVV6j2r7VU3nnciEr1DeQ1LUKZuRhEhJTH
 eRzkrH4o40MFg==
Date: Wed, 25 Sep 2024 14:59:47 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Guenter Roeck <linux@roeck-us.net>, 
 Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH 0/2] drm: revert some framebuffer API tests
Message-ID: <20240925-angelic-spaniel-of-acumen-33a39a@houat>
References: <cover.1726594684.git.jani.nikula@intel.com>
 <ZvKPJGQyZmdWNOmd@phenom.ffwll.local>
 <20240924-refined-nocturnal-starfish-2947b8@houat>
 <f3f8bec1-884b-46ac-82a6-6e5cb8840146@roeck-us.net>
 <20240924-handsome-labrador-of-shopping-b1dce5@houat>
 <4accd038-9624-43de-96ad-7ecd0876b607@roeck-us.net>
 <87ed593v11.fsf@intel.com>
 <20240924-impressive-coua-from-hyperborea-bfff8b@houat>
 <87o74c2hpn.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="lqygypgybsbrlbgt"
Content-Disposition: inline
In-Reply-To: <87o74c2hpn.fsf@intel.com>
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


--lqygypgybsbrlbgt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 12:41:40PM GMT, Jani Nikula wrote:
> On Tue, 24 Sep 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > On Tue, Sep 24, 2024 at 06:56:26PM GMT, Jani Nikula wrote:
> >> On Tue, 24 Sep 2024, Guenter Roeck <linux@roeck-us.net> wrote:
> >> >>>> On Tue, Sep 24, 2024 at 12:06:28PM GMT, Simona Vetter wrote:
> >> >>>>> Yeah I think long-term we might want a kunit framework so that w=
e can
> >> >>>>> catch dmesg warnings we expect and test for those, without those=
 warnings
> >> >>>>> actually going to dmesg. Similar to how the lockdep tests also r=
eroute
> >> >>>>> locking validation, so that the expected positive tests don't wr=
eak
> >> >>>>> lockdep for real.
> >> >>>>>
> >> >>>>> But until that exists, we can't have tests that splat in dmesg w=
hen they
> >> >>>>> work as intended.
> >> >
> >> > FWIW, that is arguable. More and more tests are added which do add s=
uch splats,
> >> > and I don't see any hesitance by developers to adding more. So far I=
 counted
> >> > two alone in this commit window, and that does not include new splat=
s from
> >> > tests which I had already disabled. I simply disable those tests or =
don't
> >> > enable them in the first place if they are new. I did the same with =
the drm
> >> > unit tests due to the splats generated by the scaling unit tests, so=
 any
> >> > additional drm unit test splats don't make a difference for me since=
 the
> >> > tests are already disabled.
> >>=20
> >> What's the point of having unit tests that CI systems routinely have to
> >> filter out of test runs? Or filter warnings generated by the tests,
> >> potentially missing new warnings. Who is going to run the tests if the
> >> existing CI systems choose to ignore them?
> >
> > If we turn this argument around, that means we can't write unit test for
> > code that will create a warning.
>=20
> The question really is, which warnings we get because of the
> functionality being tested, and which warnings are due to an unexpected
> and unrelated bug? Is it a pass or fail if the test triggers an
> unrelated warning?
>=20
> If the developer runs the tests, are they expected to look at dmesg and
> inspect every warning to decide?

No, there's no such expectation. Yet Intel's CI chose to do so, and
chose to treat any warning as a failure, despite the fact that kunit
doesn't have the same policy.

> > IMO, this creates a bad incentive, and saying that any capable CI system
> > should reject them is certainly opiniated.
>=20
> All I'm saying it generates an extra burden for current real world CI
> systems that run tests on a massive scale and even have paid
> maintainers. It's not trivial to sort out expected and unexpected
> warnings, and keep the filters updated every time the warnings
> change. It's not without a cost. And the end result might just be that
> the unit tests won't get run at all. Or warnings just get completely
> ignored for kunit tests.

I realise it must take a significant amount of resources, but it's also
self inflicted. You could also stop looking for warnings when running
kunit.

> I don't completely disagree with you either. It's just that we don't
> have that automation on the kernel side, and in the mean time, perhaps
> we should be really conservative about the warnings we create in tests?
>=20
> If we can't filter out the warnings kernel side, perhaps we could figure
> out a way to annotate the kunit tests that generate warnings on passing
> runs?

Yeah, I think that would be the best solution. That's what Guenther's
series was about :/

Maxime

--lqygypgybsbrlbgt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvQJOwAKCRAnX84Zoj2+
dvkCAYCsTaDO8UbqN46/DnN4dkmIXAA5zFPvuV0gH1MO8pKm37lF9qa+LmjZxLyg
bTG4SlwBfiaQMI3LNDtIg1JhVFF679o3SEk/o4ESPVno62EVritBjgNLjhwjm3y8
O/YmafhPdg==
=4KKm
-----END PGP SIGNATURE-----

--lqygypgybsbrlbgt--
