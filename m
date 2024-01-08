Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436808278F5
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 21:12:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D55410E02A;
	Mon,  8 Jan 2024 20:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BBD10E02A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 20:12:49 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id
 3f1490d57ef6-dbed430ef5eso1255713276.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 12:12:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704744769; x=1705349569;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jO+k5lvbngjS92ouyx3R3uEoQtzTI+waqD9Cqv6JLzo=;
 b=jeACAZnh/uPjuG2aq5QUdLtVcXEpbESDWOKw9aI25GmcnGgO3Ncr4UCbk/s0Pnp+Xf
 AqPavWvrYiy84CEafV5G1u7AhfaIxgIZAq4BdnPtQ20hGQ7MPtIhHpOTuLoLfhuCkVYf
 Xzx38lPrsQ0oI6O2+WGegeLt/ar+t9rPpNC20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704744769; x=1705349569;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jO+k5lvbngjS92ouyx3R3uEoQtzTI+waqD9Cqv6JLzo=;
 b=rDu+kU/zmXrRdn5o7nretdBGBfU9ovxJL1xCX/KY1LznD47FgXZp6b9X5afEw8UCe6
 UlvPMFuc+1YGDY7TI7qxFiFRNDsoa/9vf766ubIs9UFKfrOrkvgibtNGn0c3+OcMH7nJ
 yeG6pNz0k/5Yi3VrrBILGrgUUpsJn0UOT2xApNRjXD76o56QYdnjwzK/9g3/CvvtS4MA
 xX+uJJfbpecmAEpD2LcHrLayPTH4DphP4WEF1IhoBy5GsoiF8aqIxieFiI6SdLY8GPCQ
 kKsU57as44T9Oo5NUIbBgc+SVmUZUDD0ZSSTRnQs62dJ58PC/+1fttl3S5UE3Hxrhavp
 L26w==
X-Gm-Message-State: AOJu0YxtKvP2yc7x/poGfIhYbFm1P6I8f0Jypbiey94rqGpPHlgyR/9p
 WMw485NZrR/bM+f2Zdyq3ZV5JLOKHJ9dk5+uDxif0dzgn3T8Mw==
X-Google-Smtp-Source: AGHT+IFUUedhilU//0xZ1+dgQGu1fYRJoi2KV/ctlDlSR1L6Xlf0TFmrxtXePndYD4C7J5WXLQ80bM9Ha0k8nMgP2ZU=
X-Received: by 2002:a25:8441:0:b0:db7:dad0:76ad with SMTP id
 r1-20020a258441000000b00db7dad076admr1590636ybm.73.1704744768971; Mon, 08 Jan
 2024 12:12:48 -0800 (PST)
MIME-Version: 1.0
References: <20240104084206.721824-1-dario.binacchi@amarulasolutions.com>
 <20240104084206.721824-9-dario.binacchi@amarulasolutions.com>
 <CACRpkda+=Zq+v-505O3pHazKzukSifBnNx_CPKbKd2JH-KYpYg@mail.gmail.com>
 <CABGWkvoNuJNmxhrOE6csE2mGwF50ou-jx-kpmH-oQ2zBgzLrSg@mail.gmail.com>
 <CACRpkdZJF-WE8oTi3RXpX_+W+D6bV_o2Nt1ikRbErR6pBc2OJg@mail.gmail.com>
In-Reply-To: <CACRpkdZJF-WE8oTi3RXpX_+W+D6bV_o2Nt1ikRbErR6pBc2OJg@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 8 Jan 2024 21:12:37 +0100
Message-ID: <CABGWkvoHuzTPNhh54VihNJ4PtSTF9sRLiup6PRNqG5uoHfJc_A@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] drm/panel: nt35510: support FRIDA
 FRD400B25025-A-CTK
To: Linus Walleij <linus.walleij@linaro.org>
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

On Sun, Jan 7, 2024 at 9:02=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Sat, Jan 6, 2024 at 12:07=E2=80=AFPM Dario Binacchi
> <dario.binacchi@amarulasolutions.com> wrote:
>
> > After submitting v4, I tested the driver under different conditions,
> > i. e. without enabling display support in
> > U-Boot (I also implemented a version for U-Boot, which I will send
> > only after this series is merged into
> > the Linux kernel). In that condition I encountered an issue with the re=
set pin.
> >
> > The minimal fix, would be this:
> >
> > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> > b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> > index c85dd0d0829d..89ba99763468 100644
> > --- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> > +++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
> > @@ -1133,7 +1133,7 @@ static int nt35510_probe(struct mipi_dsi_device *=
dsi)
> >         if (ret)
> >                 return ret;
> >
> > -       nt->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_=
ASIS);
> > +       nt->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_=
OUT_HIGH);
>
>
> This is fine, because we later on toggle reset in nt35510_power_on(),
> this just asserts the reset signal already in probe.
>
> I don't see why this would make a difference though?
>
> Is it to make the reset delete artifacts from the screen?
>
> Just explain it in the commit message.
>
> It is a bit confusing when I look at your DTS patch:
>
> https://lore.kernel.org/linux-arm-kernel/20240104084206.721824-7-dario.bi=
nacchi@amarulasolutions.com/
>
> this doesn't even contain a reset GPIO, so nothing will happen
> at all?
+++ b/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ */
+
+#include "stm32f769-disco.dts"
+

The GPIO is contained in the stm32f769-disco.dts:

panel0: panel-dsi@0 {
        compatible =3D "orisetech,otm8009a";
        reg =3D <0>; /* dsi virtual channel (0..3) */
        reset-gpios =3D <&gpioj 15 GPIO_ACTIVE_LOW>;
        power-supply =3D <&vcc_3v3>;
        backlight =3D <&panel_backlight>;
       status =3D "okay";
...
};

>
> > I then tried modifying the device tree instead of the nt35510 driver.
> > In the end, I arrived
> > at this patch that leaves me with some doubts, especially regarding
> > the strict option.
> >
> > diff --git a/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-=
reva09.dts
> > b/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-m>
> > index 014cac192375..32ed420a6cbf 100644
> > --- a/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.=
dts
> > +++ b/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.=
dts
> > @@ -13,6 +13,17 @@ &panel0 {
> >         compatible =3D "frida,frd400b25025", "novatek,nt35510";
> >         vddi-supply =3D <&vcc_3v3>;
> >         vdd-supply =3D <&vcc_3v3>;
> > +       pinctrl-0 =3D <&panel_reset>;
> > +       pinctrl-names =3D "default";
> >         /delete-property/backlight;
> >         /delete-property/power-supply;
> >  };
> > +
> > +&pinctrl {
> > +       panel_reset: panel-reset {
> > +               pins1 {
> > +                       pinmux =3D <STM32_PINMUX('J', 15, GPIO)>;
> > +                       output-high;
>
> But this achieves the *opposite* of what you do in the
> other patch. This sets the reset line de-asserted since it is
> active low.
>
> Did you add the reset line to your device tree and forgot to
> set it as GPIO_ACTIVE_LOW perhaps?

panel0: panel-dsi@0 {
        compatible =3D "orisetech,otm8009a";
        reg =3D <0>; /* dsi virtual channel (0..3) */
        reset-gpios =3D <&gpioj 15 GPIO_ACTIVE_LOW>;

>
> > --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> > +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> > @@ -895,7 +895,6 @@ static const struct pinmux_ops stm32_pmx_ops =3D {
> >         .set_mux                =3D stm32_pmx_set_mux,
> >         .gpio_set_direction     =3D stm32_pmx_gpio_set_direction,
> >         .request                =3D stm32_pmx_request,
> > -       .strict                 =3D true,
>
> To be honest this is what I use a lot of the time, with non-strict
> pin control you can set up default GPIO values using the pin control
> device tree, and it's really simple and easy to read like that since e.g.
> in this case you set it from the panel device node which is what
> is also consuming the GPIO, so very logical. So I
> would certainly remove this .strict setting, but maybe Alexandre
> et al have a strong opinion about it.

I will send a separate RFC PATCH.

Thanks and regards,
Dario Binacchi

>
> > Another option to fix my use case without introducing regressions
> > could be to add a
> > new property to the device tree that suggests whether to call
> > devm_gpiod_get_optional()
> > with the GPIOD_ASIS or GPIOD_OUT_HIGH parameter.
> >
> > What is your opinion?
>
> It's fine either way, but just use GPIOD_OUT_HIGH and I can test
> it on my system as well, I think it's fine.
>
> Yours,
> Linus Walleij



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
