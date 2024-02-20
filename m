Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8AF85CB14
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 23:46:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8618510E5A6;
	Tue, 20 Feb 2024 22:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="R/ivK4YE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F7F10E5A6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 22:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1708469205;
 bh=06RrikX6gmT7zQuF+smeV1eWHuM41B0U4fwsYsNLO+I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=R/ivK4YEnqpXO8w+3fZLn4FGo/eZrqmT+TEZeb8wA0i86/unax68k6dhm8qEnY9kp
 5WC+OlHQVPKs34xyAJEY/1d9SSz4sl+/2B9HGUYCOh9xhaUvHrp/smskr30lqMJPYi
 9/eA/j0ZSFCejkZIj4LcZEbaFHGpIgG12DxeTN0W0a0E/KuHYqYBzZU2e4qR4Jdkdl
 xkXVBucCkO/cwFoFF8sGE7xb3rbFdxPUCA8P96l6NB++glSMqvrufEDRFzM1Hfuoz5
 uUOp3rjsU+2Dg4CSZAZdfAaEn0h84NmIhAcjWZ8GmLOGuLO6oHRtN0IwjQUacwC/dr
 /PsyQrJZIaWyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4TfZK047sNz4wcC;
 Wed, 21 Feb 2024 09:46:44 +1100 (AEDT)
Date: Wed, 21 Feb 2024 09:46:43 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
Message-ID: <20240221094643.4496313a@canb.auug.org.au>
In-Reply-To: <CAPj87rMYC3D-PYtMcTXD3=HqNSpyyVj9jp0nodO+2PebP1guAA@mail.gmail.com>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <akb3fluuli75vh5due5ll7t5igg7oo5vqwkal645hkjkhyqz6w@qu62f5l6joy6>
 <CAPj87rMYC3D-PYtMcTXD3=HqNSpyyVj9jp0nodO+2PebP1guAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Dex/aWMqSN63oRcpnf9tkSu";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/Dex/aWMqSN63oRcpnf9tkSu
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Tue, 20 Feb 2024 11:25:05 +0000 Daniel Stone <daniel@fooishbar.org> wrot=
e:
>
> On Tue, 20 Feb 2024 at 09:05, Maxime Ripard <mripard@kernel.org> wrote:
> > On Tue, Feb 20, 2024 at 09:49:25AM +0100, Maxime Ripard wrote: =20
> > > This will be mostly transparent to current committers and users: we'll
> > > still use dim, in the exact same way, the only change will be the URL=
 of
> > > the repo. This will also be transparent to linux-next, since the
> > > linux-next branch lives in its own repo and is pushed by dim when
> > > pushing a branch. =20
> >
> > Actually, I double-checked and linux-next pulls our branches directly,
> > so once the transition is over we'll have to notify them too. =20
>=20
> cc sfr - once we move the DRM repos to a different location, what's
> the best way to update linux-next?
>=20
> That being said, we could set up read-only pull mirrors in the old
> location ... something I want to do in March (because what else are
> you going to do on holiday?) is to kill the write repos on kemper
> (git.fd.o), move them to being on molly (cgit/anongit.fd.o) only, and
> just have a cronjob that regularly pulls from all the gl.fd.o repos,
> rather than pushing from GitLab.

These are (I think) all the drm trees/branches that I fetch every day:

git://anongit.freedesktop.org/drm-intel#for-linux-next
git://anongit.freedesktop.org/drm-intel#for-linux-next-fixes
git://anongit.freedesktop.org/drm/drm-misc#for-linux-next
git://anongit.freedesktop.org/drm/drm-misc#for-linux-next-fixes
git://git.freedesktop.org/git/drm/drm.git#drm-fixes
git://git.freedesktop.org/git/drm/drm.git#drm-next
git://git.freedesktop.org/git/drm/drm.git#topic/drm-ci
git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git#for-li=
nux-next
https://gitlab.freedesktop.org/agd5f/linux#drm-next
https://gitlab.freedesktop.org/drm/msm.git#msm-next
https://gitlab.freedesktop.org/drm/tegra.git#for-next
https://gitlab.freedesktop.org/lumag/msm.git#msm-next-lumag

If someone could just send me all the new equivalent URLs when the
change happens, I will fix them up in my config.

--=20
Cheers,
Stephen Rothwell

--Sig_/Dex/aWMqSN63oRcpnf9tkSu
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmXVK9MACgkQAVBC80lX
0GweYAf/WWrzWdPzGS+tbUwzTHo5/TWf0sEntuHY3zvrXdb1sXFVtEVQBXtkMTE/
7m2z3btsudwsFh60YwPw5lXCbt36uGcAYcii+RqfQ8kDD1YA+eQ7JYiIEVZ8RA3b
TqoWmZFgVP+qSQTCWpfug2d5whR002i0VqR0wZ7Hozy2STKmkBSXuee1CokTDKHt
8ftLqSVcERjVnqYoVwCgocSPi3gGJq5ypi5UNLwIaQdNM9myTlt2e0k+UwqJH7Ha
49elaLDY8qlpOcYghKHfxqeAuuovYt1uzg+ln6/2ceKg/irhVQnjMkvKMwH6RpO1
Y7xmp/5P2wf9MaZtUydC1ax1kwSIsg==
=QpDZ
-----END PGP SIGNATURE-----

--Sig_/Dex/aWMqSN63oRcpnf9tkSu--
