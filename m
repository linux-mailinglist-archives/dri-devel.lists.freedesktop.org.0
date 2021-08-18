Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 721133F093D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 18:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197396E861;
	Wed, 18 Aug 2021 16:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95FA6E866
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 16:35:46 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id y9so2024665qtv.7
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 09:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tmJKiPNiKUUnrVK28O79vtI4WwJ+n5/qI9gqt4lxJV0=;
 b=Uqgz+YlCd644E1nHcpNKD3hcOu63kdexN8G9RaivLVMbuguxJE8f+8zR7BDdKEvult
 EiBCnAvuhVGJE8v251+3Cmdfa7AeOoA+WFdlr+oE9if+nyGJFVB7gl1m4m7uvUA6ZTtk
 XQgnbuPy3LAP9osbD/vYZIjNtCBBiG9zuuQa98WNek3XrNdrnV5mm+sVB4qCHmRTVw6q
 oOpjB9YXQfaBx/NtrzqAkbuSy2UyOSC2FmAgoIq8dUmGmoPSh+4FMPHbrattflzmQAB1
 FsZ+TcjN3T0Osj4VsStSjVx+n0MDkn8oA42WEWDRLOCad67d/Wh8Fw45utdGsFbR9wcB
 nYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tmJKiPNiKUUnrVK28O79vtI4WwJ+n5/qI9gqt4lxJV0=;
 b=gFy7ugeguL4DXwa/BxDlhWCWzHFv4fFCB9zrh+i0EB5Iy0V7w169RdzkNNZGyDEqoE
 BBz2GNcQ3B3W/eWeUPH/B8WQ4zE+MnZf+/aW4BPVf4Ng+TdcqHtkhLrYvqs0WZB0G5qt
 0Q9ZxtverpUvvA3POAhioKjNGsNe481f6jVLZOgqGzMTARPcSaX87wwctRbCvUkAORMV
 LbfqxFzvcinq2t52p/bBMCfECtvsY6RdyJAwB9tOdHRl5mu7NywPWJdrcwkvjBwwj+wl
 iefrguUUusNh7GSNV4hR7wAPKEqMcGe1Q2hXX0KjUoM6AUKLmOvThY06MTnjld44nMWh
 RwwQ==
X-Gm-Message-State: AOAM5319EmWRpAJSvZC0CzNnsz7OKgs9j/Omcsotlmi/1nYrsHLc3fGX
 rwCHPz+/J00Td/GVEs5PLg1Xw2vbaeTZkc5YEw8UNg==
X-Google-Smtp-Source: ABdhPJyM9GTUAdEVWW9wP55hLFkgh/hK2KFTCGO7ikXX5jaanF4dFriXRfHHwwmicjraycKA0Rx7gdL7bNdmpyu0rn0=
X-Received: by 2002:ac8:66da:: with SMTP id m26mr8470973qtp.273.1629304545753; 
 Wed, 18 Aug 2021 09:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210809184712.203791-1-dmitry.baryshkov@linaro.org>
 <20210809184712.203791-2-dmitry.baryshkov@linaro.org>
 <YRwFqzIqwmkjgFAv@robh.at.kernel.org>
In-Reply-To: <YRwFqzIqwmkjgFAv@robh.at.kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 18 Aug 2021 19:35:34 +0300
Message-ID: <CAA8EJprpxkMrMyLkqF1bY9ftZt_vs=Kkdu6fxsfadTjg4w0fdg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: add bindings for the Sharp
 LS060T1SX01 panel
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, 17 Aug 2021 at 21:53, Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Aug 09, 2021 at 09:47:11PM +0300, Dmitry Baryshkov wrote:
> > Add devicetree bindings for the Sharp LS060T1SX01 6.0" FullHD panel
> > using NT35695 driver. This panel can be found i.e. in the Dragonboard
> > Display Adapter bundle.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  .../display/panel/sharp,ls060t1sx01.yaml      | 51 +++++++++++++++++++
> >  1 file changed, 51 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
> > new file mode 100644
> > index 000000000000..c4af5e7f6f39
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
> > @@ -0,0 +1,51 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/sharp,ls060t1sx01.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sharp Microelectronics 6.0" FullHD TFT LCD panel
> > +
> > +maintainers:
> > +  - Dmitry Baryskov <dmitry.baryshkov@linaro.org>
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: sharp,ls060t1sx01
> > +
> > +  reg: true
> > +  backlight: true
> > +  reset-gpios: true
> > +  port: true
> > +
> > +  avdd-supply:
> > +    description: handle of the regulator that provides the supply voltage
>
> Single supply? Use simple-panel binding. Or are your supplies
> incomplete?

True. I'll extend them in v2 according to the datasheet.

>
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - avdd-supply
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +
> > +    dsi {
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> > +
> > +        panel@0 {
> > +            compatible = "sharp,ls060t1sx01";
> > +            reg = <0>;
> > +            avdd-supply = <&pm8941_l22>;
> > +            backlight = <&backlight>;
> > +            reset-gpios = <&pm8916_gpios 25 GPIO_ACTIVE_LOW>;
> > +        };
> > +    };
> > +
> > +...
> > --
> > 2.30.2
> >
> >



-- 
With best wishes
Dmitry
