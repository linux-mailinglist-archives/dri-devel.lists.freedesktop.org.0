Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 609DD86E2F9
	for <lists+dri-devel@lfdr.de>; Fri,  1 Mar 2024 15:07:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F4E610EF59;
	Fri,  1 Mar 2024 14:07:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PybPpKrr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52E6A10EF59
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Mar 2024 14:07:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B0784CE0622;
 Fri,  1 Mar 2024 14:07:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9129C433F1;
 Fri,  1 Mar 2024 14:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709302067;
 bh=V/ZkOgK2iZvRSQ++CJWksKmz0CTjhfhLyLii2QbfEkk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PybPpKrrCcZPy18fpDWyIlQodCkmfcS1+/l19GXkZ5jkeKjFQYmQo+krU/Ko9/JMR
 Q5w05L8FpAF5VJfBGVnUbE84zUiK1aUyXtABKvHzocb3zZwcljQgcDF4EiigStwNdS
 Cww/amyTfu8FpryNgmEuFAxp9V+Ve+9Pjp5pJZJes/fxCcUxAm/zbZZRftNTzPHnvS
 Oj7zC2/yU3RziaxBek7jtQdUSaYDu/zGD862eAROgE0dqHsoX1Akz5E9CAaSw9rQYt
 Zl/5YHw/4hwcy3X6oEqHDhFHzfekhpO+5KVnojVxnOLAe1eAlOIuRuatjotfKru6DA
 65NE8wX3ss10Q==
Date: Fri, 1 Mar 2024 14:07:39 +0000
From: Mark Brown <broonie@kernel.org>
To: Nikolai Kondrashov <spbnick@gmail.com>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Helen Koike <helen.koike@collabora.com>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 gustavo.padovan@collabora.com, pawiecz@collabora.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com,
 davidgow@google.com, cocci@inria.fr, Julia.Lawall@inria.fr,
 laura.nao@collabora.com, ricardo.canuelo@collabora.com,
 kernel@collabora.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
Message-ID: <9183479f-eea8-493e-9a56-9f3f778e3034@sirena.org.uk>
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <44ae0339-daf1-4bb9-a12d-e3d2e79b889e@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YhbwdPAihVH/ItCG"
Content-Disposition: inline
In-Reply-To: <44ae0339-daf1-4bb9-a12d-e3d2e79b889e@gmail.com>
X-Cookie: Schizophrenia beats being alone.
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


--YhbwdPAihVH/ItCG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 01, 2024 at 12:27:13PM +0200, Nikolai Kondrashov wrote:
> On 2/29/24 10:21 PM, Linus Torvalds wrote:

> > We already have the situation that the drm people have their own ci
> > model. II'm ok with that, partly because then at least the maintainers
> > of that subsystem can agree on the rules for that one subsystem.

> > I'm not at all interested in having something that people will then
> > either fight about, or - more likely - ignore, at the top level
> > because there isn't some global agreement about what the rules are.

> > For example, even just running checkpatch is often a stylistic thing,
> > and not everybody agrees about all the checkpatch warnings.

...

> > I would suggest the CI project be separate from the kernel.

> It is possible to have a GitLab CI setup with the YAML files in a separate
> repository. And we can start with that. However, ultimately I think it's
> better to have it in the same repo with the code being tested. This way you
> could submit code changes together with the required tweaks to the CI to keep
> it passing, making development smoother and faster.

> With that in mind, and if you agree, where else would you say we could put it?
> Under "scripts"? Or "Documentation"? And where it would be best for the
> various subsystems to put theirs? Or could we have the top-level "ci" dir and
> pile all the different setups there? Or would you like to wait and see how
> adoption goes, and then decide?

If we were going to put bits of this in tree how about something like
tools/testing/forges?  I'd hope that things could be shared by multiple
services, if not we could always have subdirs I guess.  We could put
glue bits like defining how to run kunit, checkpatch or whatever with
these systems in there so people can share figuring that bit out.
Individual trees or CI systems using these forge based systems could
then reference these files when defining what specific tests they want
to run when which seems more like where the differences will be.

I'm not super familiar with this stuff, the above is based on it looking
like there's an OK degree of separation between the "what to run" and
"how to run" bits.  I might be misreading things, and it's not clear to
me how often it'll be useful to be able to update things in tree.

--YhbwdPAihVH/ItCG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmXh4SoACgkQJNaLcl1U
h9Bblwf/VTM6YUfyvCiFxlO2Sxm0DvgYcdMKFDVe0Iwu6FKdwHafjgfDIAW/fydL
Zseb1Kh+uo2pgtj0H6hU5ZNPVzux4lyYsfO7aWhZePjev836VEqMIEeJJp7Xxc+G
GyrpLnxWa/q+WvHh/dOycgP8JdJTWIoPPP27rSFGsgikoqTVhtJUF2ld6MPJGSbe
2Gna3Kd/ALF9sms7c/ND6qWhoqLlsjFF7v6SDUuOHfVozPdez72lpAx0WLSdj29D
9Bm2oGIEPWS1dlyXRXh34AaUeUFqXnr0kK2fgOkadM/ndszTaB3+X3ujZXC2MCUL
+5OwpbUNLXA9RkS8JN2anvXIQ9uuGg==
=mh+h
-----END PGP SIGNATURE-----

--YhbwdPAihVH/ItCG--
