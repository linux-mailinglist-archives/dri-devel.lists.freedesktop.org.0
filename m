Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FF3889FD1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 13:40:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7232910E51A;
	Mon, 25 Mar 2024 12:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="iC/FFX1z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C9410E52A
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 12:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1711370445;
 bh=WxTNIhNLjDRo1heayNla3pAiG49aljhTjEn0KCy534U=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iC/FFX1zp6cgiJXJwHQRQfzil4l4TbxzZiSXUL4xc/AS2fE5AaE74lkQ8pZQ5t6XA
 q3yzzcCPQVyWFrdZNpPc1cgZPSmxUShWCTKjmAGJM4RNMzH5ta27ldckJyTjGJ4yBo
 wJvhFIg6dLCHqO5VNY0ImBnkVN4L89zme7XdUywkAS/dB2R1KBvRfPSqUT5D1KIw4F
 MLRLBl1drDnLwJXGIDca27LuKLoPcI6nrBt/KdkZRvChbiFaGofo80jZnALBfdsjD9
 uM2KIO4E/1JSrbA/mdqaK0EmEmqe/du1dm96hqhFx1oJdFFlrEW+ugsFKKz0CHt12W
 H25rskVfWhFTg==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8E36E3782046;
 Mon, 25 Mar 2024 12:40:44 +0000 (UTC)
Date: Mon, 25 Mar 2024 14:40:43 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com,
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com,
 nicolejadeyee@google.com
Subject: Re: [PATCH v5 07/16] drm/vkms: Update pixels accessor to support
 packed and multi-plane formats.
Message-ID: <20240325144043.77a42acb.pekka.paalanen@collabora.com>
In-Reply-To: <20240313-yuv-v5-7-e610cbd03f52@bootlin.com>
References: <20240313-yuv-v5-0-e610cbd03f52@bootlin.com>
 <20240313-yuv-v5-7-e610cbd03f52@bootlin.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GWLkZPlmZ5gvPRNihFHLUD/";
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/GWLkZPlmZ5gvPRNihFHLUD/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Mar 2024 18:45:01 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Introduce the usage of block_h/block_w to compute the offset and the
> pointer of a pixel. The previous implementation was specialized for
> planes with block_h =3D=3D block_w =3D=3D 1. To avoid confusion and allow=
 easier
> implementation of tiled formats. It also remove the usage of the
> deprecated format field `cpp`.
>=20
> Introduce the plane_index parameter to get an offset/pointer on a
> different plane.
>=20
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>  drivers/gpu/drm/vkms/vkms_formats.c | 76 +++++++++++++++++++++++++------=
------
>  1 file changed, 52 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index b2f8dfc26c35..649d75d05b1f 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -10,23 +10,43 @@
>  #include "vkms_formats.h"
> =20
>  /**
> - * pixel_offset() - Get the offset of the pixel at coordinates x/y in th=
e first plane
> + * packed_pixels_offset() - Get the offset of the block containing the p=
ixel at coordinates x/y
>   *
>   * @frame_info: Buffer metadata
>   * @x: The x coordinate of the wanted pixel in the buffer
>   * @y: The y coordinate of the wanted pixel in the buffer
> + * @plane_index: The index of the plane to use
> + * @offset: The returned offset inside the buffer of the block
> + * @rem_x,@rem_y: The returned coordinate of the requested pixel in the =
block
>   *
> - * The caller must ensure that the framebuffer associated with this requ=
est uses a pixel format
> - * where block_h =3D=3D block_w =3D=3D 1.
> - * If this requirement is not fulfilled, the resulting offset can point =
to an other pixel or
> - * outside of the buffer.
> + * As some pixel formats store multiple pixels in a block (DRM_FORMAT_R*=
 for example), some
> + * pixels are not individually addressable. This function return 3 value=
s: the offset of the
> + * whole block, and the coordinate of the requested pixel inside this bl=
ock.
> + * For example, if the format is DRM_FORMAT_R1 and the requested coordin=
ate is 13,5, the offset
> + * will point to the byte 5*pitches + 13/8 (second byte of the 5th line)=
, and the rem_x/rem_y
> + * coordinates will be (13 % 8, 5 % 1) =3D (5, 0)
> + *
> + * With this function, the caller just have to extract the correct pixel=
 from the block.
>   */
> -static size_t pixel_offset(const struct vkms_frame_info *frame_info, int=
 x, int y)
> +static void packed_pixels_offset(const struct vkms_frame_info *frame_inf=
o, int x, int y,
> +				 int plane_index, int *offset, int *rem_x, int *rem_y)
>  {
>  	struct drm_framebuffer *fb =3D frame_info->fb;
> +	const struct drm_format_info *format =3D frame_info->fb->format;
> +	/* Directly using x and y to multiply pitches and format->ccp is not su=
fficient because
> +	 * in some formats a block can represent multiple pixels.
> +	 *
> +	 * Dividing x and y by the block size allows to extract the correct off=
set of the block
> +	 * containing the pixel.
> +	 */
> =20
> -	return fb->offsets[0] + (y * fb->pitches[0])
> -			      + (x * fb->format->cpp[0]);
> +	int block_x =3D x / drm_format_info_block_width(format, plane_index);
> +	int block_y =3D y / drm_format_info_block_height(format, plane_index);
> +	*rem_x =3D x % drm_format_info_block_width(format, plane_index);
> +	*rem_y =3D x % drm_format_info_block_height(format, plane_index);

typo: x should be y


> +	*offset =3D fb->offsets[plane_index] +
> +		  block_y * fb->pitches[plane_index] +
> +		  block_x * format->char_per_block[plane_index];
>  }

Ok, this function looks very much plausible for handling blocky
formats. Good.

> =20
>  /**
> @@ -36,30 +56,35 @@ static size_t pixel_offset(const struct vkms_frame_in=
fo *frame_info, int x, int
>   * @frame_info: Buffer metadata
>   * @x: The x(width) coordinate inside the plane
>   * @y: The y(height) coordinate inside the plane
> + * @plane_index: The index of the plane
> + * @addr: The returned pointer
> + * @rem_x,@rem_y: The returned coordinate of the requested pixel in the =
block
>   *
> - * Takes the information stored in the frame_info, a pair of coordinates=
, and
> - * returns the address of the first color channel.
> - * This function assumes the channels are packed together, i.e. a color =
channel
> - * comes immediately after another in the memory. And therefore, this fu=
nction
> - * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21).
> + * Takes the information stored in the frame_info, a pair of coordinates=
, and returns the address
> + * of the block containing this pixel and the pixel position inside this=
 block.
>   *
> - * The caller must ensure that the framebuffer associated with this requ=
est uses a pixel format
> - * where block_h =3D=3D block_w =3D=3D 1, otherwise the returned pointer=
 can be outside the buffer.
> + * See @packed_pixel_offset for details about rem_x/rem_y behavior.
>   */
> -static void *packed_pixels_addr(const struct vkms_frame_info *frame_info,
> -				int x, int y)
> +static void packed_pixels_addr(const struct vkms_frame_info *frame_info,
> +			       int x, int y, int plane_index, u8 **addr, int *rem_x,
> +			       int *rem_y)
>  {
> -	size_t offset =3D pixel_offset(frame_info, x, y);
> +	int offset;
> =20
> -	return (u8 *)frame_info->map[0].vaddr + offset;
> +	packed_pixels_offset(frame_info, x, y, plane_index, &offset, rem_x, rem=
_y);
> +	*addr =3D (u8 *)frame_info->map[0].vaddr + offset;
>  }
> =20
> -static void *get_packed_src_addr(const struct vkms_frame_info *frame_inf=
o, int y)
> +static void *get_packed_src_addr(const struct vkms_frame_info *frame_inf=
o, int y,
> +				 int plane_index)
>  {
>  	int x_src =3D frame_info->src.x1 >> 16;
>  	int y_src =3D y - frame_info->rotated.y1 + (frame_info->src.y1 >> 16);
> +	u8 *addr;
> +	int rem_x, rem_y;
> =20
> -	return packed_pixels_addr(frame_info, x_src, y_src);
> +	packed_pixels_addr(frame_info, x_src, y_src, plane_index, &addr, &rem_x=
, &rem_y);

How can the caller be not interested in rem_x, rem_y?

Maybe there is no IGT test that uses DRM_FORMAT_R1 FB on a plane and
has a source rectangle whose x is not divisible by 8 pixels?
Or maybe the FB is filled with a solid color instead of a pattern that
would show source rectangle positioning problems?

Maybe at this point of the series, this should assert that rem_x and
rem_y are zero? That's what vkms_compose_row() assumes, right?


Thanks,
pq

> +	return addr;
>  }
> =20
>  static int get_x_position(const struct vkms_frame_info *frame_info, int =
limit, int x)
> @@ -168,14 +193,14 @@ void vkms_compose_row(struct line_buffer *stage_buf=
fer, struct vkms_plane_state
>  {
>  	struct pixel_argb_u16 *out_pixels =3D stage_buffer->pixels;
>  	struct vkms_frame_info *frame_info =3D plane->frame_info;
> -	u8 *src_pixels =3D get_packed_src_addr(frame_info, y);
> +	u8 *src_pixels =3D get_packed_src_addr(frame_info, y, 0);
>  	int limit =3D min_t(size_t, drm_rect_width(&frame_info->dst), stage_buf=
fer->n_pixels);
> =20
>  	for (size_t x =3D 0; x < limit; x++, src_pixels +=3D frame_info->fb->fo=
rmat->cpp[0]) {
>  		int x_pos =3D get_x_position(frame_info, limit, x);
> =20
>  		if (drm_rotation_90_or_270(frame_info->rotation))
> -			src_pixels =3D get_packed_src_addr(frame_info, x + frame_info->rotate=
d.y1)
> +			src_pixels =3D get_packed_src_addr(frame_info, x + frame_info->rotate=
d.y1, 0)
>  				+ frame_info->fb->format->cpp[0] * y;
> =20
>  		plane->pixel_read(src_pixels, &out_pixels[x_pos]);
> @@ -276,7 +301,10 @@ void vkms_writeback_row(struct vkms_writeback_job *w=
b,
>  {
>  	struct vkms_frame_info *frame_info =3D &wb->wb_frame_info;
>  	int x_dst =3D frame_info->dst.x1;
> -	u8 *dst_pixels =3D packed_pixels_addr(frame_info, x_dst, y);
> +	u8 *dst_pixels;
> +	int rem_x, rem_y;
> +
> +	packed_pixels_addr(frame_info, x_dst, y, 0, &dst_pixels, &rem_x, &rem_y=
);
>  	struct pixel_argb_u16 *in_pixels =3D src_buffer->pixels;
>  	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst), src_buf=
fer->n_pixels);
> =20
>=20


--Sig_/GWLkZPlmZ5gvPRNihFHLUD/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmYBcMsACgkQI1/ltBGq
qqdQuw//e9FgvoYRovO+ena1Rcqwa+AKzu0+DqZHPlkInlZ+Qpbl09FiSTleotVb
tSSkj0aNhatqDFcpNPzYR2mrE/NLbnsH9XdjQSFKQVnpUTFYd1KYPKorvZxknmUs
+HHrNwhomeNwfoLY+80ZfU9ck1FI4DBYtftnad/t0FpOOIrTtBTU1tF5nE9/MXk4
vrwwZ743Jpizu7Edv7FxO4g+3mYgVhgCHCp0d5FCBXJiXDaqM6surxFgqZidUMQW
B3W1afkR0hDu00/mxCI3EbT+vZCquu1qOiUbGHm6c6KGpFyas0FXvC5BkA7NWlT0
V9Tdlq6yat792ci+Vck5EQAeFm+P7xKoLxvYWpVfF+EJMvCP6+UfI4oM7qBcRA30
sT/VbYiJO4oUx/Z+JCcCAMXzDLohIusGmNH6ArUwLiq9zzJe3IVcurGN1LykbXlr
wA5jQzYmUPqotJi+2pyD3iUgFGGXhIO2NxKAiEJGQ1Iu1DjcERB6IIxgAMRGU30q
avfoMtMX4Yn2YQOfmKkS3kdcSR6IC8ttDwcVJKldCIG2jm+kqqtQvMxD9EyNbTUI
BXCWs5AGiODBme62Bvs+lBI0S5N20nKXpUNBwuUXxzv2ZyMd4wpsbX6AoMSLw16M
lLcOJj8jhLaJibsq2Kre4+9Rdr4Z/nB+PIdj4avw79WEIieQsts=
=wgBZ
-----END PGP SIGNATURE-----

--Sig_/GWLkZPlmZ5gvPRNihFHLUD/--
