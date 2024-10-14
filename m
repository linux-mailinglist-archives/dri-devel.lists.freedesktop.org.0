Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5A699C0B6
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 09:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B5C10E287;
	Mon, 14 Oct 2024 07:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TV7lPpXR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26A210E287
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 07:07:04 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-539e63c8678so1408992e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 00:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728889622; x=1729494422;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DGAZdY+3mMlegbLBhotjKigA3jsyDM7lCK6IChu1+M4=;
 b=TV7lPpXRwhbIYbU0pGUewHaflFwPBnWHWuRDwIaTdb/IkVtlFq4Rtq8CyWz4toXuXF
 efbXRieO8fAUMiJ6YyMKrqVrWR0H+vv3VQFlneS0M2YTrO3cahP/jt/ZWBvJA6BT4Wbs
 31uuzj8U62SOFnzf09aAorvLt4ZfrY9V8Sr+OK9DslqK1XTd6wSrW2KZqrbZCEGtnz2p
 CuYLEnscenfUqY8STH/RdO6jaGr6YQeduXzuwZX7LL2CKBfkLJ6q/6mmwuCgdeADQN58
 HJ/NZwQal9f55SrOtBF+J2uVFF221KjAwQ/njl9dzLXLhUpYczHc5DGfWVYORuuMAAXw
 fFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728889622; x=1729494422;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DGAZdY+3mMlegbLBhotjKigA3jsyDM7lCK6IChu1+M4=;
 b=IIUimVy6X1gkuma2PtHeHUmg7L1xIxgYaXQLyVI7aQfMn28Js9QgauoItOjH3NEVYk
 y+CPNakCst8PnEMSKDSXio7WMPjrw3nzQG4EUWWLXOniXWNcew+jmbXYl2CgROhm+4fu
 HKh9abcvs0WZ7nskWdEifC3AvkMZ39MOwoalPvZgvg8IWScGym91ETbyCGYodNcX0x3V
 uaOv0ogyZQNQHx/HZgzZdVGG+E9qpV562eoVDjPepNtjsklitX6qA2WcehjAjkJnoeyp
 npnq0zpT9kYmKPD4Y0DHkUTOxXFHCtPZodHz66WTjMguqvDPRJcoRLSp2gqiDQYns8T3
 zyjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYf+g809mbFO6eYdVkvSXaT1f0hxJn9DLkXp6cNz5G2DFl3frCVN4N1D8O724E6NTk+8Nm9yJoJSk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykBrx5pM05VDXVUTse6BjLNIc0Eu9dhhjW5QbAk1/SAnaq8199
 +EeR/dgwbBSpbDbnkSmvSxGtW2OucfCcFB3KDq1ugP23L46yC3ayLOnLn70W28kYoLVDlQkDwqm
 OstBvmHDzXWMj2O9/08cUHM94eBqrkiI/qZJEyA==
X-Google-Smtp-Source: AGHT+IFnO48aGUpKmxvFD0o04bcR91QUkt1ZB3Pcb8GYRBZzTTyMcBni5r8seoxZT9HDgGHzFz8b7Seuy1zcTHncsSc=
X-Received: by 2002:a05:6512:3ba5:b0:539:dca9:19cc with SMTP id
 2adb3069b0e04-539e54d77e1mr2760395e87.4.1728889622082; Mon, 14 Oct 2024
 00:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <37842441-e372-40e9-b0f5-cf69defc2db5@stanley.mountain>
In-Reply-To: <37842441-e372-40e9-b0f5-cf69defc2db5@stanley.mountain>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 14 Oct 2024 09:06:50 +0200
Message-ID: <CAMRc=MdFYTtosq53tDFaPSBn11V3P36DOX8xsxRqFhu5iPwUcw@mail.gmail.com>
Subject: Re: [PATCH] fbdev/da8xx-fb: unlock on error paths in suspend/resume
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Helge Deller <deller@gmx.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Sekhar Nori <nsekhar@ti.com>, 
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-fbdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
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

On Fri, Oct 11, 2024 at 9:42=E2=80=AFPM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Add a missing console_unlock() in the suspend and resume functions on
> the error paths.
>
> Fixes: 611097d5daea ("fbdev: da8xx: add support for a regulator")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/video/fbdev/da8xx-fb.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/fbdev/da8xx-fb.c b/drivers/video/fbdev/da8xx-f=
b.c
> index fad1e13c6332..66ff8456b231 100644
> --- a/drivers/video/fbdev/da8xx-fb.c
> +++ b/drivers/video/fbdev/da8xx-fb.c
> @@ -1610,8 +1610,10 @@ static int fb_suspend(struct device *dev)
>         console_lock();
>         if (par->lcd_supply) {
>                 ret =3D regulator_disable(par->lcd_supply);
> -               if (ret)
> +               if (ret) {
> +                       console_unlock();
>                         return ret;
> +               }
>         }
>
>         fb_set_suspend(info, 1);
> @@ -1636,8 +1638,10 @@ static int fb_resume(struct device *dev)
>
>                 if (par->lcd_supply) {
>                         ret =3D regulator_enable(par->lcd_supply);
> -                       if (ret)
> +                       if (ret) {
> +                               console_unlock();
>                                 return ret;
> +                       }
>                 }
>         }
>
> --
> 2.45.2
>

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
