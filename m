Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFB4854638
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 10:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22AE910E723;
	Wed, 14 Feb 2024 09:38:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YgdNLp5E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E2510E71D;
 Wed, 14 Feb 2024 09:38:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2F6B6CE1712;
 Wed, 14 Feb 2024 09:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18034C433C7;
 Wed, 14 Feb 2024 09:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707903504;
 bh=mX6h8xLpvjfFMxB5/TrWr4gEAKLkQB72f27+0IUqRiI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YgdNLp5E0hJrXDlFPdTqhbOU7/dPpSWPzTnb8X9mMy70CAxFjGPCCqd/3LmBxT9ni
 sU2/LJc7trzXOTSs9pmMTOaa7xPKdftfCxU5Ot7g8QwjexKNtM2tGcwbfuevTE+zxa
 rZ19gpWP3zObR09Cr4XTVDh5AKFPKc7TC2oBWmWn5qG+xp+Ywofz9GAjsuwc6OJio5
 AVTaMoNffc4edAOm2hTZKepWG3UuuWUu5BNQzAqLt0wP6n69r1/Xykur2osClfAb0y
 g1LLrotHxuzgbXz6IqmK6vVZC+ajuCqktSnIyXI0H0sF83OhZvBgMjLkMDIv4YrvQA
 06PPILnxwWv5w==
Date: Wed, 14 Feb 2024 10:38:21 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Luca Coelho <luciano.coelho@intel.com>
Subject: Re: Re: Re: [PATCH drm-misc-next] drm/xe: Fix a missing argument to
 drm_err_printer
Message-ID: <ks6hj65wd73sv6gwxfpndtaodxlvszlb6562slpafuea6d6gf4@ucotvvdxgz6t>
References: <20240212103833.138263-1-thomas.hellstrom@linux.intel.com>
 <87bk8m9coe.fsf@intel.com>
 <yjeqfuxc3az2j5bbvt7g5wtjmulcuxhill2n2hspjsmiokxfnb@pdd27bmfvd2m>
 <87a5o48m24.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="q5ey5jh6ipvnd7vu"
Content-Disposition: inline
In-Reply-To: <87a5o48m24.fsf@intel.com>
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


--q5ey5jh6ipvnd7vu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 04:40:19PM +0200, Jani Nikula wrote:
> On Tue, 13 Feb 2024, Maxime Ripard <mripard@kernel.org> wrote:
> > On Mon, Feb 12, 2024 at 12:53:05PM +0200, Jani Nikula wrote:
> >> On Mon, 12 Feb 2024, Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.=
com> wrote:
> >> > The indicated commit below added a device argument to the
> >> > function, but there was a call in the xe driver that was
> >> > not properly changed.
> >>=20
> >> Aww, crap. Looks like my drm-misc-next configs don't have xe enabled.
> >
> > FTR, there's defconfigs in the drm-rerere repo that are fairly well mai=
ntained.
>=20
> None of them have CONFIG_DRM_XE enabled.
>=20
> What's the procedure for updating the defconfigs? Do we have it
> documented somewhere?

I'm not sure there's a procedure, everytime I needed it I just changed
the defconfig, committed and pushed.

Maxime

--q5ey5jh6ipvnd7vu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZcyKDQAKCRDj7w1vZxhR
xYP0AQDohCaqOvlfW6+mUouwoK1wGXGXm682OweS9p+fhF4JOwD/a2ZzkeCTTC0K
ik7HY3+kF4cafGpEXp2CI1tb8/H4Iwc=
=p1f9
-----END PGP SIGNATURE-----

--q5ey5jh6ipvnd7vu--
