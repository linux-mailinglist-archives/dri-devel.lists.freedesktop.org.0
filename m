Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3A96BF322
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 21:54:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AB210EFA6;
	Fri, 17 Mar 2023 20:53:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDACD10EFA6
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 20:53:52 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id n125so7104564ybg.7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 13:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679086432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=81k/wsN5LJHSw7IMmKprz7MljTYWXfOO3qNXbhpMYDY=;
 b=GbicmX698aU6P3ndLa71hM7B5bhfNOjyuIQiA9eX8PBOUq1/RzNGBMXbQ0iECrEv5q
 Qs2X2vRlWaonAomu6hJyTwJyst53I6ZQ3AwexcFFxvypToqzgoHD0fkw2SQ2SPgYDhQR
 9YJ8jnhRejBiis4ni0UupkquEUOOR9t1B4kTsa+LnMK4mG+TfWQwbJZmH+Ig8uje91Dh
 9TageZMNT90SRCTnPZvM+X195DHkOewu9tGsi5ElbC+A16u6x8o1p0fGf+3NYX48p5Pm
 3EYTdu4fPQ8e7qhaNJFLLBWfW480I1Nua6D65Pmpkq/ezNlYQ+TljEyo4C433zu+IWft
 T1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679086432;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=81k/wsN5LJHSw7IMmKprz7MljTYWXfOO3qNXbhpMYDY=;
 b=cf+H25KDr12Ux+PtcdpAO1hTEnKPWZ7wqs/aUhkFO+B3sIPVkkFDlWgjRxfBRR4VXT
 uZrvLKD0xs/6AKpfOA+3C6ez4GzvGmj2AeSXNhMpRjyL6ZqvAg6yN3aCqUt8ff44ttDw
 gncePUkCRRuXhx3lcyq6cwtaEDln7ZaJj6aFs+S+SnxsWDU+lDJuM3STSE/MU28n4SAH
 Yv0G0ChZEr+YYuIe74lvYewExDWXmjnWEXzXZzbDeXVF9f/HKuTFywir9XHtCuGVATij
 5BCUP2lEBe/XyeFqYLouEW2KpgQL08fivGpch8hknIkn1K6M6fi8ay4W3NooUo2t0D3u
 Xogg==
X-Gm-Message-State: AO0yUKXagpq3d54PGA1/SFCcpdUa5xRd4rYLqd+m92JCdB0yUGKvxrfv
 heE5oeaQYfjtxIwsHbLkNEM2yKzYDVxrJykjhWkNwA==
X-Google-Smtp-Source: AK7set/xMcJB36hfzj7lWnW/tGG+jyb989JVS6ZTe5X+GsibjG7yhs/EkXgKMrPvyfaL3Ej3pxGpi4IcL7WRbw5L0/o=
X-Received: by 2002:a5b:611:0:b0:b67:f07:d180 with SMTP id
 d17-20020a5b0611000000b00b670f07d180mr357039ybq.5.1679086431900; 
 Fri, 17 Mar 2023 13:53:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230317185230.46189-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20230317185230.46189-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Mar 2023 21:53:40 +0100
Message-ID: <CACRpkdYXTk2pzXEM9MTjt=oT-CbhENABSLeb9dN7ZvEy8oqiag@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] backlight: hx8357: Convert to agnostic GPIO API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Cc: linux-fbdev@vger.kernel.org, Lee Jones <lee@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 17, 2023 at 7:51=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> The of_gpio.h is going to be removed. In preparation of that convert
> the driver to the agnostic API.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks for fixing this Andy!

> -#if !IS_ENABLED(CONFIG_LCD_HX8357)
> +#if IS_ENABLED(CONFIG_LCD_HX8357)
>                 /*
>                  * Himax LCD controllers used incorrectly named
>                  * "gpios-reset" property and also specified wrong
> @@ -452,7 +452,7 @@ static struct gpio_desc *of_find_gpio_rename(struct d=
evice_node *np,
>                  */
>                 const char *compatible;
>         } gpios[] =3D {
> -#if !IS_ENABLED(CONFIG_LCD_HX8357)
> +#if IS_ENABLED(CONFIG_LCD_HX8357)
>                 /* Himax LCD controllers used "gpios-reset" */
>                 { "reset",      "gpios-reset",  "himax,hx8357" },
>                 { "reset",      "gpios-reset",  "himax,hx8369" },

Eh what happened here .. it's even intuitively wrong.
I would add
Fixes: fbbbcd177a27 ("gpiolib: of: add quirk for locating reset lines
with legacy bindings")

It wasn't used until now it seems so not a regression and no
need for a separate patch.

Other than that it looks correct.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
