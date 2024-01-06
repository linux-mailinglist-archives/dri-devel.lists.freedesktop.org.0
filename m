Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF62E825F50
	for <lists+dri-devel@lfdr.de>; Sat,  6 Jan 2024 12:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2457D10E05B;
	Sat,  6 Jan 2024 11:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FB410E05B
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jan 2024 11:07:12 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-dbd715ed145so172605276.1
 for <dri-devel@lists.freedesktop.org>; Sat, 06 Jan 2024 03:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1704539231; x=1705144031;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R8xsCw2olSbVegp5OaUais3sktHtUAk2PIqMv7T4kYk=;
 b=cFM8FB+9diJ/U2C1n9orj16Sbhboba7yJ+N6u6i9LrSwRFqB+5d2uz7SZzYyD/sonC
 F+bvfz1vOxwl0CTX2XZmrdfqFxbXA3gNJEk7S5NNt+IaVs9sSEBEqChlWIGckBDz6768
 CZAhxSqgNBcn1yxyxkKT0GzSmSVoYQzoxL92E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704539231; x=1705144031;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R8xsCw2olSbVegp5OaUais3sktHtUAk2PIqMv7T4kYk=;
 b=vHMJv3t9ByUXxoKHTCGnya6XcEutMWcwnEcH5s1A5FuBoCqBVNoONC6Uxn8fg69QlW
 tNPbYSFrzmXkOQXAEZ4m4jqRTZDm2CngPFFi6qRtzS3BP+dNtWX1B+7Mco3rj/6cA9Yg
 jeIDKHk8bTvwADFZf8V4C6fiygV/LYCcUpUX/6QxYX06X0VIZBnZZd49Q3tZAdXcIslW
 lBgIT4wocQtrgO67VB/aYdCzHNA8ISNyKlMVoom+JiHhUIAgWFOvbZ/d4ewfSgzarCqw
 Ij4m8R6fyCkXtSfoGEND5r5sx/Mt2pyb41E/1M6f99Zp7Un7MLsckKfl3uiRpQDq60Ac
 eCYw==
X-Gm-Message-State: AOJu0Yxwhvyi0/6dV2egj5ETVKKgKTHXAKDYBKfsL8xbW4Msd+CUwyk8
 yzUrU616ivcDD1uLc5JhozYX//FCrbmNVe0xgUFpt2Xvhp9A0A==
X-Google-Smtp-Source: AGHT+IGi0GE3tCB884LTGzWxfRKn1Ioki/1f2HTD7URSrt/lafAnz5cGneg6VG6mOJODrgKHSI2Lnf0ucxcmmTh9SK8=
X-Received: by 2002:a5b:38b:0:b0:dbe:3152:56b2 with SMTP id
 k11-20020a5b038b000000b00dbe315256b2mr213397ybp.86.1704539231630; Sat, 06 Jan
 2024 03:07:11 -0800 (PST)
MIME-Version: 1.0
References: <20240104084206.721824-1-dario.binacchi@amarulasolutions.com>
 <20240104084206.721824-9-dario.binacchi@amarulasolutions.com>
 <CACRpkda+=Zq+v-505O3pHazKzukSifBnNx_CPKbKd2JH-KYpYg@mail.gmail.com>
In-Reply-To: <CACRpkda+=Zq+v-505O3pHazKzukSifBnNx_CPKbKd2JH-KYpYg@mail.gmail.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Sat, 6 Jan 2024 12:07:00 +0100
Message-ID: <CABGWkvoNuJNmxhrOE6csE2mGwF50ou-jx-kpmH-oQ2zBgzLrSg@mail.gmail.com>
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

On Fri, Jan 5, 2024 at 8:09=E2=80=AFPM Linus Walleij <linus.walleij@linaro.=
org> wrote:
>
> On Thu, Jan 4, 2024 at 9:42=E2=80=AFAM Dario Binacchi
> <dario.binacchi@amarulasolutions.com> wrote:
>
> > The initialization commands are taken from the STMicroelectronics drive=
r
> > found at [1].
> > To ensure backward compatibility, flags have been added to enable gamma
> > correction setting and display control. In other cases, registers have
> > been set to their default values according to the specifications found
> > in the datasheet.
> >
> > [1] https://github.com/STMicroelectronics/STM32CubeF7/blob/master/Drive=
rs/BSP/Components/nt35510/
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > (no changes since v2)
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> (also tested to not regress my hardware)

After submitting v4, I tested the driver under different conditions,
i. e. without enabling display support in
U-Boot (I also implemented a version for U-Boot, which I will send
only after this series is merged into
the Linux kernel). In that condition I encountered an issue with the reset =
pin.

The minimal fix, would be this:

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index c85dd0d0829d..89ba99763468 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -1133,7 +1133,7 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
        if (ret)
                return ret;

-       nt->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_ASIS=
);
+       nt->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_=
HIGH);
        if (IS_ERR(nt->reset_gpio)) {
                dev_err(dev, "error getting RESET GPIO\n");
                return PTR_ERR(nt->reset_gpio);

With the doubt that this might cause a regression in your use case.

I then tried modifying the device tree instead of the nt35510 driver.
In the end, I arrived
at this patch that leaves me with some doubts, especially regarding
the strict option.

diff --git a/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva=
09.dts
b/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-m>
index 014cac192375..32ed420a6cbf 100644
--- a/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts
+++ b/arch/arm/boot/dts/st/stm32f769-disco-mb1225-revb03-mb1166-reva09.dts
@@ -13,6 +13,17 @@ &panel0 {
        compatible =3D "frida,frd400b25025", "novatek,nt35510";
        vddi-supply =3D <&vcc_3v3>;
        vdd-supply =3D <&vcc_3v3>;
+       pinctrl-0 =3D <&panel_reset>;
+       pinctrl-names =3D "default";
        /delete-property/backlight;
        /delete-property/power-supply;
 };
+
+&pinctrl {
+       panel_reset: panel-reset {
+               pins1 {
+                       pinmux =3D <STM32_PINMUX('J', 15, GPIO)>;
+                       output-high;
+               };
+       };
+};

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c
b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 346a31f31bba..6f055f7f96a2 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -895,7 +895,6 @@ static const struct pinmux_ops stm32_pmx_ops =3D {
        .set_mux                =3D stm32_pmx_set_mux,
        .gpio_set_direction     =3D stm32_pmx_gpio_set_direction,
        .request                =3D stm32_pmx_request,
-       .strict                 =3D true,
 };

Another option to fix my use case without introducing regressions
could be to add a
new property to the device tree that suggests whether to call
devm_gpiod_get_optional()
with the GPIOD_ASIS or GPIOD_OUT_HIGH parameter.

What is your opinion?

Thanks and regards,
Dario Binacchi

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
