Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCAE91C621
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 20:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1963A10E2FC;
	Fri, 28 Jun 2024 18:55:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="clKY7FK/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDAE710E2FC
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 18:55:21 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id
 a640c23a62f3a-a724440f597so126386466b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 11:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719600920; x=1720205720; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QLIc478CrM8WRyLsKp7HKGbFT+nWGbRboxpgjYNwu6s=;
 b=clKY7FK/US2wZelcebKxkZr7ccd4VzluOd217S8Nohs44Nkm2g7IPfrioZJzjq+CA9
 yr7bDBLPgC7YEkGQA6O5YavDXYs1a8Jq2+JAw5qYG1MLs+8Y24uc+GArF9Xc3TLKmJo8
 krprzGzp3RTKbeP4DQY9anQA5TursZfXAfGWEQAYdby+mUitQ2LOQozGvDJs6o4v4KUe
 3EN0/Tmtp+otc7tpfsh85wvBgFYbgLFYjktgQPJwincCd4rVsV5fhK3z5/YvkUWVBx7A
 70HEAZPIqZplO7i3oafflawy9d5qoGn60ILUswnkqJbDfrRDAq1lSzDzau86m+mLDgGb
 57vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719600920; x=1720205720;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QLIc478CrM8WRyLsKp7HKGbFT+nWGbRboxpgjYNwu6s=;
 b=PWEHOw+qfcTqAz4EIxN+GQVrmMsHqDiGSjZLlAl3NwsETXoAfMXCMX+6LSY1u1vyC8
 u8YCYDuJHBCtIW8TBpYRK/Cpbv3zTUPSrofc99wxnBgy6GJK/bJ5Ae6v7A6lPpf9DsPv
 dw8zWbeK3KGeGDVuMs+YjuU/yZFPKEAFagqgMSx1p2TJyUTAI81yxyZBcDJ03Wdp9wYd
 54Ftx/Tb3U5slyphYSfW7AaFik0+LZH++yuwwm5muZFwKokLSgUeOXFZvRqvMH++7wjP
 n5JwNYj0fUZohUv98CTdBuzUS7gJkMZZzuoYPpCBKv7OUe7NttlNEw3J/1NdHIebb2Kc
 nXrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEw9Q/9aZbxUlGnaJ5P5aAyVa4sGpbYNNPTjkt5F2HPCKAJHt0X5Wkz4KA2mfwXpB615wVWIOZAF0OkHaoDfbr+pl9xftHX+BxzAs0znt1
X-Gm-Message-State: AOJu0Yw53dOBVtVooVN+ZdvWFlv7Stk9+5YulMjujSjfWDcyw64a8dVT
 EE7ND+R8luuUU8dDLF4OVkqCe+KLnXhcaEOd9oM6E/8RX5+vn06gvzU7/+2xFJY90eu+xYwgMtx
 tB3o5uvzGTZ2L+z6ys/bPAKoe/OY=
X-Google-Smtp-Source: AGHT+IHeGM3d7YvzcLQJxAxEGdEg5stxZMe7tyJA5kiIIVgTMzM2ylMjwUFy3aKkTXzmqtMIOpkybbDc3e5mBxpP3kM=
X-Received: by 2002:a17:906:7955:b0:a72:98a0:7159 with SMTP id
 a640c23a62f3a-a7298a072damr462138866b.68.1719600920041; Fri, 28 Jun 2024
 11:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240625081818.15696-1-tzimmermann@suse.de>
In-Reply-To: <20240625081818.15696-1-tzimmermann@suse.de>
From: =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>
Date: Fri, 28 Jun 2024 14:54:42 -0400
Message-ID: <CAAxE2A68QveD4nNa_OyQQHYSdbvArck6oWnV7YsmWC89B8x=yA@mail.gmail.com>
Subject: Re: [PATCH] firmware: sysfb: Fix reference count of sysfb parent
 device
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org, 
 Helge Deller <deller@gmx.de>, Jani Nikula <jani.nikula@intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Sui Jingfeng <suijingfeng@loongson.cn>, stable@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

FYI, this doesn't fix the issue of lightdm not being able to start for me.

Marek


Marek

On Tue, Jun 25, 2024 at 4:18=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Retrieving the system framebuffer's parent device in sysfb_init()
> increments the parent device's reference count. Hence release the
> reference before leaving the init function.
>
> Adding the sysfb platform device acquires and additional reference
> for the parent. This keeps the parent device around while the system
> framebuffer is in use.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 9eac534db001 ("firmware/sysfb: Set firmware-framebuffer parent dev=
ice")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Helge Deller <deller@gmx.de>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Sui Jingfeng <suijingfeng@loongson.cn>
> Cc: <stable@vger.kernel.org> # v6.9+
> ---
>  drivers/firmware/sysfb.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 880ffcb50088..dd274563deeb 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -101,8 +101,10 @@ static __init struct device *sysfb_parent_dev(const =
struct screen_info *si)
>         if (IS_ERR(pdev)) {
>                 return ERR_CAST(pdev);
>         } else if (pdev) {
> -               if (!sysfb_pci_dev_is_enabled(pdev))
> +               if (!sysfb_pci_dev_is_enabled(pdev)) {
> +                       pci_dev_put(pdev);
>                         return ERR_PTR(-ENODEV);
> +               }
>                 return &pdev->dev;
>         }
>
> @@ -137,7 +139,7 @@ static __init int sysfb_init(void)
>         if (compatible) {
>                 pd =3D sysfb_create_simplefb(si, &mode, parent);
>                 if (!IS_ERR(pd))
> -                       goto unlock_mutex;
> +                       goto put_device;
>         }
>
>         /* if the FB is incompatible, create a legacy framebuffer device =
*/
> @@ -155,7 +157,7 @@ static __init int sysfb_init(void)
>         pd =3D platform_device_alloc(name, 0);
>         if (!pd) {
>                 ret =3D -ENOMEM;
> -               goto unlock_mutex;
> +               goto put_device;
>         }
>
>         pd->dev.parent =3D parent;
> @@ -170,9 +172,12 @@ static __init int sysfb_init(void)
>         if (ret)
>                 goto err;
>
> -       goto unlock_mutex;
> +
> +       goto put_device;
>  err:
>         platform_device_put(pd);
> +put_device:
> +       put_device(parent);
>  unlock_mutex:
>         mutex_unlock(&disable_lock);
>         return ret;
> --
> 2.45.2
>
