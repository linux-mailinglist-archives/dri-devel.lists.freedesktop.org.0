Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A56755B837
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jun 2022 09:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 965D211A174;
	Mon, 27 Jun 2022 07:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F0911A174
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 07:32:00 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 157184000A;
 Mon, 27 Jun 2022 07:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1656315118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=idapMRXYI8LK9pUAYFY1PYnrl5ucrW9SNpfI7s4FHE4=;
 b=Vy9rHewE32491kgIJR1RVvJ1tFofhHp5SQGbZWRVyOH+8o8YDTqsOf4/xajaU3Y7ZWKqvf
 NFRtHFfxv0E3OtoizaC6LpUP27SJqWSJOhgx+5v2+rZfGG5QqAUF6W4UzZBx1MDlt0Gqa2
 2/oFX8B0zXrKXmADX8Ms6CKGcRtY9CxzQciEAAXQFFHGZmzEA4+GtbbrWUwK56/8eknAWO
 0OrRS5RVKBYi07kknPeZIB4AL1ihWTuPm8pjpOgWAYt9jGouBNGCdDuLJv3gu427WwGRWW
 yP+++ihGjQeBpldwqrQs1GVbz/iE98dDSFW23sF4inDOBBSSosJnvBet5A7ZjQ==
Date: Mon, 27 Jun 2022 09:31:55 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [bug report] drm: Add support for the LogiCVC display controller
Message-ID: <Yrlc67dOMJcnXVwv@aptenodytes>
References: <Yqh6ErANSTEJpfvl@kili> <YrXP5Q16k/X0EVEI@aptenodytes>
 <20220627052629.GH11460@kadam>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="eX5xD+Upx/MLuNME"
Content-Disposition: inline
In-Reply-To: <20220627052629.GH11460@kadam>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--eX5xD+Upx/MLuNME
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Mon 27 Jun 22, 08:26, Dan Carpenter wrote:
> On Fri, Jun 24, 2022 at 04:53:25PM +0200, Paul Kocialkowski wrote:
> > Hello Dan,
> >=20
> > On Tue 14 Jun 22, 15:07, Dan Carpenter wrote:
> > > Hello Paul Kocialkowski,
> > >=20
> > > The patch efeeaefe9be5: "drm: Add support for the LogiCVC display
> > > controller" from May 20, 2022, leads to the following Smatch static
> > > checker warning:
> > >=20
> > > 	drivers/gpu/drm/logicvc/logicvc_layer.c:320 logicvc_layer_buffer_fin=
d_setup()
> > > 	warn: impossible condition '(hoffset > (((((1))) << (16)) - 1)) =3D>=
 (0-u16max > u16max)'
> > >=20
> > > drivers/gpu/drm/logicvc/logicvc_layer.c
> > >     258 int logicvc_layer_buffer_find_setup(struct logicvc_drm *logic=
vc,
> > >     259                                     struct logicvc_layer *lay=
er,
> > >     260                                     struct drm_plane_state *s=
tate,
> > >     261                                     struct logicvc_layer_buff=
er_setup *setup)
> > >     262 {
> > >     263         struct drm_device *drm_dev =3D &logicvc->drm_dev;
> > >     264         struct drm_framebuffer *fb =3D state->fb;
> > >     265         /* All the supported formats have a single data plane=
=2E */
> > >     266         u32 layer_bytespp =3D fb->format->cpp[0];
> > >     267         u32 layer_stride =3D layer_bytespp * logicvc->config.=
row_stride;
> > >     268         u32 base_offset =3D layer->config.base_offset * layer=
_stride;
> > >     269         u32 buffer_offset =3D layer->config.buffer_offset * l=
ayer_stride;
> > >     270         u8 buffer_sel =3D 0;
> > >     271         u16 voffset =3D 0;
> > >     272         u16 hoffset =3D 0;
> > >     273         phys_addr_t fb_addr;
> > >     274         u32 fb_offset;
> > >     275         u32 gap;
> > >     276=20
> > >     277         if (!logicvc->reserved_mem_base) {
> > >     278                 drm_err(drm_dev, "No reserved memory base was=
 registered!\n");
> > >     279                 return -ENOMEM;
> > >     280         }
> > >     281=20
> > >     282         fb_addr =3D drm_fb_cma_get_gem_addr(fb, state, 0);
> > >     283         if (fb_addr < logicvc->reserved_mem_base) {
> > >     284                 drm_err(drm_dev,
> > >     285                         "Framebuffer memory below reserved me=
mory base!\n");
> > >     286                 return -EINVAL;
> > >     287         }
> > >     288=20
> > >     289         fb_offset =3D (u32) (fb_addr - logicvc->reserved_mem_=
base);
> > >     290=20
> > >     291         if (fb_offset < base_offset) {
> > >     292                 drm_err(drm_dev,
> > >     293                         "Framebuffer offset below layer base =
offset!\n");
> > >     294                 return -EINVAL;
> > >     295         }
> > >     296=20
> > >     297         gap =3D fb_offset - base_offset;
> > >     298=20
> > >     299         /* Use the possible video buffers selection. */
> > >     300         if (gap && buffer_offset) {
> > >     301                 buffer_sel =3D gap / buffer_offset;
> > >     302                 if (buffer_sel > LOGICVC_BUFFER_SEL_MAX)
> > >     303                         buffer_sel =3D LOGICVC_BUFFER_SEL_MAX;
> > >     304=20
> > >     305                 gap -=3D buffer_sel * buffer_offset;
> > >     306         }
> > >     307=20
> > >     308         /* Use the vertical offset. */
> > >     309         if (gap && layer_stride && logicvc->config.layers_con=
figurable) {
> > >     310                 voffset =3D gap / layer_stride;
> > >     311                 if (voffset > LOGICVC_LAYER_VOFFSET_MAX)
> > >     312                         voffset =3D LOGICVC_LAYER_VOFFSET_MAX;
> > >     313=20
> > >     314                 gap -=3D voffset * layer_stride;
> > >     315         }
> > >     316=20
> > >     317         /* Use the horizontal offset. */
> > >     318         if (gap && layer_bytespp && logicvc->config.layers_co=
nfigurable) {
> > >     319                 hoffset =3D gap / layer_bytespp;
> > >=20
> > > Can "gap / layer_bytespp" ever be more than USHRT_MAX?  Because if so
> > > that won't fit into "hoffset"
> >=20
> > Well there is nothing that really restricts the size of the gap, so yes=
 this
> > could happen. At this stage the gap should have been reduced already bu=
t we
> > never really know.
> >=20
> > Would it make sense to add a check that gap / layer_bytespp <=3D USHRT_=
MAX
> > in that if statement?
>=20
> My favorite fix would be to declare "hoffset" as a unsigned int.

Well the register itself only has 16 bits available for the value,
so there would still be a problem in that situation.

What do you think?

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--eX5xD+Upx/MLuNME
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmK5XOsACgkQ3cLmz3+f
v9Hz+AgAjdw360ECNIa8e4NlLj9urjVV69fT2MOoHHvwBq8+p/tFI4RvDB//wKWu
2Zq3aeRXOXmY7Rg5rPt3b7MmTPVbEkmBvzzXpPV+yvduNLB45pKJ1KvsRCzgKgVu
9Z4POmMNCnWQqoiKpqlZ5e48ROZqPdGpZC1vZCcNz+kQUp0vitFDrvFvD8ij1727
fQJ7kvn1QC/VluEnjb6ZmxNSUy1SYjqLSAr8r29tN77sCM+1iNQZGi8KwbxgRu8d
tLHSgtANJ11tKyPCORzaW8CqUk4q4YUEoQZz4hjiig/ovYMi2BvmJ/AHcQtLFF4T
7jiyzQTtPNd2pTrcetiAlsVHGWyDFQ==
=ng7f
-----END PGP SIGNATURE-----

--eX5xD+Upx/MLuNME--
