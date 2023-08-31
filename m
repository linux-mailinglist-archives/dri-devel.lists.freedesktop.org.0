Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 771D978E7CF
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 10:22:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE6B310E5B9;
	Thu, 31 Aug 2023 08:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A555E10E5B9
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 08:22:35 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-591ba8bd094so6933607b3.3
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 01:22:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693470154; x=1694074954;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V7bxw9Xunx8GSI2r5kdgx9TSGGXffVQ4EQIFOvHHizA=;
 b=e41r+qpGZzPSjLBu1vtKfHilKoiUhXh/gylXod6xCZHJuboTIvX36mw6/zM/pwLb8c
 Bzu4t2beqCixKnuubbpQypO5FxHK+zZuJhhmHZ7jRcREjQbEOuy9O8Qrj10TfVo/dNsc
 8JOyIoLdE/X+GpuE9Ev1om9/qh4eKdOF+uBUoAOYgBQWJSIox2al3sEVXjIAS54iWejj
 6OSnrfdzaF/45HP2683SsGLfYpN9UO7jxQCJ9yPy+z98h54I/Yexx3yQhO1wiWbzUZyh
 ug3b59xuycmigF/pExiLqDv+CvyipLi8FPWOq1Gf8Dtr6mmoz8MHs3dZ52fB6Ej7iR3B
 m81A==
X-Gm-Message-State: AOJu0YxlGnn503+fwJuDM6EJJiEOdr+djc93drFusOK+wJ2BEJq5nfRq
 l1EbZEoZOZXx/pLbO8YyOel8vFBIcf2y3A==
X-Google-Smtp-Source: AGHT+IHE+TeA43d6hCuIJRutm8havf/L3eOPM9CKwmevv4cQNSCT7Rn9Q8BYQTwtDi7Cn3OI4oedFA==
X-Received: by 2002:a81:4784:0:b0:58e:a9d3:bf98 with SMTP id
 u126-20020a814784000000b0058ea9d3bf98mr3899785ywa.27.1693470154582; 
 Thu, 31 Aug 2023 01:22:34 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 e68-20020a0dc247000000b0058bcea54fc2sm277516ywd.57.2023.08.31.01.22.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 01:22:34 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-d7485d37283so333426276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 01:22:33 -0700 (PDT)
X-Received: by 2002:a25:4203:0:b0:d11:45d3:b25d with SMTP id
 p3-20020a254203000000b00d1145d3b25dmr4840506yba.46.1693470153220; Thu, 31 Aug
 2023 01:22:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1692888745.git.geert@linux-m68k.org>
 <d5f342b5382653c1f1fb72dbedb783f9ea42416e.1692888745.git.geert@linux-m68k.org>
 <10bc08a5-0e64-d8ac-b71f-d44e16da8f61@suse.de>
In-Reply-To: <10bc08a5-0e64-d8ac-b71f-d44e16da8f61@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 31 Aug 2023 10:22:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXUcEgQcjr20vK1nRANm4se0Du6M_gcrj8ZS+bXPYMMWw@mail.gmail.com>
Message-ID: <CAMuHMdXUcEgQcjr20vK1nRANm4se0Du6M_gcrj8ZS+bXPYMMWw@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] drm/ssd130x: Add support for DRM_FORMAT_R1
To: Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Aug 31, 2023 at 10:01=E2=80=AFAM Thomas Zimmermann <tzimmermann@sus=
e.de> wrote:
> Am 24.08.23 um 17:08 schrieb Geert Uytterhoeven:
> > The native display format is monochrome light-on-dark (R1).
> > Hence add support for R1, so monochrome applications not only look
> > better, but also avoid the overhead of back-and-forth conversions
> > between R1 and XR24.
> >
> > Do not allocate the intermediate conversion buffer when it is not
> > needed, and reorder the two buffer allocations to streamline operation.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > v2:
> >    - Rework on top op commit 8c3926367ac9df6c ("drm/ssd130x: Use
> >      shadow-buffer helpers when managing plane's state") in drm/drm-nex=
t.
> >      Hence I did not add Javier's tags given on v1.
> >    - Do not allocate intermediate buffer when not needed.
> > ---
> >   drivers/gpu/drm/solomon/ssd130x.c | 76 +++++++++++++++++++++---------=
-
> >   1 file changed, 51 insertions(+), 25 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomo=
n/ssd130x.c
> > index 78272b1f9d5b167f..18007cb4f3de5aa1 100644
> > --- a/drivers/gpu/drm/solomon/ssd130x.c
> > +++ b/drivers/gpu/drm/solomon/ssd130x.c
> > @@ -449,15 +449,14 @@ static int ssd130x_init(struct ssd130x_device *ss=
d130x)
> >
> >   static int ssd130x_update_rect(struct ssd130x_device *ssd130x,
> >                              struct ssd130x_plane_state *ssd130x_state,
> > +                            u8 *buf, unsigned int pitch,
> >                              struct drm_rect *rect)
> >   {
> >       unsigned int x =3D rect->x1;
> >       unsigned int y =3D rect->y1;
> > -     u8 *buf =3D ssd130x_state->buffer;
> >       u8 *data_array =3D ssd130x_state->data_array;
> >       unsigned int width =3D drm_rect_width(rect);
> >       unsigned int height =3D drm_rect_height(rect);
> > -     unsigned int line_length =3D DIV_ROUND_UP(width, 8);
> >       unsigned int page_height =3D ssd130x->device_info->page_height;
> >       unsigned int pages =3D DIV_ROUND_UP(height, page_height);
> >       struct drm_device *drm =3D &ssd130x->drm;
> > @@ -516,7 +515,7 @@ static int ssd130x_update_rect(struct ssd130x_devic=
e *ssd130x,
> >                       u8 data =3D 0;
> >
> >                       for (k =3D 0; k < m; k++) {
> > -                             u8 byte =3D buf[(8 * i + k) * line_length=
 + j / 8];
> > +                             u8 byte =3D buf[(8 * i + k) * pitch + j /=
 8];
> >                               u8 bit =3D (byte >> (j % 8)) & 1;
> >
> >                               data |=3D bit << k;
> > @@ -602,27 +601,51 @@ static int ssd130x_fb_blit_rect(struct drm_plane_=
state *state,
>
> The handing of different formats in this function is confusing. I'd
> rather implement ssd130x_fb_blit_rect_r1 and
> ssd130x_fb_blit_rect_xrgb8888 which then handle a single format.

OK, will split.

> >       struct ssd130x_device *ssd130x =3D drm_to_ssd130x(fb->dev);
> >       unsigned int page_height =3D ssd130x->device_info->page_height;
> >       struct ssd130x_plane_state *ssd130x_state =3D to_ssd130x_plane_st=
ate(state);
> > -     u8 *buf =3D ssd130x_state->buffer;
> >       struct iosys_map dst;
> >       unsigned int dst_pitch;
> >       int ret =3D 0;
> > +     u8 *buf;
> >
> >       /* Align y to display page boundaries */
> >       rect->y1 =3D round_down(rect->y1, page_height);
> >       rect->y2 =3D min_t(unsigned int, round_up(rect->y2, page_height),=
 ssd130x->height);
> >
> > -     dst_pitch =3D DIV_ROUND_UP(drm_rect_width(rect), 8);
> > +     switch (fb->format->format) {
> > +     case DRM_FORMAT_R1:
> > +             /* Align x to byte boundaries */
> > +             rect->x1 =3D round_down(rect->x1, 8);
> > +             rect->x2 =3D round_up(rect->x2, 8);
>
> Is rounding to multiples of 8 guaranteed to work? I know it did on
> VGA-compatible HW, because VGA enforces it. But is that generally the cas=
e?

That depends: some hardware requires e.g. 32-bit writes.
But this driver is for a display with a serial (i2c/spi) interface,
so everything should be fine ;-)

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
