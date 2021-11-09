Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D1344ACC3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 12:40:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85F0D6E90A;
	Tue,  9 Nov 2021 11:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7066E907
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 11:40:29 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id s24so35680521lji.12
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Nov 2021 03:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=W1j9xgL2+encL7pFTl1d3TWuWrG/v03huoOdTD/Y33U=;
 b=FMnU+3LqoJIQcbGETXjHF5hJOvySZa+H9aNhk74EYXmmXurJYTR2vjoEM8YC+c/I8S
 VlehwVf+r1yrGpqJiy+heIhN1lIqF5+OSXMXJU0GFAoVeNxKV8q+vIvhDqa87Icnt4K5
 XyOfotFaOQ4DbeasrkLWiZ1tmbrbZwbkMgcutlvaK+buPrIeIxAXVNu8/jAmhVgF8QkM
 8gykmrsgiqMj3ARB5UreNP4g3B0D0DSdt79csUEqd6hof5uwXz88vS1ygY18NNaStlD8
 KISekki0RLdF78+WijI6JUnBX21VmnCKHJKMgQ3M6Cm/HZUxdJhFIUpx0A0WtAr4tIO0
 Xtrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=W1j9xgL2+encL7pFTl1d3TWuWrG/v03huoOdTD/Y33U=;
 b=mSen4JxmrtYraGoyRhnHXB8bZNaKICjHcm9dK9BsY6F+QsZ5+5Y85gVj4awiqvdjV8
 RZ625U0l+3pdkXro0+pO9PwHJfVviDud/yNZIPa9MEIQVwCT8G11ylSlql7nLpkfu3ww
 YpoPwcPVCQbTNVpJ1jNoVXjqCSM6AOS77wGEZr0VifSjPAV93brWelOgD5NQ0xd6q14d
 pNfEW2q+a8v09xEZvEdPoRoRyttRK2m8ziTj+1uTRSEj/oKBo1nAj3pBbWN6rZOz4DiN
 K/8CC9LgnwiiI8zip0+ptIq7S5Pb6SvOFE7PZ6JluBd9UWeKJ1ksi6BpxYsG5usTr88b
 uiCw==
X-Gm-Message-State: AOAM531J2R8CJYdRu2Rw34Hj/qIU2DJYYn5GvHjL2O1QdtlCCbYUs1bb
 HeRQlVpBGQx+yYWdI8eR6Wc=
X-Google-Smtp-Source: ABdhPJy8AMttXV1BZLZdA1kEixItqUL8xXbTT34JDmX23kbVJs9oKWYEioqy3l5r12dWn7xc0X9UyQ==
X-Received: by 2002:a2e:a5c8:: with SMTP id n8mr7049814ljp.367.1636458027840; 
 Tue, 09 Nov 2021 03:40:27 -0800 (PST)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id j21sm142503lji.88.2021.11.09.03.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 03:40:27 -0800 (PST)
Date: Tue, 9 Nov 2021 13:40:17 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v2 6/8] drm: vkms: Refactor the plane composer to accept
 new formats
Message-ID: <20211109134017.09e71c77@eldfell>
In-Reply-To: <20211026113409.7242-7-igormtorrente@gmail.com>
References: <20211026113409.7242-1-igormtorrente@gmail.com>
 <20211026113409.7242-7-igormtorrente@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/D.Z5i=.Qb.N85W77hx8mck1";
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
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/D.Z5i=.Qb.N85W77hx8mck1
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Igor,

again, that is a really nice speed-up. Unfortunately, I find the code
rather messy and hard to follow. I hope my comments below help with
re-designing it to be easier to understand.


On Tue, 26 Oct 2021 08:34:06 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> Currently the blend function only accepts XRGB_8888 and ARGB_8888
> as a color input.
>=20
> This patch refactors all the functions related to the plane composition
> to overcome this limitation.
>=20
> Now the blend function receives a struct `vkms_pixel_composition_function=
s`
> containing two handlers.
>=20
> One will generate a buffer of each line of the frame with the pixels
> converted to ARGB16161616. And the other will take this line buffer,
> do some computation on it, and store the pixels in the destination.
>=20
> Both the handlers have the same signature. They receive a pointer to
> the pixels that will be processed(`pixels_addr`), the number of pixels
> that will be treated(`length`), and the intermediate buffer of the size
> of a frame line (`line_buffer`).
>=20
> The first function has been totally described previously.

What does this sentence mean?

>=20
> The second is more interesting, as it has to perform two roles depending
> on where it is called in the code.
>=20
> The first is to convert(if necessary) the data received in the
> `line_buffer` and write in the memory pointed by `pixels_addr`.
>=20
> The second role is to perform the `alpha_blend`. So, it takes the pixels
> in the `line_buffer` and `pixels_addr`, executes the blend, and stores
> the result back to the `pixels_addr`.
>=20
> The per-line implementation was chosen for performance reasons.
> The per-pixel functions were having performance issues due to indirect
> function call overhead.
>=20
> The per-line code trades off memory for execution time. The `line_buffer`
> allows us to diminish the number of function calls.
>=20
> Results in the IGT test `kms_cursor_crc`:
>=20
> |                     Frametime                       |
> |:---------------:|:---------:|:----------:|:--------:|
> |  implmentation  |  Current  |  Per-pixel | Per-line |
> | frametime range |  8~22 ms  |  32~56 ms  |  6~19 ms |
> |     Average     |  10.0 ms  |   35.8 ms  |  8.6 ms  |
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> ---
> V2: Improves the performance drastically, by perfoming the operations
>     per-line and not per-pixel(Pekka Paalanen).
>     Minor improvements(Pekka Paalanen).
> ---
>  drivers/gpu/drm/vkms/vkms_composer.c | 321 ++++++++++++++++-----------
>  drivers/gpu/drm/vkms/vkms_formats.h  | 155 +++++++++++++
>  2 files changed, 342 insertions(+), 134 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h
>=20
> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/=
vkms_composer.c
> index 383ca657ddf7..69fe3a89bdc9 100644
> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> @@ -9,18 +9,26 @@
>  #include <drm/drm_vblank.h>
> =20
>  #include "vkms_drv.h"
> -
> -static u32 get_pixel_from_buffer(int x, int y, const u8 *buffer,
> -				 const struct vkms_composer *composer)
> -{
> -	u32 pixel;
> -	int src_offset =3D composer->offset + (y * composer->pitch)
> -				      + (x * composer->cpp);
> -
> -	pixel =3D *(u32 *)&buffer[src_offset];
> -
> -	return pixel;
> -}
> +#include "vkms_formats.h"
> +
> +#define get_output_vkms_composer(buffer_pointer, composer)		\
> +	((struct vkms_composer) {					\
> +		.fb =3D &(struct drm_framebuffer) {			\
> +			.format =3D &(struct drm_format_info) {		\
> +				.format =3D DRM_FORMAT_ARGB16161616,	\
> +			},						\

Is that really how one can initialize a drm_format_info? Does that
struct not have a lot more fields? Shouldn't you call a function to
look up the proper struct with all fields populated?

> +		},							\
> +		.map[0].vaddr =3D (buffer_pointer),			\
> +		.src =3D (composer)->src,					\
> +		.dst =3D (composer)->dst,					\
> +		.cpp =3D sizeof(u64),					\
> +		.pitch =3D drm_rect_width(&(composer)->dst) * sizeof(u64)	\
> +	})

Why is this a macro rather than a function?

> +
> +struct vkms_pixel_composition_functions {
> +	void (*get_src_line)(void *pixels_addr, int length, u64 *line_buffer);
> +	void (*set_output_line)(void *pixels_addr, int length, u64 *line_buffer=
);

I would be a little more comfortable if instead of u64 *line_buffer you
would have something like

struct line_buffer {
	u16 *row;
	size_t nelem;
}

so that the functions to be plugged into these function pointers could
assert that you do not accidentally overflow the array (which would
imply a code bug in kernel).

One could perhaps go even for:

struct line_pixel {
	u16 r, g, b, a;
};

struct line_buffer {
	struct line_pixel *row;
	size_t npixels;
};

Because as I mention further down, there is no need for the line buffer
to use an existing DRM pixel format at all.

> +};
> =20
>  /**
>   * compute_crc - Compute CRC value on output frame
> @@ -31,179 +39,222 @@ static u32 get_pixel_from_buffer(int x, int y, cons=
t u8 *buffer,
>   * returns CRC value computed using crc32 on the visible portion of
>   * the final framebuffer at vaddr_out
>   */
> -static uint32_t compute_crc(const u8 *vaddr,
> +static uint32_t compute_crc(const __le64 *vaddr,
>  			    const struct vkms_composer *composer)
>  {
> -	int x, y;
> -	u32 crc =3D 0, pixel =3D 0;
> -	int x_src =3D composer->src.x1 >> 16;
> -	int y_src =3D composer->src.y1 >> 16;
> -	int h_src =3D drm_rect_height(&composer->src) >> 16;
> -	int w_src =3D drm_rect_width(&composer->src) >> 16;
> -
> -	for (y =3D y_src; y < y_src + h_src; ++y) {
> -		for (x =3D x_src; x < x_src + w_src; ++x) {
> -			pixel =3D get_pixel_from_buffer(x, y, vaddr, composer);
> -			crc =3D crc32_le(crc, (void *)&pixel, sizeof(u32));
> -		}
> -	}
> +	int h =3D drm_rect_height(&composer->dst);
> +	int w =3D drm_rect_width(&composer->dst);
> =20
> -	return crc;
> +	return crc32_le(0, (void *)vaddr, w * h * sizeof(u64));
>  }
> =20
> -static u8 blend_channel(u8 src, u8 dst, u8 alpha)
> +static __le16 blend_channel(u16 src, u16 dst, u16 alpha)

This function is doing the OVER operation (Porter-Duff classification)
assuming pre-multiplied alpha. I think the function name should reflect
that. At the very least it should somehow note pre-multiplied alpha,
because KMS property "pixel blend mode" can change that.

'alpha' should be named 'src_alpha'.

>  {
> -	u32 pre_blend;
> -	u8 new_color;
> +	u64 pre_blend;

I'm not quite sure if u32 would suffice... max value for src is
0xffff * src_alpha / 0xffff =3D src_alpha. Max value for dst is 0xffff.

So we have at max

src_alpha * 0xffff + 0xffff * (0xffff - src_alpha)

Each multiplication independently will fit in u32.

Rearranging we get

src_alpha * 0xffff + 0xffff * 0xffff - 0xffff * src_alpha

which equals

0xffff * 0xffff

which fits in u32 and does not depend on src_alpha.

So unless I made a mistake, looks like u32 should be enough. On 32-bit
CPUs it should have speed benefits compared to u64.

> +	u16 new_color;
> =20
> -	pre_blend =3D (src * 255 + dst * (255 - alpha));
> +	pre_blend =3D (src * 0xffff + dst * (0xffff - alpha));

'pre_blend' means "before blending" so maybe a better name here as the
blending is already done.

> =20
> -	/* Faster div by 255 */
> -	new_color =3D ((pre_blend + ((pre_blend + 257) >> 8)) >> 8);
> +	new_color =3D DIV_ROUND_UP(pre_blend, 0xffff);
> =20
> -	return new_color;
> +	return cpu_to_le16(new_color);

What's the thing with cpu_to_le16 here?

I think the temporary line buffers could just be using the cpu-native
u16 type. There is no DRM format code for that, but we don't need one
either. This format is not for interoperation with anything else, it's
just internal here, and the main goals with it are precision and speed.

As such, the temporary line buffers could be simply u16 arrays, so you
don't need to consider the channel packing into a u64.

>  }
> =20



=46rom here on, I will be removing the diff minus lines from the quoted
code, because these functions are completely new.

>  /**
>   * alpha_blend - alpha blending equation

This is specifically the pre-multiplied alpha blending, so reflect that
in the function name.

> + * @src_composer: source framebuffer's metadata
> + * @dst_composer: destination framebuffer's metadata
> + * @y: The y coodinate(heigth) of the line that will be processed
> + * @line_buffer: The line with the pixels from src_compositor
>   *
>   * blend pixels using premultiplied blend formula. The current DRM assum=
ption
>   * is that pixel color values have been already pre-multiplied with the =
alpha
>   * channel values. See more drm_plane_create_blend_mode_property(). Also=
, this
>   * formula assumes a completely opaque background.
> + *
> + * For performance reasons this function also fetches the pixels from the
> + * destination of the frame line y.
> + * We use the information that one of the source pixels are in the output
> + * buffer to fetch it here instead of separate function. And because the
> + * output format is ARGB16161616, we know that they don't need to be
> + * converted.
> + * This save us a indirect function call for each line.

I think this paragraph should be obvious from the type of 'line_buffer'
parameter and that you are blending src into dst.

>   */
> +static void alpha_blend(void *pixels_addr, int length, u64 *line_buffer)
>  {
> +	__le16 *output_pixel =3D pixels_addr;

Aren't you supposed to be writing into line_buffer, not into src?

There is something very strange with the logic here.

In fact, the function signature of the blending function is unexpected.
A blending function should operate on two line_buffers, not what looks
like arbitrary buffer pixels.

I think you should forget the old code and design these from scratch.
You would have three different kinds of functions:

- loading: fetch a row from an image and convert into a line buffer
- blending: take two line buffers and blend them into one of the line
  buffers
- storing: convert a line buffer and write it into an image row

I would not coerce these three different operations into less than
three function pointer types.

To actually run a blending operation between source and destination
images, you would need four function pointers:
- loader for source (by pixel format)
- loader for destination (by pixel format)
- blender (by chosen blending operation)
- storing for destination (by pixel format)

Function parameter types should make it obvious whether something is an
image or row in arbitrary format, or a line buffer in the special
internal format.

Then the algorithm would work roughly like this:

for each plane:
	for each row:
		load source into lb1
		load destination into lb2
		blend lb1 into lb2
		store lb2 into destination

This is not optimal, you see how destination is repeatedly loaded and
stored for each plane. So you could swap the loops:

allocate lb1, lb2 with destination width
for each destination row:
	load destination into lb2

	for each plane:
		load source into lb1
		blend lb1 into lb2

	store lb2 into destination

Inside the loop over plane, you need to check if the plane overlaps the
current destination row at all. If not, continue on the next plane. If
yes, load source into lb1 and compute the offset into lb2 where it
needs to be blended.

Since we don't support scaling yet, lb1 length will never exceed
destination width, because there is no need to load plane buffer pixels
we would not be writing out.

Also "load destination into lb2" could be replaced with just "clear
lb2" is the old destination contents are to be discarded. Then you also
don't need the function pointer for "loader for destination".

I think you already had all these ideas, just the execution in code got
really messy somehow.

> +	int i;
> =20
> +	for (i =3D 0; i < length; i++) {
> +		u16 src1_a =3D line_buffer[i] >> 48;
> +		u16 src1_r =3D (line_buffer[i] >> 32) & 0xffff;
> +		u16 src1_g =3D (line_buffer[i] >> 16) & 0xffff;
> +		u16 src1_b =3D line_buffer[i] & 0xffff;

If you used native u16 array for line buffers, all this arithmetic
would be unnecessary.

> =20
> +		u16 src2_r =3D le16_to_cpu(output_pixel[2]);
> +		u16 src2_g =3D le16_to_cpu(output_pixel[1]);
> +		u16 src2_b =3D le16_to_cpu(output_pixel[0]);
> +
> +		output_pixel[0] =3D blend_channel(src1_b, src2_b, src1_a);
> +		output_pixel[1] =3D blend_channel(src1_g, src2_g, src1_a);
> +		output_pixel[2] =3D blend_channel(src1_r, src2_r, src1_a);
> +		output_pixel[3] =3D 0xffff;
> +
> +		output_pixel +=3D 4;
> +	}
>  }
> =20
>  /**
>   * @src_composer: source framebuffer's metadata
> + * @dst_composer: destiny framebuffer's metadata
> + * @funcs: A struct containing all the composition functions(get_src_lin=
e,
> + *         and set_output_pixel)
> + * @line_buffer: The line with the pixels from src_compositor
>   *
> + * Using the pixel_blend function passed as parameter, this function ble=
nds
> + * all pixels from src plane into a output buffer (with a blend function
> + * passed as parameter).
> + * Information of the output buffer is in the dst_composer parameter
> + * and the source plane in the src_composer.
> + * The get_src_line will use the src_composer to get the respective line,
> + * convert, and return it as ARGB_16161616.
> + * And finally, the blend function will receive the dst_composer, dst_co=
mposer,
> + * the line y coodinate, and the line buffer. Blend all pixels, and stor=
e the
> + * result in the output.
>   *
>   * TODO: completely clear the primary plane (a =3D 0xff) before starting=
 to blend
>   * pixel color values
>   */
> +static void blend(struct vkms_composer *src_composer,
>  		  struct vkms_composer *dst_composer,
> +		  struct vkms_pixel_composition_functions *funcs,
> +		  u64 *line_buffer)
>  {
> +	int i, i_dst;
> =20
>  	int x_src =3D src_composer->src.x1 >> 16;
>  	int y_src =3D src_composer->src.y1 >> 16;
> =20
>  	int x_dst =3D src_composer->dst.x1;
>  	int y_dst =3D src_composer->dst.y1;
> +
>  	int h_dst =3D drm_rect_height(&src_composer->dst);
> +	int length =3D drm_rect_width(&src_composer->dst);
> =20
>  	int y_limit =3D y_src + h_dst;
> +
> +	u8 *src_pixels =3D packed_pixels_addr(src_composer, x_src, y_src);
> +	u8 *dst_pixels =3D packed_pixels_addr(dst_composer, x_dst, y_dst);
> +
> +	int src_next_line_offset =3D src_composer->pitch;
> +	int dst_next_line_offset =3D dst_composer->pitch;
> +
> +	for (i =3D y_src, i_dst =3D y_dst; i < y_limit; ++i, i_dst++) {
> +		funcs->get_src_line(src_pixels, length, line_buffer);
> +		funcs->set_output_line(dst_pixels, length, line_buffer);
> +		src_pixels +=3D src_next_line_offset;
> +		dst_pixels +=3D dst_next_line_offset;
>  	}
>  }
> =20
> +static void ((*get_line_fmt_transform_function(u32 format))
> +	    (void *pixels_addr, int length, u64 *line_buffer))
>  {
> +	if (format =3D=3D DRM_FORMAT_ARGB8888)
> +		return &ARGB8888_to_ARGB16161616;
> +	else if (format =3D=3D DRM_FORMAT_ARGB16161616)
> +		return &get_ARGB16161616;
> +	else
> +		return &XRGB8888_to_ARGB16161616;
> +}
> =20
> +static void ((*get_output_line_function(u32 format))
> +	     (void *pixels_addr, int length, u64 *line_buffer))
> +{
> +	if (format =3D=3D DRM_FORMAT_ARGB8888)
> +		return &convert_to_ARGB8888;
> +	else if (format =3D=3D DRM_FORMAT_ARGB16161616)
> +		return &convert_to_ARGB16161616;
> +	else
> +		return &convert_to_XRGB8888;
> +}
> =20
> +static void compose_plane(struct vkms_composer *src_composer,
> +			  struct vkms_composer *dst_composer,

I'm confused by the vkms_composer concept. If there is a separate thing
for source and destination and they are used together, then I don't
think that thing is a "composer" but some kind of... image structure?
"Composer" is what compose_active_planes() does.

> +			  struct vkms_pixel_composition_functions *funcs,
> +			  u64 *line_buffer)
> +{
> +	u32 src_format =3D src_composer->fb->format->format;
> =20
> +	funcs->get_src_line =3D get_line_fmt_transform_function(src_format);
> =20
> +	blend(src_composer, dst_composer, funcs, line_buffer);

This function is confusing. You get 'funcs' as argument, but you
overwrite one field and then trust that the other field was already set
by the caller. The policy of how 'funcs' argument here works is too
complicated to me.

If you need just one function pointer as argument, then do exactly
that, and construct the vfunc struct inside this function.

>  }
> =20
> +static __le64 *struct vkms_composer *primary_composer,
> +				     struct vkms_crtc_state *crtc_state,
> +				     u64 *line_buffer)
>  {
> +	struct vkms_plane_state **active_planes =3D crtc_state->active_planes;
> +	int h =3D drm_rect_height(&primary_composer->dst);
> +	int w =3D drm_rect_width(&primary_composer->dst);
> +	struct vkms_pixel_composition_functions funcs;
> +	struct vkms_composer dst_composer;
> +	__le64 *vaddr_out;
>  	int i;
> =20
>  	if (WARN_ON(dma_buf_map_is_null(&primary_composer->map[0])))
> +		return NULL;
> =20
> +	vaddr_out =3D kvzalloc(w * h * sizeof(__le64), GFP_KERNEL);

Why allocate a full size image here in the compositing function?

You should be able to do with just few line buffers instead.

> +	if (!vaddr_out) {
> +		DRM_ERROR("Cannot allocate memory for output frame.");
> +		return NULL;
> +	}
> =20
> +	dst_composer =3D get_output_vkms_composer(vaddr_out, primary_composer);
> +	funcs.set_output_line =3D get_output_line_function(DRM_FORMAT_ARGB16161=
616);
> +	compose_plane(active_planes[0]->composer, &dst_composer,
> +		      &funcs, line_buffer);
> =20
>  	/* If there are other planes besides primary, we consider the active
>  	 * planes should be in z-order and compose them associatively:
>  	 * ((primary <- overlay) <- cursor)
>  	 */
> +	funcs.set_output_line =3D alpha_blend;
>  	for (i =3D 1; i < crtc_state->num_active_planes; i++)
> +		compose_plane(active_planes[i]->composer, &dst_composer,
> +			      &funcs, line_buffer);
> =20
> +	return vaddr_out;
> +}
> +
> +static void write_wb_buffer(struct vkms_writeback_job *active_wb,
> +			    struct vkms_composer *primary_composer,
> +			    __le64 *vaddr_out, u64 *line_buffer)
> +{
> +	u32 dst_fb_format =3D active_wb->composer.fb->format->format;
> +	struct vkms_pixel_composition_functions funcs;
> +	struct vkms_composer src_composer;
> +
> +	src_composer =3D get_output_vkms_composer(vaddr_out, primary_composer);
> +	funcs.set_output_line =3D get_output_line_function(dst_fb_format);
> +	active_wb->composer.src =3D primary_composer->src;
> +	active_wb->composer.dst =3D primary_composer->dst;
> +
> +	compose_plane(&src_composer, &active_wb->composer, &funcs, line_buffer);
> +}
> +
> +u64 *alloc_line_buffer(struct vkms_composer *primary_composer)
> +{
> +	int line_width =3D drm_rect_width(&primary_composer->dst);
> +	u64 *line_buffer;
> +
> +	line_buffer =3D kvmalloc(line_width * sizeof(u64), GFP_KERNEL);
> +	if (!line_buffer)
> +		DRM_ERROR("Cannot allocate memory for intermediate line buffer");
> +
> +	return line_buffer;
>  }
> =20
>  /**
> @@ -221,14 +272,14 @@ void vkms_composer_worker(struct work_struct *work)
>  						struct vkms_crtc_state,
>  						composer_work);
>  	struct drm_crtc *crtc =3D crtc_state->base.crtc;
> +	struct vkms_writeback_job *active_wb =3D crtc_state->active_writeback;
>  	struct vkms_output *out =3D drm_crtc_to_vkms_output(crtc);
>  	struct vkms_composer *primary_composer =3D NULL;
>  	struct vkms_plane_state *act_plane =3D NULL;
> +	u64 frame_start, frame_end, *line_buffer;
>  	bool crc_pending, wb_pending;
> -	void *vaddr_out =3D NULL;
> +	__le64 *vaddr_out =3D NULL;
>  	u32 crc32 =3D 0;
> -	u64 frame_start, frame_end;
> -	int ret;
> =20
>  	spin_lock_irq(&out->composer_lock);
>  	frame_start =3D crtc_state->frame_start;
> @@ -256,28 +307,30 @@ void vkms_composer_worker(struct work_struct *work)
>  	if (!primary_composer)
>  		return;
> =20
> -	if (wb_pending)
> -		vaddr_out =3D crtc_state->active_writeback->data[0].vaddr;
> +	line_buffer =3D alloc_line_buffer(primary_composer);
> +	if (!line_buffer)
> +		return;
> =20
> -	ret =3D compose_active_planes(&vaddr_out, primary_composer,
> -				    crtc_state);
> -	if (ret) {
> -		if (ret =3D=3D -EINVAL && !wb_pending)
> -			kvfree(vaddr_out);
> +	vaddr_out =3D compose_active_planes(primary_composer, crtc_state,
> +					  line_buffer);
> +	if (!vaddr_out) {
> +		kvfree(line_buffer);
>  		return;
>  	}
> =20
> -	crc32 =3D compute_crc(vaddr_out, primary_composer);
> -
>  	if (wb_pending) {
> +		write_wb_buffer(active_wb, primary_composer,
> +				vaddr_out, line_buffer);
>  		drm_writeback_signal_completion(&out->wb_connector, 0);
>  		spin_lock_irq(&out->composer_lock);
>  		crtc_state->wb_pending =3D false;
>  		spin_unlock_irq(&out->composer_lock);
> -	} else {
> -		kvfree(vaddr_out);
>  	}
> =20
> +	kvfree(line_buffer);
> +	crc32 =3D compute_crc(vaddr_out, primary_composer);
> +	kvfree(vaddr_out);
> +
>  	/*
>  	 * The worker can fall behind the vblank hrtimer, make sure we catch up.
>  	 */
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkms/v=
kms_formats.h
> new file mode 100644
> index 000000000000..5b850fce69f3
> --- /dev/null
> +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> @@ -0,0 +1,155 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +
> +#ifndef _VKMS_FORMATS_H_
> +#define _VKMS_FORMATS_H_
> +
> +#include <drm/drm_rect.h>
> +
> +#define pixel_offset(composer, x, y) \
> +	((composer)->offset + ((y) * (composer)->pitch) + ((x) * (composer)->cp=
p))

Why macro instead of a static inline function?

> +
> +/*
> + * packed_pixels_addr - Get the pointer to pixel of a given pair of coor=
dinates
> + *
> + * @composer: Buffer metadata
> + * @x: The x(width) coordinate of the 2D buffer
> + * @y: The y(Heigth) coordinate of the 2D buffer
> + *
> + * Takes the information stored in the composer, a pair of coordinates, =
and
> + * returns the address of the first color channel.
> + * This function assumes the channels are packed together, i.e. a color =
channel
> + * comes immediately after another. And therefore, this function doesn't=
 work
> + * for YUV with chroma subsampling (e.g. YUV420 and NV21).
> + */
> +static void *packed_pixels_addr(struct vkms_composer *composer, int x, i=
nt y)

Is it normal in the kernel to have non-inline functions in headers?

Actually this file does not look like a header at all, it should
probably be a .c file and not #included.

> +{
> +	int offset =3D pixel_offset(composer, x, y);
> +
> +	return (u8 *)composer->map[0].vaddr + offset;
> +}
> +
> +static void ARGB8888_to_ARGB16161616(void *pixels_addr, int length,
> +				     u64 *line_buffer)
> +{
> +	u8 *src_pixels =3D pixels_addr;
> +	int i;
> +
> +	for (i =3D 0; i < length; i++) {
> +		/*
> +		 * Organizes the channels in their respective positions and converts
> +		 * the 8 bits channel to 16.
> +		 * The 257 is the "conversion ratio". This number is obtained by the
> +		 * (2^16 - 1) / (2^8 - 1) division. Which, in this case, tries to get
> +		 * the best color value in a pixel format with more possibilities.
> +		 * And a similar idea applies to others RGB color conversions.
> +		 */
> +		line_buffer[i] =3D ((u64)src_pixels[3] * 257) << 48 |
> +				 ((u64)src_pixels[2] * 257) << 32 |
> +				 ((u64)src_pixels[1] * 257) << 16 |
> +				 ((u64)src_pixels[0] * 257);
> +
> +		src_pixels +=3D 4;
> +	}
> +}
> +
> +static void XRGB8888_to_ARGB16161616(void *pixels_addr, int length,
> +				     u64 *line_buffer)
> +{
> +	u8 *src_pixels =3D pixels_addr;
> +	int i;
> +
> +	for (i =3D 0; i < length; i++) {
> +		/*
> +		 * The same as the ARGB8888 but with the alpha channel as the
> +		 * maximum value as possible.
> +		 */
> +		line_buffer[i] =3D 0xffffllu << 48 |
> +				 ((u64)src_pixels[2] * 257) << 32 |
> +				 ((u64)src_pixels[1] * 257) << 16 |
> +				 ((u64)src_pixels[0] * 257);
> +
> +		src_pixels +=3D 4;
> +	}
> +}
> +
> +static void get_ARGB16161616(void *pixels_addr, int length, u64 *line_bu=
ffer)
> +{
> +	__le64 *src_pixels =3D pixels_addr;
> +	int i;
> +
> +	for (i =3D 0; i < length; i++) {
> +		/*
> +		 * Because the format byte order is in little-endian and this code
> +		 * needs to run on big-endian machines too, we need modify
> +		 * the byte order from little-endian to the CPU native byte order.
> +		 */
> +		line_buffer[i] =3D le64_to_cpu(*src_pixels);
> +
> +		src_pixels++;
> +	}
> +}
> +
> +/*
> + * The following functions are used as blend operations. But unlike the
> + * `alpha_blend`, these functions take an ARGB16161616 pixel from the
> + * source, convert it to a specific format, and store it in the destinat=
ion.

This is a surprising trick I don't like. Blending operation and storing
operation are fundamentally different. Once you have more obvious
function signatures, this trick is not possible anymore.


Thanks,
pq

> + *
> + * They are used in the `compose_active_planes` and `write_wb_buffer` to
> + * copy and convert one line of the frame from/to the output buffer to/f=
rom
> + * another buffer (e.g. writeback buffer, primary plane buffer).
> + */
> +
> +static void convert_to_ARGB8888(void *pixels_addr, int length, u64 *line=
_buffer)
> +{
> +	u8 *dst_pixels =3D pixels_addr;
> +	int i;
> +
> +	for (i =3D 0; i < length; i++) {
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
> +		dst_pixels[0] =3D DIV_ROUND_UP(line_buffer[i] & 0xffff, 257);
> +		dst_pixels[1] =3D DIV_ROUND_UP((line_buffer[i] >> 16) & 0xffff, 257);
> +		dst_pixels[2] =3D DIV_ROUND_UP((line_buffer[i] >> 32) & 0xffff, 257);
> +		dst_pixels[3] =3D DIV_ROUND_UP(line_buffer[i] >> 48, 257);
> +
> +		dst_pixels +=3D 4;
> +	}
> +}
> +
> +static void convert_to_XRGB8888(void *pixels_addr, int length, u64 *line=
_buffer)
> +{
> +	u8 *dst_pixels =3D pixels_addr;
> +	int i;
> +
> +	for (i =3D 0; i < length; i++) {
> +		dst_pixels[0] =3D DIV_ROUND_UP(line_buffer[i] & 0xffff, 257);
> +		dst_pixels[1] =3D DIV_ROUND_UP((line_buffer[i] >> 16) & 0xffff, 257);
> +		dst_pixels[2] =3D DIV_ROUND_UP((line_buffer[i] >> 32) & 0xffff, 257);
> +		dst_pixels[3] =3D 0xff;
> +
> +		dst_pixels +=3D 4;
> +	}
> +}
> +
> +static void convert_to_ARGB16161616(void *pixels_addr, int length,
> +				    u64 *line_buffer)
> +{
> +	__le64 *dst_pixels =3D pixels_addr;
> +	int i;
> +
> +	for (i =3D 0; i < length; i++) {
> +
> +		*dst_pixels =3D cpu_to_le64(line_buffer[i]);
> +		dst_pixels++;
> +	}
> +}
> +
> +#endif /* _VKMS_FORMATS_H_ */


--Sig_/D.Z5i=.Qb.N85W77hx8mck1
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGKXiEACgkQI1/ltBGq
qqei6g/+KiLl/k9YR3V8aHhsgkBv/J1YAYc7xsPtqQYTztdmA2pIxomhj2m4Odpo
M5F87y6lIoBGGcebqVbDCoyP8rndOvimNJnAUShtK+El6dOrTmwFcHnjrCZsDX8V
HduM7epKDfJyF7GbHe4+83Cngviq/a7Ra5Up70Dt8RC9rD7SOTwz48hBdvFW6qLJ
l4wF5nq62yGtj+uzJnQYl58GMy1p/MzjysC+tbBAfMmgYXCOEwySUcBa4uGx0gwz
rVc32E/JGR0PsoeAS2CsxL3chMqP5uEgUlYSasF98Y6P5DW41q45nBWHlteX3dff
P1y2tlV2YKYi+ePy3ylOeHNHs9bOwKSH+TpA8GKrq6cOTTNLKnlKSJsy69rDIOEr
A7KokuJZPDFVFjBbdbKxpTI7hcb8WkMU2NPHtQkgkpImLs6OlZypK4i+Xr07b8aK
Tuq1K1lN3hMZHNG9bg43kNX9cUUw1cFl+0rBt37u2Lai4Vo8NaU8INj5E+k8XhZB
d9VZKVzfn5t44XOkXrBCMwnFaZZevpt/FsCiA8GrkT5Uwmn4zHJbSt1g+6EfEVGn
UgwUxxhGEiTNWc1uiWIS0JpZlinKTbhIIzFPsFEgKLYnKVwheoZhzhkll1xLTN/E
GZdPfILhR6c165UzLQP6+ftlgQnLK0EXu0WnzbE3+slWxrbCaHE=
=yc/a
-----END PGP SIGNATURE-----

--Sig_/D.Z5i=.Qb.N85W77hx8mck1--
