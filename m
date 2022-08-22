Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B29A59C7BF
	for <lists+dri-devel@lfdr.de>; Mon, 22 Aug 2022 21:01:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B19C29FB7E;
	Mon, 22 Aug 2022 19:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38ADB9FB42
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Aug 2022 19:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TpMIHGfMtQ4/9p+irds46SJoV773U2bWWuY3Sfs87t4=; b=auEBFl/gI+bljnG11JN6e/Z/qm
 zGD+pena8vwUR12mhbGDAI1lj5uiYcVRX//TYNAWz0QZpZEFScw1tN+lnHpy9tyMI6i1hc/MDcEac
 ZxhFoaH7uEAHTCvOu+LQWBj8R88d1MN44TDjDnDWIsaY2/x5RaCzar8GVt5RZ0BLHayWKOvRwwtp+
 o+qgdcGf3RoaYmtFK8Icq5ClV9hcs4FmjXQnoR/24CGTybB1IsyvEBX153R8C4Oy/DeMSn6GMkQNO
 ESv01T8uKLOkuwOzzPD0frEGjiKUJKTIj/yg3yVQwh0VznhRkeuippcPcClqkdpT2yuoRa+z48tbS
 NJMVvJMA==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oQCfu-00Fbml-O9; Mon, 22 Aug 2022 21:01:27 +0200
Date: Mon, 22 Aug 2022 18:01:10 -0100
From: Melissa Wen <mwen@igalia.com>
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
Subject: Re: [RESEND v6 6/9] drm: vkms: Refactor the plane composer to accept
 new formats
Message-ID: <20220822190110.u4evrujigrrcp3ud@mail.igalia.com>
References: <20220819182411.20246-1-igormtorrente@gmail.com>
 <20220819182411.20246-7-igormtorrente@gmail.com>
 <20220820105046.cittsquvjvenw54z@mail.igalia.com>
 <b90f2c07-18ad-411f-82ec-914974cf8d2c@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7npcrztneltjteop"
Content-Disposition: inline
In-Reply-To: <b90f2c07-18ad-411f-82ec-914974cf8d2c@gmail.com>
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
Cc: hamohammed.sa@gmail.com, kernel test robot <lkp@intel.com>,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie, tales.aparecida@gmail.com,
 leandro.ribeiro@collabora.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7npcrztneltjteop
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08/22, Igor Matheus Andrade Torrente wrote:
> Hi Melissa,
>=20
> On 8/20/22 07:51, Melissa Wen wrote:
> > On 08/19, Igor Torrente wrote:
> > > Currently the blend function only accepts XRGB_8888 and ARGB_8888
> > > as a color input.
> > >=20
> > > This patch refactors all the functions related to the plane compositi=
on
> > > to overcome this limitation.
> > >=20
> > > The pixels blend is done using the new internal format. And new handl=
ers
> > > are being added to convert a specific format to/from this internal fo=
rmat.
> > >=20
> > > So the blend operation depends on these handlers to convert to this c=
ommon
> > > format. The blended result, if necessary, is converted to the writeba=
ck
> > > buffer format.
> > >=20
> > > This patch introduces three major differences to the blend function.
> > > 1 - All the planes are blended at once.
> > > 2 - The blend calculus is done as per line instead of per pixel.
> > > 3 - It is responsible to calculates the CRC and writing the writeback
> > > buffer(if necessary).
> > >=20
> > > These changes allow us to allocate way less memory in the intermediate
> > > buffer to compute these operations. Because now we don't need to
> > > have the entire intermediate image lines at once, just one line is
> > > enough.
> > >=20
> > > | Memory consumption (output dimensions) |
> > > |:--------------------------------------:|
> > > |       Current      |     This patch    |
> > > |:------------------:|:-----------------:|
> > > |   Width * Heigth   |     2 * Width     |
> > >=20
> > > Beyond memory, we also have a minor performance benefit from all
> > > these changes. Results running the IGT[1] test
> > > `igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen` ten times:
> > >=20
> > > |                 Frametime                  |
> > > |:------------------------------------------:|
> > > |  Implementation |  Current  |  This commit |
> > > |:---------------:|:---------:|:------------:|
> > > | frametime range |  9~22 ms  |    5~17 ms   |
> > > |     Average     |  11.4 ms  |    7.8 ms    |
> > >=20
> > > [1] IGT commit id: bc3f6833a12221a46659535dac06ebb312490eb4
> > >=20
> > > V2: Improves the performance drastically, by performing the operations
> > >      per-line and not per-pixel(Pekka Paalanen).
> > >      Minor improvements(Pekka Paalanen).
> > > V3: Changes the code to blend the planes all at once. This improves
> > >      performance, memory consumption, and removes much of the weirdne=
ss
> > >      of the V2(Pekka Paalanen and me).
> > >      Minor improvements(Pekka Paalanen and me).
> > > V4: Rebase the code and adapt it to the new NUM_OVERLAY_PLANES consta=
nt.
> > > V5: Minor checkpatch fixes and the removal of TO-DO item(Melissa Wen).
> > >      Several security/robustness improvents(Pekka Paalanen).
> > >      Removes check_planes_x_bounds function and allows partial
> > >      partly off-screen(Pekka Paalanen).
> > > V6: Fix a mismatch of some variable sizes (Pekka Paalanen).
> > >      Several minor improvements (Pekka Paalanen).
> > >=20
> > > Reported-by: kernel test robot <lkp@intel.com>
> > > Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> > > ---
> > >   Documentation/gpu/vkms.rst            |   4 -
> > >   drivers/gpu/drm/vkms/Makefile         |   1 +
> > >   drivers/gpu/drm/vkms/vkms_composer.c  | 320 ++++++++++++-----------=
---
> > >   drivers/gpu/drm/vkms/vkms_formats.c   | 155 +++++++++++++
> > >   drivers/gpu/drm/vkms/vkms_formats.h   |  12 +
> > >   drivers/gpu/drm/vkms/vkms_plane.c     |   3 +
> > >   drivers/gpu/drm/vkms/vkms_writeback.c |   3 +
> > >   7 files changed, 317 insertions(+), 181 deletions(-)
> > >   create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
> > >   create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
> > >=20
> > > diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> > > index 973e2d43108b..a49e4ae92653 100644
> > > --- a/Documentation/gpu/vkms.rst
> > > +++ b/Documentation/gpu/vkms.rst
> > > @@ -118,10 +118,6 @@ Add Plane Features
> > >   There's lots of plane features we could add support for:
> > > -- Clearing primary plane: clear primary plane before plane compositi=
on (at the
> > > -  start) for correctness of pixel blend ops. It also guarantees alph=
a channel
> > > -  is cleared in the target buffer for stable crc. [Good to get start=
ed]
> > > -
> > >   - ARGB format on primary plane: blend the primary plane into backgr=
ound with
> > >     translucent alpha.
> > > diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Mak=
efile
> > > index 72f779cbfedd..1b28a6a32948 100644
> > > --- a/drivers/gpu/drm/vkms/Makefile
> > > +++ b/drivers/gpu/drm/vkms/Makefile
> > > @@ -3,6 +3,7 @@ vkms-y :=3D \
> > >   	vkms_drv.o \
> > >   	vkms_plane.o \
> > >   	vkms_output.o \
> > > +	vkms_formats.o \
> > >   	vkms_crtc.o \
> > >   	vkms_composer.o \
> > >   	vkms_writeback.o
> > > diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/v=
kms/vkms_composer.c
> > > index b9fb408e8973..5b1a8bdd8268 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_composer.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> > > @@ -7,204 +7,188 @@
> > >   #include <drm/drm_fourcc.h>
> > >   #include <drm/drm_gem_framebuffer_helper.h>
> > >   #include <drm/drm_vblank.h>
> > > +#include <linux/minmax.h>
> > >   #include "vkms_drv.h"
> > > -static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
> > > -				 const struct vkms_frame_info *frame_info)
> > > +static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
> > >   {
> > > -	u32 pixel;
> > > -	int src_offset =3D frame_info->offset + (y * frame_info->pitch)
> > > -					    + (x * frame_info->cpp);
> > > +	u32 new_color;
> > > -	pixel =3D *(u32 *)&buffer[src_offset];
> > > +	new_color =3D (src * 0xffff + dst * (0xffff - alpha));
> > > -	return pixel;
> > > +	return DIV_ROUND_CLOSEST(new_color, 0xffff);
> > >   }
> > >   /**
> > > - * compute_crc - Compute CRC value on output frame
> > > + * pre_mul_alpha_blend - alpha blending equation
> > > + * @src_frame_info: source framebuffer's metadata
> > > + * @stage_buffer: The line with the pixels from src_plane
> > > + * @output_buffer: A line buffer that receives all the blends output
> > >    *
> > > - * @vaddr: address to final framebuffer
> > > - * @frame_info: framebuffer's metadata
> > > + * Using the information from the `frame_info`, this blends only the
> > > + * necessary pixels from the `stage_buffer` to the `output_buffer`
> > > + * using premultiplied blend formula.
> > >    *
> > > - * returns CRC value computed using crc32 on the visible portion of
> > > - * the final framebuffer at vaddr_out
> > > + * The current DRM assumption is that pixel color values have been a=
lready
> > > + * pre-multiplied with the alpha channel values. See more
> > > + * drm_plane_create_blend_mode_property(). Also, this formula assume=
s a
> > > + * completely opaque background.
> > >    */
> > > -static uint32_t compute_crc(const u8 *vaddr,
> > > -			    const struct vkms_frame_info *frame_info)
> > > +static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
> > > +				struct line_buffer *stage_buffer,
> > > +				struct line_buffer *output_buffer)
> > >   {
> > > -	int x, y;
> > > -	u32 crc =3D 0, pixel =3D 0;
> > > -	int x_src =3D frame_info->src.x1 >> 16;
> > > -	int y_src =3D frame_info->src.y1 >> 16;
> > > -	int h_src =3D drm_rect_height(&frame_info->src) >> 16;
> > > -	int w_src =3D drm_rect_width(&frame_info->src) >> 16;
> > > -
> > > -	for (y =3D y_src; y < y_src + h_src; ++y) {
> > > -		for (x =3D x_src; x < x_src + w_src; ++x) {
> > > -			pixel =3D get_pixel_from_buffer(x, y, vaddr, frame_info);
> > > -			crc =3D crc32_le(crc, (void *)&pixel, sizeof(u32));
> > > -		}
> > > +	int x_dst =3D frame_info->dst.x1;
> > > +	struct pixel_argb_u16 *out =3D output_buffer->pixels + x_dst;
> > > +	struct pixel_argb_u16 *in =3D stage_buffer->pixels;
> > > +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> > > +			    stage_buffer->n_pixels);
> > > +
> > > +	for (int x =3D 0; x < x_limit; x++) {
> > > +		out[x].a =3D (u16)0xffff;
> > > +		out[x].r =3D pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
> > > +		out[x].g =3D pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
> > > +		out[x].b =3D pre_mul_blend_channel(in[x].b, out[x].b, in[x].a);
> > >   	}
> > > -
> > > -	return crc;
> > >   }
> > > -static u8 blend_channel(u8 src, u8 dst, u8 alpha)
> > > +static bool check_y_limit(struct vkms_frame_info *frame_info, int y)
> > >   {
> > > -	u32 pre_blend;
> > > -	u8 new_color;
> > > -
> > > -	pre_blend =3D (src * 255 + dst * (255 - alpha));
> > > -
> > > -	/* Faster div by 255 */
> > > -	new_color =3D ((pre_blend + ((pre_blend + 257) >> 8)) >> 8);
> > > +	if (y >=3D frame_info->dst.y1 && y < frame_info->dst.y2)
> > > +		return true;
> > > -	return new_color;
> > > +	return false;
> > >   }
> > >   /**
> > > - * alpha_blend - alpha blending equation
> > > - * @argb_src: src pixel on premultiplied alpha mode
> > > - * @argb_dst: dst pixel completely opaque
> > > + * @wb_frame_info: The writeback frame buffer metadata
> > > + * @crtc_state: The crtc state
> > > + * @crc32: The crc output of the final frame
> > > + * @output_buffer: A buffer of a row that will receive the result of=
 the blend(s)
> > > + * @stage_buffer: The line with the pixels from plane being blend to=
 the output
> > >    *
> > > - * blend pixels using premultiplied blend formula. The current DRM a=
ssumption
> > > - * is that pixel color values have been already pre-multiplied with =
the alpha
> > > - * channel values. See more drm_plane_create_blend_mode_property(). =
Also, this
> > > - * formula assumes a completely opaque background.
> > > + * This function blends the pixels (Using the `pre_mul_alpha_blend`)
> > > + * from all planes, calculates the crc32 of the output from the form=
er step,
> > > + * and, if necessary, convert and store the output to the writeback =
buffer.
> > >    */
> > > -static void alpha_blend(const u8 *argb_src, u8 *argb_dst)
> > > +static void blend(struct vkms_writeback_job *wb,
> > > +		  struct vkms_crtc_state *crtc_state,
> > > +		  u32 *crc32, struct line_buffer *stage_buffer,
> > > +		  struct line_buffer *output_buffer, size_t row_size)
> > >   {
> > > -	u8 alpha;
> > > +	struct vkms_plane_state **plane =3D crtc_state->active_planes;
> > > +	struct vkms_frame_info *primary_plane_info =3D plane[0]->frame_info;
> > > +	u32 n_active_planes =3D crtc_state->num_active_planes;
> > > +
> > > +	int y_dst =3D primary_plane_info->dst.y1;
> > > +	int h_dst =3D drm_rect_height(&primary_plane_info->dst);
> > > +	int y_limit =3D y_dst + h_dst;
> > > +
> > > +	for (size_t y =3D y_dst; y < y_limit; y++) {
> > > +		plane[0]->plane_read(output_buffer, primary_plane_info, y);
> > > +
> > > +		/* If there are other planes besides primary, we consider the acti=
ve
> > > +		 * planes should be in z-order and compose them associatively:
> > > +		 * ((primary <- overlay) <- cursor)
> > > +		 */
> > > +		for (size_t i =3D 1; i < n_active_planes; i++) {
> > > +			if (!check_y_limit(plane[i]->frame_info, y))
> > > +				continue;
> > > +
> > > +			plane[i]->plane_read(stage_buffer, plane[i]->frame_info, y);
> > > +			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
> > > +					    output_buffer);
> > > +		}
> > > +
> > > +		*crc32 =3D crc32_le(*crc32, (void *)output_buffer->pixels, row_siz=
e);
> > > -	alpha =3D argb_src[3];
> > > -	argb_dst[0] =3D blend_channel(argb_src[0], argb_dst[0], alpha);
> > > -	argb_dst[1] =3D blend_channel(argb_src[1], argb_dst[1], alpha);
> > > -	argb_dst[2] =3D blend_channel(argb_src[2], argb_dst[2], alpha);
> > > +		if (wb)
> > > +			wb->wb_write(&wb->wb_frame_info, output_buffer, y);
> > > +	}
> > >   }
> > > -/**
> > > - * x_blend - blending equation that ignores the pixel alpha
> > > - *
> > > - * overwrites RGB color value from src pixel to dst pixel.
> > > - */
> > > -static void x_blend(const u8 *xrgb_src, u8 *xrgb_dst)
> > > +static int check_format_funcs(struct vkms_crtc_state *crtc_state,
> > > +			      struct vkms_writeback_job *active_wb)
> > >   {
> > > -	memcpy(xrgb_dst, xrgb_src, sizeof(u8) * 3);
> > > +	struct vkms_plane_state **planes =3D crtc_state->active_planes;
> > > +	u32 n_active_planes =3D crtc_state->num_active_planes;
> > > +
> > > +	for (size_t i =3D 0; i < n_active_planes; i++)
> > > +		if (!planes[i]->plane_read)
> > > +			return -1;
> > > +
> > > +	if (active_wb && !active_wb->wb_write)
> > > +		return -1;
> > > +
> > > +	return 0;
> > >   }
> > > -/**
> > > - * blend - blend value at vaddr_src with value at vaddr_dst
> > > - * @vaddr_dst: destination address
> > > - * @vaddr_src: source address
> > > - * @dst_frame_info: destination framebuffer's metadata
> > > - * @src_frame_info: source framebuffer's metadata
> > > - * @pixel_blend: blending equation based on plane format
> > > - *
> > > - * Blend the vaddr_src value with the vaddr_dst value using a pixel =
blend
> > > - * equation according to the supported plane formats DRM_FORMAT_(A/X=
RGB8888)
> > > - * and clearing alpha channel to an completely opaque background. Th=
is function
> > > - * uses buffer's metadata to locate the new composite values at vadd=
r_dst.
> > > - *
> > > - * TODO: completely clear the primary plane (a =3D 0xff) before star=
ting to blend
> > > - * pixel color values
> > > - */
> > > -static void blend(void *vaddr_dst, void *vaddr_src,
> > > -		  struct vkms_frame_info *dst_frame_info,
> > > -		  struct vkms_frame_info *src_frame_info,
> > > -		  void (*pixel_blend)(const u8 *, u8 *))
> > > +static int compose_active_planes(struct vkms_writeback_job *active_w=
b,
> > > +				 struct vkms_crtc_state *crtc_state,
> > > +				 u32 *crc32)
> > >   {
> > > -	int i, j, j_dst, i_dst;
> > > -	int offset_src, offset_dst;
> > > -	u8 *pixel_dst, *pixel_src;
> > > -
> > > -	int x_src =3D src_frame_info->src.x1 >> 16;
> > > -	int y_src =3D src_frame_info->src.y1 >> 16;
> > > -
> > > -	int x_dst =3D src_frame_info->dst.x1;
> > > -	int y_dst =3D src_frame_info->dst.y1;
> > > -	int h_dst =3D drm_rect_height(&src_frame_info->dst);
> > > -	int w_dst =3D drm_rect_width(&src_frame_info->dst);
> > > -
> > > -	int y_limit =3D y_src + h_dst;
> > > -	int x_limit =3D x_src + w_dst;
> > > -
> > > -	for (i =3D y_src, i_dst =3D y_dst; i < y_limit; ++i) {
> > > -		for (j =3D x_src, j_dst =3D x_dst; j < x_limit; ++j) {
> > > -			offset_dst =3D dst_frame_info->offset
> > > -				     + (i_dst * dst_frame_info->pitch)
> > > -				     + (j_dst++ * dst_frame_info->cpp);
> > > -			offset_src =3D src_frame_info->offset
> > > -				     + (i * src_frame_info->pitch)
> > > -				     + (j * src_frame_info->cpp);
> > > -
> > > -			pixel_src =3D (u8 *)(vaddr_src + offset_src);
> > > -			pixel_dst =3D (u8 *)(vaddr_dst + offset_dst);
> > > -			pixel_blend(pixel_src, pixel_dst);
> > > -			/* clearing alpha channel (0xff)*/
> > > -			pixel_dst[3] =3D 0xff;
> > > -		}
> > > -		i_dst++;
> > > +	size_t line_width, pixel_size =3D sizeof(struct pixel_argb_u16);
> > > +	struct vkms_frame_info *primary_plane_info =3D NULL;
> > > +	struct line_buffer output_buffer, stage_buffer;
> > > +	struct vkms_plane_state *act_plane =3D NULL;
> > > +	int ret =3D 0;
> > > +
> > > +	/*
> > > +	 * This check exists so we can call `crc32_le` for the entire line
> > > +	 * instead doing it for each channel of each pixel in case
> > > +	 * `struct `pixel_argb_u16` had any gap added by the compiler
> > > +	 * between the struct fields.
> > > +	 */
> > > +	static_assert(sizeof(struct pixel_argb_u16) =3D=3D 8);
> > > +
> > > +	if (crtc_state->num_active_planes >=3D 1) {
> > > +		act_plane =3D crtc_state->active_planes[0];
> > > +		if (act_plane->base.base.plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> > > +			primary_plane_info =3D act_plane->frame_info;
> > >   	}
> > > -}
> > > -static void compose_plane(struct vkms_frame_info *primary_plane_info,
> > > -			  struct vkms_frame_info *plane_frame_info,
> > > -			  void *vaddr_out)
> > > -{
> > > -	struct drm_framebuffer *fb =3D plane_frame_info->fb;
> > > -	void *vaddr;
> > > -	void (*pixel_blend)(const u8 *p_src, u8 *p_dst);
> > > +	if (!primary_plane_info)
> > > +		return -EINVAL;
> > >   	if (WARN_ON(iosys_map_is_null(&primary_plane_info->map[0])))
> > > -		return;
> > > +		return -EINVAL;
> > > -	vaddr =3D plane_frame_info->map[0].vaddr;
> > > +	if (WARN_ON(check_format_funcs(crtc_state, active_wb)))
> > > +		return -EINVAL;
> > > -	if (fb->format->format =3D=3D DRM_FORMAT_ARGB8888)
> > > -		pixel_blend =3D &alpha_blend;
> > > -	else
> > > -		pixel_blend =3D &x_blend;
> > > +	line_width =3D drm_rect_width(&primary_plane_info->dst);
> > > +	stage_buffer.n_pixels =3D line_width;
> > > +	output_buffer.n_pixels =3D line_width;
> > > -	blend(vaddr_out, vaddr, primary_plane_info,
> > > -	      plane_frame_info, pixel_blend);
> > > -}
> > > +	stage_buffer.pixels =3D kvmalloc(line_width * pixel_size, GFP_KERNE=
L);
> > > +	if (!stage_buffer.pixels) {
> > > +		DRM_ERROR("Cannot allocate memory for the output line buffer");
> > > +		return -ENOMEM;
> > > +	}
> > > -static int compose_active_planes(void **vaddr_out,
> > > -				 struct vkms_frame_info *primary_plane_info,
> > > -				 struct vkms_crtc_state *crtc_state)
> > > -{
> > > -	struct drm_framebuffer *fb =3D primary_plane_info->fb;
> > > -	struct drm_gem_object *gem_obj =3D drm_gem_fb_get_obj(fb, 0);
> > > -	const void *vaddr;
> > > -	int i;
> > > -
> > > -	if (!*vaddr_out) {
> > > -		*vaddr_out =3D kvzalloc(gem_obj->size, GFP_KERNEL);
> > > -		if (!*vaddr_out) {
> > > -			DRM_ERROR("Cannot allocate memory for output frame.");
> > > -			return -ENOMEM;
> > > -		}
> > > +	output_buffer.pixels =3D kvmalloc(line_width * pixel_size, GFP_KERN=
EL);
> > > +	if (!output_buffer.pixels) {
> > > +		DRM_ERROR("Cannot allocate memory for intermediate line buffer");
> > > +		ret =3D -ENOMEM;
> > > +		goto free_stage_buffer;
> > >   	}
> > > -	if (WARN_ON(iosys_map_is_null(&primary_plane_info->map[0])))
> > > -		return -EINVAL;
> > > +	if (active_wb) {
> > > +		struct vkms_frame_info *wb_frame_info =3D &active_wb->wb_frame_inf=
o;
> > > -	vaddr =3D primary_plane_info->map[0].vaddr;
> > > +		wb_frame_info->src =3D primary_plane_info->src;
> > > +		wb_frame_info->dst =3D primary_plane_info->dst;
> > > +	}
> > > -	memcpy(*vaddr_out, vaddr, gem_obj->size);
> > > +	blend(active_wb, crtc_state, crc32, &stage_buffer,
> > > +	      &output_buffer, line_width * pixel_size);
> > > -	/* If there are other planes besides primary, we consider the active
> > > -	 * planes should be in z-order and compose them associatively:
> > > -	 * ((primary <- overlay) <- cursor)
> > > -	 */
> > > -	for (i =3D 1; i < crtc_state->num_active_planes; i++)
> > > -		compose_plane(primary_plane_info,
> > > -			      crtc_state->active_planes[i]->frame_info,
> > > -			      *vaddr_out);
> > > +	kvfree(output_buffer.pixels);
> > > +free_stage_buffer:
> > > +	kvfree(stage_buffer.pixels);
> > > -	return 0;
> > > +	return ret;
> > >   }
> > >   /**
> > > @@ -222,13 +206,11 @@ void vkms_composer_worker(struct work_struct *w=
ork)
> > >   						struct vkms_crtc_state,
> > >   						composer_work);
> > >   	struct drm_crtc *crtc =3D crtc_state->base.crtc;
> > > +	struct vkms_writeback_job *active_wb =3D crtc_state->active_writeba=
ck;
> > >   	struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
> > > -	struct vkms_frame_info *primary_plane_info =3D NULL;
> > > -	struct vkms_plane_state *act_plane =3D NULL;
> > >   	bool crc_pending, wb_pending;
> > > -	void *vaddr_out =3D NULL;
> > > -	u32 crc32 =3D 0;
> > >   	u64 frame_start, frame_end;
> > > +	u32 crc32 =3D 0;
> > >   	int ret;
> > >   	spin_lock_irq(&out->composer_lock);
> > > @@ -248,35 +230,19 @@ void vkms_composer_worker(struct work_struct *w=
ork)
> > >   	if (!crc_pending)
> > >   		return;
> > > -	if (crtc_state->num_active_planes >=3D 1) {
> > > -		act_plane =3D crtc_state->active_planes[0];
> > > -		if (act_plane->base.base.plane->type =3D=3D DRM_PLANE_TYPE_PRIMARY)
> > > -			primary_plane_info =3D act_plane->frame_info;
> > > -	}
> > > -
> > > -	if (!primary_plane_info)
> > > -		return;
> > > -
> > >   	if (wb_pending)
> > > -		vaddr_out =3D crtc_state->active_writeback->data[0].vaddr;
> > > +		ret =3D compose_active_planes(active_wb, crtc_state, &crc32);
> > > +	else
> > > +		ret =3D compose_active_planes(NULL, crtc_state, &crc32);
> > > -	ret =3D compose_active_planes(&vaddr_out, primary_plane_info,
> > > -				    crtc_state);
> > > -	if (ret) {
> > > -		if (ret =3D=3D -EINVAL && !wb_pending)
> > > -			kvfree(vaddr_out);
> > > +	if (ret)
> > >   		return;
> > > -	}
> > > -
> > > -	crc32 =3D compute_crc(vaddr_out, primary_plane_info);
> > >   	if (wb_pending) {
> > >   		drm_writeback_signal_completion(&out->wb_connector, 0);
> > >   		spin_lock_irq(&out->composer_lock);
> > >   		crtc_state->wb_pending =3D false;
> > >   		spin_unlock_irq(&out->composer_lock);
> > > -	} else {
> > > -		kvfree(vaddr_out);
> > >   	}
> > >   	/*
> > > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vk=
ms/vkms_formats.c
> > > new file mode 100644
> > > index 000000000000..ca4bfcac686b
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > > @@ -0,0 +1,155 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +
> > > +#include <drm/drm_rect.h>
> > > +#include <linux/minmax.h>
> > > +
> > > +#include "vkms_formats.h"
> > > +
> > > +static size_t pixel_offset(const struct vkms_frame_info *frame_info,=
 int x, int y)
> > > +{
> > > +	return frame_info->offset + (y * frame_info->pitch)
> > > +				  + (x * frame_info->cpp);
> > > +}
> > > +
> > > +/*
> > > + * packed_pixels_addr - Get the pointer to pixel of a given pair of =
coordinates
> > > + *
> > > + * @frame_info: Buffer metadata
> > > + * @x: The x(width) coordinate of the 2D buffer
> > > + * @y: The y(Heigth) coordinate of the 2D buffer
> > > + *
> > > + * Takes the information stored in the frame_info, a pair of coordin=
ates, and
> > > + * returns the address of the first color channel.
> > > + * This function assumes the channels are packed together, i.e. a co=
lor channel
> > > + * comes immediately after another in the memory. And therefore, thi=
s function
> > > + * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV2=
1).
> > > + */
> > > +static void *packed_pixels_addr(const struct vkms_frame_info *frame_=
info,
> > > +				int x, int y)
> > > +{
> > > +	size_t offset =3D pixel_offset(frame_info, x, y);
> > > +
> > > +	return (u8 *)frame_info->map[0].vaddr + offset;
> > > +}
> > > +
> > > +static void *get_packed_src_addr(const struct vkms_frame_info *frame=
_info, int y)
> > > +{
> > > +	int x_src =3D frame_info->src.x1 >> 16;
> > > +	int y_src =3D y - frame_info->dst.y1 + (frame_info->src.y1 >> 16);
> > > +
> > > +	return packed_pixels_addr(frame_info, x_src, y_src);
> > > +}
> > > +
> > > +static void ARGB8888_to_argb_u16(struct line_buffer *stage_buffer,
> > > +				 const struct vkms_frame_info *frame_info, int y)
> > > +{
> > > +	struct pixel_argb_u16 *out_pixels =3D stage_buffer->pixels;
> > > +	u8 *src_pixels =3D get_packed_src_addr(frame_info, y);
> > > +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> > > +			    stage_buffer->n_pixels);
> > > +
> > > +	for (size_t x =3D 0; x < x_limit; x++, src_pixels +=3D 4) {
> > > +		/*
> > > +		 * The 257 is the "conversion ratio". This number is obtained by t=
he
> > > +		 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to =
get
> > > +		 * the best color value in a pixel format with more possibilities.
> > > +		 * A similar idea applies to others RGB color conversions.
> > > +		 */
> > > +		out_pixels[x].a =3D (u16)src_pixels[3] * 257;
> > > +		out_pixels[x].r =3D (u16)src_pixels[2] * 257;
> > > +		out_pixels[x].g =3D (u16)src_pixels[1] * 257;
> > > +		out_pixels[x].b =3D (u16)src_pixels[0] * 257;
> > > +	}
> > > +}
> > > +
> > > +static void XRGB8888_to_argb_u16(struct line_buffer *stage_buffer,
> > > +				 const struct vkms_frame_info *frame_info, int y)
> > > +{
> > > +	struct pixel_argb_u16 *out_pixels =3D stage_buffer->pixels;
> > > +	u8 *src_pixels =3D get_packed_src_addr(frame_info, y);
> > > +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> > > +			    stage_buffer->n_pixels);
> > > +
> > > +	for (size_t x =3D 0; x < x_limit; x++, src_pixels +=3D 4) {
> > > +		out_pixels[x].a =3D (u16)0xffff;
> > > +		out_pixels[x].r =3D (u16)src_pixels[2] * 257;
> > > +		out_pixels[x].g =3D (u16)src_pixels[1] * 257;
> > > +		out_pixels[x].b =3D (u16)src_pixels[0] * 257;
> > > +	}
> > > +}
> > > +
> > > +/*
> > > + * The following  functions take an line of argb_u16 pixels from the
> > > + * src_buffer, convert them to a specific format, and store them in =
the
> > > + * destination.
> > > + *
> > > + * They are used in the `compose_active_planes` to convert and store=
 a line
> > > + * from the src_buffer to the writeback buffer.
> > > + */
> > > +static void argb_u16_to_ARGB8888(struct vkms_frame_info *frame_info,
> > > +				 const struct line_buffer *src_buffer, int y)
> > > +{
> > > +	int x_dst =3D frame_info->dst.x1;
> > > +	u8 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
> > > +	struct pixel_argb_u16 *in_pixels =3D src_buffer->pixels;
> > > +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> > > +			    src_buffer->n_pixels);
> > > +
> > > +	for (size_t x =3D 0; x < x_limit; x++, dst_pixels +=3D 4) {
> > > +		/*
> > > +		 * This sequence below is important because the format's byte orde=
r is
> > > +		 * in little-endian. In the case of the ARGB8888 the memory is
> > > +		 * organized this way:
> > > +		 *
> > > +		 * | Addr     | =3D blue channel
> > > +		 * | Addr + 1 | =3D green channel
> > > +		 * | Addr + 2 | =3D Red channel
> > > +		 * | Addr + 3 | =3D Alpha channel
> > > +		 */
> > > +		dst_pixels[3] =3D DIV_ROUND_CLOSEST(in_pixels[x].a, 257);
> > > +		dst_pixels[2] =3D DIV_ROUND_CLOSEST(in_pixels[x].r, 257);
> > > +		dst_pixels[1] =3D DIV_ROUND_CLOSEST(in_pixels[x].g, 257);
> > > +		dst_pixels[0] =3D DIV_ROUND_CLOSEST(in_pixels[x].b, 257);
> > > +	}
> > > +}
> > > +
> > > +static void argb_u16_to_XRGB8888(struct vkms_frame_info *frame_info,
> > > +				 const struct line_buffer *src_buffer, int y)
> > > +{
> > > +	int x_dst =3D frame_info->dst.x1;
> > > +	u8 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
> > > +	struct pixel_argb_u16 *in_pixels =3D src_buffer->pixels;
> > > +	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> > > +			    src_buffer->n_pixels);
> > > +
> > > +	for (size_t x =3D 0; x < x_limit; x++, dst_pixels +=3D 4) {
> > > +		dst_pixels[3] =3D 0xff;
> > > +		dst_pixels[2] =3D DIV_ROUND_CLOSEST(in_pixels[x].r, 257);
> > > +		dst_pixels[1] =3D DIV_ROUND_CLOSEST(in_pixels[x].g, 257);
> > > +		dst_pixels[0] =3D DIV_ROUND_CLOSEST(in_pixels[x].b, 257);
> > > +	}
> > > +}
> > > +
> > > +frame_to_line_func get_frame_to_line_function(u32 format)
> > > +{
> > > +	switch (format) {
> > > +	case DRM_FORMAT_ARGB8888:
> > > +		return &ARGB8888_to_argb_u16;
> > > +	case DRM_FORMAT_XRGB8888:
> > > +		return &XRGB8888_to_argb_u16;
> > > +	default:
> > > +		return NULL;
> > > +	}
> > > +}
> > > +
> > > +line_to_frame_func get_line_to_frame_function(u32 format)
> > > +{
> > > +	switch (format) {
> > > +	case DRM_FORMAT_ARGB8888:
> > > +		return &argb_u16_to_ARGB8888;
> > > +	case DRM_FORMAT_XRGB8888:
> > > +		return &argb_u16_to_XRGB8888;
> > > +	default:
> > > +		return NULL;
> > > +	}
> > > +}
> > > diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vk=
ms/vkms_formats.h
> > > new file mode 100644
> > > index 000000000000..053ca42d5b31
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> > > @@ -0,0 +1,12 @@
> > > +// SPDX-License-Identifier: GPL-2.0+
> > > +
> > > +#ifndef _VKMS_FORMATS_H_
> > > +#define _VKMS_FORMATS_H_
> > > +
> > > +#include "vkms_drv.h"
> > > +
> > > +frame_to_line_func get_frame_to_line_function(u32 format);
> > > +
> > > +line_to_frame_func get_line_to_frame_function(u32 format);
> > > +
> > > +#endif /* _VKMS_FORMATS_H_ */
> > > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms=
/vkms_plane.c
> > > index 8adbfdc05e50..7a479a714565 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > > @@ -10,6 +10,7 @@
> > >   #include <drm/drm_plane_helper.h>
> > >   #include "vkms_drv.h"
> > > +#include "vkms_formats.h"
> > ^ this line no longer applies (needs to rebase), but I can manage it be=
fore apply to drm-misc-next
>=20
> I did the rebase and I hadn't any issues.
>=20
> I'm using `git://anongit.freedesktop.org/drm/drm-misc` remote. Should I be
> using another git remote for vkms?

hmmm... the repository is correct, maybe double check if you are rebase
on top of `drm-misc-next` branch and it is updated.

For reference, I tried to apply your series on top of this commit:
https://cgit.freedesktop.org/drm/drm-misc/commit/?id=3Dee50b00244086453dfb7=
076e4b80214948cd0507

Also, if you compare the line right above the `#include vkms_drv.h` here:
https://cgit.freedesktop.org/drm/drm-misc/tree/drivers/gpu/drm/vkms/vkms_pl=
ane.c#n9
=66rom your diff and the current file, it is not the same.

Can you double check it, please?

Thanks,

Melissa
>=20
> > >   static const u32 vkms_formats[] =3D {
> > >   	DRM_FORMAT_XRGB8888,
> > > @@ -100,6 +101,7 @@ static void vkms_plane_atomic_update(struct drm_p=
lane *plane,
> > >   	struct drm_shadow_plane_state *shadow_plane_state;
> > >   	struct drm_framebuffer *fb =3D new_state->fb;
> > >   	struct vkms_frame_info *frame_info;
> > > +	u32 fmt =3D fb->format->format;
> > >   	if (!new_state->crtc || !fb)
> > >   		return;
> > > @@ -116,6 +118,7 @@ static void vkms_plane_atomic_update(struct drm_p=
lane *plane,
> > >   	frame_info->offset =3D fb->offsets[0];
> > >   	frame_info->pitch =3D fb->pitches[0];
> > >   	frame_info->cpp =3D fb->format->cpp[0];
> > > +	vkms_plane_state->plane_read =3D get_frame_to_line_function(fmt);
> > >   }
> > >   static int vkms_plane_atomic_check(struct drm_plane *plane,
> > > diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/=
vkms/vkms_writeback.c
> > > index c87f6c89e7b4..d2aabb52cb46 100644
> > > --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> > > +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> > > @@ -11,6 +11,7 @@
> > >   #include <drm/drm_gem_shmem_helper.h>
> > >   #include "vkms_drv.h"
> > > +#include "vkms_formats.h"
> > >   static const u32 vkms_wb_formats[] =3D {
> > >   	DRM_FORMAT_XRGB8888,
> > > @@ -123,6 +124,7 @@ static void vkms_wb_atomic_commit(struct drm_conn=
ector *conn,
> > >   	struct drm_framebuffer *fb =3D connector_state->writeback_job->fb;
> > >   	struct vkms_writeback_job *active_wb;
> > >   	struct vkms_frame_info *wb_frame_info;
> > > +	u32 wb_format =3D fb->format->format;
> > >   	if (!conn_state)
> > >   		return;
> > > @@ -140,6 +142,7 @@ static void vkms_wb_atomic_commit(struct drm_conn=
ector *conn,
> > >   	crtc_state->wb_pending =3D true;
> > >   	spin_unlock_irq(&output->composer_lock);
> > >   	drm_writeback_queue_job(wb_conn, connector_state);
> > > +	active_wb->wb_write =3D get_line_to_frame_function(wb_format);
> > >   }
> > >   static const struct drm_connector_helper_funcs vkms_wb_conn_helper_=
funcs =3D {
> > > --=20
> > > 2.30.2
> > >=20
>=20

--7npcrztneltjteop
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmMD0nIACgkQwqF3j0dL
ehwmvA/6ApN58hTFyfLrJtrgIU2xO/ufiLramRpmk5/nnRF1qF7i0wewuENfl5JM
em1CteDJbO1T6qxHHq92YOzAFa5XT7CsiPIA5ILfrlAHmHsZtVwCwP8a+BTEg3MQ
2ZFNJHKw88mm92aUKkGdEOOnvg9CHjsYDWUSXNewfJtBNIVxUnR00WCDVIoMbr7U
4EegbxbPLPCaINEN2llYM63HHdTXQlY63SxxE1fieBpH9J4IIEv6BSBLcCUBwha+
cpdCaN08CfaeJed26dZT/lq3P1mJBdjUC1ZKl1cSooEymeyeKZOvShwWY2/dA/YJ
FcIiZCV2yNe/tP0r+RpRSRO1P7cSVTZXBqG5kWVswuV0Pk9QUg+OI28Uy5Wal1e4
V2EvKbvK8Wa4TRF4oxirS9tnhdPV0OZcZEYlqw0sI/+GSEp8m3Kr/SeUIVOz6Mi9
NPwb3m2y/u4YOOkQVXolBt7ValAfTYB2qX0XQQmoB1HZiMTrcJK7zC1BZOizZebs
Bp6dWg+lCfi/wpftLRzd47iZ3v7795o22jcapWV1kiWXgY4t+rOQBa3xIoZXIp0e
vJ77N2s0pWrGF17tBKFycAFXO8+0qn6qPD+oo7qYQEm/1BrP43/U4zwiK0zJ/qBp
qNu4gAiUXGooTSttqqfpBOnzWl0dqWpvbcoQoIUfsi3hz8K+x8E=
=P91d
-----END PGP SIGNATURE-----

--7npcrztneltjteop--
