Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6AE98EEB4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 14:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D5F10E824;
	Thu,  3 Oct 2024 12:04:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Y8eEhYWi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E4810E823;
 Thu,  3 Oct 2024 12:04:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0D8B0A43AAD;
 Thu,  3 Oct 2024 12:04:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD7BC4CEC5;
 Thu,  3 Oct 2024 12:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727957084;
 bh=l2qOB5bl/9CRgqx517deY3hmN7M+QwBoi2iW6qTBoFc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y8eEhYWiT32jJkM3mv6h+o/eaRwiy1ZBiGYnitOaTvTYYHrhoIQKrRhpGHTMHIs30
 52eKGRom3/zJm6fbioGefOc/DpqtcAASPWAjlwysnjR0igNhchd1h6Wkw1fB6pADYx
 jWWzdpAjhIW1vKj/nWRZyyW8cY1hPz+j6dMQy0/RuKwo5FdIu6XGUljKeJ6FDoulJM
 8XyoDHQ6lotOKq5SU8tHQFwCMPCXBQO/oiiQvOX0C8pVUtFt+XtjTn4wbmpF9nPqzF
 F3JvROx5M1VTJPEDGgu00fL4R4Jx/cH3JcaYQtXolaSs4mRkb8x39/wkuh+G6+cg43
 njvTv/ZSHhygg==
Date: Thu, 3 Oct 2024 14:04:41 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
 Guenter Roeck <linux@roeck-us.net>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH 0/2] drm: revert some framebuffer API tests
Message-ID: <20241003-sexy-awesome-gecko-c9e8dc@houat>
References: <cover.1726594684.git.jani.nikula@intel.com>
 <ZvKPJGQyZmdWNOmd@phenom.ffwll.local>
 <20240924-refined-nocturnal-starfish-2947b8@houat>
 <f3f8bec1-884b-46ac-82a6-6e5cb8840146@roeck-us.net>
 <20240924-handsome-labrador-of-shopping-b1dce5@houat>
 <4accd038-9624-43de-96ad-7ecd0876b607@roeck-us.net>
 <ZvP5YhON49Z5TMI7@phenom.ffwll.local>
 <20240925-fresh-artichoke-boa-1a673f@houat>
 <877caqu2mx.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="vcakatqfudz5lpi5"
Content-Disposition: inline
In-Reply-To: <877caqu2mx.fsf@intel.com>
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


--vcakatqfudz5lpi5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 02, 2024 at 03:10:14PM GMT, Jani Nikula wrote:
> On Wed, 25 Sep 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > On Wed, Sep 25, 2024 at 01:52:02PM GMT, Simona Vetter wrote:
> >> I think for at least drm the consensus is clear, we won't have kunit t=
ests
> >> that splat.
> >
> > Where was that ever discussed?
>=20
> Well, where was it ever agreed that it's okay for drm kunit tests to
> emit warnings? :p

One policy is upstream, the other isn't. And it does seem like the
consensus towards downstream patches and policies is pretty well
established.

And I wasn't the one claiming that there's a consensus to begin with, so
I don't see why I should prove anything?

> >> Personally I really don't see the point of unit tests that are
> >> somewhere between unecessarily hard or outright too much pain to
> >> deploy in a test rig: Either you don't run them (not great), or you
> >> filter splats and might filter too much (not great either) or you
> >> filter as little as possible and fight false positives (also kinda
> >> suboptimal).
> >
> > Or you don't do any of that, and just rely on the canonical way to run
> > kunit test and trust it's going to pass tests that do indeed pass, and
> > fail / warn on those that don't.
>=20
> That still doesn't address code being tested emitting *unexpected*
> warnings.

Then make kunit report a warning / failure when there's an unexpected
warning splat.


At the end of the day, the discussion is that we already require for for
each committer to:

  - Apply patches
  - Check for checkpatch issues
  - Solve potential conflicts
  - Make sure it compiles on three different architectures, with huge defco=
nfigs
  - Make sure the unit tests still pass

I'm not going to add "and grep through the output of those 1000-ish
tests for a warning" to that list.

Maxime

--vcakatqfudz5lpi5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZv6IVAAKCRAnX84Zoj2+
dt3BAX9HoNiqIeE6RAh39967u7dyuQuDhjUUAyANlP2ojd0HiFAJo2j8spn3syXv
IuGWrFgBgK0r3rWyNBNFj6oRC/TKzfLrT1t2THtDuqhL6Cr2/2azp4mbbk/s2v50
1E7SC1Np3w==
=EBOV
-----END PGP SIGNATURE-----

--vcakatqfudz5lpi5--
