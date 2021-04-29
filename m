Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C51836F184
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 23:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 458456F4BE;
	Thu, 29 Apr 2021 21:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D701B6F4BE
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 21:03:32 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id i17so3172112qki.3
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 14:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xRU2yBtauvlwmgJ+pf3kg4KpnBtBpDuxDmDITGaelXM=;
 b=MxcB5px72C8+5vJCXXHc+ftOlbOvLaOIZCcSYXwDudiJ5T6uRWCF3IbA/q7i0v05H4
 b5+Xhyg/FMAavwP1EiO0TTX+zk0MdwRoYHVLZbsieoDElYIszlwp9kC2cL2arlNwdmht
 5eSBc+Cb7eohKUohNBZmGo0StBZWqhQKL+4x4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xRU2yBtauvlwmgJ+pf3kg4KpnBtBpDuxDmDITGaelXM=;
 b=OKl3HLEONG87o5vAjRksTBMqZX4DyDJrb3BASIC+oM0Iaz+CtWHGJSZmYHJvjr0gK4
 bnuK7lAPcv9SEiM8gY4aTa2KBcRzOvh7d1KaIS1HhZL/7zuoICTQzBgb0NqwSI+4g+ce
 qgZln4UPDhkZaqTznPnY8r3lVLmUbvtKnUeUQbpcX2ywRsRyiPbf9VOd0LzrIui/gSiG
 bu8wMt9PPzxUBS/X8Ekv/oH2BD7spU/GP9Ol58+tRvuNaj80Q0QKuoaoTJxPgpK9UP1T
 PxlEQn0zrJqBHPe9GvUqseFiZUR2elmTgmJ19ep4okMgcy76FoZA//wvvB7CP4hDxUKn
 SJIg==
X-Gm-Message-State: AOAM533zt1WjSjPcNKAQinsIQSBUWCHZWaFmJoMQ4XuNUpFrlwfKdRCl
 81L7K54BBU/ADK/jUY2wdwtRJ2siCfpfJg==
X-Google-Smtp-Source: ABdhPJzTK23yo7s0ePRXG5YKjfAWPVtB9mJETE4+zTT5NHdA8J/V3dhHIo0JUCEJ6pVie8/qncdHTQ==
X-Received: by 2002:ae9:e508:: with SMTP id w8mr1794452qkf.262.1619730211696; 
 Thu, 29 Apr 2021 14:03:31 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176])
 by smtp.gmail.com with ESMTPSA id l9sm796918qtu.70.2021.04.29.14.03.30
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 14:03:30 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id p126so26699764yba.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 14:03:30 -0700 (PDT)
X-Received: by 2002:a05:6902:4e2:: with SMTP id
 w2mr2101815ybs.79.1619730210214; 
 Thu, 29 Apr 2021 14:03:30 -0700 (PDT)
MIME-Version: 1.0
References: <1619416756-3533-1-git-send-email-rajeevny@codeaurora.org>
 <1619416756-3533-2-git-send-email-rajeevny@codeaurora.org>
 <20210429180435.GA1385465@robh.at.kernel.org>
In-Reply-To: <20210429180435.GA1385465@robh.at.kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Apr 2021 14:03:18 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V-kdySH5Pp-Fb-PRYk60Ha_UOTXJHcvMp+uV3P1oo7Uw@mail.gmail.com>
Message-ID: <CAD=FV=V-kdySH5Pp-Fb-PRYk60Ha_UOTXJHcvMp+uV3P1oo7Uw@mail.gmail.com>
Subject: Re: [v3 1/2] dt-bindings: backlight: add DisplayPort aux backlight
To: Rob Herring <robh@kernel.org>
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
 <devicetree@vger.kernel.org>, Rajeev Nandan <rajeevny@codeaurora.org>,
 mkrishn@codeaurora.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Apr 29, 2021 at 11:04 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Apr 26, 2021 at 11:29:15AM +0530, Rajeev Nandan wrote:
> > Add bindings for DisplayPort aux backlight driver.
> >
> > Changes in v2:
> > - New
> >
> > Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> > ---
> >  .../bindings/leds/backlight/dp-aux-backlight.yaml  | 49 ++++++++++++++++++++++
> >  1 file changed, 49 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> > new file mode 100644
> > index 00000000..0fa8bf0
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> > @@ -0,0 +1,49 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/leds/backlight/dp-aux-backlight.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: DisplayPort aux backlight driver bindings
> > +
> > +maintainers:
> > +  - Rajeev Nandan <rajeevny@codeaurora.org>
> > +
> > +description:
> > +  Backlight driver to control the brightness over DisplayPort aux channel.
> > +
> > +allOf:
> > +  - $ref: common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: dp-aux-backlight
> > +
> > +  ddc-i2c-bus:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description:
> > +      A phandle to the system I2C controller connected to the DDC bus used
> > +      for the DisplayPort AUX channel.
> > +
> > +  enable-gpios:
> > +    maxItems: 1
> > +    description: GPIO specifier for backlight enable pin.
> > +
> > +  max-brightness: true
> > +
> > +required:
> > +  - compatible
> > +  - ddc-i2c-bus
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    backlight {
> > +        compatible = "dp-aux-backlight";
> > +        ddc-i2c-bus = <&sn65dsi86_bridge>;
> > +        enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
>
> So the DDC bus is connected to a backlight and also a panel? This
> binding is not reflecting the h/w, but rather what you want for some
> driver.
>
> There's only one thing here and that's an eDP panel which supports
> backlight control via DP aux channel. You can figure all that out from
> the panel's compatible and/or reading the EDID.
>
> You might also be interested in this thread:
>
> https://lore.kernel.org/lkml/YIKsDtjcIHGNvW0u@orome.fritz.box/

I think Rajeev needs to rework everything anyway as per:

https://lore.kernel.org/r/87zgxl5qar.fsf@intel.com

...but you're right that it makes sense not to model the backlight as
a separate node in the device tree. The panel driver can handle
setting up the backlight.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
