Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D557871A3E
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 11:10:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8112E10E250;
	Tue,  5 Mar 2024 10:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="DiHh4CYb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 118C610E250
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 10:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709633415;
 bh=LEvS3THCXSnbbJ917EwuVq0Outm9vjRC0D1AiTI7peU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DiHh4CYb1Vam8ZhJr6J2CGii21aJVAWCxEtIN56QVUS77LjUG5ABhU8WJLu61mIin
 XFGW0h8EuTUgTBcjMWU4xGibsrIRZlfSp+e+B+g011+/8CLTcHJCgscYVl6Nv2P3Qq
 ZMd72rLIQ1LgdU7HMtqX6LadK2Bvlz/Af9t+3lXHbbDkBkvKfRCukuDzpSzrTZhIxu
 FIgtkOvrxIukHEB37U3G5dONPCgbyX2NSAp+73LL5UYP3oefhLvOybrBKvhSYRGv9I
 nlsx7ZuKM0/mUIOOwtOR3BHnNh4xUzMV8Y+vuvRLrFXfk1ianJWvk8mhDR16p06ZxI
 trvktPJqz4PqA==
Received: from eldfell (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: pq)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 85555378045F;
 Tue,  5 Mar 2024 10:10:14 +0000 (UTC)
Date: Tue, 5 Mar 2024 12:10:13 +0200
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
Message-ID: <20240305121013.4088dc21.pekka.paalanen@collabora.com>
In-Reply-To: <ZeXooXdha4tSGkad@localhost.localdomain>
References: <20240223-yuv-v2-0-aa6be2827bb7@bootlin.com>
 <20240223-yuv-v2-5-aa6be2827bb7@bootlin.com>
 <20240226133706.281deb59.pekka.paalanen@collabora.com>
 <Zd35cY6uxP7akjw8@localhost.localdomain>
 <20240229122126.6bdb1d2f.pekka.paalanen@collabora.com>
 <ZeXooXdha4tSGkad@localhost.localdomain>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/O9jsmDku=QpPp+ByYlJKfvX";
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

--Sig_/O9jsmDku=QpPp+ByYlJKfvX
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 4 Mar 2024 16:28:33 +0100
Louis Chauvet <louis.chauvet@bootlin.com> wrote:

> Le 29/02/24 - 12:21, Pekka Paalanen a =C3=A9crit :
> > On Tue, 27 Feb 2024 16:02:09 +0100
> > Louis Chauvet <louis.chauvet@bootlin.com> wrote:
> >  =20
> > > [...]
> > >  =20
> > > > > -static void pre_mul_alpha_blend(struct vkms_frame_info *frame_in=
fo,
> > > > > -				struct line_buffer *stage_buffer,
> > > > > -				struct line_buffer *output_buffer)
> > > > > +static void pre_mul_alpha_blend(
> > > > > +	struct line_buffer *stage_buffer,
> > > > > +	struct line_buffer *output_buffer,
> > > > > +	int x_start,
> > > > > +	int pixel_count)
> > > > >  {
> > > > > -	int x_dst =3D frame_info->dst.x1;
> > > > > -	struct pixel_argb_u16 *out =3D output_buffer->pixels + x_dst;
> > > > > -	struct pixel_argb_u16 *in =3D stage_buffer->pixels;
> > > > > -	int x_limit =3D min_t(size_t, drm_rect_width(&frame_info->dst),
> > > > > -			    stage_buffer->n_pixels);
> > > > > -
> > > > > -	for (int x =3D 0; x < x_limit; x++) {
> > > > > -		out[x].a =3D (u16)0xffff;
> > > > > -		out[x].r =3D pre_mul_blend_channel(in[x].r, out[x].r, in[x].a);
> > > > > -		out[x].g =3D pre_mul_blend_channel(in[x].g, out[x].g, in[x].a);
> > > > > -		out[x].b =3D pre_mul_blend_channel(in[x].b, out[x].b, in[x].a);
> > > > > +	struct pixel_argb_u16 *out =3D &output_buffer->pixels[x_start];
> > > > > +	struct pixel_argb_u16 *in =3D &stage_buffer->pixels[x_start];  =
 =20
> > > >=20
> > > > Input buffers and pointers should be const.   =20
> > >=20
> > > They will be const in v4.
> > >   =20
> > > > > +
> > > > > +	for (int i =3D 0; i < pixel_count; i++) {
> > > > > +		out[i].a =3D (u16)0xffff;
> > > > > +		out[i].r =3D pre_mul_blend_channel(in[i].r, out[i].r, in[i].a);
> > > > > +		out[i].g =3D pre_mul_blend_channel(in[i].g, out[i].g, in[i].a);
> > > > > +		out[i].b =3D pre_mul_blend_channel(in[i].b, out[i].b, in[i].a);
> > > > >  	}
> > > > >  }   =20
> > > >=20
> > > > Somehow the hunk above does not feel like it is part of "re-introdu=
ce
> > > > line-per-line composition algorithm". This function was already run=
ning
> > > > line-by-line. Would it be easy enough to collect this and directly
> > > > related changes into a separate patch?   =20
> > >=20
> > > It is not directly related to the reintroduction of line-by-line=20
> > > algorithm, but in the simplification and maintenability effort, I=20
> > > changed a bit the function to avoid having multiple place computing t=
he=20
> > > x_start/pixel_count values. I don't see an interrest to extract it, i=
t=20
> > > will be just a translation of the few lines into the calling place. =
=20
> >=20
> > It does make review more difficult, because it makes the patch bigger
> > and is not explained in the commit message. It is a surprise to a
> > reviewer, who then needs to think what this means and does it belong
> > here.
> >=20
> > If you explain it in the commit message and note it in the commit
> > summary line, I think it would become fairly obvious that this patch is
> > doing two things rather than one.
> >=20
> > Therefore, *if* it is easy to extract as a separate patch, then it
> > would be nice to do so. However, if doing so would require you to write
> > a bunch of temporary code that the next patch would just rewrite again,
> > then doing so would be counter-productive.
> >=20
> > Patch split is about finding a good trade-off to make things easy for
> > reviewers:
> >=20
> > - Smaller patches are better as long as they are self-standing and
> >   understandable in isolation, and of course do not regress anything.
> >=20
> > - Rewriting the same thing multiple times in the same series is extra
> >   work for a reviewer and therefore best avoided.
> >=20
> > - The simpler the semantic change, the bigger a patch can be and still
> >   be easy to review.
> >=20
> > And all the patch writing rules specific to the kernel project that I
> > don't know about. =20
>=20
> I will extract it in "drm/vkms: Avoid computing blending limits inside th=
e=20
> blend function". It's not very relevant by itself, but it make the main=20
> patch easier to read.

Thank you.


> > > [...]
> > >  =20
> > > > > +/**
> > > > > + * direction_for_rotation() - Helper to get the correct reading =
direction for a specific rotation
> > > > > + *
> > > > > + * @rotation: rotation to analyze   =20
> > > >=20
> > > > This is KMS plane rotation property, right?
> > > >=20
> > > > So the KMS plane has been rotated by this, and what we want to find=
 is
> > > > the read direction on the attached FB so that reading returns pixel=
s in
> > > > the CRTC line/scanout order, right?
> > > >=20
> > > > Maybe extend the doc to explain that.   =20
> > >=20
> > > Is it better?
> > >=20
> > >  * direction_for_rotation() - Get the correct reading direction for a=
 given rotation
> > >  *
> > >  * This function will use the @rotation parameter to compute the corr=
ect reading direction to read
> > >  * a line from the source buffer.
> > >  * For example, if the buffer is reflected on X axis, the pixel must =
be read from right to left.
> > >  * @rotation: Rotation to analyze. It correspond the the field @frame=
_info.rotation. =20
> >=20
> > I think it is important to define what determines the correct result.
> > In this case, we want the reading to produce pixels in the CRTC scanout
> > line order, I believe. If you don't say "CRTC", the reader does not
> > know what "the correct reading direction" should match to. =20
>=20
> Is this a better explanation?
>=20
>  * This function will use the @rotation setting of a source plane to comp=
ute the reading
>  * direction in this plane which correspond to a left to right writing in=
 the CRTC.
>  * For example, if the buffer is reflected on X axis, the pixel must be r=
ead from right to left
>  * to be written from left to right on the CRTC.

Perfect!


>=20
> > > > > + */
> > > > > +enum pixel_read_direction direction_for_rotation(unsigned int ro=
tation)
> > > > > +{
> > > > > +	if (rotation & DRM_MODE_ROTATE_0) {
> > > > > +		if (rotation & DRM_MODE_REFLECT_X)
> > > > > +			return READ_LEFT;
> > > > > +		else
> > > > > +			return READ_RIGHT;
> > > > > +	} else if (rotation & DRM_MODE_ROTATE_90) {
> > > > > +		if (rotation & DRM_MODE_REFLECT_Y)
> > > > > +			return READ_UP;
> > > > > +		else
> > > > > +			return READ_DOWN;
> > > > > +	} else if (rotation & DRM_MODE_ROTATE_180) {
> > > > > +		if (rotation & DRM_MODE_REFLECT_X)
> > > > > +			return READ_RIGHT;
> > > > > +		else
> > > > > +			return READ_LEFT;
> > > > > +	} else if (rotation & DRM_MODE_ROTATE_270) {
> > > > > +		if (rotation & DRM_MODE_REFLECT_Y)
> > > > > +			return READ_DOWN;
> > > > > +		else
> > > > > +			return READ_UP;
> > > > > +	}
> > > > > +	return READ_RIGHT;
> > > > > +}
> > > > > +
> > > > >  /**
> > > > >   * blend - blend the pixels from all planes and compute crc
> > > > >   * @wb: The writeback frame buffer metadata
> > > > > @@ -183,11 +187,11 @@ static void blend(struct vkms_writeback_job=
 *wb,
> > > > >  {
> > > > >  	struct vkms_plane_state **plane =3D crtc_state->active_planes;
> > > > >  	u32 n_active_planes =3D crtc_state->num_active_planes;
> > > > > -	int y_pos;
> > > > > =20
> > > > >  	const struct pixel_argb_u16 background_color =3D { .a =3D 0xfff=
f };
> > > > > =20
> > > > >  	size_t crtc_y_limit =3D crtc_state->base.crtc->mode.vdisplay;
> > > > > +	size_t crtc_x_limit =3D crtc_state->base.crtc->mode.hdisplay;  =
 =20
> > > >=20
> > > > Wonder why these were size_t, causing needs to cast below...   =20
> > >=20
> > > For crtc_x_limit I just copied the crtc_y_limit. I will change both t=
o u16=20
> > > (the type of h/vdisplay). =20
> >=20
> > Don't go unsigned, that can cause unexpected results when mixed in
> > computations with signed variables. =20
>=20
> I will replace them with int.
> =20
> > Oh, the cast was probably not about size but signedness. Indeed, size_t
> > is unsigned.
> >=20
> > I don't see a reason to use a 16-bit size either, it just exposes the
> > computations to under/overflows that would then be needed to check for.
> > s32 should be as fast as any, and perhaps enough bits to never
> > under/overflow in these computations, but please verify that. =20
>=20
> I just suggested u16 because it's the type of vdisplay/hdisplay. It was=20
> not for performance reason.

Right. It's not uncommon store a value in a storage efficient type that
may also disallow illegal values, and then use a different type while
actually computing with it in order to not provoke too obscure C
language rules most people never heard of, to avoid over/underflows, or
to just avoid undefined behaviour.

...

> > > > > +static int get_step_1x1(struct drm_framebuffer *fb, enum pixel_r=
ead_direction direction,
> > > > > +			int plane_index)
> > > > >  {
> > > > > -	int x_src =3D frame_info->src.x1 >> 16;
> > > > > -	int y_src =3D y - frame_info->rotated.y1 + (frame_info->src.y1 =
>> 16);
> > > > > -
> > > > > -	return packed_pixels_addr(frame_info, x_src, y_src);
> > > > > +	switch (direction) {
> > > > > +	default:
> > > > > +		DRM_ERROR("Invalid direction for pixel reading: %d\n", directi=
on);
> > > > > +		return 0;   =20
> > > >=20
> > > > What I'd do here is move the default: section outside of the switch
> > > > completely. Then the compiler can warn if any enum value is not han=
dled
> > > > here. Since every case in the switch is a return statement, falling=
 out
> > > > of the switch block is the default case.   =20
> > >=20
> > > Hoo, I did not know that gcc can warn when using enums, I will defini=
tly=20
> > > do it for the v4.
> > >   =20
> > > > Maybe the enum variable containing an illegal value could be handled
> > > > more harshly so that callers could rely on this function always
> > > > returning a good value?
> > > >=20
> > > > Just like passing in fb=3DNULL is handled by the kernel as an OOPS.=
   =20
> > >=20
> > > I don't think it's a good idea to OOPS inside a driver. =20
> >=20
> > Everyone already do that. Most functions that do not expect to be called
> > with NULL never check the arguments for NULL. They just OOPS on
> > dereference if someone passes in NULL. And for a good reason: adding
> > all those checks is both code churn and it casts doubt: "maybe it is
> > legal and expected to call this function with NULL sometimes, what good
> > does that do?". =20
>=20
> I agree that adding something like=20
>=20
> 	if (direction_is_valid) pr_err("Invalid direction")
>=20
> is useless, but as I already have the switch, it cost nothing to warn if=
=20
> something gone wrong. I will just replace this simple DRM_ERROR with a=20
> WARN_ONCE to be more verbose about "it is a bug".

Sounds good to me, and I hope kernel maintainers would agree.


> > > An error here is=20
> > > maybe dangerous, but is not fatal to the kernel. Maybe you know how t=
o do=20
> > > a "local" OOPS to break only this driver and not the whole kernel? =20
> >=20
> > I don't know what the best practices are in the kernel.
> > =20
> > > For the v4 I will keep a DRM_ERROR and return 0. =20
> >=20
> > Does that require the caller to check for 0? Could the 0 cause
> > something else to end up in an endless loop? If it does return 0, how
> > should a caller handle this case that "cannot" ever happen? Why have
> > code for something that cannot happen? =20
>=20
> I have to return something, otherwise the compiler will complain about it.
>=20
> To avoid for future developers surprise, I added this information in the=
=20
> comment. This way the user don't have to read the code to understand how=
=20
> much he can rely on this value.
>=20
> If the caller can trust his direction, he don't have to worry about this.=
=20
> If he can't trust his direction, he know that the returned value can be=20
> zero, and thus can't be used for a loop variant.

There should not be "untrusted" values to begin with at this point,
anything that comes from outside of the kernel should have already been
sanitised. This is about kernel bugs though. Bugs cannot be predicted,
nor can anyone guarantee to write bug-free code. Hence, the direction
value is always "somewhat untrusted". We're being paranoid about bugs
that might happen and trying to ensure the kernel can limp along
regardless, while also trying to minimise the amount of code that
"cannot" ever be reached.

> The zero is also nice because it does not interfere with the normal=20
> behavior of this function. If the returned value is not zero, it's the=20
> correct step to use from one pixel to an other.

If you expect the caller needing to check for the "cannot happen" case,
returning a unique error value is fine. If you expect the caller to
never need to think of the "cannot happen" case, you should return a
value that is "safe", if such value exists. "Safe" here means using it
will not result in grave bugs like bad memory access, but it also won't
produce expected results unless by accident.

This getting perhaps a bit too philosophical, so don't mind about this
too much if it feels strange.

> > Of course it's a trade-off between correctness and limping along
> > injured, and the kernel tends to strongly lean toward the latter for the
> > obvious reasons.
> >  =20
> > > > > +	case READ_RIGHT:
> > > > > +		return fb->format->char_per_block[plane_index];
> > > > > +	case READ_LEFT:
> > > > > +		return -fb->format->char_per_block[plane_index];
> > > > > +	case READ_DOWN:
> > > > > +		return (int)fb->pitches[plane_index];
> > > > > +	case READ_UP:
> > > > > +		return -(int)fb->pitches[plane_index];
> > > > > +	}
> > > > >  }
> > > > > =20
> > > > > -static int get_x_position(const struct vkms_frame_info *frame_in=
fo, int limit, int x)
> > > > > -{
> > > > > -	if (frame_info->rotation & (DRM_MODE_REFLECT_X | DRM_MODE_ROTAT=
E_270))
> > > > > -		return limit - x - 1;
> > > > > -	return x;
> > > > > -}
> > > > > =20
> > > > >  /*
> > > > > - * The following  functions take pixel data from the buffer and =
convert them to the format
> > > > > + * The following  functions take pixel data (a, r, g, b, pixel, =
...), convert them to the format
> > > > >   * ARGB16161616 in out_pixel.
> > > > >   *
> > > > > - * They are used in the `vkms_compose_row` function to handle mu=
ltiple formats.
> > > > > + * They are used in the `read_line`s functions to avoid duplicat=
e work for some pixel formats.
> > > > >   */
> > > > > =20
> > > > > -static void ARGB8888_to_argb_u16(u8 *src_pixels, struct pixel_ar=
gb_u16 *out_pixel)
> > > > > +static void ARGB8888_to_argb_u16(struct pixel_argb_u16 *out_pixe=
l, int a, int r, int g, int b)   =20
> > > >=20
> > > > The function name ARGB8888_to_argb_u16() is confusing. It's not tak=
ing
> > > > in ARGB8888 pixels but separate a,r,g,b ints. The only assumption it
> > > > needs from the pixel format is the 8888 part.   =20
> > >=20
> > > I don't realy know how to name it. What I like with ARGB8888 is that =
it's=20
> > > clear that the values are 8 bits and in argb format. =20
> >=20
> > I could even propose=20
> >=20
> > static struct pixel_argb_u16
> > argb_u16_from_u8888(int a, int r, int g, int b)
> >=20
> > perhaps. Yes, returning a struct by value. I think it would fit, and
> > these are supposed to get fully inlined anyway, too.
> >=20
> > c.f argb_u16_from_u2101010(). =20
>=20
> I don't find this method, but I got and like the idea, I will change the=
=20
> callback to this in the v4.

I mean, there is no support for 10-bpc formats in VKMS yet IIRC, but
there should be one day, so thinking about how that would fit in the
naming scheme is nice.

> > Not a big deal though, I think I'm getting a little bit too involved to
> > see what would be the most intuitively understandable naming scheme for
> > someone not familiar with the code.
> > =20
> > > Do you think that `argb_u8_to_argb_u16`, with a new structure=20
> > > pixel_argb_u8 will be better? (like PATCH 6/9 with pixel_yuv_u8).
> > >=20
> > > If so, I will introduce the argb_u8 structure in an other commit. =20
> >=20
> > How would you handle 10-bpc formats? Is there a need for
> > proliferation of bit-depth-specific struct types? =20
>=20
> No, I don't think it's good to multiply things. I will patch Arthur's=20
> patches to avoid the pixel_yuv_u8 structure.
>=20
> > > [...]
> > >  =20
> > > > > + * The following functions are read_line function for each pixel=
 format supported by VKMS.
> > > > >   *
> > > > > - * This function composes a single row of a plane. It gets the s=
ource pixels
> > > > > - * through the y coordinate (see get_packed_src_addr()) and goes=
 linearly
> > > > > - * through the source pixel, reading the pixels and converting i=
t to
> > > > > - * ARGB16161616 (see the pixel_read() callback). For rotate-90 a=
nd rotate-270,
> > > > > - * the source pixels are not traversed linearly. The source pixe=
ls are queried
> > > > > - * on each iteration in order to traverse the pixels vertically.
> > > > > + * They read a line starting at the point @x_start,@y_start foll=
owing the @direction. The result
> > > > > + * is stored in @out_pixel and in the format ARGB16161616.
> > > > > + *
> > > > > + * Those function are very similar, but it is required for perfo=
rmance reason. In the past, some
> > > > > + * experiment were done, and with a generic loop the performance=
 are very reduced [1].
> > > > > + *
> > > > > + * [1]: https://lore.kernel.org/dri-devel/d258c8dc-78e9-4509-903=
7-a98f7f33b3a3@riseup.net/
> > > > >   */
> > > > > -void vkms_compose_row(struct line_buffer *stage_buffer, struct v=
kms_plane_state *plane, int y)
> > > > > +
> > > > > +static void ARGB8888_read_line(struct vkms_frame_info *frame_inf=
o, int x_start, int y_start,
> > > > > +			       enum pixel_read_direction direction, int count,
> > > > > +			       struct pixel_argb_u16 out_pixel[])
> > > > > +{
> > > > > +	u8 *src_pixels =3D packed_pixels_addr(frame_info, x_start, y_st=
art, 0);
> > > > > +
> > > > > +	int step =3D get_step_1x1(frame_info->fb, direction, 0);
> > > > > +
> > > > > +	while (count) {
> > > > > +		u8 *px =3D (u8 *)src_pixels;
> > > > > +
> > > > > +		ARGB8888_to_argb_u16(out_pixel, px[3], px[2], px[1], px[0]);
> > > > > +		out_pixel +=3D 1;
> > > > > +		src_pixels +=3D step;
> > > > > +		count--;   =20
> > > >=20
> > > > btw. you could eliminate decrementing 'count' if you computed end
> > > > address and used while (out_pixel < end).   =20
> > >=20
> > > Yes, you are right, but after thinking about it, neither out_pixel < =
end=20
> > > and while (count) are conveying "this loop will copy `count` pixels. =
I=20
> > > think a for-loop here is more understandable. There is no ambiguity i=
n the=20
> > > number of pixels written and less error-prone. I will replace
> > > 	while (count)=20
> > > by
> > > 	for(int i =3D 0; i < count; i++) =20
> >=20
> > I agree that a for-loop is the most obvious way of saying it, but I
> > also think while (out_pixel < end) is very close too, and so is while (=
count).
> > None of those would make me think twice.
> >
> > However, I'm thinking of performance here. After all, this is the
> > hottest code path there is in VKMS. Is the compiler smart enough to
> > eliminate count-- or i to reduce the number of CPU cycles? =20
>=20
> You are proably right, I will change it to out_pixel < end.

Don't trust my word without benchmarking it. ;-)


Thanks,
pq

--Sig_/O9jsmDku=QpPp+ByYlJKfvX
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmXm74UACgkQI1/ltBGq
qqdx+xAAhsLJ3r3KAjiurGDA+9wP+eZjaqbV/W60JMEa6gjS+h2lKobjz7lFSkcJ
KRpR8WTjXnhvrvs7bPG00XXiT6gsLtoDVEBNvT+NvL45CQCakpwmwRcHu4OIpU/Z
SzAFqqowZXQ2Fq/x/4YWSOB7qXpYjRVIsW7yuU5VmmtkgE+BNSyjawmlUhKvyfx6
AxNg4XtO8QT6P0rn76/JIOQAVXqTX1JOLhEIbfXkh+JgA2GyVMB9AGG3NA3HV7ET
4VF2BsoBlIQWXbmujlrG/2LGIGDJr90HV37jwfkzm91j9dffSiUAohCVlAnyk5Bt
PH6fz2RCYWNCQxZMgSQf8WxSvmtHcp67G/0IBxNxtB418PjdVSSfPr7vNVbZUqQF
KuiCLeYxGISZiTnH/43UIgDon6kMonrp/2rqD8OUI1fpPtOhUv6NgQmEN21TwMet
Qy5zxQ9AueGXqsX37b20ZMLKmoD+ltPlhO4yjTYSfXoCxBpbAQuJs2esGn6dcfB9
c2g+EDfiGOmUT3MipTw/KUH+a48A+Lx9eDNq39kQDhaqlIfgH3O4sHqt4bgbXTct
tRY6Gvv+Brvsqe0mXGgx0Y32U0SjI/nbX/rjlJG8liZqUl/ZMPXG0HVhR9gvs/9K
Los1RyfGdg7LyKBA7UmYkL7pY48WDDhlKBdjK1J8G8vcDGZ2/WQ=
=VTv0
-----END PGP SIGNATURE-----

--Sig_/O9jsmDku=QpPp+ByYlJKfvX--
