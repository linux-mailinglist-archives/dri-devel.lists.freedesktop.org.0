Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E3B2D44EC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 15:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01496EA76;
	Wed,  9 Dec 2020 14:58:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A7D6EA48;
 Wed,  9 Dec 2020 14:58:46 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id x26so1041387vsq.1;
 Wed, 09 Dec 2020 06:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Np9UgJRycvQwpQGNE2yYpgVDH1Z3o7mevwsErmtfEs=;
 b=kyEtl18OU+cr117sFVa/EilbHkKsswbLn4VFsz3jvY/cCo48yHobIJ+fNunDlAT7xS
 LdWXV+hMurfVaS3f1sosYnY1V/UpCv6rh/hXvzm5ERKmtBjQf2k1qZG2DZMPtnexTxH9
 rG1mNQDdQNiw1514B0alZjzvAZy/hhJ6HXC6k3KH7sUNj4Lwnc0UJuoGdmdxQLQHUM2b
 akgEZtB52yjGJEBHut5HNMZiuIPQA7G6e73r/tIdGVeGhlZdQxW24Qi0wGQTiQSn2jj/
 bR4QyttrMtjaIdK1ECx8HtOkNK2R/sJ0isAmjEROZd7bhNn211R/sx4F8mpUGrUiJLFw
 JPAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Np9UgJRycvQwpQGNE2yYpgVDH1Z3o7mevwsErmtfEs=;
 b=kqPLQPZ0cHeqccaT3Gi9zyROzq3yKbJsFC3RuCPbAARygwi2r7DmFHReRTJF6BEBQA
 hx4XIlJ0YrZzh2rPw4DL0bSY/aAnhaU0cbearmYRzWoJma2NPBKRWdutDIap+3PcEzac
 AHVa0WPyFJ4XJvwuwHxYFe9xrY3iG9yKZj/a+zkWQLDgv2hWc1br8dsbRjJzJ9xXuLm2
 kZ5zbfLGfG9f4SxBFcxNSmYwVVGkTU8NTkHiyS66Fexv446xIGLJsX8r5sfFys8jN5T3
 EPpkyfXS3vpV0zQNCBlG1SK/7U3j0LOCsSUdq/5voaEePjfVTxN+BbxVwCtdfzVceIMD
 Texg==
X-Gm-Message-State: AOAM533nWMg0xP/j5iZZ0NmDmaNWx+fdvKL0qv7snVpa4KU8u16Qrszh
 ufZJ/JD+0jBruXDZVDyaI+UKIZkVldOX7ih0MYU5aK6cqfdDUA==
X-Google-Smtp-Source: ABdhPJy7pSqKkqt/hf1ZO6X2l4SErP7qwfrcBZHndcDaWTpJLRgglMaho7bnVStgayTtdb7l3teE4B4+hPYD5OJ11G8=
X-Received: by 2002:a67:30c1:: with SMTP id w184mr2114251vsw.13.1607525925484; 
 Wed, 09 Dec 2020 06:58:45 -0800 (PST)
MIME-Version: 1.0
References: <20201201203829.1735559-1-lkundrak@v3.sk>
 <20201201203829.1735559-4-lkundrak@v3.sk>
In-Reply-To: <20201201203829.1735559-4-lkundrak@v3.sk>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 9 Dec 2020 15:58:34 +0100
Message-ID: <CAH9NwWfhzYjJYBctvPbDEr+hBBYMeUYQda9dvnyyXL_6g+vm0g@mail.gmail.com>
Subject: Re: [PATCH libdrm 3/3] tests/etnaviv_2d_test: check whether the
 rendering is correct
To: Lubomir Rintel <lkundrak@v3.sk>
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
Cc: The etnaviv authors <etnaviv@lists.freedesktop.org>,
 DRI mailing list <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Di., 1. Dez. 2020 um 21:38 Uhr schrieb Lubomir Rintel <lkundrak@v3.sk>:
>
> Instead of always dumping the rendered picture, check whether it matches
> the expectations. This makes more sense for automated testing.
>
> Retain the ability to dump the picture instead of checking it when a
> file name is given as an argument. This also removes use of a hardcoded
> file name in a world writable directory, which is an unsafe thing to
> do anyway.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

> ---
>  tests/etnaviv/etnaviv_2d_test.c | 29 +++++++++++++++++++++++++++--
>  1 file changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/tests/etnaviv/etnaviv_2d_test.c b/tests/etnaviv/etnaviv_2d_test.c
> index a75a4a89..9fcdae18 100644
> --- a/tests/etnaviv/etnaviv_2d_test.c
> +++ b/tests/etnaviv/etnaviv_2d_test.c
> @@ -147,6 +147,27 @@ static void gen_cmd_stream(struct etna_cmd_stream *stream, struct etna_bo *bmp,
>         etna_set_state(stream, VIVS_GL_FLUSH_CACHE, VIVS_GL_FLUSH_CACHE_PE2D);
>  }
>
> +int etna_check_image(uint32_t *p, int width, int height)
> +{
> +       int i;
> +       uint32_t expected;
> +
> +       for (i = 0; i < width * height; i++) {
> +               if (i%8 < 4 && i%(width*8) < width*4 && i%width < 8*16 && i < width*8*16)
> +                       expected = 0xff40ff40;
> +               else
> +                       expected = 0x00000000;
> +
> +               if (p[i] != expected) {
> +                       fprintf(stderr, "Offset %d: expected: 0x%08x, got: 0x%08x\n",
> +                               i, expected, p[i]);
> +                       return -1;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
>  int main(int argc, char *argv[])
>  {
>         const int width = 256;
> @@ -165,7 +186,7 @@ int main(int argc, char *argv[])
>         int core = 0;
>
>         if (argc < 2) {
> -               fprintf(stderr, "Usage: %s /dev/dri/<device>\n", argv[0]);
> +               fprintf(stderr, "Usage: %s /dev/dri/<device> [<etna.bmp>]\n", argv[0]);
>                 return 1;
>         }
>
> @@ -242,7 +263,11 @@ int main(int argc, char *argv[])
>
>         etna_cmd_stream_finish(stream);
>
> -       bmp_dump32(etna_bo_map(bmp), width, height, false, "/tmp/etna.bmp");
> +       if (argc > 2)
> +               bmp_dump32(etna_bo_map(bmp), width, height, false, argv[2]);
> +
> +       if (etna_check_image(etna_bo_map(bmp), width, height))
> +               ret = 7;
>
>         etna_cmd_stream_del(stream);
>
> --
> 2.28.0
>
> _______________________________________________
> etnaviv mailing list
> etnaviv@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/etnaviv



-- 
greets
--
Christian Gmeiner, MSc

https://christian-gmeiner.info/privacypolicy
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
