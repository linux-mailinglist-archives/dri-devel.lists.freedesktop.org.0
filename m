Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC85B949E
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 17:55:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B2A6FD45;
	Fri, 20 Sep 2019 15:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 531426FD43;
 Fri, 20 Sep 2019 15:55:23 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id l11so7278228wrx.5;
 Fri, 20 Sep 2019 08:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FfvozSQGhYvWbRljWfh98CY49QZjuPl+DnWvMj4b058=;
 b=tYlbH6HFjj6gRmwd+tR8wQnGoLWV0FD3OG9lydHWn5lLCLSpgUEQMaVYu9hxO3SXZ1
 Gmak7F0kZZ8A4m1ij8vDY2G5xwMwZmgeLjNL+gFANp4nqSEmKW0nhD3kEk/TRFyJ9sW8
 MY/gM2GwZb0zJf4m098+WM8W+EdvYwMU9tjpVktrPVWSXWMeo4EmAUaxYXLAQ8ekWct3
 qiM0kffHqCsOAC4pGM3b1xzOloYpVagA8baiSUf5sdYtLTEBI1zhV7bcm+vighSn4R1/
 WPCIlaxxN+PNRPZMwuISeftfXQKLbDU52DJOYjBPpNf1ZZkuFLeUUnGmXigbSLh/Fslq
 vkmQ==
X-Gm-Message-State: APjAAAXAZ+Bb3C5eAFeVqaIkmFw08oJAp+RAsSvsFJx7vVUdvIFgl1fF
 z/ESbZTJ6sgT2iZ9B2nMMyEJsPkJ
X-Google-Smtp-Source: APXvYqxKfgRgZ937x8NjMtpvBjmA12WZu1TOpF+G8zom9ougsjVggJSrd+A0MUWgDfR16KThl5+Mzg==
X-Received: by 2002:adf:f502:: with SMTP id q2mr11767476wro.186.1568994921796; 
 Fri, 20 Sep 2019 08:55:21 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id y14sm3607201wrd.84.2019.09.20.08.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2019 08:55:20 -0700 (PDT)
Date: Fri, 20 Sep 2019 17:55:19 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
Subject: Re: [Nouveau] [PATCH 3/6] drm/nouveau: Remove bogus gk20a aperture
 callback
Message-ID: <20190920155519.GD10973@ulmo>
References: <20190916151757.10953-1-thierry.reding@gmail.com>
 <20190916151757.10953-4-thierry.reding@gmail.com>
 <CACAvsv6AzWvpPLaOKahpJErTAMCJet4_4mBvRC8Z+e4+bwaD4w@mail.gmail.com>
 <20190917090254.GC17854@ulmo>
MIME-Version: 1.0
In-Reply-To: <20190917090254.GC17854@ulmo>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FfvozSQGhYvWbRljWfh98CY49QZjuPl+DnWvMj4b058=;
 b=KqWmXo6jeOnfncFPPEd/RpU9aowxLZ/scviCsHtah8n9oekZr1liO12kBsxgTVTti2
 4vx7AEBMw28YQmmQw2eoJGI3BnszyjgcqEjmNOUBVXEn0720iqQWPWhg+UsehmOfSH8x
 qypRsWplDQSqli1RoMgMDmC91RCleQkf+Gko81JwVbIQxEOncqKKgBmftlY3ABIEjhfy
 hqRI3RcGdkXvNoeei+ksm/onBYJ7tkk5JQHGm0Y4ERgXT8McgPcPR4Kbg3nip98fpTtP
 BM/4sClFG7ejCx4IhsEX0jo9uv5SWrBIsxLpw0zccZvYDTRoxy3e6g/MQyi9HUDvOQjy
 bdhw==
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
Content-Type: multipart/mixed; boundary="===============1703601409=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1703601409==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JwB53PgKC5A7+0Ej"
Content-Disposition: inline


--JwB53PgKC5A7+0Ej
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 17, 2019 at 11:02:54AM +0200, Thierry Reding wrote:
> On Tue, Sep 17, 2019 at 01:43:13PM +1000, Ben Skeggs wrote:
> > On Tue, 17 Sep 2019 at 01:18, Thierry Reding <thierry.reding@gmail.com>=
 wrote:
> > >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > The gk20a (as well as all subsequent Tegra instantiations of the GPU)=
 do
> > > in fact use the same apertures as regular GPUs. Prior to gv11b there =
are
> > > no checks in hardware for the aperture, so we get away with setting V=
RAM
> > > as the aperture for buffers that are actually in system memory.
> > Can GK20A take comptags with aperture set to system memory?  For some
> > reason I can recall, I was under the impression PTEs needed to be
> > pointed at "vidmem" (despite them actually accessing system memory
> > anyway) on Tegra parts for compression to work?  I could be mistaken
> > though.
>=20
> I don't think GK20A supports comptags at all. I think this wasn't
> introduced until GM20B. nvgpu has some "gk20a" code to flush comptags,
> but that's only used on GM20B and later.
>=20
> Anyway, my understanding is that on all of GK20A, GM20B and GP10B the
> aperture field is completely ignored. I think that also goes for
> comptags. nvgpu in particular never requests comptags to be allocated
> from vidmem. See:
>=20
> 	https://nv-tegra.nvidia.com/gitweb/?p=3Dlinux-nvgpu.git;a=3Dblob;f=3Ddri=
vers/gpu/nvgpu/os/linux/ltc.c;h=3Dbaeb20b2e539cc6cb70667ce168603546678dc73;=
hb=3D2081ce686bfd4deb461b4130df424d592000ff88#l30
>=20
> There are two callers of that, both passing "false" for the vidmem_alloc
> parameter, so comptags always do end up in system memory for Tegra.
>=20
> That said, I'll go confirm that with one of our experts and get back to
> you.

So it looks like you're right and indeed GK20A and later (up to, but not
including, GV11B that is) comptags do indeed need to be mapped as vidmem
even if they reside in sysmem.

Conceptually I think what we want to do is decide about the aperture at
allocation time. So if we allocate comptags we would need to force the
aperture to be VRAM on the iGPUs where necessary, even if they are
really allocated in system memory. Ultimately the end result is the same
of course, but I think this way around is a better representation of
this particular hardware quirk and allows us to keep the unification
that this patch series achieves.

But I'll have to look into this and see what I can come up with.

Thierry

>=20
> Thierry
>=20
> >=20
> > Ben.
> >=20
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > ---
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h      |  1 -
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c | 10 ----------
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c |  4 ++--
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c |  2 +-
> > >  4 files changed, 3 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/=
gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> > > index fb3a9e8bb9cd..9862f44ac8b5 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> > > @@ -212,7 +212,6 @@ void gf100_vmm_flush(struct nvkm_vmm *, int);
> > >  void gf100_vmm_invalidate(struct nvkm_vmm *, u32 type);
> > >  void gf100_vmm_invalidate_pdb(struct nvkm_vmm *, u64 addr);
> > >
> > > -int gk20a_vmm_aper(enum nvkm_memory_target);
> > >  int gk20a_vmm_valid(struct nvkm_vmm *, void *, u32, struct nvkm_vmm_=
map *);
> > >
> > >  int gm200_vmm_new_(const struct nvkm_vmm_func *, const struct nvkm_v=
mm_func *,
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c b/dri=
vers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c
> > > index 16d7bf727292..999b953505b3 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgk20a.c
> > > @@ -25,16 +25,6 @@
> > >
> > >  #include <core/memory.h>
> > >
> > > -int
> > > -gk20a_vmm_aper(enum nvkm_memory_target target)
> > > -{
> > > -       switch (target) {
> > > -       case NVKM_MEM_TARGET_NCOH: return 0;
> > > -       default:
> > > -               return -EINVAL;
> > > -       }
> > > -}
> > > -
> > >  int
> > >  gk20a_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
> > >                 struct nvkm_vmm_map *map)
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c b/dri=
vers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c
> > > index 7a6066d886cd..f5d7819c4a40 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgm20b.c
> > > @@ -25,7 +25,7 @@ static const struct nvkm_vmm_func
> > >  gm20b_vmm_17 =3D {
> > >         .join =3D gm200_vmm_join,
> > >         .part =3D gf100_vmm_part,
> > > -       .aper =3D gk20a_vmm_aper,
> > > +       .aper =3D gf100_vmm_aper,
> > >         .valid =3D gk20a_vmm_valid,
> > >         .flush =3D gf100_vmm_flush,
> > >         .invalidate_pdb =3D gf100_vmm_invalidate_pdb,
> > > @@ -41,7 +41,7 @@ static const struct nvkm_vmm_func
> > >  gm20b_vmm_16 =3D {
> > >         .join =3D gm200_vmm_join,
> > >         .part =3D gf100_vmm_part,
> > > -       .aper =3D gk20a_vmm_aper,
> > > +       .aper =3D gf100_vmm_aper,
> > >         .valid =3D gk20a_vmm_valid,
> > >         .flush =3D gf100_vmm_flush,
> > >         .invalidate_pdb =3D gf100_vmm_invalidate_pdb,
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c b/dri=
vers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
> > > index 180c8f006e32..ffe84ea2f7d9 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
> > > @@ -43,7 +43,7 @@ static const struct nvkm_vmm_func
> > >  gp10b_vmm =3D {
> > >         .join =3D gp100_vmm_join,
> > >         .part =3D gf100_vmm_part,
> > > -       .aper =3D gk20a_vmm_aper,
> > > +       .aper =3D gf100_vmm_aper,
> > >         .valid =3D gp10b_vmm_valid,
> > >         .flush =3D gp100_vmm_flush,
> > >         .mthd =3D gp100_vmm_mthd,
> > > --
> > > 2.23.0
> > >
> > > _______________________________________________
> > > Nouveau mailing list
> > > Nouveau@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/nouveau



--JwB53PgKC5A7+0Ej
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl2E9mQACgkQ3SOs138+
s6HlYQ//RELopkoqCJGkP6tFmWZ7oW1oNOp6W0B026rMEkz6GYHDAEcWieqEPI7R
U0Zmk/BaT5RwC8zvifj/eBEP/5wRxhL9E8jxa1lNJcPWwBkPr9YOYtlYaIo3tnk3
FzSL74HOalUSNGrwRkmANxWDxRGvZJ+QXH/V2y0PgRDrrZCS2Y7hVC4WQP+F1Pg1
eFFPiDliC3DHevfd1s9W36g1pgl4VPk5NyCl8jz6Pk3pga16s3ZVWt9ACe+9iR5K
+6gx4NzOnsBXHi5GUx73mlequUZeDqs6F0DKoBRReDBMIZEnFqn0RMEp0I45Q43M
onQfLnIO3lZIdelefjx678/LfPcO+cggyeUKHrPPB6Z8I/OhYnSsKnu/f9I8/yFo
0PxYfx1PDlI+EBuKGV5wpG5ZWRJS4e/m5594brk6E+CEAtKUAyuMDykXWRdVNZzl
A7P2WnOYdBZj6rLUR/xDwcDtdGj524iwAMm98YdLjQU4ACvupYSuz2KdBg7C3Hgu
yQpcCSlfp2wq/lur8W4iKCToiFUqhnXmMvk4zgAnWhM7EcU4QugntXHZFdXWN2PC
KspY5v5QLS2EZiBb4prSefCFjovaCNs0npuuH/M+D6SCvFvJhYKu6W0wFjsfZYcO
3iXpSlOdEHnOlZ+VrhL/WLJLpvuXCB7ek4Ip54WtndzzE7IHs1M=
=QhNz
-----END PGP SIGNATURE-----

--JwB53PgKC5A7+0Ej--

--===============1703601409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1703601409==--
