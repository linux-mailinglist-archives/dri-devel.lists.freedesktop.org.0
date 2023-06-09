Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B205A728FD9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 08:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDCDE10E10B;
	Fri,  9 Jun 2023 06:21:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA4410E10B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jun 2023 06:21:31 +0000 (UTC)
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-ba8151a744fso1490986276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Jun 2023 23:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1686291690; x=1688883690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a4OGTmTOoclePfnYMeVJrtyNvDzJs1MMAejXe1lLF4U=;
 b=PJdKDYgUaZA/UehS4Xd3wEPIiioucwcND3ptD2D7v+S54ZUPfzWHIOnmM7kSPW1GbM
 XaDNSJipI9ujE2VEdrh+xc2xCg+O3W2QMU32Wt71Rpc5QLcyNm1ofq4F0RlSMiRTstrv
 Dasn3OPjDJDY1dQAA4mPqbcpnzUiDxSp7GtnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686291690; x=1688883690;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=a4OGTmTOoclePfnYMeVJrtyNvDzJs1MMAejXe1lLF4U=;
 b=BxZunKcpqUesyJ9ayLgQC8ZGdgUnGuHdlXukJa3ahK3Gm5UwOxSscYqqr3xeCG3HgT
 MPj+EVDPXUkq7XyQCtCrcbuOK0CX8aCq6yryLQkGpylIf97q9JSopVfIFMZo8MjcK47r
 1ZAtAWo2X6xgxe7vPz2s0q26XnmDMS/Me8xWs6CHZWmsIGxwdeW9jiRCxlPqMsXalFpo
 ud746oc3tJdkRZUEafyaoqq6kkaMys/D0uOOzgA7dU6gBXT95ShZGuO0/d/BtmukDwe9
 HzFw5GC3qPpgdxg0gqK2lD5pYhp6SJGTiN6g/blv42g4tyrVO6nWYo4gVFtgxTck5mij
 WN/A==
X-Gm-Message-State: AC+VfDxJfeok682Vk/fTTd88i5zFDeGo2jldJwM68HrgSDgaJpiptsku
 miYP12b8Ez+/Jfbs6FYKFYvAB2H8KnkBApM2udOmiA==
X-Google-Smtp-Source: ACHHUZ5N9t7jcEWCElu1xnNfsr5T7b+XmrSFnzpR6SDsnY/0tVwurwLh2HYWfnNvOpO6xtmJ8sQVxSSIi4oTpzDGjlg=
X-Received: by 2002:a25:ab50:0:b0:bab:cc32:b6b with SMTP id
 u74-20020a25ab50000000b00babcc320b6bmr345973ybi.5.1686291690010; Thu, 08 Jun
 2023 23:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230607063139.621351-1-dario.binacchi@amarulasolutions.com>
 <20230607063139.621351-3-dario.binacchi@amarulasolutions.com>
 <7139fb21-6a1d-a26f-fef3-d3154d234ca2@foss.st.com>
In-Reply-To: <7139fb21-6a1d-a26f-fef3-d3154d234ca2@foss.st.com>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Fri, 9 Jun 2023 08:21:18 +0200
Message-ID: <CABGWkvoRZqQsEmpNRhhrRUrf+WHebErPO9Jt2L9bsNL_EKeoHg@mail.gmail.com>
Subject: Re: [RESEND PATCH v2 2/6] ARM: dts: stm32: add pin map for LTDC on
 stm32f7
To: Alexandre TORGUE <alexandre.torgue@foss.st.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, michael@amarulasolutions.com,
 Amarula patchwork <linux-amarula@amarulasolutions.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexandre,

On Thu, Jun 8, 2023 at 2:42=E2=80=AFPM Alexandre TORGUE
<alexandre.torgue@foss.st.com> wrote:
>
> Hi Dario
>
> On 6/7/23 08:31, Dario Binacchi wrote:
> > Add pin configurations for using LTDC (LCD-tft Display Controller) on
> > stm32f746-disco board.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> > (no changes since v1)
> >
> >   arch/arm/boot/dts/stm32f7-pinctrl.dtsi | 35 +++++++++++++++++++++++++=
+
> >   1 file changed, 35 insertions(+)
> >
> > diff --git a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi b/arch/arm/boot/dts=
/stm32f7-pinctrl.dtsi
> > index 9f65403295ca..f3f90b9bcd61 100644
> > --- a/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
> > +++ b/arch/arm/boot/dts/stm32f7-pinctrl.dtsi
> > @@ -365,6 +365,41 @@ pins2 {
> >                                       bias-pull-up;
> >                               };
> >                       };
> > +
> > +
> > +                     ltdc_pins_a: ltdc-pins-a-0 {
>
>   ltdc-pins-a-0 -->  ltdc-pins-0 is a bit cleaner. I know that I have to
> fix sdio pins nodes in this file to keep the same spirit for all group
> names.

I have looked at the file arch/arm/boot/dts/stm32f7-pinctrl.dtsi, and
based on the following nodes:
usart1_pins_a: usart1-0
i2c1_pins_b: i2c1-0
can1_pins_a: can1-0

I have decided to rename ltdc-pins-a-0 to ltdc-0.

I hope you agree.

Thanks and regards,

Dario

>
> If there is no V3 I wil do it directly when I'll apply DT patches if you
> agree.
>
> Alex
>
>
> > +                             pins {
> > +                                     pinmux =3D <STM32_PINMUX('E', 4, =
AF14)>, /* LCD_B0 */
> > +                                              <STM32_PINMUX('G',12, AF=
9)>,  /* LCD_B4 */
> > +                                              <STM32_PINMUX('I', 9, AF=
14)>, /* LCD_VSYNC */
> > +                                              <STM32_PINMUX('I',10, AF=
14)>, /* LCD_HSYNC */
> > +                                              <STM32_PINMUX('I',14, AF=
14)>, /* LCD_CLK */
> > +                                              <STM32_PINMUX('I',15, AF=
14)>, /* LCD_R0 */
> > +                                              <STM32_PINMUX('J', 0, AF=
14)>, /* LCD_R1 */
> > +                                              <STM32_PINMUX('J', 1, AF=
14)>, /* LCD_R2 */
> > +                                              <STM32_PINMUX('J', 2, AF=
14)>, /* LCD_R3 */
> > +                                              <STM32_PINMUX('J', 3, AF=
14)>, /* LCD_R4 */
> > +                                              <STM32_PINMUX('J', 4, AF=
14)>, /* LCD_R5 */
> > +                                              <STM32_PINMUX('J', 5, AF=
14)>, /* LCD_R6 */
> > +                                              <STM32_PINMUX('J', 6, AF=
14)>, /* LCD_R7 */
> > +                                              <STM32_PINMUX('J', 7, AF=
14)>, /* LCD_G0 */
> > +                                              <STM32_PINMUX('J', 8, AF=
14)>, /* LCD_G1 */
> > +                                              <STM32_PINMUX('J', 9, AF=
14)>, /* LCD_G2 */
> > +                                              <STM32_PINMUX('J',10, AF=
14)>, /* LCD_G3 */
> > +                                              <STM32_PINMUX('J',11, AF=
14)>, /* LCD_G4 */
> > +                                              <STM32_PINMUX('J',13, AF=
14)>, /* LCD_B1 */
> > +                                              <STM32_PINMUX('J',14, AF=
14)>, /* LCD_B2 */
> > +                                              <STM32_PINMUX('J',15, AF=
14)>, /* LCD_B3 */
> > +                                              <STM32_PINMUX('K', 0, AF=
14)>, /* LCD_G5 */
> > +                                              <STM32_PINMUX('K', 1, AF=
14)>, /* LCD_G6 */
> > +                                              <STM32_PINMUX('K', 2, AF=
14)>, /* LCD_G7 */
> > +                                              <STM32_PINMUX('K', 4, AF=
14)>, /* LCD_B5 */
> > +                                              <STM32_PINMUX('K', 5, AF=
14)>, /* LCD_B6 */
> > +                                              <STM32_PINMUX('K', 6, AF=
14)>, /* LCD_B7 */
> > +                                              <STM32_PINMUX('K', 7, AF=
14)>; /* LCD_DE */
> > +                                     slew-rate =3D <2>;
> > +                             };
> > +                     };
> >               };
> >       };
> >   };
>


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
