Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B7B7C6748
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 09:57:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24BD10E430;
	Thu, 12 Oct 2023 07:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BC5810E430
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 07:57:47 +0000 (UTC)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-5a7dd65052aso9922417b3.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 00:57:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697097466; x=1697702266;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LoocAAYpHjIjnl+lXEbw5oajucsokY7PPaRYp92RNBU=;
 b=sOoB/mWaIcSrzGu/cSJU+7yt0TeNl7FNHuJJBTXWqjyT2pi1jyfmbHQseTk2GlCF+n
 ow264fbWB5y1PAc3DIgZlq6gZneYi5tSwrq8jvcvG1kj0gua6138xkL5KHdiQIlnO0YW
 611FcZ6WMbbGuzzDXx5DjYjIRHB/V2phNueJZegDbRVW3QWsW98AmUOSmEbItBY8MJQZ
 MwIXzNEh7lEnDy5cPhwGHq3kOzVtMtIjnh27z5zvk84D7YCQBjnyzv0WwGg1n2cf/SUl
 WZ9g7dkY+G8AhMGWaYnumZrko5I8b4+RlhHno2/9A8fLxR6TQGdA+Q2eo01THzsLfXyU
 QrFA==
X-Gm-Message-State: AOJu0YzNv+96I7ipy5uHEEIOv+cSSRtNaXRR8MIZWMMcmyXW1WtUae08
 QHwDtk7ci+FQVWrDed+DYfSj+owRTIRa5Q==
X-Google-Smtp-Source: AGHT+IG7gXOt7kQkUTJX9PCEoEzmxfcICdNs7BZx/F5wRKhtT9j8bUhb+2/zrYnIcCwT6SiM+a3vRw==
X-Received: by 2002:a0d:eac3:0:b0:5a7:ddc0:6f59 with SMTP id
 t186-20020a0deac3000000b005a7ddc06f59mr4755235ywe.6.1697097466438; 
 Thu, 12 Oct 2023 00:57:46 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com.
 [209.85.219.182]) by smtp.gmail.com with ESMTPSA id
 n20-20020a819e54000000b005a206896d62sm5697830ywj.111.2023.10.12.00.57.45
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Oct 2023 00:57:45 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-d9a64ca9cedso655790276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 00:57:45 -0700 (PDT)
X-Received: by 2002:a25:400f:0:b0:d9a:68db:7f96 with SMTP id
 n15-20020a25400f000000b00d9a68db7f96mr6501132yba.21.1697097465754; Thu, 12
 Oct 2023 00:57:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231012065822.1007930-1-javierm@redhat.com>
 <20231012065822.1007930-5-javierm@redhat.com>
In-Reply-To: <20231012065822.1007930-5-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Oct 2023 09:57:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVuDvomz57RHr2NMG9+a=AXy1H39Tv5jN+1J2sqv4+3rg@mail.gmail.com>
Message-ID: <CAMuHMdVuDvomz57RHr2NMG9+a=AXy1H39Tv5jN+1J2sqv4+3rg@mail.gmail.com>
Subject: Re: [PATCH v2 4/6] drm/ssd130x: Add support for the SSD132x OLED
 controller family
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Conor Dooley <conor@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Thu, Oct 12, 2023 at 8:58=E2=80=AFAM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The Solomon SSD132x controllers (such as the SSD1322, SSD1325 and SSD1327=
)
> are used by 16 grayscale dot matrix OLED panels, extend the driver to als=
o
> support this chip family.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
>
> Changes in v2:
> - Align the rectangle to the segment width (Geert Uytterhoeven).

Thanks for the update!

> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c

> +static int ssd132x_update_rect(struct ssd130x_device *ssd130x,
> +                              struct drm_rect *rect, u8 *buf,
> +                              u8 *data_array)
> +{
> +       unsigned int x =3D rect->x1;
> +       unsigned int y =3D rect->y1;
> +       unsigned int segment_width =3D SSD132X_SEGMENT_WIDTH;
> +       unsigned int width =3D drm_rect_width(rect);
> +       unsigned int height =3D drm_rect_height(rect);
> +       unsigned int columns =3D DIV_ROUND_UP(width, segment_width);
> +       unsigned int rows =3D height;
> +       struct drm_device *drm =3D &ssd130x->drm;
> +       u32 array_idx =3D 0;
> +       int ret, i, j;

unsigned int i, j;

> +
> +       drm_WARN_ONCE(drm, x % segment_width !=3D 0, "x must be aligned t=
o screen segment\n");
> +
> +       /*
> +        * The screen is divided in Segment and Common outputs, where
> +        * COM0 to COM[N - 1] are the rows and SEG0 to SEG[M - 1] are
> +        * the columns.
> +        *
> +        * Each Segment has a 4-bit pixel and each Common output has a
> +        * row of pixels. When using the (default) horizontal address
> +        * increment mode, each byte of data sent to the controller has
> +        * two Segments (e.g: SEG0 and SEG1) that are stored in the lower
> +        * and higher nibbles of a single byte representing one column.
> +        * That is, the first byte are SEG0 (D0[3:0]) and SEG1 (D0[7:4]),
> +        * the second byte are SEG2 (D1[3:0]) and SEG3 (D1[7:4]) and so o=
n.
> +        */
> +
> +       /* Set column start and end */
> +       ret =3D ssd130x_write_cmd(ssd130x, 3, SSD132X_SET_COL_RANGE, x / =
segment_width, columns - 1);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Set row start and end */
> +       ret =3D ssd130x_write_cmd(ssd130x, 3, SSD132X_SET_ROW_RANGE, y, r=
ows - 1);
> +       if (ret < 0)
> +               return ret;
> +
> +       for (i =3D 0; i < height; i++) {
> +               /* Process pair of pixels and combine them into a single =
byte */
> +               for (j =3D 0; j < width; j +=3D segment_width) {
> +                       u8 n1 =3D buf[i * width + j];
> +                       u8 n2 =3D buf[i * width + j + 1];
> +
> +                       data_array[array_idx++] =3D (n2 << 4) | n1;
> +               }
> +       }
> +
> +       /* Write out update in one go since horizontal addressing mode is=
 used */
> +       ret =3D ssd130x_write_data(ssd130x, data_array, columns * rows);
> +
> +       return ret;
> +}

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
