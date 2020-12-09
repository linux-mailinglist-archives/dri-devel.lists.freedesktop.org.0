Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6146D2D44E2
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 15:56:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6241989A91;
	Wed,  9 Dec 2020 14:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37ACE89A5D;
 Wed,  9 Dec 2020 14:56:41 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id p7so1024797vsf.8;
 Wed, 09 Dec 2020 06:56:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G4fJdoUImaH/IPDQ7+Ewsv0IvyhO4T4xYRwIN5OZcm4=;
 b=kaXsh9PltWkxaAw0DlG2m0molY56ALyjskUsIBVAnt51Oo6u6FvSQwPm22rtX0nnEr
 D8L5nJWYYab+90/RuEtkb+Md32Bd9h39kYBk2YvyANK/n6Mq1SMxZtB/wuJxfdjOW0nc
 n6cJyzjKIARrSjNtxPapR5ulKVV5dPniIrvnZmBpPwKb0NuFp0WZTneh5Sk6avlZUtmI
 /8MZ5EmgqMGbbjV+rJ4O3/UaZQWOXQP16hiwqCYkqE79UjT9SXyK04QgFyYQJV/PAVz3
 QdC8h2nwxaGi2uytMICf16mVWiIcXX1S0vsxppz3fhzInn6H6NGvWnx3AKYrSp71jrtl
 0k4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G4fJdoUImaH/IPDQ7+Ewsv0IvyhO4T4xYRwIN5OZcm4=;
 b=HhBgZOHvY1EVewEmvmCYB91PnuYmf0p9kVe/ZyJrAtsbMfb5tAn0vxINh4RPiUtAzC
 pXzbTBVCkBU99VaaifwkbtYuqE6kTzFfMOjZGNYvqX4dE6E6AjVeBuUJev21D0fzRclF
 zHdkycCZFi2rWjNA3XgWg9gMsu6CRj1O5uWzflQN172HFmWbLVC2dkmfGnc64rf3IpJr
 eF84obM3Kz4Haea9qhSFfPEYOB9Rb9YsvFmSXaGlLvq7+1xszUDTKh/4CX06AEwy8Biy
 vTME12rZ588EYCuE9s9XgejSbSEqcglyoBL3S6cgLgaPH+t8SQ8eLfEkQlrydBVety2p
 7bqw==
X-Gm-Message-State: AOAM5337KbbU94QQ+Iv2g/1rmDclijI8i+xlil4X+mim7rHVK8A9CGHh
 zTT29fNHA84rTs6nFsCg9J22FmdYhEPED/a1Ez8=
X-Google-Smtp-Source: ABdhPJwCsaG9/cuPS0S2XnFjNmpsqWN4EHnPOsfcbw/oNTsSl60NKrmjEFk0Uwg4vR1+Gab20QBAV+T8UXzM+IWGF3U=
X-Received: by 2002:a67:15c4:: with SMTP id 187mr2114650vsv.15.1607525800417; 
 Wed, 09 Dec 2020 06:56:40 -0800 (PST)
MIME-Version: 1.0
References: <20201201203829.1735559-1-lkundrak@v3.sk>
 <20201201203829.1735559-3-lkundrak@v3.sk>
In-Reply-To: <20201201203829.1735559-3-lkundrak@v3.sk>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 9 Dec 2020 15:56:28 +0100
Message-ID: <CAH9NwWeiXJAO9_U5ooaA3k=xZV78Tbt4u97iR=2VsHwxaL2tTQ@mail.gmail.com>
Subject: Re: [PATCH libdrm 2/3] tests/etnaviv_2d_test: pick the 2D core
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
> Run the test on a core capable of 2D rendering instead of hardcoding to
> core zero.
>

Thanks - I should have done this before landing this test :)

> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

> ---
>  tests/etnaviv/etnaviv_2d_test.c | 31 ++++++++++++++++++++++++-------
>  1 file changed, 24 insertions(+), 7 deletions(-)
>
> diff --git a/tests/etnaviv/etnaviv_2d_test.c b/tests/etnaviv/etnaviv_2d_test.c
> index eb9dfa59..a75a4a89 100644
> --- a/tests/etnaviv/etnaviv_2d_test.c
> +++ b/tests/etnaviv/etnaviv_2d_test.c
> @@ -161,6 +161,8 @@ int main(int argc, char *argv[])
>
>         drmVersionPtr version;
>         int fd, ret = 0;
> +       uint64_t feat;
> +       int core = 0;
>
>         if (argc < 2) {
>                 fprintf(stderr, "Usage: %s /dev/dri/<device>\n", argv[0]);
> @@ -190,13 +192,28 @@ int main(int argc, char *argv[])
>                 goto out;
>         }
>
> -       /* TODO: we assume that core 0 is a 2D capable one */
> -       gpu = etna_gpu_new(dev, 0);
> -       if (!gpu) {
> -               perror("etna_gpu_new");
> -               ret = 3;
> -               goto out_device;
> -       }
> +       do {
> +               gpu = etna_gpu_new(dev, core);
> +               if (!gpu) {
> +                       perror("etna_gpu_new");
> +                       ret = 3;
> +                       goto out_device;
> +               }
> +
> +               if (etna_gpu_get_param(gpu, ETNA_GPU_FEATURES_0, &feat)) {
> +                       perror("etna_gpu_get_param");
> +                       ret = 4;
> +                       goto out_device;
> +               }
> +
> +               if ((feat & (1 << 9)) == 0) {
> +                       /* GPU not 2D capable. */
> +                       etna_gpu_del(gpu);
> +                       gpu = NULL;
> +               }
> +
> +               core++;
> +       } while (!gpu);
>
>         pipe = etna_pipe_new(gpu, ETNA_PIPE_2D);
>         if (!pipe) {
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
