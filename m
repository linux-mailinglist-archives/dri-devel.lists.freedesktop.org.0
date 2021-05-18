Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D29B1387BA8
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 16:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E515C884B0;
	Tue, 18 May 2021 14:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB828884B0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 14:49:57 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id k22so85762vko.6
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 07:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y10PWJw0DRQc++ZzVaFYO8op4Q+GioEhXZLxuqYRvPE=;
 b=EDu1E9dz8wbyEJfuW5Cq38qn4ugcOyLofXEpbdnHJtBMVQGAI+jO45BMF/3ONsdXA/
 oLd3BMcxQTid3uUOfjBgsxNEU2MFOU9+/0EBKlE6FHrGdBzov9wiPQQ1eKjw0jWU78KR
 1ci0GPX3yy0bajpqvRM77MOSeYKZOPjHLt5wEXbwyGAp4oo1ZFIBcZ3FJcI0Q/uajI6F
 TkQJ5a7Zx42ZXdYmLSwxLGiZPOXBbLyfzsPJW/2g8NPp5++pQsARWG8nfyZQeGbAMKtP
 7zQBBFPZ4zer/mlTh1g9sQuVobkeLFkknorR/G/UQ3khgtNzpkHw942W20dZjlSyAi+T
 Qr0Q==
X-Gm-Message-State: AOAM531BGi9rzL1MfsbLnbm+XxzNGp4g/ruSog0D6d2+7rwu9BcojIVi
 nopP/tgqEUHIR3SI39nADkj0R+UjRSajhCZ/XfYaQZbrTLY=
X-Google-Smtp-Source: ABdhPJxt3csEOJ+HZlUNZyI4+ozqFzhRSPkaymurZ7JCVflSiXGt84wNn+aIH/66rsKkPf6/JaIeeeHvYwGOSw2pHqA=
X-Received: by 2002:a1f:eac1:: with SMTP id i184mr6332144vkh.2.1621349396836; 
 Tue, 18 May 2021 07:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210518075131.1463091-1-geert@linux-m68k.org>
 <20210518143317.yy2sxxnd7yt6cyrx@gilmour>
In-Reply-To: <20210518143317.yy2sxxnd7yt6cyrx@gilmour>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 May 2021 16:49:45 +0200
Message-ID: <CAMuHMdXKaLpLL5Q1FnjHJ5kbs=+9Mm-QHXZp1i3M4zNr7G=e_w@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: ssd1307fb: Convert to json-schema
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Rob Herring <robh+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Maxime,

On Tue, May 18, 2021 at 4:33 PM Maxime Ripard <maxime@cerno.tech> wrote:
> On Tue, May 18, 2021 at 09:51:31AM +0200, Geert Uytterhoeven wrote:
> > Convert the Solomon SSD1307 Framebuffer Device Tree binding
> > documentation to json-schema.
> >
> > Fix the spelling of the "pwms" property.
> > Document default values.
> > Make properties with default values not required.
> >
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> > ---
> > I have listed Maxime as the maintainer, as he wrote the original driver
> > and bindings.  Maxime: Please scream if this is inappropriate ;-)
>
> Fine by me :)

Thanks!

> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/solomon,ssd1307fb.yaml

> > +  solomon,dclk-div:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 1
> > +    maximum: 16
> > +    description:
> > +      Clock divisor. The default value is controller-dependent.
>
> I guess we could document the default using an if / else statement?

While clk-div has only two different defaults, dclk-frq has different
defaults for each of the 4 variants supported.

Do you think it's worthwhile doing that? All upstream DTS files lack
these properties, thus use the default values.

> Looks good otherwise :)

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
