Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FD486C6B5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 11:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E039710E35A;
	Thu, 29 Feb 2024 10:21:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ehxjgMdl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B6210E35A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 10:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709202088;
 bh=snvD5kWXFLB6AcGQ8H5+y7jL/rrDUq79ugF9+pgwUCY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ehxjgMdlLzDJu4DgpVFueM0u8n+qfHqzszoekyZuJ9ANMOdM8f9AxSKIUlsRnN2HR
 UHG/NLiAAC1WVAoAe/dFLA1RYQzZ74LpXClzP5mp+/6ujW1kUHDkeM3DMuuRDZuYXC
 Yk8/QUR+HisuzwUXqOe1B+lYveRJ1m8iz6lUwAguXS+hJZmpGfXDCoDfMjxDF3LuvO
 GKInLTb04i+SqeiqgT57bGh9HmKdUlquqVr4HjfRUhHjeo+q6yr0wrth4O06Hk7Rcs
 kHFBOGRcweu/voXc4WJwZ0wRitR3EIpFcLFY4okuwvNufafbSXicAech2SArQxKz7u
 shJFrB+IpwdpA==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id AC6493780029;
 Thu, 29 Feb 2024 10:21:27 +0000 (UTC)
Date: Thu, 29 Feb 2024 12:21:26 +0200
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
 thomas.petazzoni@bootlin.com
Subject: Re: [PATCH v2 5/9] drm/vkms: Re-introduce line-per-line composition
 algorithm
Message-ID: <20240229122126.6bdb1d2f.pekka.paalanen@collabora.com>
In-Reply-To: <Zd35cY6uxP7akjw8@localhost.localdomain>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-5-aa6be2827bb7@bootlin.com>
 <20240226133706.281deb59.pekka.paalanen@collabora.com>
 <Zd35cY6uxP7akjw8@localhost.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/NgwUThjmbjg9x4BlzesBpBe";
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

--Sig_/NgwUThjmbjg9x4BlzesBpBe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Feb 2024 16:02:09 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> [...]
>=20
> > > -static void pre_mul_alpha_blend(struct vkms_frame_info *frame_info,
> > > -				struct line_buffer *stage_buffer,
> > > -				struct line_buffer *output_buffer)
> > > +static void pre_mul_alpha_blend(
> > > +	struct line_buffer *stage_buffer,
> > > +	struct line_buffer *output_buffer,
> > > +	int x_start,
> > > +	int pixel_count)
> > >  {
> > > -	int x_dst =3D frame_info->dst.x1;
> > > -	struct pixel_argb_u16 *out =3D output_buffer->pixels + x_dst;
> > > -	struct pixel_argb_u16 *in =3D stage_buffer->pixels;
> > > -	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> > > -			    stage_buffer->n_pixels);
> > > -
> > > -	for (int x =3D 0; x < x_limit; x++) {
> > > -		out[x].a =3D (u16)0xffff;
> > > -		out[x].r =3D pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
> > > -		out[x].g =3D pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
> > > -		out[x].b =3D pre_mul_blend_channel(in[x].b, out[x].b, in[x].a);
> > > +	struct pixel_argb_u16 *out =3D &output_buffer->pixels[x_start];
> > > +	struct pixel_argb_u16 *in =3D &stage_buffer->pixels[x_start]; =20
> >=20
> > Input buffers and pointers should be const. =20
>=20
> They will be const in v4.
> =20
> > > +
> > > +	for (int i =3D 0; i < pixel_count; i++) {
> > > +		out[i].a =3D (u16)0xffff;
> > > +		out[i].r =3D pre_mul_blend_channel(in[i].r, out[i].r, in[i].a);
> > > +		out[i].g =3D pre_mul_blend_channel(in[i].g, out[i].g, in[i].a);
> > > +		out[i].b =3D pre_mul_blend_channel(in[i].b, out[i].b, in[i].a);
> > >  	}
> > >  } =20
> >=20
> > Somehow the hunk above does not feel like it is part of "re-introduce
> > line-per-line composition algorithm". This function was already running
> > line-by-line. Would it be easy enough to collect this and directly
> > related changes into a separate patch? =20
>=20
> It is not directly related to the reintroduction of line-by-line=20
> algorithm, but in the simplification and maintenability effort, I=20
> changed a bit the function to avoid having multiple place computing the=20
> x_start/pixel_count values. I don't see an interrest to extract it, it=20
> will be just a translation of the few lines into the calling place.

It does make review more difficult, because it makes the patch bigger
and is not explained in the commit message. It is a surprise to a
reviewer, who then needs to think what this means and does it belong
here.

If you explain it in the commit message and note it in the commit
summary line, I think it would become fairly obvious that this patch is
doing two things rather than one.

Therefore, *if* it is easy to extract as a separate patch, then it
would be nice to do so. However, if doing so would require you to write
a bunch of temporary code that the next patch would just rewrite again,
then doing so would be counter-productive.

Patch split is about finding a good trade-off to make things easy for
reviewers:

- Smaller patches are better as long as they are self-standing and
  understandable in isolation, and of course do not regress anything.

- Rewriting the same thing multiple times in the same series is extra
  work for a reviewer and therefore best avoided.

- The simpler the semantic change, the bigger a patch can be and still
  be easy to review.

And all the patch writing rules specific to the kernel project that I
don't know about.

> [...]
>=20
> > > +/**
> > > + * direction_for_rotation() - Helper to get the correct reading dire=
ction for a specific rotation
> > > + *
> > > + * @rotation: rotation to analyze =20
> >=20
> > This is KMS plane rotation property, right?
> >=20
> > So the KMS plane has been rotated by this, and what we want to find is
> > the read direction on the attached FB so that reading returns pixels in
> > the CRTC line/scanout order, right?
> >=20
> > Maybe extend the doc to explain that. =20
>=20
> Is it better?
>=20
>  * direction_for_rotation() - Get the correct reading direction for a giv=
en rotation
>  *
>  * This function will use the @rotation parameter to compute the correct =
reading direction to read
>  * a line from the source buffer.
>  * For example, if the buffer is reflected on X axis, the pixel must be r=
ead from right to left.
>  * @rotation: Rotation to analyze. It correspond the the field @frame_inf=
o.rotation.

I think it is important to define what determines the correct result.
In this case, we want the reading to produce pixels in the CRTC scanout
line order, I believe. If you don't say "CRTC", the reader does not
know what "the correct reading direction" should match to.

> > > + */
> > > +enum pixel_read_direction direction_for_rotation(unsigned int rotati=
on)
> > > +{
> > > +	if (rotation & DRM_MODE_ROTATE_0) {
> > > +		if (rotation & DRM_MODE_REFLECT_X)
> > > +			return READ_LEFT;
> > > +		else
> > > +			return READ_RIGHT;
> > > +	} else if (rotation & DRM_MODE_ROTATE_90) {
> > > +		if (rotation & DRM_MODE_REFLECT_Y)
> > > +			return READ_UP;
> > > +		else
> > > +			return READ_DOWN;
> > > +	} else if (rotation & DRM_MODE_ROTATE_180) {
> > > +		if (rotation & DRM_MODE_REFLECT_X)
> > > +			return READ_RIGHT;
> > > +		else
> > > +			return READ_LEFT;
> > > +	} else if (rotation & DRM_MODE_ROTATE_270) {
> > > +		if (rotation & DRM_MODE_REFLECT_Y)
> > > +			return READ_DOWN;
> > > +		else
> > > +			return READ_UP;
> > > +	}
> > > +	return READ_RIGHT;
> > > +}
> > > +
> > >  /**
> > >   * blend - blend the pixels from all planes and compute crc
> > >   * @wb: The writeback frame buffer metadata
> > > @@ -183,11 +187,11 @@ static void blend(struct vkms_writeback_job *wb,
> > >  {
> > >  	struct vkms_plane_state **plane =3D crtc_state->active_planes;
> > >  	u32 n_active_planes =3D crtc_state->num_active_planes;
> > > -	int y_pos;
> > > =20
> > >  	const struct pixel_argb_u16 background_color =3D { .a =3D 0xffff };
> > > =20
> > >  	size_t crtc_y_limit =3D crtc_state->base.crtc->mode.vdisplay;
> > > +	size_t crtc_x_limit =3D crtc_state->base.crtc->mode.hdisplay; =20
> >=20
> > Wonder why these were size_t, causing needs to cast below... =20
>=20
> For crtc_x_limit I just copied the crtc_y_limit. I will change both to u1=
6=20
> (the type of h/vdisplay).

Don't go unsigned, that can cause unexpected results when mixed in
computations with signed variables.

Oh, the cast was probably not about size but signedness. Indeed, size_t
is unsigned.

I don't see a reason to use a 16-bit size either, it just exposes the
computations to under/overflows that would then be needed to check for.
s32 should be as fast as any, and perhaps enough bits to never
under/overflow in these computations, but please verify that.

> > > =20
> > >  	/*
> > >  	 * The planes are composed line-by-line. It is a necessary complexi=
ty to avoid poor
> > > @@ -198,22 +202,133 @@ static void blend(struct vkms_writeback_job *w=
b,
> > > =20
> > >  		/* The active planes are composed associatively in z-order. */
> > >  		for (size_t i =3D 0; i < n_active_planes; i++) {
> > > -			y_pos =3D get_y_pos(plane[i]->frame_info, y);
> > > +			struct vkms_plane_state *current_plane =3D plane[i];
> > > =20
> > > -			if (!check_limit(plane[i]->frame_info, y_pos))
> > > +			/* Avoid rendering useless lines */
> > > +			if (y < current_plane->frame_info->dst.y1 ||
> > > +			    y >=3D current_plane->frame_info->dst.y2) {
> > >  				continue;
> > > -
> > > -			vkms_compose_row(stage_buffer, plane[i], y_pos);
> > > -			pre_mul_alpha_blend(plane[i]->frame_info, stage_buffer,
> > > -					    output_buffer);
> > > +			}
> > > +
> > > +			/*
> > > +			 * src_px is the line to copy. The initial coordinates are inside=
 the
> > > +			 * destination framebuffer, and then drm_rect_* helpers are used =
to
> > > +			 * compute the correct position into the source framebuffer.
> > > +			 */
> > > +			struct drm_rect src_px =3D DRM_RECT_INIT(
> > > +				current_plane->frame_info->dst.x1, y,
> > > +				drm_rect_width(&current_plane->frame_info->dst), 1);
> > > +			struct drm_rect tmp_src;
> > > +
> > > +			drm_rect_fp_to_int(&tmp_src, &current_plane->frame_info->src);
> > > +
> > > +			/*
> > > +			 * [1]: Clamping src_px to the crtc_x_limit to avoid writing outs=
ide of the
> > > +			 * destination buffer
> > > +			 */
> > > +			src_px.x2 =3D min_t(int, src_px.x2, (int)crtc_x_limit); =20
> >=20
> > Up to and including this point, it would be better if src_px was called
> > dst_px, because only the below computation converts it into actual
> > src_px. =20
>=20
> I agree, it will be changed for the v4. I will also change the name to=20
> `dst_line` and `src_line`.

Alright.

...


> > >  }
> > > =20
> > > -static void *get_packed_src_addr(const struct vkms_frame_info *frame=
_info, int y)
> > > +/**
> > > + * get_step_1x1() - Common helper to compute the correct step value =
between each pixel to read in a
> > > + * certain direction.
> > > + * This must be used only with format where blockh =3D=3D blockw =3D=
=3D 1.
> > > + * In the case when direction is not a valid pixel_read_direction, t=
he returned step is 0, so you
> > > + * must not rely on this result to create a loop variant.
> > > + *
> > > + * @fb Framebuffer to iter on
> > > + * @direction Direction of the reading
> > > + */
> > > +static int get_step_1x1(struct drm_framebuffer *fb, enum pixel_read_=
direction direction,
> > > +			int plane_index)
> > >  {
> > > -	int x_src =3D frame_info->src.x1 >> 16;
> > > -	int y_src =3D y - frame_info->rotated.y1 + (frame_info->src.y1 >> 1=
6);
> > > -
> > > -	return packed_pixels_addr(frame_info, x_src, y_src);
> > > +	switch (direction) {
> > > +	default:
> > > +		DRM_ERROR("Invalid direction for pixel reading: %d\n", direction);
> > > +		return 0; =20
> >=20
> > What I'd do here is move the default: section outside of the switch
> > completely. Then the compiler can warn if any enum value is not handled
> > here. Since every case in the switch is a return statement, falling out
> > of the switch block is the default case. =20
>=20
> Hoo, I did not know that gcc can warn when using enums, I will definitly=
=20
> do it for the v4.
> =20
> > Maybe the enum variable containing an illegal value could be handled
> > more harshly so that callers could rely on this function always
> > returning a good value?
> >=20
> > Just like passing in fb=3DNULL is handled by the kernel as an OOPS. =20
>=20
> I don't think it's a good idea to OOPS inside a driver.

Everyone already do that. Most functions that do not expect to be called
with NULL never check the arguments for NULL. They just OOPS on
dereference if someone passes in NULL. And for a good reason: adding
all those checks is both code churn and it casts doubt: "maybe it is
legal and expected to call this function with NULL sometimes, what good
does that do?".

> An error here is=20
> maybe dangerous, but is not fatal to the kernel. Maybe you know how to do=
=20
> a "local" OOPS to break only this driver and not the whole kernel?

I don't know what the best practices are in the kernel.

> For the v4 I will keep a DRM_ERROR and return 0.

Does that require the caller to check for 0? Could the 0 cause
something else to end up in an endless loop? If it does return 0, how
should a caller handle this case that "cannot" ever happen? Why have
code for something that cannot happen?

Of course it's a trade-off between correctness and limping along
injured, and the kernel tends to strongly lean toward the latter for the
obvious reasons.

> > > +	case READ_RIGHT:
> > > +		return fb->format->char_per_block[plane_index];
> > > +	case READ_LEFT:
> > > +		return -fb->format->char_per_block[plane_index];
> > > +	case READ_DOWN:
> > > +		return (int)fb->pitches[plane_index];
> > > +	case READ_UP:
> > > +		return -(int)fb->pitches[plane_index];
> > > +	}
> > >  }
> > > =20
> > > -static int get_x_position(const struct vkms_frame_info *frame_info, =
int limit, int x)
> > > -{
> > > -	if (frame_info->rotation & (DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_27=
0))
> > > -		return limit - x - 1;
> > > -	return x;
> > > -}
> > > =20
> > >  /*
> > > - * The following  functions take pixel data from the buffer and conv=
ert them to the format
> > > + * The following  functions take pixel data (a, r, g, b, pixel, ...)=
, convert them to the format
> > >   * ARGB16161616 in out_pixel.
> > >   *
> > > - * They are used in the `vkms_compose_row` function to handle multip=
le formats.
> > > + * They are used in the `read_line`s functions to avoid duplicate wo=
rk for some pixel formats.
> > >   */
> > > =20
> > > -static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_argb_u=
16 *out_pixel)
> > > +static void ARGB8888_to_argb_u16(struct pixel_argb_u16 *out_pixel, i=
nt a, int r, int g, int b) =20
> >=20
> > The function name ARGB8888_to_argb_u16() is confusing. It's not taking
> > in ARGB8888 pixels but separate a,r,g,b ints. The only assumption it
> > needs from the pixel format is the 8888 part. =20
>=20
> I don't realy know how to name it. What I like with ARGB8888 is that it's=
=20
> clear that the values are 8 bits and in argb format.

I could even propose=20

static struct pixel_argb_u16
argb_u16_from_u8888(int a, int r, int g, int b)

perhaps. Yes, returning a struct by value. I think it would fit, and
these are supposed to get fully inlined anyway, too.

c.f argb_u16_from_u2101010().

Not a big deal though, I think I'm getting a little bit too involved to
see what would be the most intuitively understandable naming scheme for
someone not familiar with the code.

> Do you think that `argb_u8_to_argb_u16`, with a new structure=20
> pixel_argb_u8 will be better? (like PATCH 6/9 with pixel_yuv_u8).
>=20
> If so, I will introduce the argb_u8 structure in an other commit.

How would you handle 10-bpc formats? Is there a need for
proliferation of bit-depth-specific struct types?

> [...]
>=20
> > > + * The following functions are read_line function for each pixel for=
mat supported by VKMS.
> > >   *
> > > - * This function composes a single row of a plane. It gets the sourc=
e pixels
> > > - * through the y coordinate (see get_packed_src_addr()) and goes lin=
early
> > > - * through the source pixel, reading the pixels and converting it to
> > > - * ARGB16161616 (see the pixel_read() callback). For rotate-90 and r=
otate-270,
> > > - * the source pixels are not traversed linearly. The source pixels a=
re queried
> > > - * on each iteration in order to traverse the pixels vertically.
> > > + * They read a line starting at the point @x_start,@y_start followin=
g the @direction. The result
> > > + * is stored in @out_pixel and in the format ARGB16161616.
> > > + *
> > > + * Those function are very similar, but it is required for performan=
ce reason. In the past, some
> > > + * experiment were done, and with a generic loop the performance are=
 very reduced [1].
> > > + *
> > > + * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-9037-a9=
8f7f33b3a3@riseup.net/
> > >   */
> > > -void vkms_compose_row(struct line_buffer *stage_buffer, struct vkms_=
plane_state *plane, int y)
> > > +
> > > +static void ARGB8888_read_line(struct vkms_frame_info *frame_info, i=
nt x_start, int y_start,
> > > +			       enum pixel_read_direction direction, int count,
> > > +			       struct pixel_argb_u16 out_pixel[])
> > > +{
> > > +	u8 *src_pixels =3D packed_pixels_addr(frame_info, x_start, y_start,=
 0);
> > > +
> > > +	int step =3D get_step_1x1(frame_info->fb, direction, 0);
> > > +
> > > +	while (count) {
> > > +		u8 *px =3D (u8 *)src_pixels;
> > > +
> > > +		ARGB8888_to_argb_u16(out_pixel, px[3], px[2], px[1], px[0]);
> > > +		out_pixel +=3D 1;
> > > +		src_pixels +=3D step;
> > > +		count--; =20
> >=20
> > btw. you could eliminate decrementing 'count' if you computed end
> > address and used while (out_pixel < end). =20
>=20
> Yes, you are right, but after thinking about it, neither out_pixel < end=
=20
> and while (count) are conveying "this loop will copy `count` pixels. I=20
> think a for-loop here is more understandable. There is no ambiguity in th=
e=20
> number of pixels written and less error-prone. I will replace
> 	while (count)=20
> by
> 	for(int i =3D 0; i < count; i++)

I agree that a for-loop is the most obvious way of saying it, but I
also think while (out_pixel < end) is very close too, and so is while (coun=
t).
None of those would make me think twice.

However, I'm thinking of performance here. After all, this is the
hottest code path there is in VKMS. Is the compiler smart enough to
eliminate count-- or i to reduce the number of CPU cycles?


Thanks,
pq

--Sig_/NgwUThjmbjg9x4BlzesBpBe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXgWqYACgkQI1/ltBGq
qqdY3hAAkxCjQGC1S80ldn4Wla92DLQjngYKVjkZh8+PFSdQmCPuyrwQJKuNUn6q
wpNVZLPpVtUVXoIaTJTdViv8P6RYOHxbekhkM3OhYn1DJfsUwKjGD4Zqn8rtuVsu
N3+5fv2hGxXFZOodCmCaMoGW5FqHsQJh3UAqqQihFvzOcYKGtxW1N3pwg16QFpoS
B+0pqfOFFD+05snF2Iry+TsRAuMDR/UzhNh8TRwVHhIqTRsEBhuvpDxijfiC7IF2
cVs6xYGF1OZtI+7d+LK9z44R4TZwguCOEyxO+UGXB2V3EPJHTa4O8RLWfADbQBFH
9iNtG7Q4Op6+w+1iZWqfRCTO3lbMD231ArhPYwMhfPRp9sAfAvMPxrXW4mIk7roR
KCbYhS38qqKfquA82UV+pLXqmi2sTtD0RzwaIpYonzlfk39acPqu9w3FrWqj/Hw0
ltCKhzypCEwej4WtFyCJGs8FFDhH3DXypQWUSmZ46CkxhKrsIz3nVhQtqzd3OOKI
3qsRuR4agGoYZT0+iRkCm/08J6VrRSPO2M4fyo8V3obmdefZAJ1KY3asSq7NONnF
ZJSBimYwdRyXZyNut0iarCkty2bAU0QfADixcGVJ7HXy+GXbqlrfLXlKOKlo4Yl4
b+XhWTUW3U7fKo+WqQQGv1qjYacUsOOPDRwPHm4tHS6O28nXIx8=
=Hl30
-----END PGP SIGNATURE-----

--Sig_/NgwUThjmbjg9x4BlzesBpBe--
