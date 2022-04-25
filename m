Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E87C50DAE3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 10:10:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0548A10E159;
	Mon, 25 Apr 2022 08:10:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF3110E159
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 08:10:31 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id v4so4678951ljd.10
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 01:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=/hNpk12B1ayTzMlMtPaQSxPeiXOte53Oa6hlvrZFoXs=;
 b=Mzg8Gc32csTZozbOuOrlpefl4nbmHF2JUyjOpTet08AbAl248nMtFZu8Xypntj2YMA
 sqeY0vo2HSWwxqvvVm0RPLgwWngACi8VYOav8NL+y7g3NpWt7T79BzDmQpzjbsNu3XBw
 oRrURG02KOAVLVxWzqQ38SQk1Tgu4raR/B52g6BBRawNkYgXx3vvgNOnCKIKivIu5I+I
 cPuRHrJKCYXXiZRo3wKaDcGh/nJH1SJ64QYtRVtYFRrCJ57nO4vZqYhAhZLLikBaicH2
 sk6s9NFgUWYWzhFUPZtEpirBHVDJsFi8bcN6XGOa24MLWXajmTNKUOD7hIOxT3DSDb4D
 jakw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=/hNpk12B1ayTzMlMtPaQSxPeiXOte53Oa6hlvrZFoXs=;
 b=1K9gbMGBIHpViBRALqzwVIXEbAH5EQbjo7Y1qtDY6KDUm8WIWhZPFKZqPzgdobDPp2
 0Kops8oUx4AG9HJQXP0Dgxp7tWfi6VNkTmJbZMebbq2PjINm2/UcdFA5BviNxIyVp19V
 tcrKLHivVG8V4e/0uDutZuITRGTYjeGYdnxGOuoR0FpVtQk8TL7p1leaQNBB/TfaAI5g
 0qbN+fLU6YuZUJpUlf1MJXdDc3hou8O8wjeGxDyKqn65VHuqWkiHJhZo61IuoV2WEj7m
 n7o0KAr7t+u1e/dBS8O3edOuXGRIy/Qp0uG3k8JoGafDbgPRFfkcAKVuuQbntOWNibyl
 ud/A==
X-Gm-Message-State: AOAM531iPvQwRbYCtIKD//s0+z98PPbmmkTBSPtAxR16XsoJ6s3pXTzG
 PlJ5yh45NCM6AkeiqbibWuQ=
X-Google-Smtp-Source: ABdhPJy86XcKbNx/yiBWn9G6PKJRNcIWps0r74HlD7VL0yTc7CcP0IsKx6SKNiJVZuBLusyTisYz4Q==
X-Received: by 2002:a05:651c:23b:b0:24f:1286:c321 with SMTP id
 z27-20020a05651c023b00b0024f1286c321mr1925738ljn.521.1650874229818; 
 Mon, 25 Apr 2022 01:10:29 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 f23-20020a2e9e97000000b0024921bcf06bsm1154265ljk.57.2022.04.25.01.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 01:10:29 -0700 (PDT)
Date: Mon, 25 Apr 2022 11:10:26 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v5 6/9] drm: vkms: Refactor the plane composer to accept
 new formats
Message-ID: <20220425111026.485cba66@eldfell>
In-Reply-To: <03105fb1-4f4c-9f8a-f99a-045458ba4e37@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-7-igormtorrente@gmail.com>
 <20220420153628.0a91fcb6@eldfell>
 <6d9acb8b-8b1c-957e-8dd1-1d5ed99b08a6@gmail.com>
 <03105fb1-4f4c-9f8a-f99a-045458ba4e37@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/rS8G1e.i217mkJvABvKASoU";
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

--Sig_/rS8G1e.i217mkJvABvKASoU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 23 Apr 2022 15:53:20 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> I forgot to respond some points from your review.
>=20
> On 4/23/22 13:04, Igor Torrente wrote:
> > Hi Pekka,
> >=20
> > On 4/20/22 09:36, Pekka Paalanen wrote: =20
> >> On Mon,  4 Apr 2022 17:45:12 -0300
> >> Igor Torrente <igormtorrente@gmail.com> wrote:
> >> =20
> >>> Currently the blend function only accepts XRGB_8888 and ARGB_8888
> >>> as a color input.
> >>>
> >>> This patch refactors all the functions related to the plane compositi=
on
> >>> to overcome this limitation.
> >>>
> >>> A new internal format(`struct pixel`) is introduced to deal with all =
=20
> >>
> >> Hi,
> >>
> >> struct pixel_argb_u16 was added in the previous patch. =20
> >=20
> > I will fix it. Thanks!

...

> >>> +static int compose_active_planes(struct vkms_writeback_job *active_w=
b,
> >>> +				 struct vkms_crtc_state *crtc_state,
> >>> +				 u32 *crc32)
> >>>    {
> >>> +	int line_width, ret =3D 0, pixel_size =3D sizeof(struct pixel_argb_=
u16);
> >>> +	struct vkms_frame_info *primary_plane_info =3D NULL;
> >>> +	struct line_buffer output_buffer, stage_buffer;
> >>> +	struct vkms_plane_state *act_plane =3D NULL;
> >>> +	u32 wb_format;
> >>>   =20
> >>> +	if (WARN_ON(pixel_size !=3D 8)) =20
> >>
> >> Isn't there a compile-time assert macro for this? Having to actually
> >> run VKMS to check for this reduces the chances of finding it early.
> >> What's the reason for this check anyway? =20
>=20
> Yes, it exists.
>=20
> include/linux/build_bug.h:1:#define static_assert(expr, ...)=20
> __static_assert(expr, ##__VA_ARGS__, #expr)
>=20
> I didn't add it because I can imagine some people very mad if the kernel=
=20
> did not compile because of vkms.

But that would mean that VKMS is broken on those platforms. You'd
better know which platforms VKMS is broken, so the Kconfig can stop
VKMS from being built there at all. Or better, fix it before anyone
needs VKMS there.

> This check exists so we can call `crc32_le` for the entire line instead
> doing it for each channel of each pixel in case `struct `pixel_argb_u16`
> had any gap added by the compiler between the struct fields.

Oh the CRC computation. Good point.

Can you add a comment about that with the check?

> >> =20
> >>> +		return -EINVAL;
> >>> +
> >>> +	if (crtc_state->num_active_planes >=3D 1) {
> >>> +		act_plane =3D crtc_state->active_planes[0];
> >>> +		if (act_plane->base.base.plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> >>> +			primary_plane_info =3D act_plane->frame_info; =20
> >>
> >> After the next patch, do you even need the primary plane for anything
> >> specifically? =20
>=20
> Yeah, I will not need it anymore.
>=20
> >> There is the map_is_null check below, but that should be
> >> done on all planes in the array, right? =20
>=20
> Yes, I guess so. And I don't know why it only checks for the=20
> primary_plane TBH.

Maybe a left-over from times when it didn't have anything but a primary
plane?

> >>
> >> I suspect the next patch, or another patch in this series, should just
> >> delete this chunk. =20
> I should, and I will in the V6 of next patch.
>=20
> >=20
> >=20
> >  =20
> >> =20
> >>>    	}
> >>>   =20
> >>> +	if (!primary_plane_info)
> >>> +		return -EINVAL;
> >>> +
> >>>    	if (WARN_ON(dma_buf_map_is_null(&primary_plane_info->map[0])))
> >>>    		return -EINVAL;
> >>>   =20
> >>> +	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
> >>> +		return -EINVAL;
> >>>   =20
> >>> +	line_width =3D drm_rect_width(&primary_plane_info->dst);
> >>> +	stage_buffer.n_pixels =3D line_width;
> >>> +	output_buffer.n_pixels =3D line_width;
> >>>   =20
> >>> +	stage_buffer.pixels =3D kvmalloc(line_width * pixel_size, GFP_KERNE=
L);
> >>> +	if (!stage_buffer.pixels) {
> >>> +		DRM_ERROR("Cannot allocate memory for the output line buffer");
> >>> +		return -ENOMEM;
> >>> +	}
> >>>   =20
> >>> +	output_buffer.pixels =3D kvmalloc(line_width * pixel_size, GFP_KERN=
EL);
> >>> +	if (!output_buffer.pixels) {
> >>> +		DRM_ERROR("Cannot allocate memory for intermediate line buffer");
> >>> +		ret =3D -ENOMEM;
> >>> +		goto free_stage_buffer;
> >>> +	}
> >>> +
> >>> +	if (active_wb) {
> >>> +		struct vkms_frame_info *wb_frame_info =3D &active_wb->frame_info;
> >>> +
> >>> +		wb_format =3D wb_frame_info->fb->format->format; =20
> >>
> >> I don't see wb_format being used, is it? =20
> >=20
> > This is probably a leftover from the last versions. Thanks for catching
> > it.
> >  =20
> >> =20
> >>> +		wb_frame_info->src =3D primary_plane_info->src;
> >>> +		wb_frame_info->dst =3D primary_plane_info->dst;
> >>> +	}
> >>> +
> >>> +	blend(active_wb, crtc_state, crc32, &stage_buffer,
> >>> +	      &output_buffer, (s64)line_width * pixel_size); =20
> >>
> >> What's the (s64) doing here?
> >>
> >> Are byte sizes not usually expressed with size_t or ssize_t types, or
> >> is the kernel convention to use u64 and s64?
> >>
> >> This makes me suspect that pixel_offset() and friends in vkms_format.c
> >> are going to need fixing as well. int type overflows at 2G. =20
> >=20
> >=20
> > Yeah, I should be using size_t in all these places.
> >  =20
> >> =20
> >>> +
> >>> +	kvfree(output_buffer.pixels);
> >>> +free_stage_buffer:
> >>> +	kvfree(stage_buffer.pixels);
> >>> +can
> >>> +	return ret;
> >>>    }
> >>>   =20
> >>>    /**
> >>> @@ -222,13 +204,11 @@ void vkms_composer_worker(struct work_struct *w=
ork)
> >>>    						struct vkms_crtc_state,
> >>>    						composer_work);
> >>>    	struct drm_crtc *crtc =3D crtc_state->base.crtc;
> >>> +	struct vkms_writeback_job *active_wb =3D crtc_state->active_writeba=
ck;
> >>>    	struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
> >>>    	bool crc_pending, wb_pending;
> >>>    	u64 frame_start, frame_end;
> >>> +	u32 crc32 =3D 0;
> >>>    	int ret;
> >>>   =20
> >>>    	spin_lock_irq(&out->composer_lock);
> >>> @@ -248,35 +228,19 @@ void vkms_composer_worker(struct work_struct *w=
ork)
> >>>    	if (!crc_pending)
> >>>    		return;
> >>>   =20
> >>>    	if (wb_pending)
> >>> +		ret =3D compose_active_planes(active_wb, crtc_state, &crc32);
> >>> +	else
> >>> +		ret =3D compose_active_planes(NULL, crtc_state, &crc32);
> >>>   =20
> >>> +	if (ret)
> >>>    		return;
> >>>   =20
> >>>    	if (wb_pending) {
> >>>    		drm_writeback_signal_completion(&out->wb_connector, 0);
> >>>    		spin_lock_irq(&out->composer_lock);
> >>>    		crtc_state->wb_pending =3D false;
> >>>    		spin_unlock_irq(&out->composer_lock);
> >>>    	}
> >>>   =20
> >>>    	/*
> >>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vk=
ms/vkms_formats.c
> >>> new file mode 100644
> >>> index 000000000000..931a61405d6a
> >>> --- /dev/null
> >>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> >>> @@ -0,0 +1,151 @@
> >>> +// SPDX-License-Identifier: GPL-2.0+
> >>> +
> >>> +#include <drm/drm_rect.h>
> >>> +#include <linux/minmax.h>
> >>> +
> >>> +#include "vkms_formats.h"
> >>> +
> >>> +static int pixel_offset(const struct vkms_frame_info *frame_info, in=
t x, int y)
> >>> +{
> >>> +	return frame_info->offset + (y * frame_info->pitch)
> >>> +				  + (x * frame_info->cpp);
> >>> +}
> >>> +
> >>> +/*
> >>> + * packed_pixels_addr - Get the pointer to pixel of a given pair of =
coordinates
> >>> + *
> >>> + * @frame_info: Buffer metadata
> >>> + * @x: The x(width) coordinate of the 2D buffer
> >>> + * @y: The y(Heigth) coordinate of the 2D buffercan
> >>> + *
> >>> + * Takes the information stored in the frame_info, a pair of coordin=
ates, and
> >>> + * returns the address of the first color channel.
> >>> + * This function assumes the channels are packed together, i.e. a co=
lor channel
> >>> + * comes immediately after another in the memory. And therefore, thi=
s function
> >>> + * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV2=
1).
> >>> + */
> >>> +static void *packed_pixels_addr(const struct vkms_frame_info *frame_=
info,
> >>> +				int x, int y)
> >>> +{
> >>> +	int offset =3D pixel_offset(frame_info, x, y);
> >>> +
> >>> +	return (u8 *)frame_info->map[0].vaddr + offset;
> >>> +}
> >>> +
> >>> +static void *get_packed_src_addr(const struct vkms_frame_info *frame=
_info, int y)
> >>> +{
> >>> +	int x_src =3D frame_info->src.x1 >> 16;
> >>> +	int y_src =3D y - frame_info->dst.y1 + (frame_info->src.y1 >> 16);
> >>> +
> >>> +	return packed_pixels_addr(frame_info, x_src, y_src);
> >>> +}
> >>> +
> >>> +static void ARGB8888_to_argb_u16(struct line_buffer *stage_buffer,
> >>> +				 const struct vkms_frame_info *frame_info, int y)
> >>> +{
> >>> +	struct pixel_argb_u16 *out_pixels =3D stage_buffer->pixels;
> >>> +	u8 *src_pixels =3D get_packed_src_addr(frame_info, y);
> >>> +	int x, x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> >>> +			       stage_buffer->n_pixels);
> >>> +
> >>> +	for (x =3D 0; x < x_limit; x++, src_pixels +=3D 4) {
> >>> +		/*
> >>> +		 * The 257 is the "conversion ratio". This number is obtained by t=
he
> >>> +		 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to =
get
> >>> +		 * the best color value in a pixel format with more possibilities.
> >>> +		 * A similar idea applies to others RGB color conversions.
> >>> +		 */
> >>> +		out_pixels[x].a =3D (u16)src_pixels[3] * 257;
> >>> +		out_pixels[x].r =3D (u16)src_pixels[2] * 257;
> >>> +		out_pixels[x].g =3D (u16)src_pixels[1] * 257;
> >>> +		out_pixels[x].b =3D (u16)src_pixels[0] * 257;
> >>> +	}
> >>> +}
> >>> +
> >>> +static void XRGB8888_to_argb_u16(struct line_buffer *stage_buffer,
> >>> +				 const struct vkms_frame_info *frame_info, int y)
> >>> +{
> >>> +	struct pixel_argb_u16 *out_pixels =3D stage_buffer->pixels;
> >>> +	u8 *src_pixels =3D get_packed_src_addr(frame_info, y);
> >>> +	int x, x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> >>> +			       stage_buffer->n_pixels);
> >>> +
> >>> +	for (x =3D 0; x < x_limit; x++, src_pixels +=3D 4) {
> >>> +		out_pixels[x].a =3D (u16)0xffff;
> >>> +		out_pixels[x].r =3D (u16)src_pixels[2] * 257;
> >>> +		out_pixels[x].g =3D (u16)src_pixels[1] * 257;
> >>> +		out_pixels[x].b =3D (u16)src_pixels[0] * 257;
> >>> +	}
> >>> +}
> >>> +
> >>> +/*
> >>> + * The following  functions take an line of argb_u16 pixels from the
> >>> + * src_buffer, convert them to a specific format, and store them in =
the
> >>> + * destination.
> >>> + *
> >>> + * They are used in the `compose_active_planes` to convert and store=
 a line
> >>> + * from the src_buffer to the writeback buffer.
> >>> + */
> >>> +static void argb_u16_to_ARGB8888(struct vkms_frame_info *frame_info,
> >>> +				 const struct line_buffer *src_buffer, int y)
> >>> +{
> >>> +	int x, x_dst =3D frame_info->dst.x1;
> >>> +	u8 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
> >>> +	struct pixel_argb_u16 *in_pixels =3D src_buffer->pixels;
> >>> +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> >>> +			    src_buffer->n_pixels);
> >>> +
> >>> +	for (x =3D 0; x < x_limit; x++, dst_pixels +=3D 4) {
> >>> +		/*
> >>> +		 * This sequence below is important because the format's byte orde=
r is
> >>> +		 * in little-endian. In the case of the ARGB8888 the memory is
> >>> +		 * organized this way:
> >>> +		 *
> >>> +		 * | Addr     | =3D blue channel
> >>> +		 * | Addr + 1 | =3D green channel
> >>> +		 * | Addr + 2 | =3D Red channel
> >>> +		 * | Addr + 3 | =3D Alpha channel
> >>> +		 */
> >>> +		dst_pixels[3] =3D DIV_ROUND_CLOSEST(in_pixels[x].a, 257);
> >>> +		dst_pixels[2] =3D DIV_ROUND_CLOSEST(in_pixels[x].r, 257);
> >>> +		dst_pixels[1] =3D DIV_ROUND_CLOSEST(in_pixels[x].g, 257);
> >>> +		dst_pixels[0] =3D DIV_ROUND_CLOSEST(in_pixels[x].b, 257);
> >>> +	}
> >>> +}
> >>> +
> >>> +static void argb_u16_to_XRGB8888(struct vkms_frame_info *frame_info,
> >>> +				 const struct line_buffer *src_buffer, int y)
> >>> +{
> >>> +	int x, x_dst =3D frame_info->dst.x1;
> >>> +	u8 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
> >>> +	struct pixel_argb_u16 *in_pixels =3D src_buffer->pixels;
> >>> +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> >>> +			    src_buffer->n_pixels);
> >>> +
> >>> +	for (x =3D 0; x < x_limit; x++, dst_pixels +=3D 4) {
> >>> +		dst_pixels[3] =3D (u8)0xff; =20
> >>
> >> When writing to XRGB, it's not necessary to ensure the X channel has
> >> any sensible value. Anyone reading from XRGB must ignore that value
> >> anyway. So why not write something wacky here, like 0xa1, that is far
> >> enough from both 0x00 or 0xff to not be confused with them even
> >> visually? Also not 0x7f or 0x80 which are close to half of 0xff.
> >>
> >> Or, you could save a whole function and just use argb_u16_to_ARGBxxxx()
> >> instead, even for XRGB destination. =20
> >=20
> >=20
> > Right. Maybe I could just leave the channel untouched.

Untouched may not be a good idea. Leaving anything untouched always has
the risk of leaking information through uninitialized memory. Maybe not
in this case because the destination is allocated by userspace already,
but nothing beats being obviously correct.

Whatever you decide here, be prepared for it becoming de-facto kernel
UABI, because it is easy for userspace to (accidentally) rely on the
value, no matter what you pick.


Thanks,
pq


> >  =20
> >> =20
> >>> +		dst_pixels[2] =3D DIV_ROUND_CLOSEST(in_pixels[x].r, 257);
> >>> +		dst_pixels[1] =3D DIV_ROUND_CLOSEST(in_pixels[x].g, 257);
> >>> +		dst_pixels[0] =3D DIV_ROUND_CLOSEST(in_pixels[x].b, 257);
> >>> +	}
> >>> +}
> >>> +
> >>> +plane_format_transform_func get_plane_fmt_transform_function(u32 for=
mat)
> >>> +{
> >>> +	if (format =3D=3D DRM_FORMAT_ARGB8888)
> >>> +		return &ARGB8888_to_argb_u16;
> >>> +	else if (format =3D=3D DRM_FORMAT_XRGB8888)
> >>> +		return &XRGB8888_to_argb_u16;
> >>> +	else
> >>> +		return NULL; =20
> >>
> >> This works for now, but when more formats are added, I'd think a switch
> >> statement would look better. =20
> >=20
> > ok.
> >  =20
> >> =20
> >>> +}
> >>> +
> >>> +wb_format_transform_func get_wb_fmt_transform_function(u32 format)
> >>> +{
> >>> +	if (format =3D=3D DRM_FORMAT_ARGB8888)
> >>> +		return &argb_u16_to_ARGB8888;
> >>> +	else if (format =3D=3D DRM_FORMAT_XRGB8888)
> >>> +		return &argb_u16_to_XRGB8888;
> >>> +	else
> >>> +		return NULL;
> >>> +}

--Sig_/rS8G1e.i217mkJvABvKASoU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJmV3IACgkQI1/ltBGq
qqc+bQ/+NfUeyddh+jg5rTAQaA+IMG0w0iILMsmxtErG93LOI2/ijEyY+jysgpQo
cyFR7VlfnFvdSRAZHw0PwuVWq8ecoSwjAVQ42/qRMxURGtiaPrWb55/yL4+ZpkeW
UuSpXwL85syNdMtfojZLTWFWe3oG8LtXlVuFmmYpn9050xGlbevT+uaKiVonR9XK
sfEbj4/AZqL/aUKtrB2wz2I8bJabopG+vEkFzVuo6FPBjkxyxKZGmnphUFRvWDNp
ScUfdP5QlfnH4l7W4t+l8lCGUO43L//OtRy0HdoODiHGE8c/kuWTCa7soEhLQtsr
ywe4Pv8yU0UAMqXSNI2cN/5w8o1idSC4PyJC6Vlpg0jKxTvS627zmukjEvY2534K
962DTUJSKdAsRiSaZLvRFZK5REIyAsEtK4smJKlSXhUD7ZCQBYYsR9xN49uxJEW3
TS/v7OWfvKrQTVRNjhs+R8HhHtreWBo0gr5aaLdFzqAhnXktCSi3ZJz4AQfuIkfd
GEMP1SY1+HA0D2hNLlNR5f9loHI21O6sdeZn3L3mI4LulBtGPu6gpuhMR1uXkbx4
lO5kYsVfrQE8HCzpcaUk2S4icBpsI1uoy0hRI97raDuA2m64efaMaVs6hDjqNWZn
kmbWQlpFU1DgC7V0pvnd6jBNNCVj/0aNFBslWN4VfiTr/heo3JA=
=dCjS
-----END PGP SIGNATURE-----

--Sig_/rS8G1e.i217mkJvABvKASoU--
