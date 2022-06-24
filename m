Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 861C35596BC
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 11:34:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F8C10E3C3;
	Fri, 24 Jun 2022 09:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04C6110E15E
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 09:34:50 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id a10so2099491ioe.9
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 02:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MP9RQT0mw2gx9xecm41XDjO0xQp/A9AAK0cYbd+v7PM=;
 b=XOSjJie8EVvJ68P8cDkEuXXdIP7YNykFHD5ucaFHa23sPTgdW5s+vEyYglwP5ITADf
 de6ih0EGdaikqxaCCoMYFOazeMTR+HJ2Od3FO0aVrMGZ9Ao0YQc3IGKpdK1KsldTwlvh
 mNgixo6yDK8vv6W4zP9rFZEgeSROQH0wRlhznnuez0r+LK3zlRzbpSDq8zkiXpRGsUdD
 wlBFXBP+v/yudkNVKvRuUvTnfyVEt9q4H+CcHi3K0tEYuY/us9b2jbsRIceZSdwT323h
 bCW6ZtoKL/DDgyl9mBYWdF/TeTYV9OJiSRhfvnTTdEl5HuLFgATDlbAUJ79bLaqNIqyo
 pjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MP9RQT0mw2gx9xecm41XDjO0xQp/A9AAK0cYbd+v7PM=;
 b=fFnLVZlUaTqQzQ7DX+zKctYhVQuq61XkdI+JN1cvmPGEtFvpfYedymc5dePrULwfgu
 kzw+VIGpuFgegWz5YTtJ7/fFXxgUrdNWwiZPrt/Y+3bhZXQCZS1+eC/Y64gNDXkMEe3Q
 QYeThfDTpRdcDSmqA2mF9b0U6SzWaydza+4lxtS40IPlSq31BtdS0i/CNnlWQT9NSg/Q
 zuMSV+O7HL3MCJNWAIed3ihP5GkHp9xVbsGqWCkvu3P59NhL54u94Bv3rnbX35VW8BIM
 QF0Qgkj+SOkJCC7XFtEvFEEXCjox7ERIO2Y2MBc08O3o+CHy0Q7eFYmVJi0R3zDGZXnr
 QSpw==
X-Gm-Message-State: AJIora/GtC7LJdlt7bzKXl0wkxdPpwnJqxpIalR2NMgFyLOfWK+MbLZX
 72p4m/eX5jXd1uswUjmGBpWbVPe/QIvBLiSu8yw=
X-Google-Smtp-Source: AGRyM1uasjCkCSVNNk3dqGVMtMHhWuLiOU+3vPo8KNEsy3IZCmdFQUJiWYJTC/E8bQMesuaOX1oy1FkolQJLbHcM1Io=
X-Received: by 2002:a05:6638:348d:b0:331:d8f0:fd9d with SMTP id
 t13-20020a056638348d00b00331d8f0fd9dmr7928714jal.165.1656063287244; Fri, 24
 Jun 2022 02:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220623115631.22209-1-peterwu.pub@gmail.com>
 <20220623115631.22209-6-peterwu.pub@gmail.com>
 <YrRny9TPqMUW7Yr/@spruce>
In-Reply-To: <YrRny9TPqMUW7Yr/@spruce>
From: ChiaEn Wu <peterwu.pub@gmail.com>
Date: Fri, 24 Jun 2022 17:34:36 +0800
Message-ID: <CABtFH5JdPHfvGi+tG+EKh_-XH0YxWHR3o=LsPAdW38e8fFoBeg@mail.gmail.com>
Subject: Re: [PATCH v3 05/14] dt-bindings: backlight: Add Mediatek MT6370
 backlight
To: Joe Simmons-Talbott <joetalbott@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, heikki.krogerus@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, Alice Chen <alice_chen@richtek.com>,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lgirdwood@gmail.com, ChiYuan Huang <cy_huang@richtek.com>, pavel@ucw.cz,
 Lee Jones <lee.jones@linaro.org>, linux-leds@vger.kernel.org,
 Daniel Thompson <daniel.thompson@linaro.org>, deller@gmx.de,
 robh+dt@kernel.org, chunfeng.yun@mediatek.com, linux@roeck-us.net,
 devicetree@vger.kernel.org, linux-pm@vger.kernel.org, szunichen@gmail.com,
 broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, jingoohan1@gmail.com,
 linux-usb@vger.kernel.org, sre@kernel.org, linux-kernel@vger.kernel.org,
 ChiaEn Wu <chiaen_wu@richtek.com>, gregkh@linuxfoundation.org,
 Jonathan Cameron <jic23@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Joe,

Joe Simmons-Talbott <joetalbott@gmail.com> =E6=96=BC 2022=E5=B9=B46=E6=9C=
=8823=E6=97=A5 =E9=80=B1=E5=9B=9B =E6=99=9A=E4=B8=8A9:17=E5=AF=AB=E9=81=93=
=EF=BC=9A
>
> On Thu, Jun 23, 2022 at 07:56:22PM +0800, ChiaEn Wu wrote:
> > From: ChiYuan Huang <cy_huang@richtek.com>
> >
> > Add mt6370 backlight binding documentation.
> >
> > Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> > ---
> >
> > v3
> > - Rename "mediatek,bled-pwm-hys-input-threshold-steps" to
> >   "mediatek,bled-pwm-hys-input-th-steps"
> > - Refine "bled-pwm-hys-input-th-steps", "bled-ovp-microvolt",
> >   "bled-ocp-microamp" enum values
> > ---
> >  .../leds/backlight/mediatek,mt6370-backlight.yaml  | 92 ++++++++++++++=
++++++++
> >  1 file changed, 92 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/me=
diatek,mt6370-backlight.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/mediatek,=
mt6370-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/me=
diatek,mt6370-backlight.yaml
> > new file mode 100644
> > index 0000000..26563ae
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/mediatek,mt6370-=
backlight.yaml
> > @@ -0,0 +1,92 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/mediatek,mt6370-back=
light.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Mediatek MT6370 Backlight
> > +
> > +maintainers:
> > +  - ChiaEn Wu <chiaen_wu@richtek.com>
> > +
> > +description: |
> > +  This module is part of the MT6370 MFD device.
> > +  The MT6370 Backlight WLED driver supports up to a 29V output voltage=
 for
> > +  4 channels of 8 series WLEDs. Each channel supports up to 30mA of cu=
rrent
> > +  capability with 2048 current steps (11 bits) in exponential or linea=
r
> > +  mapping curves.
> > +
> > +allOf:
> > +  - $ref: common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: mediatek,mt6370-backlight
> > +
> > +  default-brightness:
> > +    minimum: 0
> > +    maximum: 2048
> > +
> > +  max-brightness:
> > +    minimum: 0
> > +    maximum: 2048
> > +
> > +  enable-gpios:
> > +    description: External backlight 'enable' pin
> > +    maxItems: 1
> > +
> > +  mediatek,bled-pwm-enable:
> > +    description: |
> > +      Enable external PWM input for backlight dimming
> > +    type: boolean
> > +
> > +  mediatek,bled-pwm-hys-enable:
> > +    description: |
> > +      Enable the backlight input-hysteresis for PWM mode
> > +    type: boolean
> > +
> > +  mediatek,bled-pwm-hys-input-th-steps:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    enum: [1, 4, 16, 64]
> > +    description: |
> > +      The selection of the upper and lower bounds threshold of backlig=
ht
> > +      PWM resolution. If we choose selection 64, the variation of PWM
> > +      resolution needs over than 64 steps.
>
> more than?
>
> Thanks,
> Joe
>

Thanks for your helpful comments!
I will revise this in the next patch. Thanks!

> > +
> > +  mediatek,bled-ovp-shutdown:
> > +    description: |
> > +      Enable the backlight shutdown when OVP level triggered
> > +    type: boolean
> > +
> > +  mediatek,bled-ovp-microvolt:
> > +    enum: [17000000, 21000000, 25000000, 29000000]
> > +    description: |
> > +      Backlight OVP level selection.
> > +
> > +  mediatek,bled-ocp-shutdown:
> > +    description: |
> > +      Enable the backlight shutdown when OCP level triggerred.
> > +    type: boolean
> > +
> > +  mediatek,bled-ocp-microamp:
> > +    enum: [900000, 1200000, 1500000, 1800000]
> > +    description: |
> > +      Backlight OC level selection.
> > +
> > +  mediatek,bled-channel-use:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    description: |
> > +      Backlight LED channel to be used.
> > +      Each bit mapping to:
> > +        - 0: CH4
> > +        - 1: CH3
> > +        - 2: CH2
> > +        - 3: CH1
> > +    minimum: 1
> > +    maximum: 15
> > +
> > +required:
> > +  - compatible
> > +  - mediatek,bled-channel-use
> > +
> > +additionalProperties: false
> > --
> > 2.7.4
> >

Best regards,
ChiaEn Wu
