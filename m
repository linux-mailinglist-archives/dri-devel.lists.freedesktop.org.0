Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DED824A7E2
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 22:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D967B6E81D;
	Wed, 19 Aug 2020 20:46:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3796E81D
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 20:46:54 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id v15so12762355lfg.6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 13:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qi99Xq7OFQtrS3HvWRrLPLcLhnBb4j7+vDIzg/ZS78U=;
 b=YMy1Q/pcnLqeeA4tcagxpLCBlFHveuLAHO/mv7p7YaiDnH5i01ZbfCeL3FFDRbbdDb
 u2/F+vcssHM25YD3/byL5svh/FM6YW1ad7IHD8A9H0ZE/swjCcbNZ3QCN6qhFrw9FjGB
 2kMCNQ/m7ygfUwNrNVnQ6sM8RsRNjvlPnSsA9p4RaUldiYDvXI0rM3Kj4vfm0qtSWaVk
 PYQ8xmK4JwsJvbagsW4QiUNTkIlDizXPreLh4ep4JtsT24sARIsmkev0qxgI6OAUc7HJ
 iVn6h5SJquF8Jf797Lfxz4bnBo5pHxD7N1G4fiXGOVFom2E+ahIPOKTIVZ7mK3q4hMPA
 ga6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qi99Xq7OFQtrS3HvWRrLPLcLhnBb4j7+vDIzg/ZS78U=;
 b=szOflBh2ZIvc1H029KGXR+GWUMRd4eqQDImDPxzTpTeA2Vgj5hT8xWLihsdLGsyEej
 32zucupCuGXGxOA8SGVa3Q6ryGdld//08dJ0MdRDNjqiKDwBVpMT2PhhdLxjIROGmQZO
 wfjmTZzs8k+XejnAmhmCVp3zHrLhHnolxS6g87/yzJoIXI/WiWVjOHGtuInLWBNBwsWj
 6yqjn/O/VvPy3Q5exUnUwoCE9PQF8WpGBWZrABNCsyM3JtYbDaPgkpth6wlT0z4Lcq5i
 C3awyR/cewEkkHrz7QrqIycOP8B9xsjOeUWvTYBKFrvOXkidhXpeaOfy2vWxSW/Kh6AY
 8ztw==
X-Gm-Message-State: AOAM532NzPIkUsGOj8ghd3wfQFa3V5V2nsGPQg+JRIrVKCCHMqtIngzo
 z/2LXskKzVc53etOcnWmStJObwEugmkW9OXiIRDjow==
X-Google-Smtp-Source: ABdhPJxYsaEQNSGTuSsMUNmBMUPNhsmvD7Dua6a20QK/pxww6zjEfIY87vu/7DoXyEUieTD58VtbtuACfuT4CzMc5z0=
X-Received: by 2002:ac2:4c05:: with SMTP id t5mr13104401lfq.89.1597870012976; 
 Wed, 19 Aug 2020 13:46:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200812085850.2643820-1-linus.walleij@linaro.org>
 <CAL_JsqLR3HEsbuNq7i+N3ETYVoMtUP90_Ev=tO8GJr+fF4QHWQ@mail.gmail.com>
In-Reply-To: <CAL_JsqLR3HEsbuNq7i+N3ETYVoMtUP90_Ev=tO8GJr+fF4QHWQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Aug 2020 22:46:41 +0200
Message-ID: <CACRpkdYOym=0BOsTr=bh4Zax5euj9RcRzZ_keUL3Z1EN+UykWw@mail.gmail.com>
Subject: Re: [PATCH 1/3 v2] dt-bindings: backlight: Add some common backlight
 properties
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
 <devicetree@vger.kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 Lee Jones <lee.jones@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 5:46 PM Rob Herring <robh@kernel.org> wrote:
> On Wed, Aug 12, 2020 at 2:58 AM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > Let's use a common.yaml include for the backlight like we do with
> > the LEDs. The LEDs are inherently incompatible so their bindings
> > cannot be reused for backlight.
> >
> > Cc: devicetree@vger.kernel.org
> > Suggested-by: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > ChangeLog v1->v2:
> > - New patch as suggested by Sam.
> > ---
> >  .../bindings/leds/backlight/common.yaml       | 42 +++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/common.yaml
>
> I'd expect some refactoring here with existing backlight schemas
> including the ones I just added for 5.9.

Yeah if it takes off I can certainly make a slew of refactorings,
I would like to do that once this is applied.

> > +  LED powered by a boost converter.
> > +
> > +properties:
> > +  default-on:
> > +    description:
> > +      The initial state of the backlight can be set to be on with this
> > +      property. This is a state applied by the operating system so that the
> > +      backlight is always turned on at boot.
>
> Needs a type.

Dropping this property because the subsystem maintainer
doubts this is needed.

Fixed the rest!

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
