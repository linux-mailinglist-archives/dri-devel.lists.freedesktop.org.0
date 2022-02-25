Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F344C3AB8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 02:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A371510E1B3;
	Fri, 25 Feb 2022 01:04:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112b.google.com (mail-yw1-x112b.google.com
 [IPv6:2607:f8b0:4864:20::112b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB1C10E1A6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 01:04:09 +0000 (UTC)
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-2d07ae0b1c0so17620647b3.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 17:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fLq9vithbO7XrDPJ5SVtS9ffuwguRZsBMFjHiFpAmX4=;
 b=mxUXn/bSHNuGrCPkjZqgqPVf5sqeve57DFDKoGvSCBRmAQmRfxipuIiJEYygEFg8/c
 /9g9jQX5rNFUsl+V+4OFcfX9Cu12y9yjld065ueFDtAkz72cnGtiLod2AbBZl/+jnQ9q
 AHmCCQqIEyfsl9KwZQkYwVTuG6+TgzNB7N1dmumvfFXzypi5O21oUA8vEoib3eRYKvQO
 zbdimuwi/Oc9aIKTXB6F+44uaKqFLjoQblmnwM3XUJmjAFs96W716AMHRIrYzCn3/Iyi
 xsiPGVsdzH9IxSbGe5MY4lYUf1LxuxtrAALcJIbv3YhKtcU8nDMhRrVuaaHPZ3lSoYM3
 bdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fLq9vithbO7XrDPJ5SVtS9ffuwguRZsBMFjHiFpAmX4=;
 b=Fu6Gj4POg7jStxW5uNjzJ7FCBPlgHXDTCezCi4O8G8Dxu42mMgsg8T+nljTe2ubyFX
 T/4TFYTtY5RXxvaKBHqZjmmArGCe7CIPNnYF24LoxUxwCMBUj05ycNAAiGfdTymZbzrK
 nUgjBajd7FQ7m6YFBZk5VJHIDnRHdyR5b7VxXDPwUpCKMx6w906TJHJi8+Dv6A6EYwnA
 76yN9+NeUdPxpbruPSfSXh5u8wqn7ZIfH3VguZpF7NRRhBQMvRVdGtgKu2OsLqVt45sc
 IitMBI+QRX4j/bsif0tDIVBprnjPTgzQZ9mdM0joIEypLwceBnxBbBQixzoFsRKpyPvr
 hegg==
X-Gm-Message-State: AOAM532YzXnvBd8rcRIpDTkd7+L2/ATjueZokRTpCxjmCVFYhD58DwCj
 q5wvO7qeVo+xfepAA5BukTczBJpBlAtuCaCYsGU=
X-Google-Smtp-Source: ABdhPJxlwbtJxwRyO+74oBoG7/Wn2x/N2mqJZa1LGnX0Wx8wFmQe9nLMcwaHPswcp6wYia4+9/O0Q6bWE9CJAczkD2U=
X-Received: by 2002:a81:a14d:0:b0:2d6:8052:31b9 with SMTP id
 y74-20020a81a14d000000b002d6805231b9mr5135033ywg.241.1645751048312; Thu, 24
 Feb 2022 17:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20220121213831.47229-1-igormtorrente@gmail.com>
 <20220121213831.47229-10-igormtorrente@gmail.com>
 <20220210115039.588996bd@eldfell>
In-Reply-To: <20220210115039.588996bd@eldfell>
From: Igor Torrente <igormtorrente@gmail.com>
Date: Thu, 24 Feb 2022 22:03:42 -0300
Message-ID: <CAOA8r4G5aMSv9o508B9icdNuaKF4-9zU9KsTW1nG1wCZ6nKfbA@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] drm: vkms: Add support to the RGB565 format
To: Pekka Paalanen <ppaalanen@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000009f9d3605d8cd4605"
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
 ~lkcamp/patches@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--0000000000009f9d3605d8cd4605
Content-Type: text/plain; charset="UTF-8"

Hi Pekka,

On Thu, Feb 10, 2022 at 6:50 AM Pekka Paalanen <ppaalanen@gmail.com> wrote:

> On Fri, 21 Jan 2022 18:38:31 -0300
> Igor Torrente <igormtorrente@gmail.com> wrote:
>
> > Adds this common format to vkms.
> >
> > This commit also adds new helper macros to deal with fixed-point
> > arithmetic.
> >
> > It was done to improve the precision of the conversion to ARGB16161616
> > since the "conversion ratio" is not an integer.
> >
> > Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
> > ---
> > V3: Adapt the handlers to the new format introduced in patch 7 V3.
> > ---
> >  drivers/gpu/drm/vkms/vkms_formats.c   | 74 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/vkms/vkms_formats.h   |  6 +++
> >  drivers/gpu/drm/vkms/vkms_plane.c     |  6 ++-
> >  drivers/gpu/drm/vkms/vkms_writeback.c |  3 +-
> >  4 files changed, 86 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.c
> b/drivers/gpu/drm/vkms/vkms_formats.c
> > index 661da39d1276..dc612882dd8c 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.c
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> > @@ -11,6 +11,8 @@ format_transform_func get_fmt_transform_function(u32
> format)
> >               return &get_ARGB16161616;
> >       else if (format == DRM_FORMAT_XRGB16161616)
> >               return &XRGB16161616_to_ARGB16161616;
> > +     else if (format == DRM_FORMAT_RGB565)
> > +             return &RGB565_to_ARGB16161616;
> >       else
> >               return &XRGB8888_to_ARGB16161616;
> >  }
> > @@ -23,6 +25,8 @@ format_transform_func
> get_wb_fmt_transform_function(u32 format)
> >               return &convert_to_ARGB16161616;
> >       else if (format == DRM_FORMAT_XRGB16161616)
> >               return &convert_to_XRGB16161616;
> > +     else if (format == DRM_FORMAT_RGB565)
> > +             return &convert_to_RGB565;
> >       else
> >               return &convert_to_XRGB8888;
> >  }
> > @@ -33,6 +37,26 @@ static int pixel_offset(struct vkms_frame_info
> *frame_info, int x, int y)
> >                                 + (x * frame_info->cpp);
> >  }
> >
> > +/*
> > + * FP stands for _Fixed Point_ and **not** _Float Point_
>
> Is it common in the kernel that FP always means fixed-point?
>

I cannot say for sure, but I don't think so. I put it for people like me
that goes automatically to Floating-Point because never worked with
fixed-point before.


>
> If there is any doubt about that, I'd suggest using "fixed" and "float"
> to avoid misunderstandings.
>
> And, since you are not supposed to use floats in the kernel unless you
> really really must and you do all the preparations necessary (which you
> don't here), maybe replace the "float" with a fraction.
>
> In other words, write a macro that takes (65535, 31) as arguments
> instead of a float, when converting to fixed-point. Then you don't have
> to use those strange decimal constants either.
>

It looks better, I will try to implement this.


> > + * LF stands for Long Float (i.e. double)
> > + * The following macros help doing fixed point arithmetic.
> > + */
> > +/*
> > + * With FP scale 15 we have 17 and 15 bits of integer and fractional
> parts
> > + * respectively.
> > + *  | 0000 0000 0000 0000 0.000 0000 0000 0000 |
> > + * 31                                          0
> > + */
> > +#define FP_SCALE 15
> > +
> > +#define LF_TO_FP(a) ((a) * (u64)(1 << FP_SCALE))
> > +#define INT_TO_FP(a) ((a) << FP_SCALE)
> > +#define FP_MUL(a, b) ((s32)(((s64)(a) * (b)) >> FP_SCALE))
> > +#define FP_DIV(a, b) ((s32)(((s64)(a) << FP_SCALE) / (b)))
> > +/* This macro converts a fixed point number to int, and round half up
> it */
> > +#define FP_TO_INT_ROUND_UP(a) (((a) + (1 << (FP_SCALE - 1))) >>
> FP_SCALE)
> > +
> >  /*
> >   * packed_pixels_addr - Get the pointer to pixel of a given pair of
> coordinates
> >   *
> > @@ -125,6 +149,33 @@ void XRGB16161616_to_ARGB16161616(struct
> vkms_frame_info *frame_info, int y,
> >       }
> >  }
> >
> > +void RGB565_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
> > +                         struct line_buffer *stage_buffer)
> > +{
> > +     u16 *src_pixels = get_packed_src_addr(frame_info, y);
> > +     int x, x_limit = drm_rect_width(&frame_info->dst);
> > +
> > +     for (x = 0; x < x_limit; x++, src_pixels++) {
> > +             u16 rgb_565 = le16_to_cpu(*src_pixels);
> > +             int fp_r = INT_TO_FP((rgb_565 >> 11) & 0x1f);
> > +             int fp_g = INT_TO_FP((rgb_565 >> 5) & 0x3f);
> > +             int fp_b = INT_TO_FP(rgb_565 & 0x1f);
> > +
> > +             /*
> > +              * The magic constants is the "conversion ratio" and is
> calculated
> > +              * dividing 65535(2^16 - 1) by 31(2^5 -1) and 63(2^6 - 1)
> > +              * respectively.
> > +              */
> > +             int fp_rb_ratio = LF_TO_FP(2114.032258065);
> > +             int fp_g_ratio = LF_TO_FP(1040.238095238);
> > +
> > +             stage_buffer[x].a = (u16)0xffff;
> > +             stage_buffer[x].r = FP_TO_INT_ROUND_UP(FP_MUL(fp_r,
> fp_rb_ratio));
> > +             stage_buffer[x].g = FP_TO_INT_ROUND_UP(FP_MUL(fp_g,
> fp_g_ratio));
> > +             stage_buffer[x].b = FP_TO_INT_ROUND_UP(FP_MUL(fp_b,
> fp_rb_ratio));
> > +     }
> > +}
> > +
> >
> >  /*
> >   * The following  functions take an line of ARGB16161616 pixels from the
> > @@ -203,3 +254,26 @@ void convert_to_XRGB16161616(struct vkms_frame_info
> *frame_info, int y,
> >               dst_pixels[0] = src_buffer[x].b;
> >       }
> >  }
> > +
> > +void convert_to_RGB565(struct vkms_frame_info *frame_info, int y,
> > +                    struct line_buffer *src_buffer)
> > +{
> > +     int x, x_dst = frame_info->dst.x1;
> > +     u16 *dst_pixels = packed_pixels_addr(frame_info, x_dst, y);
> > +     int x_limit = drm_rect_width(&frame_info->dst);
> > +
> > +     for (x = 0; x < x_limit; x++, dst_pixels++) {
> > +             int fp_r = INT_TO_FP(src_buffer[x].r);
> > +             int fp_g = INT_TO_FP(src_buffer[x].g);
> > +             int fp_b = INT_TO_FP(src_buffer[x].b);
> > +
> > +             int fp_rb_ratio = LF_TO_FP(2114.032258065);
> > +             int fp_g_ratio = LF_TO_FP(1040.238095238);
>
> Are there any guarantees that this will not result in floating-point
> CPU instructions being used? Like a compiler error if it did?
>
> Yes, it's a constant expression, but I think there were some funny
> rules in C that floating-point operations may not be evaluated at
> compile time. Maybe I'm just paranoid?
>
>
Well, I cannot guarantee anything, but every time that I
intentionally/unintentionally
did anything related with floating-point it couldn't link the kernel.


>
> Thanks,
> pq
>
> > +
> > +             u16 r = FP_TO_INT_ROUND_UP(FP_DIV(fp_r, fp_rb_ratio));
> > +             u16 g = FP_TO_INT_ROUND_UP(FP_DIV(fp_g, fp_g_ratio));
> > +             u16 b = FP_TO_INT_ROUND_UP(FP_DIV(fp_b, fp_rb_ratio));
> > +
> > +             *dst_pixels = cpu_to_le16(r << 11 | g << 5 | b);
> > +     }
> > +}
> > diff --git a/drivers/gpu/drm/vkms/vkms_formats.h
> b/drivers/gpu/drm/vkms/vkms_formats.h
> > index 22358f3a33ab..836d6e43ea90 100644
> > --- a/drivers/gpu/drm/vkms/vkms_formats.h
> > +++ b/drivers/gpu/drm/vkms/vkms_formats.h
> > @@ -21,6 +21,9 @@ void get_ARGB16161616(struct vkms_frame_info
> *frame_info, int y,
> >  void XRGB16161616_to_ARGB16161616(struct vkms_frame_info *frame_info,
> int y,
> >                                 struct line_buffer *stage_buffer);
> >
> > +void RGB565_to_ARGB16161616(struct vkms_frame_info *frame_info, int y,
> > +                         struct line_buffer *stage_buffer);
> > +
> >  void convert_to_ARGB8888(struct vkms_frame_info *frame_info, int y,
> >                        struct line_buffer *src_buffer);
> >
> > @@ -33,6 +36,9 @@ void convert_to_ARGB16161616(struct vkms_frame_info
> *frame_info, int y,
> >  void convert_to_XRGB16161616(struct vkms_frame_info *frame_info, int y,
> >                            struct line_buffer *src_buffer);
> >
> > +void convert_to_RGB565(struct vkms_frame_info *frame_info, int y,
> > +                    struct line_buffer *src_buffer);
> > +
> >  typedef void (*format_transform_func)(struct vkms_frame_info
> *frame_info, int y,
> >                                     struct line_buffer *buffer);
> >
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c
> b/drivers/gpu/drm/vkms/vkms_plane.c
> > index 1d70c9e8f109..4643eefcdf29 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -13,14 +13,16 @@
> >
> >  static const u32 vkms_formats[] = {
> >       DRM_FORMAT_XRGB8888,
> > -     DRM_FORMAT_XRGB16161616
> > +     DRM_FORMAT_XRGB16161616,
> > +     DRM_FORMAT_RGB565
> >  };
> >
> >  static const u32 vkms_plane_formats[] = {
> >       DRM_FORMAT_ARGB8888,
> >       DRM_FORMAT_XRGB8888,
> >       DRM_FORMAT_XRGB16161616,
> > -     DRM_FORMAT_ARGB16161616
> > +     DRM_FORMAT_ARGB16161616,
> > +     DRM_FORMAT_RGB565
> >  };
> >
> >  static struct drm_plane_state *
> > diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c
> b/drivers/gpu/drm/vkms/vkms_writeback.c
> > index 393d3fc7966f..1aaa630090d3 100644
> > --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> > +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> > @@ -15,7 +15,8 @@
> >  static const u32 vkms_wb_formats[] = {
> >       DRM_FORMAT_XRGB8888,
> >       DRM_FORMAT_XRGB16161616,
> > -     DRM_FORMAT_ARGB16161616
> > +     DRM_FORMAT_ARGB16161616,
> > +     DRM_FORMAT_RGB565
> >  };
> >
> >  static const struct drm_connector_funcs vkms_wb_connector_funcs = {
>
>

--0000000000009f9d3605d8cd4605
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Pekka,<br></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 10, 2022 at 6:50 AM Pekka Pa=
alanen &lt;<a href=3D"mailto:ppaalanen@gmail.com">ppaalanen@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri=
, 21 Jan 2022 18:38:31 -0300<br>
Igor Torrente &lt;<a href=3D"mailto:igormtorrente@gmail.com" target=3D"_bla=
nk">igormtorrente@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Adds this common format to vkms.<br>
&gt; <br>
&gt; This commit also adds new helper macros to deal with fixed-point<br>
&gt; arithmetic.<br>
&gt; <br>
&gt; It was done to improve the precision of the conversion to ARGB16161616=
<br>
&gt; since the &quot;conversion ratio&quot; is not an integer.<br>
&gt; <br>
&gt; Signed-off-by: Igor Torrente &lt;<a href=3D"mailto:igormtorrente@gmail=
.com" target=3D"_blank">igormtorrente@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt; V3: Adapt the handlers to the new format introduced in patch 7 V3.<br>
&gt; ---<br>
&gt;=C2=A0 drivers/gpu/drm/vkms/vkms_formats.c=C2=A0 =C2=A0| 74 +++++++++++=
++++++++++++++++<br>
&gt;=C2=A0 drivers/gpu/drm/vkms/vkms_formats.h=C2=A0 =C2=A0|=C2=A0 6 +++<br=
>
&gt;=C2=A0 drivers/gpu/drm/vkms/vkms_plane.c=C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +=
+-<br>
&gt;=C2=A0 drivers/gpu/drm/vkms/vkms_writeback.c |=C2=A0 3 +-<br>
&gt;=C2=A0 4 files changed, 86 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkm=
s/vkms_formats.c<br>
&gt; index 661da39d1276..dc612882dd8c 100644<br>
&gt; --- a/drivers/gpu/drm/vkms/vkms_formats.c<br>
&gt; +++ b/drivers/gpu/drm/vkms/vkms_formats.c<br>
&gt; @@ -11,6 +11,8 @@ format_transform_func get_fmt_transform_function(u32=
 format)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &amp;get_=
ARGB16161616;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (format =3D=3D DRM_FORMAT_XRGB161616=
16)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &amp;XRGB=
16161616_to_ARGB16161616;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (format =3D=3D DRM_FORMAT_RGB565)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &amp;RGB565_to=
_ARGB16161616;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &amp;XRGB=
8888_to_ARGB16161616;<br>
&gt;=C2=A0 }<br>
&gt; @@ -23,6 +25,8 @@ format_transform_func get_wb_fmt_transform_function(=
u32 format)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &amp;conv=
ert_to_ARGB16161616;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else if (format =3D=3D DRM_FORMAT_XRGB161616=
16)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &amp;conv=
ert_to_XRGB16161616;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0else if (format =3D=3D DRM_FORMAT_RGB565)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &amp;convert_t=
o_RGB565;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0else<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return &amp;conv=
ert_to_XRGB8888;<br>
&gt;=C2=A0 }<br>
&gt; @@ -33,6 +37,26 @@ static int pixel_offset(struct vkms_frame_info *fra=
me_info, int x, int y)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+ (x * frame_info-&gt;cpp);=
<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +/*<br>
&gt; + * FP stands for _Fixed Point_ and **not** _Float Point_<br>
<br>
Is it common in the kernel that FP always means fixed-point?<br></blockquot=
e><div><br></div><div>I cannot say for sure, but I don&#39;t think so. I pu=
t it for people like me</div><div>that goes automatically to Floating-Point=
 because never worked with <br></div><div>fixed-point before.<br></div><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
If there is any doubt about that, I&#39;d suggest using &quot;fixed&quot; a=
nd &quot;float&quot;<br>
to avoid misunderstandings.<br>
<br>
And, since you are not supposed to use floats in the kernel unless you<br>
really really must and you do all the preparations necessary (which you<br>
don&#39;t here), maybe replace the &quot;float&quot; with a fraction.<br>
<br>
In other words, write a macro that takes (65535, 31) as arguments<br>
instead of a float, when converting to fixed-point. Then you don&#39;t have=
<br>
to use those strange decimal constants either.<br></blockquote><div><br></d=
iv><div>It looks better, I will try to implement this. <br></div><div><br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; + * LF stands for Long Float (i.e. double)<br>
&gt; + * The following macros help doing fixed point arithmetic.<br>
&gt; + */<br>
&gt; +/*<br>
&gt; + * With FP scale 15 we have 17 and 15 bits of integer and fractional =
parts<br>
&gt; + * respectively.<br>
&gt; + *=C2=A0 | 0000 0000 0000 0000 0.000 0000 0000 0000 |<br>
&gt; + * 31=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 0<br>
&gt; + */<br>
&gt; +#define FP_SCALE 15<br>
&gt; +<br>
&gt; +#define LF_TO_FP(a) ((a) * (u64)(1 &lt;&lt; FP_SCALE))<br>
&gt; +#define INT_TO_FP(a) ((a) &lt;&lt; FP_SCALE)<br>
&gt; +#define FP_MUL(a, b) ((s32)(((s64)(a) * (b)) &gt;&gt; FP_SCALE))<br>
&gt; +#define FP_DIV(a, b) ((s32)(((s64)(a) &lt;&lt; FP_SCALE) / (b)))<br>
&gt; +/* This macro converts a fixed point number to int, and round half up=
 it */<br>
&gt; +#define FP_TO_INT_ROUND_UP(a) (((a) + (1 &lt;&lt; (FP_SCALE - 1))) &g=
t;&gt; FP_SCALE)<br>
&gt; +<br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* packed_pixels_addr - Get the pointer to pixel of a given=
 pair of coordinates<br>
&gt;=C2=A0 =C2=A0*<br>
&gt; @@ -125,6 +149,33 @@ void XRGB16161616_to_ARGB16161616(struct vkms_fra=
me_info *frame_info, int y,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +void RGB565_to_ARGB16161616(struct vkms_frame_info *frame_info, int y=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0struct line_buffer *stage_buffer)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 *src_pixels =3D get_packed_src_addr(frame_inf=
o, y);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int x, x_limit =3D drm_rect_width(&amp;frame_info=
-&gt;dst);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (x =3D 0; x &lt; x_limit; x++, src_pixels++) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u16 rgb_565 =3D le16_=
to_cpu(*src_pixels);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fp_r =3D INT_TO_F=
P((rgb_565 &gt;&gt; 11) &amp; 0x1f);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fp_g =3D INT_TO_F=
P((rgb_565 &gt;&gt; 5) &amp; 0x3f);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fp_b =3D INT_TO_F=
P(rgb_565 &amp; 0x1f);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * The magic constant=
s is the &quot;conversion ratio&quot; and is calculated<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * dividing 65535(2^1=
6 - 1) by 31(2^5 -1) and 63(2^6 - 1)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * respectively.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fp_rb_ratio =3D L=
F_TO_FP(2114.032258065);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fp_g_ratio =3D LF=
_TO_FP(1040.238095238);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stage_buffer[x].a =3D=
 (u16)0xffff;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stage_buffer[x].r =3D=
 FP_TO_INT_ROUND_UP(FP_MUL(fp_r, fp_rb_ratio));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stage_buffer[x].g =3D=
 FP_TO_INT_ROUND_UP(FP_MUL(fp_g, fp_g_ratio));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stage_buffer[x].b =3D=
 FP_TO_INT_ROUND_UP(FP_MUL(fp_b, fp_rb_ratio));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /*<br>
&gt;=C2=A0 =C2=A0* The following=C2=A0 functions take an line of ARGB161616=
16 pixels from the<br>
&gt; @@ -203,3 +254,26 @@ void convert_to_XRGB16161616(struct vkms_frame_in=
fo *frame_info, int y,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dst_pixels[0] =
=3D src_buffer[x].b;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 }<br>
&gt; +<br>
&gt; +void convert_to_RGB565(struct vkms_frame_info *frame_info, int y,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 struct line_buffer *src_buffer)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int x, x_dst =3D frame_info-&gt;dst.x1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0u16 *dst_pixels =3D packed_pixels_addr(frame_info=
, x_dst, y);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0int x_limit =3D drm_rect_width(&amp;frame_info-&g=
t;dst);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0for (x =3D 0; x &lt; x_limit; x++, dst_pixels++) =
{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fp_r =3D INT_TO_F=
P(src_buffer[x].r);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fp_g =3D INT_TO_F=
P(src_buffer[x].g);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fp_b =3D INT_TO_F=
P(src_buffer[x].b);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fp_rb_ratio =3D L=
F_TO_FP(2114.032258065);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int fp_g_ratio =3D LF=
_TO_FP(1040.238095238);<br>
<br>
Are there any guarantees that this will not result in floating-point<br>
CPU instructions being used? Like a compiler error if it did?<br>
<br>
Yes, it&#39;s a constant expression, but I think there were some funny<br>
rules in C that floating-point operations may not be evaluated at<br>
compile time. Maybe I&#39;m just paranoid?<br>
<br></blockquote><div>=C2=A0</div><div>Well, I cannot guarantee anything, b=
ut every time that I intentionally/unintentionally</div><div>did anything r=
elated with floating-point it couldn&#39;t link the kernel. <br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
pq<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u16 r =3D FP_TO_INT_R=
OUND_UP(FP_DIV(fp_r, fp_rb_ratio));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u16 g =3D FP_TO_INT_R=
OUND_UP(FP_DIV(fp_g, fp_g_ratio));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0u16 b =3D FP_TO_INT_R=
OUND_UP(FP_DIV(fp_b, fp_rb_ratio));<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*dst_pixels =3D cpu_t=
o_le16(r &lt;&lt; 11 | g &lt;&lt; 5 | b);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; +}<br>
&gt; diff --git a/drivers/gpu/drm/vkms/vkms_formats.h b/drivers/gpu/drm/vkm=
s/vkms_formats.h<br>
&gt; index 22358f3a33ab..836d6e43ea90 100644<br>
&gt; --- a/drivers/gpu/drm/vkms/vkms_formats.h<br>
&gt; +++ b/drivers/gpu/drm/vkms/vkms_formats.h<br>
&gt; @@ -21,6 +21,9 @@ void get_ARGB16161616(struct vkms_frame_info *frame_=
info, int y,<br>
&gt;=C2=A0 void XRGB16161616_to_ARGB16161616(struct vkms_frame_info *frame_=
info, int y,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct line_buffer *stage_b=
uffer);<br>
&gt;=C2=A0 <br>
&gt; +void RGB565_to_ARGB16161616(struct vkms_frame_info *frame_info, int y=
,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0struct line_buffer *stage_buffer);<br>
&gt; +<br>
&gt;=C2=A0 void convert_to_ARGB8888(struct vkms_frame_info *frame_info, int=
 y,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 struct line_buffer *src_buffer);<br>
&gt;=C2=A0 <br>
&gt; @@ -33,6 +36,9 @@ void convert_to_ARGB16161616(struct vkms_frame_info =
*frame_info, int y,<br>
&gt;=C2=A0 void convert_to_XRGB16161616(struct vkms_frame_info *frame_info,=
 int y,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct line_buffer *src_buffer);<br>
&gt;=C2=A0 <br>
&gt; +void convert_to_RGB565(struct vkms_frame_info *frame_info, int y,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 struct line_buffer *src_buffer);<br>
&gt; +<br>
&gt;=C2=A0 typedef void (*format_transform_func)(struct vkms_frame_info *fr=
ame_info, int y,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct line_b=
uffer *buffer);<br>
&gt;=C2=A0 <br>
&gt; diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/=
vkms_plane.c<br>
&gt; index 1d70c9e8f109..4643eefcdf29 100644<br>
&gt; --- a/drivers/gpu/drm/vkms/vkms_plane.c<br>
&gt; +++ b/drivers/gpu/drm/vkms/vkms_plane.c<br>
&gt; @@ -13,14 +13,16 @@<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const u32 vkms_formats[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_XRGB8888,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_XRGB16161616<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_XRGB16161616,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_RGB565<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const u32 vkms_plane_formats[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_ARGB8888,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_XRGB8888,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_XRGB16161616,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_ARGB16161616<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_ARGB16161616,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_RGB565<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static struct drm_plane_state *<br>
&gt; diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/v=
kms/vkms_writeback.c<br>
&gt; index 393d3fc7966f..1aaa630090d3 100644<br>
&gt; --- a/drivers/gpu/drm/vkms/vkms_writeback.c<br>
&gt; +++ b/drivers/gpu/drm/vkms/vkms_writeback.c<br>
&gt; @@ -15,7 +15,8 @@<br>
&gt;=C2=A0 static const u32 vkms_wb_formats[] =3D {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_XRGB8888,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0DRM_FORMAT_XRGB16161616,<br>
&gt; -=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_ARGB16161616<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_ARGB16161616,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0DRM_FORMAT_RGB565<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 static const struct drm_connector_funcs vkms_wb_connector_funcs =
=3D {<br>
<br>
</blockquote></div></div>

--0000000000009f9d3605d8cd4605--
