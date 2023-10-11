Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F877C4CA7
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 10:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 611BF10E28A;
	Wed, 11 Oct 2023 08:10:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com
 [209.85.128.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E4B410E28A
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 08:10:03 +0000 (UTC)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-59f82ad1e09so81856317b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 01:10:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697011802; x=1697616602;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yfwG+aQG5ziiDADRicTEYU9GeL07cKra21rSjb2Z7tI=;
 b=kjqTArjXMxvZJdG5sFMKUMbDSq7l/svtA2UNPS7SMZCCTOtW0Lu4jRWfV1pJBWKS/C
 jmTyHQ4ZdsH4gXARTXWzwMprOlhZw/vgWBt3oetseVXQTN8GOqSS+yUzsCsShVxu3YJu
 t/C4EsWRivakZapAd6PV9tq+x7YCCHQf8cY3Q2lodXx2o9xMd28P6kdM5FW2cgRywp3W
 3JSFYVNY6KIMvJ1zik01OS3UhGrvsWY/px7AtgVUtiOGYBsRzzl1Aiz4MNCp+lXgmP1A
 SLiEYR4BW/vconboGDdZp7i+Nw7FdloaU6/NP2+SC/MBbkPFGR7Zir1+TXi3PbIHMFDr
 edIw==
X-Gm-Message-State: AOJu0YxHYHG4f/AMqyHraVnYC1ZgeNM/O5Ib3ek/ZqCy8suyIbLW2Ysk
 np6ljB9p6KZTRhUEVq03GJuoybMH4VxQNQ==
X-Google-Smtp-Source: AGHT+IH+L+bXUTzhHqSvlADuIil1HGMXqzO1Pwh6yq9dhVh6gCqqMCcaQy5KdJ2PIIIjwz76ziJqow==
X-Received: by 2002:a81:92c8:0:b0:5a7:bf01:a183 with SMTP id
 j191-20020a8192c8000000b005a7bf01a183mr4740852ywg.22.1697011802160; 
 Wed, 11 Oct 2023 01:10:02 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 i5-20020a0ddf05000000b0059f8120ee4dsm5101768ywe.30.2023.10.11.01.10.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 01:10:01 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-59f82ad1e09so81856147b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 01:10:01 -0700 (PDT)
X-Received: by 2002:a81:6c17:0:b0:59f:7dbe:5492 with SMTP id
 h23-20020a816c17000000b0059f7dbe5492mr23750753ywc.9.1697011801664; Wed, 11
 Oct 2023 01:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <20231009183522.543918-1-javierm@redhat.com>
 <20231009183522.543918-6-javierm@redhat.com>
In-Reply-To: <20231009183522.543918-6-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Oct 2023 10:09:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX0gvW4Y5ppWi=qF6mZF00m4G-fP1-Wg+sKW43Ku5fz9A@mail.gmail.com>
Message-ID: <CAMuHMdX0gvW4Y5ppWi=qF6mZF00m4G-fP1-Wg+sKW43Ku5fz9A@mail.gmail.com>
Subject: Re: [PATCH 5/8] drm/ssd13xx: Add a per controller family functions
 table
To: Javier Martinez Canillas <javierm@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Mon, Oct 9, 2023 at 8:36=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> To allow the driver to decouple the common logic in the function callback=
s
> from the behaviour that is specific of a given Solomon controller family.
>
> For this, include a chip family to the device info and add fields to the
> driver-private device struct, to store the hardware buffer maximum size,
> the intermediate buffer maximum size and pixel format, and a set of per
> chip family function handlers.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/solomon/ssd13xx.c
> +++ b/drivers/gpu/drm/solomon/ssd13xx.c
> @@ -104,6 +104,7 @@ const struct ssd13xx_deviceinfo ssd13xx_variants[] =
=3D {
>                 .default_width =3D 132,
>                 .default_height =3D 64,
>                 .page_mode_only =3D 1,
> +               .family_id =3D SSD130X_FAMILY,

Why not store &ssd13xx_family_funcs[SSD130X_FAMILY]?

>         },
>         [SSD1305_ID] =3D {
>                 .default_vcomh =3D 0x34,

> @@ -602,6 +605,15 @@ static void ssd13xx_clear_screen(struct ssd13xx_devi=
ce *ssd13xx, u8 *data_array)
>         }
>  }
>
> +static const struct ssd13xx_funcs ssd13xx_family_funcs[] =3D {
> +       [SSD130X_FAMILY] =3D {
> +               .init =3D ssd130x_init,
> +               .update_rect =3D ssd130x_update_rect,
> +               .clear_screen =3D ssd130x_clear_screen,
> +               .fmt_convert =3D drm_fb_xrgb8888_to_mono,
> +       },
> +};
> +
>  static int ssd13xx_fb_blit_rect(struct drm_framebuffer *fb,
>                                 const struct iosys_map *vmap,
>                                 struct drm_rect *rect, u8 *buf,

> @@ -1195,11 +1198,38 @@ static int ssd13xx_get_resources(struct ssd13xx_d=
evice *ssd13xx)
>         return 0;
>  }
>
> +static int ssd13xx_set_buffer_sizes(struct ssd13xx_device *ssd13xx,
> +                                   enum ssd13xx_family_ids family_id)
> +{
> +       const struct drm_format_info *fi;
> +       unsigned int buffer_pitch;
> +
> +       switch (family_id) {
> +       case SSD130X_FAMILY:
> +               unsigned int pages =3D DIV_ROUND_UP(ssd13xx->height, SSD1=
30X_PAGE_HEIGHT);
> +
> +               ssd13xx->data_array_size =3D ssd13xx->width * pages;
> +
> +               fi =3D drm_format_info(DRM_FORMAT_R1);
> +               break;
> +       }

Please don't mix ssd13xx_funcs[family_id] and switch (family_id).
The switch() could be replaced by an extra function pointer in
ssd13xx_funcs, and by storing fi in ssd13xx_funcs, too.

Note that you don't really need the full drm_format_info, the number
of bits per pixel is sufficient.  But having the drm_format_info is
nice, as fmt_convert() will need it later when adding support for
fbdev emulation using R1 or R4 ;-)

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
