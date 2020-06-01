Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E111EB191
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 00:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E12EA6E0F5;
	Mon,  1 Jun 2020 22:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE78A6E0EC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 22:15:45 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49bTyM3YFGz9shr;
 Tue,  2 Jun 2020 08:15:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1591049743;
 bh=wIXVW5GZbeL9C+ghUp60QwwLPIawfvU9sajYJzPuoEI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=FHAXtKsHbv+z/97HmYSnPUjWp1VDla6O90l6eHKNqCQuCaK4D/OKozXpp3KQWvH+T
 LJaiuLjUNiLioGgClnHuOBq7hyySCMfio+ngvqCBkLd/c7tJN0xCy6dXEfYsVL9rsv
 Dx6vXj2H39+7jYjFT0Vf2L9QicYciB2IVQae8wNkImSCjna1iySRAhySiIUmFDkb6W
 JCe4dYFK/vQlQM4RdumoIou0azX6d+urmGSi4geeQ5MuyAWomsYk4qpYWHY+z8mm0O
 RBSgsCHfU5XhwB7U82DDHpnvPSiMxd6BSzZZxCf4HNsR8NbVBRyxFux6ekkJB5gLk7
 UuTvZTaJvKx1w==
Date: Tue, 2 Jun 2020 08:15:32 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>
Subject: Re: inux-next: build failure after merge of the drm-msm tree
Message-ID: <20200602081532.653091c8@canb.auug.org.au>
In-Reply-To: <20200529141056.000f78ba@canb.auug.org.au>
References: <20200519150955.1667566a@canb.auug.org.au>
 <20200526140841.0a1d5c7b@canb.auug.org.au>
 <20200529141056.000f78ba@canb.auug.org.au>
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Kalyan Thota <kalyan_t@codeaurora.org>
Content-Type: multipart/mixed; boundary="===============1912289663=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1912289663==
Content-Type: multipart/signed; boundary="Sig_/Sw+Nhr/CKcfCnxSxMUtNceP";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Sw+Nhr/CKcfCnxSxMUtNceP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Dave,

On Fri, 29 May 2020 14:10:56 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Tue, 26 May 2020 14:08:41 +1000 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >
> > On Tue, 19 May 2020 15:09:55 +1000 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > After merging the drm-msm tree, today's linux-next build (arm
> > > multi_v7_defconfig) failed like this:
> > >=20
> > > ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/msm/msm.ko] undefi=
ned!
> > > ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/msm/msm.ko] undef=
ined!
> > >=20
> > > Caused by commit
> > >=20
> > >   04d9044f6c57 ("drm/msm/dpu: add support for clk and bw scaling for =
display")
> > >=20
> > > I applied the following patch for today (this is mechanical, there may
> > > be a better way):
> > >=20
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Tue, 19 May 2020 14:12:39 +1000
> > > Subject: [PATCH] drm/msm/dpu: fix up u64/u32 division for 32 bit arch=
itectures
> > >=20
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 23 ++++++++++++++---=
--
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 15 ++++++++----
> > >  2 files changed, 28 insertions(+), 10 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/=
gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > index 9697abcbec3f..85c2a4190840 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > @@ -10,6 +10,7 @@
> > >  #include <linux/sort.h>
> > >  #include <linux/clk.h>
> > >  #include <linux/bitmap.h>
> > > +#include <asm/div64.h>
> > > =20
> > >  #include "dpu_kms.h"
> > >  #include "dpu_trace.h"
> > > @@ -53,8 +54,11 @@ static u64 _dpu_core_perf_calc_bw(struct dpu_kms *=
kms,
> > >  	}
> > > =20
> > >  	bw_factor =3D kms->catalog->perf.bw_inefficiency_factor;
> > > -	if (bw_factor)
> > > -		crtc_plane_bw =3D mult_frac(crtc_plane_bw, bw_factor, 100);
> > > +	if (bw_factor) {
> > > +		u64 quot =3D crtc_plane_bw;
> > > +		u32 rem =3D do_div(quot, 100);
> > > +		crtc_plane_bw =3D (quot * bw_factor) + ((rem * bw_factor) / 100);
> > > +	}
> > > =20
> > >  	return crtc_plane_bw;
> > >  }
> > > @@ -89,8 +93,11 @@ static u64 _dpu_core_perf_calc_clk(struct dpu_kms =
*kms,
> > >  	}
> > > =20
> > >  	clk_factor =3D kms->catalog->perf.clk_inefficiency_factor;
> > > -	if (clk_factor)
> > > -		crtc_clk =3D mult_frac(crtc_clk, clk_factor, 100);
> > > +	if (clk_factor) {
> > > +		u64 quot =3D crtc_clk;
> > > +		u32 rem =3D do_div(quot, 100);
> > > +		crtc_clk =3D (quot * clk_factor) + ((rem * clk_factor) / 100);
> > > +	}
> > > =20
> > >  	return crtc_clk;
> > >  }
> > > @@ -234,8 +241,12 @@ static int _dpu_core_perf_crtc_update_bus(struct=
 dpu_kms *kms,
> > >  		}
> > >  	}
> > > =20
> > > -	avg_bw =3D kms->num_paths ?
> > > -			perf.bw_ctl / kms->num_paths : 0;
> > > +	if (kms->num_paths) {
> > > +		avg_bw =3D perf.bw_ctl;
> > > +		do_div(avg_bw, kms->num_paths);
> > > +	} else {
> > > +		avg_bw =3D 0;
> > > +	}
> > > =20
> > >  	for (i =3D 0; i < kms->num_paths; i++)
> > >  		icc_set_bw(kms->path[i],
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_plane.c
> > > index c2a6e3dacd68..ad95f32eac13 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -9,6 +9,7 @@
> > > =20
> > >  #include <linux/debugfs.h>
> > >  #include <linux/dma-buf.h>
> > > +#include <asm/div64.h>
> > > =20
> > >  #include <drm/drm_atomic_uapi.h>
> > >  #include <drm/drm_damage_helper.h>
> > > @@ -174,7 +175,11 @@ static void _dpu_plane_calc_bw(struct drm_plane =
*plane,
> > >  	plane_prefill_bw =3D
> > >  		src_width * hw_latency_lines * fps * fmt->bpp * scale_factor;
> > > =20
> > > -	plane_prefill_bw =3D mult_frac(plane_prefill_bw, mode->vtotal, (vbp=
+vpw));
> > > +	{
> > > +		u64 quot =3D plane_prefill_bw;
> > > +		u32 rem =3D do_div(plane_prefill_bw, vbp + vpw);
> > > +		plane_prefill_bw =3D quot * mode->vtotal + rem * mode->vtotal / (v=
bp + vpw);
> > > +	}
> > > =20
> > >  	pstate->plane_fetch_bw =3D max(plane_bw, plane_prefill_bw);
> > >  }
> > > @@ -204,9 +209,11 @@ static void _dpu_plane_calc_clk(struct drm_plane=
 *plane)
> > >  	pstate->plane_clk =3D
> > >  		dst_width * mode->vtotal * fps;
> > > =20
> > > -	if (src_height > dst_height)
> > > -		pstate->plane_clk =3D mult_frac(pstate->plane_clk,
> > > -					src_height, dst_height);
> > > +	if (src_height > dst_height) {
> > > +		u64 quot =3D pstate->plane_clk;
> > > +		u32 rem =3D do_div(quot, dst_height);
> > > +		pstate->plane_clk =3D quot * src_height + rem * src_height / dst_h=
eight;
> > > +	}
> > >  }
> > > =20
> > >  /**
> > > --=20
> > > 2.26.2   =20
> >=20
> > I am still applying the above ... =20
>=20
> Still applying.
>=20
> Any comment even?

I assume that the drm-msm tree is merged via the drm tree, so just
letting you know that as far as I can tell the above build failure has
not yet been addressed.

[Another failure in the same commit (that I did not see) has been fixed]
--=20
Cheers,
Stephen Rothwell

--Sig_/Sw+Nhr/CKcfCnxSxMUtNceP
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl7VfgQACgkQAVBC80lX
0Gwg/gf/Z2rCpr9/3RbQFmzCOpOd9SGJVFjTT8rvCQ2vU5vKUpB+e2uHQA1lX0fC
NbF4awa0ZVvCf8c9ohN82ioJsUAHY6Qn/3cU2AzfS8M7Nw6QqOfhaoXt/7zVGAwH
jWnMONa46TfP+Kh1azieffVEUa7Ciq6M0Sxi8ekZK/ajVEoYC4Uh7nvKS5TZ3x7Z
WVI4yjBTqIwe0giggWEolmHHtz5Cn+Y1jpb+IRTBarYWOJdLsWXkcrdNgUjfFZ/1
JkNWI42YO95yg21TyZ24IJKty52l5c7fF5efXzmysjj1m7vXN+ecKm09aMoX99z/
GW9CZTrsfE/VSksGkYMGXbLtbtq42A==
=BIyg
-----END PGP SIGNATURE-----

--Sig_/Sw+Nhr/CKcfCnxSxMUtNceP--

--===============1912289663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1912289663==--
