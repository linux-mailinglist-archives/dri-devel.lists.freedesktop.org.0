Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86CC41C2424
	for <lists+dri-devel@lfdr.de>; Sat,  2 May 2020 10:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7E86EDB2;
	Sat,  2 May 2020 08:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 708F76ED79
 for <dri-devel@lists.freedesktop.org>; Sat,  2 May 2020 04:23:17 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id z2so6798371iol.11
 for <dri-devel@lists.freedesktop.org>; Fri, 01 May 2020 21:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c9pfvT2UhBAPLKc2YfxPhbm2LygDlexPXbW6MuIMGoo=;
 b=TDjW3ncsksA8FLM5++3uMizaFb7A2K5LcJ9FMNA7VoTXjgEGaeOiwhxZvGB33s7++1
 ZhxYJ44Qpi+scr8YSG3doanDGTpYWjTc8RUR25kZ/9IPHqb8DuM5R6J8HMg0BeS32GSC
 WDTAfHXGLaXSzblEiBQyv/mhZggNg3YSqrpZnIwDeKo9SSrdA2WichFT5eoaWR3XhbYQ
 nNvlj70qLnJx/rRUGEgQUdJVCjPNZkvuOCFuQ3aauLMT9IesUrf3g/axIBvF33AIZzTu
 mdsK9BEdkjL16giUVf9Jdzt9IHgk5sjcYMYw3cc79NDwpiHD8gn8q59LPacQWbiKIca9
 Wxqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c9pfvT2UhBAPLKc2YfxPhbm2LygDlexPXbW6MuIMGoo=;
 b=lgWCWGYbJ1jBgil/3dQifbTJe6+IkRv8qaKda3TifMJeTNBoIFwroO1N+abEo1xDZM
 ns+BkuPvleAjyF1rGCo18MMntoXW7n65uqPS3Rjo+Ycggr0dawpztUCROu7XlUwvuejH
 gNL1HVLpHVGXSMwwY4ittq4NpahFUkeqsPRSnuWUPl2eBGvpaJU65hCSg9fWKAgBy0YJ
 s0+R6C415VyZdS/e6B64tZLihTXfrJHqzDcWoKvSXJPp2y0BoZjpUsZGKyMr8pVpP98J
 xjtRALk3xfWASsyOOidBs1RNJbLy2JoGt2T3e7BBcwOWjW8tkOz4DqejWTr7mAZDi5jn
 J47w==
X-Gm-Message-State: AGi0PubhFNaEC/dSwCoRTueepfSU0MaRGv+TO+IBmxnCkDBcPEQkAzQr
 8z2EE04y2DTorz/84w72wqLEZQltr1zMULfvD7Y=
X-Google-Smtp-Source: APiQypJAm9PDV7EcpSh/VF9ZFce0y+X1NcdSqfpDslnhxmnlLK+lL9nWazdGYNqw5RAUzMadncw6ry5DlHBoncndqNo=
X-Received: by 2002:a6b:8b05:: with SMTP id n5mr6764097iod.68.1588393396602;
 Fri, 01 May 2020 21:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <1588239802-11442-1-git-send-email-dillon.minfei@gmail.com>
 <33f928e7-3fde-99a2-b84d-d74a2d3f1186@st.com>
 <CAL9mu0+AqO69+rEcH=HVWRhDLbqDO52-Cjxt-PAZmg6=7QtpvQ@mail.gmail.com>
 <40bdf88c-fbc2-564c-1aec-38318bab5e61@st.com>
In-Reply-To: <40bdf88c-fbc2-564c-1aec-38318bab5e61@st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Sat, 2 May 2020 12:23:05 +0800
Message-ID: <CAL9mu0KRPPrTUWggs2dQWPGjkyubUMpYx=3JzOpwTPQPHjsGhw@mail.gmail.com>
Subject: Re: [PATCH 1/4] add dts node for drm panel driver ili9341 add dts
 i2c3 for stmpe touch add dts spi5 for gyro & ili9341
To: Alexandre Torgue <alexandre.torgue@st.com>
X-Mailman-Approved-At: Sat, 02 May 2020 08:34:27 +0000
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
Content-Type: multipart/mixed; boundary="===============0051595580=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0051595580==
Content-Type: multipart/alternative; boundary="0000000000002b0ace05a4a2a823"

--0000000000002b0ace05a4a2a823
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alexandre,

Alexandre Torgue <alexandre.torgue@st.com> =E4=BA=8E2020=E5=B9=B44=E6=9C=88=
30=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=887:45=E5=86=99=E9=81=93=EF=
=BC=9A

>
>
> On 4/30/20 12:26 PM, dillon min wrote:
> > Hi Alexandre,
> >
> > Alexandre Torgue <alexandre.torgue@st.com
> > <mailto:alexandre.torgue@st.com>> =E4=BA=8E2020=E5=B9=B44=E6=9C=8830=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=885:57=E5=86=99=E9=81=93=EF=BC=9A
> >
> >     Hi
> >
> >     On 4/30/20 11:43 AM, dillon.minfei@gmail.com
> >     <mailto:dillon.minfei@gmail.com> wrote:
> >      > From: dillon min <dillon.minfei@gmail.com
> >     <mailto:dillon.minfei@gmail.com>>
> >      >
> >      > Signed-off-by: dillon min <dillon.minfei@gmail.com
> >     <mailto:dillon.minfei@gmail.com>>
> >
> >     Commit title should be ARM: dts: stm32: bla bla on stm32f429 and
> please
> >     a commit message.
> >
> >
> > *okay, thanks for your quicky response, this is my first kernel pull
> > request, i will resubmit all patchsets following the history submits
> > style who was did.*
>
> ok no pb. In general way you have to execute ./scripts/checkpatch.pl to
> check some style errors before sending. Use ./scripts/get_maintainer.pl
> to see to who you have to send the patch. When you have several patches
> in a series, you need to have a cover-letter which explains the aim of
> your series. To have an idea of commit format just use git log on the
> file changed to see how previous accepted commi have been written.
>
> More details here: Documentation/process/submitting-patches.rst
>
> okay, thanks alexandre, i will go through these docs. currently i'm on ma=
y
day holiday,  will be back at  next wensday.
after go back to work. i will separate this patch to five part with 9
patchs , should be more clear

dts releated
    1,  ARM: dts: stm32: Add i2c3 node for stm32f429
    2,  ARM: dts: stm32: Add drm panel ili9341 nodes connect to ldtc
support for stm32f429-disco board
    3,  ARM: dts: stm32: Add stmpe811 touch screen support for
stm32f429-disco board
    4,  ARM: dts: stm32: Add l3gd20 gyroscope sensor support for
stm32f429-disco board

clk releated
    1, clk: stm32: Fix ltdc loading hang in set clk rate, pll_hw set to
clks[PLL_VCO_SAI] but not clks[PLL_SAI]
    2, clk: stm32: Add CLK_IGNORE_UNUSED flags for ltdc, make sure ltdc clk
not be released after system startup

spi releated
    1, spi: stm32: Add transfer mode SPI_SIMPLE_RX, SPI_3WIRE_RX support
for stm32f4

drm releated
    1, drm/panel: Add panel driver ilitek-ili9341

doc releated
     1, dt-bindings: display: panel: Add binding document for Ilitek Ili934=
1

TODO:
ltdc was verified by fbcon+logo, uname -a > /dev/tty0 , need more time to
write test code with libdrm to verify osd
stmpe811 need cross compile tslib to do touch screen calibration
l3gd20 was tested by read data from /sys/bus/iio, need cross compile libiio
to be verified by application with libiio
add dma2d to ltdc driver to speed up graphic render
dcmi camera with ov5640, the sdram might be not enough to support this.
currently after zImage load to sdram,
just leave less than 2M bytes for application.

>
> >      > ---
> >      >   .../bindings/display/panel/ilitek,ili9341.txt      | 42
> +++++++++++
> >      >   arch/arm/boot/dts/stm32f4-pinctrl.dtsi             | 79
> >     +++++++++++++++++++
> >      >   arch/arm/boot/dts/stm32f429-disco.dts              | 88
> >     ++++++++++++++++++++++
> >      >   arch/arm/boot/dts/stm32f429.dtsi                   | 12 +++
> >      >   4 files changed, 221 insertions(+)
> >      >   create mode 100644
> >     Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
> >      >
> >      > diff --git
> >     a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.tx=
t
> >     b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.tx=
t
> >
> >     This binding description should be in a separate patch and you have
> to
> >     write in YAML format.
> >
> > *okay, will do it later. *
> >
> >
> >      > new file mode 100644
> >      > index 0000000..f5a4e55
> >      > --- /dev/null
> >      > +++
> >     b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.tx=
t
> >      > @@ -0,0 +1,42 @@
> >      > +Ilitek ILI9341 TFT panel driver with SPI control bus
> >      > +
> >      > +This is a driver for 240x320 TFT panels, accepting a rgb input
> >      > +streams that get adapted and scaled to the panel.
> >      > +
> >      > +Required properties:
> >      > +  - compatible: "stm32f429-disco,ltdc-panel", "ilitek,ili9341"
> >      > +    (full system-specific compatible is always required to look
> >     up configuration)
> >      > +  - reg: address of the panel on the SPI bus
> >      > +
> >      > +Optional properties:
> >      > +  - reset-gpios: a GPIO spec for the reset pin, see gpio/gpio.t=
xt
> >      > +  - dc-gpios: a GPIO spec for the dc pin, see gpio/gpio.txt
> >      > +
> >      > +  The following optional properties only apply to RGB input mod=
e:
> >      > +
> >      > +  - pixelclk-active: see display/panel/display-timing.txt
> >      > +  - de-active: see display/panel/display-timing.txt
> >      > +  - hsync-active: see display/panel/display-timing.txt
> >      > +  - vsync-active: see display/panel/display-timing.txt
> >      > +
> >      > +The panel must obey the rules for a SPI slave device as
> specified in
> >      > +spi/spi-bus.txt
> >      > +
> >      > +The device node can contain one 'port' child node with one chil=
d
> >      > +'endpoint' node, according to the bindings defined in
> >      > +media/video-interfaces.txt. This node should describe panel's
> >     video bus.
> >      > +
> >      > +Example:
> >      > +
> >      > +panel: display@0 {
> >      > +     compatible =3D "stm32f429-disco,ltdc-panel", "ilitek,ili93=
41";
> >      > +     reg =3D <0>;
> >      > +     spi-3wire;
> >      > +     spi-max-frequency =3D <10000000>;
> >      > +     dc-gpios =3D <&gpiod 13 0>;
> >      > +     port {
> >      > +             panel_in: endpoint {
> >      > +                     remote-endpoint =3D <&display_out>;
> >      > +             };
> >      > +     };
> >      > +};
> >      > diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> >     b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> >      > index 392fa14..45b68f4 100644
> >      > --- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> >      > +++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> >      > @@ -316,6 +316,85 @@
> >      >                               };
> >      >                       };
> >      >
> >      > +                     ltdc_pins_f429_disco: ltdc-1 {
> >      > +                             pins {
> >      > +                                     pinmux =3D <STM32_PINMUX('=
C',
> >     6,  AF14)>,
> >      > +                                             /* LCD_HSYNC */
> >      > +                                              <STM32_PINMUX('A'=
,
> >     4,  AF14)>,
> >      > +                                              /* LCD_VSYNC */
> >      > +                                              <STM32_PINMUX('G'=
,
> >     7,  AF14)>,
> >      > +                                              /* LCD_CLK */
> >      > +                                              <STM32_PINMUX('C'=
,
> >     10, AF14)>,
> >      > +                                              /* LCD_R2 */
> >      > +                                              <STM32_PINMUX('B'=
,
> >     0,  AF9)>,
> >      > +                                              /* LCD_R3 */
> >      > +                                              <STM32_PINMUX('A'=
,
> >     11, AF14)>,
> >      > +                                              /* LCD_R4 */
> >      > +                                              <STM32_PINMUX('A'=
,
> >     12, AF14)>,
> >      > +                                              /* LCD_R5 */
> >      > +                                              <STM32_PINMUX('B'=
,
> >     1,  AF9)>,
> >      > +                                              /* LCD_R6*/
> >      > +                                              <STM32_PINMUX('G'=
,
> >     6,  AF14)>,
> >      > +                                              /* LCD_R7 */
> >      > +                                              <STM32_PINMUX('A'=
,
> >     6,  AF14)>,
> >      > +                                              /* LCD_G2 */
> >      > +                                              <STM32_PINMUX('G'=
,
> >     10, AF9)>,
> >      > +                                              /* LCD_G3 */
> >      > +                                              <STM32_PINMUX('B'=
,
> >     10, AF14)>,
> >      > +                                              /* LCD_G4 */
> >      > +                                              <STM32_PINMUX('D'=
,
> >     6,  AF14)>,
> >      > +                                              /* LCD_B2 */
> >      > +                                              <STM32_PINMUX('G'=
,
> >     11, AF14)>,
> >      > +                                              /* LCD_B3*/
> >      > +                                              <STM32_PINMUX('B'=
,
> >     11, AF14)>,
> >      > +                                              /* LCD_G5 */
> >      > +                                              <STM32_PINMUX('C'=
,
> >     7,  AF14)>,
> >      > +                                              /* LCD_G6 */
> >      > +                                              <STM32_PINMUX('D'=
,
> >     3,  AF14)>,
> >      > +                                              /* LCD_G7 */
> >      > +                                              <STM32_PINMUX('G'=
,
> >     12, AF9)>,
> >      > +                                              /* LCD_B4 */
> >      > +                                              <STM32_PINMUX('A'=
,
> >     3,  AF14)>,
> >      > +                                              /* LCD_B5 */
> >      > +                                              <STM32_PINMUX('B'=
,
> >     8,  AF14)>,
> >      > +                                              /* LCD_B6 */
> >      > +                                              <STM32_PINMUX('B'=
,
> >     9,  AF14)>,
> >      > +                                              /* LCD_B7 */
> >      > +                                              <STM32_PINMUX('F'=
,
> >     10, AF14)>;
> >      > +                                              /* LCD_DE */
> >      > +                                     slew-rate =3D <2>;
> >      > +                             };
> >      > +                     };
> >      > +
> >      > +                     i2c3_pins: i2c3-0 {
> >      > +                             pins {
> >      > +                                     pinmux =3D <STM32_PINMUX('=
C',
> >     9, AF4)>,
> >      > +                                             /* I2C3_SDA */
> >      > +                                              <STM32_PINMUX('A'=
,
> >     8, AF4)>;
> >      > +                                             /* I2C3_SCL */
> >      > +                                     bias-disable;
> >      > +                                     drive-open-drain;
> >      > +                                     slew-rate =3D <3>;
> >      > +                             };
> >      > +                     };
> >      > +
> >      > +                     spi5_pins: spi5-0 {
> >      > +                             pins1 {
> >      > +                                     pinmux =3D <STM32_PINMUX('=
F',
> >     7, AF5)>,
> >      > +                                             /* SPI5_CLK */
> >      > +                                              <STM32_PINMUX('F'=
,
> >     9, AF5)>;
> >      > +                                             /* SPI5_MOSI */
> >      > +                                     bias-disable;
> >      > +                                     drive-push-pull;
> >      > +                                     slew-rate =3D <0>;
> >      > +                             };
> >      > +                             pins2 {
> >      > +                                     pinmux =3D <STM32_PINMUX('=
F',
> >     8, AF5)>;
> >      > +                                             /* SPI5_MISO */
> >      > +                                     bias-disable;
> >      > +                             };
> >      > +                     };
> >      > +
> >      >                       dcmi_pins: dcmi-0 {
> >      >                               pins {
> >      >                                       pinmux =3D <STM32_PINMUX('=
A',
> >     4, AF13)>, /* DCMI_HSYNC */
> >      > diff --git a/arch/arm/boot/dts/stm32f429-disco.dts
> >     b/arch/arm/boot/dts/stm32f429-disco.dts
> >      > index 30c0f67..55eed05 100644
> >      > --- a/arch/arm/boot/dts/stm32f429-disco.dts
> >      > +++ b/arch/arm/boot/dts/stm32f429-disco.dts
> >      > @@ -49,6 +49,8 @@
> >      >   #include "stm32f429.dtsi"
> >      >   #include "stm32f429-pinctrl.dtsi"
> >      >   #include <dt-bindings/input/input.h>
> >      > +#include <dt-bindings/interrupt-controller/irq.h>
> >      > +#include <dt-bindings/gpio/gpio.h>
> >      >
> >      >   / {
> >      >       model =3D "STMicroelectronics STM32F429i-DISCO board";
> >      > @@ -98,6 +100,14 @@
> >      >               regulator-name =3D "vcc5_host1";
> >      >               regulator-always-on;
> >      >       };
> >      > +
> >      > +     reg_3p3v: regulator-3p3v {
> >
> >     3p3 ?
> >
> >
> > *yes, the mfd stmpe driver need vcc & vio regulator, st sensor core
> > driver need vddio & vdd*
>
> I talked about the name. Somthing vdd_3v3 would be better. See how it is
> done in other stm32fx platform
>
> Okay, will change to vdd_3v3


> >
> >      > +             compatible =3D "regulator-fixed";
> >      > +             regulator-name =3D "3P3V";
> >      > +             regulator-min-microvolt =3D <3300000>;
> >      > +             regulator-max-microvolt =3D <3300000>;
> >      > +             regulator-always-on;
> >      > +     };
> >      >   };
> >      >
> >      >   &clk_hse {
> >      > @@ -127,3 +137,81 @@
> >      >       pinctrl-names =3D "default";
> >      >       status =3D "okay";
> >      >   };
> >      > +
> >      > +&ltdc {
> >      > +     status =3D "okay";
> >      > +     pinctrl-0 =3D <&ltdc_pins_f429_disco>;
> >      > +     pinctrl-names =3D "default";
> >      > +
> >      > +     port {
> >      > +             ltdc_out_rgb: endpoint {
> >      > +                     remote-endpoint =3D <&panel_in_rgb>;
> >      > +             };
> >      > +     };
> >      > +};
> >      > +
> >      > +&spi5 {
> >      > +     status =3D "okay";
> >      > +     pinctrl-0 =3D <&spi5_pins>;
> >      > +     pinctrl-names =3D "default";
> >      > +     #address-cells =3D <1>;
> >      > +     #size-cells =3D <0>;
> >      > +     cs-gpios =3D <&gpioc 1 GPIO_ACTIVE_LOW>,<&gpioc 2
> >     GPIO_ACTIVE_LOW>;
> >      > +     dmas =3D <&dma2 3 2 0x400 0x0>,
> >      > +            <&dma2 4 2 0x400 0x0>;
> >      > +     dma-names =3D "rx", "tx";
> >      > +     l3gd20: l3gd20@0 {
> >      > +             compatible =3D "st,l3gd20-gyro";
> >      > +             spi-max-frequency =3D <10000000>;
> >      > +             st,drdy-int-pin =3D <2>;
> >      > +             interrupt-parent =3D <&gpioa>;
> >      > +             interrupts =3D <1 IRQ_TYPE_EDGE_RISING>,
> >      > +                             <2 IRQ_TYPE_EDGE_RISING>;
> >      > +             reg =3D <0>;
> >      > +             vddio =3D <&reg_3p3v>;
> >      > +             vdd =3D <&reg_3p3v>;
> >      > +             status =3D "okay";
> >      > +     };
> >      > +     display: display@1{
> >      > +             /* Connect panel-ilitek-9341 to ltdc */
> >      > +             compatible =3D "stm32f429-disco,ltdc-panel",
> >     "ilitek,ili9341";
> >      > +             reg =3D <1>;
> >      > +             spi-3wire;
> >      > +             spi-max-frequency =3D <10000000>;
> >      > +             dc-gpios =3D <&gpiod 13 0>;
> >      > +             port {
> >      > +                     panel_in_rgb: endpoint {
> >      > +                     remote-endpoint =3D <&ltdc_out_rgb>;
> >      > +                     };
> >      > +             };
> >      > +     };
> >      > +};
> >      > +
> >      > +&i2c3 {
> >
> >     Nodes are have to be ordered
> >
> > *sorry, a little confused, i2c-3 is used by stmpe811 driver*
>
 please give more information here, thanks.

> >
> >
> >      > +     pinctrl-names =3D "default";
> >      > +     pinctrl-0 =3D <&i2c3_pins>;
> >      > +     status =3D "okay";
> >      > +
> >      > +     touch: stmpe811@41 {
> >      > +             compatible =3D "st,stmpe811";
> >      > +             reg =3D <0x41>;
> >      > +             interrupts =3D <15 IRQ_TYPE_EDGE_FALLING>;
> >      > +             interrupt-parent =3D <&gpioa>;
> >      > +             vio =3D <&reg_3p3v>;
> >      > +             vcc =3D <&reg_3p3v>;
> >      > +             status =3D "okay";
> >      > +
> >      > +             stmpe_touchscreen {
> >      > +                     compatible =3D "st,stmpe-ts";
> >      > +                     st,sample-time =3D <4>;
> >      > +                     st,mod-12b =3D <1>;
> >      > +                     st,ref-sel =3D <0>;
> >      > +                     st,adc-freq =3D <1>;
> >      > +                     st,ave-ctrl =3D <1>;
> >      > +                     st,touch-det-delay =3D <2>;
> >      > +                     st,settling =3D <2>;
> >      > +                     st,fraction-z =3D <7>;
> >      > +                     st,i-drive =3D <1>;
> >      > +             };
> >      > +     };
> >      > +};
> >      > diff --git a/arch/arm/boot/dts/stm32f429.dtsi
> >     b/arch/arm/boot/dts/stm32f429.dtsi
> >      > index d777069..257b843 100644
> >      > --- a/arch/arm/boot/dts/stm32f429.dtsi
> >      > +++ b/arch/arm/boot/dts/stm32f429.dtsi
> >      > @@ -402,6 +402,18 @@
> >
> >     Split Soc updates in a separate patch
> >
> > *okay, will do it later*
> >
> >      >                       status =3D "disabled";
> >      >               };
> >      >
> >      > +             i2c3: i2c@40005c00 {
> >      > +                     compatible =3D "st,stm32f4-i2c";
> >      > +                     reg =3D <0x40005c00 0x400>;
> >      > +                     interrupts =3D <72>,
> >      > +                                  <73>;
> >      > +                     resets =3D <&rcc STM32F4_APB1_RESET(I2C3)>=
;
> >      > +                     clocks =3D <&rcc 0 STM32F4_APB1_CLOCK(I2C3=
)>;
> >      > +                     #address-cells =3D <1>;
> >      > +                     #size-cells =3D <0>;
> >      > +                     status =3D "disabled";
> >      > +             };
> >      > +
> >      >               dac: dac@40007400 {
> >      >                       compatible =3D "st,stm32f4-dac-core";
> >      >                       reg =3D <0x40007400 0x400>;
> >      >
> >
>

--0000000000002b0ace05a4a2a823
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSBBbGV4YW5kcmUsPC9kaXY+PGJyPjxkaXYgY2xhc3M9Imdt
YWlsX3F1b3RlIj48ZGl2IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+QWxleGFuZHJlIFRv
cmd1ZSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFsZXhhbmRyZS50b3JndWVAc3QuY29tIj5hbGV4YW5k
cmUudG9yZ3VlQHN0LmNvbTwvYT4mZ3Q7IOS6jjIwMjDlubQ05pyIMzDml6Xlkajlm5sg5LiL5Y2I
Nzo0NeWGmemBk++8mjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0
eWxlPSJtYXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigy
MDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+PGJyPg0KPGJyPg0KT24gNC8zMC8yMCAxMjoy
NiBQTSwgZGlsbG9uIG1pbiB3cm90ZTo8YnI+DQomZ3Q7IEhpIEFsZXhhbmRyZSw8YnI+DQomZ3Q7
IDxicj4NCiZndDsgQWxleGFuZHJlIFRvcmd1ZSAmbHQ7PGEgaHJlZj0ibWFpbHRvOmFsZXhhbmRy
ZS50b3JndWVAc3QuY29tIiB0YXJnZXQ9Il9ibGFuayI+YWxleGFuZHJlLnRvcmd1ZUBzdC5jb208
L2E+IDxicj4NCiZndDsgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86YWxleGFuZHJlLnRvcmd1
ZUBzdC5jb20iIHRhcmdldD0iX2JsYW5rIj5hbGV4YW5kcmUudG9yZ3VlQHN0LmNvbTwvYT4mZ3Q7
Jmd0OyDkuo4yMDIw5bm0NOaciDMw5pel5ZGo5ZubIOS4i+WNiDU6NTflhpnpgZPvvJo8YnI+DQom
Z3Q7IDxicj4NCiZndDvCoCDCoCDCoEhpPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqBPbiA0
LzMwLzIwIDExOjQzIEFNLCA8YSBocmVmPSJtYWlsdG86ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20i
IHRhcmdldD0iX2JsYW5rIj5kaWxsb24ubWluZmVpQGdtYWlsLmNvbTwvYT48YnI+DQomZ3Q7wqAg
wqAgwqAmbHQ7bWFpbHRvOjxhIGhyZWY9Im1haWx0bzpkaWxsb24ubWluZmVpQGdtYWlsLmNvbSIg
dGFyZ2V0PSJfYmxhbmsiPmRpbGxvbi5taW5mZWlAZ21haWwuY29tPC9hPiZndDsgd3JvdGU6PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsgRnJvbTogZGlsbG9uIG1pbiAmbHQ7PGEgaHJlZj0ibWFpbHRv
OmRpbGxvbi5taW5mZWlAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+ZGlsbG9uLm1pbmZlaUBn
bWFpbC5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86
ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5kaWxsb24ubWluZmVpQGdt
YWlsLmNvbTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgU2lnbmVkLW9mZi1ieTogZGlsbG9uIG1pbiAmbHQ7PGEgaHJlZj0ibWFpbHRvOmRp
bGxvbi5taW5mZWlAZ21haWwuY29tIiB0YXJnZXQ9Il9ibGFuayI+ZGlsbG9uLm1pbmZlaUBnbWFp
bC5jb208L2E+PGJyPg0KJmd0O8KgIMKgIMKgJmx0O21haWx0bzo8YSBocmVmPSJtYWlsdG86ZGls
bG9uLm1pbmZlaUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIj5kaWxsb24ubWluZmVpQGdtYWls
LmNvbTwvYT4mZ3Q7Jmd0Ozxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgQ29tbWl0IHRpdGxl
IHNob3VsZCBiZSBBUk06IGR0czogc3RtMzI6IGJsYSBibGEgb24gc3RtMzJmNDI5IGFuZCBwbGVh
c2U8YnI+DQomZ3Q7wqAgwqAgwqBhIGNvbW1pdCBtZXNzYWdlLjxicj4NCiZndDsgPGJyPg0KJmd0
OyA8YnI+DQomZ3Q7ICpva2F5LCB0aGFua3MgZm9yIHlvdXIgcXVpY2t5IHJlc3BvbnNlLCB0aGlz
IGlzIG15IGZpcnN0IGtlcm5lbCBwdWxsIDxicj4NCiZndDsgcmVxdWVzdCwgaSB3aWxsIHJlc3Vi
bWl0IGFsbCBwYXRjaHNldHMgZm9sbG93aW5nIHRoZSBoaXN0b3J5IHN1Ym1pdHMgPGJyPg0KJmd0
OyBzdHlsZSB3aG8gd2FzIGRpZC4qPGJyPg0KPGJyPg0Kb2sgbm8gcGIuIEluIGdlbmVyYWwgd2F5
IHlvdSBoYXZlIHRvIGV4ZWN1dGUgLi9zY3JpcHRzLzxhIGhyZWY9Imh0dHA6Ly9jaGVja3BhdGNo
LnBsIiByZWw9Im5vcmVmZXJyZXIiIHRhcmdldD0iX2JsYW5rIj5jaGVja3BhdGNoLnBsPC9hPiB0
byA8YnI+DQpjaGVjayBzb21lIHN0eWxlIGVycm9ycyBiZWZvcmUgc2VuZGluZy4gVXNlIC4vc2Ny
aXB0cy88YSBocmVmPSJodHRwOi8vZ2V0X21haW50YWluZXIucGwiIHJlbD0ibm9yZWZlcnJlciIg
dGFyZ2V0PSJfYmxhbmsiPmdldF9tYWludGFpbmVyLnBsPC9hPiA8YnI+DQp0byBzZWUgdG8gd2hv
IHlvdSBoYXZlIHRvIHNlbmQgdGhlIHBhdGNoLiBXaGVuIHlvdSBoYXZlIHNldmVyYWwgcGF0Y2hl
cyA8YnI+DQppbiBhIHNlcmllcywgeW91IG5lZWQgdG8gaGF2ZSBhIGNvdmVyLWxldHRlciB3aGlj
aCBleHBsYWlucyB0aGUgYWltIG9mIDxicj4NCnlvdXIgc2VyaWVzLiBUbyBoYXZlIGFuIGlkZWEg
b2YgY29tbWl0IGZvcm1hdCBqdXN0IHVzZSBnaXQgbG9nIG9uIHRoZSA8YnI+DQpmaWxlIGNoYW5n
ZWQgdG8gc2VlIGhvdyBwcmV2aW91cyBhY2NlcHRlZCBjb21taSBoYXZlIGJlZW4gd3JpdHRlbi48
YnI+DQo8YnI+DQpNb3JlIGRldGFpbHMgaGVyZTogRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1p
dHRpbmctcGF0Y2hlcy5yc3Q8YnI+DQo8YnI+PC9ibG9ja3F1b3RlPjxkaXY+b2theSwgdGhhbmtz
IGFsZXhhbmRyZSwgaSB3aWxsIGdvIHRocm91Z2ggdGhlc2UgZG9jcy4gY3VycmVudGx5IGkmIzM5
O20gb24gbWF5IGRheSBob2xpZGF5LMKgIHdpbGwgYmUgYmFjayBhdMKgIG5leHQgd2Vuc2RheS7C
oDwvZGl2PjxkaXY+YWZ0ZXIgZ28gYmFjayB0byB3b3JrLiBpIHdpbGwgc2VwYXJhdGUgdGhpcyBw
YXRjaCB0byBmaXZlIHBhcnQgd2l0aCA5IHBhdGNocyAsIHNob3VsZCBiZSBtb3JlIGNsZWFyPC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj5kdHMgcmVsZWF0ZWQ8L2Rpdj48ZGl2PsKgIMKgIDEswqAg
QVJNOiBkdHM6IHN0bTMyOiBBZGQgaTJjMyBub2RlIGZvciBzdG0zMmY0Mjk8L2Rpdj48ZGl2PsKg
IMKgIDIswqAgQVJNOiBkdHM6IHN0bTMyOiBBZGQgZHJtIHBhbmVsIGlsaTkzNDEgbm9kZXMgY29u
bmVjdCB0byBsZHRjIHN1cHBvcnQgZm9yIHN0bTMyZjQyOS1kaXNjbyBib2FyZDwvZGl2PjxkaXY+
wqAgwqAgMyzCoCBBUk06IGR0czogc3RtMzI6IEFkZCBzdG1wZTgxMSB0b3VjaCBzY3JlZW4gc3Vw
cG9ydCBmb3Igc3RtMzJmNDI5LWRpc2NvIGJvYXJkPC9kaXY+PGRpdj7CoCDCoCA0LMKgIEFSTTog
ZHRzOiBzdG0zMjogQWRkIGwzZ2QyMCBneXJvc2NvcGUgc2Vuc29yIHN1cHBvcnQgZm9yIHN0bTMy
ZjQyOS1kaXNjbyBib2FyZDwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+Y2xrIHJlbGVhdGVkPC9k
aXY+PGRpdj7CoCDCoCAxLCBjbGs6IHN0bTMyOiBGaXggbHRkYyBsb2FkaW5nIGhhbmcgaW4gc2V0
IGNsayByYXRlLCBwbGxfaHcgc2V0IHRvIGNsa3NbUExMX1ZDT19TQUldIGJ1dCBub3QgY2xrc1tQ
TExfU0FJXTwvZGl2PjxkaXY+wqAgwqAgMiwgY2xrOiBzdG0zMjogQWRkIENMS19JR05PUkVfVU5V
U0VEIGZsYWdzIGZvciBsdGRjLCBtYWtlIHN1cmUgbHRkYyBjbGsgbm90IGJlIHJlbGVhc2VkIGFm
dGVyIHN5c3RlbSBzdGFydHVwPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5zcGkgcmVsZWF0ZWQ8
L2Rpdj48ZGl2PsKgIMKgIDEsIHNwaTogc3RtMzI6IEFkZCB0cmFuc2ZlciBtb2RlIFNQSV9TSU1Q
TEVfUlgsIFNQSV8zV0lSRV9SWCBzdXBwb3J0IGZvciBzdG0zMmY0PC9kaXY+PGRpdj48YnI+PC9k
aXY+PGRpdj5kcm0gcmVsZWF0ZWQ8L2Rpdj48ZGl2PsKgIMKgIDEsIGRybS9wYW5lbDogQWRkIHBh
bmVsIGRyaXZlciBpbGl0ZWstaWxpOTM0McKgPC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj5kb2Mg
cmVsZWF0ZWQ8L2Rpdj48ZGl2PsKgIMKgIMKgMSwgZHQtYmluZGluZ3M6IGRpc3BsYXk6IHBhbmVs
OiBBZGQgYmluZGluZyBkb2N1bWVudCBmb3IgSWxpdGVrIElsaTkzNDE8L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PlRPRE86PC9kaXY+PGRpdj5sdGRjIHdhcyB2ZXJpZmllZCBieSBmYmNvbitsb2dv
LCB1bmFtZSAtYSAmZ3Q7IC9kZXYvdHR5MCAsIG5lZWQgbW9yZSB0aW1lIHRvIHdyaXRlIHRlc3Qg
Y29kZSB3aXRoIGxpYmRybSB0byB2ZXJpZnkgb3NkPC9kaXY+PGRpdj5zdG1wZTgxMSBuZWVkIGNy
b3NzIGNvbXBpbGUgdHNsaWIgdG8gZG8gdG91Y2ggc2NyZWVuIGNhbGlicmF0aW9uPC9kaXY+PGRp
dj5sM2dkMjAgd2FzIHRlc3RlZCBieSByZWFkIGRhdGEgZnJvbSAvc3lzL2J1cy9paW8sIG5lZWQg
Y3Jvc3MgY29tcGlsZSBsaWJpaW8gdG8gYmUgdmVyaWZpZWQgYnkgYXBwbGljYXRpb24gd2l0aCBs
aWJpaW88L2Rpdj48ZGl2PmFkZCBkbWEyZCB0byBsdGRjIGRyaXZlciB0byBzcGVlZCB1cCBncmFw
aGljIHJlbmRlcjwvZGl2PjxkaXY+ZGNtaSBjYW1lcmEgd2l0aCBvdjU2NDAsIHRoZSBzZHJhbSBt
aWdodCBiZSBub3QgZW5vdWdoIHRvIHN1cHBvcnQgdGhpcy4gY3VycmVudGx5IGFmdGVyIHpJbWFn
ZSBsb2FkIHRvIHNkcmFtLDwvZGl2PjxkaXY+anVzdCBsZWF2ZSBsZXNzIHRoYW4gMk0gYnl0ZXMg
Zm9yIGFwcGxpY2F0aW9uLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJn
bWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDox
cHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCiZndDsgPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgLS0tPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoC4uLi9iaW5k
aW5ncy9kaXNwbGF5L3BhbmVsL2lsaXRlayxpbGk5MzQxLnR4dMKgIMKgIMKgIHwgNDIgKysrKysr
KysrKys8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJm
NC1waW5jdHJsLmR0c2nCoCDCoCDCoCDCoCDCoCDCoCDCoHwgNzk8YnI+DQomZ3Q7wqAgwqAgwqAr
KysrKysrKysrKysrKysrKysrPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoGFyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMyZjQyOS1kaXNjby5kdHPCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDg4PGJyPg0K
Jmd0O8KgIMKgIMKgKysrKysrKysrKysrKysrKysrKysrKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
wqAgwqBhcmNoL2FybS9ib290L2R0cy9zdG0zMmY0MjkuZHRzacKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfCAxMiArKys8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgNCBmaWxlcyBjaGFu
Z2VkLCAyMjEgaW5zZXJ0aW9ucygrKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqBjcmVhdGUg
bW9kZSAxMDA2NDQ8YnI+DQomZ3Q7wqAgwqAgwqBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9wYW5lbC9pbGl0ZWssaWxpOTM0MS50eHQ8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGRpZmYgLS1naXQ8YnI+DQomZ3Q7wqAgwqAgwqBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L3BhbmVsL2lsaXRlayxp
bGk5MzQxLnR4dDxicj4NCiZndDvCoCDCoCDCoGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvcGFuZWwvaWxpdGVrLGlsaTkzNDEudHh0PGJyPg0KJmd0OyA8YnI+DQom
Z3Q7wqAgwqAgwqBUaGlzIGJpbmRpbmcgZGVzY3JpcHRpb24gc2hvdWxkIGJlIGluIGEgc2VwYXJh
dGUgcGF0Y2ggYW5kIHlvdSBoYXZlIHRvPGJyPg0KJmd0O8KgIMKgIMKgd3JpdGUgaW4gWUFNTCBm
b3JtYXQuPGJyPg0KJmd0OyA8YnI+DQomZ3Q7ICpva2F5LCB3aWxsIGRvIGl0IGxhdGVyLiAqPGJy
Pg0KJmd0OyA8YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IG5ldyBmaWxlIG1vZGUg
MTAwNjQ0PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgaW5kZXggMDAwMDAwMC4uZjVhNGU1NTxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7IC0tLSAvZGV2L251bGw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
Kys8YnI+DQomZ3Q7wqAgwqAgwqBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L3BhbmVsL2lsaXRlayxpbGk5MzQxLnR4dDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IEBA
IC0wLDAgKzEsNDIgQEA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArSWxpdGVrIElMSTkzNDEgVEZU
IHBhbmVsIGRyaXZlciB3aXRoIFNQSSBjb250cm9sIGJ1czxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArVGhpcyBpcyBhIGRyaXZlciBmb3IgMjQweDMyMCBU
RlQgcGFuZWxzLCBhY2NlcHRpbmcgYSByZ2IgaW5wdXQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
c3RyZWFtcyB0aGF0IGdldCBhZGFwdGVkIGFuZCBzY2FsZWQgdG8gdGhlIHBhbmVsLjxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArUmVxdWlyZWQgcHJvcGVy
dGllczo8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgLSBjb21wYXRpYmxlOiAmcXVvdDtzdG0z
MmY0MjktZGlzY28sbHRkYy1wYW5lbCZxdW90OywgJnF1b3Q7aWxpdGVrLGlsaTkzNDEmcXVvdDs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgKGZ1bGwgc3lzdGVtLXNwZWNpZmljIGNvbXBh
dGlibGUgaXMgYWx3YXlzIHJlcXVpcmVkIHRvIGxvb2s8YnI+DQomZ3Q7wqAgwqAgwqB1cCBjb25m
aWd1cmF0aW9uKTxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCAtIHJlZzogYWRkcmVzcyBvZiB0
aGUgcGFuZWwgb24gdGhlIFNQSSBidXM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0
O8KgIMKgIMKgICZndDsgK09wdGlvbmFsIHByb3BlcnRpZXM6PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK8KgIC0gcmVzZXQtZ3Bpb3M6IGEgR1BJTyBzcGVjIGZvciB0aGUgcmVzZXQgcGluLCBzZWUg
Z3Bpby9ncGlvLnR4dDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCAtIGRjLWdwaW9zOiBhIEdQ
SU8gc3BlYyBmb3IgdGhlIGRjIHBpbiwgc2VlIGdwaW8vZ3Bpby50eHQ8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIFRoZSBmb2xsb3dpbmcgb3B0aW9u
YWwgcHJvcGVydGllcyBvbmx5IGFwcGx5IHRvIFJHQiBpbnB1dCBtb2RlOjxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgLSBwaXhlbGNsay1hY3RpdmU6
IHNlZSBkaXNwbGF5L3BhbmVsL2Rpc3BsYXktdGltaW5nLnR4dDxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCAtIGRlLWFjdGl2ZTogc2VlIGRpc3BsYXkvcGFuZWwvZGlzcGxheS10aW1pbmcudHh0
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIC0gaHN5bmMtYWN0aXZlOiBzZWUgZGlzcGxheS9w
YW5lbC9kaXNwbGF5LXRpbWluZy50eHQ8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgLSB2c3lu
Yy1hY3RpdmU6IHNlZSBkaXNwbGF5L3BhbmVsL2Rpc3BsYXktdGltaW5nLnR4dDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArVGhlIHBhbmVsIG11c3Qgb2Jl
eSB0aGUgcnVsZXMgZm9yIGEgU1BJIHNsYXZlIGRldmljZSBhcyBzcGVjaWZpZWQgaW48YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArc3BpL3NwaS1idXMudHh0PGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
Kzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICtUaGUgZGV2aWNlIG5vZGUgY2FuIGNvbnRhaW4gb25l
ICYjMzk7cG9ydCYjMzk7IGNoaWxkIG5vZGUgd2l0aCBvbmUgY2hpbGQ8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArJiMzOTtlbmRwb2ludCYjMzk7IG5vZGUsIGFjY29yZGluZyB0byB0aGUgYmluZGlu
Z3MgZGVmaW5lZCBpbjxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICttZWRpYS92aWRlby1pbnRlcmZh
Y2VzLnR4dC4gVGhpcyBub2RlIHNob3VsZCBkZXNjcmliZSBwYW5lbCYjMzk7czxicj4NCiZndDvC
oCDCoCDCoHZpZGVvIGJ1cy48YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgK0V4YW1wbGU6PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICtwYW5lbDogZGlzcGxheUAwIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAg
wqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7c3RtMzJmNDI5LWRpc2NvLGx0ZGMtcGFuZWwmcXVvdDss
ICZxdW90O2lsaXRlayxpbGk5MzQxJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoHJlZyA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqBzcGkt
M3dpcmU7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgc3BpLW1heC1mcmVxdWVuY3kg
PSAmbHQ7MTAwMDAwMDAmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoGRjLWdw
aW9zID0gJmx0OyZhbXA7Z3Bpb2QgMTMgMCZndDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIMKgcG9ydCB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
cGFuZWxfaW46IGVuZHBvaW50IHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqByZW1vdGUtZW5kcG9pbnQgPSAmbHQ7JmFtcDtkaXNwbGF5X291
dCZndDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqB9Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICt9
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9z
dG0zMmY0LXBpbmN0cmwuZHRzaTxicj4NCiZndDvCoCDCoCDCoGIvYXJjaC9hcm0vYm9vdC9kdHMv
c3RtMzJmNC1waW5jdHJsLmR0c2k8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBpbmRleCAzOTJmYTE0
Li40NWI2OGY0IDEwMDY0NDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IC0tLSBhL2FyY2gvYXJtL2Jv
b3QvZHRzL3N0bTMyZjQtcGluY3RybC5kdHNpPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKysrIGIv
YXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNC1waW5jdHJsLmR0c2k8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyBAQCAtMzE2LDYgKzMxNiw4NSBAQDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgbHRkY19waW5zX2Y0MjlfZGlzY286IGx0ZGMtMSB7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGlucyB7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGlubXV4ID0gJmx0O1NUTTMyX1BJTk1VWCgmIzM5O0Mm
IzM5Oyw8YnI+DQomZ3Q7wqAgwqAgwqA2LMKgIEFGMTQpJmd0Oyw8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAvKiBMQ0RfSFNZTkMgKi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmx0O1NUTTMyX1BJTk1VWCgmIzM5O0EmIzM5Oyw8YnI+DQomZ3Q7wqAgwqAg
wqA0LMKgIEFGMTQpJmd0Oyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyog
TENEX1ZTWU5DICovPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0z
Ml9QSU5NVVgoJiMzOTtHJiMzOTssPGJyPg0KJmd0O8KgIMKgIMKgNyzCoCBBRjE0KSZndDssPGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9DTEsgKi88YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0O1NUTTMyX1BJTk1VWCgmIzM5O0MmIzM5Oyw8
YnI+DQomZ3Q7wqAgwqAgwqAxMCwgQUYxNCkmZ3Q7LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCAvKiBMQ0RfUjIgKi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgJmx0O1NUTTMyX1BJTk1VWCgmIzM5O0ImIzM5Oyw8YnI+DQomZ3Q7wqAgwqAgwqAwLMKgIEFG
OSkmZ3Q7LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0RfUjMgKi88
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0O1NUTTMyX1BJTk1VWCgmIzM5
O0EmIzM5Oyw8YnI+DQomZ3Q7wqAgwqAgwqAxMSwgQUYxNCkmZ3Q7LDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0RfUjQgKi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmx0O1NUTTMyX1BJTk1VWCgmIzM5O0EmIzM5Oyw8YnI+DQomZ3Q7wqAgwqAg
wqAxMiwgQUYxNCkmZ3Q7LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBM
Q0RfUjUgKi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0O1NUTTMyX1BJ
Tk1VWCgmIzM5O0ImIzM5Oyw8YnI+DQomZ3Q7wqAgwqAgwqAxLMKgIEFGOSkmZ3Q7LDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0RfUjYqLzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7U1RNMzJfUElOTVVYKCYjMzk7RyYjMzk7LDxicj4NCiZn
dDvCoCDCoCDCoDYswqAgQUYxNCkmZ3Q7LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCAvKiBMQ0RfUjcgKi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0
O1NUTTMyX1BJTk1VWCgmIzM5O0EmIzM5Oyw8YnI+DQomZ3Q7wqAgwqAgwqA2LMKgIEFGMTQpJmd0
Oyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogTENEX0cyICovPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtHJiMz
OTssPGJyPg0KJmd0O8KgIMKgIMKgMTAsIEFGOSkmZ3Q7LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCAvKiBMQ0RfRzMgKi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgJmx0O1NUTTMyX1BJTk1VWCgmIzM5O0ImIzM5Oyw8YnI+DQomZ3Q7wqAgwqAgwqAxMCwg
QUYxNCkmZ3Q7LDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0RfRzQg
Ki88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0O1NUTTMyX1BJTk1VWCgm
IzM5O0QmIzM5Oyw8YnI+DQomZ3Q7wqAgwqAgwqA2LMKgIEFGMTQpJmd0Oyw8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogTENEX0IyICovPGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtHJiMzOTssPGJyPg0KJmd0O8Kg
IMKgIMKgMTEsIEFGMTQpJmd0Oyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
LyogTENEX0IzKi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0O1NUTTMy
X1BJTk1VWCgmIzM5O0ImIzM5Oyw8YnI+DQomZ3Q7wqAgwqAgwqAxMSwgQUYxNCkmZ3Q7LDxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0RfRzUgKi88YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0O1NUTTMyX1BJTk1VWCgmIzM5O0MmIzM5Oyw8YnI+
DQomZ3Q7wqAgwqAgwqA3LMKgIEFGMTQpJmd0Oyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgLyogTENEX0c2ICovPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtEJiMzOTssPGJyPg0KJmd0O8KgIMKgIMKgMyzCoCBBRjE0
KSZndDssPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9HNyAqLzxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7U1RNMzJfUElOTVVYKCYjMzk7
RyYjMzk7LDxicj4NCiZndDvCoCDCoCDCoDEyLCBBRjkpJmd0Oyw8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgLyogTENEX0I0ICovPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtBJiMzOTssPGJyPg0KJmd0O8KgIMKgIMKg
MyzCoCBBRjE0KSZndDssPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExD
RF9CNSAqLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7U1RNMzJfUElO
TVVYKCYjMzk7QiYjMzk7LDxicj4NCiZndDvCoCDCoCDCoDgswqAgQUYxNCkmZ3Q7LDxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0RfQjYgKi88YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0O1NUTTMyX1BJTk1VWCgmIzM5O0ImIzM5Oyw8YnI+DQom
Z3Q7wqAgwqAgwqA5LMKgIEFGMTQpJmd0Oyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgLyogTENEX0I3ICovPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZs
dDtTVE0zMl9QSU5NVVgoJiMzOTtGJiMzOTssPGJyPg0KJmd0O8KgIMKgIMKgMTAsIEFGMTQpJmd0
Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogTENEX0RFICovPGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgc2xldy1yYXRlID0gJmx0OzImZ3Q7Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjM19waW5zOiBpMmMzLTAgezxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBp
bnMgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbm11eCA9ICZsdDtTVE0zMl9QSU5NVVgoJiMz
OTtDJiMzOTssPGJyPg0KJmd0O8KgIMKgIMKgOSwgQUY0KSZndDssPGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgLyogSTJDM19TREEgKi88YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgJmx0O1NUTTMyX1BJTk1VWCgmIzM5O0EmIzM5Oyw8YnI+DQomZ3Q7wqAgwqAg
wqA4LCBBRjQpJmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBJMkMz
X1NDTCAqLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGJpYXMtZGlzYWJsZTs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBkcml2ZS1vcGVuLWRyYWluOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHNsZXct
cmF0ZSA9ICZsdDszJmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
Kzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oHNwaTVfcGluczogc3BpNS0wIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5zMSB7PGJyPg0KJmd0O8KgIMKgIMKg
ICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgcGlubXV4ID0gJmx0O1NUTTMyX1BJTk1VWCgmIzM5O0YmIzM5Oyw8YnI+DQomZ3Q7wqAg
wqAgwqA3LCBBRjUpJmd0Oyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBT
UEk1X0NMSyAqLzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7U1RNMzJf
UElOTVVYKCYjMzk7RiYjMzk7LDxicj4NCiZndDvCoCDCoCDCoDksIEFGNSkmZ3Q7Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIFNQSTVfTU9TSSAqLzxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoGJpYXMtZGlzYWJsZTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkcml2ZS1wdXNo
LXB1bGw7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2xldy1yYXRlID0gJmx0OzAmZ3Q7Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoH07PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgcGluczIgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbm11
eCA9ICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtGJiMzOTssPGJyPg0KJmd0O8KgIMKgIMKgOCwgQUY1
KSZndDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgLyogU1BJNV9NSVNPICov
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYmlhcy1kaXNhYmxlOzxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0K
Jmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGRjbWlfcGluczogZGNtaS0wIHs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGlu
cyB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbm11eCA9ICZsdDtTVE0zMl9QSU5NVVgoJiMz
OTtBJiMzOTssPGJyPg0KJmd0O8KgIMKgIMKgNCwgQUYxMykmZ3Q7LCAvKiBEQ01JX0hTWU5DICov
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
bTMyZjQyOS1kaXNjby5kdHM8YnI+DQomZ3Q7wqAgwqAgwqBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0
bTMyZjQyOS1kaXNjby5kdHM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyBpbmRleCAzMGMwZjY3Li41
NWVlZDA1IDEwMDY0NDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7IC0tLSBhL2FyY2gvYXJtL2Jvb3Qv
ZHRzL3N0bTMyZjQyOS1kaXNjby5kdHM8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArKysgYi9hcmNo
L2FybS9ib290L2R0cy9zdG0zMmY0MjktZGlzY28uZHRzPGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
QEAgLTQ5LDYgKzQ5LDggQEA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgI2luY2x1ZGUgJnF1
b3Q7c3RtMzJmNDI5LmR0c2kmcXVvdDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgI2luY2x1
ZGUgJnF1b3Q7c3RtMzJmNDI5LXBpbmN0cmwuZHRzaSZxdW90Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7wqAgwqAjaW5jbHVkZSAmbHQ7ZHQtYmluZGluZ3MvaW5wdXQvaW5wdXQuaCZndDs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArI2luY2x1ZGUgJmx0O2R0LWJpbmRpbmdzL2ludGVycnVwdC1jb250
cm9sbGVyL2lycS5oJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICsjaW5jbHVkZSAmbHQ7ZHQt
YmluZGluZ3MvZ3Bpby9ncGlvLmgmZ3Q7PGJyPg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgLyB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoG1v
ZGVsID0gJnF1b3Q7U1RNaWNyb2VsZWN0cm9uaWNzIFNUTTMyRjQyOWktRElTQ08gYm9hcmQmcXVv
dDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgQEAgLTk4LDYgKzEwMCwxNCBAQDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItbmFtZSA9ICZxdW90
O3ZjYzVfaG9zdDEmcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHJlZ3VsYXRvci1hbHdheXMtb247PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoCDC
oCDCoH07PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvC
oCDCoCDCoHJlZ18zcDN2OiByZWd1bGF0b3ItM3AzdiB7PGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAg
wqAgwqAzcDMgPzxicj4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7ICp5ZXMsIHRoZSBtZmQg
c3RtcGUgZHJpdmVyIG5lZWQgdmNjICZhbXA7IHZpb8KgcmVndWxhdG9yLCBzdCBzZW5zb3IgY29y
ZSA8YnI+DQomZ3Q7IGRyaXZlciBuZWVkIHZkZGlvICZhbXA7IHZkZCo8YnI+DQo8YnI+DQpJIHRh
bGtlZCBhYm91dCB0aGUgbmFtZS4gU29tdGhpbmcgdmRkXzN2MyB3b3VsZCBiZSBiZXR0ZXIuIFNl
ZSBob3cgaXQgaXMgPGJyPg0KZG9uZSBpbiBvdGhlciBzdG0zMmZ4IHBsYXRmb3JtPGJyPg0KPGJy
PjwvYmxvY2txdW90ZT48ZGl2Pk9rYXksIHdpbGwgY2hhbmdlIHRvIHZkZF8zdjM8L2Rpdj48ZGl2
PsKgPC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBw
eCAwcHggMHB4IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3Bh
ZGRpbmctbGVmdDoxZXgiPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7cmVndWxhdG9yLWZpeGVkJnF1b3Q7Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1uYW1lID0g
JnF1b3Q7M1AzViZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqByZWd1bGF0b3ItbWluLW1pY3Jvdm9sdCA9ICZsdDszMzAwMDAwJmd0Ozs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItbWF4LW1pY3Jvdm9s
dCA9ICZsdDszMzAwMDAwJmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqByZWd1bGF0b3ItYWx3YXlzLW9uOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoH07PGJyPg0KJmd0O8KgIMKgIMKgICZndDvCoCDCoH07PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgJmFtcDtjbGtfaHNlIHs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyBAQCAtMTI3LDMgKzEzNyw4MSBAQDxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAg
wqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0O8KgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0O8KgIMKgfTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgKyZhbXA7bHRkYyB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKg
c3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
wqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtsdGRjX3BpbnNfZjQyOV9kaXNjbyZndDs7PGJyPg0KJmd0
O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgcGluY3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVv
dDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoHBvcnQgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGx0
ZGNfb3V0X3JnYjogZW5kcG9pbnQgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlbW90ZS1lbmRwb2ludCA9ICZsdDsmYW1wO3BhbmVsX2lu
X3JnYiZndDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgfTs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqB9Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICt9Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArJmFt
cDtzcGk1IHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtv
a2F5JnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoHBpbmN0cmwtMCA9ICZs
dDsmYW1wO3NwaTVfcGlucyZndDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgcGlu
Y3RybC1uYW1lcyA9ICZxdW90O2RlZmF1bHQmcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgI2FkZHJlc3MtY2VsbHMgPSAmbHQ7MSZndDs7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIMKgI3NpemUtY2VsbHMgPSAmbHQ7MCZndDs7PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK8KgIMKgIMKgY3MtZ3Bpb3MgPSAmbHQ7JmFtcDtncGlvYyAxIEdQSU9fQUNUSVZFX0xPVyZn
dDssJmx0OyZhbXA7Z3Bpb2MgMjxicj4NCiZndDvCoCDCoCDCoEdQSU9fQUNUSVZFX0xPVyZndDs7
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgZG1hcyA9ICZsdDsmYW1wO2RtYTIgMyAy
IDB4NDAwIDB4MCZndDssPGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
ICZsdDsmYW1wO2RtYTIgNCAyIDB4NDAwIDB4MCZndDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
K8KgIMKgIMKgZG1hLW5hbWVzID0gJnF1b3Q7cngmcXVvdDssICZxdW90O3R4JnF1b3Q7Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoGwzZ2QyMDogbDNnZDIwQDAgezxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtzdCxs
M2dkMjAtZ3lybyZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqBzcGktbWF4LWZyZXF1ZW5jeSA9ICZsdDsxMDAwMDAwMCZndDs7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgc3QsZHJkeS1pbnQtcGluID0gJmx0OzImZ3Q7
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdC1w
YXJlbnQgPSAmbHQ7JmFtcDtncGlvYSZndDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgaW50ZXJydXB0cyA9ICZsdDsxIElSUV9UWVBFX0VER0VfUklTSU5HJmd0
Oyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAmbHQ7MiBJUlFfVFlQRV9FREdFX1JJU0lORyZndDs7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmVnID0gJmx0OzAmZ3Q7Ozxicj4NCiZn
dDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHZkZGlvID0gJmx0OyZhbXA7cmVn
XzNwM3YmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHZk
ZCA9ICZsdDsmYW1wO3JlZ18zcDN2Jmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoH07PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgZGlzcGxh
eTogZGlzcGxheUAxezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oC8qIENvbm5lY3QgcGFuZWwtaWxpdGVrLTkzNDEgdG8gbHRkYyAqLzxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtzdG0zMmY0Mjkt
ZGlzY28sbHRkYy1wYW5lbCZxdW90Oyw8YnI+DQomZ3Q7wqAgwqAgwqAmcXVvdDtpbGl0ZWssaWxp
OTM0MSZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZWcgPSAmbHQ7MSZndDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgc3BpLTN3aXJlOzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oHNwaS1tYXgtZnJlcXVlbmN5ID0gJmx0OzEwMDAwMDAwJmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBkYy1ncGlvcyA9ICZsdDsmYW1wO2dwaW9kIDEzIDAm
Z3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHBvcnQgezxi
cj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBh
bmVsX2luX3JnYjogZW5kcG9pbnQgezxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlbW90ZS1lbmRwb2ludCA9ICZsdDsmYW1wO2x0ZGNfb3V0
X3JnYiZndDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9
Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoH07PGJyPg0KJmd0O8KgIMKgIMKgICZn
dDsgK307PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICsm
YW1wO2kyYzMgezxicj4NCiZndDsgPGJyPg0KJmd0O8KgIMKgIMKgTm9kZXMgYXJlIGhhdmUgdG8g
YmUgb3JkZXJlZDxicj4NCiZndDsgPGJyPg0KJmd0OyAqc29ycnksIGEgbGl0dGxlIGNvbmZ1c2Vk
LCBpMmMtMyBpcyB1c2VkIGJ5IHN0bXBlODExIGRyaXZlcio8YnI+PC9ibG9ja3F1b3RlPjxkaXY+
wqBwbGVhc2UgZ2l2ZSBtb3JlIGluZm9ybWF0aW9uIGhlcmUsIHRoYW5rcy7CoDwvZGl2PjxibG9j
a3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4IDBweCAwLjhl
eDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5nLWxlZnQ6MWV4
Ij4NCiZndDsgPGJyPg0KJmd0OyA8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqBwaW5j
dHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqBwaW5jdHJsLTAgPSAmbHQ7JmFtcDtpMmMzX3BpbnMmZ3Q7Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoHRvdWNoOiBzdG1w
ZTgxMUA0MSB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgY29t
cGF0aWJsZSA9ICZxdW90O3N0LHN0bXBlODExJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDQxJmd0Ozs8YnI+DQomZ3Q7wqAgwqAg
wqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBpbnRlcnJ1cHRzID0gJmx0OzE1IElSUV9UWVBF
X0VER0VfRkFMTElORyZndDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgaW50ZXJydXB0LXBhcmVudCA9ICZsdDsmYW1wO2dwaW9hJmd0Ozs8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB2aW8gPSAmbHQ7JmFtcDtyZWdfM3AzdiZn
dDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgdmNjID0gJmx0
OyZhbXA7cmVnXzNwM3YmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsg
Kzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHN0bXBlX3RvdWNo
c2NyZWVuIHs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7c3Qsc3RtcGUtdHMmcXVvdDs7PGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3Qsc2FtcGxlLXRp
bWUgPSAmbHQ7NCZndDs7PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgc3QsbW9kLTEyYiA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAg
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdCxyZWYtc2VsID0gJmx0OzAm
Z3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHN0LGFkYy1mcmVxID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0LGF2ZS1jdHJsID0gJmx0OzEmZ3Q7Ozxicj4N
CiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0LHRv
dWNoLWRldC1kZWxheSA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdCxzZXR0bGluZyA9ICZsdDsyJmd0Ozs8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdCxmcmFj
dGlvbi16ID0gJmx0OzcmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHN0LGktZHJpdmUgPSAmbHQ7MSZndDs7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyAr
wqAgwqAgwqB9Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICt9Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY0MjkuZHRzaTxicj4NCiZn
dDvCoCDCoCDCoGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNDI5LmR0c2k8YnI+DQomZ3Q7wqAg
wqAgwqAgJmd0OyBpbmRleCBkNzc3MDY5Li4yNTdiODQzIDEwMDY0NDxicj4NCiZndDvCoCDCoCDC
oCAmZ3Q7IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQyOS5kdHNpPGJyPg0KJmd0O8Kg
IMKgIMKgICZndDsgKysrIGIvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNDI5LmR0c2k8YnI+DQom
Z3Q7wqAgwqAgwqAgJmd0OyBAQCAtNDAyLDYgKzQwMiwxOCBAQDxicj4NCiZndDsgPGJyPg0KJmd0
O8KgIMKgIMKgU3BsaXQgU29jIHVwZGF0ZXMgaW4gYSBzZXBhcmF0ZSBwYXRjaDxicj4NCiZndDsg
PGJyPg0KJmd0OyAqb2theSwgd2lsbCBkbyBpdCBsYXRlcio8YnI+DQomZ3Q7IDxicj4NCiZndDvC
oCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBzdGF0dXMgPSAm
cXVvdDtkaXNhYmxlZCZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0O8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgfTs8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGkyYzM6IGkyY0A0MDAwNWMwMCB7PGJyPg0KJmd0O8KgIMKg
IMKgICZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZx
dW90O3N0LHN0bTMyZjQtaTJjJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDQwMDA1YzAwIDB4NDAwJmd0Ozs8
YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBp
bnRlcnJ1cHRzID0gJmx0OzcyJmd0Oyw8YnI+DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0OzczJmd0Ozs8YnI+
DQomZ3Q7wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXNl
dHMgPSAmbHQ7JmFtcDtyY2MgU1RNMzJGNF9BUEIxX1JFU0VUKEkyQzMpJmd0Ozs8YnI+DQomZ3Q7
wqAgwqAgwqAgJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjbG9ja3MgPSAm
bHQ7JmFtcDtyY2MgMCBTVE0zMkY0X0FQQjFfQ0xPQ0soSTJDMykmZ3Q7Ozxicj4NCiZndDvCoCDC
oCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCNhZGRyZXNzLWNlbGxz
ID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAm
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2Fi
bGVkJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH07
PGJyPg0KJmd0O8KgIMKgIMKgICZndDsgKzxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqBkYWM6IGRhY0A0MDAwNzQwMCB7PGJyPg0KJmd0O8KgIMKgIMKgICZndDvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtzdCxz
dG0zMmY0LWRhYy1jb3JlJnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCAmZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MHg0MDAwNzQwMCAweDQwMCZndDs7PGJy
Pg0KJmd0O8KgIMKgIMKgICZndDs8YnI+DQomZ3Q7IDxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj48
L2Rpdj4NCg==
--0000000000002b0ace05a4a2a823--

--===============0051595580==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0051595580==--
