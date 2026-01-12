Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86A0D10CDE
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 08:08:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1280310E00B;
	Mon, 12 Jan 2026 07:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OtVmX11Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592B510E00B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 07:08:21 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-64b92abe63aso12216551a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Jan 2026 23:08:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768201700; x=1768806500; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tDtobSm2s3UkTYNtP162SerczReKzDGTa8FA9CeAFBg=;
 b=OtVmX11QwOfZ3cpHNiH3egCG1ILXEIWJiqvf2+SKHnhiPE3YZMc5d6O5ydv9BygoVj
 VwROJSW1uVheDVeWlc14KRlSABnD/V1UOqtJitHBEA9981F64ijM3mS7Ep4NNB6R9RPs
 TJGsyIgDn6v8c+Ou9Y8dUCMpPWFz/2uep2EXRhWvX+Hc5xCzE5dgKopcdVzo50h68nJm
 LVgdwdBzKpiCnwG2VX7irPJzbS+Q2A67FzICpaz7YCELgIRui3Q0mQ0oIMVhJHSj88IW
 syFLCq9eNvl+chScW8cB1jzXqGq/etCGVMn55kXBogvzxyaY/gPpwWzZPwDbz7HVcoCJ
 mE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768201700; x=1768806500;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tDtobSm2s3UkTYNtP162SerczReKzDGTa8FA9CeAFBg=;
 b=XW7rBn1FrECPHVDDWkMtPm7KMAxjHArKQ1u1Dj8qwA5Ix/SOvwuO2c/i6F0jvARRZz
 l0rr+oTuKM+RS/34mzb8oByXxryYPG6MMi9YLqzXiRiJYrW0B5malbNLrMndKC2yKsiU
 YRRy3YgNNaBrMFW+wbiA4uO3z+wkQ4wm5UWdtDPqCDA5oBHatDcZVXbX26bZbJpkGLuH
 oTaCFMYI+X3Z2Cdp2LLDQoRUEV+110doKzo1AYKpdhJD1EccTsA09r2WVv2WLMM0GMDQ
 LaiVdrla5oLixQWG4TDApaWrzoGbqD0VAeYt/kgzhb7FH1kyVah6CR7RW4hZ8AxIgODc
 Vbww==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbFY+6rr2bi5dboIIoMoy900WUS6CHUzTpjJKRlQfomBAkYpTCbpKZeF0vwCD+X4nU1R5E58FLPb4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx96QOPUAp7AirVGqA/PjjOePrGFIwpY2j92cMFZJ63NCXNDHC/
 UHSIZZfq2qtBA5HMiztcTS9J9W1z00PGzsXX2VY4C7IC2XQ9BYCq53Fwzy9tYWM2/z9lTTssBvm
 ZS7Bvtf09QCWP5pxJHJ2jGZY7jUb1BIM=
X-Gm-Gg: AY/fxX7SlcY6zOWat50XvK+MyMZVgGxA3nZ+5x/B09ZXGU+Y5OZ6MXl7RbHqbcVld5P
 gtl+4M5z7oa6e9nYib+ew0wEW3vtIHKfHVkbGIkNO2ANcxIjRtCvOLuBTpmV0DbV8vouXzx0wSV
 XVkHj2iYMwT4FJRwaHJsTZNXuiHuvsokh8he5Xhce1oNYKSqOpK4MYfmIFLoHiLv/DmO6x1IJIO
 nGx0FvrP9d6UxS9VkXZklTwIZQgErQUxUCZPd8gsm+dCD6yZIRi3nHS8cKEh0lLeZI+DBlEVl66
 WSydI+t9rY98kqtc7UwkUWMJZJjbgoBVnlnvGfvWQyhPFdlcqqZXr54djM6oLRWp+eHe76o=
X-Google-Smtp-Source: AGHT+IGpYjqq+pg/XnsC/5GM0k5nhevTAfoh1OMUUjQOBvSBPsf/kZ7p8LloN/33VrzRKiJwU/cvplIIHQUOpkB6aIk=
X-Received: by 2002:a17:907:e106:b0:b84:5927:6ed1 with SMTP id
 a640c23a62f3a-b8459276eefmr841165266b.30.1768201699516; Sun, 11 Jan 2026
 23:08:19 -0800 (PST)
MIME-Version: 1.0
References: <20260112010740.186248-1-chintanlike@gmail.com>
In-Reply-To: <20260112010740.186248-1-chintanlike@gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Jan 2026 09:07:42 +0200
X-Gm-Features: AZwV_QhOYCW6xjV6nzt8R01WACOin2n1BWUyz1yiKwXq9XWTu9UtzwIoiSzFyuU
Message-ID: <CAHp75VeF+Sj=dxA4RZAvVddGSG3brUsy8kz7mvtst2YpqNm99w@mail.gmail.com>
Subject: Re: [PATCH v5] staging: fbtft: use dev_of_fbinfo() instead of
 info->dev
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy@kernel.org, 
 deller@gmx.de, gregkh@linuxfoundation.org, kernel test robot <lkp@intel.com>
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

On Mon, Jan 12, 2026 at 3:07=E2=80=AFAM Chintan Patel <chintanlike@gmail.co=
m> wrote:

> This fixes commit
> a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")

Convert to be as Fixes tag instead.

> from my previous v4 series:
> https://patchwork.kernel.org/project/dri-devel/cover/20260107044258.52862=
4-1-chintanlike@gmail.com/

This is unneeded churn in the commit message, also this patch wrongly
marked as v5 that triggered Greg's bot response. You had to number it
as v1, but now please, address the above and below comments and make
it v6 with a Changelog added (explaining changes in v5 and in v6).

> All direct accesses to info->dev or fb_info->dev are replaced with
> dev_of_fbinfo() helper, improving readability and ensuring
> compilation succeeds when CONFIG_FB_DEVICE=3Dn.

...

> @@ -364,8 +364,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, uns=
igned int red,
>  {
>         unsigned int val;
>         int ret =3D 1;
> +       struct device *dev =3D dev_of_fbinfo(info);

Try to keep it in reversed xmas tree order.

...

>  static int fbtft_fb_blank(int blank, struct fb_info *info)
>  {
>         struct fbtft_par *par =3D info->par;
> +       struct device *dev =3D dev_of_fbinfo(info);
>         int ret =3D -EINVAL;

Ditto.

> -       dev_dbg(info->dev, "%s(blank=3D%d)\n",
> +       dev_dbg(dev, "%s(blank=3D%d)\n",
>                 __func__, blank);

Since you are changing it anyway, make it one line.

...

> @@ -739,6 +741,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_inf=
o)
>         char text2[50] =3D "";
>         struct fbtft_par *par =3D fb_info->par;
>         struct spi_device *spi =3D par->spi;
> +       struct device *dev =3D dev_of_fbinfo(fb_info);

Reversed xmas tree order (as much as it's possible with this added line).

--=20
With Best Regards,
Andy Shevchenko
