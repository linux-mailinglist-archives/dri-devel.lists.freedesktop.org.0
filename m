Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24538380192
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 03:53:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B546EDFA;
	Fri, 14 May 2021 01:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897476EDFA;
 Fri, 14 May 2021 01:53:15 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FhBPf6TFDz9sWY;
 Fri, 14 May 2021 11:53:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1620957193;
 bh=OVB81s1AxgX/uB6VuQoYBHD9V+ti3hCW+342aDl0Wv0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=k5Brhjj44Wfazae3J6C2Ofxph0Qdgdm0YFDi56DqOWJTasUGrjYSvecx3okmJXrd6
 f4BsPr30vmlA8tkdDio6rwjqNL2RMmwbw48F+xxY+Y95Oh9NOGE5XIYhy7zzqtsH0s
 DRuHCj6mIY1Q0u+RJN+xom6ERTt2TtZGZIOVu1XeHKZ8QzsNa8yxlkPGdFWxywNSrU
 Y76DpF8uTkPu1HkeceizuFrKQ6y3TABrGyITLfPEAJGbF5+eXQVUG+bABjM1lc06mQ
 yjisUl61E9Ug43I5M055ltip0AFk+emeAt431Zzc401erNAaTzAZNO8hzj6aMedGuQ
 jbFJGRdV1JxDQ==
Date: Fri, 14 May 2021 11:53:07 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: DRI <dri-devel@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>
Subject: Re: linux-next: manual merge of the drm-intel tree with the drm tree
Message-ID: <20210514115307.4364aff9@canb.auug.org.au>
In-Reply-To: <20210430082321.3bd9c4a5@canb.auug.org.au>
References: <20210317140824.0a28ffec@canb.auug.org.au>
 <20210318125241.5fdfeffd@canb.auug.org.au>
 <20210430082321.3bd9c4a5@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/xXOZ1H1+5Gl.tnx8dTNuvTz";
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/xXOZ1H1+5Gl.tnx8dTNuvTz
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 30 Apr 2021 08:23:21 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> On Thu, 18 Mar 2021 12:52:41 +1100 Stephen Rothwell <sfr@canb.auug.org.au=
> wrote:
> >=20
> > On Wed, 17 Mar 2021 14:08:24 +1100 Stephen Rothwell <sfr@canb.auug.org.=
au> wrote: =20
> > >
> > > Today's linux-next merge of the drm-intel tree got a conflict in:
> > >=20
> > >   drivers/gpu/drm/i915/display/intel_sprite.c
> > >=20
> > > between commit:
> > >=20
> > >   92f1d09ca4ed ("drm: Switch to %p4cc format modifier")
> > >=20
> > > from the drm tree and commit:
> > >=20
> > >   46d12f911821 ("drm/i915: migrate skl planes code new file (v5)")
> > >=20
> > > from the drm-intel tree.
> > >=20
> > > I fixed it up (I used the latter version of the file and applied the
> > > following patch) and can carry the fix as necessary. This is now fixed
> > > as far as linux-next is concerned, but any non trivial conflicts shou=
ld
> > > be mentioned to your upstream maintainer when your tree is submitted =
for
> > > merging.  You may also want to consider cooperating with the maintain=
er
> > > of the conflicting tree to minimise any particularly complex conflict=
s.
> > >=20
> > > From: Stephen Rothwell <sfr@canb.auug.org.au>
> > > Date: Wed, 17 Mar 2021 14:05:42 +1100
> > > Subject: [PATCH] merge fix for "drm: Switch to %p4cc format modifier"
> > >=20
> > > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > > ---
> > >  drivers/gpu/drm/i915/display/skl_universal_plane.c | 6 ++----
> > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/dri=
vers/gpu/drm/i915/display/skl_universal_plane.c
> > > index 1f335cb09149..45ceff436bf7 100644
> > > --- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > > +++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
> > > @@ -1120,7 +1120,6 @@ static int skl_plane_check_fb(const struct inte=
l_crtc_state *crtc_state,
> > >  	struct drm_i915_private *dev_priv =3D to_i915(plane->base.dev);
> > >  	const struct drm_framebuffer *fb =3D plane_state->hw.fb;
> > >  	unsigned int rotation =3D plane_state->hw.rotation;
> > > -	struct drm_format_name_buf format_name;
> > > =20
> > >  	if (!fb)
> > >  		return 0;
> > > @@ -1168,9 +1167,8 @@ static int skl_plane_check_fb(const struct inte=
l_crtc_state *crtc_state,
> > >  		case DRM_FORMAT_XVYU12_16161616:
> > >  		case DRM_FORMAT_XVYU16161616:
> > >  			drm_dbg_kms(&dev_priv->drm,
> > > -				    "Unsupported pixel format %s for 90/270!\n",
> > > -				    drm_get_format_name(fb->format->format,
> > > -							&format_name));
> > > +				    "Unsupported pixel format %p4cc for 90/270!\n",
> > > +				    &fb->format->format);
> > >  			return -EINVAL;
> > >  		default:
> > >  			break;
> > > --=20
> > > 2.30.0   =20
> >=20
> > The above fix up patch now needs to be applied to the drm tree. =20
>=20
> I am still applying the above patch, but it applies to Linus' tree now.

I am going to stop applying this.  You guys can apply it if you want to
some time.

--=20
Cheers,
Stephen Rothwell

--Sig_/xXOZ1H1+5Gl.tnx8dTNuvTz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCd2AMACgkQAVBC80lX
0GzhVAf/fbuHprJ9IVbUr42Nxw3yUKRfFqGfOwipymb1KFWPs8UXWZK5+ZzL5uYw
FCQCCdeIxh7Nl40GObZYZDuyB1hQEBYLhwLDvjFLeSmyMevWt4kTH3ypQQU7AlfI
eS9ZR+GD2y7ruSJIiScuxv/lakP1wLa/qhuSUF19j1rODD56A03lJW1uvzP7ozV/
UNlMojdAwDOzG+47QDd/JBV/Y06UN8yYtneyXByPImXob/MgefoVqMDzpdVcqJTW
VI9PSjPmOpoNYqhJ+LSa64GQaKW4r5Hfm0JAuhW35tfRdRg5Dk8/lJe3pJuGxKGJ
1ZTlyk7DoJu1eGOGsCcTrOYh9cgJcQ==
=4RRO
-----END PGP SIGNATURE-----

--Sig_/xXOZ1H1+5Gl.tnx8dTNuvTz--
