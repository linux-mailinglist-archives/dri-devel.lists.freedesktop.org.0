Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3291DB49FE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 11:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20EA26EB73;
	Tue, 17 Sep 2019 09:03:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A2E6E22B;
 Tue, 17 Sep 2019 09:02:59 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p10so779727edq.1;
 Tue, 17 Sep 2019 02:02:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DU4yQ2hShwpmq/8aDVPi27Lddm5uNrq35I8PfAHE5qg=;
 b=ULDlWjSuz2WTMChhDV+IvfyiQTH0xr28OQfHQ7M0pA0B7c2mRNj89+kMIPtWCnebiW
 7h0km2/Q9dl79ugKZ3KElx4CKNt9ANsN64tvQ3RlkIFy2NAhrobEhgmJbjKTxqSeJLgG
 QheQPty9hh8XKXrAhFP9nv8IFzIBEia2aEz1dgnLRuupjF1jfuPV7URi8hZU9FfAj7g+
 L8idimT3cK9ZDuW3pXEkvY/Y943aauJr0ITTj7cKHcmeabm1LR7U4/8aFWo96Gc/kENo
 bS/89wvwKiFfsxpXSvBKKBDxz5wuXclA4fULDYyC1JoKSFzP+XnS9V2n41/QBH838kbS
 bOvg==
X-Gm-Message-State: APjAAAWkIQUn8g7FbO8ZcjqVmg1HwFlypLFB/SnuhijiBiXbtgtuQ/tK
 vstL9p1d25nhFoaSFCH9m3M=
X-Google-Smtp-Source: APXvYqxoRQ9n2XISv+o4h5FilHhCzmGue0pwrmAffm+0d+0wFzAZdJRvbnv86CY+9GRqZwe6zzEIow==
X-Received: by 2002:a17:906:fc20:: with SMTP id
 ov32mr3823086ejb.22.1568710977664; 
 Tue, 17 Sep 2019 02:02:57 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id v8sm319381edl.74.2019.09.17.02.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2019 02:02:55 -0700 (PDT)
Date: Tue, 17 Sep 2019 11:02:54 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH 3/6] drm/nouveau: Remove bogus gk20a aperture
 callback
Message-ID: <20190917090254.GC17854@ulmo>
References: <20190916151757.10953-1-thierry.reding@gmail.com>
 <20190916151757.10953-4-thierry.reding@gmail.com>
 <CACAvsv6AzWvpPLaOKahpJErTAMCJet4_4mBvRC8Z+e4+bwaD4w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACAvsv6AzWvpPLaOKahpJErTAMCJet4_4mBvRC8Z+e4+bwaD4w@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DU4yQ2hShwpmq/8aDVPi27Lddm5uNrq35I8PfAHE5qg=;
 b=uxvgU27Wy6n6UvVRJOWdEpa1KfS8hQuvtT5wXmtEK8sTt92UDGivkXfrjrHkoEWvS0
 ShCEqYsyH800Dqpx1gqUF/4GXgMEuL7dxU3YGqFH+b2S6fHZ4oxs0SM6efUbpyKxRVuh
 /4nE/oUni+akwyJS1A67zfNEisv8Uiw7kmk6+ewdUx8rNMGZ6KEu+I05hGDLX8VyTNi+
 q6dkhkZSm0gRJ4QDSx46BsaDdwmgPwMPVgI0UO6dhFDi8lqCwFLmG5wx3VkLe4WuDJdG
 bCPJLUOP3KQzUzqOqRNyOFJABVwN+3wbzlWHnh/FQURkanuQPGfwNMAQvlzRyXEwp+ZQ
 hBGw==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============1981130294=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1981130294==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NU0Ex4SbNnrxsi6C"
Content-Disposition: inline


--NU0Ex4SbNnrxsi6C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2019 at 01:43:13PM +1000, Ben Skeggs wrote:
> On Tue, 17 Sep 2019 at 01:18, Thierry Reding <thierry.reding@gmail.com> w=
rote:
> >
> > From: Thierry Reding <treding@nvidia.com>
> >
> > The gk20a (as well as all subsequent Tegra instantiations of the GPU) do
> > in fact use the same apertures as regular GPUs. Prior to gv11b there are
> > no checks in hardware for the aperture, so we get away with setting VRAM
> > as the aperture for buffers that are actually in system memory.
> Can GK20A take comptags with aperture set to system memory?  For some
> reason I can recall, I was under the impression PTEs needed to be
> pointed at "vidmem" (despite them actually accessing system memory
> anyway) on Tegra parts for compression to work?  I could be mistaken
> though.

I don't think GK20A supports comptags at all. I think this wasn't
introduced until GM20B. nvgpu has some "gk20a" code to flush comptags,
but that's only used on GM20B and later.

Anyway, my understanding is that on all of GK20A, GM20B and GP10B the
aperture field is completely ignored. I think that also goes for
comptags. nvgpu in particular never requests comptags to be allocated
=66rom vidmem. See:

	https://nv-tegra.nvidia.com/gitweb/?p=3Dlinux-nvgpu.git;a=3Dblob;f=3Ddrive=
rs/gpu/nvgpu/os/linux/ltc.c;h=3Dbaeb20b2e539cc6cb70667ce168603546678dc73;hb=
=3D2081ce686bfd4deb461b4130df424d592000ff88#l30

There are two callers of that, both passing "false" for the vidmem_alloc
parameter, so comptags always do end up in system memory for Tegra.

That said, I'll go confirm that with one of our experts and get back to
you.

Thierry

>=20
> Ben.
>=20
> >
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h      |  1 -
> >  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c | 10 ----------
> >  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c |  4 ++--
> >  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c |  2 +-
> >  4 files changed, 3 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gp=
u/drm/nouveau/nvkm/subdev/mmu/vmm.h
> > index fb3a9e8bb9cd..9862f44ac8b5 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> > @@ -212,7 +212,6 @@ void gf100_vmm_flush(struct nvkm_vmm *, int);
> >  void gf100_vmm_invalidate(struct nvkm_vmm *, u32 type);
> >  void gf100_vmm_invalidate_pdb(struct nvkm_vmm *, u64 addr);
> >
> > -int gk20a_vmm_aper(enum nvkm_memory_target);
> >  int gk20a_vmm_valid(struct nvkm_vmm *, void *, u32, struct nvkm_vmm_ma=
p *);
> >
> >  int gm200_vmm_new_(const struct nvkm_vmm_func *, const struct nvkm_vmm=
_func *,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c b/drive=
rs/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c
> > index 16d7bf727292..999b953505b3 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c
> > @@ -25,16 +25,6 @@
> >
> >  #include <core/memory.h>
> >
> > -int
> > -gk20a_vmm_aper(enum nvkm_memory_target target)
> > -{
> > -       switch (target) {
> > -       case NVKM_MEM_TARGET_NCOH: return 0;
> > -       default:
> > -               return -EINVAL;
> > -       }
> > -}
> > -
> >  int
> >  gk20a_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
> >                 struct nvkm_vmm_map *map)
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c b/drive=
rs/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c
> > index 7a6066d886cd..f5d7819c4a40 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c
> > @@ -25,7 +25,7 @@ static const struct nvkm_vmm_func
> >  gm20b_vmm_17 =3D {
> >         .join =3D gm200_vmm_join,
> >         .part =3D gf100_vmm_part,
> > -       .aper =3D gk20a_vmm_aper,
> > +       .aper =3D gf100_vmm_aper,
> >         .valid =3D gk20a_vmm_valid,
> >         .flush =3D gf100_vmm_flush,
> >         .invalidate_pdb =3D gf100_vmm_invalidate_pdb,
> > @@ -41,7 +41,7 @@ static const struct nvkm_vmm_func
> >  gm20b_vmm_16 =3D {
> >         .join =3D gm200_vmm_join,
> >         .part =3D gf100_vmm_part,
> > -       .aper =3D gk20a_vmm_aper,
> > +       .aper =3D gf100_vmm_aper,
> >         .valid =3D gk20a_vmm_valid,
> >         .flush =3D gf100_vmm_flush,
> >         .invalidate_pdb =3D gf100_vmm_invalidate_pdb,
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c b/drive=
rs/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
> > index 180c8f006e32..ffe84ea2f7d9 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
> > @@ -43,7 +43,7 @@ static const struct nvkm_vmm_func
> >  gp10b_vmm =3D {
> >         .join =3D gp100_vmm_join,
> >         .part =3D gf100_vmm_part,
> > -       .aper =3D gk20a_vmm_aper,
> > +       .aper =3D gf100_vmm_aper,
> >         .valid =3D gp10b_vmm_valid,
> >         .flush =3D gp100_vmm_flush,
> >         .mthd =3D gp100_vmm_mthd,
> > --
> > 2.23.0
> >
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau

--NU0Ex4SbNnrxsi6C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2AoTsACgkQ3SOs138+
s6HzKQ/9EB5wLiorfO4HVVbB2tmuk2ROy4mZrh768Rlv4NB08ZJOhIBSray6eMvl
JFvyKXvfQiT2B4eFGlRqswnYiVZFm6QNFXpm/u/UtaKgygGLyIZ9OSxX/RFQK69p
lxcaP5b4pEi9T0KKboYRfiRfoZ/qtTg3NMy+pBSdQ4TVES47fZJTql+bDMIWb4A4
Cmf5fhmRkxN7YuPY0yTljS5e2yBTh2wGvRJxJNxhyp+fnUK737DbKeZ/sPC89bNY
pxdTGpGHyMp9/WCe2PFl3eVJKBJ9cZJT8AMLyQhC4qFD7qc2GxCpmJhxNQr2dmwA
WpI5rvlblZzDZrz9lxdkhrsmYb4Ck2Z9gbDHmefI6B0Kz6nysALPt6XviIh5VUqe
ilAXAFx6Euk28ecbepoIUQPtSYJXn2Wnz0o9gxB8QEMj/SfIhcPoAUjRvmkcfBYH
7LzSY2aNHLZYg2bl34KtbQBh4dWBSaTLam4M3An7MQJTJ9aQxZqZVk8l573i9TMa
N/NpMNwSCdJnHOR6DOkQ7pOLn96c6qKJSD3ejTgwEpOWqMrpXSUairNcZU3busKJ
m6N0t0ZmALrVXYsgB6MNtLdMqiTKqcbWDumMlvL4Mbw5Ag1KY5TKG5UEuNzbRuSc
C3d8kFhhqgpHRycoLcLvMMx560ByXhZKmirouDU7Ktexr4wOimg=
=Nq5T
-----END PGP SIGNATURE-----

--NU0Ex4SbNnrxsi6C--

--===============1981130294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1981130294==--
