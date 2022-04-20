Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15630508846
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 14:36:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F14610E127;
	Wed, 20 Apr 2022 12:36:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F55610E127
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 12:36:35 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id 17so1660087lji.1
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 05:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=W6oHHYeKKO+vu42AlN0BG2uD/SvAFRdCfFRvB3c5+Io=;
 b=FrYejCu5K4EH8jB9BOnaGxgNlFHWq6Gmx6dugFaKHnTtTipEPoHN/07vT/CMXkhTzj
 7xqeb5HwQ4cQtu/rJYPcxq8PObJU+PUFYVDerHZTruYcRwwofYrjge7XJLsI1bCgMdQa
 hQHpY/3jXfX+n4uhNT9s0iELTqmhwNXeUDY/fuVdiefReoTmn8q/aHbr5/gcmaWarZDc
 H94+d9yDDKw5IUdvo3HYjfZaYwgLn9yGwE6xdlayIpcBYfqZQSxPy0wzoVoCSPHbdqKc
 2XWUZ/i3VjiHZqUqx1WsoXAYfjkAJbenkTLo1IQEX/r3T87FM6oTm/UgAjTlO+7VlviT
 8Bqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=W6oHHYeKKO+vu42AlN0BG2uD/SvAFRdCfFRvB3c5+Io=;
 b=RuNodhysMLskTNMfaTtU3j/KRDG5IJmxYKP4eKALLaLrYdzfd8KVLfrhj+mNh6QTgs
 aDroeY3+n1m7L3hwTy9lf8JycgQjaadlCmxjrXBnShGeB+a+bBksee7oEv7AAqGRPN6u
 RLnm+JHiSZxE+A7HQGNF1UWSNaUnvt5BI2KS00lDB5+v26HtuWYcrZVwAtmQslvlsuwm
 Ep3L1XoLitNOh8xHRkiiOOdPQEUVLxePhMCLc0d6VGBmjz0ztMlMroopsLGUd2tl7YG/
 OpBjTQYsT5C7CdC4tqLgiEw5lU8IF6HREa1wZN7h8rZ7cOlw7GIqQqJs+2iAO75G6aX2
 3pPQ==
X-Gm-Message-State: AOAM530+3Byu21FkO56KJKdyH1my51TiEXCdD6AjgYOdz1YRISpml7nO
 iOBUNRSTNEy8gOPbZFaYfpI=
X-Google-Smtp-Source: ABdhPJz+njHDafjIunaVJmiJjB6fz4KiVy08wWVtzdGPsxzEA5v6T9eEHlnAdy/HtmybFozqI0de3Q==
X-Received: by 2002:a2e:a273:0:b0:24d:b3a9:9471 with SMTP id
 k19-20020a2ea273000000b0024db3a99471mr11881138ljm.320.1650458193506; 
 Wed, 20 Apr 2022 05:36:33 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 b16-20020a196710000000b00471a47b13f3sm572561lfc.255.2022.04.20.05.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 05:36:33 -0700 (PDT)
Date: Wed, 20 Apr 2022 15:36:28 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v5 6/9] drm: vkms: Refactor the plane composer to accept
 new formats
Message-ID: <20220420153628.0a91fcb6@eldfell>
In-Reply-To: <20220404204515.42144-7-igormtorrente@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
 <20220404204515.42144-7-igormtorrente@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/H=H6_bDl00sY2FjKo_+5KSA";
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

--Sig_/H=H6_bDl00sY2FjKo_+5KSA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon,  4 Apr 2022 17:45:12 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> Currently the blend function only accepts XRGB_8888 and ARGB_8888
> as a color input.
>=20
> This patch refactors all the functions related to the plane composition
> to overcome this limitation.
>=20
> A new internal format(`struct pixel`) is introduced to deal with all

Hi,

struct pixel_argb_u16 was added in the previous patch.

> possible inputs. It consists of 16 bits fields that represent each of
> the channels.
>=20
> The pixels blend is done using this internal format. And new handlers
> are being added to convert a specific format to/from this internal format.
>=20
> So the blend operation depends on these handlers to convert to this common
> format. The blended result, if necessary, is converted to the writeback
> buffer format.
>=20
> This patch introduces three major differences to the blend function.
> 1 - All the planes are blended at once.
> 2 - The blend calculus is done as per line instead of per pixel.
> 3 - It is responsible to calculates the CRC and writing the writeback
> buffer(if necessary).
>=20
> These changes allow us to allocate way less memory in the intermediate
> buffer to compute these operations. Because now we don't need to
> have the entire intermediate image lines at once, just one line is
> enough.
>=20
> | Memory consumption (output dimensions) |
> |:--------------------------------------:|
> |       Current      |     This patch    |
> |:------------------:|:-----------------:|
> |   Width * Heigth   |     2 * Width     |
>=20
> Beyond memory, we also have a minor performance benefit from all
> these changes. Results running the IGT[1] test
> `igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen` ten times:
>=20
> |                 Frametime                  |
> |:------------------------------------------:|
> |  Implementation |  Current  |  This commit |
> |:---------------:|:---------:|:------------:|
> | frametime range |  9~22 ms  |    5~17 ms   |
> |     Average     |  11.4 ms  |    7.8 ms    |
>=20
> [1] IGT commit id: bc3f6833a12221a46659535dac06ebb312490eb4
>=20
> V2: Improves the performance drastically, by performing the operations
>     per-line and not per-pixel(Pekka Paalanen).
>     Minor improvements(Pekka Paalanen).
> V3: Changes the code to blend the planes all at once. This improves
>     performance, memory consumption, and removes much of the weirdness
>     of the V2(Pekka Paalanen and me).
>     Minor improvements(Pekka Paalanen and me).
> V4: Rebase the code and adapt it to the new NUM_OVERLAY_PLANES constant.
> V5: Minor checkpatch fixes and the removal of TO-DO item(Melissa Wen).
>     Several security/robustness improvents(Pekka Paalanen).
>     Removes check_planes_x_bounds function and allows partial
>     partly off-screen(Pekka Paalanen).
>=20
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> ---
>  Documentation/gpu/vkms.rst            |   4 -
>  drivers/gpu/drm/vkms/Makefile         |   1 +
>  drivers/gpu/drm/vkms/vkms_composer.c  | 318 ++++++++++++--------------
>  drivers/gpu/drm/vkms/vkms_formats.c   | 151 ++++++++++++
>  drivers/gpu/drm/vkms/vkms_formats.h   |  12 +
>  drivers/gpu/drm/vkms/vkms_plane.c     |   3 +
>  drivers/gpu/drm/vkms/vkms_writeback.c |   3 +
>  7 files changed, 311 insertions(+), 181 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
>=20
> diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> index 973e2d43108b..a49e4ae92653 100644
> --- a/Documentation/gpu/vkms.rst
> +++ b/Documentation/gpu/vkms.rst
> @@ -118,10 +118,6 @@ Add Plane Features
> =20
>  There's lots of plane features we could add support for:
> =20
> -- Clearing primary plane: clear primary plane before plane composition (=
at the
> -  start) for correctness of pixel blend ops. It also guarantees alpha ch=
annel
> -  is cleared in the target buffer for stable crc. [Good to get started]
> -
>  - ARGB format on primary plane: blend the primary plane into background =
with
>    translucent alpha.
> =20
> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Makefile
> index 72f779cbfedd..1b28a6a32948 100644
> --- a/drivers/gpu/drm/vkms/Makefile
> +++ b/drivers/gpu/drm/vkms/Makefile
> @@ -3,6 +3,7 @@ vkms-y :=3D \
>  	vkms_drv.o \
>  	vkms_plane.o \
>  	vkms_output.o \
> +	vkms_formats.o \
>  	vkms_crtc.o \
>  	vkms_composer.o \
>  	vkms_writeback.o
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 95029d2ebcac..cf24015bf90f 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c

(For this file, I have removed all the minus diff lines from below to
better see the new code.)


> @@ -7,204 +7,186 @@
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
>  #include <drm/drm_vblank.h>
> +#include <linux/minmax.h>
> =20
>  #include "vkms_drv.h"
> =20
> +static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>  {
> +	u32 new_color;
> =20
> +	new_color =3D (src * 0xffff + dst * (0xffff - alpha));
> =20
> +	return DIV_ROUND_CLOSEST(new_color, 0xffff);

This looks good.

>  }
> =20
>  /**
> + * pre_mul_alpha_blend - alpha blending equation
> + * @src_frame_info: source framebuffer's metadata
> + * @stage_buffer: The line with the pixels from src_plane
> + * @output_buffer: A line buffer that receives all the blends output
>   *
> + * Using the information from the `frame_info`, this blends only the
> + * necessary pixels from the `stage_buffer` to the `output_buffer`
> + * using premultiplied blend formula.
>   *
> + * The current DRM assumption is that pixel color values have been alrea=
dy
> + * pre-multiplied with the alpha channel values. See more
> + * drm_plane_create_blend_mode_property(). Also, this formula assumes a
> + * completely opaque background.
>   */
> +static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
> +				struct line_buffer *stage_buffer,
> +				struct line_buffer *output_buffer)
>  {
> +	int x, x_dst =3D frame_info->dst.x1;
> +	struct pixel_argb_u16 *out =3D output_buffer->pixels + x_dst;
> +	struct pixel_argb_u16 *in =3D stage_buffer->pixels;
> +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> +			    stage_buffer->n_pixels);
> +
> +	for (x =3D 0; x < x_limit; x++) {
> +		out[x].a =3D (u16)0xffff;
> +		out[x].r =3D pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
> +		out[x].g =3D pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
> +		out[x].b =3D pre_mul_blend_channel(in[x].b, out[x].b, in[x].a);
>  	}
>  }
> =20
> +static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
>  {
> +	if (y >=3D frame_info->dst.y1 && y < frame_info->dst.y2)
> +		return true;
> =20
> +	return false;
>  }
> =20
>  /**
> + * @wb_frame_info: The writeback frame buffer metadata
> + * @crtc_state: The crtc state
> + * @crc32: The crc output of the final frame
> + * @output_buffer: A buffer of a row that will receive the result of the=
 blend(s)
> + * @stage_buffer: The line with the pixels from plane being blend to the=
 output
>   *
> + * This function blends the pixels (Using the `pre_mul_alpha_blend`)
> + * from all planes, calculates the crc32 of the output from the former s=
tep,
> + * and, if necessary, convert and store the output to the writeback buff=
er.
>   */
> +static void blend(struct vkms_writeback_job *wb,
> +		  struct vkms_crtc_state *crtc_state,
> +		  u32 *crc32, struct line_buffer *stage_buffer,
> +		  struct line_buffer *output_buffer, s64 row_size)
>  {
> +	struct vkms_plane_state **plane =3D crtc_state->active_planes;
> +	struct vkms_frame_info *primary_plane_info =3D plane[0]->frame_info;
> +	u32 n_active_planes =3D crtc_state->num_active_planes;
> +
> +	int y_dst =3D primary_plane_info->dst.y1;
> +	int h_dst =3D drm_rect_height(&primary_plane_info->dst);
> +	int y_limit =3D y_dst + h_dst;
> +	int y, i;
> +
> +	for (y =3D y_dst; y < y_limit; y++) {
> +		plane[0]->format_func(output_buffer, primary_plane_info, y);

This is a bad assumption, but the next patch removes the need for this
assumption. The primary plane may not be the bottom-most AFAIU.
Overlays below the primary exist on real hardware.

> +
> +		/* If there are other planes besides primary, we consider the active
> +		 * planes should be in z-order and compose them associatively:
> +		 * ((primary <- overlay) <- cursor)
> +		 */
> +		for (i =3D 1; i < n_active_planes; i++) {
> +			if (!check_y_limit(plane[i]->frame_info, y))
> +				continue;
> +
> +			plane[i]->format_func(stage_buffer, plane[i]->frame_info, y);
> +			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
> +					    output_buffer);
> +		}
> =20
> +		*crc32 =3D crc32_le(*crc32, (void *)output_buffer->pixels, row_size);
> =20
> +		if (wb)
> +			wb->format_func(&wb->frame_info, output_buffer, y);
>  	}
>  }
> =20
> +static int check_format_funcs(struct vkms_crtc_state *crtc_state,
> +			      struct vkms_writeback_job *active_wb)
>  {
> +	struct vkms_plane_state **planes =3D crtc_state->active_planes;
> +	u32 n_active_planes =3D crtc_state->num_active_planes;
> +	int i;
> =20
> +	for (i =3D 0; i < n_active_planes; i++)
> +		if (!planes[i]->format_func)
> +			return -1;
> =20
> +	if (active_wb && !active_wb->format_func)
> +		return -1;
> =20
> +	return 0;
>  }
> =20
> +static int compose_active_planes(struct vkms_writeback_job *active_wb,
> +				 struct vkms_crtc_state *crtc_state,
> +				 u32 *crc32)
>  {
> +	int line_width, ret =3D 0, pixel_size =3D sizeof(struct pixel_argb_u16);
> +	struct vkms_frame_info *primary_plane_info =3D NULL;
> +	struct line_buffer output_buffer, stage_buffer;
> +	struct vkms_plane_state *act_plane =3D NULL;
> +	u32 wb_format;
> =20
> +	if (WARN_ON(pixel_size !=3D 8))

Isn't there a compile-time assert macro for this? Having to actually
run VKMS to check for this reduces the chances of finding it early.
What's the reason for this check anyway?

> +		return -EINVAL;
> +
> +	if (crtc_state->num_active_planes >=3D 1) {
> +		act_plane =3D crtc_state->active_planes[0];
> +		if (act_plane->base.base.plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> +			primary_plane_info =3D act_plane->frame_info;

After the next patch, do you even need the primary plane for anything
specifically? There is the map_is_null check below, but that should be
done on all planes in the array, right?

I suspect the next patch, or another patch in this series, should just
delete this chunk.

>  	}
> =20
> +	if (!primary_plane_info)
> +		return -EINVAL;
> +
>  	if (WARN_ON(dma_buf_map_is_null(&primary_plane_info->map[0])))
>  		return -EINVAL;
> =20
> +	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
> +		return -EINVAL;
> =20
> +	line_width =3D drm_rect_width(&primary_plane_info->dst);
> +	stage_buffer.n_pixels =3D line_width;
> +	output_buffer.n_pixels =3D line_width;
> =20
> +	stage_buffer.pixels =3D kvmalloc(line_width * pixel_size, GFP_KERNEL);
> +	if (!stage_buffer.pixels) {
> +		DRM_ERROR("Cannot allocate memory for the output line buffer");
> +		return -ENOMEM;
> +	}
> =20
> +	output_buffer.pixels =3D kvmalloc(line_width * pixel_size, GFP_KERNEL);
> +	if (!output_buffer.pixels) {
> +		DRM_ERROR("Cannot allocate memory for intermediate line buffer");
> +		ret =3D -ENOMEM;
> +		goto free_stage_buffer;
> +	}
> +
> +	if (active_wb) {
> +		struct vkms_frame_info *wb_frame_info =3D &active_wb->frame_info;
> +
> +		wb_format =3D wb_frame_info->fb->format->format;

I don't see wb_format being used, is it?

> +		wb_frame_info->src =3D primary_plane_info->src;
> +		wb_frame_info->dst =3D primary_plane_info->dst;
> +	}
> +
> +	blend(active_wb, crtc_state, crc32, &stage_buffer,
> +	      &output_buffer, (s64)line_width * pixel_size);

What's the (s64) doing here?

Are byte sizes not usually expressed with size_t or ssize_t types, or
is the kernel convention to use u64 and s64?

This makes me suspect that pixel_offset() and friends in vkms_format.c
are going to need fixing as well. int type overflows at 2G.

> +
> +	kvfree(output_buffer.pixels);
> +free_stage_buffer:
> +	kvfree(stage_buffer.pixels);
> +
> +	return ret;
>  }
> =20
>  /**
> @@ -222,13 +204,11 @@ void vkms_composer_worker(struct work_struct *work)
>  						struct vkms_crtc_state,
>  						composer_work);
>  	struct drm_crtc *crtc =3D crtc_state->base.crtc;
> +	struct vkms_writeback_job *active_wb =3D crtc_state->active_writeback;
>  	struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
>  	bool crc_pending, wb_pending;
>  	u64 frame_start, frame_end;
> +	u32 crc32 =3D 0;
>  	int ret;
> =20
>  	spin_lock_irq(&out->composer_lock);
> @@ -248,35 +228,19 @@ void vkms_composer_worker(struct work_struct *work)
>  	if (!crc_pending)
>  		return;
> =20
>  	if (wb_pending)
> +		ret =3D compose_active_planes(active_wb, crtc_state, &crc32);
> +	else
> +		ret =3D compose_active_planes(NULL, crtc_state, &crc32);
> =20
> +	if (ret)
>  		return;
> =20
>  	if (wb_pending) {
>  		drm_writeback_signal_completion(&out->wb_connector, 0);
>  		spin_lock_irq(&out->composer_lock);
>  		crtc_state->wb_pending =3D false;
>  		spin_unlock_irq(&out->composer_lock);
>  	}
> =20
>  	/*
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> new file mode 100644
> index 000000000000..931a61405d6a
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -0,0 +1,151 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#include <drm/drm_rect.h>
> +#include <linux/minmax.h>
> +
> +#include "vkms_formats.h"
> +
> +static int pixel_offset(const struct vkms_frame_info *frame_info, int x,=
 int y)
> +{
> +	return frame_info->offset + (y * frame_info->pitch)
> +				  + (x * frame_info->cpp);
> +}
> +
> +/*
> + * packed_pixels_addr - Get the pointer to pixel of a given pair of coor=
dinates
> + *
> + * @frame_info: Buffer metadata
> + * @x: The x(width) coordinate of the 2D buffer
> + * @y: The y(Heigth) coordinate of the 2D buffer
> + *
> + * Takes the information stored in the frame_info, a pair of coordinates=
, and
> + * returns the address of the first color channel.
> + * This function assumes the channels are packed together, i.e. a color =
channel
> + * comes immediately after another in the memory. And therefore, this fu=
nction
> + * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
> + */
> +static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
> +				int x, int y)
> +{
> +	int offset =3D pixel_offset(frame_info, x, y);
> +
> +	return (u8 *)frame_info->map[0].vaddr + offset;
> +}
> +
> +static void *get_packed_src_addr(const struct vkms_frame_info *frame_inf=
o, int y)
> +{
> +	int x_src =3D frame_info->src.x1 >> 16;
> +	int y_src =3D y - frame_info->dst.y1 + (frame_info->src.y1 >> 16);
> +
> +	return packed_pixels_addr(frame_info, x_src, y_src);
> +}
> +
> +static void ARGB8888_to_argb_u16(struct line_buffer *stage_buffer,
> +				 const struct vkms_frame_info *frame_info, int y)
> +{
> +	struct pixel_argb_u16 *out_pixels =3D stage_buffer->pixels;
> +	u8 *src_pixels =3D get_packed_src_addr(frame_info, y);
> +	int x, x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> +			       stage_buffer->n_pixels);
> +
> +	for (x =3D 0; x < x_limit; x++, src_pixels +=3D 4) {
> +		/*
> +		 * The 257 is the "conversion ratio". This number is obtained by the
> +		 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
> +		 * the best color value in a pixel format with more possibilities.
> +		 * A similar idea applies to others RGB color conversions.
> +		 */
> +		out_pixels[x].a =3D (u16)src_pixels[3] * 257;
> +		out_pixels[x].r =3D (u16)src_pixels[2] * 257;
> +		out_pixels[x].g =3D (u16)src_pixels[1] * 257;
> +		out_pixels[x].b =3D (u16)src_pixels[0] * 257;
> +	}
> +}
> +
> +static void XRGB8888_to_argb_u16(struct line_buffer *stage_buffer,
> +				 const struct vkms_frame_info *frame_info, int y)
> +{
> +	struct pixel_argb_u16 *out_pixels =3D stage_buffer->pixels;
> +	u8 *src_pixels =3D get_packed_src_addr(frame_info, y);
> +	int x, x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> +			       stage_buffer->n_pixels);
> +
> +	for (x =3D 0; x < x_limit; x++, src_pixels +=3D 4) {
> +		out_pixels[x].a =3D (u16)0xffff;
> +		out_pixels[x].r =3D (u16)src_pixels[2] * 257;
> +		out_pixels[x].g =3D (u16)src_pixels[1] * 257;
> +		out_pixels[x].b =3D (u16)src_pixels[0] * 257;
> +	}
> +}
> +
> +/*
> + * The following  functions take an line of argb_u16 pixels from the
> + * src_buffer, convert them to a specific format, and store them in the
> + * destination.
> + *
> + * They are used in the `compose_active_planes` to convert and store a l=
ine
> + * from the src_buffer to the writeback buffer.
> + */
> +static void argb_u16_to_ARGB8888(struct vkms_frame_info *frame_info,
> +				 const struct line_buffer *src_buffer, int y)
> +{
> +	int x, x_dst =3D frame_info->dst.x1;
> +	u8 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
> +	struct pixel_argb_u16 *in_pixels =3D src_buffer->pixels;
> +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> +			    src_buffer->n_pixels);
> +
> +	for (x =3D 0; x < x_limit; x++, dst_pixels +=3D 4) {
> +		/*
> +		 * This sequence below is important because the format's byte order is
> +		 * in little-endian. In the case of the ARGB8888 the memory is
> +		 * organized this way:
> +		 *
> +		 * | Addr     | =3D blue channel
> +		 * | Addr + 1 | =3D green channel
> +		 * | Addr + 2 | =3D Red channel
> +		 * | Addr + 3 | =3D Alpha channel
> +		 */
> +		dst_pixels[3] =3D DIV_ROUND_CLOSEST(in_pixels[x].a, 257);
> +		dst_pixels[2] =3D DIV_ROUND_CLOSEST(in_pixels[x].r, 257);
> +		dst_pixels[1] =3D DIV_ROUND_CLOSEST(in_pixels[x].g, 257);
> +		dst_pixels[0] =3D DIV_ROUND_CLOSEST(in_pixels[x].b, 257);
> +	}
> +}
> +
> +static void argb_u16_to_XRGB8888(struct vkms_frame_info *frame_info,
> +				 const struct line_buffer *src_buffer, int y)
> +{
> +	int x, x_dst =3D frame_info->dst.x1;
> +	u8 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
> +	struct pixel_argb_u16 *in_pixels =3D src_buffer->pixels;
> +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> +			    src_buffer->n_pixels);
> +
> +	for (x =3D 0; x < x_limit; x++, dst_pixels +=3D 4) {
> +		dst_pixels[3] =3D (u8)0xff;

When writing to XRGB, it's not necessary to ensure the X channel has
any sensible value. Anyone reading from XRGB must ignore that value
anyway. So why not write something wacky here, like 0xa1, that is far
enough from both 0x00 or 0xff to not be confused with them even
visually? Also not 0x7f or 0x80 which are close to half of 0xff.

Or, you could save a whole function and just use argb_u16_to_ARGBxxxx()
instead, even for XRGB destination.

> +		dst_pixels[2] =3D DIV_ROUND_CLOSEST(in_pixels[x].r, 257);
> +		dst_pixels[1] =3D DIV_ROUND_CLOSEST(in_pixels[x].g, 257);
> +		dst_pixels[0] =3D DIV_ROUND_CLOSEST(in_pixels[x].b, 257);
> +	}
> +}
> +
> +plane_format_transform_func get_plane_fmt_transform_function(u32 format)
> +{
> +	if (format =3D=3D DRM_FORMAT_ARGB8888)
> +		return &ARGB8888_to_argb_u16;
> +	else if (format =3D=3D DRM_FORMAT_XRGB8888)
> +		return &XRGB8888_to_argb_u16;
> +	else
> +		return NULL;

This works for now, but when more formats are added, I'd think a switch
statement would look better.

> +}
> +
> +wb_format_transform_func get_wb_fmt_transform_function(u32 format)
> +{
> +	if (format =3D=3D DRM_FORMAT_ARGB8888)
> +		return &argb_u16_to_ARGB8888;
> +	else if (format =3D=3D DRM_FORMAT_XRGB8888)
> +		return &argb_u16_to_XRGB8888;
> +	else
> +		return NULL;
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/v=
kms_formats.h
> new file mode 100644
> index 000000000000..adc5a17b9584
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +#ifndef _VKMS_FORMATS_H_
> +#define _VKMS_FORMATS_H_
> +
> +#include "vkms_drv.h"
> +
> +plane_format_transform_func get_plane_fmt_transform_function(u32 format);
> +
> +wb_format_transform_func get_wb_fmt_transform_function(u32 format);

This is good, exposing only what is necessary.


Thanks,
pq

> +
> +#endif /* _VKMS_FORMATS_H_ */
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkm=
s_plane.c
> index 28752af0118c..798243837fd0 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -10,6 +10,7 @@
>  #include <drm/drm_plane_helper.h>
> =20
>  #include "vkms_drv.h"
> +#include "vkms_formats.h"
> =20
>  static const u32 vkms_formats[] =3D {
>  	DRM_FORMAT_XRGB8888,
> @@ -100,6 +101,7 @@ static void vkms_plane_atomic_update(struct drm_plane=
 *plane,
>  	struct drm_shadow_plane_state *shadow_plane_state;
>  	struct drm_framebuffer *fb =3D new_state->fb;
>  	struct vkms_frame_info *frame_info;
> +	u32 fmt =3D fb->format->format;
> =20
>  	if (!new_state->crtc || !fb)
>  		return;
> @@ -116,6 +118,7 @@ static void vkms_plane_atomic_update(struct drm_plane=
 *plane,
>  	frame_info->offset =3D fb->offsets[0];
>  	frame_info->pitch =3D fb->pitches[0];
>  	frame_info->cpp =3D fb->format->cpp[0];
> +	vkms_plane_state->format_func =3D get_plane_fmt_transform_function(fmt);
>  }
> =20
>  static int vkms_plane_atomic_check(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms=
/vkms_writeback.c
> index ad4bb1fb37ca..97f71e784bbf 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_gem_shmem_helper.h>
> =20
>  #include "vkms_drv.h"
> +#include "vkms_formats.h"
> =20
>  static const u32 vkms_wb_formats[] =3D {
>  	DRM_FORMAT_XRGB8888,
> @@ -123,6 +124,7 @@ static void vkms_wb_atomic_commit(struct drm_connecto=
r *conn,
>  	struct drm_framebuffer *fb =3D connector_state->writeback_job->fb;
>  	struct vkms_writeback_job *active_wb;
>  	struct vkms_frame_info *wb_frame_info;
> +	u32 wb_format =3D fb->format->format;
> =20
>  	if (!conn_state)
>  		return;
> @@ -140,6 +142,7 @@ static void vkms_wb_atomic_commit(struct drm_connecto=
r *conn,
>  	crtc_state->wb_pending =3D true;
>  	spin_unlock_irq(&output->composer_lock);
>  	drm_writeback_queue_job(wb_conn, connector_state);
> +	active_wb->format_func =3D get_wb_fmt_transform_function(wb_format);
>  }
> =20
>  static const struct drm_connector_helper_funcs vkms_wb_conn_helper_funcs=
 =3D {


--Sig_/H=H6_bDl00sY2FjKo_+5KSA
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJf/kwACgkQI1/ltBGq
qqcoWg//WuMByYPDAdzxZgt3pVpEXGfkL7kh7on9gmSQFA5UuzefesA1BlJdZO7k
kiyCN39+f7S7s70h+RVtJctNg4LcyiTXesu+O2wl8/s9bxMyYwJ7PQzANuGzLonj
sl+bltTq1ZeCy2+YirddAptnHFJCw62Deulcp6r7UsJwHDk5MUaem5wxsof4zsem
ARpcYyYzV/ry8pkzwJ4T5NIxdj3UNkdMWEdqkDNaG0l/aE5TglnizmUIhjMzsztc
BB+4Ie/UYczbZew2mNCkdf6Gy2CfnC0NYIRbUBPS8Ty83jqvZs5ftHr7fv+VA08f
Nq69OfPQEjZRj8nzguZeak+IEc2VYEMPq6iUd6YNGUl0uAEgWVVV9b3+7tWvTdiE
/2pKw4OhmcggR0n9JBoZeL2w1E3x2RC1iohv8hjpQRw0BpcUVMqGd9H1rQQTbU1a
QcJUe9of+7hG4xtJSHQ4LNIE/CTT1xuHhlHTCFbGqBerNi6WObX2tt7DrbbsD+3S
naY7VH4/ttfoVITuVv1viXq5oFIc9ESSmcrh4stnNiY4/j+vAIYNXir3Ele8fmDI
VlrIZ4sPw4dYfhPXGBVrSJmMYhL+2WPDNsX6Rn1smj7LwvhmWTkUyo8PhjDy2x8T
ingLjm5xOczaWm3lapx8MiiXL02Bo4aFbYGS4KKtBhYqsUM9eAY=
=fnvi
-----END PGP SIGNATURE-----

--Sig_/H=H6_bDl00sY2FjKo_+5KSA--
