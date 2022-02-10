Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AA14B09A8
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 10:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D42A10E7B4;
	Thu, 10 Feb 2022 09:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A15010E7B4
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 09:38:10 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id o2so9323637lfd.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 01:38:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=uaSJOTjBtvS+Ri3ZH1UhgJ61Sm/hkswm+9KUZNOso0s=;
 b=hZaYszTm2e5t3nq9swkO3Q/oE5vPTAaGaDIrhLWEHVgOhuFWl9YONmqJIAZQ9UO/ls
 WpFCEsHTixOvpa6H9/Qb1x/YZzEYYLIC1bUuRoq6wQ7pdbvHEAs+3vq02Fmr8vnNU3VE
 62qNF1pqlPdj9XCqdVb9zjeWdATfiGKu+X//agSDE8G1x+f5zliqAICYuWLdFdLfQDi7
 IydO94Gl3CeWqDcs+z5yCw2uUtg8xfI+eyRA/0o/xZhA25IeCMusfTHWIm0f4No+FCcM
 /QAHRQy4SPpkS1z8tqR/Hb2+js1jTmTC7iD2i1uAZBkzzNOjmfd2V+FPGFVq4C1c1+Hu
 BC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=uaSJOTjBtvS+Ri3ZH1UhgJ61Sm/hkswm+9KUZNOso0s=;
 b=WHdPlTNbIixqs32QnzZktp5vB93o595AOus34d6NYlPeJaY2GPAxo/z6m+YVVGeolr
 J26b6lj/mejTbHNaxnuuQfHXGszPlUBFJSfVGDxKZ4RtG6TWTjAygAOIgGLu6U/MV30M
 Okzdro/JqyGbaf+pBmR626DuJ6ECUcBVjkm3Avr/bMDhAn2y+XFfAMTBg9ImEgDvoCWE
 2iRimfd4RnyKfxLBfp1vTzuKeBNljDYJqGdkAZFh7usxRJZZwwmrUxvPIMrlg+nLWIvy
 F7nbDYLCsVsrx9o2sfBFLbF/uV0pDyvWuyZV3L/ojKpd8uM2Xejo0lq3cHGEGXqV7FEO
 c6uA==
X-Gm-Message-State: AOAM532zhtXnsxOr/CcSjhUTeOL0XV+QkQg+yxEUblGTQFlrX7GMfraK
 a5i0dkSm5w9iSC2s6wYAi/c=
X-Google-Smtp-Source: ABdhPJzFWHBTOekPx5lRatAGftsTR6opUOzwJbvblU9veirUxDAl38MyR14Y1kV5/g+O6l3h5MNqSA==
X-Received: by 2002:a05:6512:3ba:: with SMTP id
 v26mr4749118lfp.662.1644485887973; 
 Thu, 10 Feb 2022 01:38:07 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id k18sm865454lfg.217.2022.02.10.01.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 01:38:07 -0800 (PST)
Date: Thu, 10 Feb 2022 11:37:57 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v4 7/9] drm: vkms: Refactor the plane composer to accept
 new formats
Message-ID: <20220210113757.77b0a994@eldfell>
In-Reply-To: <20220121213831.47229-8-igormtorrente@gmail.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
 <20220121213831.47229-8-igormtorrente@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/428V+hclK_zi9jP.27qmI1i";
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
 airlied@linux.ie, dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 ~lkcamp/patches@lists.sr.ht, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/428V+hclK_zi9jP.27qmI1i
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Jan 2022 18:38:29 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> Currently the blend function only accepts XRGB_8888 and ARGB_8888
> as a color input.
>=20
> This patch refactors all the functions related to the plane composition
> to overcome this limitation.
>=20
> A new internal format(`struct pixel`) is introduced to deal with all
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
>     buffer(if necessary).
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
> these changes. Results running the IGT tests `*kms_cursor_crc*`:
>=20
> |                 Frametime                  |
> |:------------------------------------------:|
> |  Implementation |  Current  |  This commit |
> |:---------------:|:---------:|:------------:|
> | frametime range |  8~22 ms  |    5~18 ms   |
> |     Average     |  10.0 ms  |    7.3 ms    |
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> ---
> V2: Improves the performance drastically, by perfoming the operations
>     per-line and not per-pixel(Pekka Paalanen).
>     Minor improvements(Pekka Paalanen).
>=20
> V3: Changes the code to blend the planes all at once. This improves
>     performance, memory consumption, and removes much of the weirdness
>     of the V2(Pekka Paalanen and me).
>     Minor improvements(Pekka Paalanen and me).
>=20
> V4: Rebase the code and adapt it to the new NUM_OVERLAY_PLANES constant.
> ---
>  drivers/gpu/drm/vkms/Makefile        |   1 +
>  drivers/gpu/drm/vkms/vkms_composer.c | 335 +++++++++++++--------------
>  drivers/gpu/drm/vkms/vkms_formats.c  | 138 +++++++++++
>  drivers/gpu/drm/vkms/vkms_formats.h  |  31 +++
>  4 files changed, 333 insertions(+), 172 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h

Hi Igor,

I'm really happy to see this, thanks!

I still have some security/robustness and other comments below.

I've deleted all the minus lines from the patch to make the new code
more clear.

>=20
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
> index 95029d2ebcac..9f70fcf84fb9 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -9,202 +9,210 @@
>  #include <drm/drm_vblank.h>
> =20
>  #include "vkms_drv.h"
> +#include "vkms_formats.h"
> =20
> +static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
>  {
> +	u32 new_color;
> =20
> +	new_color =3D (src * 0xffff + dst * (0xffff - alpha));
> =20
> +	return DIV_ROUND_UP(new_color, 0xffff);

Why round-up rather than the usual mathematical rounding?

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
> +	int x_limit =3D drm_rect_width(&frame_info->dst);
> +	struct line_buffer *out =3D output_buffer + x_dst;
> +	struct line_buffer *in =3D stage_buffer;

Here you would check that you don't overrun any of the arrays. At this
point, I believe an overrun would indicate a bug in VKMS, so handle it
according to the kernel conventions. I have suggestion further below
how to make that check possible. In other places, I'll just say "check
for overruns" for short.

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
> + * @wb_fmt_func: The format tranformatio function to the wb buffer
> + * @crtc_state: The crtc state
> + * @plane_fmt_func: A format tranformation function to each plane

Is it not *from* each plane?

Each plane... does this mean that all planes must have the same pixel
format?

Oh wait, it's a pointer, so an array, isn't it? You're passing in an
array without passing in the array size. That seems quite risky to me.
Think of someone else needing to patch something here without fully
understanding how this all works, they'd easily introduce a subtle bug.

Looks like the array must be number of "active planes" long. So it's
not even a constant, and the size of the array is not documented here.

What if the fmt_func was a field in struct vkms_frame_info? So you
could set it when creating a vkms_frame_info. Wouldn't that simplify
the code in blend() and its callers?

> + * @crc32: The crc output of the final frame
> + * @output_buffer: A buffer of a row that will receive the result of the=
 blend(s)
> + * @stage_buffer: The line with the pixels from src_compositor

I don't see src_compositor?

>   *
> + * This function blends the pixels (Using the `pre_mul_alpha_blend`)
> + * from all planes, calculates the crc32 of the output from the former s=
tep,
> + * and, if necessary, convert and store the output to the writeback buff=
er.
>   *
>   * TODO: completely clear the primary plane (a =3D 0xff) before starting=
 to blend
>   * pixel color values

Mm, you only need to clear output_buffer, not the whole writeback FB.
output_buffer will unconditionally and totally overwrite the writeback
FB, right?

>   */
> +static void blend(struct vkms_frame_info *wb_frame_info,

Using "wb" as short for writeback is... well, it's hard for the me
remember at least. Could this not be named simply "writeback"?

> +		  format_transform_func wb_fmt_func,

"writeback_func"

> +		  struct vkms_crtc_state *crtc_state,
> +		  format_transform_func *plane_fmt_func,
> +		  u32 *crc32, struct line_buffer *stage_buffer,
> +		  struct line_buffer *output_buffer, s64 row_size)
>  {
> +	struct vkms_plane_state **plane =3D crtc_state->active_planes;
> +	struct vkms_frame_info *primary_plane_info =3D plane[0]->frame_info;
> +	u32 n_active_planes =3D crtc_state->num_active_planes;
> =20
> +	int y_src =3D primary_plane_info->dst.y1;

Shouldn't this be called y_dst instead?

> +	int h_dst =3D drm_rect_height(&primary_plane_info->dst);
>  	int y_limit =3D y_src + h_dst;
> +	int y, i;

It took me a while to understand that all these y-coordinates are CRTC
coordinates. Maybe call them crtc_y, crtc_y_begin, crtc_y_end,
crtc_y_height, etc.

> +
> +	for (y =3D y_src; y < y_limit; y++) {
> +		plane_fmt_func[0](primary_plane_info, y, output_buffer);

This is initializing output_buffer, right? So why do you have the TODO
comment about clearing the primary plane above?

Is it because the primary plane may not cover the CRTC exactly, the
destination rectangle might be bigger or smaller?

The output_buffer length should be the CRTC width, right?

Maybe the special-casing the primary plane in this code is wrong.
crtc_y needs to iterate over the CRTC height starting from zero. Then,
you explicitly clear output_buffer to opaque background color, and
primary plane becomes just another plane in the array of active planes
with no special handling here.

That will allow you to support overlay planes *below* the primary plane
(as is fairly common in non-PC hardware), and you can even support the
background color KMS property.

> +
> +		/* If there are other planes besides primary, we consider the active
> +		 * planes should be in z-order and compose them associatively:
> +		 * ((primary <- overlay) <- cursor)
> +		 */
> +		for (i =3D 1; i < n_active_planes; i++) {
> +			if (!check_y_limit(plane[i]->frame_info, y))
> +				continue;
> +
> +			plane_fmt_func[i](plane[i]->frame_info, y, stage_buffer);
> +			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
> +					    output_buffer);
>  		}
> +
> +		*crc32 =3D crc32_le(*crc32, (void *)output_buffer, row_size);
> +
> +		if (wb_frame_info)
> +			wb_fmt_func(wb_frame_info, y, output_buffer);
>  	}
>  }
> =20
> +static void get_format_transform_functions(struct vkms_crtc_state *crtc_=
state,
> +					   format_transform_func plane_funcs[])
>  {
> +	struct vkms_plane_state **active_planes =3D crtc_state->active_planes;
> +	u32 n_active_planes =3D crtc_state->num_active_planes, s_fmt;
> +	int i;
> =20
> +	for (i =3D 0; i < n_active_planes; i++) {
> +		s_fmt =3D active_planes[i]->frame_info->fb->format->format;
> +		plane_funcs[i] =3D get_fmt_transform_function(s_fmt);
> +	}
> +}
> =20
> +static bool check_planes_x_bounds(struct vkms_crtc_state *crtc_state,
> +				  struct vkms_frame_info *wb_frame_info)
> +{
> +	struct vkms_plane_state **planes =3D crtc_state->active_planes;
> +	struct vkms_frame_info *primary_plane_info =3D planes[0]->frame_info;
> +	int line_width =3D drm_rect_width(&primary_plane_info->dst);
> +	u32 n_active_planes =3D crtc_state->num_active_planes;
> +	int i;
> =20
> +	for (i =3D 0; i < n_active_planes; i++) {
> +		int x_dst =3D planes[i]->frame_info->dst.x1;
> +		int x_src =3D planes[i]->frame_info->src.x1 >> 16;
> +		int x2_src =3D planes[i]->frame_info->src.x2 >> 16;
> +		int x_limit =3D drm_rect_width(&planes[i]->frame_info->dst);
> =20
> +		if (x_dst + x_limit > line_width)
> +			return false;
> +		if (x_src + x_limit > x2_src)
> +			return false;
> +	}

That's interesting. Looks like you reject everything if any plane is
not fully inside the primary plane destination rectangle. But that's
not the right check, is it? If you want to check this, you would check
against the CRTC dimensions.

Then again, I think some hardware do allow planes to reach outside of
the CRTC dimensions. Cursor plane is probably the best example. The
cursor can be partly off-screen. So this is something that would need
to be supported both ways I suppose, but going with the "all plane
destination rectangles must be strictly inside the CRTC dimensions" is
a good start.

But why only x-coordinate check? y should have the same rules, right?

> +
> +	return true;
>  }
> =20
> +static int compose_active_planes(struct vkms_frame_info *wb_frame_info,
> +				 struct vkms_crtc_state *crtc_state,
> +				 u32 *crc32)
>  {
> +	format_transform_func plane_funcs[NUM_OVERLAY_PLANES], wb_func =3D NULL;
> +	int line_width, ret =3D 0, pixel_size =3D sizeof(struct line_buffer);
> +	struct vkms_frame_info *primary_plane_info =3D NULL;
> +	struct line_buffer *output_buffer, *stage_buffer;
> +	struct vkms_plane_state *act_plane =3D NULL;
> +	u32 wb_format;
> =20
> +	if (WARN_ON(pixel_size !=3D 8))
> +		return -EINVAL;
> +
> +	if (crtc_state->num_active_planes >=3D 1) {
> +		act_plane =3D crtc_state->active_planes[0];
> +		if (act_plane->base.base.plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> +			primary_plane_info =3D act_plane->frame_info;
>  	}
> =20
> +	if (!primary_plane_info)
> +		return -EINVAL;
> +
>  	if (WARN_ON(dma_buf_map_is_null(&primary_plane_info->map[0])))
>  		return -EINVAL;
> =20
> +	if (WARN_ON(!check_planes_x_bounds(crtc_state, wb_frame_info)))
> +		return -EINVAL;
> =20
> +	line_width =3D drm_rect_width(&primary_plane_info->dst);

This needs to be CRTC width, not primary plane width.

> =20
> +	stage_buffer =3D kvmalloc(line_width * pixel_size, GFP_KERNEL);
> +	if (!stage_buffer) {
> +		DRM_ERROR("Cannot allocate memory for the output line buffer");
> +		return -ENOMEM;
> +	}
> =20
> +	output_buffer =3D kvmalloc(line_width * pixel_size, GFP_KERNEL);
> +	if (!output_buffer) {
> +		DRM_ERROR("Cannot allocate memory for intermediate line buffer");
> +		ret =3D -ENOMEM;
> +		goto free_stage_buffer;
> +	}
> +
> +	get_format_transform_functions(crtc_state, plane_funcs);
> +
> +	if (wb_frame_info) {
> +		wb_format =3D wb_frame_info->fb->format->format;
> +		wb_func =3D get_wb_fmt_transform_function(wb_format);
> +		wb_frame_info->src =3D primary_plane_info->src;
> +		wb_frame_info->dst =3D primary_plane_info->dst;
> +	}
> +
> +	blend(wb_frame_info, wb_func, crtc_state, plane_funcs, crc32,
> +	      stage_buffer, output_buffer, (s64)line_width * pixel_size);
> +
> +	kvfree(output_buffer);
> +free_stage_buffer:
> +	kvfree(stage_buffer);
> +
> +	return ret;
>  }
> =20
>  /**
> @@ -222,13 +230,12 @@ void vkms_composer_worker(struct work_struct *work)
>  						struct vkms_crtc_state,
>  						composer_work);
>  	struct drm_crtc *crtc =3D crtc_state->base.crtc;
> +	struct vkms_writeback_job *active_wb =3D crtc_state->active_writeback;
> +	struct vkms_frame_info *wb_frame_info =3D &active_wb->frame_info;
>  	struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
>  	bool crc_pending, wb_pending;
>  	u64 frame_start, frame_end;
> +	u32 crc32 =3D 0;
>  	int ret;
> =20
>  	spin_lock_irq(&out->composer_lock);
> @@ -248,35 +255,19 @@ void vkms_composer_worker(struct work_struct *work)
>  	if (!crc_pending)
>  		return;
> =20
>  	if (wb_pending)
> +		ret =3D compose_active_planes(wb_frame_info, crtc_state, &crc32);
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
> index 000000000000..0d1838d1b835
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -0,0 +1,138 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#include <drm/drm_rect.h>
> +#include "vkms_formats.h"
> +
> +format_transform_func get_fmt_transform_function(u32 format)
> +{
> +	if (format =3D=3D DRM_FORMAT_ARGB8888)
> +		return &ARGB8888_to_ARGB16161616;
> +	else
> +		return &XRGB8888_to_ARGB16161616;

In functions like this you should prepare for caller errors. Use a
switch, and fail any attempt to use a pixel format it doesn't support.
Failing is much better than silently producing garbage or worse: buffer
overruns when bytes-per-pixel is not what you expected.

What to do on failure depends on whether the failure here is never
supposed to happen (follow the kernel style) e.g. malicious userspace
cannot trigger it, or if you actually use this function to define the
supported for pixel formats.

The latter means you'd have a list of all DRM pixel formats and then
you'd ask for each one if this function knows it, and if yes, you add
the format to the list of supported formats advertised to userspace. I
don't know if that would be fine by DRM coding style.

> +}
> +
> +format_transform_func get_wb_fmt_transform_function(u32 format)
> +{
> +	if (format =3D=3D DRM_FORMAT_ARGB8888)
> +		return &convert_to_ARGB8888;
> +	else
> +		return &convert_to_XRGB8888;
> +}

I think you could move the above getter functions to the bottom of the
.c file, and make all the four *_to_* functions static, and remove them
from the header.

> +
> +static int pixel_offset(struct vkms_frame_info *frame_info, int x, int y)
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
> +static void *packed_pixels_addr(struct vkms_frame_info *frame_info, int =
x, int y)
> +{
> +	int offset =3D pixel_offset(frame_info, x, y);
> +
> +	return (u8 *)frame_info->map[0].vaddr + offset;
> +}
> +
> +static void *get_packed_src_addr(struct vkms_frame_info *frame_info, int=
 y)
> +{
> +	int x_src =3D frame_info->src.x1 >> 16;
> +	int y_src =3D y - frame_info->dst.y1 + (frame_info->src.y1 >> 16);
> +
> +	return packed_pixels_addr(frame_info, x_src, y_src);
> +}
> +
> +void ARGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
> +			      struct line_buffer *stage_buffer)

I'm fairly sure that DRM will one day add exactly ARGB16161616 format.
But that will not be the format you use here (or it might be, but
purely accidentally and depending on machine endianess and whatnot), so
I would suggest inventing a new name. Also use the same name for the
struct to hold a single pixel.

E.g. struct pixel_argb_u16

So that it is clear it is not meant to be any specific DRM_FORMAT_* format.

> +{
> +	u8 *src_pixels =3D get_packed_src_addr(frame_info, y);
> +	int x, x_limit =3D drm_rect_width(&frame_info->dst);
> +
> +	for (x =3D 0; x < x_limit; x++, src_pixels +=3D 4) {
> +		/*
> +		 * Organizes the channels in their respective positions and converts
> +		 * the 8 bits channel to 16.
> +		 * The 257 is the "conversion ratio". This number is obtained by the
> +		 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
> +		 * the best color value in a pixel format with more possibilities.
> +		 * And a similar idea applies to others RGB color conversions.
> +		 */
> +		stage_buffer[x].a =3D (u16)src_pixels[3] * 257;
> +		stage_buffer[x].r =3D (u16)src_pixels[2] * 257;
> +		stage_buffer[x].g =3D (u16)src_pixels[1] * 257;
> +		stage_buffer[x].b =3D (u16)src_pixels[0] * 257;
> +	}
> +}
> +
> +void XRGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
> +			      struct line_buffer *stage_buffer)
> +{
> +	u8 *src_pixels =3D get_packed_src_addr(frame_info, y);
> +	int x, x_limit =3D drm_rect_width(&frame_info->dst);
> +
> +	for (x =3D 0; x < x_limit; x++, src_pixels +=3D 4) {
> +		stage_buffer[x].a =3D (u16)0xffff;
> +		stage_buffer[x].r =3D (u16)src_pixels[2] * 257;
> +		stage_buffer[x].g =3D (u16)src_pixels[1] * 257;
> +		stage_buffer[x].b =3D (u16)src_pixels[0] * 257;
> +	}
> +}
> +
> +/*
> + * The following  functions take an line of ARGB16161616 pixels from the
> + * src_buffer, convert them to a specific format, and store them in the
> + * destination.
> + *
> + * They are used in the `compose_active_planes` to convert and store a l=
ine
> + * from the src_buffer to the writeback buffer.
> + */
> +void convert_to_ARGB8888(struct vkms_frame_info *frame_info,
> +			 int y, struct line_buffer *src_buffer)

Please, use consistent function naming style. These are using "convert"
while the other ones are using "ARGB16161616".

> +{
> +	int x, x_dst =3D frame_info->dst.x1;
> +	u8 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
> +	int x_limit =3D drm_rect_width(&frame_info->dst);
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
> +		dst_pixels[3] =3D DIV_ROUND_UP(src_buffer[x].a, 257);
> +		dst_pixels[2] =3D DIV_ROUND_UP(src_buffer[x].r, 257);
> +		dst_pixels[1] =3D DIV_ROUND_UP(src_buffer[x].g, 257);
> +		dst_pixels[0] =3D DIV_ROUND_UP(src_buffer[x].b, 257);
> +	}
> +}
> +
> +void convert_to_XRGB8888(struct vkms_frame_info *frame_info,
> +			 int y, struct line_buffer *src_buffer)
> +{
> +	int x, x_dst =3D frame_info->dst.x1;
> +	u8 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
> +	int x_limit =3D drm_rect_width(&frame_info->dst);
> +
> +	for (x =3D 0; x < x_limit; x++, dst_pixels +=3D 4) {
> +		dst_pixels[3] =3D (u8)0xff;
> +		dst_pixels[2] =3D DIV_ROUND_UP(src_buffer[x].r, 257);
> +		dst_pixels[1] =3D DIV_ROUND_UP(src_buffer[x].g, 257);
> +		dst_pixels[0] =3D DIV_ROUND_UP(src_buffer[x].b, 257);
> +	}
> +}
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/v=
kms_formats.h
> new file mode 100644
> index 000000000000..817e8b2124ae
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -0,0 +1,31 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _VKMS_FORMATS_H_
> +#define _VKMS_FORMATS_H_
> +
> +#include "vkms_drv.h"
> +
> +struct line_buffer {

As I mentioned above, this would be called pixel_argb_u16 or something
like that.

> +	u16 a, r, g, b;
> +};

I was trying to suggest that a line_buffer would actually hold a whole
line, something like the pseudo code:

struct line_buffer {
	size_t len_pixels;
	struct my_pixel_type pixels[];
}

or whatever the kernel style for a variable length array at the end of
a struct is. Field names are suggestions.

Then it is easy to check that you don't overflow any line_buffer when
operating on them.

> +
> +void ARGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
> +			      struct line_buffer *stage_buffer);
> +
> +void XRGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
> +			      struct line_buffer *stage_buffer);
> +
> +void convert_to_ARGB8888(struct vkms_frame_info *frame_info, int y,
> +			 struct line_buffer *src_buffer);
> +
> +void convert_to_XRGB8888(struct vkms_frame_info *frame_info, int y,
> +			 struct line_buffer *src_buffer);

You should only need the below functions and not the above ones in this hea=
der.

> +
> +typedef void (*format_transform_func)(struct vkms_frame_info *frame_info=
, int y,
> +				      struct line_buffer *buffer);

The arguments for this function-pointer should be documented,
especially that y is the y-coordinate in CRTC coordinate space, i.e.
plane destination rectangle. You might even call it crtc_y.

I think you should use two different function-pointer types for the two
different kinds of functions:
- reads arbitrary pixel format and writes to rgba_u16
- reads rgba_u16 and writes to arbitrary pixel format

This will prevent any mistakes in accidentally using the wrong kind of
function. If you also have the argument order different between the two
types of functions, getting them mixed up is even less likely. I
presume the kernel uses the function(destination, source) style of
argument ordering. You can also use 'const' on the source, that is a
good way to document things too.

The consequence of using the wrong function could be the leak of kernel
memory content to userspace, which is pretty bad. So preventing that
kind of problems before they happen is nice.

> +
> +format_transform_func get_fmt_transform_function(u32 format);
> +
> +format_transform_func get_wb_fmt_transform_function(u32 format);
> +
> +#endif /* _VKMS_FORMATS_H_ */


Good work!


Thanks,
pq

--Sig_/428V+hclK_zi9jP.27qmI1i
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIE3PUACgkQI1/ltBGq
qqdacBAAl8nwNpCcxV3clRtoT74tpTzHtJoyGsFVj+KJlYgIvWjxGQ7lhkH4d4kv
jhJe6SzhnoWpbUZ6lBTTRneGJXJTxo8UqY8Y29iNJMTnQ2+oySrM3+awv/CeoYpM
1ytL2dLFQ6LaDZClvQyJPO/UvRdpbzXmi56xQ18sV6jDWGBi1xONX3t5SqE0LBPs
/ZC4qIVCufPfGhJ1poUhMd2WawMqOeewoKhBioO+A9IXmsKkO8X0uR2cnQlAGYnk
gxtb19tJMgWunuh4czSgmZc5+f5QOQtDeYuBHLQ536uBUxhEluQAn+xrGHjqrZns
tH2V1HKOxlX0H6iEOZLs/AHeWzbS51D5RvoypEcq3YIV+0CerwQotlJuQmSu+8ny
iTHUqLO1K9bNvocrCiYtgS5D2EJ6qJ/DX3IJj5iPnCVgw60XlSGO+AYCoSjjemGL
lumFbZ3lYwmJlduZnZzJvPPDvRXlSFtQ9M/PXytjgXVMbfIfjRKzYfHdemS/Jmyg
vnxFVaXaE4t2Ueead53sD2Fo+ctIu4CohDx7/TOUTPQfFj0YyxVAQqBzM8IZ6YkO
Z2I7f2W5mW8I+luqoZk9E/DjNoyDGKSAEn9SQ8/7AlAAXgI7/6/2WBmIKNzGg+8P
m/obEuTkrFM9c3KVSgNCQFochBpUxG+ntMDQfPsbFI1WrZ1bZv8=
=OQLO
-----END PGP SIGNATURE-----

--Sig_/428V+hclK_zi9jP.27qmI1i--
