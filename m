Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4401275045C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 12:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8255D10E4C8;
	Wed, 12 Jul 2023 10:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA49D10E4C8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 10:24:29 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-579e212668fso8787457b3.1
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 03:24:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689157468; x=1691749468;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+AfbwBwJNjshQnNKOif9aDI46gRnwtqlbKQaRDBJ9bU=;
 b=UdDAcATrvgKzHbFqj1OsQvPMw8G2E0eoMjQc8wAWLCsvpktLe8iKd3/Oj1K+izQAEE
 W8KEgosbhQMmBILSzLaS/i5NXTMpIYBTzcarKj6PQgbg3EPLzVi4oL9hnsKVTgCBIlnI
 Q0ovo0Z+SEIAUZ7lqbpk7eoZ1KbKUMI4WYG8yW6f5UOjcB96OTDq+8Q9iOqx4OsUVvzQ
 idb8DTGqQPuMyYMRUwy+r5ZGttTtmACY/VckShUSFRr4QS/sYYNS2CZrm2Fc2uPn7/tq
 GxBdJGdn69J3u33Busp+QBb+dgCOdcf5xS1cc75UXTQ2MNcyMCB40kOIoN9Ci8NGpbJp
 fKTA==
X-Gm-Message-State: ABy/qLZ737MwSv/5QeXvRJfDbDUpIcBRoFfJSA4OGPgy0C9rO5cbqbdH
 5xdtmN7nObslPzMXzIhBtkonPfuLHBBdBw==
X-Google-Smtp-Source: APBJJlFnHxU7CkyCklIgNGmO+vcviB9EZnQ5YWV4vyibITNddjKEP+y1w4KJp9Ca6+cC6n0HmW2Rlg==
X-Received: by 2002:a81:6d8e:0:b0:579:fd23:504b with SMTP id
 i136-20020a816d8e000000b00579fd23504bmr1866334ywc.4.1689157468538; 
 Wed, 12 Jul 2023 03:24:28 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com.
 [209.85.128.180]) by smtp.gmail.com with ESMTPSA id
 p203-20020a815bd4000000b00579f1c5ebdasm1096512ywb.15.2023.07.12.03.24.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 03:24:28 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-577ddda6ab1so8949147b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 03:24:28 -0700 (PDT)
X-Received: by 2002:a81:92d3:0:b0:56f:f83f:618 with SMTP id
 j202-20020a8192d3000000b0056ff83f0618mr1642975ywg.19.1689157467952; Wed, 12
 Jul 2023 03:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230609170941.1150941-1-javierm@redhat.com>
 <20230609170941.1150941-6-javierm@redhat.com>
In-Reply-To: <20230609170941.1150941-6-javierm@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 12 Jul 2023 12:24:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWbQ8VAVPdLLpgV97=uY85-PfKWMmzyXpFZ6d=iJ2JOAQ@mail.gmail.com>
Message-ID: <CAMuHMdWbQ8VAVPdLLpgV97=uY85-PfKWMmzyXpFZ6d=iJ2JOAQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/5] drm/ssd130x: Remove hardcoded bits-per-pixel in
 ssd130x_buf_alloc()
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

Thanks for your patch!

On Fri, Jun 9, 2023 at 7:09=E2=80=AFPM Javier Martinez Canillas
<javierm@redhat.com> wrote:
> The driver only supports OLED controllers that have a native DRM_FORMAT_C=
1

DRM_FORMAT_R1 (colormap is fixed to white-on-black).

> pixel format and that is why it has harcoded a division of the width by 8=
.

hardcoded.

> But the driver might be extended to support devices that have a different
> pixel format. So it's better to use the struct drm_format_info helpers to
> compute the size of the buffer, used to store the pixels in native format=
.
>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -150,9 +150,16 @@ static int ssd130x_buf_alloc(struct ssd130x_device *=
ssd130x)
>  {
>         unsigned int page_height =3D ssd130x->device_info->page_height;
>         unsigned int pages =3D DIV_ROUND_UP(ssd130x->height, page_height)=
;
> +       const struct drm_format_info *fi;
> +       unsigned int pitch;
>
> -       ssd130x->buffer =3D kcalloc(DIV_ROUND_UP(ssd130x->width, 8),
> -                                 ssd130x->height, GFP_KERNEL);
> +       fi =3D drm_format_info(DRM_FORMAT_C1);

DRM_FORMAT_R1.

> +       if (!fi)
> +               return -EINVAL;
> +
> +       pitch =3D drm_format_info_min_pitch(fi, 0, ssd130x->width);
> +
> +       ssd130x->buffer =3D kcalloc(pitch, ssd130x->height, GFP_KERNEL);
>         if (!ssd130x->buffer)
>                 return -ENOMEM;

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
