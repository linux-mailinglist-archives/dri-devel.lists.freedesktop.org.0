Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18007553FD9
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 03:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413C011333C;
	Wed, 22 Jun 2022 01:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AB9211333C;
 Wed, 22 Jun 2022 01:05:10 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4LSQCh4vQ6z4xD9;
 Wed, 22 Jun 2022 11:05:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1655859905;
 bh=6Wjb0uO4MuZpIMApUk52dwtBGgeFbM2Wn3vL3VkInMk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=K4x4mDjyHAgW06UifO5sAwvGITMG+N5vHm9eapfJCnV0Q2Cse7+0Cgv2bkw1YngDG
 4lhjcoiyxLS7d1T+Sb2E15JjTULRore1GNToOao3D7cVkPQJcldCyALyEl/k00cJAD
 jdqft7z1mfNeZSbVtEqWbw28JOhaSIapN4fw80m5xzNcjiVcKmLJNIQJES2+aWXeXb
 LYBYvjnfTVN4UZ2U+alVbBROs2h+yVthVj+p+ldAZ+eur9eiZCaD447O6K2u+7JR4x
 qaqE+CnTNeX5nec2cFapr4O1+NdAzwnT4VRF/oCGLDM+edMRXxkazYI9vi4MXBMkHX
 LAEWU31MtO/Dg==
Date: Wed, 22 Jun 2022 11:04:51 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Ville =?UTF-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20220622110451.27c68263@canb.auug.org.au>
In-Reply-To: <YrF3wfumVi3q3bFj@intel.com>
References: <20220621123656.7a479ad9@canb.auug.org.au>
 <YrF3wfumVi3q3bFj@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DaBt2U5eE6eb97Ubf0U=Ci3";
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/DaBt2U5eE6eb97Ubf0U=Ci3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On Tue, 21 Jun 2022 10:48:17 +0300 Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@l=
inux.intel.com> wrote:
>
> On Tue, Jun 21, 2022 at 12:36:56PM +1000, Stephen Rothwell wrote:
> >=20
> > After merging the drm-misc tree, today's linux-next build (x86_64
> > allmodconfig) failed like this:
> >=20
> > drivers/gpu/drm/xlnx/zynqmp_disp.c: In function 'zynqmp_disp_create_pla=
nes':
> > drivers/gpu/drm/xlnx/zynqmp_disp.c:1260:17: error: implicit declaration=
 of function 'drm_plane_create_zpos_immutable_property'; did you mean 'drm_=
plane_create_scaling_filter_property'? [-Werror=3Dimplicit-function-declara=
tion]
> >  1260 |                 drm_plane_create_zpos_immutable_property(&layer=
->plane, i);
> >       |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >       |                 drm_plane_create_scaling_filter_property
> > drivers/gpu/drm/xlnx/zynqmp_disp.c:1262:25: error: implicit declaration=
 of function 'drm_plane_create_alpha_property'; did you mean 'drm_plane_cre=
ate_color_properties'? [-Werror=3Dimplicit-function-declaration]
> >  1262 |                         drm_plane_create_alpha_property(&layer-=
>plane);
> >       |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> >       |                         drm_plane_create_color_properties
> > cc1: all warnings being treated as errors
> >=20
> > Presumably caused by one of the commits that dropped includes from
> > drm-ctrc.h.
> >=20
> > I have used the drm-misc tree from next-20220620 for today. =20
>=20
> Sorry about that. Looks like my .config was missing some
> dependencies of the zynqmp driver so it wasn't getting built.
> I'll cook up a fix.

And today, I get these:

In file included from include/linux/list.h:5,
                 from include/linux/preempt.h:11,
                 from include/linux/spinlock.h:55,
                 from include/linux/mmzone.h:8,
                 from include/linux/gfp.h:6,
                 from include/linux/mm.h:7,
                 from include/linux/hyperv.h:17,
                 from drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:6:
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_blit_to_vr=
am_rect':
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:48: error: invalid use of un=
defined type 'struct drm_framebuffer'
   25 |         struct hyperv_drm_device *hv =3D to_hv(fb->dev);
      |                                                ^~
include/linux/container_of.h:18:33: note: in definition of macro 'container=
_of'
   18 |         void *__mptr =3D (void *)(ptr);                            =
       \
      |                                 ^~~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:40: note: in expansion of ma=
cro 'to_hv'
   25 |         struct hyperv_drm_device *hv =3D to_hv(fb->dev);
      |                                        ^~~~~
In file included from include/linux/bits.h:22,
                 from include/linux/ratelimit_types.h:5,
                 from include/linux/printk.h:9,
                 from include/asm-generic/bug.h:22,
                 from arch/x86/include/asm/bug.h:87,
                 from include/linux/bug.h:5,
                 from include/linux/mmdebug.h:5,
                 from include/linux/mm.h:6,
                 from include/linux/hyperv.h:17,
                 from drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:6:
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:48: error: invalid use of un=
defined type 'struct drm_framebuffer'
   25 |         struct hyperv_drm_device *hv =3D to_hv(fb->dev);
      |                                                ^~
include/linux/build_bug.h:78:56: note: in definition of macro '__static_ass=
ert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
include/linux/container_of.h:19:9: note: in expansion of macro 'static_asse=
rt'
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |         ^~~~~~~~~~~~~
include/linux/container_of.h:19:23: note: in expansion of macro '__same_typ=
e'
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |                       ^~~~~~~~~~~
drivers/gpu/drm/hyperv/hyperv_drm.h:40:21: note: in expansion of macro 'con=
tainer_of'
   40 | #define to_hv(_dev) container_of(_dev, struct hyperv_drm_device, de=
v)
      |                     ^~~~~~~~~~~~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:40: note: in expansion of ma=
cro 'to_hv'
   25 |         struct hyperv_drm_device *hv =3D to_hv(fb->dev);
      |                                        ^~~~~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:48: error: invalid use of un=
defined type 'struct drm_framebuffer'
   25 |         struct hyperv_drm_device *hv =3D to_hv(fb->dev);
      |                                                ^~
include/linux/build_bug.h:78:56: note: in definition of macro '__static_ass=
ert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
include/linux/container_of.h:19:9: note: in expansion of macro 'static_asse=
rt'
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |         ^~~~~~~~~~~~~
include/linux/container_of.h:20:23: note: in expansion of macro '__same_typ=
e'
   20 |                       __same_type(*(ptr), void),                   =
     \
      |                       ^~~~~~~~~~~
drivers/gpu/drm/hyperv/hyperv_drm.h:40:21: note: in expansion of macro 'con=
tainer_of'
   40 | #define to_hv(_dev) container_of(_dev, struct hyperv_drm_device, de=
v)
      |                     ^~~~~~~~~~~~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:40: note: in expansion of ma=
cro 'to_hv'
   25 |         struct hyperv_drm_device *hv =3D to_hv(fb->dev);
      |                                        ^~~~~
include/linux/compiler_types.h:293:27: error: expression in static assertio=
n is not an integer
  293 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), t=
ypeof(b))
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:78:56: note: in definition of macro '__static_ass=
ert'
   78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
      |                                                        ^~~~
include/linux/container_of.h:19:9: note: in expansion of macro 'static_asse=
rt'
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |         ^~~~~~~~~~~~~
include/linux/container_of.h:19:23: note: in expansion of macro '__same_typ=
e'
   19 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||  =
     \
      |                       ^~~~~~~~~~~
drivers/gpu/drm/hyperv/hyperv_drm.h:40:21: note: in expansion of macro 'con=
tainer_of'
   40 | #define to_hv(_dev) container_of(_dev, struct hyperv_drm_device, de=
v)
      |                     ^~~~~~~~~~~~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:25:40: note: in expansion of ma=
cro 'to_hv'
   25 |         struct hyperv_drm_device *hv =3D to_hv(fb->dev);
      |                                        ^~~~~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:33:37: error: invalid use of un=
defined type 'struct drm_framebuffer'
   33 |         dst +=3D drm_fb_clip_offset(fb->pitches[0], fb->format, rec=
t);
      |                                     ^~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:33:53: error: invalid use of un=
defined type 'struct drm_framebuffer'
   33 |         dst +=3D drm_fb_clip_offset(fb->pitches[0], fb->format, rec=
t);
      |                                                     ^~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:34:35: error: invalid use of un=
defined type 'struct drm_framebuffer'
   34 |         drm_fb_memcpy_toio(dst, fb->pitches[0], vmap, fb, rect);
      |                                   ^~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_blit_to_vr=
am_fullscreen':
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:46:25: error: invalid use of un=
defined type 'struct drm_framebuffer'
   46 |                 .x2 =3D fb->width,
      |                         ^~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:48:25: error: invalid use of un=
defined type 'struct drm_framebuffer'
   48 |                 .y2 =3D fb->height,
      |                         ^~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_connector_=
get_modes':
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:58:17: error: implicit declarat=
ion of function 'drm_add_modes_noedid' [-Werror=3Dimplicit-function-declara=
tion]
   58 |         count =3D drm_add_modes_noedid(connector,
      |                 ^~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:61:9: error: implicit declarati=
on of function 'drm_set_preferred_mode'; did you mean 'drm_mm_reserve_node'=
? [-Werror=3Dimplicit-function-declaration]
   61 |         drm_set_preferred_mode(connector, hv->preferred_width,
      |         ^~~~~~~~~~~~~~~~~~~~~~
      |         drm_mm_reserve_node
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_check_size=
':
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:93:27: error: invalid use of un=
defined type 'struct drm_framebuffer'
   93 |                 pitch =3D fb->pitches[0];
      |                           ^~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_pipe_enabl=
e':
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:112:48: error: invalid use of u=
ndefined type 'struct drm_framebuffer'
  112 |                                 plane_state->fb->pitches[0]);
      |                                                ^~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c: In function 'hyperv_pipe_check=
':
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:123:15: error: invalid use of u=
ndefined type 'struct drm_framebuffer'
  123 |         if (fb->format->format !=3D DRM_FORMAT_XRGB8888)
      |               ^~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:126:15: error: invalid use of u=
ndefined type 'struct drm_framebuffer'
  126 |         if (fb->pitches[0] * fb->height > hv->fb_size) {
      |               ^~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:126:32: error: invalid use of u=
ndefined type 'struct drm_framebuffer'
  126 |         if (fb->pitches[0] * fb->height > hv->fb_size) {
      |                                ^~
In file included from include/linux/device.h:15,
                 from include/linux/hyperv.h:23,
                 from drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:6:
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:128:42: error: invalid use of u=
ndefined type 'struct drm_framebuffer'
  128 |                         current->comm, fb->width, fb->height, fb->p=
itches[0], hv->fb_size);
      |                                          ^~
include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk=
_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                  =
     \
      |                                     ^~~~~~~~~~~
include/drm/drm_print.h:425:9: note: in expansion of macro 'dev_err'
  425 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
      |         ^~~~
include/drm/drm_print.h:438:9: note: in expansion of macro '__drm_printk'
  438 |         __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:127:17: note: in expansion of m=
acro 'drm_err'
  127 |                 drm_err(&hv->dev, "fb size requested by %s for %dX%=
d (pitch %d) greater than %ld\n",
      |                 ^~~~~~~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:128:53: error: invalid use of u=
ndefined type 'struct drm_framebuffer'
  128 |                         current->comm, fb->width, fb->height, fb->p=
itches[0], hv->fb_size);
      |                                                     ^~
include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk=
_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                  =
     \
      |                                     ^~~~~~~~~~~
include/drm/drm_print.h:425:9: note: in expansion of macro 'dev_err'
  425 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
      |         ^~~~
include/drm/drm_print.h:438:9: note: in expansion of macro '__drm_printk'
  438 |         __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:127:17: note: in expansion of m=
acro 'drm_err'
  127 |                 drm_err(&hv->dev, "fb size requested by %s for %dX%=
d (pitch %d) greater than %ld\n",
      |                 ^~~~~~~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:128:65: error: invalid use of u=
ndefined type 'struct drm_framebuffer'
  128 |                         current->comm, fb->width, fb->height, fb->p=
itches[0], hv->fb_size);
      |                                                                 ^~
include/linux/dev_printk.h:110:37: note: in definition of macro 'dev_printk=
_index_wrap'
  110 |                 _p_func(dev, fmt, ##__VA_ARGS__);                  =
     \
      |                                     ^~~~~~~~~~~
include/drm/drm_print.h:425:9: note: in expansion of macro 'dev_err'
  425 |         dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
      |         ^~~~
include/drm/drm_print.h:438:9: note: in expansion of macro '__drm_printk'
  438 |         __drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
      |         ^~~~~~~~~~~~
drivers/gpu/drm/hyperv/hyperv_drm_modeset.c:127:17: note: in expansion of m=
acro 'drm_err'
  127 |                 drm_err(&hv->dev, "fb size requested by %s for %dX%=
d (pitch %d) greater than %ld\n",
      |                 ^~~~~~~
cc1: all warnings being treated as errors

Please do some allmodconfig builds.

I have used the drm-misc tree from next-20220620 again for today.
--=20
Cheers,
Stephen Rothwell

--Sig_/DaBt2U5eE6eb97Ubf0U=Ci3
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmKyarMACgkQAVBC80lX
0Gx1IAgAi0+rRfrP+pQqJVFqdO7+LV4fuhNO5+znr5R1NADfACsREQ7zne4U802p
n/cholc1NOJA3OQPQf4bK+9qTLOH0gu3vQOyfKKcZ870Tt+gjtYgm396jIt5mYT4
DRgo2gfNdsFnanJoNEth8Czz9Qr6bYn+WCDrRnDGtWmML7oP3A9AgQFNPIbtv294
eHnkBI8lB6GkUl2VnEKVDb8y/GyaKu9SAuZ1oPZ53pHfB8ft6aZ7ibrREPF+vVWA
e07x/iMK55m15+InEVWsVtdbxFJyCiL/z2es169i2HJSgxvSygVKQ5r7Zywz84MY
Xsrn5m+Tt5YhnLBJQ5FqMi3e1xQvzQ==
=KInL
-----END PGP SIGNATURE-----

--Sig_/DaBt2U5eE6eb97Ubf0U=Ci3--
