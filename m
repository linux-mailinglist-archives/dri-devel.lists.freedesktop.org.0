Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC01273B648
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 13:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1EF110E046;
	Fri, 23 Jun 2023 11:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D021910E046
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 11:32:11 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-311367a3e12so622919f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 04:32:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687519930; x=1690111930;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=P9ZwMVs40czKD5XDSrs3iEN9LA7uWnLI8CR5BnKA0UY=;
 b=CBjeN7Yvl5QDbituklmqZYeodwleXYQass+yos6URLcHssixFhCMZxvF+jOiJBronY
 TUc+FzMyHVmqqqWiV9V+k5l6twTk122i3RyDlVkNHI3MWhcxB6hJgbF81mldq2SB0/o4
 +TSgcFT7VMD+sL+b8QR5RByGb5dEfhRF0t4C3w3BJBiJ2+UdO5VsrRvXs3LNp6ofdMjA
 kDgPzaJc8xIdR8XyFaJuykoj1vS04qnfS239pyKpQrtH4itrndfzksqWEYdq6rF8AQq/
 PhsCgdhin9pB5O5vUA8m9f+mNTumHP8dApeX+y6jtCT4yI/ogr8Conin9X3SJ2MG2PpU
 0u9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687519930; x=1690111930;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P9ZwMVs40czKD5XDSrs3iEN9LA7uWnLI8CR5BnKA0UY=;
 b=Tm0gOvXceD1cHI/iu+Xp2CZ/hMf9sxTOh1mN0sojuHPN0Y+IO7Z3lLHfpQuHlQxZVx
 DyH5glQ09kpDpFI+EUPEu1qshbqoaU8/qHawpvAeh7IVweMipD2GremAvsTG+mAIEppZ
 mFhS8Mrf4MW/BYiOI0y+TqYY/kC20EP4HUjewgFJEdtj0DWvgkoLU8wSWiXTQTik5pe4
 MeO+90dyLL7nRgRuvp94Qy3/qk+CglbribGb60pNruuFK+DCYi0/cDqIpKAmnmO+TK90
 fRZaN/SRvXYlFJez60LyiI7aqSqbMgja37JmZU8fSvkJHyuqWL15lz1Ui4TTPJTVXNQs
 opEA==
X-Gm-Message-State: AC+VfDzGc5xAVmcb1+k4pxBEb8my7HVsdKT91i2BCSlrI13WnykUtUsX
 Xc9EGAij3LO70epBgfizHhMrRA==
X-Google-Smtp-Source: ACHHUZ4yGE7Jj/528UNR5dVYTd1jl6cieW71vsAHwRVCrwh0+5oIyPiflT16AwEbtFUCmIfx+HhwlQ==
X-Received: by 2002:a5d:5751:0:b0:30f:c943:f925 with SMTP id
 q17-20020a5d5751000000b0030fc943f925mr16966957wrw.49.1687519929755; 
 Fri, 23 Jun 2023 04:32:09 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a5d54c7000000b0031270cf1904sm9365570wrv.59.2023.06.23.04.32.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jun 2023 04:32:09 -0700 (PDT)
Date: Fri, 23 Jun 2023 12:32:07 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Alexandru Ardelean <alex@shruggie.ro>
Subject: Re: [PATCH v2 1/2] dt-bindings: backlight: document new property
 default-brightness-level
Message-ID: <20230623113207.GB4426@aspen.lan>
References: <20230621215457.11297-1-alex@shruggie.ro>
 <20230622021303.GA68330-robh@kernel.org>
 <CAH3L5Qp3q=K5w+LbccZBJqvkz98WgFLqg__y7Be_=-2GsWQs+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH3L5Qp3q=K5w+LbccZBJqvkz98WgFLqg__y7Be_=-2GsWQs+Q@mail.gmail.com>
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
Cc: conor+dt@kernel.org, linux-fbdev@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
 jingoohan1@gmail.com, deller@gmx.de, lee@kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, pavel@ucw.cz,
 Yannick Fertre <yannick.fertre@foss.st.com>, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 23, 2023 at 10:19:57AM +0300, Alexandru Ardelean wrote:
> On Thu, Jun 22, 2023 at 5:13 AM Rob Herring <robh@kernel.org> wrote:
> > > +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> > >    default-on:
> > > -    description: enable the backlight at boot.
> > > +    description:
> > > +      The default power state of the backlight at boot.
> > >      type: boolean
> > >
> > > +  default-brightness-level:
> > > +    description:
> > > +      The default brightness level on device init. The value can be 0 or 1.
> > > +      If omitted, the value is 1. In the context of the "gpio-backlight" driver
> > > +      the effect of this setting will be that the backlight is on/off.
> > > +      The difference between this setting and "default-on" is that this handles
> > > +      brightness, while "default-on" handles the power setting of the device.
> >
> > What power setting? You only have 1 GPIO to control here which is 2
> > states.

There are at least three states: On/Off/HiZ .

Currently the DT description isn't acually rich enough to allow drivers
to safely use the HiZ state so that is not why this change is potentially
useful today (but does illustrate why it is not "wrong" to put it on the
h/ware description).


> > I fail to see why you need 6 possible states with all the
> > combinations of 2 properties.
>
> So, the "default-on" bool gets converted to backlight power settings,
> which eventually gets converted back to GPIO values (at some point).
> Which sounds quirky (when saying/writing it).

Modern DT practice is to for the display to link to backlight. This
gives display control over power state (so backlight automatically
follows the display power state). On such systems the backlight will
be turned "on" when the display hardware comes up (regardless of whether
or not default-on is set).

Thus this control covers the case where we have a display that is
readable when the GPIO is off (e.g. transflexive LCD or epaper).
A display that is readable with the GPIO off means the default
brightness brightness at boot can meaningfully be zero. In this
case the backlight is nominally on but the GPIO is off.

In short, this becomes part of the hardware description, rather than
merely being a driver feature, due to the effect of linking display
to backlight in the DT.

Note also that most backlights do expose on/off via DT for the same
reasons (when the off and zero states both result in the backlight
output pin doing physically the same thing).


> But, yeah.
> That's one thing that also made me a bit undecided to send this.
> On the one hand I like the uniformity it brings.
> On the other hand, because there is the legacy behavior (the
> "default-on" property, and the fact that we can use the GPIO DT
> settings to control this) just explodes complexity/quirks.
>
> We can probably just drop this.
> I'll also admit that my doc-writing skills aren't too great.

It may be potentially useful for people building kit with sunlight
readable displays and trivial backlights as a backup in the dark.

Of course if the pin the backlight is connected to is PWM capable
then the PWM backlight is probably a better bet ;-) .


Daniel.
