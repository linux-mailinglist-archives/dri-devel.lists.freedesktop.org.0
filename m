Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1629C758ECC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 09:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D14810E402;
	Wed, 19 Jul 2023 07:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 750C010E402;
 Wed, 19 Jul 2023 07:22:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 39D8F60C89;
 Wed, 19 Jul 2023 07:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28DE7C433C9;
 Wed, 19 Jul 2023 07:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689751322;
 bh=w77kDI3KUSil0GDCUxFAARn0lesngMfxloVttX5+WT8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aD/MKXTKvy8ENbPVfkjAxLugsTo4g3FOSyS5q0hladRS/n40Mpvgo3MTV3ZkKqRY3
 OMibDZnuhqn3C8TM+tT8WKH5HWidc5xiZE5sYm4k+HJXxnuDWv+D007vDbrzFyasY4
 Vlh2YRV6mBYHZo+6xp8Cr8ojWyg3f1uR0eDmLCV1bmSB8WoouRY7a0Kt+xjGi0FUIu
 +RWMSQtaskG2HrzxasFCZyKwVKKhnylhv8ZjsiRN9eIVAIQSHuHbrN/sZRCmI5/ygL
 I56YYrRdxzwW3CLLI5JbjJxHLP/+m1rJ/rf5ZDEO6J/t+ZJrux11JptrS9LrlmK2rr
 BQNexVmW91NIg==
Date: Wed, 19 Jul 2023 09:21:59 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Carlos <gcarlos@disroot.org>
Subject: Re: [PATCH] drm: Replace drm_framebuffer plane size functions with
 its equivalents
Message-ID: <nwncz3imqsq7r5gixtg3mnhtz3y67yncvkduzaqw24abc6exvo@ee7xfisqfkpt>
References: <20230627182239.15676-1-gcarlos@disroot.org>
 <58d90ae1-02f7-2866-dbb1-e7763a2399c5@igalia.com>
 <0ada1376-645f-58f1-c851-e51fd24295ad@disroot.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="dnqh6e756e5kxgy2"
Content-Disposition: inline
In-Reply-To: <0ada1376-645f-58f1-c851-e51fd24295ad@disroot.org>
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
Cc: matthew.d.roper@intel.com, tvrtko.ursulin@linux.intel.com,
 stanislav.lisovskiy@intel.com,
 =?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
 juhapekka.heikkila@gmail.com, tales.aparecida@gmail.com,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, tzimmermann@suse.de, rodrigo.vivi@intel.com,
 niranjana.vishwanathapura@intel.com, arthurgrillo@riseup.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--dnqh6e756e5kxgy2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 17, 2023 at 04:04:43PM -0300, Carlos wrote:
> On 7/12/23 20:30, Andr=E9 Almeida wrote:
> > Hi Carlos,
> >=20
> > Em 27/06/2023 15:22, Carlos Eduardo Gallo Filho escreveu:
> > [...]
> > >=20
> > > So, replace each drm_framebuffer_plane_{width,height} and
> > > fb_plane_{width,height} call to drm_format_info_plane_{width,height}
> > > and remove them.
> > >=20
> >=20
> > I see that with this replace, there's a small code change from
> >=20
> > =A0=A0=A0=A0return DIV_ROUND_UP(width, format->hsub);
> >=20
> > to
> > =A0=A0=A0=A0return width / info->hsub;
> >=20
> > is there any case that the replaced function will give different result=
s?
>=20
> Well, short answer: Yes, and I'm already thinking on how do address it.
>=20
> Taking a look at some drivers, I could notice that almost every driver do
> some similar calculating to obtain the size of a plane given the size of
> the first (I guess that they would be using these functions though). So, I
> stated that nearly all drivers implements this as a regular division, with
> exception of exynos, sun4i and i915 (counting with the replaced function),
> which all has at some point a DIV_ROUND_UP involving hsub or vsub.
>=20
> Curiously, even the i915 having a DIV_ROUND_UP in some places, it also
> has regular division involving hsub/vsub in others, which leads me to
> guess if the chosen rounding method really matters. I also discovered
> the existence of the intel_plane_check_src_coordinates() function,
> that do some checks, which one of them consist of ensuring that for a
> plane, both source coordinates and sizes are multiples of the vsub and
> hsub, implying that no division rounding should occurs at all when it's
> used. However, I couldn't state if this function is always called for
> every source on every plane, so I can't assume anything from this.
>=20
> Furthermore, I found the 33f673aa55e96 ("drm: Remove fb hsub/vsub
> alignment requirement") commit, that explains the motivation for having
> DIV_ROUND_UP on drm_framebuffer_plane_{width,height} functions. It says
> that the DIV_ROUND_UP is needed on places where the
> source isn't necessarily aligned with respect to the subsampling factors,
> that should be the sane default for a core function.

Honestly, I don't think there's a problem, but rather something that was
done in each and every driver differently and without a second thought.

I think we should indeed converge to a single helper, and if that helper
is broken fix it. It will be broken for everyone anyway.

So I can definitely see a patch that adds DIV_ROUND_UP() to
drm_plane_info_plane_width and height, and then the first patch of
yours.

> Saying that, I thought some ways to address this problem:
>=20
> 1. Replace the regular division on drm_format_info_plane_{width,height}
> =A0=A0 functions to DIV_ROUND_UP so that we assert that this function is
> =A0=A0 always correct (as it seems that the places where regular division
> =A0=A0 is used assumes alignment, implying no division rounding at all).

+1

> 2. Create DIV_ROUND_UP variants of drm_format_info_plane_{width,height}
> =A0=A0 functions and use each of them in the right place. Maybe
> =A0=A0 let the default be the one with DIV_ROUND_UP and the
> =A0=A0 variant with regular division, naming it as something like
> =A0=A0 "drm_format_info_aligned_plane_{width,height}".

No, that won't work. Provided with a choice, a driver is most likely to
cargo-cult it anyway. And it's not like we know what we should do here.

Maxime

--dnqh6e756e5kxgy2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZLePFwAKCRDj7w1vZxhR
xeuFAQCCd70m91EYeH/FyKzPU4RbcGq5Jp7+gpvnN9CkXZOA4wD/WkVQuVQGYSJz
sW81ZjuqGyfUFebLCk1p9xsuuaoscAM=
=nx37
-----END PGP SIGNATURE-----

--dnqh6e756e5kxgy2--
