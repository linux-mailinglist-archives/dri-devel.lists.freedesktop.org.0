Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFD775C56A
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 13:07:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB53410E653;
	Fri, 21 Jul 2023 11:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com
 [IPv6:2607:f8b0:4864:20::e31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6453510E653
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 11:07:46 +0000 (UTC)
Received: by mail-vs1-xe31.google.com with SMTP id
 ada2fe7eead31-440c368b4e2so766498137.2
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 04:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1689937665; x=1690542465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r5tB76GjvqrYC+DTRCo2UQKFWIgvLZ4XI2pYbsVGhys=;
 b=s8I6ZrL/nSmSOh9gkg0xEc4qZagaDjutE3xd71QcIAObHXuZykrTAcjoDNIXBituuI
 HfWx90BqkwyI2tmkd4+4t2d0qvVkPcI1SCuYhkbCYwC4t/HXUkjJS+nLT3ZsI1BdxJXg
 mzzCGAV3b64Pwwl1dViRpl330WXavnDX/B+vZqT0QTHiHBuOBE77zkRjBSeele2dVpNn
 ZYDxjjev13elrGGo9CRNfZtuWdLytrcXtf6/zgMxxjdJwCsZQm9flKvxcWws3e+iAHYX
 SVkbDdsTg5RziOdyfdZGrrsI6tqgfTCMf8oo4whzYo2tQAG+gnfTcBIz5g3q8zdfHdoD
 ribA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689937665; x=1690542465;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r5tB76GjvqrYC+DTRCo2UQKFWIgvLZ4XI2pYbsVGhys=;
 b=HWaJ5qLupYBROih8WS1IbV/9rr8f4V1P8q3+eFjC5xtD9cIHYTrRXgVGhT7llOSxda
 dSXGTgc1KcyFA4wNrBblSRxSwINCQ3E8iK08mSdeI1biJukohocB4G5kfXizTJv4BAmM
 59KXiVwcbVw+9KmuCtvYCVaMsEG1k1iv5EsqXdOSKhqK6NTRQDQEkhd2nWwgn0JY6GwH
 OQwc71ANwC8EZiCo0uKXBtQ+zqqUKmC/nd8V7gZP/XmoiST7gbCTaXSTx+XXQYZ7GfXn
 GheR70mBKRThzJ4sxOxzgxw0Yzpa8yDXScffu4xnuecB4lTzYfGru2rJUJtgEH7VkuxC
 nGaQ==
X-Gm-Message-State: ABy/qLYDPjHfPnLhMBNaCACMz7rN3X/+kSByoThuc126+vyadV0imGHl
 o7gWlB5Kt12scdaDfXkMuVDOT5b134n8TCt6ddnQGQ==
X-Google-Smtp-Source: APBJJlFUir/tUCGBKYIaKDI8tzxMysdIpDY7h5Mgngyxia5S6KeG3LorcA/vbJOB1C3s1aEGCGCbVEXRwmusmkxxOc8=
X-Received: by 2002:a67:b34a:0:b0:446:bf73:771a with SMTP id
 b10-20020a67b34a000000b00446bf73771amr659018vsm.20.1689937665364; Fri, 21 Jul
 2023 04:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230721093342.1532531-1-victor.liu@nxp.com>
In-Reply-To: <20230721093342.1532531-1-victor.liu@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Jul 2023 13:07:34 +0200
Message-ID: <CAMRc=MfPKQuEGrFXuPNOKchE_Fj+obOheDoemoF9rxtRWYiFCg@mail.gmail.com>
Subject: Re: [PATCH v4] backlight: gpio_backlight: Drop output GPIO direction
 check for initial power state
To: Ying Liu <victor.liu@nxp.com>
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
Cc: "andy@kernel.org" <andy@kernel.org>,
 "daniel.thompson@linaro.org" <daniel.thompson@linaro.org>,
 "jingoohan1@gmail.com" <jingoohan1@gmail.com>, "deller@gmx.de" <deller@gmx.de>,
 "lee@kernel.org" <lee@kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 21, 2023 at 11:29=E2=80=AFAM Ying Liu <victor.liu@nxp.com> wrot=
e:
>
> If GPIO pin is in input state but backlight is currently off due to
> default pull downs, then initial power state is set to FB_BLANK_UNBLANK
> in DT boot mode with phandle link and the backlight is effectively
> turned on in gpio_backlight_probe(), which is undesirable according to
> patch description of commit ec665b756e6f ("backlight: gpio-backlight:
> Correct initial power state handling").
>
> Quote:
> ---8<---
> If in DT boot we have phandle link then leave the GPIO in a state which t=
he
> bootloader left it and let the user of the backlight to configure it furt=
her.
> ---8<---
>
> So, let's drop output GPIO direction check and only check GPIO value to s=
et
> the initial power state.
>
> Fixes: 706dc68102bc ("backlight: gpio: Explicitly set the direction of th=
e GPIO")
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v3->v4:
> * Capitalize words 'gpio' in patch description. (Andy)
> * Capitalize word 'gpio' in patch title.
> * Quote appropriately in patch description. (Andy)
>
> v2->v3:
> * Add Fixes tag. (Daniel)
>
> v1->v2:
> * Improve patch description. (Daniel, Bartosz, Andy)
>
>  drivers/video/backlight/gpio_backlight.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/video/backlight/gpio_backlight.c b/drivers/video/bac=
klight/gpio_backlight.c
> index 6f78d928f054..38c46936fdcd 100644
> --- a/drivers/video/backlight/gpio_backlight.c
> +++ b/drivers/video/backlight/gpio_backlight.c
> @@ -87,8 +87,7 @@ static int gpio_backlight_probe(struct platform_device =
*pdev)
>                 /* Not booted with device tree or no phandle link to the =
node */
>                 bl->props.power =3D def_value ? FB_BLANK_UNBLANK
>                                             : FB_BLANK_POWERDOWN;
> -       else if (gpiod_get_direction(gbl->gpiod) =3D=3D 0 &&
> -                gpiod_get_value_cansleep(gbl->gpiod) =3D=3D 0)
> +       else if (gpiod_get_value_cansleep(gbl->gpiod) =3D=3D 0)
>                 bl->props.power =3D FB_BLANK_POWERDOWN;
>         else
>                 bl->props.power =3D FB_BLANK_UNBLANK;
> --
> 2.37.1
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
