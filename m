Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07F08265DE
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jan 2024 21:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532D510E008;
	Sun,  7 Jan 2024 20:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AFA710E008
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jan 2024 20:02:01 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id
 5614622812f47-3bbc755167fso1382082b6e.0
 for <dri-devel@lists.freedesktop.org>; Sun, 07 Jan 2024 12:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704657721; x=1705262521; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BsQYY7qqo+FrBHe/RokTU8lf3E6e+C6A/j4bBRjxl58=;
 b=nyNYj7m6DN3QgSkp8T/OwnlCyNIOMw3wALab0dGC9C7PYeU8Z52AYsH+pzqGNmS8Tv
 WOYpZz6X3V3jhxvuXJYtrwG0KiehbSHcVdZZ/znGC5UitEVj4Hg/CkWtBabXrm2LR9EV
 CtupOomKq+o2GBm7JJ9QVYjSFSbkCU8pxJXtu4jNzxAU1yUqhsN9lqL10SLIBqiYup6J
 sADv3TF6KNP/1DJw1zQiIvPtirFkc5KGA7HxPyy+rhf0J3ezB39O5mpnHKgkGddmjOXq
 oE58XtCHKdUWFJAXYhnueCsg+jLhtd0sRMoksSJNXjOZoMvOwXXq71bcAwRIklBTrOYS
 NmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704657721; x=1705262521;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BsQYY7qqo+FrBHe/RokTU8lf3E6e+C6A/j4bBRjxl58=;
 b=aeBmDmvRnRis0CJYCV/djUOCHB0kXUOxzZuCVrNK6eRBCR1DdRSxVD5kGLu37eta2X
 YMXJ4xGFUJYSwBixU8pXUgCXsVnTFPLxl5IishsbdiKNHGJKGeKdEBbsQ14kEy30xdvs
 OHe25KvzhGB8hg9S1dLid3qNmTildZuhdFhQnkVg9IpxEb6kiHxXwcHWyHZrCmlh4Bd3
 byJJc+Avad1syVwzP0wA9xaiHUUxGJpOyolm5+eBLbhORRfgze+waU8mTzPUkkburVUb
 ydKraww28uusTDJZNPm3NfKarewYXvk9lsjGTxGC5/4DLwXeq3ZXIvAElbuNfsqbhPIq
 QVOQ==
X-Gm-Message-State: AOJu0Yw37PbasrcRrv8o28nQeFO5GN8+ChORiGmiz9q74ndPiZaryw0l
 7i5MnkpAYFpvnxQvU1m5U+eyuV5di6bWAbIbPHuTSj0eigjMIg==
X-Google-Smtp-Source: AGHT+IGywVTBJjpXydC+fLvcp4XUEIt9/GT2WV7oS29NQUNx0cTWCHookn5mwrDpBsjcRympVKZCp3IcNmPj0BDGxa4=
X-Received: by 2002:a54:4088:0:b0:3bc:2a4f:7722 with SMTP id
 i8-20020a544088000000b003bc2a4f7722mr3057800oii.90.1704657720778; Sun, 07 Jan
 2024 12:02:00 -0800 (PST)
MIME-Version: 1.0
References: <20240104084206.721824-1-dario.binacchi@amarulasolutions.com>
 <20240104084206.721824-9-dario.binacchi@amarulasolutions.com>
 <CACRpkda+=Zq+v-505O3pHazKzukSifBnNx_CPKbKd2JH-KYpYg@mail.gmail.com>
 <CABGWkvoNuJNmxhrOE6csE2mGwF50ou-jx-kpmH-oQ2zBgzLrSg@mail.gmail.com>
In-Reply-To: <CABGWkvoNuJNmxhrOE6csE2mGwF50ou-jx-kpmH-oQ2zBgzLrSg@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 7 Jan 2024 21:01:49 +0100
Message-ID: <CACRpkdZJF-WE8oTi3RXpX_+W+D6bV_o2Nt1ikRbErR6pBc2OJg@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] drm/panel: nt35510: support FRIDA
 FRD400B25025-A-CTK
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 linux-amarula@amarulasolutions.com, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 6, 2024 at 12:07=E2=80=AFPM Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:

> After submitting v4, I tested the driver under different conditions,
> i. e. without enabling display support in
> U-Boot (I also implemented a version for U-Boot, which I will send
> only after this series is merged into
> the Linux kernel). In that condition I encountered an issue with the rese=
t pin.
>
> The minimal fix, would be this:
>
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> index c85dd0d0829d..89ba99763468 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> @@ -1133,7 +1133,7 @@ static int nt35510_probe(struct mipi_dsi_device *ds=
i)
>         if (ret)
>                 return ret;
>
> -       nt->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_AS=
IS);
> +       nt->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OU=
T_HIGH);


This is fine, because we later on toggle reset in nt35510_power_on(),
this just asserts the reset signal already in probe.

I don't see why this would make a difference though?

Is it to make the reset delete artifacts from the screen?

Just explain it in the commit message.

It is a bit confusing when I look at your DTS patch:

https://lore.kernel.org/linux-arm-kernel/20240104084206.721824-7-dario.bina=
cchi@amarulasolutions.com/

this doesn't even contain a reset GPIO, so nothing will happen
at all?

> I then tried modifying the device tree instead of the nt35510 driver.
> In the end, I arrived
> at this patch that leaves me with some doubts, especially regarding
> the strict option.
>
> diff --git a/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-re=
va09.dts
> b/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-m>
> index 014cac192375..32ed420a6cbf 100644
> --- a/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dt=
s
> +++ b/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dt=
s
> @@ -13,6 +13,17 @@ &panel0 {
>         compatible =3D "frida,frd400b25025", "novatek,nt35510";
>         vddi-supply =3D <&vcc_3v3>;
>         vdd-supply =3D <&vcc_3v3>;
> +       pinctrl-0 =3D <&panel_reset>;
> +       pinctrl-names =3D "default";
>         /delete-property/backlight;
>         /delete-property/power-supply;
>  };
> +
> +&pinctrl {
> +       panel_reset: panel-reset {
> +               pins1 {
> +                       pinmux =3D <STM32_PINMUX('J', 15, GPIO)>;
> +                       output-high;

But this achieves the *opposite* of what you do in the
other patch. This sets the reset line de-asserted since it is
active low.

Did you add the reset line to your device tree and forgot to
set it as GPIO_ACTIVE_LOW perhaps?

> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -895,7 +895,6 @@ static const struct pinmux_ops stm32_pmx_ops =3D {
>         .set_mux                =3D stm32_pmx_set_mux,
>         .gpio_set_direction     =3D stm32_pmx_gpio_set_direction,
>         .request                =3D stm32_pmx_request,
> -       .strict                 =3D true,

To be honest this is what I use a lot of the time, with non-strict
pin control you can set up default GPIO values using the pin control
device tree, and it's really simple and easy to read like that since e.g.
in this case you set it from the panel device node which is what
is also consuming the GPIO, so very logical. So I
would certainly remove this .strict setting, but maybe Alexandre
et al have a strong opinion about it.

> Another option to fix my use case without introducing regressions
> could be to add a
> new property to the device tree that suggests whether to call
> devm_gpiod_get_optional()
> with the GPIOD_ASIS or GPIOD_OUT_HIGH parameter.
>
> What is your opinion?

It's fine either way, but just use GPIOD_OUT_HIGH and I can test
it on my system as well, I think it's fine.

Yours,
Linus Walleij
