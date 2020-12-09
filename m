Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DC02D44DA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Dec 2020 15:55:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F85F89A4E;
	Wed,  9 Dec 2020 14:54:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD6289A4E;
 Wed,  9 Dec 2020 14:54:58 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id v8so1026498vso.2;
 Wed, 09 Dec 2020 06:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hxtflmsMeTNgaATfE0kw89kTercNxrr7qBaXpt6ZltA=;
 b=AqiJTEkG3PwekmbfmfrxDhIz/U1lyjvUAldSt7MMCbD7IkcFssABTvGyvLNogK2EpS
 XrhO/OMvjUg/kd1JwzolU8wI4U3SS3nyQvWN1vTKcTYArDcNYthTco5kXMCU2oT7gUli
 bZipnN+KZAIQ8sUGNF2z46vXYQ5H6RVWewibO/WGSR6sR0gsmxGh2HNcgaA5XJXahFK/
 KrlnSDSDl5NeHJbmiizvdYAncLYPiqbmwT+RS8Db4o9MqmuI2DOZQaDJf0D0qNl07jjn
 3i+IwjbgB+HS/mN7kp9s9Yj48gVfhGx66g3TNs4HbJ2vZJRnFrFJtcWWbujRb/L3hQDv
 NpXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hxtflmsMeTNgaATfE0kw89kTercNxrr7qBaXpt6ZltA=;
 b=JQPWArdEhglEtFdm0ryHgwFhtVNM38sfahJijrabFRGULvE4+g3/JcjwfmurK704NT
 bOgHLja0xCGXqCLp2rEPt2pZxcjAwsxfkwcKjEFKMpYLnKmD67lRI57zXijXHCBnDDid
 9K7Is9Qn3GHJo1gZMwtgcMCsnieXNBAt+ZGQYhJYPCZWg/oLz5YoDO39sk/iP31YNzbC
 SWRYJLX2iSiET/odrAu1oAaGMme61XKfBDLHawmD6uqc5V81GBDbo73N+PVcnyt+fEEm
 eOINl2iBBSffz1fceur0DTr9zy68vWN92w5WrU9P8FtA7H/+bpWJEeKzYeAfqLRUg6q3
 d4bg==
X-Gm-Message-State: AOAM533CCm30NoD3GyyBGVjQcZRYK6/QTOA08U35pk9y0bG7KOZvyJjC
 H0zfjI661DEqtWm0MuLNXQ3djO9E5cS42NnRKl+sht/fwyWdWg==
X-Google-Smtp-Source: ABdhPJxBHtmG9PhLeKx3r56IkOeKBX3EKZxeg9jQEIlymw1Z8FR2N3LAYLQU4dsHyyiGCjh5Dj9ud5KzCWuLuXX/sFc=
X-Received: by 2002:a67:ea54:: with SMTP id r20mr2144561vso.9.1607525697209;
 Wed, 09 Dec 2020 06:54:57 -0800 (PST)
MIME-Version: 1.0
References: <20201201203829.1735559-1-lkundrak@v3.sk>
 <20201201203829.1735559-2-lkundrak@v3.sk>
In-Reply-To: <20201201203829.1735559-2-lkundrak@v3.sk>
From: Christian Gmeiner <christian.gmeiner@gmail.com>
Date: Wed, 9 Dec 2020 15:54:46 +0100
Message-ID: <CAH9NwWePufaKaAV=5wq80GWgEq8=4a4YoQFTFCYhK7KnDF=DZg@mail.gmail.com>
Subject: Re: [PATCH libdrm 1/3] tests/etnaviv_2d_test: explain the errors
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
> Just so that it's obvious what failed and why.
>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Reviewed-by: Christian Gmeiner <christian.gmeiner@gmail.com>

> ---
>  tests/etnaviv/etnaviv_2d_test.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/tests/etnaviv/etnaviv_2d_test.c b/tests/etnaviv/etnaviv_2d_test.c
> index 8dd77b66..eb9dfa59 100644
> --- a/tests/etnaviv/etnaviv_2d_test.c
> +++ b/tests/etnaviv/etnaviv_2d_test.c
> @@ -162,9 +162,16 @@ int main(int argc, char *argv[])
>         drmVersionPtr version;
>         int fd, ret = 0;
>
> -       fd = open(argv[1], O_RDWR);
> -       if (fd < 0)
> +       if (argc < 2) {
> +               fprintf(stderr, "Usage: %s /dev/dri/<device>\n", argv[0]);
>                 return 1;
> +       }
> +
> +       fd = open(argv[1], O_RDWR);
> +       if (fd < 0) {
> +               perror(argv[1]);
> +               return 1;
> +       }
>
>         version = drmGetVersion(fd);
>         if (version) {
> @@ -178,6 +185,7 @@ int main(int argc, char *argv[])
>
>         dev = etna_device_new(fd);
>         if (!dev) {
> +               perror("etna_device_new");
>                 ret = 2;
>                 goto out;
>         }
> @@ -185,18 +193,21 @@ int main(int argc, char *argv[])
>         /* TODO: we assume that core 0 is a 2D capable one */
>         gpu = etna_gpu_new(dev, 0);
>         if (!gpu) {
> +               perror("etna_gpu_new");
>                 ret = 3;
>                 goto out_device;
>         }
>
>         pipe = etna_pipe_new(gpu, ETNA_PIPE_2D);
>         if (!pipe) {
> +               perror("etna_pipe_new");
>                 ret = 4;
>                 goto out_gpu;
>         }
>
>         bmp = etna_bo_new(dev, bmp_size, ETNA_BO_UNCACHED);
>         if (!bmp) {
> +               perror("etna_bo_new");
>                 ret = 5;
>                 goto out_pipe;
>         }
> @@ -204,6 +215,7 @@ int main(int argc, char *argv[])
>
>         stream = etna_cmd_stream_new(pipe, 0x300, NULL, NULL);
>         if (!stream) {
> +               perror("etna_cmd_stream_new");
>                 ret = 6;
>                 goto out_bo;
>         }
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
