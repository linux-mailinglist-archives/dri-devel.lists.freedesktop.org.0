Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0F3986D32
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 09:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9619E10EA9E;
	Thu, 26 Sep 2024 07:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WkN3VDgM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D3910EA9E;
 Thu, 26 Sep 2024 07:05:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3E2AB5C59BE;
 Thu, 26 Sep 2024 07:05:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 880C2C4CEC5;
 Thu, 26 Sep 2024 07:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727334316;
 bh=MUzl1kd+0cieNuOeCx2VpEojZUn5z84AWD/YCMiKOA0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WkN3VDgM6tQ8pmgOyASLVvybZrmKNGJ7UgCJjSeM8BnzgGZ6bWnDqhhSneQYLzMLW
 1T76QXQbVl//AEz5X2r1SBelGUP4KCsrKQK+fepgKvGvN8X+T81OuZC75tt7ieqsVo
 nQEAdrr4XvHpMFsImJm4nwcfW2brS8mdO2IKPgk3nMqYUXCaiSGHVcA3svoZKcc3U6
 cLdHs5szhTVfb35TmOLayrsXPChdSlODZCSICvuWurZzRReJ9c/5m4tXS42gGH1IWN
 VhvsF25nCoF8y9h+KhZBWHulHcaI8+FpvpXGK6YBX7rKrTWAx6ygQA1gLKtW10ZiUC
 bSp+e9jIxGNOQ==
Date: Thu, 26 Sep 2024 09:05:14 +0200
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
Message-ID: <20240926-garrulous-serval-of-ecstasy-b44ec9@houat>
References: <cover.1726594684.git.jani.nikula@intel.com>
 <ZvKPJGQyZmdWNOmd@phenom.ffwll.local>
 <20240924-refined-nocturnal-starfish-2947b8@houat>
 <f3f8bec1-884b-46ac-82a6-6e5cb8840146@roeck-us.net>
 <20240924-handsome-labrador-of-shopping-b1dce5@houat>
 <4accd038-9624-43de-96ad-7ecd0876b607@roeck-us.net>
 <ZvP5YhON49Z5TMI7@phenom.ffwll.local>
 <20240925-fresh-artichoke-boa-1a673f@houat>
 <25673888-cb27-4e03-98c0-66020aae5631@roeck-us.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="mcsd5mfwoezpi3rf"
Content-Disposition: inline
In-Reply-To: <25673888-cb27-4e03-98c0-66020aae5631@roeck-us.net>
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


--mcsd5mfwoezpi3rf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2024 at 09:04:39AM GMT, Guenter Roeck wrote:
> On 9/25/24 06:05, Maxime Ripard wrote:
> [ ... ]
>=20
> > > We've had similar discussions in the past around unit tests that wast=
ed
> > > too much cpu time with randomized combinatorial testing, and we've th=
rown
> > > those out too from drm. Test hygiene matters.
> >=20
> > We had that discussion because those tests could run for up to around a
> > minute on certain platforms. It's not the same issue at all?
> >=20
>=20
> I added "kunit.stats_enabled=3D2 kunit.filter=3Dspeed>slow" to the kernel=
 command
> line in my tests to avoid long-running tests. That works as long as slow =
tests
> are marked accordingly using KUNIT_CASE_SLOW(), KUNIT_SPEED_SLOW, or
> KUNIT_SPEED_VERY_SLOW.

Yeah, and I've added a warning some time if a test runs for too long but
isn't flagged as slow.

Maxime

--mcsd5mfwoezpi3rf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZvUHpQAKCRAnX84Zoj2+
djeGAX94l/C7ENGPVZzzgvEwxRwsdrpyse/J/Oea4FVN/3DR4cpjfIduJMrBQkem
emmgjicBfAxKfnBFhTvC2hExQ66+WNTYyUeEtwh5ZpdaWxUkORcoiQz6cUYlJXfv
zvOFRknioA==
=0lOn
-----END PGP SIGNATURE-----

--mcsd5mfwoezpi3rf--
