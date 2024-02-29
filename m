Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046E886C8EA
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 13:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDFA10E212;
	Thu, 29 Feb 2024 12:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="iP9T+HAM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A45B10E1DF
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 12:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709208768;
 bh=vX7w3GK4U6Ne7FTquMI/vNH/sF6ZqHuZXnTGrG9f4Js=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iP9T+HAMeIl/UOfMkUQPlThXvnNi6N0kK8Cpx/2w3UsvxuiirM6AnMFAxrZ10WCqX
 cCvr7RdXXJmGvhLsyTtUxf9V51pWqHZzSDXeEz1LgRT7iDzzDX5j268XtuLoowr7GM
 R25QJOIoDxOS64Ik3w8opd8fI7HfXg1Odhw/uux7ZCyaINULDFhdK7BfJOPVjqKnQm
 S4QkHNSLoa5xIZ4ImaMW8GNPvbVJ7IYVWr+VV/9nd4j7QaVOd3tgqbT52lcdJBBSsN
 0ZPBPa3htp3teyAReWnLXCu78QWoI1jGJkkjd5jqK0ZRnkRYWk/L5SfU5dphFGCL+q
 OAI7KqZiEX4Og==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id F41D037820E2;
 Thu, 29 Feb 2024 12:12:46 +0000 (UTC)
Date: Thu, 29 Feb 2024 14:12:38 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Arthur Grillo <arthurgrillo@riseup.net>, Louis Chauvet
 <louis.chauvet@bootlin.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mairacanal@riseup.net>, Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v2 6/9] drm/vkms: Add YUV support
Message-ID: <20240229141238.51891cad.pekka.paalanen@collabora.com>
In-Reply-To: <8fc07f0f-f14d-4878-9884-2bc4b4c6f426@riseup.net>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-6-aa6be2827bb7@bootlin.com>
 <20240226141916.1627bbbd.pekka.paalanen@collabora.com>
 <Zd35c_CJbhY46TjQ@localhost.localdomain>
 <b23da076-0bfb-48b2-9386-383a6dec1868@riseup.net>
 <8fc07f0f-f14d-4878-9884-2bc4b4c6f426@riseup.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/WR3ByqJEAt6f5+lYdW.21IQ";
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

--Sig_/WR3ByqJEAt6f5+lYdW.21IQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 28 Feb 2024 22:52:09 -0300
Arthur Grillo <arthurgrillo@riseup.net> wrote:

> On 27/02/24 17:01, Arthur Grillo wrote:
> >=20
> >=20
> > On 27/02/24 12:02, Louis Chauvet wrote: =20
> >> Hi Pekka,
> >>
> >> For all the comment related to the conversion part, maybe Arthur have =
an=20
> >> opinion on it, I took his patch as a "black box" (I did not want to=20
> >> break (and debug) it).
> >>
> >> Le 26/02/24 - 14:19, Pekka Paalanen a =C3=A9crit : =20
> >>> On Fri, 23 Feb 2024 12:37:26 +0100
> >>> Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> >>> =20
> >>>> From: Arthur Grillo <arthurgrillo@riseup.net>
> >>>>
> >>>> Add support to the YUV formats bellow:
> >>>>
> >>>> - NV12
> >>>> - NV16
> >>>> - NV24
> >>>> - NV21
> >>>> - NV61
> >>>> - NV42
> >>>> - YUV420
> >>>> - YUV422
> >>>> - YUV444
> >>>> - YVU420
> >>>> - YVU422
> >>>> - YVU444
> >>>>
> >>>> The conversion matrices of each encoding and range were obtained by
> >>>> rounding the values of the original conversion matrices multiplied by
> >>>> 2^8. This is done to avoid the use of fixed point operations.
> >>>>
> >>>> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> >>>> [Louis Chauvet: Adapted Arthur's work and implemented the read_line_t
> >>>> callbacks for yuv formats]
> >>>> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> >>>> ---
> >>>>  drivers/gpu/drm/vkms/vkms_composer.c |   2 +-
> >>>>  drivers/gpu/drm/vkms/vkms_drv.h      |   6 +-
> >>>>  drivers/gpu/drm/vkms/vkms_formats.c  | 289 ++++++++++++++++++++++++=
+++++++++--
> >>>>  drivers/gpu/drm/vkms/vkms_formats.h  |   4 +
> >>>>  drivers/gpu/drm/vkms/vkms_plane.c    |  14 +-
> >>>>  5 files changed, 295 insertions(+), 20 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/=
vkms/vkms_composer.c
> >>>> index e555bf9c1aee..54fc5161d565 100644
> >>>> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> >>>> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> >>>> @@ -312,7 +312,7 @@ static void blend(struct vkms_writeback_job *wb,
> >>>>  			 * buffer [1]
> >>>>  			 */
> >>>>  			current_plane->pixel_read_line(
> >>>> -				current_plane->frame_info,
> >>>> +				current_plane,
> >>>>  				x_start,
> >>>>  				y_start,
> >>>>  				direction,
> >>>> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/=
vkms_drv.h
> >>>> index ccc5be009f15..a4f6456cb971 100644
> >>>> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> >>>> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> >>>> @@ -75,6 +75,8 @@ enum pixel_read_direction {
> >>>>  	READ_RIGHT
> >>>>  };
> >>>> =20
> >>>> +struct vkms_plane_state;
> >>>> +
> >>>>  /**
> >>>>  <<<<<<< HEAD
> >>>>   * typedef pixel_read_line_t - These functions are used to read a p=
ixel line in the source frame,
> >>>> @@ -87,8 +89,8 @@ enum pixel_read_direction {
> >>>>   * @out_pixel: Pointer where to write the pixel value. Pixels will =
be written between x_start and
> >>>>   *  x_end.
> >>>>   */
> >>>> -typedef void (*pixel_read_line_t)(struct vkms_frame_info *frame_inf=
o, int x_start, int y_start, enum
> >>>> -	pixel_read_direction direction, int count, struct pixel_argb_u16 o=
ut_pixel[]);
> >>>> +typedef void (*pixel_read_line_t)(struct vkms_plane_state *frame_in=
fo, int x_start, int y_start,
> >>>> +	enum pixel_read_direction direction, int count, struct pixel_argb_=
u16 out_pixel[]); =20
> >>>
> >>> This is the second or third time in this one series changing this typ=
e.
> >>> Could you not do the change once, in its own patch if possible? =20
> >>
> >> Sorry, this is not a change here, but a wrong formatting (missed when=
=20
> >> rebasing).
> >>
> >> Do you think that it make sense to re-order my patches and put this=20
> >> typedef at the end? This way it is never updated.

I'm not sure, I haven't checked how it would change your patches. The
intermediate changes might get a lot uglier?

Just try to fold changes so that you don't need to change something
twice over the series unless there is a good reason to. "How hard would
it be to review this?" is my measure stick.


> >> =20
> >>>> =20
> >>>>  /**
> >>>>   * vkms_plane_state - Driver specific plane state
> >>>> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/v=
kms/vkms_formats.c
> >>>> index 46daea6d3ee9..515c80866a58 100644
> >>>> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> >>>> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> >>>> @@ -33,7 +33,8 @@ static size_t packed_pixels_offset(const struct vk=
ms_frame_info *frame_info, int
> >>>>  	 */
> >>>>  	return fb->offsets[plane_index] +
> >>>>  	       (y / drm_format_info_block_width(format, plane_index)) * fb=
->pitches[plane_index] +
> >>>> -	       (x / drm_format_info_block_height(format, plane_index)) * f=
ormat->char_per_block[plane_index];
> >>>> +	       (x / drm_format_info_block_height(format, plane_index)) *
> >>>> +	       format->char_per_block[plane_index]; =20
> >>>
> >>> Shouldn't this be in the patch that added this code in the first plac=
e? =20
> >>
> >> Same as above, a wrong formatting, I will remove this change and keep=
=20
> >> everything on one line (even if it's more than 100 chars, it is easier=
 to=20
> >> read).

Personally I agree that readability is more important than strict line
length limits. I'm not sure how the kernel rolls there.

> >> =20
> >>>>  }
> >>>> =20
> >>>>  /**
> >>>> @@ -84,6 +85,32 @@ static int get_step_1x1(struct drm_framebuffer *f=
b, enum pixel_read_direction di
> >>>>  	}
> >>>>  }
> >>>> =20
> >>>> +/**
> >>>> + * get_subsampling() - Get the subsampling value on a specific dire=
ction =20
> >>>
> >>> subsampling divisor =20
> >>
> >> Thanks for this precision.
> >> =20
> >>>> + */
> >>>> +static int get_subsampling(const struct drm_format_info *format,
> >>>> +			   enum pixel_read_direction direction)
> >>>> +{
> >>>> +	if (direction =3D=3D READ_LEFT || direction =3D=3D READ_RIGHT)
> >>>> +		return format->hsub;
> >>>> +	else if (direction =3D=3D READ_DOWN || direction =3D=3D READ_UP)
> >>>> +		return format->vsub;
> >>>> +	return 1; =20
> >>>
> >>> In this and the below function, personally I'd prefer switch-case, wi=
th
> >>> a cannot-happen-scream after the switch, so the compiler can warn abo=
ut
> >>> unhandled enum values. =20
> >>
> >> As for the previous patch, I did not know about this compiler feature,=
=20
> >> thanks!
> >> =20
> >>>> +}
> >>>> +
> >>>> +/**
> >>>> + * get_subsampling_offset() - Get the subsampling offset to use whe=
n incrementing the pixel counter
> >>>> + */
> >>>> +static int get_subsampling_offset(const struct drm_format_info *for=
mat,
> >>>> +				  enum pixel_read_direction direction, int x_start, int y_start=
) =20
> >>>
> >>> 'start' values as "increments" for a pixel counter? Is something
> >>> misnamed here?
> >>>
> >>> Is it an increment or an offset? =20
> >>
> >> I don't really know how to name the function. I'm open to suggestions
> >> x_start and y_start are really the coordinate of the starting reading =
point.

I looks like it's an offset, so "offset" and "start" are good words.
Then the only misleading piece is the doc:

	"Get the subsampling offset to use when incrementing the pixel counter"

This sounds like the offset is used when incrementing a counter, that
is, counter is increment by offset each time. That's my problem with
this.

Fix just the doc, and it's good, I think.

> >>
> >> To explain what it does:
> >>
> >> When using subsampling, you have to read the next pixel of planes[1..4=
]=20
> >> not at the same "speed" as plane[0]. But I can't only rely on=20
> >> "read_pixel_count % subsampling =3D=3D 0", because it means that the p=
ixel=20
> >> incrementation on planes[1..4] may not be aligned with the buffer (if=
=20
> >> hsub=3D2 and the start pixel is 1, I need to increment planes[1..4] on=
ly=20
> >> for x=3D2,4,6... not 1,3,5...).
> >>
> >> A way to ensure this is to add an "offset" to count, which ensure that=
 the=20
> >> count % subsampling =3D=3D 0 on the correct pixel.

Yes, I think I did get that feeling from the code eventually somehow,
but it wouldn't hurt to explain it in the comment.

"An offset for keeping the chroma siting consistent regardless of
x_start and y_start" maybe?

> >>
> >> I made an error, the switch case must be (as count is always counting =
up,=20
> >> for "inverted" reading direction a negative number ensure that=20
> >> %subsampling =3D=3D 0 on the correct pixel):
> >>
> >> 	switch (direction) {
> >> 	case READ_UP:
> >> 		return -y_start;
> >> 	case READ_DOWN:
> >> 		return y_start;
> >> 	case READ_LEFT:
> >> 		return -x_start;
> >> 	case READ_RIGHT:
> >> 		return x_start;
> >> 	}

Yes, the inverted reading directions are different indeed. I did not
think through if this works also for sub-sampling divisors > 2 which I
don't think are ever used.

Does IGT find this mistake? If not, maybe IGT should be extended.

> >> =20
> >>>> +{
> >>>> +	if (direction =3D=3D READ_RIGHT || direction =3D=3D READ_LEFT)
> >>>> +		return x_start;
> >>>> +	else if (direction =3D=3D READ_DOWN || direction =3D=3D READ_UP)
> >>>> +		return y_start;
> >>>> +	return 0;
> >>>> +}
> >>>> + =20
> >>
> >> [...]
> >> =20
> >>>> +static void yuv_u8_to_argb_u16(struct pixel_argb_u16 *argb_u16, con=
st struct pixel_yuv_u8 *yuv_u8,
> >>>> +			       enum drm_color_encoding encoding, enum drm_color_range ra=
nge)
> >>>> +{
> >>>> +	static const s16 bt601_full[3][3] =3D {
> >>>> +		{ 256, 0,   359 },
> >>>> +		{ 256, -88, -183 },
> >>>> +		{ 256, 454, 0 },
> >>>> +	}; =20
> >>
> >> [...]
> >> =20
> >>>> +
> >>>> +	u8 r =3D 0;
> >>>> +	u8 g =3D 0;
> >>>> +	u8 b =3D 0;
> >>>> +	bool full =3D range =3D=3D DRM_COLOR_YCBCR_FULL_RANGE;
> >>>> +	unsigned int y_offset =3D full ? 0 : 16;
> >>>> +
> >>>> +	switch (encoding) {
> >>>> +	case DRM_COLOR_YCBCR_BT601:
> >>>> +		ycbcr2rgb(full ? bt601_full : bt601, =20
> >>>
> >>> Doing all these conditional again pixel by pixel is probably
> >>> inefficient. Just like with the line reading functions, you could pick
> >>> the matrix in advance. =20
> >>
> >> I don't think the performance impact is huge (it's only a pair of if),=
 but=20
> >> yes, it's an easy optimization.=20
> >>
> >> I will create a conversion_matrix structure:
> >>
> >> 	struct conversion_matrix {
> >> 		s16 matrix[3][3];
> >> 		u16 y_offset;
> >> 	}

When defining such a struct type, it would be good to document the
matrix layout (which one is row, which one is column), and what the s16
mean (fixed point?).

Try to not mix signed and unsigned types, too. The C implicit type
promotion rules can be surprising. Just make everything signed while
computing, and convert to/from unsigned only for storage.

> >>
> >> I will create a `get_conversion_matrix_to_argb_u16` function to get th=
is=20
> >> structure from a format+encoding+range.
> >>
> >> I will also add a field `conversion_matrix` in struct vkms_plane_state=
 to=20
> >> get this matrix only once per plane setup.

Alright. Let's see how that works.

> >>
> >> =20
> >>>> +			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
> >>>> +		break;
> >>>> +	case DRM_COLOR_YCBCR_BT709:
> >>>> +		ycbcr2rgb(full ? rec709_full : rec709,
> >>>> +			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
> >>>> +		break;
> >>>> +	case DRM_COLOR_YCBCR_BT2020:
> >>>> +		ycbcr2rgb(full ? bt2020_full : bt2020,
> >>>> +			  yuv_u8->y, yuv_u8->u, yuv_u8->v, y_offset, &r, &g, &b);
> >>>> +		break;
> >>>> +	default:
> >>>> +		pr_warn_once("Not supported color encoding\n");
> >>>> +		break;
> >>>> +	}
> >>>> +
> >>>> +	argb_u16->r =3D r * 257;
> >>>> +	argb_u16->g =3D g * 257;
> >>>> +	argb_u16->b =3D b * 257; =20
> >>>
> >>> I wonder. Using 8-bit fixed point precision seems quite coarse for
> >>> 8-bit pixel formats, and it's going to be insufficient for higher bit
> >>> depths. Was supporting e.g. 10-bit YUV considered? There is even
> >>> deeper, too, like DRM_FORMAT_P016. =20
> >>
> >> It's a good point, as I explained above, I took the conversion part as=
 a=20
> >> "black box" to avoid breaking (and debugging) stuff. I think it's easy=
 to=20
> >> switch to s32 bits matrix with 16.16 bits (or anything with more than =
16 bits in=20
> >> the float part).
> >>
> >> Maybe Arthur have an opinion on this? =20
> >=20
> > Yeah, I too don't see why not we could do that. The 8-bit precision was
> > sufficient for those formats, but as well noted by Pekka this could be a
> > problem for higher bit depths. I just need to make my terrible python
> > script spit those values XD. =20
>=20
> Finally, I got it working with 32-bit precision.
>=20
> I basically threw all my untrusted python code away, and started using
> the colour python framework suggested by Sebastian[1]. After knowing the
> right values (and staring at numbers for hours), I found that with a
> little bit of rounding, the conversion works.
>=20
> Also, while at it, I changed the name rec709 to bt709 to follow the
> pattern and added "_full" to the full ranges matrices.
>=20
> While using the library, I noticed that the red component is wrong on
> the color red in one test case.
>=20
> [1]: https://lore.kernel.org/all/20240115150600.GC160656@toolbox/

That all sounds good. I wish the kernel code contained comments
explaining how exactly you computed those matrices with python/colour.
If the python snippets are not too long, including them verbatim as
code comments would be really nice for both reviewers and posterity.

The same for the VKMS unit tests, too, how you got the expected result
values.

>=20
> Best Regards,
> ~Arthur Grillo
>=20
> ---
>=20
> diff --git a/drivers/gpu/drm/vkms/tests/vkms_format_test.c b/drivers/gpu/=
drm/vkms/tests/vkms_format_test.c
> index f66584549827..4cee3c2d8d84 100644
> --- a/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> +++ b/drivers/gpu/drm/vkms/tests/vkms_format_test.c
> @@ -59,7 +59,7 @@ static struct yuv_u8_to_argb_u16_case yuv_u8_to_argb_u1=
6_cases[] =3D {
>  			{"white", {0xff, 0x80, 0x80}, {0x0000, 0xffff, 0xffff, 0xffff}},
>  			{"gray",  {0x80, 0x80, 0x80}, {0x0000, 0x8000, 0x8000, 0x8000}},
>  			{"black", {0x00, 0x80, 0x80}, {0x0000, 0x0000, 0x0000, 0x0000}},
> -			{"red",   {0x35, 0x63, 0xff}, {0x0000, 0xffff, 0x0000, 0x0000}},
> +			{"red",   {0x36, 0x63, 0xff}, {0x0000, 0xffff, 0x0000, 0x0000}},
>  			{"green", {0xb6, 0x1e, 0x0c}, {0x0000, 0x0000, 0xffff, 0x0000}},
>  			{"blue",  {0x12, 0xff, 0x74}, {0x0000, 0x0000, 0x0000, 0xffff}},
>  		},
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/v=
kms_formats.c
> index e06bbd7c0a67..043f23dbf80d 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -121,10 +121,12 @@ static void RGB565_to_argb_u16(u8 **src_pixels, str=
uct pixel_argb_u16 *out_pixel
>  	out_pixel->b =3D drm_fixp2int_round(drm_fixp_mul(fp_b, fp_rb_ratio));
>  }
> =20
> -static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset=
, u8 *r, u8 *g, u8 *b)
> +#define BIT_DEPTH 32
> +
> +static void ycbcr2rgb(const s64 m[3][3], u8 y, u8 cb, u8 cr, u8 y_offset=
, u8 *r, u8 *g, u8 *b)
>  {
> -	s32 y_16, cb_16, cr_16;
> -	s32 r_16, g_16, b_16;
> +	s64 y_16, cb_16, cr_16;
> +	s64 r_16, g_16, b_16;
> =20
>  	y_16 =3D  y - y_offset;
>  	cb_16 =3D cb - 128;
> @@ -134,9 +136,18 @@ static void ycbcr2rgb(const s16 m[3][3], u8 y, u8 cb=
, u8 cr, u8 y_offset, u8 *r,
>  	g_16 =3D m[1][0] * y_16 + m[1][1] * cb_16 + m[1][2] * cr_16;
>  	b_16 =3D m[2][0] * y_16 + m[2][1] * cb_16 + m[2][2] * cr_16;
> =20
> -	*r =3D clamp(r_16, 0, 0xffff) >> 8;
> -	*g =3D clamp(g_16, 0, 0xffff) >> 8;
> -	*b =3D clamp(b_16, 0, 0xffff) >> 8;
> +	// rounding the values
> +	r_16 =3D r_16 + (1LL << (BIT_DEPTH - 4));
> +	g_16 =3D g_16 + (1LL << (BIT_DEPTH - 4));
> +	b_16 =3D b_16 + (1LL << (BIT_DEPTH - 4));
> +
> +	r_16 =3D clamp(r_16, 0, (1LL << (BIT_DEPTH + 8)) - 1);
> +	g_16 =3D clamp(g_16, 0, (1LL << (BIT_DEPTH + 8)) - 1);
> +	b_16 =3D clamp(b_16, 0, (1LL << (BIT_DEPTH + 8)) - 1);

Where do the BIT_DEPTH - 4 and BIT_DEPTH + 8 come from?

> +
> +	*r =3D r_16 >> BIT_DEPTH;
> +	*g =3D g_16 >> BIT_DEPTH;
> +	*b =3D b_16 >> BIT_DEPTH;
>  }

...

> >  =20
> >> Just to be sure, the DRM subsystem don't have such matrix somewhere? I=
t=20
> >> can be nice to avoid duplicating them. =20
> >=20
> > As to my knowledge it does not exist on DRM, I think those are normally
> > on the hardware itself (*please* correct me if I'm wrong).

I couldn't find a matrix type either on a quick glance, but there is
drm_fixed.h for a couple different fixed point formats, it seems. FWIW.
drm_fixed.h didn't feel very appealing for this here.

> >=20
> > But, v4l2 has a similar table on
> > drivers/media/common/v4l2-tpg/v4l2-tpg-core.c (Actually, I started my
> > code based on this), unfortunately it's only 8-bit too.

Thanks,
pq

--Sig_/WR3ByqJEAt6f5+lYdW.21IQ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXgdLYACgkQI1/ltBGq
qqfepQ//UK9qBoYRyfhDXlzTs+6MByDDRNKikoBaJBNJqaFjNC359pEj5HTpDNMC
OCKLkLbMroo6Gjo91T7BCo176ksw2VkgTh2zbs+UOcLTjPTJdB/f+YseFkD4rjAT
AlmF5ovjvhu5D8u+ZIRzO7yp6/r9qsKvr63ODwv8DtFPd/0JFPI6zfvOjJjUkAvP
AVjdudMt1CfSwbwkl+NlSjZPjkZTFxypP/vmGKjqb3VEOP7svQCZJgJ4+nm7l5uw
0oSGFNebxrOfazeZnWroGJz4Yos9Rcnu0nZzL0tFx6buGOziGzvibYjCGMjftGMO
jfiV8R8IBXaLYpyZznJ5JWFVvwdzjCEGAr0yT/VpPlDQxE6BBd4jfCZ3M+ap0lkP
za1m2PNieszpX9z16j32h/s1IXzWJzCpnw/K4FzL4tgQk5+PXG4nyfpgtl4YrRg7
tYHn7c7yN20GZbFPvwHoP6NKsxWYOpopszQOKIec5BhBptek6jssVT1S3dmslnpW
X4U4cMLB+zoJBOz0X0ZGJoffIyArrAtjb7xndm8+wq/EcCn0EtsHMTDTsWzEx/24
JuXldIiQHP+tcI+p2gro9hZXv1tcj8MbBWmB997FSejHat+Wo686KaAb+XfirGmW
1l04SAZXkZ0RzOt/0seupMsYIZHTH4dEszmbOSjPB5PavPVcWag=
=lR9b
-----END PGP SIGNATURE-----

--Sig_/WR3ByqJEAt6f5+lYdW.21IQ--
