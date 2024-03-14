Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1132F87B968
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 09:39:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58BFD10F0C0;
	Thu, 14 Mar 2024 08:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QS/fWrLW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A81810F041
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 08:39:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BB49061473;
 Thu, 14 Mar 2024 08:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1379FC433C7;
 Thu, 14 Mar 2024 08:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710405567;
 bh=/ELEpd3loWqEYnrBAx+1MhUOk7DrtryVYadoSYORomI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QS/fWrLWOsrlHWSTdVe6z4Y/0pcGZoOBORhriukAoDwddgPyEAN0to35DfMH3sIAX
 qLAN+rop0SkcKpcWdO+w3TTtivJJM8LFyCvL3CtJ5lsy6Tt0OQDlpfO/9ll4gb2FPZ
 fcOv7opr0UUsqDLfl7ZpV9tTavwDH4bTDf/SVEDT8WcqWwkXGA74hyLYG2+uXq5cJP
 +6QwVIPjlynxSIzCmT3oR5Z06JAtxOj2IWr4+KrPeYc+9HY4gbbgBEpTAqU01HRKNs
 asW5b+NTOS+RFqBloU7B6iXGncCIcux1jsgY5/1AyK36tqc1ACcUKTeD+A4DW8XZcJ
 ooDmLv6j5tt/g==
Date: Thu, 14 Mar 2024 09:39:24 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Stone <daniel@fooishbar.org>, dri-devel@lists.freedesktop.org, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Stone <daniels@collabora.com>
Subject: Re: drm-misc migration to Gitlab server
Message-ID: <20240314-heavy-polite-mantis-bfbb84@houat>
References: <gnthy5o42kiyj63d2bkkxsc5krzf3wrwt23chh2kthkmlyjwbg@ybynvjvqdka7>
 <akb3fluuli75vh5due5ll7t5igg7oo5vqwkal645hkjkhyqz6w@qu62f5l6joy6>
 <CAPj87rMYC3D-PYtMcTXD3=HqNSpyyVj9jp0nodO+2PebP1guAA@mail.gmail.com>
 <20240221094643.4496313a@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="s646bghbpxjx43h4"
Content-Disposition: inline
In-Reply-To: <20240221094643.4496313a@canb.auug.org.au>
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


--s646bghbpxjx43h4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, Feb 21, 2024 at 09:46:43AM +1100, Stephen Rothwell wrote:
> Hi Daniel,
>=20
> On Tue, 20 Feb 2024 11:25:05 +0000 Daniel Stone <daniel@fooishbar.org> wr=
ote:
> >
> > On Tue, 20 Feb 2024 at 09:05, Maxime Ripard <mripard@kernel.org> wrote:
> > > On Tue, Feb 20, 2024 at 09:49:25AM +0100, Maxime Ripard wrote: =20
> > > > This will be mostly transparent to current committers and users: we=
'll
> > > > still use dim, in the exact same way, the only change will be the U=
RL of
> > > > the repo. This will also be transparent to linux-next, since the
> > > > linux-next branch lives in its own repo and is pushed by dim when
> > > > pushing a branch. =20
> > >
> > > Actually, I double-checked and linux-next pulls our branches directly,
> > > so once the transition is over we'll have to notify them too. =20
> >=20
> > cc sfr - once we move the DRM repos to a different location, what's
> > the best way to update linux-next?
> >=20
> > That being said, we could set up read-only pull mirrors in the old
> > location ... something I want to do in March (because what else are
> > you going to do on holiday?) is to kill the write repos on kemper
> > (git.fd.o), move them to being on molly (cgit/anongit.fd.o) only, and
> > just have a cronjob that regularly pulls from all the gl.fd.o repos,
> > rather than pushing from GitLab.
>=20
> These are (I think) all the drm trees/branches that I fetch every day:
>=20
> git://anongit.freedesktop.org/drm-intel#for-linux-next
> git://anongit.freedesktop.org/drm-intel#for-linux-next-fixes
> git://anongit.freedesktop.org/drm/drm-misc#for-linux-next
> git://anongit.freedesktop.org/drm/drm-misc#for-linux-next-fixes

We've migrated the drm-misc repo to:
https://gitlab.freedesktop.org/drm/misc/kernel.git

The branch names are the same

Maxime

--s646bghbpxjx43h4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZfK3qwAKCRDj7w1vZxhR
xfjfAP0eK0TSEC5qedOVeQWCi9hvS9DqRGyb77VWzGrpooMJ4AEAojV8wWpwoM0d
cQrcPzTYWGRG5Ati244OMkD5E3c2iQI=
=hR+S
-----END PGP SIGNATURE-----

--s646bghbpxjx43h4--
