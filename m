Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1892F36C0A8
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 10:11:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFC26E950;
	Tue, 27 Apr 2021 08:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C236E924
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 08:11:05 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id u25so28880256ljg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 01:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=6jWZSNxdCmaFZ0KsW9oRwIQxC++QBH55YMOWYgfTQOc=;
 b=P1xR9L6XnAFlwnP/0Cd0EdOAWB8IW/OJQoDfhOarZZPDjuLQQpvoL41E5CF4/Gw89V
 LlLBo9ZQZ5C9CdevII1WhUd8QgYG9IWtfk6Xxtn0v77mmH8KKWnoVbFXP5Gh3xcAb7gm
 BbUAiOO38UoaQ/sS+as4nLxt17FLUuFvwgXs/zABVq1WdM9V/Z1RQf77Da4YM0IWEHuE
 cYotNA3SWdtasyMHCpeFgiLUYHgyoLccfdFDFFpTlTuFfZkQuiYF5Z/lPlF6IAog7n55
 +FELCYs0fJXw56t91BJ14fxVtej7KPYD9hPNTcIcPvRYXotAOJz1IsIniaquNjy9Vdtl
 HypQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=6jWZSNxdCmaFZ0KsW9oRwIQxC++QBH55YMOWYgfTQOc=;
 b=kLsq5Wo2FckmzckoGYrIIpT6IKP2Dii6HBlIOI06pBLkWGZ0LHgoTU9/k6q8ccNqI9
 ZXfI8bFQc2OH2ccrwc9YBPb3+IHKeZbjBcaG/sUXo0eggYiix/1IPAMm3GwF6Dr8uziX
 yz0devWUsyxz7xbKZBFnMv7V72oyHz/FPEq6P874WL1aV72yd+v9O63GBGhSRSX9q8kA
 qZ9wTle/4EB/KEYpELjykdZlpA+BIRBY2tVatkIIH4kteluydgSwuyNHGb15HRYx6YQU
 V7Oz7Kpx0ENGybyr4b0ZA64gTyw4RUhp55BidWtXF6VuqxM+10lAVwlbaweDHvyzQWCm
 37kQ==
X-Gm-Message-State: AOAM532IzqgfEnpWxdYxGsyhmIAtKR0UqsXO2lQQfCFkbxINxQwv0s2h
 mwZ6HBNr7/nhmlwPJnm0oGI=
X-Google-Smtp-Source: ABdhPJwwZFlEWSyu4sbm4K6AP5EFBd3HwPl9eoXPJkK0yH6McHz6AepZLT8KYY2jproaSlgQScCv/Q==
X-Received: by 2002:a2e:bc21:: with SMTP id b33mr15914738ljf.338.1619511064271; 
 Tue, 27 Apr 2021 01:11:04 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id u2sm1663998lfr.272.2021.04.27.01.11.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 01:11:03 -0700 (PDT)
Date: Tue, 27 Apr 2021 11:10:59 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH v4 3/4] drm/vkms: add XRGB planes composition
Message-ID: <20210427111059.3b04a319@eldfell>
In-Reply-To: <20210426173128.ybryk3taqf6usppv@smtp.gmail.com>
References: <cover.1619250933.git.melissa.srw@gmail.com>
 <07bcf4643d11da9480599fe1b165e478bff58b25.1619250933.git.melissa.srw@gmail.com>
 <20210426110315.4e64d589@eldfell>
 <YIbqF5IqofybM4k8@phenom.ffwll.local>
 <20210426173128.ybryk3taqf6usppv@smtp.gmail.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0612550468=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0612550468==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/.+qDyN58QaAgYBUsb2RcIEE"; protocol="application/pgp-signature"

--Sig_/.+qDyN58QaAgYBUsb2RcIEE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 26 Apr 2021 14:31:28 -0300
Melissa Wen <melissa.srw@gmail.com> wrote:

> On 04/26, Daniel Vetter wrote:
> > On Mon, Apr 26, 2021 at 11:03:15AM +0300, Pekka Paalanen wrote: =20
> > > On Sat, 24 Apr 2021 05:25:31 -0300
> > > Melissa Wen <melissa.srw@gmail.com> wrote:
> > >  =20
> > > > Add support for composing XRGB888 planes in addition to the ARGB8888
> > > > format. In the case of an XRGB plane at the top, the composition co=
nsists
> > > > of copying the RGB values of a pixel from src to dst and clearing a=
lpha
> > > > channel, without the need for alpha blending operations for each pi=
xel.
> > > >=20
> > > > Blend equations assume a completely opaque background, i.e., primar=
y plane
> > > > is not cleared before pixel blending but alpha channel is explicitly
> > > > opaque (a =3D 0xff). Also, there is room for performance evaluation=
 in
> > > > switching pixel blend operation according to the plane format.
> > > >=20
> > > > v4:
> > > > - clear alpha channel (0xff) after blend color values by pixel
> > > > - improve comments on blend ops to reflect the current state
> > > > - describe in the commit message future improvements for plane comp=
osition
> > > >=20
> > > > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
> > > > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > ---
> > > >  drivers/gpu/drm/vkms/vkms_composer.c | 56 ++++++++++++++++++++++--=
----
> > > >  drivers/gpu/drm/vkms/vkms_plane.c    |  7 ++--
> > > >  2 files changed, 48 insertions(+), 15 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm=
/vkms/vkms_composer.c
> > > > index 02642801735d..7e01bc39d2a1 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > > > @@ -4,6 +4,7 @@
> > > > =20
> > > >  #include <drm/drm_atomic.h>
> > > >  #include <drm/drm_atomic_helper.h>
> > > > +#include <drm/drm_fourcc.h>
> > > >  #include <drm/drm_gem_framebuffer_helper.h>
> > > >  #include <drm/drm_gem_shmem_helper.h>
> > > >  #include <drm/drm_vblank.h>
> > > > @@ -64,7 +65,17 @@ static u8 blend_channel(u8 src, u8 dst, u8 alpha)
> > > >  	return new_color;
> > > >  }
> > > > =20
> > > > -static void alpha_blending(const u8 *argb_src, u8 *argb_dst)
> > > > +/**
> > > > + * alpha_blend - alpha blending equation
> > > > + * @argb_src: src pixel on premultiplied alpha mode
> > > > + * @argb_dst: dst pixel completely opaque
> > > > + *
> > > > + * blend pixels using premultiplied blend formula. The current DRM=
 assumption
> > > > + * is that pixel color values have been already pre-multiplied wit=
h the alpha
> > > > + * channel values. See more drm_plane_create_blend_mode_property()=
. Also, this
> > > > + * formula assumes a completely opaque background.
> > > > + */
> > > > +static void alpha_blend(const u8 *argb_src, u8 *argb_dst)
> > > >  {
> > > >  	u8 alpha;
> > > > =20
> > > > @@ -72,8 +83,16 @@ static void alpha_blending(const u8 *argb_src, u=
8 *argb_dst)
> > > >  	argb_dst[0] =3D blend_channel(argb_src[0], argb_dst[0], alpha);
> > > >  	argb_dst[1] =3D blend_channel(argb_src[1], argb_dst[1], alpha);
> > > >  	argb_dst[2] =3D blend_channel(argb_src[2], argb_dst[2], alpha);
> > > > -	/* Opaque primary */
> > > > -	argb_dst[3] =3D 0xFF;
> > > > +}
> > > > +
> > > > +/**
> > > > + * x_blend - blending equation that ignores the pixel alpha
> > > > + *
> > > > + * overwrites RGB color value from src pixel to dst pixel.
> > > > + */
> > > > +static void x_blend(const u8 *xrgb_src, u8 *xrgb_dst)
> > > > +{
> > > > +	memcpy(xrgb_dst, xrgb_src, sizeof(u8) * 3); =20
> > >=20
> > > Hi,
> > >=20
> > > this function very clearly assumes a very specific pixel format on bo=
th
> > > source and destination. I think it would be good if the code comments
> > > called out exactly which DRM_FORMAT_* they assume. This would be good
> > > to do on almost every function that makes such assumptions. I believe=
 that
> > > would help code readability, and also point out explicitly which thin=
gs
> > > need to be fixed when you add support for even more pixel formats.
> > >=20
> > > "xrgb" and "argb" are IMO too vague. You might be referring to
> > > DRM_FORMAT_XRGB* and DRM_FORMAT_ARGB*, or maybe you are referring to =
any
> > > pixel format that happens to have or not have an alpha channel in
> > > addition to the three RGB channels in some order and width.
> > >=20
> > > Being explicit that these refer to specific DRM_FORMAT_* should also
> > > help understanding how things work on big-endian CPUs. My current
> > > understanding is that this memcpy is correct also on big-endian, given
> > > DRM_FORMAT_XRGB8888. =20
>=20
> This endianess issue seems a little tricky to me. I remember we have
> already discussed something similar when introducing alpha blend ops.  I
> took little endian as default by a code comment on
> include/drm/drm_fourcc.h: DRM formats are little endian. But also, I am
> not sure if I got it well.

DRM format *definitions* are written on a little-endian CPU. When you
have a big-endian CPU, the byte-to-byte memory contents still remain
the same. That means if you have a uint32_t pixel in a certain
DRM_FORMAT_*, you must always access the bits of it like a
little-endian CPU would.

I think this was the "recently" agreed definition, and drivers who do
not follow this still exist because fixing them would break userspace?

So if you make the assumption that your machine is little-endian, you
have no worries, but you might want to document that you are making
this assumption, so that people know it might not be correct on
big-endian. It is important to document that it is *unknown* if the
code is correct on big-endian, to make people think rather than blindly
add a #ifdef big-endian then swap bytes, because the code might be
correct already - you just don't know yet.

I wouldn't personally bother thinking about big-endian, other than
acknowledging that I don't think about big-endian when writing code, and
noticing places where it might make a difference (prime example:
accessing pixel components via bytes vs. bits-of-uint32).

> > > Hmm, or rather, is this particular function intended to be general in
> > > the sense that the order of RGB channels does not matter as long as i=
t's
> > > the same in both source and destination? Which would mean I had a wro=
ng
> > > assumption from the start. =20
> >=20
> > Atm all vkms supports is X/ARGB8888, and even there we throw around ran=
dom
> > limits. Add support for more pixel formats is definitely on the list, a=
nd
> > then all the blend/compose stuff needs to be quite drastically
> > rearchitected. =20

If there are arbitrary limitations, then IMO those are especially
important to mention.

> yes, currently, we only have on vkms these two formats listed as
> supported (X/ARGB8888), so, I think it is ok, since we do not expected
> anything other than these two.
>=20
> >=20
> > I think until we're there documenting what's already documented in the
> > todo list feels like overkill.

I'm literally asking for single-sentence comments added, like:

	/* DRM_FORMAT_XRGB8888 */

It makes all the difference to anyone seeing the code for the first
time. Particularly if people want to review patches into this area,
because patches are sent via email and therefore completely lack the
context of the surrounding code at large and knowledge of which kernel
tree they apply to (I'm not a kernel dev), not to mention the trouble
of having to apply a patch to be able to look at more context.

Thanks for mentioning https://lkml.org/lkml/2020/8/30/163 in the other
email!


Thanks,
pq


> > -Daniel
> >  =20
> > >  =20
> > > >  }
> > > > =20
> > > >  /**
> > > > @@ -82,16 +101,20 @@ static void alpha_blending(const u8 *argb_src,=
 u8 *argb_dst)
> > > >   * @vaddr_src: source address
> > > >   * @dst_composer: destination framebuffer's metadata
> > > >   * @src_composer: source framebuffer's metadata
> > > > + * @pixel_blend: blending equation based on plane format
> > > >   *
> > > > - * Blend the vaddr_src value with the vaddr_dst value using the pr=
e-multiplied
> > > > - * alpha blending equation, since DRM currently assumes that the p=
ixel color
> > > > - * values have already been pre-multiplied with the alpha channel =
values. See
> > > > - * more drm_plane_create_blend_mode_property(). This function uses=
 buffer's
> > > > - * metadata to locate the new composite values at vaddr_dst.
> > > > + * Blend the vaddr_src value with the vaddr_dst value using a pixe=
l blend
> > > > + * equation according to the plane format and clearing alpha chann=
el to an
> > > > + * completely opaque background. This function uses buffer's metad=
ata to locate
> > > > + * the new composite values at vaddr_dst.
> > > > + *
> > > > + * TODO: completely clear the primary plane (a =3D 0xff) before st=
arting to blend
> > > > + * pixel color values
> > > >   */
> > > >  static void blend(void *vaddr_dst, void *vaddr_src,
> > > >  		  struct vkms_composer *dst_composer,
> > > > -		  struct vkms_composer *src_composer)
> > > > +		  struct vkms_composer *src_composer,
> > > > +		  void (*pixel_blend)(const u8 *, u8 *))
> > > >  {
> > > >  	int i, j, j_dst, i_dst;
> > > >  	int offset_src, offset_dst;
> > > > @@ -119,7 +142,9 @@ static void blend(void *vaddr_dst, void *vaddr_=
src,
> > > > =20
> > > >  			pixel_src =3D (u8 *)(vaddr_src + offset_src);
> > > >  			pixel_dst =3D (u8 *)(vaddr_dst + offset_dst);
> > > > -			alpha_blending(pixel_src, pixel_dst);
> > > > +			pixel_blend(pixel_src, pixel_dst);
> > > > +			/* clearing alpha channel (0xff)*/
> > > > +			memset(vaddr_dst + offset_dst + 3, 0xff, 1); =20
> > >=20
> > > A one byte memset?
> > >=20
> > > Wouldn't pixel_dst[3] =3D 0xff; be more clear? =20
>=20
> yes, I will change it.
>=20
> Thanks for these suggestions,
>=20
> Melissa
> > >=20
> > >=20
> > > Thanks,
> > > pq
> > >  =20
> > > >  		}
> > > >  		i_dst++;
> > > >  	}
> > > > @@ -131,6 +156,8 @@ static void compose_plane(struct vkms_composer =
*primary_composer,
> > > >  {
> > > >  	struct drm_gem_object *plane_obj;
> > > >  	struct drm_gem_shmem_object *plane_shmem_obj;
> > > > +	struct drm_framebuffer *fb =3D &plane_composer->fb;
> > > > +	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
> > > > =20
> > > >  	plane_obj =3D drm_gem_fb_get_obj(&plane_composer->fb, 0);
> > > >  	plane_shmem_obj =3D to_drm_gem_shmem_obj(plane_obj);
> > > > @@ -138,8 +165,13 @@ static void compose_plane(struct vkms_composer=
 *primary_composer,
> > > >  	if (WARN_ON(!plane_shmem_obj->vaddr))
> > > >  		return;
> > > > =20
> > > > -	blend(vaddr_out, plane_shmem_obj->vaddr,
> > > > -	      primary_composer, plane_composer);
> > > > +	if (fb->format->format =3D=3D DRM_FORMAT_ARGB8888)
> > > > +		pixel_blend =3D &alpha_blend;
> > > > +	else
> > > > +		pixel_blend =3D &x_blend;
> > > > +
> > > > +	blend(vaddr_out, plane_shmem_obj->vaddr, primary_composer,
> > > > +	      plane_composer, pixel_blend);
> > > >  }
> > > > =20
> > > >  static int compose_active_planes(void **vaddr_out,
> > > > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vk=
ms/vkms_plane.c
> > > > index 135140f8e87a..da4251aff67f 100644
> > > > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > > > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > > > @@ -16,8 +16,9 @@ static const u32 vkms_formats[] =3D {
> > > >  	DRM_FORMAT_XRGB8888,
> > > >  };
> > > > =20
> > > > -static const u32 vkms_cursor_formats[] =3D {
> > > > +static const u32 vkms_plane_formats[] =3D {
> > > >  	DRM_FORMAT_ARGB8888,
> > > > +	DRM_FORMAT_XRGB8888
> > > >  };
> > > > =20
> > > >  static struct drm_plane_state *
> > > > @@ -200,8 +201,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_=
device *vkmsdev,
> > > >  	int nformats;
> > > > =20
> > > >  	if (type =3D=3D DRM_PLANE_TYPE_CURSOR) {
> > > > -		formats =3D vkms_cursor_formats;
> > > > -		nformats =3D ARRAY_SIZE(vkms_cursor_formats);
> > > > +		formats =3D vkms_plane_formats;
> > > > +		nformats =3D ARRAY_SIZE(vkms_plane_formats);
> > > >  		funcs =3D &vkms_primary_helper_funcs;
> > > >  	} else {
> > > >  		formats =3D vkms_formats; =20
> > >  =20
> >=20
> >=20
> >  =20
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel =20
> >=20
> >=20
> > --=20
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch =20


--Sig_/.+qDyN58QaAgYBUsb2RcIEE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCHxxMACgkQI1/ltBGq
qqcJbg/+JwlMorBsnca9AK6K0HI6wfOi+EQOCN9UfwkTs72LL+pvd4FbuixAj+Cn
eCkGCcxSSvC531WAveZZV5TlJGgjhIpla7lKAHCeH5QqZv9XUSrO59cjzFS/fXbZ
F9L2MZh7PD5UelJiXRpD2qfYsYaaUWaEp7YJKog8B+Z2eKrZEp9p5fRqhyihImMs
j4ZfP8w90GUQ9O/yYfXJsgXTLcXiXNj6gKkblnMU4PU9KZ8FQXnnUL/cw6nlGvAz
9J2Q2wKF+cbn26nwPqPeYg7SmHEAYA4ARctfbxUv8Oy8cEtKMUNc0O2PFwnC2Q5G
QVj++tkWu3dxbsWjW6O2ajC/q7hTi13jDr7acu2r648ZDc6xMgToBZPcokCXOUKO
hlcXK5A/No+ia61yS5Ye59+at+qyk822v8iK3PvAZIkYFOUahWJlBS337K6/iegf
MB897cvPvOn6RIhfz7mezBjnWhVig2RVI1syXpJi6GCNy7d/yjXnLhyaW/ZxCphw
MNDaBh3e0ognzYLki/oS3jdGvbNBuAR8/AalKULqPs7zNz8UQtSzB5E5VYXrT55T
TE3QK24hWxJnAoFrsBLEyhBvkcAxIN9l3/yNeJ4pSxVtWfSvfS/PmKvAyRvPxmuh
BTLjbNpU3kSghZJQ2A/MzTZ+183U4X2C6RnUVkziIybfTjx91Cg=
=S1ig
-----END PGP SIGNATURE-----

--Sig_/.+qDyN58QaAgYBUsb2RcIEE--

--===============0612550468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0612550468==--
