Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BFA53C428
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 07:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53EFD11378D;
	Fri,  3 Jun 2022 05:26:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 682EA11354E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 20:26:55 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id c196so5673253pfb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 13:26:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Kb/EgUnEl+66ubR0OBdnZBhP1OFKsT5B/tkrmGF5yWM=;
 b=NkE0Ee2nKeVG01X4TGf7Tds/HpDebAAGIAaGwKYQebrpvg7ak4oaNFBWIPs3Xdbx/6
 /ueM/g2UgL33WPhvSE1L6JXOWT5chkMdkpBYr1/zYN99/wpvyMYpmPhA1oytFSuRvYuV
 PNVqn/U5agKa+qIWBAIGEorsNvVDKBWugZg900PvAoG9Qmtwztu7xfeAcVkvqkOl0WYL
 cOZn4F9+0NeUducPaMA2Z6OZ8Mng1gwTUzPg03BP8mG4yWhRQRsi/9O5/gtaqrHqD4Bg
 4OA13xXtBNtUEnlW2r45PUnCTtuMdwsf1kr3gPJWnFj4wDmdBPTRZoNV0p1ETDx5FzvG
 2rSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Kb/EgUnEl+66ubR0OBdnZBhP1OFKsT5B/tkrmGF5yWM=;
 b=Gs/jyVoV2u9weN+qrOu0RGoTuO7ztX9ImgQuxsxVECDxCnXt6KPgdM0ImcsJwuClst
 +Iox5xxdYvPbjPw12Ba5on/VQQhuv6kKptmId/pBUq2tkrnXl3JXuljJ4MsYWgm/LlMp
 AYSvHaaVFwV+i13KaSvS2VrBIbRAa0djbbxEJ6ez4WePu3cxIXW2gs5Nqv8azKCTW0WT
 tQu/lZmUTzDq7j4FC5NicY/aDQO4y56cAGBjrTgIeiyCpZdP6rMKlWRXDhrfAi08Wjwq
 rRugXfY3c6+es5M8o9NLB1ubUrlsoZauRqn9lq/1YqOFfyD+wFVdAJScgL+4KxXrKkVY
 FupQ==
X-Gm-Message-State: AOAM5305l9LAJAP8WcDFOJI1YCYWLphmhFS5hK1NwmQt0crdN6gGUOHX
 N484nuYXkN1YVX+DMM4IgKLha33AbvJC8XSPGlNhRQNDdjo=
X-Google-Smtp-Source: ABdhPJys4WOb9urNyLdt4aeuOqGuCZdLw80FNC5PvFsBXte5r8ULYu9Wjjuq4Wzf+sPQ6VLvykCW8T4PAgm77gNu2zY=
X-Received: by 2002:a05:6e02:4a1:b0:2d3:a778:f0f1 with SMTP id
 e1-20020a056e0204a100b002d3a778f0f1mr3986818ils.212.1654194896902; Thu, 02
 Jun 2022 11:34:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220531104211.17106-1-peterwu.pub@gmail.com>
 <20220531104211.17106-2-peterwu.pub@gmail.com>
 <33a797d7-ca60-5153-2ba1-3a909fcc5965@linaro.org>
In-Reply-To: <33a797d7-ca60-5153-2ba1-3a909fcc5965@linaro.org>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 3 Jun 2022 02:34:45 +0800
Message-ID: <CABtFH5+nNRn4azfniKCNc=S2Z2Y0jji_beA_16_UYzAvkak-VA@mail.gmail.com>
Subject: Re: [PATCH 10/14] dt-bindings: power: supply: Add Mediatek MT6370
 Charger binding documentation
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 03 Jun 2022 05:26:38 +0000
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, alice_chen@richtek.com,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, ChiYuan Huang <cy_huang@richtek.com>, pavel@ucw.cz,
 lee.jones@linaro.org, linux-leds@vger.kernel.org, daniel.thompson@linaro.org,
 deller@gmx.de, robh+dt@kernel.org, chunfeng.yun@mediatek.com,
 linux@roeck-us.net, devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 chiaen_wu@richtek.com, gregkh@linuxfoundation.org, jic23@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Krzysztof,

Thank you for the valuable suggestion.
Sorry for sending the same email again. I forgot to reply to everyone
in my last email..

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> =E6=96=BC 2022=E5=B9=
=B46=E6=9C=881=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=884:15=E5=AF=AB=
=E9=81=93=EF=BC=9A
>
> On 31/05/2022 12:42, ChiaEn Wu wrote:
> > From: ChiaEn Wu <chiaen_wu@richtek.com>
> >
>
> Subject - remove "binding documentation". It's already implied by prefix.
>
> > Add Mediatek MT6370 Charger binding documentation.
> >
> > Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> > ---
> >  .../power/supply/mediatek,mt6370-charger.yaml | 60 +++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/power/supply/medi=
atek,mt6370-charger.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/power/supply/mediatek,mt=
6370-charger.yaml b/Documentation/devicetree/bindings/power/supply/mediatek=
,mt6370-charger.yaml
> > new file mode 100644
> > index 000000000000..9d5c4487ca9c
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/power/supply/mediatek,mt6370-ch=
arger.yaml
> > @@ -0,0 +1,60 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/power/supply/mediatek,mt6370-charge=
r.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek MT6370 Battery Charger
> > +
> > +maintainers:
> > +  - ChiaEn Wu <chiaen_wu@richtek.com>
> > +
> > +description: |
> > +  This module is part of the MT6370 MFD device.
> > +  Provides Battery Charger, Boost for OTG devices and BC1.2 detection.
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6370-charger
> > +
> > +  interrupts:
> > +    description: |
> > +      Specify what irqs are needed to be handled by MT6370 Charger dri=
ver. IRQ
> > +      "MT6370_IRQ_CHG_MIVR", "MT6370_IRQ_ATTACH" and "MT6370_IRQ_OVPCT=
RL_UVP_D"
> > +      are required.
> > +    items:
> > +      - description: BC1.2 done irq for mt6370 charger
> > +      - description: usb plug in irq for mt6370 charger
> > +      - description: mivr irq for mt6370 charger
>
> s/for mt6370 charger//
> in each item

I got it, this will be refined in the next version. Thanks!

>
> > +
> > +  interrupt-names:
> > +    items:
> > +      - const: attach_i
> > +      - const: uvp_d_evt
> > +      - const: mivr
> > +
> > +  io-channels:
> > +    description: |
> > +      Use ADC channel to read vbus, ibus, ibat, etc., info. Ibus ADC c=
hannel
> > +      is required.
>
> Constraints (e.g. maxItems) are needed.

OK, I will add them in the new version!

>
> > +
> > +  usb-otg-vbus:
>
> Let's keep the same name as in MT6360:
>
> usb-otg-vbus-regulator

I'll change the name to correspond with MT6360 in the next patch, thanks!

> > +    type: object
> > +    description: OTG boost regulator.
> > +    $ref: /schemas/regulator/regulator.yaml#
> > +
> > +    properties:
> > +      enable-gpio:
> > +        maxItems: 1
> > +        description: |
> > +          Specify a valid 'enable' gpio for the regulator and it's opt=
ional
>
> This description is pointless - does not bring any more information. You
> repeat the schema. Please, avoid such descriptions.

I got it, I will remove them in the next patch.

>
> > +
> > +required:
> > +  - compatible
> > +  - interrupts
> > +  - interrupt-names
> > +  - io-channels
> > +
> > +additionalProperties: false
>
>
> How about example? Or is it going to be in MFD schema?

All of MT6370 binding documentation examples are in the MFD schema! Thanks.

>
>
> Best regards,
> Krzysztof

Best regards,
ChiaEn Wu
