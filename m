Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F7D50DAA4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 09:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570A710E07B;
	Mon, 25 Apr 2022 07:56:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36D8710E07B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 07:56:15 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id m23so5960222ljc.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 00:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=wBhBsS7qW7sCIrktpIPFDkwxvdqhv1jaMSnmCAuyW3w=;
 b=gfAGDFGkdPnXitj8lZ/UExyjPmLdKPL/4c/EO1GNrT4BokVcMWG8NYnGxCTGeoEOYs
 4r9o6OPpTUWPZPdng80bCgZyTI3qDYhSLk95j1GGjqvzZRtEVGDCqoHPVpZuGH3Dwbpa
 9E8G8yMtZbgBNZj9w9omf7Uek3Ikqu86EULwvJ09DhvZJWvhWNMKU+h76rMeQ05K4S8A
 8HIN4b3wkiW63b+I7oskALJaS8MxwION885kELccC2D+wlpBTZ7p8wBr9ZtHoj8KzdYN
 1Tf6YF7oTdUuWrBWXChYB1u/ZlBrqirONZhsycbqIgvm8rEz/jB7XT9A/0xpHutxscbA
 UwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=wBhBsS7qW7sCIrktpIPFDkwxvdqhv1jaMSnmCAuyW3w=;
 b=LTjWOCtvMzE5GPtZnRfjc8MV0+kWD4BGrQPDB/s+R8EUiF9gWCf2Sj8dX5Au+W8GzE
 HE1W4zstHBhP82aCtle/TgZuOViozfhwxwNTFB3vERyfcvlmSrzO/2gTIHdgI/Ia3JZ3
 LAlxZHPRLXRFhf/nPWWxK+5UbdXGXlnmDZoD4KQZaZRcI37GtZlsWSA8SI7Erc1DZfm2
 v/r+yMwU3DIRPOb8LwfryinZ4NvmOJtDx9MszKhMgsuAstvqWEjk8EGQ8a0FzJHozI8l
 JRbB45KBbpBPxSl4+T17aMSXL8fgpTWCwUkuCBHQDkbEfflu8sYe4kV5p8200Q/xq5Ws
 ypxg==
X-Gm-Message-State: AOAM532KrTXJdNSPNsNk/svt8GImIFtUbc1YflGNNVivUBPIO+KC22ie
 YG1fdRsPTd8tZcg68mdULBA=
X-Google-Smtp-Source: ABdhPJwZ3uHLtM2p9Rk8TlgqHYJ/xdyYyb76rhLHNxAuamwWoN47cg6s776mKrXoeJ5apDqC5ZG3OA==
X-Received: by 2002:a05:651c:211c:b0:24d:c7e2:7327 with SMTP id
 a28-20020a05651c211c00b0024dc7e27327mr10335183ljq.223.1650873373241; 
 Mon, 25 Apr 2022 00:56:13 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 s10-20020a19ad4a000000b0044826a25a2esm1315876lfd.292.2022.04.25.00.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 00:56:12 -0700 (PDT)
Date: Mon, 25 Apr 2022 10:56:02 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v5 5/9] drm: vkms: Add fb information to
 `vkms_writeback_job`
Message-ID: <20220425105602.151885fd@eldfell>
In-Reply-To: <12fa5189-efab-11c9-3d08-6c5367748b1c@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-6-igormtorrente@gmail.com>
 <20220420142305.3945f409@eldfell>
 <12fa5189-efab-11c9-3d08-6c5367748b1c@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7W.ru1aEJvQHuhxYsU7FsdY";
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
Cc: hamohammed.sa@gmail.com, tzimmermann@suse.de, rodrigosiqueiramelo@gmail.com,
 airlied@linux.ie, leandro.ribeiro@collabora.com, melissa.srw@gmail.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/7W.ru1aEJvQHuhxYsU7FsdY
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 23 Apr 2022 12:12:51 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> Hi Pekka,
>=20
> On 4/20/22 08:23, Pekka Paalanen wrote:
> > On Mon,  4 Apr 2022 17:45:11 -0300
> > Igor Torrente <igormtorrente@gmail.com> wrote:
> >  =20
> >> This commit is the groundwork to introduce new formats to the planes a=
nd
> >> writeback buffer. As part of it, a new buffer metadata field is added =
to
> >> `vkms_writeback_job`, this metadata is represented by the `vkms_compos=
er`
> >> struct. =20
> >=20
> > Hi,
> >=20
> > should this be talking about vkms_frame_info struct instead? =20
>=20
> Yes it should. I will fix this. Thanks.
>=20
> >  =20
> >>
> >> Also adds two new function pointers (`{wb,plane}_format_transform_func=
`)
> >> are defined to handle format conversion to/from internal format.
> >>
> >> These things will allow us, in the future, to have different compositi=
ng
> >> and wb format types.
> >>
> >> V2: Change the code to get the drm_framebuffer reference and not copy =
its
> >>      contents(Thomas Zimmermann).
> >> V3: Drop the refcount in the wb code(Thomas Zimmermann).
> >> V5: Add {wb,plane}_format_transform_func to vkms_writeback_job
> >>      and vkms_plane_state (Pekka Paalanen)
> >>
> >> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> >> ---
> >>   drivers/gpu/drm/vkms/vkms_composer.c  |  4 ++--
> >>   drivers/gpu/drm/vkms/vkms_drv.h       | 31 +++++++++++++++++++++----=
--
> >>   drivers/gpu/drm/vkms/vkms_plane.c     | 10 ++++-----
> >>   drivers/gpu/drm/vkms/vkms_writeback.c | 20 ++++++++++++++---
> >>   4 files changed, 49 insertions(+), 16 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vk=
ms/vkms_composer.c
> >> index 2d946368a561..95029d2ebcac 100644
> >> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> >> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> >> @@ -153,7 +153,7 @@ static void compose_plane(struct vkms_frame_info *=
primary_plane_info,
> >>   			  struct vkms_frame_info *plane_frame_info,
> >>   			  void *vaddr_out)
> >>   {
> >> -	struct drm_framebuffer *fb =3D &plane_frame_info->fb;
> >> +	struct drm_framebuffer *fb =3D plane_frame_info->fb;
> >>   	void *vaddr;
> >>   	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
> >>  =20
> >> @@ -175,7 +175,7 @@ static int compose_active_planes(void **vaddr_out,
> >>   				 struct vkms_frame_info *primary_plane_info,
> >>   				 struct vkms_crtc_state *crtc_state)
> >>   {
> >> -	struct drm_framebuffer *fb =3D &primary_plane_info->fb;
> >> +	struct drm_framebuffer *fb =3D primary_plane_info->fb;
> >>   	struct drm_gem_object *gem_obj =3D drm_gem_fb_get_obj(fb, 0);
> >>   	const void *vaddr;
> >>   	int i;
> >> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vk=
ms_drv.h
> >> index 2e6342164bef..2704cfb6904b 100644
> >> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> >> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> >> @@ -22,13 +22,8 @@
> >>  =20
> >>   #define NUM_OVERLAY_PLANES 8
> >>  =20
> >> -struct vkms_writeback_job {
> >> -	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
> >> -	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
> >> -};
> >> -
> >>   struct vkms_frame_info {
> >> -	struct drm_framebuffer fb;
> >> +	struct drm_framebuffer *fb;
> >>   	struct drm_rect src, dst;
> >>   	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
> >>   	unsigned int offset;
> >> @@ -36,6 +31,29 @@ struct vkms_frame_info {
> >>   	unsigned int cpp;
> >>   };
> >>  =20
> >> +struct pixel_argb_u16 {
> >> +	u16 a, r, g, b;
> >> +};
> >> +
> >> +struct line_buffer {
> >> +	size_t n_pixels;
> >> +	struct pixel_argb_u16 *pixels;
> >> +};
> >> +
> >> +typedef void
> >> +(*wb_format_transform_func)(struct vkms_frame_info *frame_info,
> >> +			    const struct line_buffer *buffer, int y);
> >> +
> >> +typedef void
> >> +(*plane_format_transform_func)(struct line_buffer *buffer,
> >> +			       const struct vkms_frame_info *frame_info, int y); =20
> >=20
> > It wasn't immediately obvious to me in which direction these function
> > types work from their names. The arguments are not wb and plane but
> > vkms_frame_info and line_buffer in both. The implementations of these
> > functions would have nothing specific to a wb or a plane either, would
> > they? =20
>=20
> No, there's nothing specific.
>=20
> Do you think adding {dst_,src_} would be enough?
>=20
> (*wb_format_transform_func)(struct vkms_frame_info *dst_frame_info,
> 			    const struct line_buffer *src_buffer
>=20
> (*plane_format_transform_func)(struct line_buffer *dst_buffer,
> 			   const struct vkms_frame_info *src_frame_info,

No, because I was looking at the function pointer type names, and not
the function arguments.

> >=20
> > What about naming them frame_to_line_func and line_to_frame_func? =20
>=20
> Sounds good. I will rename it.

Thanks!

> >> +
> >> +struct vkms_writeback_job {
> >> +	struct dma_buf_map data[DRM_FORMAT_MAX_PLANES];
> >> +	struct vkms_frame_info frame_info; =20
> >=20
> > Which frame_info is this? Should the field be called wb_frame_info? =20
>=20
> Considering it's already in the writeback_job struct do you think this
> necessary?

This struct has 'data' too, and that is not the wb buffer, right?

Hmm, if it's not the wb buffer, then using DRM_FORMAT_MAX_PLANES is
odd...

> In other words, what kind of misudertanding do you think can happen if
> this variable stay without the `wb_` prefix?
>=20
> I spent a few minutes trying to find a case, but nothing came to my
> mind.

My question above is the confusion.

If all these members are about the wb destination buffer only, then
where do the inputs come from and how are they reference-counted to
make sure they are available when needed?

> >> +	wb_format_transform_func format_func; =20
> >=20
> > line_to_frame_func wb_write;
> >=20
> > perhaps? The type explains the general type of the function, and the
> > field name refers to what it is used for.
> >  =20
> >> +};
> >> +
> >>   /**
> >>    * vkms_plane_state - Driver specific plane state
> >>    * @base: base plane state
> >> @@ -44,6 +62,7 @@ struct vkms_frame_info {
> >>   struct vkms_plane_state {
> >>   	struct drm_shadow_plane_state base;
> >>   	struct vkms_frame_info *frame_info;
> >> +	plane_format_transform_func format_func; =20
> >=20
> > Similarly here, maybe
> >=20
> > frame_to_line_func plane_read;
> >=20
> > perhaps? =20
>=20
> Yeah, sure.
>=20
> >  =20
> >>   };
> >>  =20
> >>   struct vkms_plane {
> >> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/=
vkms_plane.c
> >> index a56b0f76eddd..28752af0118c 100644
> >> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> >> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> >> @@ -50,12 +50,12 @@ static void vkms_plane_destroy_state(struct drm_pl=
ane *plane,
> >>   	struct vkms_plane_state *vkms_state =3D to_vkms_plane_state(old_sta=
te);
> >>   	struct drm_crtc *crtc =3D vkms_state->base.base.crtc;
> >>  =20
> >> -	if (crtc) {
> >> +	if (crtc && vkms_state->frame_info->fb) {
> >>   		/* dropping the reference we acquired in
> >>   		 * vkms_primary_plane_update()
> >>   		 */
> >> -		if (drm_framebuffer_read_refcount(&vkms_state->frame_info->fb))
> >> -			drm_framebuffer_put(&vkms_state->frame_info->fb);
> >> +		if (drm_framebuffer_read_refcount(vkms_state->frame_info->fb))
> >> +			drm_framebuffer_put(vkms_state->frame_info->fb);
> >>   	}
> >>  =20
> >>   	kfree(vkms_state->frame_info);
> >> @@ -110,9 +110,9 @@ static void vkms_plane_atomic_update(struct drm_pl=
ane *plane,
> >>   	frame_info =3D vkms_plane_state->frame_info;
> >>   	memcpy(&frame_info->src, &new_state->src, sizeof(struct drm_rect));
> >>   	memcpy(&frame_info->dst, &new_state->dst, sizeof(struct drm_rect));
> >> -	memcpy(&frame_info->fb, fb, sizeof(struct drm_framebuffer));
> >> +	frame_info->fb =3D fb; =20
> >=20
> > This change, replacing the memcpy with storing a pointer, seems to be
> > another major point of this patch. Should it be a separate patch?
> > It doesn't seem to fit with the current commit message.
> >=20
> > I have no idea what kind of locking or referencing a drm_framebuffer
> > would need, and I suspect that would be easier to review if it was a
> > patch of its own. =20
>=20
> Makes sense. I will do that.
>=20
> >  =20
> >>   	memcpy(&frame_info->map, &shadow_plane_state->data, sizeof(frame_in=
fo->map));
> >> -	drm_framebuffer_get(&frame_info->fb);
> >> +	drm_framebuffer_get(frame_info->fb); =20
> >=20
> > Does drm_framebuffer_get() not return anything? =20
>=20
> No, it doesn't actually. This function increments the ref count of this
> struct and doesn't return anything.

D'oh. Oh well.


Thanks,
pq

> >=20
> > To me it would be more idiomatic to write something like
> >=20
> > 	frame_info->fb =3D drm_framebuffer_get(fb);
> > I spend few minutes trying to find a case but nothing comes to my mind.
> > I don't know if that pattern is used in the kernel, but I use it in
> > userspace to emphasise that frame_info owns a new reference rather than
> > borrowing someone else's.
> >=20
> >=20
> > Thanks,
> > pq

--Sig_/7W.ru1aEJvQHuhxYsU7FsdY
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJmVBIACgkQI1/ltBGq
qqenORAAidNXTzZ4w1KiKZwwSnJ1X53O3iNMkaKwQycigU9aiu7qLeY6TjK+59vD
HkYQ7NYDTcpR6nZrHj9S7JqB2qxxSdvMxIBiG059GHkirYdiBYG4lYUbRqw7T1T4
nXE7f9SYW8/wf5PcDCmHv0eIOnUNYQWlUyHIPDJFAYqLsvUeaOtHZFT6F4mgAW8L
X5cRnkpUOY9v8c9FpBO84+fIelsJbIKgpzkK3dl38Z4KWUUhnVkzf8nvCLCQwb5+
H6SIMEX6kfHWTRUCs0DNcC2rAHySyahHEvEQYvFXIG1fRgUdmQFX1+9CwUlXkvCt
LJ5VZSnaTdNKCzeqiypVFBqaFBJ9WlEIEP9+hu+QiOtZ55iNDv96xdJ8n5e8HM2a
vCCdaO304DrY66UAmXDqz+QezQRSLr3PTjFjPUp+fYqCTIBqkHHua+tTlvoumh/S
7p/AU3boQ6/Sby+oGT29yQbmRrJcG0Op5Psz1zucWgzcDUGekZr4XIO2F0Iaful0
ymmFN7sEYAqUHguhBvFf0OMY4yLGvUhzyozcsPLxqush7vu2H/p1XCo6tELOsdDb
4Dd0oox0K5qgdm8biGoE9iRknU7eRVx5QH02SxaOEH5lNtykssLyeAJ+Qxv3QCOB
lYtj5sVizilpCRWS1vCjbqkr9h6j8pNAR3pJgJv56bE8lM56D7k=
=6Bgv
-----END PGP SIGNATURE-----

--Sig_/7W.ru1aEJvQHuhxYsU7FsdY--
