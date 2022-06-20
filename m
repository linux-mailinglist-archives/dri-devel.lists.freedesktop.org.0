Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC96550EC7
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 05:07:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40EED10F058;
	Mon, 20 Jun 2022 03:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265E810F058
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 03:07:40 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id 9so3197729ill.5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jun 2022 20:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ClA6mV7hozr21kuBkeCxjd9fGNxXJpc68c5A8HEJUUI=;
 b=gOpv1108ut5ySpAPndiTka0cdAPZs7Flmw6QF/XASUursDWrwbsAx9Vt+ZXF5kcdEw
 TCakBrMFGrsxiKWEOhenPFzr9LBdXhjmxW5370IMQcOOlgaFHdTNkBB+FXGyNxJcg61e
 E1CcWHlUQ+QDQ0SBGzNysb+dxHy8expVECKExkABctkP/dtbwAAACdK2L7UDO9Gbz48K
 ji3tgBrL0udfA8TkFrC8hp8qz2em39uxnCPqC9QkBkCfnnMqz+vlX4RNa8QIDVPQFIsS
 Tfem3Y9ER0V16TcCeQoXqA7MiKjEXoKy5//qqMQChDe5hPDjkyy9/RyTBkvqD/PR7kp3
 aZZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ClA6mV7hozr21kuBkeCxjd9fGNxXJpc68c5A8HEJUUI=;
 b=CF7i9IMfle6XyKxTpAQSVKRuCXO8v69mFfkn4ZhY1dy2Ar4Rc1c3p1pMnlZO/1vd2K
 WPn2/WQDyjDojrSxy6P66M7xAtLQNrUGs/emc4t2Ivqm7/aVFQD/NpVIVYgGGUyJL1KD
 gNlLb73qRVrm2gTbEshHCDHoraqqYgFr76sGCOP91Q88u8pwGyzC6hZCOAcaLt+4a0mO
 FmzlVveVCybAe2JWYS8VjQF6zn+kLfD3cBq5KsiiYiSdOKm0nw0hwxqgHpc3hCrqxaCX
 l9f45V5I5bF1l6AQkqgCkZTeZ3RdMQdEhC4gtm3p7yAlmDvGLnXk6olb5LeOoPgQxy2n
 kkLw==
X-Gm-Message-State: AJIora+sZYfTi+puhpCFzCWlHGgnOs+GUllvcjZFpbBYPH/MYH6HCdGF
 M+MIaYkUP4uiNqOHLCYyyku5Z3AUrzseJxtWRnc=
X-Google-Smtp-Source: AGRyM1uWx3Xja5gAlxQTsI9Gy8E4mbdwpO+4QcNSHclRnN4Pr80zjlE1E8X1wNostXJGk9TU7gkWHZtEAVASNa5cJX8=
X-Received: by 2002:a05:6e02:1bc1:b0:2d1:96b3:b961 with SMTP id
 x1-20020a056e021bc100b002d196b3b961mr12302759ilv.213.1655694460188; Sun, 19
 Jun 2022 20:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-4-peterwu.pub@gmail.com>
 <91e9e3af-8208-7535-1864-08744f934593@linaro.org>
In-Reply-To: <91e9e3af-8208-7535-1864-08744f934593@linaro.org>
From: szuni chen <szunichen@gmail.com>
Date: Mon, 20 Jun 2022 11:07:29 +0800
Message-ID: <CA+hk2fZbh0=8gurGS95XpXrYyF3NbwFbFMcygcrW_q10m0zinA@mail.gmail.com>
Subject: Re: [PATCH v2 03/15] dt-bindings: leds: mt6370: Add Mediatek mt6370
 current sink type LED indicator
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: devicetree <devicetree@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Linux PM <linux-pm@vger.kernel.org>, linux-iio <linux-iio@vger.kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, USB <linux-usb@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 ChiYuan Huang <cy_huang@richtek.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>,
 ChiaEn Wu <peterwu.pub@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Linux LED Subsystem <linux-leds@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Krzysztof,

Thank you for the valuable command.

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2022=E5=B9=
=B46=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=BA=94 =E6=B8=85=E6=99=A85:09=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On 13/06/2022 04:11, ChiaEn Wu wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add Mediatek mt6370 current sink type LED indicator binding documentati=
on.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> >  .../leds/mediatek,mt6370-indicator.yaml       | 48 +++++++++++++++++++
> >  1 file changed, 48 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/mediatek,mt6=
370-indicator.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/mediatek,mt6370-ind=
icator.yaml b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indica=
tor.yaml
> > new file mode 100644
> > index 000000000000..42b96c8047a3
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/mediatek,mt6370-indicator.=
yaml
> > @@ -0,0 +1,48 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/mediatek,mt6370-indicator.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: LED driver for MT6370 PMIC from MediaTek Integrated.
> > +
> > +maintainers:
> > +  - Alice Chen <alice_chen@richtek.com>
> > +
> > +description: |
> > +  This module is part of the MT6370 MFD device.
> > +  Add MT6370 LED driver include 4-channel RGB LED support Register/PWM=
/Breath Mode
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6370-indicator
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +patternProperties:
> > +  "^(multi-)?led@[0-3]$":
>
> If this is multi-led, then you should reference
> /schemas/leds/leds-pwm-multicolor.yaml
>
> See other examples using it.

In my opinion, leds-pwm-multicolor.yaml is used for external pwm
signals, and needs to assign an external pwm property.
But our pwm leds use an internal clock to generate the pwm signal. Is
leds-class-multicolor.yaml more appropriate?

Sincerely,
Alice
>
>
>
> Best regards,
> Krzysztof
