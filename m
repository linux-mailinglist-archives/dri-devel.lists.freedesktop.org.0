Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6AE1FA9A6
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 09:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A671A6E824;
	Tue, 16 Jun 2020 07:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5F86E2C4
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 10:06:33 +0000 (UTC)
Received: by mail-il1-x141.google.com with SMTP id p5so14706984ile.6
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 03:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V4ilhIOGf08PxKYEnKjQV/fXI0rSU5dBatEgVzDPnAc=;
 b=P0cRrsg3JH6SfJ4oLMqbykTLO/eOgi7Euj53OY7iTtxCNRxChA79rSj5NkQ2Edupqx
 N7INsfzKBCOM3rgdAyGAIDdyshNxznnV8Xz3osw7SQF6gmzqOFC5uX9LoirJnCP6U6JC
 O2AjzpCtuTlytgLZXF5kTpv3q+9IF2SrQFdsuMDSPP6G6GaDAaR7Jog8iCmO0u6hXKwp
 Y1S4ZPY0aDWg/GcIFKpoe65TJRjHAvoSf2rduaUbd1v7PpynsqSrwAhMOGcl95m0oV+B
 tgZwVsAsOQmTp2hnW18vdQXnCZ+ecuBp9aBzFXlJLNH7OG4L8xZkidwnaQBikC6pkoob
 Q9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V4ilhIOGf08PxKYEnKjQV/fXI0rSU5dBatEgVzDPnAc=;
 b=re/Q29/iU0B5kG9SJpwcIMd4IQWYU6tiW0UbYm1e7eZQ6/HFYdhVCYzegFLTAy0GSL
 HzoSfbfudOczbDRwHN3/4HR0MirHokuSReJ2YX0Qcab+D3TyJUTFBKwAn4VlfZgz58Ya
 LErLzpDqt5D3M2lJlev3X/UPp3xjjLqGX7mOpu4OGDaPAD1woKYEvhdgs/rZDJ/JswtA
 rnMGfOsB5suKTweOwarp4AWAlpMCiJpbYeKbM+v/mxqaufEM29z9b4gm/hjynOJ2y1X8
 i8zotmGlRW5ZmVLc6EupNdP0NOIem251eU+n3KRP6P2a3nGYV08gYqgjmUzAJ4f95jFM
 F9tg==
X-Gm-Message-State: AOAM533D6Vvyc9+g0ZaSwAlGz5t4dZdW4pR4+LZ9gxAAJbEWXieQS6x3
 UWdRb+tOXobKLSupHojxvL5UjpDDvzsj/toZmT8=
X-Google-Smtp-Source: ABdhPJy7MG4dIBMDcK+E97dM8L8Kkqqke6SfX/trPu5MYMPHvmU2jZK0syr68+bQImnrTKFXitAZyACYHc7TzBxR/TA=
X-Received: by 2002:a92:5bd2:: with SMTP id c79mr23408564ilg.218.1592215593037; 
 Mon, 15 Jun 2020 03:06:33 -0700 (PDT)
MIME-Version: 1.0
References: <1590564453-24499-1-git-send-email-dillon.minfei@gmail.com>
 <1590564453-24499-3-git-send-email-dillon.minfei@gmail.com>
 <2273a168-7b14-9e28-5904-b9d2c2e2d9d3@st.com>
In-Reply-To: <2273a168-7b14-9e28-5904-b9d2c2e2d9d3@st.com>
From: dillon min <dillon.minfei@gmail.com>
Date: Mon, 15 Jun 2020 18:05:56 +0800
Message-ID: <CAL9mu0LyFPjf+RLwet43zgcEnO9zhJJ=v1BsQqN8KxYta7Q=DQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/9] ARM: dts: stm32: Add pin map for ltdc & spi5 on
 stm32f429-disco board
To: Alexandre Torgue <alexandre.torgue@st.com>
X-Mailman-Approved-At: Tue, 16 Jun 2020 07:09:12 +0000
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Hua Dillon <dillonhua@gmail.com>,
 linux-clk <linux-clk@vger.kernel.org>, Dave Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 linux-spi <linux-spi@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 thierry.reding@gmail.com, Mark Brown <broonie@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 15, 2020 at 5:45 PM Alexandre Torgue
<alexandre.torgue@st.com> wrote:
>
> Hi Dillon
>
> On 5/27/20 9:27 AM, dillon.minfei@gmail.com wrote:
> > From: dillon min <dillon.minfei@gmail.com>
> >
> > This patch adds the pin configuration for ltdc and spi5 controller
> > on stm32f429-disco board.
> >
> > Signed-off-by: dillon min <dillon.minfei@gmail.com>
> > ---
> >   arch/arm/boot/dts/stm32f4-pinctrl.dtsi | 67 ++++++++++++++++++++++++++++++++++
> >   1 file changed, 67 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> > index 392fa143ce07..0eb107f968cd 100644
> > --- a/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> > +++ b/arch/arm/boot/dts/stm32f4-pinctrl.dtsi
> > @@ -316,6 +316,73 @@
> >                               };
> >                       };
> >
> > +                     ltdc_pins_f429_disco: ltdc-1 {
>
> Sorry I missed this issue during review. I changed ltdc_pins_f429_disco
> by ltdc_pins_b when I applied your patch.
Okay, thanks for reviewing.

Regrades,
Dillon,
>
>
> Regards
> alex
>
> > +                             pins {
> > +                                     pinmux = <STM32_PINMUX('C', 6,  AF14)>,
> > +                                             /* LCD_HSYNC */
> > +                                              <STM32_PINMUX('A', 4,  AF14)>,
> > +                                              /* LCD_VSYNC */
> > +                                              <STM32_PINMUX('G', 7,  AF14)>,
> > +                                              /* LCD_CLK */
> > +                                              <STM32_PINMUX('C', 10, AF14)>,
> > +                                              /* LCD_R2 */
> > +                                              <STM32_PINMUX('B', 0,  AF9)>,
> > +                                              /* LCD_R3 */
> > +                                              <STM32_PINMUX('A', 11, AF14)>,
> > +                                              /* LCD_R4 */
> > +                                              <STM32_PINMUX('A', 12, AF14)>,
> > +                                              /* LCD_R5 */
> > +                                              <STM32_PINMUX('B', 1,  AF9)>,
> > +                                              /* LCD_R6*/
> > +                                              <STM32_PINMUX('G', 6,  AF14)>,
> > +                                              /* LCD_R7 */
> > +                                              <STM32_PINMUX('A', 6,  AF14)>,
> > +                                              /* LCD_G2 */
> > +                                              <STM32_PINMUX('G', 10, AF9)>,
> > +                                              /* LCD_G3 */
> > +                                              <STM32_PINMUX('B', 10, AF14)>,
> > +                                              /* LCD_G4 */
> > +                                              <STM32_PINMUX('D', 6,  AF14)>,
> > +                                              /* LCD_B2 */
> > +                                              <STM32_PINMUX('G', 11, AF14)>,
> > +                                              /* LCD_B3*/
> > +                                              <STM32_PINMUX('B', 11, AF14)>,
> > +                                              /* LCD_G5 */
> > +                                              <STM32_PINMUX('C', 7,  AF14)>,
> > +                                              /* LCD_G6 */
> > +                                              <STM32_PINMUX('D', 3,  AF14)>,
> > +                                              /* LCD_G7 */
> > +                                              <STM32_PINMUX('G', 12, AF9)>,
> > +                                              /* LCD_B4 */
> > +                                              <STM32_PINMUX('A', 3,  AF14)>,
> > +                                              /* LCD_B5 */
> > +                                              <STM32_PINMUX('B', 8,  AF14)>,
> > +                                              /* LCD_B6 */
> > +                                              <STM32_PINMUX('B', 9,  AF14)>,
> > +                                              /* LCD_B7 */
> > +                                              <STM32_PINMUX('F', 10, AF14)>;
> > +                                              /* LCD_DE */
> > +                                     slew-rate = <2>;
> > +                             };
> > +                     };
> > +
> > +                     spi5_pins: spi5-0 {
> > +                             pins1 {
> > +                                     pinmux = <STM32_PINMUX('F', 7, AF5)>,
> > +                                             /* SPI5_CLK */
> > +                                              <STM32_PINMUX('F', 9, AF5)>;
> > +                                             /* SPI5_MOSI */
> > +                                     bias-disable;
> > +                                     drive-push-pull;
> > +                                     slew-rate = <0>;
> > +                             };
> > +                             pins2 {
> > +                                     pinmux = <STM32_PINMUX('F', 8, AF5)>;
> > +                                             /* SPI5_MISO */
> > +                                     bias-disable;
> > +                             };
> > +                     };
> > +
> >                       dcmi_pins: dcmi-0 {
> >                               pins {
> >                                       pinmux = <STM32_PINMUX('A', 4, AF13)>, /* DCMI_HSYNC */
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
