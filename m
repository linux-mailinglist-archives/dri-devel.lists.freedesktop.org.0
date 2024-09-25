Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3755985D38
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 15:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB06310E82E;
	Wed, 25 Sep 2024 13:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RrvjXy5l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB46710E82C;
 Wed, 25 Sep 2024 13:05:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ECE55A44203;
 Wed, 25 Sep 2024 13:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F13DC4CEC3;
 Wed, 25 Sep 2024 13:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727269507;
 bh=tSZlyeOWFa/78DV64t2fG4Bfeq9ggasgy6CX/sPk6xk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RrvjXy5ltWdpieybDgfwWOY91D5L2D0GzHPaA/4LY8nkuoVXbgMLPAvem6UY/ALX1
 cAxsfCHtbTSdHIbQEavM4suYMqdnXd50maxayJhlJBwi5Dl5lugnMa1tU+1gVc08TM
 ILlbZE4gz5KLBIXFZzff68/Aii4dlrdewnsPihzlk+148EvduyDhzm6LHgkhbHuJjl
 iNHQ+yZdfdxUdylpqzo+uF3y5eRZTTmWKXIdPU3C1BMvVKp3prVPF2SqYGL8GZI6sM
 KJcY6HuUk9sdEHiGYF/7HWu7a/uzg9ZfgXfQYHXL+/nr5EPUK69O58n3yfniUq6ymX
 Pvs9yV1sU7PYg==
Date: Wed, 25 Sep 2024 15:05:04 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Simona Vetter <simona.vetter@ffwll.ch>
Cc: Guenter Roeck <linux@roeck-us.net>, 
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH 0/2] drm: revert some framebuffer API tests
Message-ID: <20240925-fresh-artichoke-boa-1a673f@houat>
References: <cover.1726594684.git.jani.nikula@intel.com>
 <ZvKPJGQyZmdWNOmd@phenom.ffwll.local>
 <20240924-refined-nocturnal-starfish-2947b8@houat>
 <f3f8bec1-884b-46ac-82a6-6e5cb8840146@roeck-us.net>
 <20240924-handsome-labrador-of-shopping-b1dce5@houat>
 <4accd038-9624-43de-96ad-7ecd0876b607@roeck-us.net>
 <ZvP5YhON49Z5TMI7@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="bmzrcmqdhfmtkdfo"
Content-Disposition: inline
In-Reply-To: <ZvP5YhON49Z5TMI7@phenom.ffwll.local>
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


--bmzrcmqdhfmtkdfo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 01:52:02PM GMT, Simona Vetter wrote:
> On Tue, Sep 24, 2024 at 08:09:38AM -0700, Guenter Roeck wrote:
> > On 9/24/24 06:56, Maxime Ripard wrote:
> > > On Tue, Sep 24, 2024 at 06:37:59AM GMT, Guenter Roeck wrote:
> > > > On 9/24/24 04:54, Maxime Ripard wrote:
> > > > > +Guenter
> > > > >=20
> > > > > On Tue, Sep 24, 2024 at 12:06:28PM GMT, Simona Vetter wrote:
> > > > > > On Tue, Sep 17, 2024 at 08:43:50PM +0300, Jani Nikula wrote:
> > > > > > > The tests consistently trigger WARNs in drm_framebuffer code.=
 I'm not
> > > > > > > sure what the point is with type of belts and suspenders test=
s. The
> > > > > > > warnings *are* the way to flag erroneous API usage.
> > > > > > >=20
> > > > > > > Warnings in turn trigger failures in CI. Filtering the warnin=
gs are
> > > > > > > error prone, and, crucially, would also filter actual errors =
in case the
> > > > > > > kunit tests are not run.
> > > > > > >=20
> > > > > > > I acknowledge there may be complex test cases where you'd end=
 up
> > > > > > > triggering warnings somewhere deep, but these are not it. The=
se are
> > > > > > > simple.
> > > > > > >=20
> > > > > > > Revert the tests, back to the drawing board.
> > > > > >=20
> > > > > > Yeah I think long-term we might want a kunit framework so that =
we can
> > > > > > catch dmesg warnings we expect and test for those, without thos=
e warnings
> > > > > > actually going to dmesg. Similar to how the lockdep tests also =
reroute
> > > > > > locking validation, so that the expected positive tests don't w=
reak
> > > > > > lockdep for real.
> > > > > >=20
> > > > > > But until that exists, we can't have tests that splat in dmesg =
when they
> > > > > > work as intended.
> > > > >=20
> >=20
> > FWIW, that is arguable. More and more tests are added which do add such=
 splats,
> > and I don't see any hesitance by developers to adding more. So far I co=
unted
> > two alone in this commit window, and that does not include new splats f=
rom
> > tests which I had already disabled. I simply disable those tests or don=
't
> > enable them in the first place if they are new. I did the same with the=
 drm
> > unit tests due to the splats generated by the scaling unit tests, so any
> > additional drm unit test splats don't make a difference for me since the
> > tests are already disabled.
>=20
> I think for at least drm the consensus is clear, we won't have kunit tests
> that splat.

Where was that ever discussed?

> Personally I really don't see the point of unit tests that are
> somewhere between unecessarily hard or outright too much pain to
> deploy in a test rig: Either you don't run them (not great), or you
> filter splats and might filter too much (not great either) or you
> filter as little as possible and fight false positives (also kinda
> suboptimal).

Or you don't do any of that, and just rely on the canonical way to run
kunit test and trust it's going to pass tests that do indeed pass, and
fail / warn on those that don't.

> Especially for unit tests this stuff must be totally rock solid.

Is there any evidence that those tests were not rock solid?

> We've had similar discussions in the past around unit tests that wasted
> too much cpu time with randomized combinatorial testing, and we've thrown
> those out too from drm. Test hygiene matters.

We had that discussion because those tests could run for up to around a
minute on certain platforms. It's not the same issue at all?

Maxime

--bmzrcmqdhfmtkdfo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvQKgAAKCRAnX84Zoj2+
dqsKAX44fHUnaN8y4Bwlky/6znbuj7zV3JT/VAn8AQJb5hHDIVVPhH/ai0PrCNoy
maXvRWEBf1JLVUEyBYRqGf9DMdxWe9Dq6hGaR04qOatu+opkWWoVuXp5e0DnfUgn
zCS0XD7JHw==
=8ZDU
-----END PGP SIGNATURE-----

--bmzrcmqdhfmtkdfo--
