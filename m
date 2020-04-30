Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A3F1C0E99
	for <lists+dri-devel@lfdr.de>; Fri,  1 May 2020 09:22:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 327426EA66;
	Fri,  1 May 2020 07:22:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161A56E351
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 12:54:11 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id j3so6337637ljg.8
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Apr 2020 05:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2qABQI/JvnzLkZL5themRLEiWyRXxKu4e6XGxzksH50=;
 b=aepsW+udM9AkxEjYxP6jg8wW9r4Q8SLIS35/0+H8/92y/Sii6mVHV7orsioDXN3r/A
 aMUkvSNUBYyCR5pVD/RArtBzwrf/5xXjdviPN5E9FFHqDLP5yPJtiMRugiB5XkfWYzQX
 6MfjgjEagH7Ox/XJrc9GOCHWE0I9KoGUg5OjTMD2oaaamsMFans9zcT9TRl8xGmR57oa
 UqSEtPsrx9ovW9Rf7i6DpslYa/SHYjjC3uuqXxqegWfcrVTBlffptEzBuAun0CtUEkYW
 HLjdHNBkYvAQmp6zxp/jBiO3YGhVNeMA0D4hCLqDS2nOb6At61+NkZUS95LMIOdk/07W
 /b2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2qABQI/JvnzLkZL5themRLEiWyRXxKu4e6XGxzksH50=;
 b=WiFCBsFpWqtDa1ufBEP9mOxK/q8FOkQtq4nipy1Y/4Ee/Mn+baR44QZjqufn0WzsZW
 E2BCyobrTizSurgSbWCpq7YjS1rTf4ahUmcN89OHiA2uuheYBL83aj/pgtDJWd8zYL+0
 Sigr8jUpIPLh1AsfVOMzuKFPM7/sEcsIXbXjtRXrRWB4/iJRuAjm3ExI5/juNuFlLXKM
 xt/sgvWGM9RJFlKs1wE2ogpiAY5DVcVCcMoWJXPhM/04cDSEP1GSvYAVoENCKw+BVrvf
 2SXR7n+XJxu3OzzjXFM/j9gboQ401wtHgAIZB81eHYHxMFz7XWzLI27mJYDQU/GvCmVt
 u9uw==
X-Gm-Message-State: AGi0PuYyQdPsyu6wDExz1ig4XiuQMuCl+elDzvSBwIKlmZNqq4P1FsEJ
 gYTGgGdB8QXOvtr2u4qr2IWUxahX3Zer+FCutjA=
X-Google-Smtp-Source: APiQypLs1UOYkv66RvQETjpMxWwJB0JBoMqlagJ9+gEl1xWKK7rBWFMCvfo9/LKqMS+C0I2a/Mq1B7WPvNs9eTu5He4=
X-Received: by 2002:a2e:8752:: with SMTP id q18mr2161452ljj.72.1588251249298; 
 Thu, 30 Apr 2020 05:54:09 -0700 (PDT)
MIME-Version: 1.0
References: <1588239802-11442-1-git-send-email-dillon.minfei@gmail.com>
 <ff10728da646106d54182ce6db93a77f32b592d5.camel@toradex.com>
In-Reply-To: <ff10728da646106d54182ce6db93a77f32b592d5.camel@toradex.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Thu, 30 Apr 2020 20:50:59 +0800
Message-ID: <CAL9mu0JBcnmhKGNPfRD_dF-8NNzcvC7jV=jFFW4QEFC4knryew@mail.gmail.com>
Subject: Re: [PATCH 1/4] add dts node for drm panel driver ili9341 add dts
 i2c3 for stmpe touch add dts spi5 for gyro & ili9341
To: Philippe Schenker <philippe.schenker@toradex.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 alexandre.torgue@st.com, "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, thierry.reding@gmail.com,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============0095648814=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0095648814==
Content-Type: multipart/alternative; boundary="0000000000008755fd05a4818fe2"

--0000000000008755fd05a4818fe2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Philippe Schenker <philippe.schenker@toradex.com> =E4=BA=8E 2020=E5=B9=B44=
=E6=9C=8830=E6=97=A5=E5=91=A8=E5=9B=9B 20:08=E5=86=99=E9=81=93=EF=BC=9A

> On Thu, 2020-04-30 at 17:43 +0800, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >  .../bindings/display/panel/ilitek,ili9341.txt      | 42 +++++++++++
> >  arch/arm/boot/dts/stm32f4-pinctrl.dtsi             | 79
> > +++++++++++++++++++
> >  arch/arm/boot/dts/stm32f429-disco.dts              | 88
> > ++++++++++++++++++++++
> >  arch/arm/boot/dts/stm32f429.dtsi                   | 12 +++
> >  4 files changed, 221 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
> > b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
> > new file mode 100644
> > index 0000000..f5a4e55
> > --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/display/panel/ilitek,ili9341.txt
> > @@ -0,0 +1,42 @@
> > +Ilitek ILI9341 TFT panel driver with SPI control bus
> > +
> > +This is a driver for 240x320 TFT panels, accepting a rgb input
> > +streams that get adapted and scaled to the panel.
> > +
> > +Required properties:
> > +  - compatible: "stm32f429-disco,ltdc-panel", "ilitek,ili9341"
> > +    (full system-specific compatible is always required to look up
> > configuration)
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
> > +media/video-interfaces.txt. This node should describe panel's video
> > bus.
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
> > b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> > index 392fa14..45b68f4 100644
> > --- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> > +++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> > @@ -316,6 +316,85 @@
> >                               };
> >                       };
> >
> > +                     ltdc_pins_f429_disco: ltdc-1 {
> > +                             pins {
> > +                                     pinmux =3D <STM32_PINMUX('C',
> > 6,  AF14)>,
> > +                                             /* LCD_HSYNC */
> > +                                              <STM32_PINMUX('A',
> > 4,  AF14)>,
> > +                                              /* LCD_VSYNC */
> > +                                              <STM32_PINMUX('G',
> > 7,  AF14)>,
> > +                                              /* LCD_CLK */
> > +                                              <STM32_PINMUX('C', 10,
> > AF14)>,
> > +                                              /* LCD_R2 */
> > +                                              <STM32_PINMUX('B',
> > 0,  AF9)>,
> > +                                              /* LCD_R3 */
> > +                                              <STM32_PINMUX('A', 11,
> > AF14)>,
> > +                                              /* LCD_R4 */
> > +                                              <STM32_PINMUX('A', 12,
> > AF14)>,
> > +                                              /* LCD_R5 */
> > +                                              <STM32_PINMUX('B',
> > 1,  AF9)>,
> > +                                              /* LCD_R6*/
> > +                                              <STM32_PINMUX('G',
> > 6,  AF14)>,
> > +                                              /* LCD_R7 */
> > +                                              <STM32_PINMUX('A',
> > 6,  AF14)>,
> > +                                              /* LCD_G2 */
> > +                                              <STM32_PINMUX('G', 10,
> > AF9)>,
> > +                                              /* LCD_G3 */
> > +                                              <STM32_PINMUX('B', 10,
> > AF14)>,
> > +                                              /* LCD_G4 */
> > +                                              <STM32_PINMUX('D',
> > 6,  AF14)>,
> > +                                              /* LCD_B2 */
> > +                                              <STM32_PINMUX('G', 11,
> > AF14)>,
> > +                                              /* LCD_B3*/
> > +                                              <STM32_PINMUX('B', 11,
> > AF14)>,
> > +                                              /* LCD_G5 */
> > +                                              <STM32_PINMUX('C',
> > 7,  AF14)>,
> > +                                              /* LCD_G6 */
> > +                                              <STM32_PINMUX('D',
> > 3,  AF14)>,
> > +                                              /* LCD_G7 */
> > +                                              <STM32_PINMUX('G', 12,
> > AF9)>,
> > +                                              /* LCD_B4 */
> > +                                              <STM32_PINMUX('A',
> > 3,  AF14)>,
> > +                                              /* LCD_B5 */
> > +                                              <STM32_PINMUX('B',
> > 8,  AF14)>,
> > +                                              /* LCD_B6 */
> > +                                              <STM32_PINMUX('B',
> > 9,  AF14)>,
> > +                                              /* LCD_B7 */
> > +                                              <STM32_PINMUX('F', 10,
> > AF14)>;
> > +                                              /* LCD_DE */
> > +                                     slew-rate =3D <2>;
> > +                             };
> > +                     };
> > +
> > +                     i2c3_pins: i2c3-0 {
> > +                             pins {
> > +                                     pinmux =3D <STM32_PINMUX('C', 9,
> > AF4)>,
> > +                                             /* I2C3_SDA */
> > +                                              <STM32_PINMUX('A', 8,
> > AF4)>;
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
> > AF5)>,
> > +                                             /* SPI5_CLK */
> > +                                              <STM32_PINMUX('F', 9,
> > AF5)>;
> > +                                             /* SPI5_MOSI */
> > +                                     bias-disable;
> > +                                     drive-push-pull;
> > +                                     slew-rate =3D <0>;
> > +                             };
> > +                             pins2 {
> > +                                     pinmux =3D <STM32_PINMUX('F', 8,
> > AF5)>;
> > +                                             /* SPI5_MISO */
> > +                                     bias-disable;
> > +                             };
> > +                     };
> > +
> >                       dcmi_pins: dcmi-0 {
> >                               pins {
> >                                       pinmux =3D <STM32_PINMUX('A', 4,
> > AF13)>, /* DCMI_HSYNC */
> > diff --git a/arch/arm/boot/dts/stm32f429-disco.dts
> > b/arch/arm/boot/dts/stm32f429-disco.dts
> > index 30c0f67..55eed05 100644
> > --- a/arch/arm/boot/dts/stm32f429-disco.dts
> > +++ b/arch/arm/boot/dts/stm32f429-disco.dts
> > @@ -49,6 +49,8 @@
> >  #include "stm32f429.dtsi"
> >  #include "stm32f429-pinctrl.dtsi"
> >  #include <dt-bindings/input/input.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/gpio/gpio.h>
> >
> >  / {
> >       model =3D "STMicroelectronics STM32F429i-DISCO board";
> > @@ -98,6 +100,14 @@
> >               regulator-name =3D "vcc5_host1";
> >               regulator-always-on;
> >       };
> > +
> > +     reg_3p3v: regulator-3p3v {
> > +             compatible =3D "regulator-fixed";
> > +             regulator-name =3D "3P3V";
> > +             regulator-min-microvolt =3D <3300000>;
> > +             regulator-max-microvolt =3D <3300000>;
> > +             regulator-always-on;
> > +     };
> >  };
> >
> >  &clk_hse {
> > @@ -127,3 +137,81 @@
> >       pinctrl-names =3D "default";
> >       status =3D "okay";
> >  };
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
> > +     cs-gpios =3D <&gpioc 1 GPIO_ACTIVE_LOW>,<&gpioc 2
> > GPIO_ACTIVE_LOW>;
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
> > "ilitek,ili9341";
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
>
> The above ADC related settings should go into the MFD device with
> compatible "st,stmpe811". The use of those in touchscreen is deprecated.
>
> Please check the bindings:
> Documentation/devicetree/bindings/input/touchs
> creen/stmpe.txt
> Documentation/devicetree/bindings/mfd/stmpe.txt
>
> Best Regards,
> Philippe
>
> Philippe,thanks. i will try it later, and move touch panel & gyro patchs
> out of this sets,  after well tested, i'll resubmit it.
>

> +                     st,ave-ctrl =3D <1>;
> > +                     st,touch-det-delay =3D <2>;
> > +                     st,settling =3D <2>;
> > +                     st,fraction-z =3D <7>;
> > +                     st,i-drive =3D <1>;
> > +             };
> > +     };
> > +};
> > diff --git a/arch/arm/boot/dts/stm32f429.dtsi
> > b/arch/arm/boot/dts/stm32f429.dtsi
> > index d777069..257b843 100644
> > --- a/arch/arm/boot/dts/stm32f429.dtsi
> > +++ b/arch/arm/boot/dts/stm32f429.dtsi
> > @@ -402,6 +402,18 @@
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
>

--0000000000008755fd05a4818fe2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9ImF1dG8iPjxkaXY+PGJyPjxicj48ZGl2IGNsYXNzPSJnbWFpbF9xdW90ZSI+PGRp
diBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPlBoaWxpcHBlIFNjaGVua2VyICZsdDs8YSBo
cmVmPSJtYWlsdG86cGhpbGlwcGUuc2NoZW5rZXJAdG9yYWRleC5jb20iPnBoaWxpcHBlLnNjaGVu
a2VyQHRvcmFkZXguY29tPC9hPiZndDsg5LqOIDIwMjDlubQ05pyIMzDml6Xlkajlm5sgMjA6MDjl
hpnpgZPvvJo8YnI+PC9kaXY+PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0i
bWFyZ2luOjAgMCAwIC44ZXg7Ym9yZGVyLWxlZnQ6MXB4ICNjY2Mgc29saWQ7cGFkZGluZy1sZWZ0
OjFleCI+T24gVGh1LCAyMDIwLTA0LTMwIGF0IDE3OjQzICswODAwLCA8YSBocmVmPSJtYWlsdG86
ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIiByZWw9Im5vcmVmZXJyZXIi
PmRpbGxvbi5taW5mZWlAZ21haWwuY29tPC9hPiB3cm90ZTo8YnI+DQomZ3Q7IEZyb206IGRpbGxv
biBtaW4gJmx0OzxhIGhyZWY9Im1haWx0bzpkaWxsb24ubWluZmVpQGdtYWlsLmNvbSIgdGFyZ2V0
PSJfYmxhbmsiIHJlbD0ibm9yZWZlcnJlciI+ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb208L2E+Jmd0
Ozxicj4NCiZndDsgPGJyPg0KJmd0OyBTaWduZWQtb2ZmLWJ5OiBkaWxsb24gbWluICZsdDs8YSBo
cmVmPSJtYWlsdG86ZGlsbG9uLm1pbmZlaUBnbWFpbC5jb20iIHRhcmdldD0iX2JsYW5rIiByZWw9
Im5vcmVmZXJyZXIiPmRpbGxvbi5taW5mZWlAZ21haWwuY29tPC9hPiZndDs8YnI+DQomZ3Q7IC0t
LTxicj4NCiZndDvCoCAuLi4vYmluZGluZ3MvZGlzcGxheS9wYW5lbC9pbGl0ZWssaWxpOTM0MS50
eHTCoCDCoCDCoCB8IDQyICsrKysrKysrKysrPGJyPg0KJmd0O8KgIGFyY2gvYXJtL2Jvb3QvZHRz
L3N0bTMyZjQtcGluY3RybC5kdHNpwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDc5PGJyPg0KJmd0OyAr
KysrKysrKysrKysrKysrKysrPGJyPg0KJmd0O8KgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQy
OS1kaXNjby5kdHPCoCDCoCDCoCDCoCDCoCDCoCDCoCB8IDg4PGJyPg0KJmd0OyArKysrKysrKysr
KysrKysrKysrKysrPGJyPg0KJmd0O8KgIGFyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQyOS5kdHNp
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB8IDEyICsrKzxicj4NCiZndDvCoCA0IGZpbGVz
IGNoYW5nZWQsIDIyMSBpbnNlcnRpb25zKCspPGJyPg0KJmd0O8KgIGNyZWF0ZSBtb2RlIDEwMDY0
NDxicj4NCiZndDsgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFu
ZWwvaWxpdGVrLGlsaTkzNDEudHh0PGJyPg0KJmd0OyA8YnI+DQomZ3Q7IGRpZmYgLS1naXQ8YnI+
DQomZ3Q7IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwv
aWxpdGVrLGlsaTkzNDEudHh0PGJyPg0KJmd0OyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L3BhbmVsL2lsaXRlayxpbGk5MzQxLnR4dDxicj4NCiZndDsgbmV3IGZp
bGUgbW9kZSAxMDA2NDQ8YnI+DQomZ3Q7IGluZGV4IDAwMDAwMDAuLmY1YTRlNTU8YnI+DQomZ3Q7
IC0tLSAvZGV2L251bGw8YnI+DQomZ3Q7ICsrKzxicj4NCiZndDsgYi9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9wYW5lbC9pbGl0ZWssaWxpOTM0MS50eHQ8YnI+DQom
Z3Q7IEBAIC0wLDAgKzEsNDIgQEA8YnI+DQomZ3Q7ICtJbGl0ZWsgSUxJOTM0MSBURlQgcGFuZWwg
ZHJpdmVyIHdpdGggU1BJIGNvbnRyb2wgYnVzPGJyPg0KJmd0OyArPGJyPg0KJmd0OyArVGhpcyBp
cyBhIGRyaXZlciBmb3IgMjQweDMyMCBURlQgcGFuZWxzLCBhY2NlcHRpbmcgYSByZ2IgaW5wdXQ8
YnI+DQomZ3Q7ICtzdHJlYW1zIHRoYXQgZ2V0IGFkYXB0ZWQgYW5kIHNjYWxlZCB0byB0aGUgcGFu
ZWwuPGJyPg0KJmd0OyArPGJyPg0KJmd0OyArUmVxdWlyZWQgcHJvcGVydGllczo8YnI+DQomZ3Q7
ICvCoCAtIGNvbXBhdGlibGU6ICZxdW90O3N0bTMyZjQyOS1kaXNjbyxsdGRjLXBhbmVsJnF1b3Q7
LCAmcXVvdDtpbGl0ZWssaWxpOTM0MSZxdW90Ozxicj4NCiZndDsgK8KgIMKgIChmdWxsIHN5c3Rl
bS1zcGVjaWZpYyBjb21wYXRpYmxlIGlzIGFsd2F5cyByZXF1aXJlZCB0byBsb29rIHVwPGJyPg0K
Jmd0OyBjb25maWd1cmF0aW9uKTxicj4NCiZndDsgK8KgIC0gcmVnOiBhZGRyZXNzIG9mIHRoZSBw
YW5lbCBvbiB0aGUgU1BJIGJ1czxicj4NCiZndDsgKzxicj4NCiZndDsgK09wdGlvbmFsIHByb3Bl
cnRpZXM6PGJyPg0KJmd0OyArwqAgLSByZXNldC1ncGlvczogYSBHUElPIHNwZWMgZm9yIHRoZSBy
ZXNldCBwaW4sIHNlZSBncGlvL2dwaW8udHh0PGJyPg0KJmd0OyArwqAgLSBkYy1ncGlvczogYSBH
UElPIHNwZWMgZm9yIHRoZSBkYyBwaW4sIHNlZSBncGlvL2dwaW8udHh0PGJyPg0KJmd0OyArPGJy
Pg0KJmd0OyArwqAgVGhlIGZvbGxvd2luZyBvcHRpb25hbCBwcm9wZXJ0aWVzIG9ubHkgYXBwbHkg
dG8gUkdCIGlucHV0IG1vZGU6PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgLSBwaXhlbGNsay1h
Y3RpdmU6IHNlZSBkaXNwbGF5L3BhbmVsL2Rpc3BsYXktdGltaW5nLnR4dDxicj4NCiZndDsgK8Kg
IC0gZGUtYWN0aXZlOiBzZWUgZGlzcGxheS9wYW5lbC9kaXNwbGF5LXRpbWluZy50eHQ8YnI+DQom
Z3Q7ICvCoCAtIGhzeW5jLWFjdGl2ZTogc2VlIGRpc3BsYXkvcGFuZWwvZGlzcGxheS10aW1pbmcu
dHh0PGJyPg0KJmd0OyArwqAgLSB2c3luYy1hY3RpdmU6IHNlZSBkaXNwbGF5L3BhbmVsL2Rpc3Bs
YXktdGltaW5nLnR4dDxicj4NCiZndDsgKzxicj4NCiZndDsgK1RoZSBwYW5lbCBtdXN0IG9iZXkg
dGhlIHJ1bGVzIGZvciBhIFNQSSBzbGF2ZSBkZXZpY2UgYXMgc3BlY2lmaWVkIGluPGJyPg0KJmd0
OyArc3BpL3NwaS1idXMudHh0PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArVGhlIGRldmljZSBub2Rl
IGNhbiBjb250YWluIG9uZSAmIzM5O3BvcnQmIzM5OyBjaGlsZCBub2RlIHdpdGggb25lIGNoaWxk
PGJyPg0KJmd0OyArJiMzOTtlbmRwb2ludCYjMzk7IG5vZGUsIGFjY29yZGluZyB0byB0aGUgYmlu
ZGluZ3MgZGVmaW5lZCBpbjxicj4NCiZndDsgK21lZGlhL3ZpZGVvLWludGVyZmFjZXMudHh0LiBU
aGlzIG5vZGUgc2hvdWxkIGRlc2NyaWJlIHBhbmVsJiMzOTtzIHZpZGVvPGJyPg0KJmd0OyBidXMu
PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArRXhhbXBsZTo8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICtw
YW5lbDogZGlzcGxheUAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtz
dG0zMmY0MjktZGlzY28sbHRkYy1wYW5lbCZxdW90OywgJnF1b3Q7aWxpdGVrLGlsaTkzNDEmcXVv
dDs7PGJyPg0KJmd0OyArwqAgwqAgwqByZWcgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqBzcGktM3dpcmU7PGJyPg0KJmd0OyArwqAgwqAgwqBzcGktbWF4LWZyZXF1ZW5jeSA9ICZsdDsx
MDAwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqBkYy1ncGlvcyA9ICZsdDsmYW1wO2dwaW9k
IDEzIDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgcG9ydCB7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqBwYW5lbF9pbjogZW5kcG9pbnQgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgcmVtb3RlLWVuZHBvaW50ID0gJmx0OyZhbXA7ZGlzcGxheV9vdXQm
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDC
oH07PGJyPg0KJmd0OyArfTs8YnI+DQomZ3Q7IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0
cy9zdG0zMmY0LXBpbmN0cmwuZHRzaTxicj4NCiZndDsgYi9hcmNoL2FybS9ib290L2R0cy9zdG0z
MmY0LXBpbmN0cmwuZHRzaTxicj4NCiZndDsgaW5kZXggMzkyZmExNC4uNDViNjhmNCAxMDA2NDQ8
YnI+DQomZ3Q7IC0tLSBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQtcGluY3RybC5kdHNpPGJy
Pg0KJmd0OyArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY0LXBpbmN0cmwuZHRzaTxicj4N
CiZndDsgQEAgLTMxNiw2ICszMTYsODUgQEA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0O8KgIDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgbHRkY19waW5zX2Y0MjlfZGlzY286IGx0ZGMtMSB7PGJyPg0KJmd0
OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5zIHs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoHBpbm11eCA9ICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtDJiMzOTssPGJyPg0KJmd0OyA2
LMKgIEFGMTQpJmd0Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIExDRF9IU1lOQyAqLzxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtBJiMzOTssPGJyPg0KJmd0
OyA0LMKgIEFGMTQpJmd0Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0RfVlNZTkMgKi88
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7U1RNMzJfUElOTVVYKCYjMzk7RyYjMzk7LDxicj4N
CiZndDsgNyzCoCBBRjE0KSZndDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogTENEX0NMSyAq
Lzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtDJiMzOTssIDEw
LDxicj4NCiZndDsgQUYxNCkmZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9SMiAq
Lzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtCJiMzOTssPGJy
Pg0KJmd0OyAwLMKgIEFGOSkmZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9SMyAq
Lzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtBJiMzOTssIDEx
LDxicj4NCiZndDsgQUYxNCkmZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9SNCAq
Lzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtBJiMzOTssIDEy
LDxicj4NCiZndDsgQUYxNCkmZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9SNSAq
Lzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtCJiMzOTssPGJy
Pg0KJmd0OyAxLMKgIEFGOSkmZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9SNiov
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0O1NUTTMyX1BJTk1VWCgmIzM5O0cmIzM5Oyw8YnI+
DQomZ3Q7IDYswqAgQUYxNCkmZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9SNyAq
Lzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtBJiMzOTssPGJy
Pg0KJmd0OyA2LMKgIEFGMTQpJmd0Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0RfRzIg
Ki88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7U1RNMzJfUElOTVVYKCYjMzk7RyYjMzk7LCAx
MCw8YnI+DQomZ3Q7IEFGOSkmZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9HMyAq
Lzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtCJiMzOTssIDEw
LDxicj4NCiZndDsgQUYxNCkmZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9HNCAq
Lzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtEJiMzOTssPGJy
Pg0KJmd0OyA2LMKgIEFGMTQpJmd0Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0RfQjIg
Ki88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7U1RNMzJfUElOTVVYKCYjMzk7RyYjMzk7LCAx
MSw8YnI+DQomZ3Q7IEFGMTQpJmd0Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0RfQjMq
Lzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtCJiMzOTssIDEx
LDxicj4NCiZndDsgQUYxNCkmZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9HNSAq
Lzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtDJiMzOTssPGJy
Pg0KJmd0OyA3LMKgIEFGMTQpJmd0Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0RfRzYg
Ki88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7U1RNMzJfUElOTVVYKCYjMzk7RCYjMzk7LDxi
cj4NCiZndDsgMyzCoCBBRjE0KSZndDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogTENEX0c3
ICovPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0O1NUTTMyX1BJTk1VWCgmIzM5O0cmIzM5Oywg
MTIsPGJyPg0KJmd0OyBBRjkpJmd0Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0RfQjQg
Ki88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7U1RNMzJfUElOTVVYKCYjMzk7QSYjMzk7LDxi
cj4NCiZndDsgMyzCoCBBRjE0KSZndDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgLyogTENEX0I1
ICovPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgJmx0O1NUTTMyX1BJTk1VWCgmIzM5O0ImIzM5Oyw8
YnI+DQomZ3Q7IDgswqAgQUYxNCkmZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIC8qIExDRF9C
NiAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtCJiMzOTss
PGJyPg0KJmd0OyA5LMKgIEFGMTQpJmd0Oyw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0Rf
QjcgKi88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAmbHQ7U1RNMzJfUElOTVVYKCYjMzk7RiYjMzk7
LCAxMCw8YnI+DQomZ3Q7IEFGMTQpJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAvKiBMQ0Rf
REUgKi88YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoHNsZXctcmF0ZSA9ICZsdDsyJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaTJjM19waW5zOiBpMmMzLTAgezxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGlucyB7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBwaW5tdXggPSAmbHQ7U1RNMzJfUElOTVVYKCYjMzk7QyYjMzk7LCA5LDxicj4NCiZndDsg
QUY0KSZndDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvKiBJMkMzX1NEQSAqLzxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtBJiMzOTssIDgsPGJyPg0KJmd0OyBB
RjQpJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIEkyQzNfU0NMICovPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBi
aWFzLWRpc2FibGU7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBkcml2ZS1vcGVuLWRyYWluOzxicj4NCiZndDsgK8KgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2xldy1y
YXRlID0gJmx0OzMmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBzcGk1X3BpbnM6IHNwaTUtMCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5zMSB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBwaW5tdXggPSAmbHQ7U1RN
MzJfUElOTVVYKCYjMzk7RiYjMzk7LCA3LDxicj4NCiZndDsgQUY1KSZndDssPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAvKiBTUEk1X0NMSyAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDtTVE0z
Ml9QSU5NVVgoJiMzOTtGJiMzOTssIDksPGJyPg0KJmd0OyBBRjUpJmd0Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoC8qIFNQSTVfTU9TSSAqLzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYmlhcy1kaXNhYmxlOzxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgZHJpdmUtcHVzaC1wdWxsOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc2xldy1yYXRlID0gJmx0OzAmZ3Q7Ozxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbnMy
IHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHBpbm11eCA9ICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtGJiMzOTssIDgsPGJy
Pg0KJmd0OyBBRjUpJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIFNQSTVfTUlTTyAqLzxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgYmlhcy1kaXNhYmxlOzxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgZGNtaV9waW5zOiBkY21pLTAgezxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbnMgezxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBpbm11eCA9
ICZsdDtTVE0zMl9QSU5NVVgoJiMzOTtBJiMzOTssIDQsPGJyPg0KJmd0OyBBRjEzKSZndDssIC8q
IERDTUlfSFNZTkMgKi88YnI+DQomZ3Q7IGRpZmYgLS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9z
dG0zMmY0MjktZGlzY28uZHRzPGJyPg0KJmd0OyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQy
OS1kaXNjby5kdHM8YnI+DQomZ3Q7IGluZGV4IDMwYzBmNjcuLjU1ZWVkMDUgMTAwNjQ0PGJyPg0K
Jmd0OyAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY0MjktZGlzY28uZHRzPGJyPg0KJmd0
OyArKysgYi9hcmNoL2FybS9ib290L2R0cy9zdG0zMmY0MjktZGlzY28uZHRzPGJyPg0KJmd0OyBA
QCAtNDksNiArNDksOCBAQDxicj4NCiZndDvCoCAjaW5jbHVkZSAmcXVvdDtzdG0zMmY0MjkuZHRz
aSZxdW90Ozxicj4NCiZndDvCoCAjaW5jbHVkZSAmcXVvdDtzdG0zMmY0MjktcGluY3RybC5kdHNp
JnF1b3Q7PGJyPg0KJmd0O8KgICNpbmNsdWRlICZsdDtkdC1iaW5kaW5ncy9pbnB1dC9pbnB1dC5o
Jmd0Ozxicj4NCiZndDsgKyNpbmNsdWRlICZsdDtkdC1iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJv
bGxlci9pcnEuaCZndDs8YnI+DQomZ3Q7ICsjaW5jbHVkZSAmbHQ7ZHQtYmluZGluZ3MvZ3Bpby9n
cGlvLmgmZ3Q7PGJyPg0KJmd0O8KgIDxicj4NCiZndDvCoCAvIHs8YnI+DQomZ3Q7wqAgwqAgwqAg
wqBtb2RlbCA9ICZxdW90O1NUTWljcm9lbGVjdHJvbmljcyBTVE0zMkY0MjlpLURJU0NPIGJvYXJk
JnF1b3Q7Ozxicj4NCiZndDsgQEAgLTk4LDYgKzEwMCwxNCBAQDxicj4NCiZndDvCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1uYW1lID0gJnF1b3Q7dmNjNV9ob3N0MSZxdW90Ozs8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0b3ItYWx3YXlzLW9uOzxicj4NCiZn
dDvCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArwqAgwqAgwqByZWdfM3Azdjog
cmVndWxhdG9yLTNwM3Ygezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJs
ZSA9ICZxdW90O3JlZ3VsYXRvci1maXhlZCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoHJlZ3VsYXRvci1uYW1lID0gJnF1b3Q7M1AzViZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoHJlZ3VsYXRvci1taW4tbWljcm92b2x0ID0gJmx0OzMzMDAwMDAmZ3Q7
Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgcmVndWxhdG9yLW1heC1taWNyb3ZvbHQg
PSAmbHQ7MzMwMDAwMCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqByZWd1bGF0
b3ItYWx3YXlzLW9uOzxicj4NCiZndDsgK8KgIMKgIMKgfTs8YnI+DQomZ3Q7wqAgfTs8YnI+DQom
Z3Q7wqAgPGJyPg0KJmd0O8KgICZhbXA7Y2xrX2hzZSB7PGJyPg0KJmd0OyBAQCAtMTI3LDMgKzEz
Nyw4MSBAQDxicj4NCiZndDvCoCDCoCDCoCDCoHBpbmN0cmwtbmFtZXMgPSAmcXVvdDtkZWZhdWx0
JnF1b3Q7Ozxicj4NCiZndDvCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJy
Pg0KJmd0O8KgIH07PGJyPg0KJmd0OyArPGJyPg0KJmd0OyArJmFtcDtsdGRjIHs8YnI+DQomZ3Q7
ICvCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAgwqBw
aW5jdHJsLTAgPSAmbHQ7JmFtcDtsdGRjX3BpbnNfZjQyOV9kaXNjbyZndDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7ICs8
YnI+DQomZ3Q7ICvCoCDCoCDCoHBvcnQgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKg
bHRkY19vdXRfcmdiOiBlbmRwb2ludCB7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZW1vdGUtZW5kcG9pbnQgPSAmbHQ7JmFtcDtwYW5lbF9pbl9yZ2ImZ3Q7Ozxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgfTs8YnI+DQomZ3Q7ICvCoCDCoCDCoH07PGJy
Pg0KJmd0OyArfTs8YnI+DQomZ3Q7ICs8YnI+DQomZ3Q7ICsmYW1wO3NwaTUgezxicj4NCiZndDsg
K8KgIMKgIMKgc3RhdHVzID0gJnF1b3Q7b2theSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoHBp
bmN0cmwtMCA9ICZsdDsmYW1wO3NwaTVfcGlucyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqBwaW5j
dHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVsdCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCNhZGRy
ZXNzLWNlbGxzID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgI3NpemUtY2VsbHMgPSAm
bHQ7MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqBjcy1ncGlvcyA9ICZsdDsmYW1wO2dwaW9jIDEg
R1BJT19BQ1RJVkVfTE9XJmd0OywmbHQ7JmFtcDtncGlvYyAyPGJyPg0KJmd0OyBHUElPX0FDVElW
RV9MT1cmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgZG1hcyA9ICZsdDsmYW1wO2RtYTIgMyAyIDB4
NDAwIDB4MCZndDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgJmx0OyZhbXA7ZG1hMiA0
IDIgMHg0MDAgMHgwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoGRtYS1uYW1lcyA9ICZxdW90O3J4
JnF1b3Q7LCAmcXVvdDt0eCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoGwzZ2QyMDogbDNnZDIw
QDAgezxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3N0
LGwzZ2QyMC1neXJvJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgc3BpLW1h
eC1mcmVxdWVuY3kgPSAmbHQ7MTAwMDAwMDAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKg
IMKgIMKgc3QsZHJkeS1pbnQtcGluID0gJmx0OzImZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgaW50ZXJydXB0LXBhcmVudCA9ICZsdDsmYW1wO2dwaW9hJmd0Ozs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MSBJUlFfVFlQRV9FREdFX1JJ
U0lORyZndDssPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAmbHQ7MiBJUlFfVFlQRV9FREdFX1JJU0lORyZndDs7PGJyPg0KJmd0OyArwqAgwqAg
wqAgwqAgwqAgwqAgwqByZWcgPSAmbHQ7MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqB2ZGRpbyA9ICZsdDsmYW1wO3JlZ18zcDN2Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDC
oCDCoCDCoCDCoHZkZCA9ICZsdDsmYW1wO3JlZ18zcDN2Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O29rYXkmcXVvdDs7PGJyPg0KJmd0OyArwqAgwqAg
wqB9Ozxicj4NCiZndDsgK8KgIMKgIMKgZGlzcGxheTogZGlzcGxheUAxezxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgLyogQ29ubmVjdCBwYW5lbC1pbGl0ZWstOTM0MSB0byBsdGRjICov
PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7c3RtMzJm
NDI5LWRpc2NvLGx0ZGMtcGFuZWwmcXVvdDssPGJyPg0KJmd0OyAmcXVvdDtpbGl0ZWssaWxpOTM0
MSZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsxJmd0Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHNwaS0zd2lyZTs8YnI+DQomZ3Q7ICvCoCDC
oCDCoCDCoCDCoCDCoCDCoHNwaS1tYXgtZnJlcXVlbmN5ID0gJmx0OzEwMDAwMDAwJmd0Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGRjLWdwaW9zID0gJmx0OyZhbXA7Z3Bpb2QgMTMg
MCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqBwb3J0IHs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHBhbmVsX2luX3JnYjogZW5kcG9pbnQgezxi
cj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcmVtb3RlLWVuZHBvaW50
ID0gJmx0OyZhbXA7bHRkY19vdXRfcmdiJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4N
CiZndDsgK8KgIMKgIMKgfTs8YnI+DQomZ3Q7ICt9Ozxicj4NCiZndDsgKzxicj4NCiZndDsgKyZh
bXA7aTJjMyB7PGJyPg0KJmd0OyArwqAgwqAgwqBwaW5jdHJsLW5hbWVzID0gJnF1b3Q7ZGVmYXVs
dCZxdW90Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoHBpbmN0cmwtMCA9ICZsdDsmYW1wO2kyYzNfcGlu
cyZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4N
CiZndDsgKzxicj4NCiZndDsgK8KgIMKgIMKgdG91Y2g6IHN0bXBlODExQDQxIHs8YnI+DQomZ3Q7
ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtzdCxzdG1wZTgxMSZxdW90
Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDQxJmd0Ozs8YnI+
DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVwdHMgPSAmbHQ7MTUgSVJRX1RZUEVf
RURHRV9GQUxMSU5HJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGludGVycnVw
dC1wYXJlbnQgPSAmbHQ7JmFtcDtncGlvYSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAg
wqAgwqB2aW8gPSAmbHQ7JmFtcDtyZWdfM3AzdiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAg
wqAgwqAgwqB2Y2MgPSAmbHQ7JmFtcDtyZWdfM3AzdiZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAg
wqAgwqAgwqAgwqBzdGF0dXMgPSAmcXVvdDtva2F5JnF1b3Q7Ozxicj4NCiZndDsgKzxicj4NCiZn
dDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgc3RtcGVfdG91Y2hzY3JlZW4gezxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgY29tcGF0aWJsZSA9ICZxdW90O3N0LHN0bXBl
LXRzJnF1b3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3Qs
c2FtcGxlLXRpbWUgPSAmbHQ7NCZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBzdCxtb2QtMTJiID0gJmx0OzEmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgc3QscmVmLXNlbCA9ICZsdDswJmd0Ozs8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0LGFkYy1mcmVxID0gJmx0OzEmZ3Q7Ozxi
cj4NCjxicj4NClRoZSBhYm92ZSBBREMgcmVsYXRlZCBzZXR0aW5ncyBzaG91bGQgZ28gaW50byB0
aGUgTUZEIGRldmljZSB3aXRoPGJyPg0KY29tcGF0aWJsZSAmcXVvdDtzdCxzdG1wZTgxMSZxdW90
Oy4gVGhlIHVzZSBvZiB0aG9zZSBpbiB0b3VjaHNjcmVlbiBpcyBkZXByZWNhdGVkLjxicj4NCjxi
cj4NClBsZWFzZSBjaGVjayB0aGUgYmluZGluZ3M6PGJyPg0KRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL2lucHV0L3RvdWNoczxicj4NCmNyZWVuL3N0bXBlLnR4dDxicj4NCkRvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvc3RtcGUudHh0PGJyPjxicj4NCkJlc3Qg
UmVnYXJkcyw8YnI+DQpQaGlsaXBwZTxicj4NCjxicj5QaGlsaXBwZSx0aGFua3MuIGkgd2lsbCB0
cnkgaXQgbGF0ZXIsIGFuZCBtb3ZlIHRvdWNoIHBhbmVsICZhbXA7IGd5cm8gcGF0Y2hzIG91dCBv
ZiB0aGlzIHNldHMsIMKgYWZ0ZXIgd2VsbCB0ZXN0ZWQsIGkmIzM5O2xsIHJlc3VibWl0IGl0Ljxi
cj48L2Jsb2NrcXVvdGU+PC9kaXY+PC9kaXY+PGRpdiBkaXI9ImF1dG8iPjxicj48L2Rpdj48ZGl2
IGRpcj0iYXV0byI+PGRpdiBjbGFzcz0iZ21haWxfcXVvdGUiPjxibG9ja3F1b3RlIGNsYXNzPSJn
bWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowIDAgMCAuOGV4O2JvcmRlci1sZWZ0OjFweCAjY2Nj
IHNvbGlkO3BhZGRpbmctbGVmdDoxZXgiPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBzdCxhdmUtY3RybCA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoHN0LHRvdWNoLWRldC1kZWxheSA9ICZsdDsyJmd0Ozs8YnI+DQom
Z3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHN0LHNldHRsaW5nID0gJmx0OzIm
Z3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgc3QsZnJhY3Rp
b24teiA9ICZsdDs3Jmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoHN0LGktZHJpdmUgPSAmbHQ7MSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAg
wqB9Ozxicj4NCiZndDsgK8KgIMKgIMKgfTs8YnI+DQomZ3Q7ICt9Ozxicj4NCiZndDsgZGlmZiAt
LWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQyOS5kdHNpPGJyPg0KJmd0OyBiL2FyY2gv
YXJtL2Jvb3QvZHRzL3N0bTMyZjQyOS5kdHNpPGJyPg0KJmd0OyBpbmRleCBkNzc3MDY5Li4yNTdi
ODQzIDEwMDY0NDxicj4NCiZndDsgLS0tIGEvYXJjaC9hcm0vYm9vdC9kdHMvc3RtMzJmNDI5LmR0
c2k8YnI+DQomZ3Q7ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3N0bTMyZjQyOS5kdHNpPGJyPg0K
Jmd0OyBAQCAtNDAyLDYgKzQwMiwxOCBAQDxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoHN0YXR1cyA9ICZxdW90O2Rpc2FibGVkJnF1b3Q7Ozxicj4NCiZndDvCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoH07PGJyPg0KJmd0O8KgIDxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgaTJjMzogaTJjQDQwMDA1YzAwIHs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGNvbXBhdGlibGUgPSAmcXVvdDtzdCxzdG0zMmY0LWkyYyZxdW90Ozs8
YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJlZyA9ICZsdDsweDQw
MDA1YzAwIDB4NDAwJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoGludGVycnVwdHMgPSAmbHQ7NzImZ3Q7LDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgICZsdDs3MyZndDs7PGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqByZXNldHMgPSAmbHQ7JmFtcDtyY2MgU1RN
MzJGNF9BUEIxX1JFU0VUKEkyQzMpJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoGNsb2NrcyA9ICZsdDsmYW1wO3JjYyAwIFNUTTMyRjRfQVBCMV9DTE9DSyhJ
MkMzKSZndDs7PGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAjYWRk
cmVzcy1jZWxscyA9ICZsdDsxJmd0Ozs8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCNzaXplLWNlbGxzID0gJmx0OzAmZ3Q7Ozxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgc3RhdHVzID0gJnF1b3Q7ZGlzYWJsZWQmcXVvdDs7PGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqB9Ozxicj4NCiZndDsgKzxicj4NCiZndDvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoGRhYzogZGFjQDQwMDA3NDAwIHs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBjb21wYXRpYmxlID0gJnF1b3Q7c3Qsc3RtMzJmNC1kYWMt
Y29yZSZxdW90Ozs8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBy
ZWcgPSAmbHQ7MHg0MDAwNzQwMCAweDQwMCZndDs7PGJyPg0KPC9ibG9ja3F1b3RlPjwvZGl2Pjwv
ZGl2PjwvZGl2Pg0K
--0000000000008755fd05a4818fe2--

--===============0095648814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0095648814==--
