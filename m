Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F7E7C4C1E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 09:40:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9815710E495;
	Wed, 11 Oct 2023 07:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC9610E20C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 07:39:58 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-5a7af45084eso27144637b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 00:39:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697009997; x=1697614797;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/X15NrvY+cErHcD0y7I5v3H188ScfV0hu8n5YeLnxfI=;
 b=ADGnUAkeDIO0dRdXerxAD78nuEpFHjCQ21MQlUmPbOnqqiK5TGGhD9g0kdskJ+ygVa
 PnoExtUst1fx1f+5bEsJM3RdTSzIsF8aPewfSgSI6J52qICxAjf+1Tmkl27t8cZdaH83
 IKm+R6UKYe8wjpiBhU4P3j/5shGUn/NsCEFIELqP3GAy7OmOiHiKjrQKOnKfcGi4ZLXC
 vu6b1WihDFFu+IAHgteY2Dy18tKuE2fZBpcOCOwnecLropStLp11z1d/bM7CfCdi+GR7
 3bVjHz00sfAjenEXOy363PItWplVmnv7ZAIsvrgGv4yjYwgnhNS0EJKB972Jq2OmitZV
 rZ1w==
X-Gm-Message-State: AOJu0Yyaab5BNCLFXFaOLjOj/IDRgL0lwUpOttn72NZxG+YmBtkxx3zI
 RspweskCYA2EHr4ZCyjJ9zyZpFlrOk5rzA==
X-Google-Smtp-Source: AGHT+IHrc09Y5KUTesGsOvv5wdhbjarUkscBEQvhphTpSivl5GImoYQ9gDuFbDgLFMh6jlaofCPABg==
X-Received: by 2002:a81:9196:0:b0:58d:7599:676a with SMTP id
 i144-20020a819196000000b0058d7599676amr21456202ywg.37.1697009997165; 
 Wed, 11 Oct 2023 00:39:57 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 g137-20020a0ddd8f000000b005a247c18403sm177607ywe.37.2023.10.11.00.39.56
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Oct 2023 00:39:56 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-5a7c95b8d14so15788197b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 00:39:56 -0700 (PDT)
X-Received: by 2002:a0d:f4c7:0:b0:583:3c54:6d89 with SMTP id
 d190-20020a0df4c7000000b005833c546d89mr20550083ywf.44.1697009996484; Wed, 11
 Oct 2023 00:39:56 -0700 (PDT)
MIME-Version: 1.0
References: <20231009183522.543918-1-javierm@redhat.com>
 <20231009183522.543918-4-javierm@redhat.com>
In-Reply-To: <20231009183522.543918-4-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 11 Oct 2023 09:39:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWSOcgV-qseaidUKcJswiJzr2+JQqB=k6tasaUXiEyiHw@mail.gmail.com>
Message-ID: <CAMuHMdWSOcgV-qseaidUKcJswiJzr2+JQqB=k6tasaUXiEyiHw@mail.gmail.com>
Subject: Re: [PATCH 3/8] drm/ssd13xx: Replace .page_height field in device
 info with a constant
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

On Mon, Oct 9, 2023 at 8:36=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> This deemed useful to avoid hardcoding a page height and allow to support
> other Solomon controller families, but dividing the screen in pages seems
> to be something that is specific to the SSD130x chip family.
>
> For example, SSD132x chip family divides the screen in segments (columns)
> and common outputs (rows), so the concept of screen pages does not exist
> for the SSD132x family.
>
> Let's drop this field from the device info struct and just use a constant
> SSD130X_PAGE_HEIGHT macro to define the page height. While being there,
> replace hardcoded 8 values in places where it is used as the page height.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

> --- a/drivers/gpu/drm/solomon/ssd13xx.c
> +++ b/drivers/gpu/drm/solomon/ssd13xx.c

> @@ -465,13 +462,13 @@ static int ssd13xx_update_rect(struct ssd13xx_devic=
e *ssd13xx,
>         unsigned int width =3D drm_rect_width(rect);
>         unsigned int height =3D drm_rect_height(rect);
>         unsigned int line_length =3D DIV_ROUND_UP(width, 8);
> -       unsigned int page_height =3D ssd13xx->device_info->page_height;
> +       unsigned int page_height =3D SSD130X_PAGE_HEIGHT;
>         unsigned int pages =3D DIV_ROUND_UP(height, page_height);
>         struct drm_device *drm =3D &ssd13xx->drm;
>         u32 array_idx =3D 0;
>         int ret, i, j, k;
>
> -       drm_WARN_ONCE(drm, y % 8 !=3D 0, "y must be aligned to screen pag=
e\n");
> +       drm_WARN_ONCE(drm, y % page_height !=3D 0, "y must be aligned to =
screen page\n");
>
>         /*
>          * The screen is divided in pages, each having a height of 8
> @@ -503,27 +500,32 @@ static int ssd13xx_update_rect(struct ssd13xx_devic=
e *ssd13xx,
>          */
>
>         if (!ssd13xx->page_address_mode) {
> +               u8 page_start;
> +
>                 /* Set address range for horizontal addressing mode */
>                 ret =3D ssd13xx_set_col_range(ssd13xx, ssd13xx->col_offse=
t + x, width);
>                 if (ret < 0)
>                         return ret;
>
> -               ret =3D ssd13xx_set_page_range(ssd13xx, ssd13xx->page_off=
set + y / 8, pages);
> +               page_start =3D ssd13xx->page_offset + y / page_height;
> +               ret =3D ssd13xx_set_page_range(ssd13xx, page_start, pages=
);
>                 if (ret < 0)
>                         return ret;
>         }
>
>         for (i =3D 0; i < pages; i++) {
> -               int m =3D 8;
> +               int m =3D page_height;
>
>                 /* Last page may be partial */
> -               if (8 * (y / 8 + i + 1) > ssd13xx->height)
> -                       m =3D ssd13xx->height % 8;
> +               if (page_height * (y / page_height + i + 1) > ssd13xx->he=
ight)
> +                       m =3D ssd13xx->height % page_height;
> +
>                 for (j =3D 0; j < width; j++) {
>                         u8 data =3D 0;
>
>                         for (k =3D 0; k < m; k++) {
> -                               u8 byte =3D buf[(8 * i + k) * line_length=
 + j / 8];
> +                               u32 idx =3D (page_height * i + k) * line_=
length + j / 8;

Nit: I would use unsigned int for idx, as that matches all other
variables involved.
But given array_idx is u32, too, u32 may makes sense.

> +                               u8 byte =3D buf[idx];
>                                 u8 bit =3D (byte >> (j % 8)) & 1;
>
>                                 data |=3D bit << k;

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

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
