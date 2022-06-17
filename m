Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7006F54F6A4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 13:27:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1939611ACDA;
	Fri, 17 Jun 2022 11:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8844A11ACDA
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 11:27:06 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id q11so4216739iod.8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 04:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cIita4Mx/OZl+X+VeaS6ACjFa0zy1JtZ/wxGcvDjX4M=;
 b=cBnghZ9dK8jQypp2zWcU1IJmfJ9ib0azbSO3a6CUrQ6p7k8MqcOEu38UcGE/ELnbTj
 H8ijRkJPVfwZkD66BARfJX9oqGp5ge7C/Qw3DlQbZsvEEWj/J9mBU7bCEKxQwlnlHY9M
 SBloAA7m7tmnhDjWeMSIY/T7PARhocjfJGPxhzOeODLK3cPap+SSyb4kH1Z//ZuD4l8v
 x9YVQQnDeCAKKsgUNQMFXKyMOFvhFCJyKXsnWZg4h4AFQs9m8271FmL3Oc4bhBIDrys2
 AKhbEKwxmxTk/45W3UpXfGJzK42rRBHh7djKKQ7LrLGqFCSjNEcYTb/10k6Q8kliAaAJ
 T0AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cIita4Mx/OZl+X+VeaS6ACjFa0zy1JtZ/wxGcvDjX4M=;
 b=L0W25f0vVVkE8HlVqq4JR7dIRbLN00lLcMN6ogrqziNMCvQopnbJu5LWjmYRLUkThv
 g6HkxTZPWUDMqQfz1f9EuLEc1SF3Az75nN6U/x97bo55I0uY59auyFTxde4aRL0JHbSH
 itnaddJDC0ajPzr2I2t6X7HqbZMg9ml6nxT6uHIn+/loDeHg30UhhBPwiF8ct29Yntt2
 EQaOl7Rkjieu8WP3Qrs+Efz6YGaP+ObRUkXvlLdNzmbwynlybUCsWvGpM9gGDTEHtfuw
 JJRzBYStvVgHZ3cZr0FWUFywi4YNyL2IouobTVhnI57UHvYkpbR2+jyjNhAWJHkrDt3f
 HZuA==
X-Gm-Message-State: AJIora8c3QF+T2ALoC77m+1cHm437tRuppYrxGMqHHYmmwtKWUium/Iq
 vgS2EL+f4kLFp1JwBRmz+5HYQoAkREe83cjCeaw=
X-Google-Smtp-Source: AGRyM1v+uOPPKXH5BGj0nN0XZL/uXw8K7soKzPUvo/hXYcZRuyA8S1WlggM3NtZdIqlhGxZxIj4Std5tTPlwSTv8/pI=
X-Received: by 2002:a05:6638:d01:b0:331:d29a:8e60 with SMTP id
 q1-20020a0566380d0100b00331d29a8e60mr5201134jaj.254.1655465225916; Fri, 17
 Jun 2022 04:27:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220613111146.25221-1-peterwu.pub@gmail.com>
 <20220613111146.25221-7-peterwu.pub@gmail.com>
 <28b73da7-d97c-5ea5-0b22-724fa971aeb0@linaro.org>
In-Reply-To: <28b73da7-d97c-5ea5-0b22-724fa971aeb0@linaro.org>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 17 Jun 2022 19:26:55 +0800
Message-ID: <CABtFH5LTpHyaJvwr6WHWx89gdGmsD-inWJa_LidyJzSL5bxowg@mail.gmail.com>
Subject: Re: [PATCH v2 06/15] dt-bindings: mfd: Add Mediatek MT6370
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
Cc: devicetree@vger.kernel.org, Daniel Thompson <daniel.thompson@linaro.org>,
 krzysztof.kozlowski+dt@linaro.org, linux-pm@vger.kernel.org,
 linux-iio@vger.kernel.org, jingoohan1@gmail.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, ChiYuan Huang <cy_huang@richtek.com>,
 szunichen@gmail.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, pavel@ucw.cz, matthias.bgg@gmail.com,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2022=E5=B9=
=B46=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=BA=94 =E6=B8=85=E6=99=A85:15=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On 13/06/2022 04:11, ChiaEn Wu wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add Mediatek MT6370 binding documentation.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> >  .../bindings/mfd/mediatek,mt6370.yaml         | 279 ++++++++++++++++++
> >  .../dt-bindings/iio/adc/mediatek,mt6370_adc.h |  18 ++
> >  2 files changed, 297 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt63=
70.yaml
> >  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h
> >
> > diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml=
 b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> > new file mode 100644
> > index 000000000000..6c2639e81e50
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
> > @@ -0,0 +1,279 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mfd/mediatek,mt6370.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek MT6370 SubPMIC
> > +
> > +maintainers:
> > +  - ChiYuan Huang <cy_huang@richtek.com>
> > +
> > +description: |
> > +  MT6370 is a highly-integrated smart power management IC, which inclu=
des a
> > +  single cell Li-Ion/Li-Polymer switching battery charger, a USB Type-=
C &
> > +  Power Delivery (PD) controller, dual flash LED current sources, a RG=
B LED
> > +  driver, a backlight WLED driver, a display bias driver and a general=
 LDO for
> > +  portable devices.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6370
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  wakeup-source: true
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    const: 1
> > +
> > +  adc:
> > +    type: object
> > +    description: |
> > +      Provides 9 channels for system monitoring, including vbusdiv5, v=
busdiv2,
> > +      vbat, vsys, chg_vddp, ts_bat, ibus, ibat, and temp_jc.
> > +
> > +    properties:
> > +      compatible:
> > +        const: mediatek,mt6370-adc
> > +
> > +      "#io-channel-cells":
> > +        const: 1
> > +
> > +    required:
> > +      - compatible
> > +      - '#io-channel-cells'
>
> Decide in your entire patchset whether you use ' or ". Don't mix.

Thanks for your comments.
We apologize for doing these mistakes...
We will use the same symbol in the entire patchset and check again
before the next submission.

>
> Since you did not test your bindings, I am not reviewing it. First, test
> them. No need for me to do the job of a automated tool, right?
>
> Best regards,
> Krzysztof

Best regards,
ChiaEn Wu
