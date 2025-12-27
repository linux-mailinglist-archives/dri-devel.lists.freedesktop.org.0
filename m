Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFAEECDFD1C
	for <lists+dri-devel@lfdr.de>; Sat, 27 Dec 2025 15:16:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E42710E032;
	Sat, 27 Dec 2025 14:16:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gn8IJMPg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91C0F10E032
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 14:16:00 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-b7ce5d6627dso1354083866b.2
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Dec 2025 06:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766844959; x=1767449759; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qeew5kbRgKn77uDh8eaOpRmb++U6/kEJVcuYh9HUj70=;
 b=gn8IJMPg3WE46tXpVFjxogmC95uvXWM14MNENrMtIwOnnPCFvz3utJS6CZfxFJaN5D
 MmKuknyzSJuE3KHqg2WZYZ35N4Rb3Hov/xq8fXMrQOp4GbSzoTsJMKRLUN3qDS6lZ1Uj
 FP9dnqwU0Wims+cxRAf99vHyT72w11NnkuCmBkhVY9m1JAvV1lu0FC7fDctNm5MSxCkE
 EVmzlw7ESnDtujnaoe/WxsJfhsB9Wijb/sRXCNO3KQ54AzBrZ71HpG23OuCU7HZnwAHb
 GJjbrh+n3WXln4h5crsUeK3n7FGkNJy0hUunAu7LZJrOInIDiox/7J+1OzL3LUmcdPrr
 Oyrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766844959; x=1767449759;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Qeew5kbRgKn77uDh8eaOpRmb++U6/kEJVcuYh9HUj70=;
 b=euiUZOzaPzk6J4sVsxldBwER77RjumhMc3BfLPDy7nys1Ajgao+QwvlFnINgOVIV6c
 7uyRZXWX5olTMYqroSJKIIGaljikMFbD7J1muBK9fjVmm0ZO0VS/VBXqHDzm3WOR08Xp
 1pweQ8WTDX0dEezD37U1U+reLxfY6yOsZqyZPE1Tf5gta94rvW4VW+/ayov6cUCI4bzT
 yczobvJMnGIhS2tHHS7UZ/urN2gzVVVMmcm+ubcAbsS+ZxFugcE5i74utpIFfezo03c4
 8W3g/bx6hEUKQfmhMT/qG1Cd31ucYR5js2xgtpJ1pE4TzH885Ttv5ZojjFGgBJjhjB7o
 nUqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVENmHWM5IbhkYE9WIYkqkqgWAG+mkBty/mA7mlKJQU0qH23O5A+G6stTrjfAIZis6Gah2PKMoawrA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx2+x6HOBiCRbV2gVVN2G04kFyp/fZqmtGVYZF9C9Z5Ey8Ov6RS
 VsGlXf4ITNsGGHmCCSFfolcaCqFLHE8KCXQ9S0en+SqlOqWjU3vVU65zk8M/rBB6z+OKqpD0/Ob
 mbCe+/VK5eAnqmA3HhrKXukcsCcjswF8=
X-Gm-Gg: AY/fxX7Gcxz8Dt5oou0HegI3p4iwehBJdbXpoyttN8j+hQX6wVfE1ci576oA56LFRGU
 DfaCwNdDonK+nqGzeLdqG8J/LaCAHHC2g/mt/ysnBwVyXH3bV0Ni63mAEhZ6nQJCeod8BS1oxH9
 PbogWwQaa1gi6thH9//zC5RAbS0kYnAnQcbkJ9Y2bak7uIPclTvcpsgGahIqcoOrxD1EXqRAGLY
 0hOJt3MMsfbd9FfBmQXMLbteTNXm74u8XqsgDgFfmq5bW9uHN3nJHn7yRqlX+3AjKnOAGxBwOpn
 L3rccPS+z0TQeyo20fBGqhOhMBUJKNxciUlhbVkw5/RBNtIfqvlE5gwkHxzH6e4+DJcCefc=
X-Google-Smtp-Source: AGHT+IE5XjXyiX8e5+y2/EJWJkUx9mNmIJWTZRQHZ+11Rz7xT9i6UD39yeJWDYfoSFEzyyea9QAld86n3jERGsExmoA=
X-Received: by 2002:a17:907:7f25:b0:b80:614:b72a with SMTP id
 a640c23a62f3a-b80371756d1mr2980300466b.31.1766844958759; Sat, 27 Dec 2025
 06:15:58 -0800 (PST)
MIME-Version: 1.0
References: <20251219054320.447281-1-chintanlike@gmail.com>
 <20251219054320.447281-3-chintanlike@gmail.com>
In-Reply-To: <20251219054320.447281-3-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 27 Dec 2025 16:15:22 +0200
X-Gm-Features: AQt7F2r_BktXpE7AknVIdZhLL9UU8kDl403QzVGaeIdoMKWSeHXNJeJhHMAVJRQ
Message-ID: <CAHp75VeroxzYs7GScKMv-gOFqJz_U=561b5FH6ifdo2WQNYNyQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] staging: fbtft: Make FB_DEVICE dependency optional
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
 deller@gmx.de, gregkh@linuxfoundation.org
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

On Fri, Dec 19, 2025 at 7:43=E2=80=AFAM Chintan Patel <chintanlike@gmail.co=
m> wrote:
>
> fbtft provides sysfs interfaces for debugging and gamma configuration,
> but these are not required for the core driver.
>
> Drop the hard dependency on CONFIG_FB_DEVICE and make sysfs support
> optional by using dev_of_fbinfo() at runtime. When FB_DEVICE is disabled,
> sysfs operations are skipped while the code remains buildable and
> type-checked.
>
> v2:
> - Replace CONFIG_FB_DEVICE ifdefs with runtime checks
> - Use dev_of_fbinfo() to guard sysfs creation and removal
>
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Suggested-by: Helge Deller <deller@gmx.de>
> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---
>  drivers/staging/fbtft/Kconfig       |  5 ++++-
>  drivers/staging/fbtft/fbtft-sysfs.c | 18 ++++++++++++++----
>  2 files changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/staging/fbtft/Kconfig b/drivers/staging/fbtft/Kconfi=
g
> index c2655768209a..578412a2f379 100644
> --- a/drivers/staging/fbtft/Kconfig
> +++ b/drivers/staging/fbtft/Kconfig
> @@ -2,11 +2,14 @@
>  menuconfig FB_TFT
>         tristate "Support for small TFT LCD display modules"
>         depends on FB && SPI
> -       depends on FB_DEVICE
>         depends on BACKLIGHT_CLASS_DEVICE
>         depends on GPIOLIB || COMPILE_TEST
>         select FB_BACKLIGHT
>         select FB_SYSMEM_HELPERS_DEFERRED
> +       help
> +         Support for small TFT LCD display modules over SPI bus. FB_DEVI=
CE
> +         is not required, but if enabled, provides sysfs interface for d=
ebugging
> +         and gamma curve configuration.
>
>  if FB_TFT
>
> diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/=
fbtft-sysfs.c
> index e45c90a03a90..848702fc871a 100644
> --- a/drivers/staging/fbtft/fbtft-sysfs.c
> +++ b/drivers/staging/fbtft/fbtft-sysfs.c
> @@ -203,14 +203,24 @@ static struct device_attribute debug_device_attr =
=3D
>
>  void fbtft_sysfs_init(struct fbtft_par *par)
>  {
> -       device_create_file(par->info->dev, &debug_device_attr);
> +       struct device *dev =3D dev_of_fbinfo(par->info);
> +
> +       if (!dev)
> +               return;
> +
> +       device_create_file(dev, &debug_device_attr);
>         if (par->gamma.curves && par->fbtftops.set_gamma)
> -               device_create_file(par->info->dev, &gamma_device_attrs[0]=
);
> +               device_create_file(dev, &gamma_device_attrs[0]);
>  }
>
>  void fbtft_sysfs_exit(struct fbtft_par *par)
>  {
> -       device_remove_file(par->info->dev, &debug_device_attr);
> +       struct device *dev =3D dev_of_fbinfo(par->info);
> +
> +       if (!dev)
> +               return;
> +
> +       device_remove_file(dev, &debug_device_attr);
>         if (par->gamma.curves && par->fbtftops.set_gamma)
> -               device_remove_file(par->info->dev, &gamma_device_attrs[0]=
);
> +               device_remove_file(dev, &gamma_device_attrs[0]);
>  }
> --
> 2.43.0
>


--=20
With Best Regards,
Andy Shevchenko
