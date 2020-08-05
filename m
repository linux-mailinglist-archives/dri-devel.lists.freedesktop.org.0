Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EA623D431
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 01:36:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B366A6E06E;
	Wed,  5 Aug 2020 23:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53CE86E06E;
 Wed,  5 Aug 2020 23:36:50 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BMSgv6kJrz9sPC;
 Thu,  6 Aug 2020 09:36:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1596670607;
 bh=Cmh/gB9YJihUYayn4qJ1dLbYOonTO4P9wvqqLFhuqPM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gMGB7OleVdn5cjisxmKfyvCr1i8cngUbFqDEf3wpMsZTuhGJlTH5/8b6NrR2yPDYF
 6461a3Wakqw5GpknHt9hRaLV+xUslzyu3htkmS9ohuD94+cT5tCXU2oo6J+8bL2TkV
 QM7BSPYLOGZI2ouZPaZcLzezQyMGWM3yQ7Em7r/SUyL+oKfKdc15/zI1zGLgOHNsCw
 R8YnEPhLqIgrhJaChRyN9pTabR22KYIF550x+gH0KBlGHsQrhC5eBuZUZKqiojL0nz
 Wn2/AGmBPcw8R1txRDz0B1MG9HT87eAD07VYDJuj+kV1INQIPKY6Os3zyNFiNb2Z81
 tq3iL17uoCxrg==
Date: Thu, 6 Aug 2020 09:36:41 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] drm/amdgpu: fix spelling mistake "Falied" -> "Failed"
Message-ID: <20200806093641.5795690c@canb.auug.org.au>
In-Reply-To: <d720b466a2b4b7507a963f9a2605c7f81e82e7ba.camel@perches.com>
References: <20200805113510.18277-1-colin.king@canonical.com>
 <CADnq5_NA9f2N3xkH4WAdDEP+0-5W0LkmTRy3yXqFdnWQmfsVmQ@mail.gmail.com>
 <a8ab7d75ef9df54bd193fc88e0670b30026e7e67.camel@perches.com>
 <CADnq5_P9hfv=Zt9+m47sFC0z202x+q-Otifv7a5z4afJamtQ2Q@mail.gmail.com>
 <d720b466a2b4b7507a963f9a2605c7f81e82e7ba.camel@perches.com>
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Colin King <colin.king@canonical.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Content-Type: multipart/mixed; boundary="===============1769059296=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1769059296==
Content-Type: multipart/signed; boundary="Sig_/NtAfwcFVg/Q5mr7.l90JiEZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/NtAfwcFVg/Q5mr7.l90JiEZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 05 Aug 2020 15:19:38 -0700 Joe Perches <joe@perches.com> wrote:
>
> On Wed, 2020-08-05 at 17:27 -0400, Alex Deucher wrote:
> > On Wed, Aug 5, 2020 at 4:53 PM Joe Perches <joe@perches.com> wrote: =20
> > > On Wed, 2020-08-05 at 16:01 -0400, Alex Deucher wrote: =20
> > > > On Wed, Aug 5, 2020 at 7:35 AM Colin King <colin.king@canonical.com=
> wrote: =20
> > > > > From: Colin Ian King <colin.king@canonical.com>
> > > > >=20
> > > > > There is a spelling mistake in a DRM_ERROR message. Fix it.
> > > > >=20
> > > > > Signed-off-by: Colin Ian King <colin.king@canonical.com> =20
> > > >=20
> > > > This is already fixed. =20
> > >=20
> > > This fix is not in today's -next.
> > >=20
> > > Perhaps whatever tree it's fixed in should be in -next.
> > >  =20
> >=20
> > Weird.  It's in the drm-next tree as:
> >=20
> > commit 4afaa61db9cf5250b5734c2531b226e7b3a3d691
> > Author: Colin Ian King <colin.king@canonical.com>
> > Date:   Fri Jul 10 09:37:58 2020 +0100
> >=20
> >     drm/amdgpu: fix spelling mistake "Falied" -> "Failed"
> >=20
> >     There is a spelling mistake in a DRM_ERROR error message. Fix it.
> >=20
> >     Signed-off-by: Colin Ian King <colin.king@canonical.com>
> >     Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >=20
> > Alex
> >  =20
> > > $ git show --oneline -s
> > > d15fe4ec0435 (HEAD, tag: next-20200805, origin/master, origin/HEAD) A=
dd linux-next specific files for 20200805
> > >=20
> > > $ git grep -i falied drivers
> > > drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c:                DRM_ERROR("Fa=
lied to terminate tmr\n");
> > >  =20
> > > > > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gp=
u/drm/amd/amdgpu/amdgpu_psp.c =20
> > > [] =20
> > > > > @@ -2010,7 +2010,7 @@ static int psp_suspend(void *handle)
> > > > >=20
> > > > >         ret =3D psp_tmr_terminate(psp);
> > > > >         if (ret) {
> > > > > -               DRM_ERROR("Falied to terminate tmr\n");
> > > > > +               DRM_ERROR("Failed to terminate tmr\n");
> > > > >                 return ret;
> > > > >         } =20
>=20
> Dunno.
>=20
> Maybe it's due to some ordering of trees in
> how -next accumulates patches?

The spelling error is introduced in two commits:

  c564b8601ae9 ("drm/amdgpu: add TMR destory function for psp")

in Linus' tree between v5.8-rc4 and rc5

  90937420c44f ("drm/amdgpu: add TMR destory function for psp")

in the amdgpu tree between two merges by the drm tree.  In this same
interval, the error is corrected by commit

  4afaa61db9cf ("drm/amdgpu: fix spelling mistake "Falied" -> "Failed"")

so when David comes to merge the amdgpu tree in commit

  206739119508 ("Merge tag 'amd-drm-next-5.9-2020-07-17' of git://people.fr=
eedesktop.org/~agd5f/linux into drm-next")

the spelling error has been introduced on one side of the merge and
introduced and corrected on the other.  This would have produced a
conflict which David presumably resolved in haste by picking the HEAD
side of the merge instead of the MERGE_HEAD side (it happens).

This could have been avoided by not cherry-picking fix commits around
in the amdgpu process - instead having a fixes branch that is merged
into the next branch after the fixes branch has been accepted upstream
(that way there is only one commit for each fix and less conflicts).

I have to deal with these sort of conflicts (sometimes daily) due to
the drm processes.  Its a pain as I have to track down each conflict to
see if the same patches appear on both sides of merges and then try to
figure out what other changes occur.  (This is only slightly helped by
have the "cherry-picked from" tags in the fix commits.)
--=20
Cheers,
Stephen Rothwell

--Sig_/NtAfwcFVg/Q5mr7.l90JiEZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8rQokACgkQAVBC80lX
0Gw3xggAk/E16XshgUXV574Pqu7SjSyeHU5oUQeRvdnP348Xm+8+fzR+TJ4//Fot
mHgy13Z06GupLFaKGLqJx8ftRBKlFhOZ+s5xzzUwfXs8GI6FmXINGk9x6uJm2PYo
gxtDzLSnq/GVlcbMJJ12ejIpjn3fpoP3fPFBO+rVLZkDZ+cZbABEyrrbi/jJbbKp
SBJ+vMfBR9i7jtt5StFBfTp9JEWUqqIJhtT0aJwA/ycmUse+ynHHzsGQPADads5V
fo16ICEKNN9fjPKbaBArUK6v/WRFd+2UQDhQNsNWJ9DgkGXyACGkOCarv76EoqGP
LB0oyyiSB6p2xz40nUvPJsWmw9ecPA==
=Osit
-----END PGP SIGNATURE-----

--Sig_/NtAfwcFVg/Q5mr7.l90JiEZ--

--===============1769059296==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1769059296==--
