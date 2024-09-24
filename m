Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1711898471B
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 15:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D206410E8BE;
	Tue, 24 Sep 2024 13:56:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kqIUPjno";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5A510E8BE;
 Tue, 24 Sep 2024 13:56:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 529A2A425EE;
 Tue, 24 Sep 2024 13:56:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47458C4CEC4;
 Tue, 24 Sep 2024 13:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727186208;
 bh=rkiYMbeNOcMWSHwiATdxACDwbm/1xjqJ1mdRQPtukOQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kqIUPjnoCyMMKD5hbTDH4WIt2wRAX9yrdl25CxsliWu/hSemxQhKhqS6CqOYSx304
 lMl8UXKuR1B98NmubnHuXS3dN918ohCECmXvoPzsakdeVXeWy4d2963Om/qOsyAUoH
 w/pLR8fKVTfp2FaTLnFhd+4T0j2uBi2OmrMlnrcKXfDtrOh+sz7nHJfYy5wnh/lvrF
 WbdcZ7679/xRAP9dSrZeejz9Ba2yJppU/OJRExEA13uJz44029O7VchaU/H/Qwh0j5
 uv1whhT8C5po5kjL3HevDUZtWZPQNLlE5EATFVUWc1Ko+U29LxljOPyAHUCbA+51AK
 c35o8EzlOyyzA==
Date: Tue, 24 Sep 2024 15:56:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Simona Vetter <simona.vetter@ffwll.ch>, 
 Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, 
 Carlos Eduardo Gallo Filho <gcarlos@disroot.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: Re: [PATCH 0/2] drm: revert some framebuffer API tests
Message-ID: <20240924-handsome-labrador-of-shopping-b1dce5@houat>
References: <cover.1726594684.git.jani.nikula@intel.com>
 <ZvKPJGQyZmdWNOmd@phenom.ffwll.local>
 <20240924-refined-nocturnal-starfish-2947b8@houat>
 <f3f8bec1-884b-46ac-82a6-6e5cb8840146@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="6mhxbxzwj7zqkmdc"
Content-Disposition: inline
In-Reply-To: <f3f8bec1-884b-46ac-82a6-6e5cb8840146@roeck-us.net>
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


--6mhxbxzwj7zqkmdc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 24, 2024 at 06:37:59AM GMT, Guenter Roeck wrote:
> On 9/24/24 04:54, Maxime Ripard wrote:
> > +Guenter
> >=20
> > On Tue, Sep 24, 2024 at 12:06:28PM GMT, Simona Vetter wrote:
> > > On Tue, Sep 17, 2024 at 08:43:50PM +0300, Jani Nikula wrote:
> > > > The tests consistently trigger WARNs in drm_framebuffer code. I'm n=
ot
> > > > sure what the point is with type of belts and suspenders tests. The
> > > > warnings *are* the way to flag erroneous API usage.
> > > >=20
> > > > Warnings in turn trigger failures in CI. Filtering the warnings are
> > > > error prone, and, crucially, would also filter actual errors in cas=
e the
> > > > kunit tests are not run.
> > > >=20
> > > > I acknowledge there may be complex test cases where you'd end up
> > > > triggering warnings somewhere deep, but these are not it. These are
> > > > simple.
> > > >=20
> > > > Revert the tests, back to the drawing board.
> > >=20
> > > Yeah I think long-term we might want a kunit framework so that we can
> > > catch dmesg warnings we expect and test for those, without those warn=
ings
> > > actually going to dmesg. Similar to how the lockdep tests also reroute
> > > locking validation, so that the expected positive tests don't wreak
> > > lockdep for real.
> > >=20
> > > But until that exists, we can't have tests that splat in dmesg when t=
hey
> > > work as intended.
> >=20
> > It should be pretty soon:
> > https://lore.kernel.org/dri-devel/20240403131936.787234-1-linux@roeck-u=
s.net/
> >=20
> > I'm not sure what happened to that series, but it looks like everybody
> > was mostly happy with it?
> >=20
>=20
> Major subsystem maintainers did not provide any feedback at all, and then
> there came the "it is not perfect enough" feedback, so I gave up on it.

Well, if that means anything, we're interested even in something
imperfect if it solves the above case :)

Maxime

--6mhxbxzwj7zqkmdc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvLFFQAKCRAnX84Zoj2+
dp/pAXsE6mQVx2RyVlV/AVVRG2eI9EIPN/oUSj/n61jKiTOcd/Jtb2SJ5iRQWfMb
n43uWJsBgNGKplQWoEqn5/Eie7ZTRoayIpZdQZ145IRV9lNF6ok7in2l7WGC0Mbx
EPequ+EZyw==
=SQ5G
-----END PGP SIGNATURE-----

--6mhxbxzwj7zqkmdc--
