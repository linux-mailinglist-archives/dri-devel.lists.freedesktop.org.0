Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FED64C419A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 10:38:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E4CC10E774;
	Fri, 25 Feb 2022 09:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEF1B10E774
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 09:38:38 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id b9so8382339lfv.7
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 01:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=a6TtODkn68jI9s1RrKzSPNtwmOQL3N+VNDZc10WT7ek=;
 b=CJTtKLVoBtGqaBad5ejE3lpaoPEVhX8maslvGN4zsb6Lfd0hDyNQwNQcY90gkOy//Y
 FfxhCr18Lg8xsgBX1SaidOyswiHXonUjcyMk+3lMDZKJnuuMB9J9dNenFmReWq2fSLrs
 P17woPLzEwWzaQgFnSyUKsI9mVKepiCs9nSk2HWvs5lMya0M4oRUuziZVIg2SFvp8wD3
 l3Ai5CmYWIJ4mew70cnNd6f1cg2HhOtwgpCKRN1Wx2HuJZS41ZfMaEy2u+iOKDI+aqb0
 Cu3HZNIVPOGmnvUdTZZPqVpWtvHSG4GML6xpmd2jh+WQGIsAvyBMFvY7DBQN+1ghFDxn
 Znog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=a6TtODkn68jI9s1RrKzSPNtwmOQL3N+VNDZc10WT7ek=;
 b=G9o6V1UmkajmtjEQihy7AprG7b6itlXlKRHuxphlKwwVvzB0ILFAg0qRIAfOr8WXLm
 LPspASWceDil67fJo/5qXLY1vVb33VdLZGe4JDtR+58uySZ8vQllQaKhEQKFnfOYXlZy
 VYQrSGW2AewRH4dNZecFwWZR+YBzvKyJDqPjwanTPBDRG6nbNYzbxZbd1HXF27PDCj6A
 aoHNjbJWQxK+YhevLAmWymaXFJvK4SGYKmkg+OBELyOX5Fk2W5L7LG22r5nxyE1DBfoQ
 37ypHcNboAHKJP6awSEW+h1aBX41eYnYj9Lmc7vybKyQtkYGZ+xWVOlmDbZlr9yYvZxk
 yMYQ==
X-Gm-Message-State: AOAM532vIm47HTfyjiwr2dI6yvZMr1RHQAjLrenZkk02a+0iDYqllaL0
 vyrPBZgtkQdUGnNJnv4y5k8=
X-Google-Smtp-Source: ABdhPJyc+Jr9rbKxEWqhH5w4J3QY+gnISskZ71OkIa5wDA4N+pAVaqyd3EwazRsZwzALrWPhmS9uRQ==
X-Received: by 2002:a05:6512:202d:b0:437:8f9d:f7d1 with SMTP id
 s13-20020a056512202d00b004378f9df7d1mr4315277lfs.576.1645781916605; 
 Fri, 25 Feb 2022 01:38:36 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 y10-20020a2e9d4a000000b0024608dc3520sm215021ljj.125.2022.02.25.01.38.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Feb 2022 01:38:36 -0800 (PST)
Date: Fri, 25 Feb 2022 11:38:27 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Igor Torrente <igormtorrente@gmail.com>
Subject: Re: [PATCH v4 7/9] drm: vkms: Refactor the plane composer to accept
 new formats
Message-ID: <20220225113827.09204373@eldfell>
In-Reply-To: <CAOA8r4Gv9v9YtAq+vOHZX1DJJrgmajY8cAoYs1sfpOa243gxfQ@mail.gmail.com>
References: <20220121213831.47229-1-igormtorrente@gmail.com>
 <20220121213831.47229-8-igormtorrente@gmail.com>
 <20220210113757.77b0a994@eldfell>
 <CAOA8r4Gv9v9YtAq+vOHZX1DJJrgmajY8cAoYs1sfpOa243gxfQ@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/RaB6tnYtLYEOlDhdg_hIDch";
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
Cc: hamohammed.sa@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 rodrigosiqueiramelo@gmail.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, melissa.srw@gmail.com,
 ~lkcamp/patches@lists.sr.ht, kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/RaB6tnYtLYEOlDhdg_hIDch
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 24 Feb 2022 21:43:01 -0300
Igor Torrente <igormtorrente@gmail.com> wrote:

> Hi Pekka,
>=20
> On 2/10/22 06:37, Pekka Paalanen wrote:
> > On Fri, 21 Jan 2022 18:38:29 -0300
> > Igor Torrente <igormtorrente@gmail.com> wrote:
> > =20
> >> Currently the blend function only accepts XRGB_8888 and ARGB_8888
> >> as a color input.
> >>
> >> This patch refactors all the functions related to the plane composition
> >> to overcome this limitation.
> >>
> >> A new internal format(`struct pixel`) is introduced to deal with all
> >> possible inputs. It consists of 16 bits fields that represent each of
> >> the channels.
> >>
> >> The pixels blend is done using this internal format. And new handlers
> >> are being added to convert a specific format to/from this internal for=
mat.
> >>
> >> So the blend operation depends on these handlers to convert to this co=
mmon
> >> format. The blended result, if necessary, is converted to the writeback
> >> buffer format.
> >>
> >> This patch introduces three major differences to the blend function.
> >> 1 - All the planes are blended at once.
> >> 2 - The blend calculus is done as per line instead of per pixel.
> >> 3 - It is responsible to calculates the CRC and writing the writeback
> >>      buffer(if necessary).
> >>
> >> These changes allow us to allocate way less memory in the intermediate
> >> buffer to compute these operations. Because now we don't need to
> >> have the entire intermediate image lines at once, just one line is
> >> enough.
> >>
> >> | Memory consumption (output dimensions) |
> >> |:--------------------------------------:|
> >> |       Current      |     This patch    |
> >> |:------------------:|:-----------------:|
> >> |   Width * Heigth   |     2 * Width     |
> >>
> >> Beyond memory, we also have a minor performance benefit from all
> >> these changes. Results running the IGT tests `*kms_cursor_crc*`:
> >>
> >> |                 Frametime                  |
> >> |:------------------------------------------:|
> >> |  Implementation |  Current  |  This commit |
> >> |:---------------:|:---------:|:------------:|
> >> | frametime range |  8~22 ms  |    5~18 ms   |
> >> |     Average     |  10.0 ms  |    7.3 ms    |
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> >> ---
> >> V2: Improves the performance drastically, by perfoming the operations
> >>      per-line and not per-pixel(Pekka Paalanen).
> >>      Minor improvements(Pekka Paalanen).
> >>
> >> V3: Changes the code to blend the planes all at once. This improves
> >>      performance, memory consumption, and removes much of the weirdness
> >>      of the V2(Pekka Paalanen and me).
> >>      Minor improvements(Pekka Paalanen and me).
> >>
> >> V4: Rebase the code and adapt it to the new NUM_OVERLAY_PLANES constan=
t.
> >> ---
> >>   drivers/gpu/drm/vkms/Makefile        |   1 +
> >>   drivers/gpu/drm/vkms/vkms_composer.c | 335 +++++++++++++------------=
--
> >>   drivers/gpu/drm/vkms/vkms_formats.c  | 138 +++++++++++
> >>   drivers/gpu/drm/vkms/vkms_formats.h  |  31 +++
> >>   4 files changed, 333 insertions(+), 172 deletions(-)
> >>   create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
> >>   create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h =20
> >
> > Hi Igor,
> >
> > I'm really happy to see this, thanks!
> >
> > I still have some security/robustness and other comments below.
> >
> > I've deleted all the minus lines from the patch to make the new code
> > more clear.
> > =20
> >>
> >> diff --git a/drivers/gpu/drm/vkms/Makefile b/drivers/gpu/drm/vkms/Make=
file
> >> index 72f779cbfedd..1b28a6a32948 100644
> >> --- a/drivers/gpu/drm/vkms/Makefile
> >> +++ b/drivers/gpu/drm/vkms/Makefile
> >> @@ -3,6 +3,7 @@ vkms-y :=3D \
> >>      vkms_drv.o \
> >>      vkms_plane.o \
> >>      vkms_output.o \
> >> +    vkms_formats.o \
> >>      vkms_crtc.o \
> >>      vkms_composer.o \
> >>      vkms_writeback.o
> >> diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vk=
ms/vkms_composer.c
> >> index 95029d2ebcac..9f70fcf84fb9 100644
> >> --- a/drivers/gpu/drm/vkms/vkms_composer.c
> >> +++ b/drivers/gpu/drm/vkms/vkms_composer.c
> >> @@ -9,202 +9,210 @@
> >>   #include <drm/drm_vblank.h>
> >>
> >>   #include "vkms_drv.h"
> >> +#include "vkms_formats.h"
> >>
> >> +static u16 pre_mul_blend_channel(u16 src, u16 dst, u16 alpha)
> >>   {
> >> +    u32 new_color;
> >>
> >> +    new_color =3D (src * 0xffff + dst * (0xffff - alpha));
> >>
> >> +    return DIV_ROUND_UP(new_color, 0xffff); =20
> >
> > Why round-up rather than the usual mathematical rounding? =20
>=20
> AFAIK, this is the only round that's present in the kernel. And if I
> understood correctly it is the round toward positive infinity that we are
> all used to use.

Should be pretty easy to round-up from 0.5 and round-down otherwise.
Just add a different offset than DIV_ROUND_UP does.

Not having a ready-made macro and habits are not good
justifications. The justification needs to be mathematical.

The problem with DIV_ROUND_UP that I see, is that 0x00000001 gets
rounded to 0x0001, and anything that is even slightly above 0xfffe0000
gets rounded to 0xffff. So it seems to me that this adds a bias to the
result.

Is my intuition right or wrong, I'm not sure. I do know that

0xffff * 0xffff =3D 0xfffe0001

so values greater than 0xfffe0001 cannot occur.

That seems to mean that there is exactly one 32-bit value that
DIV_ROUND_UPs to 0x0000 and exactly one 32-bit value that DIV_ROUND_UPs
to 0xffff. That doesn't feel right to me.

Would need to compare to how the blending with real numbers would work.


> >>    */
> >> +static void blend(struct vkms_frame_info *wb_frame_info, =20
> >
> > Using "wb" as short for writeback is... well, it's hard for the me
> > remember at least. Could this not be named simply "writeback"? =20
>=20
> IMHO it's better to use wb instead of writeback for consistency. Given th=
at wb
> is used throughout the vkms code.

Right, so that's a problem for me.

Is any other driver using wb for writeback?

I don't mind using wb in local variables, but in type names I would
personally prefer more descriptive names.


> >> +    int h_dst =3D drm_rect_height(&primary_plane_info->dst);
> >>      int y_limit =3D y_src + h_dst;
> >> +    int y, i; =20
> >
> > It took me a while to understand that all these y-coordinates are CRTC
> > coordinates. Maybe call them crtc_y, crtc_y_begin, crtc_y_end,
> > crtc_y_height, etc.
> > =20
> >> +
> >> +    for (y =3D y_src; y < y_limit; y++) {
> >> +            plane_fmt_func[0](primary_plane_info, y, output_buffer); =
=20
> >
> > This is initializing output_buffer, right? So why do you have the TODO
> > comment about clearing the primary plane above?
> >
> > Is it because the primary plane may not cover the CRTC exactly, the
> > destination rectangle might be bigger or smaller?
> >
> > The output_buffer length should be the CRTC width, right?
> >
> > Maybe the special-casing the primary plane in this code is wrong.
> > crtc_y needs to iterate over the CRTC height starting from zero. Then,
> > you explicitly clear output_buffer to opaque background color, and
> > primary plane becomes just another plane in the array of active planes
> > with no special handling here.
> >
> > That will allow you to support overlay planes *below* the primary plane
> > (as is fairly common in non-PC hardware), and you can even support the
> > background color KMS property. =20
>=20
> I thought that the primary would always cover the entire screen exactly.

Nope. Maybe PC hardware has such limitations, but I'm quite sure there
are display controllers that do not require this. Therefore VKMS should
support the more generic case, and possible offer a configuration knob
to reject atomic state where primary plane is not active or not
covering the whole CRTC in order to be able to test userspace against
such driver behaviour.

After all, background color KMS property exists.

>=20
> So yeah, my patch code assumes that CRTC is the same size as the primary =
plane.
> (and if I'm not mistaken the current version also assumes it).
>=20
> But If this is not the case, where are the CRTC dimensions?
> Are they in the CRTC properties? drm_mode_config?
>=20
> I couldn't find them.

It's the active area of the current video mode, I believe. How that
translated to DRM code, I don't know.


> >> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkm=
s/vkms_formats.c
> >> new file mode 100644
> >> index 000000000000..0d1838d1b835
> >> --- /dev/null
> >> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> >> @@ -0,0 +1,138 @@
> >> +/* SPDX-License-Identifier: GPL-2.0+ */
> >> +
> >> +#include <drm/drm_rect.h>
> >> +#include "vkms_formats.h"
> >> +
> >> +format_transform_func get_fmt_transform_function(u32 format)
> >> +{
> >> +    if (format =3D=3D DRM_FORMAT_ARGB8888)
> >> +            return &ARGB8888_to_ARGB16161616;
> >> +    else
> >> +            return &XRGB8888_to_ARGB16161616; =20
> >
> > In functions like this you should prepare for caller errors. Use a
> > switch, and fail any attempt to use a pixel format it doesn't support.
> > Failing is much better than silently producing garbage or worse: buffer
> > overruns when bytes-per-pixel is not what you expected.
> >
> > What to do on failure depends on whether the failure here is never
> > supposed to happen (follow the kernel style) e.g. malicious userspace
> > cannot trigger it, or if you actually use this function to define the
> > supported for pixel formats. =20
>=20
> No, I don't use this function to define supported formats, It's defined:
> - vkms_writeback.c:15
> - vkms_plane.c:14 and 22
>=20
> And if I'm not mistaken the DRM framework takes care of validation.

Then someone else comes, adds a new pixel format to those files, and
does not even realize get_fmt_transform_function() exists.

If you know that something must already ensure you cannot get
unsupported pixel formats in this function, then I guess some kind of
kernel panic here if you do get an unsupported pixel format would be
appropriate? Or an oops.

That would tell loud and clear to that other person they overlooked
something. Assuming they test the code the new format.

>=20
> >
> > The latter means you'd have a list of all DRM pixel formats and then
> > you'd ask for each one if this function knows it, and if yes, you add
> > the format to the list of supported formats advertised to userspace. I
> > don't know if that would be fine by DRM coding style.
> > =20
> >> +}
> >> +
> >> +format_transform_func get_wb_fmt_transform_function(u32 format)
> >> +{
> >> +    if (format =3D=3D DRM_FORMAT_ARGB8888)
> >> +            return &convert_to_ARGB8888;
> >> +    else
> >> +            return &convert_to_XRGB8888;
> >> +} =20
> >
> > I think you could move the above getter functions to the bottom of the
> > .c file, and make all the four *_to_* functions static, and remove them
> > from the header. =20
>=20
> OK. I will do that.
>=20
> Question, what's the benefits of using static functions?

Making code more contained. When people see that a function is static,
they know it won't be directly referenced from any other file. This
makes understanding easier. It's hygiene too: make everything static
that could be static.

Sometimes it can also have other benefits, like the compiler
automatically inlining the whole thing, and not even emitting the
independent function code. It might also speed up linking, as a static
function cannot be a target.

> > =20
> >> +
> >> +static int pixel_offset(struct vkms_frame_info *frame_info, int x, in=
t y)
> >> +{
> >> +    return frame_info->offset + (y * frame_info->pitch)
> >> +                              + (x * frame_info->cpp);
> >> +}
> >> +
> >> +/*
> >> + * packed_pixels_addr - Get the pointer to pixel of a given pair of c=
oordinates
> >> + *
> >> + * @frame_info: Buffer metadata
> >> + * @x: The x(width) coordinate of the 2D buffer
> >> + * @y: The y(Heigth) coordinate of the 2D buffer
> >> + *
> >> + * Takes the information stored in the frame_info, a pair of coordina=
tes, and
> >> + * returns the address of the first color channel.
> >> + * This function assumes the channels are packed together, i.e. a col=
or channel
> >> + * comes immediately after another in the memory. And therefore, this=
 function
> >> + * doesn't work for YUV with chroma subsampling (e.g. YUV420 and NV21=
).
> >> + */
> >> +static void *packed_pixels_addr(struct vkms_frame_info *frame_info, i=
nt x, int y)
> >> +{
> >> +    int offset =3D pixel_offset(frame_info, x, y);
> >> +
> >> +    return (u8 *)frame_info->map[0].vaddr + offset;
> >> +}
> >> +
> >> +static void *get_packed_src_addr(struct vkms_frame_info *frame_info, =
int y)
> >> +{
> >> +    int x_src =3D frame_info->src.x1 >> 16;
> >> +    int y_src =3D y - frame_info->dst.y1 + (frame_info->src.y1 >> 16);
> >> +
> >> +    return packed_pixels_addr(frame_info, x_src, y_src);
> >> +}
> >> +
> >> +void ARGB8888_to_ARGB16161616(struct vkms_frame_info *frame_info, int=
 y,
> >> +                          struct line_buffer *stage_buffer) =20
> >
> > I'm fairly sure that DRM will one day add exactly ARGB16161616 format.

Oops, I think the format already exists.

> > But that will not be the format you use here (or it might be, but
> > purely accidentally and depending on machine endianess and whatnot), so
> > I would suggest inventing a new name. Also use the same name for the
> > struct to hold a single pixel.
> >
> > E.g. struct pixel_argb_u16 =20
>=20
> I'm terrible with names of variables, functions, etc. I will end-up with
> ARGB8888_to_argb_u16.

Sounds fine.

>=20
> I have a patch with the implementation of nv12 and YUV420 formats, but
> I don't know how to test it because the ".*kms_plane@pixel-format*" igt t=
est
> doesn't support these formats (And also it isn't working anymore with my =
hack).
>=20
> Do you know how to test it?

I think the best way would be to teach IGT to test it. Then everyone
will automatically benefit from it.

I don't really know anything about IGT code.

FWIW, Weston has some YUV testing code I wrote in
tests/yuv-buffer-test.c for the color conversions, but it's very
limited scope (only BT.601, only limited range, and ignores chroma
siting).


Thanks,
pq

--Sig_/RaB6tnYtLYEOlDhdg_hIDch
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmIYo5MACgkQI1/ltBGq
qqcE9hAArvb+zue8OGNqArsYKrwO9IRe3axODNDpD6uCxXNqc9lVTOBiSeZsC7sR
prJ3ykgKDvTiEi9/NGfynjAzp7JlwFd4/3fIrZZPZemBe52jd5huOZ7lmbJ0IWTs
hmQpaq6p5QQ8EdPeHkakuSWL5ZnQA46jwCvoLREbykil4rcqLd1D75lHOL6PhwFd
OIH9MaAfdCLyRzSYGJVLHy+cTuldlZ0S1SBRHBqZZD/PXlVJGOSO+nVI/syU3H/L
Ox+DY7XiL+jU3FzTRQrerjQ+P1Pvr/zJAWKfsiDu4YgQac4AYSxzDeyFzpoKF/iz
htCRp2srUJqED+ENYKL3Gc6f2HFDvFCGZ8Ddv9k+lc3d7msY2t1bjN2vljQMAg/Q
cl4wSnJUBkO7YBBV8ITnMeDGfZ4CQtKU7EBifOj1IU+u9+Eygh+hXGqd1UgCRQP+
gQah38P1BeAoJOKR0RCQgZ5wD5kKSSwKQXKD+2TCiBwLtZZ0ETSXX2RoJmWmMbTV
/gTauwRJUn6dJrbyfYmEvLrLTO6aJObAdvRK+fwm0CFm5+O/Wh9EG7eAOIVCjzX2
gxMM9mOb1RAdoYAvWK40OXIxLmLXP87OCBgtvwA25wLwU84gjG6Bn7cLlP16Mq73
cqg3KEDpIjnZECRmWRYrZZYIdhz0I7MJPM35w9rX8n2nQxgZZD4=
=tNxy
-----END PGP SIGNATURE-----

--Sig_/RaB6tnYtLYEOlDhdg_hIDch--
