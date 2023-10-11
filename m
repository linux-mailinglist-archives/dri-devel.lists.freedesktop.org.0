Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFC57C4CC1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 10:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBB7910E20E;
	Wed, 11 Oct 2023 08:13:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 471E010E20E
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 08:13:26 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-59f82ad1e09so81886837b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 01:13:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697012005; x=1697616805;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7G9GTAzI4rCAAUwmLLyOfe0+LekJewZJGLAtbwyBuMM=;
 b=N6vf2FmuidLiWdwJsw1wnwV5CDlBbNObhVp+8K0Tx+yPofbiVrCFLxYXURfKcDPE0o
 NfJhkNWBkn7TUrsHJDy0lvdtTQfsQYhGVteW4sKGC+0OvJwDqcQ3Fbq02psuV45Jj/8P
 iARxo6SyvTlWI5D/MzzsOGb13XeLgUPLl4vYSLXWDCeS+zSi4KS5FimBoGnbrxanCy31
 S2l6VQWueUD6lhhGY9PcilI9SOZ/lUol0Vzsm/MmbhEZDjwqswXURtWujlQywTVsIugI
 zpK7ssi4a/wTrY8UnAL8r3zjffm4EyGRX1bnjMj51W8e3elrasm76/UuNkEUOd2Rs6f1
 1e9A==
X-Gm-Message-State: AOJu0YzqEdiMGSu/EskgFuUD24tBT+qbEbp2lYAKEvBFW09iraMTOSoU
 80hAzQwOsqHqthDjyp3bH6VSimnmMvl3aA==
X-Google-Smtp-Source: AGHT+IFcEO9C2KKSrh9XRkxQyN6nGB/gNoXREfRFKqdVZu6X6Kb77BVhzdas/a6yXfTZrXcfeFljjQ==
X-Received: by 2002:a81:4948:0:b0:595:406b:93fa with SMTP id
 w69-20020a814948000000b00595406b93famr24203013ywa.2.1697012005234; 
 Wed, 11 Oct 2023 01:13:25 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com.
 [209.85.128.181]) by smtp.gmail.com with ESMTPSA id
 g73-20020a81524c000000b005a23a62a25csm557926ywb.9.2023.10.11.01.13.24
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 01:13:24 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-5a7db1f864bso7147897b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 01:13:24 -0700 (PDT)
X-Received: by 2002:a81:af4b:0:b0:5a7:af65:4ec6 with SMTP id
 x11-20020a81af4b000000b005a7af654ec6mr5764617ywj.32.1697012004282; Wed, 11
 Oct 2023 01:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20231009183522.543918-1-javierm@redhat.com>
 <20231009183522.543918-8-javierm@redhat.com>
In-Reply-To: <20231009183522.543918-8-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Oct 2023 10:13:12 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVnJPBfcaPSpeONuz0dPsWUD69_GnWXwbs9VPgN+fhmtw@mail.gmail.com>
Message-ID: <CAMuHMdVnJPBfcaPSpeONuz0dPsWUD69_GnWXwbs9VPgN+fhmtw@mail.gmail.com>
Subject: Re: [PATCH 7/8] drm/ssd13xx: Add support for the SSD132x OLED
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Javier,

On Mon, Oct 9, 2023 at 8:36=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The Solomon SSD132x controllers (such as the SSD1322, SSD1325 and SSD1327=
)
> are used by 16 grayscale dot matrix OLED panels, extend the driver to als=
o
> support this chip family.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for your patch!

> --- a/drivers/gpu/drm/solomon/ssd13xx.c
> +++ b/drivers/gpu/drm/solomon/ssd13xx.c

> @@ -631,9 +821,12 @@ static int ssd13xx_fb_blit_rect(struct drm_framebuff=
er *fb,
>         unsigned int dst_pitch;
>         int ret =3D 0;
>
> -       /* Align y to display page boundaries */
> -       rect->y1 =3D round_down(rect->y1, SSD130X_PAGE_HEIGHT);
> -       rect->y2 =3D min_t(unsigned int, round_up(rect->y2, SSD130X_PAGE_=
HEIGHT), ssd13xx->height);
> +       if (ssd13xx->device_info->family_id =3D=3D SSD130X_FAMILY) {
> +               /* Align y to display page boundaries */
> +               rect->y1 =3D round_down(rect->y1, SSD130X_PAGE_HEIGHT);
> +               rect->y2 =3D min_t(unsigned int, round_up(rect->y2, SSD13=
0X_PAGE_HEIGHT),
> +                                ssd13xx->height);
> +       }

Don't you need to align to page boundaries (2 pixels per page)
on SSD132X?

This should be handled through ssd13xx_funcs instead of a family check.

>
>         dst_pitch =3D drm_format_info_min_pitch(fi, 0, drm_rect_width(rec=
t));
>

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
