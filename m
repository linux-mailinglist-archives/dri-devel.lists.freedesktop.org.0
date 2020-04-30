Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C34EC1C0EB0
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3CFD6EBAC;
	Fri,  1 May 2020 07:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0CF6E20D
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 10:26:33 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id b20so490746lff.2
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 03:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tgH4J3JpJGREMfHAs1RY48fBga141L7RCWKTHyxjdRs=;
 b=ppj9lYquWFyySTcMbvtRPTWRSRV1b2zfr0m7+ArSkBd9ilx3KeRvdPGJ4rQTOkwzor
 kJ0SxsAyOHjrkZJ/XoFpMfEEiAwZDI6IsoUZijkTkM6fTY9Z258V9ACkEIt7nODvgZLj
 Lq7WB5SeAmy64CN7EVEr/DI1qwTfQIIZLij7zbVRB+pamx1dtyUP7It4E7Lsve5FekeC
 nQm8TF5T9uEf8W6iry5kYdaKDlOaHDaFL0U1zAc0GYR58EqJzKJs+8S4fYEXge9ooFB4
 TZiIeMMaztbho5SN8UHFmrSvDKGPb4Y3jLwhOPzCTCjw0TFA9gS/NDRxmFvmaLWOzCDg
 8krg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tgH4J3JpJGREMfHAs1RY48fBga141L7RCWKTHyxjdRs=;
 b=pbrlp7qmYDHhnv9UhXgb58ZVj9MST7M+IuF/rM0h+wssa76zSm87GJuYIvxjjUO86g
 XsrBLL1V0YZgxki7fv7SYVMT4Y2As5xOqU+UBYNXyo8ezzEb4PfdjscHtbvCW/YGnItX
 lEGTWXgBr+z4Vi2U/jOaes6f29N7phYg1Po8xMfxfERMTnK1bnsgl1hIy+hoJvAQ8grQ
 /obp+4Id/4aphYOCN8bxf/WRZds3j+2cMfrE1lHv6A9hfAG6nyLLQf92HBfu7iDhVViI
 S4cpZHwClC9NvoM/TJRtfn7HgKDQ8UxhNkuL1lAyEPjndaAv0D5WYpcry1/dRcPV9MO/
 MPAA==
X-Gm-Message-State: AGi0PuacBCFzKsM5spNG9YZCGXD0UpGehnz7nOlnDsNW9xzNW5i7d9uZ
 p3zCflz0T6Z/RtN6Iq2Yt9Ea2F7i1v4yQvMWRpk=
X-Google-Smtp-Source: APiQypLsEkFcn5jpSW4I0GgTc7HNeE3SzjJf2r8j3MZGoS3C8DjdaStW8VaVNvZ9KjwQcbGcEFVeljPYNrIX+zRkJqU=
X-Received: by 2002:a19:e20b:: with SMTP id z11mr1740057lfg.156.1588242391662; 
 Thu, 30 Apr 2020 03:26:31 -0700 (PDT)
MIME-Version: 1.0
References: <1588239802-11442-1-git-send-email-dillon.minfei@gmail.com>
 <33f928e7-3fde-99a2-b84d-d74a2d3f1186@st.com>
In-Reply-To: <33f928e7-3fde-99a2-b84d-d74a2d3f1186@st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 30 Apr 2020 18:26:20 +0800
Message-ID: <CAL9mu0+AqO69+rEcH=HVWRhDLbqDO52-Cjxt-PAZmg6=7QtpvQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] add dts node for drm panel driver ili9341 add dts
 i2c3 for stmpe touch add dts spi5 for gyro & ili9341
To: Alexandre Torgue <alexandre.torgue@st.com>
X-Mailman-Approved-At: Fri, 01 May 2020 07:22:25 +0000
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
Cc: devicetree@vger.kernel.org, mcoquelin.stm32@gmail.com, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, thierry.reding@gmail.com, sam@ravnborg.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2093487627=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============2093487627==
Content-Type: multipart/alternative; boundary="0000000000009284f505a47f7fed"

--0000000000009284f505a47f7fed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

Alexandre Torgue <alexandre.torgue@st.com> =E4=BA=8E2020=E5=B9=B44=E6=9C=88=
30=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=885:57=E5=86=99=E9=81=93=EF=
=BC=9A

> Hi
>
> On 4/30/20 11:43 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
>
> Commit title should be ARM: dts: stm32: bla bla on stm32f429 and please
> a commit message.
>
>
*okay, thanks for your quicky response, this is my first kernel pull
request, i will resubmit all patchsets following the history submits style
who was did.*


> > ---
> >   .../bindings/display/panel/ilitek,ili9341.txt      | 42 +++++++++++
> >   arch/arm/boot/dts/stm32f4-pinctrl.dtsi             | 79
> +++++++++++++++++++
> >   arch/arm/boot/dts/stm32f429-disco.dts              | 88
> ++++++++++++++++++++++
> >   arch/arm/boot/dts/stm32f429.dtsi                   | 12 +++
> >   4 files changed, 221 insertions(+)
> >   create mode 100644
> Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
> >
> > diff --git
> a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
> b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
>
> This binding description should be in a separate patch and you have to
> write in YAML format.
>
> *okay, will do it later. *

>
> > new file mode 100644
> > index 0000000..f5a4e55
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.tx=
t
> > @@ -0,0 +1,42 @@
> > +Ilitek ILI9341 TFT panel driver with SPI control bus
> > +
> > +This is a driver for 240x320 TFT panels, accepting a rgb input
> > +streams that get adapted and scaled to the panel.
> > +
> > +Required properties:
> > +  - compatible: "stm32f429-disco,ltdc-panel", "ilitek,ili9341"
> > +    (full system-specific compatible is always required to look up
> configuration)
> > +  - reg: address of the panel on the SPI bus
> > +
> > +Optional properties:
> > +  - reset-gpios: a GPIO spec for the reset pin, see gpio/gpio.txt
> > +  - dc-gpios: a GPIO spec for the dc pin, see gpio/gpio.txt
> > +
> > +  The following optional properties only apply to RGB input mode:
> > +
> > +  - pixelclk-active: see display/panel/display-timing.txt
> > +  - de-active: see display/panel/display-timing.txt
> > +  - hsync-active: see display/panel/display-timing.txt
> > +  - vsync-active: see display/panel/display-timing.txt
> > +
> > +The panel must obey the rules for a SPI slave device as specified in
> > +spi/spi-bus.txt
> > +
> > +The device node can contain one 'port' child node with one child
> > +'endpoint' node, according to the bindings defined in
> > +media/video-interfaces.txt. This node should describe panel's video bu=
s.
> > +
> > +Example:
> > +
> > +panel: display@0 {
> > +     compatible =3D "stm32f429-disco,ltdc-panel", "ilitek,ili9341";
> > +     reg =3D <0>;
> > +     spi-3wire;
> > +     spi-max-frequency =3D <10000000>;
> > +     dc-gpios =3D <&gpiod 13 0>;
> > +     port {
> > +             panel_in: endpoint {
> > +                     remote-endpoint =3D <&display_out>;
> > +             };
> > +     };
> > +};
> > diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> > index 392fa14..45b68f4 100644
> > --- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> > +++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> > @@ -316,6 +316,85 @@
> >                               };
> >                       };
> >
> > +                     ltdc_pins_f429_disco: ltdc-1 {
> > +                             pins {
> > +                                     pinmux =3D <STM32_PINMUX('C', 6,
> AF14)>,
> > +                                             /* LCD_HSYNC */
> > +                                              <STM32_PINMUX('A', 4,
> AF14)>,
> > +                                              /* LCD_VSYNC */
> > +                                              <STM32_PINMUX('G', 7,
> AF14)>,
> > +                                              /* LCD_CLK */
> > +                                              <STM32_PINMUX('C', 10,
> AF14)>,
> > +                                              /* LCD_R2 */
> > +                                              <STM32_PINMUX('B', 0,
> AF9)>,
> > +                                              /* LCD_R3 */
> > +                                              <STM32_PINMUX('A', 11,
> AF14)>,
> > +                                              /* LCD_R4 */
> > +                                              <STM32_PINMUX('A', 12,
> AF14)>,
> > +                                              /* LCD_R5 */
> > +                                              <STM32_PINMUX('B', 1,
> AF9)>,
> > +                                              /* LCD_R6*/
> > +                                              <STM32_PINMUX('G', 6,
> AF14)>,
> > +                                              /* LCD_R7 */
> > +                                              <STM32_PINMUX('A', 6,
> AF14)>,
> > +                                              /* LCD_G2 */
> > +                                              <STM32_PINMUX('G', 10,
> AF9)>,
> > +                                              /* LCD_G3 */
> > +                                              <STM32_PINMUX('B', 10,
> AF14)>,
> > +                                              /* LCD_G4 */
> > +                                              <STM32_PINMUX('D', 6,
> AF14)>,
> > +                                              /* LCD_B2 */
> > +                                              <STM32_PINMUX('G', 11,
> AF14)>,
> > +                                              /* LCD_B3*/
> > +                                              <STM32_PINMUX('B', 11,
> AF14)>,
> > +                                              /* LCD_G5 */
> > +                                              <STM32_PINMUX('C', 7,
> AF14)>,
> > +                                              /* LCD_G6 */
> > +                                              <STM32_PINMUX('D', 3,
> AF14)>,
> > +                                              /* LCD_G7 */
> > +                                              <STM32_PINMUX('G', 12,
> AF9)>,
> > +                                              /* LCD_B4 */
> > +                                              <STM32_PINMUX('A', 3,
> AF14)>,
> > +                                              /* LCD_B5 */
> > +                                              <STM32_PINMUX('B', 8,
> AF14)>,
> > +                                              /* LCD_B6 */
> > +                                              <STM32_PINMUX('B', 9,
> AF14)>,
> > +                                              /* LCD_B7 */
> > +                                              <STM32_PINMUX('F', 10,
> AF14)>;
> > +                                              /* LCD_DE */
> > +                                     slew-rate =3D <2>;
> > +                             };
> > +                     };
> > +
> > +                     i2c3_pins: i2c3-0 {
> > +                             pins {
> > +                                     pinmux =3D <STM32_PINMUX('C', 9,
> AF4)>,
> > +                                             /* I2C3_SDA */
> > +                                              <STM32_PINMUX('A', 8,
> AF4)>;
> > +                                             /* I2C3_SCL */
> > +                                     bias-disable;
> > +                                     drive-open-drain;
> > +                                     slew-rate =3D <3>;
> > +                             };
> > +                     };
> > +
> > +                     spi5_pins: spi5-0 {
> > +                             pins1 {
> > +                                     pinmux =3D <STM32_PINMUX('F', 7,
> AF5)>,
> > +                                             /* SPI5_CLK */
> > +                                              <STM32_PINMUX('F', 9,
> AF5)>;
> > +                                             /* SPI5_MOSI */
> > +                                     bias-disable;
> > +                                     drive-push-pull;
> > +                                     slew-rate =3D <0>;
> > +                             };
> > +                             pins2 {
> > +                                     pinmux =3D <STM32_PINMUX('F', 8,
> AF5)>;
> > +                                             /* SPI5_MISO */
> > +                                     bias-disable;
> > +                             };
> > +                     };
> > +
> >                       dcmi_pins: dcmi-0 {
> >                               pins {
> >                                       pinmux =3D <STM32_PINMUX('A', 4,
> AF13)>, /* DCMI_HSYNC */
> > diff --git a/arch/arm/boot/dts/stm32f429-disco.dts
> b/arch/arm/boot/dts/stm32f429-disco.dts
> > index 30c0f67..55eed05 100644
> > --- a/arch/arm/boot/dts/stm32f429-disco.dts
> > +++ b/arch/arm/boot/dts/stm32f429-disco.dts
> > @@ -49,6 +49,8 @@
> >   #include "stm32f429.dtsi"
> >   #include "stm32f429-pinctrl.dtsi"
> >   #include <dt-bindings/input/input.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/gpio/gpio.h>
> >
> >   / {
> >       model =3D "STMicroelectronics STM32F429i-DISCO board";
> > @@ -98,6 +100,14 @@
> >               regulator-name =3D "vcc5_host1";
> >               regulator-always-on;
> >       };
> > +
> > +     reg_3p3v: regulator-3p3v {
>
> 3p3 ?


 *yes, the mfd stmpe driver need vcc & vio regulator, st sensor core driver
need vddio & vdd*

> +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "3P3V";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-always-on;
> > +     };
> >   };
> >
> >   &clk_hse {
> > @@ -127,3 +137,81 @@
> >       pinctrl-names =3D "default";
> >       status =3D "okay";
> >   };
> > +
> > +&ltdc {
> > +     status =3D "okay";
> > +     pinctrl-0 =3D <&ltdc_pins_f429_disco>;
> > +     pinctrl-names =3D "default";
> > +
> > +     port {
> > +             ltdc_out_rgb: endpoint {
> > +                     remote-endpoint =3D <&panel_in_rgb>;
> > +             };
> > +     };
> > +};
> > +
> > +&spi5 {
> > +     status =3D "okay";
> > +     pinctrl-0 =3D <&spi5_pins>;
> > +     pinctrl-names =3D "default";
> > +     #address-cells =3D <1>;
> > +     #size-cells =3D <0>;
> > +     cs-gpios =3D <&gpioc 1 GPIO_ACTIVE_LOW>,<&gpioc 2 GPIO_ACTIVE_LOW=
>;
> > +     dmas =3D <&dma2 3 2 0x400 0x0>,
> > +            <&dma2 4 2 0x400 0x0>;
> > +     dma-names =3D "rx", "tx";
> > +     l3gd20: l3gd20@0 {
> > +             compatible =3D "st,l3gd20-gyro";
> > +             spi-max-frequency =3D <10000000>;
> > +             st,drdy-int-pin =3D <2>;
> > +             interrupt-parent =3D <&gpioa>;
> > +             interrupts =3D <1 IRQ_TYPE_EDGE_RISING>,
> > +                             <2 IRQ_TYPE_EDGE_RISING>;
> > +             reg =3D <0>;
> > +             vddio =3D <&reg_3p3v>;
> > +             vdd =3D <&reg_3p3v>;
> > +             status =3D "okay";
> > +     };
> > +     display: display@1{
> > +             /* Connect panel-ilitek-9341 to ltdc */
> > +             compatible =3D "stm32f429-disco,ltdc-panel",
> "ilitek,ili9341";
> > +             reg =3D <1>;
> > +             spi-3wire;
> > +             spi-max-frequency =3D <10000000>;
> > +             dc-gpios =3D <&gpiod 13 0>;
> > +             port {
> > +                     panel_in_rgb: endpoint {
> > +                     remote-endpoint =3D <&ltdc_out_rgb>;
> > +                     };
> > +             };
> > +     };
> > +};
> > +
> > +&i2c3 {
>
> Nodes are have to be ordered

 *sorry, a little confused, i2c-3 is used by stmpe811 driver*


>
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&i2c3_pins>;
> > +     status =3D "okay";
> > +
> > +     touch: stmpe811@41 {
> > +             compatible =3D "st,stmpe811";
> > +             reg =3D <0x41>;
> > +             interrupts =3D <15 IRQ_TYPE_EDGE_FALLING>;
> > +             interrupt-parent =3D <&gpioa>;
> > +             vio =3D <&reg_3p3v>;
> > +             vcc =3D <&reg_3p3v>;
> > +             status =3D "okay";
> > +
> > +             stmpe_touchscreen {
> > +                     compatible =3D "st,stmpe-ts";
> > +                     st,sample-time =3D <4>;
> > +                     st,mod-12b =3D <1>;
> > +                     st,ref-sel =3D <0>;
> > +                     st,adc-freq =3D <1>;
> > +                     st,ave-ctrl =3D <1>;
> > +                     st,touch-det-delay =3D <2>;
> > +                     st,settling =3D <2>;
> > +                     st,fraction-z =3D <7>;
> > +                     st,i-drive =3D <1>;
> > +             };
> > +     };
> > +};
> > diff --git a/arch/arm/boot/dts/stm32f429.dtsi
> b/arch/arm/boot/dts/stm32f429.dtsi
> > index d777069..257b843 100644
> > --- a/arch/arm/boot/dts/stm32f429.dtsi
> > +++ b/arch/arm/boot/dts/stm32f429.dtsi
> > @@ -402,6 +402,18 @@
>
> Split Soc updates in a separate patch

 *okay, will do it later*

> >                       status =3D "disabled";
> >               };
> >
> > +             i2c3: i2c@40005c00 {
> > +                     compatible =3D "st,stm32f4-i2c";
> > +                     reg =3D <0x40005c00 0x400>;
> > +                     interrupts =3D <72>,
> > +                                  <73>;
> > +                     resets =3D <&rcc STM32F4_APB1_RESET(I2C3)>;
> > +                     clocks =3D <&rcc 0 STM32F4_APB1_CLOCK(I2C3)>;
> > +                     #address-cells =3D <1>;
> > +                     #size-cells =3D <0>;
> > +                     status =3D "disabled";
> > +             };
> > +
> >               dac: dac@40007400 {
> >                       compatible =3D "st,stm32f4-dac-core";
> >                       reg =3D <0x40007400 0x400>;
> >
>

--0000000000009284f505a47f7fed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+SGkgQWxleGFuZHJlLDwvZGl2Pjxicj48ZGl2
IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPkFs
ZXhhbmRyZSBUb3JndWUgJmx0OzxhIGhyZWY9Im1haWx0bzphbGV4YW5kcmUudG9yZ3VlQHN0LmNv
bSI+YWxleGFuZHJlLnRvcmd1ZUBzdC5jb208L2E+Jmd0OyDkuo4yMDIw5bm0NOaciDMw5pel5ZGo
5ZubIOS4i+WNiDU6NTflhpnpgZPvvJo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWls
X3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBz
b2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPkhpPGJyPg0KPGJyPg0KT24g
NC8zMC8yMCAxMTo0MyBBTSwgPGEgaHJlZj0ibWFpbHRvOmRpbGxvbi5taW5mZWlAZ21haWwuY29t
IiB0YXJnZXQ9Il9ibGFuayI+ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb208L2E+IHdyb3RlOjxicj4N
CiZndDsgRnJvbTogZGlsbG9uIG1pbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmRpbGxvbi5taW5mZWlA
Z21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb208L2E+Jmd0
Ozxicj4NCiZndDsgPGJyPg0KJmd0OyBTaWduZWQtb2ZmLWJ5OiBkaWxsb24gbWluICZsdDs8YSBo
cmVmPSJtYWlsdG86ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5kaWxs
b24ubWluZmVpQGdtYWlsLmNvbTwvYT4mZ3Q7PGJyPg0KPGJyPg0KQ29tbWl0IHRpdGxlIHNob3Vs
ZCBiZSBBUk06IGR0czogc3RtMzI6IGJsYSBibGEgb24gc3RtMzJmNDI5IGFuZCBwbGVhc2UgPGJy
Pg0KYSBjb21taXQgbWVzc2FnZS48YnI+DQo8YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2
PjxkaXY+PGI+b2theSwgdGhhbmtzIGZvciB5b3VyIHF1aWNreSByZXNwb25zZSwgdGhpcyBpcyBt
eSBmaXJzdCBrZXJuZWwgcHVsbCByZXF1ZXN0LCBpIHdpbGwgcmVzdWJtaXQgYWxsIHBhdGNoc2V0
cyBmb2xsb3dpbmcgdGhlIGhpc3Rvcnkgc3VibWl0cyBzdHlsZSB3aG8gd2FzIGRpZC48L2I+PC9k
aXY+PGRpdj7CoDwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1h
cmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQs
MjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCiZndDsgLS0tPGJyPg0KJmd0O8KgIMKgLi4uL2JpbmRp
bmdzL2Rpc3BsYXkvcGFuZWwvaWxpdGVrLGlsaTkzNDEudHh0wqAgwqAgwqAgfCA0MiArKysrKysr
KysrKzxicj4NCiZndDvCoCDCoGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQtcGluY3RybC5kdHNp
wqAgwqAgwqAgwqAgwqAgwqAgwqB8IDc5ICsrKysrKysrKysrKysrKysrKys8YnI+DQomZ3Q7wqAg
wqBhcmNoL2FybS9ib290L2R0cy9zdG0zMmY0MjktZGlzY28uZHRzwqAgwqAgwqAgwqAgwqAgwqAg
wqAgfCA4OCArKysrKysrKysrKysrKysrKysrKysrPGJyPg0KJmd0O8KgIMKgYXJjaC9hcm0vYm9v
dC9kdHMvc3RtMzJmNDI5LmR0c2nCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHwgMTIgKysr
PGJyPg0KJmd0O8KgIMKgNCBmaWxlcyBjaGFuZ2VkLCAyMjEgaW5zZXJ0aW9ucygrKTxicj4NCiZn
dDvCoCDCoGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3MvZGlzcGxheS9wYW5lbC9pbGl0ZWssaWxpOTM0MS50eHQ8YnI+DQomZ3Q7IDxicj4NCiZndDsg
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3Bh
bmVsL2lsaXRlayxpbGk5MzQxLnR4dCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L3BhbmVsL2lsaXRlayxpbGk5MzQxLnR4dDxicj4NCjxicj4NClRoaXMgYmluZGlu
ZyBkZXNjcmlwdGlvbiBzaG91bGQgYmUgaW4gYSBzZXBhcmF0ZSBwYXRjaCBhbmQgeW91IGhhdmUg
dG8gPGJyPg0Kd3JpdGUgaW4gWUFNTCBmb3JtYXQuPGJyPg0KPGJyPjwvYmxvY2txdW90ZT48ZGl2
PjxiPm9rYXksIHdpbGwgZG8gaXQgbGF0ZXIuwqA8L2I+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9
ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0
OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPg0KPGJyPg0KJmd0
OyBuZXcgZmlsZSBtb2RlIDEwMDY0NDxicj4NCiZndDsgaW5kZXggMDAwMDAwMC4uZjVhNGU1NTxi
cj4NCiZndDsgLS0tIC9kZXYvbnVsbDxicj4NCiZndDsgKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvaWxpdGVrLGlsaTkzNDEudHh0PGJyPg0KJmd0
OyBAQCAtMCwwICsxLDQyIEBAPGJyPg0KJmd0OyArSWxpdGVrIElMSTkzNDEgVEZUIHBhbmVsIGRy
aXZlciB3aXRoIFNQSSBjb250cm9sIGJ1czxicj4NCiZndDsgKzxicj4NCiZndDsgK1RoaXMgaXMg
YSBkcml2ZXIgZm9yIDI0MHgzMjAgVEZUIHBhbmVscywgYWNjZXB0aW5nIGEgcmdiIGlucHV0PGJy
Pg0KJmd0OyArc3RyZWFtcyB0aGF0IGdldCBhZGFwdGVkIGFuZCBzY2FsZWQgdG8gdGhlIHBhbmVs
Ljxicj4NCiZndDsgKzxicj4NCiZndDsgK1JlcXVpcmVkIHByb3BlcnRpZXM6PGJyPg0KJmd0OyAr
wqAgLSBjb21wYXRpYmxlOiAmcXVvdDtzdG0zMmY0MjktZGlzY28sbHRkYy1wYW5lbCZxdW90Oywg
JnF1b3Q7aWxpdGVrLGlsaTkzNDEmcXVvdDs8YnI+DQomZ3Q7ICvCoCDCoCAoZnVsbCBzeXN0ZW0t
c3BlY2lmaWMgY29tcGF0aWJsZSBpcyBhbHdheXMgcmVxdWlyZWQgdG8gbG9vayB1cCBjb25maWd1
cmF0aW9uKTxicj4NCiZndDsgK8KgIC0gcmVnOiBhZGRyZXNzIG9mIHRoZSBwYW5lbCBvbiB0aGUg
U1BJIGJ1czxicj4NCiZndDsgKzxicj4NCiZndDsgK09wdGlvbmFsIHByb3BlcnRpZXM6PGJyPg0K
Jmd0OyArwqAgLSByZXNldC1ncGlvczogYSBHUElPIHNwZWMgZm9yIHRoZSByZXNldCBwaW4sIHNl
ZSBncGlvL2dwaW8udHh0PGJyPg0KJmd0OyArwqAgLSBkYy1ncGlvczogYSBHUElPIHNwZWMgZm9y
IHRoZSBkYyBwaW4sIHNlZSBncGlvL2dwaW8udHh0PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAg
VGhlIGZvbGxvd2luZyBvcHRpb25hbCBwcm9wZXJ0aWVzIG9ubHkgYXBwbHkgdG8gUkdCIGlucHV0
IG1vZGU6PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgLSBwaXhlbGNsay1hY3RpdmU6IHNlZSBk
aXNwbGF5L3BhbmVsL2Rpc3BsYXktdGltaW5nLnR4dDxicj4NCiZndDsgK8KgIC0gZGUtYWN0aXZl
OiBzZWUgZGlzcGxheS9wYW5lbC9kaXNwbGF5LXRpbWluZy50eHQ8YnI+DQomZ3Q7ICvCoCAtIGhz
eW5jLWFjdGl2ZTogc2VlIGRpc3BsYXkvcGFuZWwvZGlzcGxheS10aW1pbmcudHh0PGJyPg0KJmd0
OyArwqAgLSB2c3luYy1hY3RpdmU6IHNlZSBkaXNwbGF5L3BhbmVsL2Rpc3BsYXktdGltaW5nLnR4
dDxicj4NCiZndDsgKzxicj4NCiZndDsgK1RoZSBwYW5lbCBtdXN0IG9iZXkgdGhlIHJ1bGVzIGZv
ciBhIFNQSSBzbGF2ZSBkZXZpY2UgYXMgc3BlY2lmaWVkIGluPGJyPg0KJmd0OyArc3BpL3NwaS1i
dXMudHh0PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArVGhlIGRldmljZSBub2RlIGNhbiBjb250YWlu
IG9uZSAmIzM5O3BvcnQmIzM5OyBjaGlsZCBub2RlIHdpdGggb25lIGNoaWxkPGJyPg0KJmd0OyAr
JiMzOTtlbmRwb2ludCYjMzk7IG5vZGUsIGFjY29yZGluZyB0byB0aGUgYmluZGluZ3MgZGVmaW5l
ZCBpbjxicj4NCiZndDsgK21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0LiBUaGlzIG5vZGUgc2hv
dWxkIGRlc2NyaWJlIHBhbmVsJiMzOTtzIHZpZGVvIGJ1cy48YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7
ICtFeGFtcGxlOjxicj4NCiZndDsgKzxicj4NCiZndDsgK3BhbmVsOiBkaXNwbGF5QDAgezxicj4N
CiZndDsgK8KgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3N0bTMyZjQyOS1kaXNjbyxsdGRjLXBh
bmVsJnF1b3Q7LCAmcXVvdDtpbGl0ZWssaWxpOTM0MSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oHJlZyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoHNwaS0zd2lyZTs8YnI+DQomZ3Q7
ICvCoCDCoCDCoHNwaS1tYXgtZnJlcXVlbmN5ID0gJmx0OzEwMDAwMDAwJmd0Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoGRjLWdwaW9zID0gJmx0OyZhbXA7Z3Bpb2QgMTMgMCZndDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqBwb3J0IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHBhbmVsX2luOiBl
bmRwb2ludCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZW1v
dGUtZW5kcG9pbnQgPSAmbHQ7JmFtcDtkaXNwbGF5X291dCZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgK8KgIMKgIMKgfTs8YnI+DQomZ3Q7ICt9Ozxicj4N
CiZndDsgZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQtcGluY3RybC5kdHNp
IGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNC1waW5jdHJsLmR0c2k8YnI+DQomZ3Q7IGluZGV4
IDM5MmZhMTQuLjQ1YjY4ZjQgMTAwNjQ0PGJyPg0KJmd0OyAtLS0gYS9hcmNoL2FybS9ib290L2R0
cy9zdG0zMmY0LXBpbmN0cmwuZHRzaTxicj4NCiZndDsgKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMv
c3RtMzJmNC1waW5jdHJsLmR0c2k8YnI+DQomZ3Q7IEBAIC0zMTYsNiArMzE2LDg1IEBAPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDvCoCDC
oDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbHRkY19waW5zX2Y0
MjlfZGlzY286IGx0ZGMtMSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBwaW5zIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbm11eCA9ICZsdDtTVE0zMl9QSU5N
VVgoJiMzOTtDJiMzOTssIDYswqAgQUYxNCkmZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyog
TENEX0hTWU5DICovPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0O1NUTTMyX1BJTk1VWCgmIzM5
O0EmIzM5OywgNCzCoCBBRjE0KSZndDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogTENEX1ZT
WU5DICovPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0O1NUTTMyX1BJTk1VWCgmIzM5O0cmIzM5
OywgNyzCoCBBRjE0KSZndDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogTENEX0NMSyAqLzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtDJiMzOTssIDEwLCBB
RjE0KSZndDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogTENEX1IyICovPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmx0O1NUTTMyX1BJTk1VWCgmIzM5O0ImIzM5OywgMCzCoCBBRjkpJmd0Oyw8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0RfUjMgKi88YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCAmbHQ7U1RNMzJfUElOTVVYKCYjMzk7QSYjMzk7LCAxMSwgQUYxNCkmZ3Q7LDxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIC8qIExDRF9SNCAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0z
Ml9QSU5NVVgoJiMzOTtBJiMzOTssIDEyLCBBRjE0KSZndDssPGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgLyogTENEX1I1ICovPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0O1NUTTMyX1BJTk1VWCgm
IzM5O0ImIzM5OywgMSzCoCBBRjkpJmd0Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0Rf
UjYqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtHJiMzOTss
IDYswqAgQUYxNCkmZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9SNyAqLzxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtBJiMzOTssIDYswqAgQUYx
NCkmZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9HMiAqLzxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtHJiMzOTssIDEwLCBBRjkpJmd0Oyw8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0RfRzMgKi88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAm
bHQ7U1RNMzJfUElOTVVYKCYjMzk7QiYjMzk7LCAxMCwgQUYxNCkmZ3Q7LDxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIC8qIExDRF9HNCAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9Q
SU5NVVgoJiMzOTtEJiMzOTssIDYswqAgQUYxNCkmZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IC8qIExDRF9CMiAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMz
OTtHJiMzOTssIDExLCBBRjE0KSZndDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogTENEX0Iz
Ki88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7U1RNMzJfUElOTVVYKCYjMzk7QiYjMzk7LCAx
MSwgQUYxNCkmZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9HNSAqLzxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtDJiMzOTssIDcswqAgQUYxNCkm
Z3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9HNiAqLzxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtEJiMzOTssIDMswqAgQUYxNCkmZ3Q7LDxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9HNyAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZs
dDtTVE0zMl9QSU5NVVgoJiMzOTtHJiMzOTssIDEyLCBBRjkpJmd0Oyw8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCAvKiBMQ0RfQjQgKi88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7U1RNMzJfUElO
TVVYKCYjMzk7QSYjMzk7LCAzLMKgIEFGMTQpJmd0Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAv
KiBMQ0RfQjUgKi88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7U1RNMzJfUElOTVVYKCYjMzk7
QiYjMzk7LCA4LMKgIEFGMTQpJmd0Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0RfQjYg
Ki88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7U1RNMzJfUElOTVVYKCYjMzk7QiYjMzk7LCA5
LMKgIEFGMTQpJmd0Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0RfQjcgKi88YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCAmbHQ7U1RNMzJfUElOTVVYKCYjMzk7RiYjMzk7LCAxMCwgQUYxNCkm
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9ERSAqLzxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2xldy1y
YXRlID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpMmMzX3BpbnM6IGkyYzMtMCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5zIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbm11eCA9ICZsdDtTVE0z
Ml9QSU5NVVgoJiMzOTtDJiMzOTssIDksIEFGNCkmZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
LyogSTJDM19TREEgKi88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7U1RNMzJfUElOTVVYKCYj
Mzk7QSYjMzk7LCA4LCBBRjQpJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIEkyQzNfU0NM
ICovPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBiaWFzLWRpc2FibGU7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkcml2ZS1vcGVuLWRyYWluOzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgc2xldy1yYXRlID0gJmx0OzMmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqBzcGk1X3BpbnM6IHNwaTUtMCB7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5zMSB7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBw
aW5tdXggPSAmbHQ7U1RNMzJfUElOTVVYKCYjMzk7RiYjMzk7LCA3LCBBRjUpJmd0Oyw8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoC8qIFNQSTVfQ0xLICovPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0
O1NUTTMyX1BJTk1VWCgmIzM5O0YmIzM5OywgOSwgQUY1KSZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAvKiBTUEk1X01PU0kgKi88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJpYXMtZGlzYWJsZTs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRy
aXZlLXB1c2gtcHVsbDs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNsZXctcmF0ZSA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5zMiB7PGJy
Pg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBwaW5tdXggPSAmbHQ7U1RNMzJfUElOTVVYKCYjMzk7RiYjMzk7LCA4LCBBRjUpJmd0
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIFNQSTVfTUlTTyAqLzxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYmlhcy1k
aXNhYmxlOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJy
Pg0KJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGNt
aV9waW5zOiBkY21pLTAgezxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHBpbnMgezxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbm11eCA9ICZsdDtTVE0zMl9QSU5N
VVgoJiMzOTtBJiMzOTssIDQsIEFGMTMpJmd0OywgLyogRENNSV9IU1lOQyAqLzxicj4NCiZndDsg
ZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQyOS1kaXNjby5kdHMgYi9hcmNo
L2FybS9ib290L2R0cy9zdG0zMmY0MjktZGlzY28uZHRzPGJyPg0KJmd0OyBpbmRleCAzMGMwZjY3
Li41NWVlZDA1IDEwMDY0NDxicj4NCiZndDsgLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJm
NDI5LWRpc2NvLmR0czxicj4NCiZndDsgKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNDI5
LWRpc2NvLmR0czxicj4NCiZndDsgQEAgLTQ5LDYgKzQ5LDggQEA8YnI+DQomZ3Q7wqAgwqAjaW5j
bHVkZSAmcXVvdDtzdG0zMmY0MjkuZHRzaSZxdW90Ozxicj4NCiZndDvCoCDCoCNpbmNsdWRlICZx
dW90O3N0bTMyZjQyOS1waW5jdHJsLmR0c2kmcXVvdDs8YnI+DQomZ3Q7wqAgwqAjaW5jbHVkZSAm
bHQ7ZHQtYmluZGluZ3MvaW5wdXQvaW5wdXQuaCZndDs8YnI+DQomZ3Q7ICsjaW5jbHVkZSAmbHQ7
ZHQtYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvaXJxLmgmZ3Q7PGJyPg0KJmd0OyArI2lu
Y2x1ZGUgJmx0O2R0LWJpbmRpbmdzL2dwaW8vZ3Bpby5oJmd0Ozxicj4NCiZndDvCoCDCoDxicj4N
CiZndDvCoCDCoC8gezxicj4NCiZndDvCoCDCoCDCoCDCoG1vZGVsID0gJnF1b3Q7U1RNaWNyb2Vs
ZWN0cm9uaWNzIFNUTTMyRjQyOWktRElTQ08gYm9hcmQmcXVvdDs7PGJyPg0KJmd0OyBAQCAtOTgs
NiArMTAwLDE0IEBAPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW5h
bWUgPSAmcXVvdDt2Y2M1X2hvc3QxJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHJlZ3VsYXRvci1hbHdheXMtb247PGJyPg0KJmd0O8KgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7
ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoHJlZ18zcDN2OiByZWd1bGF0b3ItM3AzdiB7PGJyPg0KPGJy
Pg0KM3AzID88L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj7CoDxiPnllcywgdGhlIG1m
ZCBzdG1wZSBkcml2ZXIgbmVlZCB2Y2MgJmFtcDsgdmlvwqByZWd1bGF0b3IsIHN0IHNlbnNvciBj
b3JlIGRyaXZlciBuZWVkIHZkZGlvICZhbXA7IHZkZDwvYj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHgg
MC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0
OjFleCI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtyZWd1
bGF0b3ItZml4ZWQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0
b3ItbmFtZSA9ICZxdW90OzNQM1YmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9ICZsdDszMzAwMDAwJmd0Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1tYXgtbWljcm92b2x0ID0gJmx0OzMzMDAwMDAm
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLWFsd2F5cy1vbjs8
YnI+DQomZ3Q7ICvCoCDCoCDCoH07PGJyPg0KJmd0O8KgIMKgfTs8YnI+DQomZ3Q7wqAgwqA8YnI+
DQomZ3Q7wqAgwqAmYW1wO2Nsa19oc2Ugezxicj4NCiZndDsgQEAgLTEyNywzICsxMzcsODEgQEA8
YnI+DQomZ3Q7wqAgwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8
YnI+DQomZ3Q7wqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZndDvC
oCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArJmFtcDtsdGRjIHs8YnI+DQomZ3Q7ICvCoCDC
oCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqBwaW5jdHJs
LTAgPSAmbHQ7JmFtcDtsdGRjX3BpbnNfZjQyOV9kaXNjbyZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7ICs8YnI+DQom
Z3Q7ICvCoCDCoCDCoHBvcnQgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgbHRkY19v
dXRfcmdiOiBlbmRwb2ludCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqByZW1vdGUtZW5kcG9pbnQgPSAmbHQ7JmFtcDtwYW5lbF9pbl9yZ2ImZ3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDCoH07PGJyPg0KJmd0
OyArfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO3NwaTUgezxicj4NCiZndDsgK8KgIMKg
IMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoHBpbmN0cmwt
MCA9ICZsdDsmYW1wO3NwaTVfcGlucyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqBwaW5jdHJsLW5h
bWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCNhZGRyZXNzLWNl
bGxzID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZn
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqBjcy1ncGlvcyA9ICZsdDsmYW1wO2dwaW9jIDEgR1BJT19B
Q1RJVkVfTE9XJmd0OywmbHQ7JmFtcDtncGlvYyAyIEdQSU9fQUNUSVZFX0xPVyZndDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqBkbWFzID0gJmx0OyZhbXA7ZG1hMiAzIDIgMHg0MDAgMHgwJmd0Oyw8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7JmFtcDtkbWEyIDQgMiAweDQwMCAweDAmZ3Q7
Ozxicj4NCiZndDsgK8KgIMKgIMKgZG1hLW5hbWVzID0gJnF1b3Q7cngmcXVvdDssICZxdW90O3R4
JnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgbDNnZDIwOiBsM2dkMjBAMCB7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7c3QsbDNnZDIwLWd5cm8mcXVv
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBzcGktbWF4LWZyZXF1ZW5jeSA9ICZs
dDsxMDAwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBzdCxkcmR5LWlu
dC1waW4gPSAmbHQ7MiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1
cHQtcGFyZW50ID0gJmx0OyZhbXA7Z3Bpb2EmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgaW50ZXJydXB0cyA9ICZsdDsxIElSUV9UWVBFX0VER0VfUklTSU5HJmd0Oyw8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCZsdDsyIElS
UV9UWVBFX0VER0VfUklTSU5HJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
ZyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHZkZGlvID0gJmx0
OyZhbXA7cmVnXzNwM3YmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgdmRkID0g
Jmx0OyZhbXA7cmVnXzNwM3YmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgc3Rh
dHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoH07PGJyPg0KJmd0OyAr
wqAgwqAgwqBkaXNwbGF5OiBkaXNwbGF5QDF7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAvKiBDb25uZWN0IHBhbmVsLWlsaXRlay05MzQxIHRvIGx0ZGMgKi88YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtzdG0zMmY0MjktZGlzY28sbHRkYy1w
YW5lbCZxdW90OywgJnF1b3Q7aWxpdGVrLGlsaTkzNDEmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqBzcGktM3dpcmU7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBzcGktbWF4LWZy
ZXF1ZW5jeSA9ICZsdDsxMDAwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqBkYy1ncGlvcyA9ICZsdDsmYW1wO2dwaW9kIDEzIDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgcG9ydCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBwYW5lbF9pbl9yZ2I6IGVuZHBvaW50IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlbW90ZS1lbmRwb2ludCA9ICZsdDsmYW1wO2x0ZGNfb3V0X3JnYiZn
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDCoH07PGJyPg0KJmd0
OyArfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO2kyYzMgezxicj4NCjxicj4NCk5vZGVz
IGFyZSBoYXZlIHRvIGJlIG9yZGVyZWQ8L2Jsb2NrcXVvdGU+PGRpdj7CoDxiPnNvcnJ5LCBhIGxp
dHRsZSBjb25mdXNlZCwgaTJjLTMgaXMgdXNlZCBieSBzdG1wZTgxMSBkcml2ZXI8L2I+PC9kaXY+
PGRpdj7CoDwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdp
bjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0
KTtwYWRkaW5nLWxlZnQ6MWV4Ij7CoDxicj4NCiZndDsgK8KgIMKgIMKgcGluY3RybC1uYW1lcyA9
ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7
JmFtcDtpMmMzX3BpbnMmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2th
eSZxdW90Ozs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoHRvdWNoOiBzdG1wZTgxMUA0
MSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7c3Qs
c3RtcGU4MTEmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7
MHg0MSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0
OzE1IElSUV9UWVBFX0VER0VfRkFMTElORyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqBpbnRlcnJ1cHQtcGFyZW50ID0gJmx0OyZhbXA7Z3Bpb2EmZ3Q7Ozxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgdmlvID0gJmx0OyZhbXA7cmVnXzNwM3YmZ3Q7Ozxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgdmNjID0gJmx0OyZhbXA7cmVnXzNwM3YmZ3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQom
Z3Q7ICs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHN0bXBlX3RvdWNoc2NyZWVuIHs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAm
cXVvdDtzdCxzdG1wZS10cyZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoHN0LHNhbXBsZS10aW1lID0gJmx0OzQmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3QsbW9kLTEyYiA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0LHJlZi1zZWwgPSAmbHQ7MCZndDs7
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdCxhZGMtZnJlcSA9
ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0
LGF2ZS1jdHJsID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgc3QsdG91Y2gtZGV0LWRlbGF5ID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3Qsc2V0dGxpbmcgPSAmbHQ7MiZndDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdCxmcmFjdGlvbi16ID0gJmx0
OzcmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3QsaS1k
cml2ZSA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0K
Jmd0OyArwqAgwqAgwqB9Ozxicj4NCiZndDsgK307PGJyPg0KJmd0OyBkaWZmIC0tZ2l0IGEvYXJj
aC9hcm0vYm9vdC9kdHMvc3RtMzJmNDI5LmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY0
MjkuZHRzaTxicj4NCiZndDsgaW5kZXggZDc3NzA2OS4uMjU3Yjg0MyAxMDA2NDQ8YnI+DQomZ3Q7
IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQyOS5kdHNpPGJyPg0KJmd0OyArKysgYi9h
cmNoL2FybS9ib290L2R0cy9zdG0zMmY0MjkuZHRzaTxicj4NCiZndDsgQEAgLTQwMiw2ICs0MDIs
MTggQEA8YnI+DQo8YnI+DQpTcGxpdCBTb2MgdXBkYXRlcyBpbiBhIHNlcGFyYXRlIHBhdGNoPC9i
bG9ja3F1b3RlPjxkaXY+wqA8Yj5va2F5LCB3aWxsIGRvIGl0IGxhdGVyPC9iPjwvZGl2PjxibG9j
a3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhl
eDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4
Ij4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90
O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0K
Jmd0O8KgIMKgPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBpMmMzOiBpMmNANDAwMDVj
MDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJs
ZSA9ICZxdW90O3N0LHN0bTMyZjQtaTJjJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzB4NDAwMDVjMDAgMHg0MDAmZ3Q7Ozxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDs3MiZn
dDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgJmx0OzczJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJlc2V0cyA9ICZsdDsmYW1wO3JjYyBTVE0zMkY0X0FQQjFfUkVTRVQoSTJDMykmZ3Q7
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY2xvY2tzID0gJmx0
OyZhbXA7cmNjIDAgU1RNMzJGNF9BUEIxX0NMT0NLKEkyQzMpJmd0Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgI3NpemUtY2VsbHMgPSAm
bHQ7MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0
dXMgPSAmcXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oH07PGJyPg0KJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgZGFjOiBkYWNA
NDAwMDc0MDAgezxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNv
bXBhdGlibGUgPSAmcXVvdDtzdCxzdG0zMmY0LWRhYy1jb3JlJnF1b3Q7Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDQwMDA3NDAwIDB4NDAw
Jmd0Ozs8YnI+DQomZ3Q7IDxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj48L2Rpdj4NCg==
--0000000000009284f505a47f7fed--

--===============2093487627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============2093487627==--
