Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D809F7AC7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 12:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5084410E127;
	Thu, 19 Dec 2024 11:54:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="YTMtcxi/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B718D10E127
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 11:54:50 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-6eff4f0d627so6351897b3.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 03:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734609290; x=1735214090;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gmwgUwZYCEh0dqq4h2U8DQ56kDdJWEaehUfFWLrhQUM=;
 b=YTMtcxi/m0WekKAzK0+bcCIaua7tw4PZfYpWom7pipdu9PKvm/dtbMsyqU2resAo6h
 tQv/60jYsayQnoEZLarJxkjXfr0m7FlOI1KAL7It4H13ZAWYMDdkkEeH/lXzJoP5s+VR
 aMBx1Kj2oKf16DAEKDbnSN+JPk2ju6mDgi/iYhidcObBtlFKPb0QM6Z+P4d/NMC8A/Mq
 t5jUtdXPBAWq/NL9oTbLinfhDmHKdCAI+yAiz+Bpniv8aBLdMLOefEo7n8TQvnPUIo69
 Tyq99f41ba8aRjKJ9Dsf4KulEIxz+BTon0Mb/jbpm6mtpllWrFj/DXvMQ5DbgpbuIFRC
 2TnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734609290; x=1735214090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gmwgUwZYCEh0dqq4h2U8DQ56kDdJWEaehUfFWLrhQUM=;
 b=itF+WMGcKo/7ncSXfhv10rYlFCfO+2FM/E2qPFP/ph3bw+Cs2bHySGM1vqa52p9RKV
 JzH2LfdAQNmyl9zf2miIbCf6VnOfj4uzmu0sT84Yo0ARlvnt4z8nUXXKXCratgA81T/7
 I2+frOELcC9dSn4IofejVf1hd37GFMCo0gmgrOhWKfzByvqp3IiiIMoFEkAzMCNCPrTH
 5Bsou2+HFQI0Ytw+CxiPJDkkLqwlOji18jxRNT0lSyCPcgrKBi3zcS/LhULngxry9cc3
 16zGFGVZJz0B0IcLxhKSbmbne/CIUiGl7ROfrA/rag3qCHUMVtYcNqYIRLlJ27xEPXq+
 M4QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF8mgzenwdrVpWzxOOHkjFxZ9r7Aq3QAFznsModWSxxDiFUNIXwo1LBqC6DGno5LKkeyZQMGFSOEY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwA5kqQASTMdXaLF7VLcs1KMCy3pPABbw/y95FdEXnvEpqhPTam
 dLkTGROB7C3rTfpFgSXfN9oats6fma55BTWvtiCzRdWySVyMQiXNwr0sxzLWDhOy7fCXi4JJKaz
 0gKE5jt15kiPcKhobOPwaksLr9phX11LeSvdZyw==
X-Gm-Gg: ASbGncvgsgOoR9oXj4Po4XUWuMVyXiNIvqN1plr3yct8vjAqOfnWtrqkbjHv8BUQDKk
 ODIhot5vhe4AViQDjlStB92hpsoXKa2hRQFecXA==
X-Google-Smtp-Source: AGHT+IF2LLGkHaJSarnPgvm0Kgxntz+fNWmnGhoCtlmHL5N4aI/xdAXLlv+RE/jSC8BOvNaB9ScXG0+oPhs6feqpfqg=
X-Received: by 2002:a05:690c:f86:b0:6ef:6f24:d0b1 with SMTP id
 00721157ae682-6f3e1c08eb2mr31197877b3.39.1734609289843; Thu, 19 Dec 2024
 03:54:49 -0800 (PST)
MIME-Version: 1.0
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
 <20241218-dt-bcm2712-fixes-v4-2-54cc88b6c229@raspberrypi.com>
 <lzvcaspulvsulbulqinzftt3xtdyro64hi674u2bnkpvbrihri@e2o247mjom5s>
In-Reply-To: <lzvcaspulvsulbulqinzftt3xtdyro64hi674u2bnkpvbrihri@e2o247mjom5s>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 19 Dec 2024 11:54:31 +0000
Message-ID: <CAPY8ntCX8+yg1RFhAXu4ystGF_JivTh43RY=k2P0bUm5JxvzRA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] dt-bindings: display: Fix BCM2835 HVS bindings for
 BCM2712
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Eric Anholt <eric@anholt.net>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Doug Berger <opendmb@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Thomas Gleixner <tglx@linutronix.de>, Stefan Wahren <wahrenst@gmx.net>,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Florian Fainelli <f.fainelli@gmail.com>, linux-gpio@vger.kernel.org
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

Hi Krzysztof

On Thu, 19 Dec 2024 at 08:42, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On Wed, Dec 18, 2024 at 02:48:33PM +0000, Dave Stevenson wrote:
> > Commit 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> > added the compatible string for BCM2712, but missed out that
> > the number of interrupts and clocks changed too, and both need to be
> > named.
> >
> > Update to validate clock, interrupts, and their names for the variants.
> >
> > Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >  .../bindings/display/brcm,bcm2835-hvs.yaml         | 84 ++++++++++++++++++----
> >  1 file changed, 70 insertions(+), 14 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> > index f91c9dce2a44..fd25ee5ce301 100644
> > --- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> > +++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> > @@ -20,11 +20,20 @@ properties:
> >      maxItems: 1
> >
> >    interrupts:
> > -    maxItems: 1
> > +    minItems: 1
> > +    maxItems: 3
> > +
> > +  interrupt-names:
> > +    minItems: 1
> > +    maxItems: 3
> >
> >    clocks:
> > -    maxItems: 1
> > -    description: Core Clock
> > +    minItems: 1
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    minItems: 1
> > +    maxItems: 2
> >
> >  required:
> >    - compatible
> > @@ -33,17 +42,64 @@ required:
> >
> >  additionalProperties: false
> >
> > -if:
> > -  properties:
> > -    compatible:
> > -      contains:
> > -        enum:
> > -          - brcm,bcm2711-hvs
> > -          - brcm,bcm2712-hvs
> > -
> > -then:
> > -  required:
> > -    - clocks
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: brcm,bcm2711-hvs
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          items:
> > +            - description: Core Clock
> > +        interrupts:
> > +          maxItems: 1
>
>
> clock-names and interrupt-names: false, unless driver needs them but all
> this should be explained in the commit msg because it would be a change
> to the binding.

False it is then.

Is there actually a full guide to binding requirements?
https://www.kernel.org/doc/html/latest/devicetree/bindings/writing-schema.html
is the closest I've found, but it doesn't obviously cover these types
of things.

> > +
> > +      required:
> > +        - clocks
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: brcm,bcm2712-hvs
> > +
> > +    then:
> > +      properties:
> > +        clocks:
> > +          minItems: 2
> > +          maxItems: 2
> > +        clock-names:
> > +          items:
> > +            - const: core
> > +            - const: disp
> > +        interrupts:
> > +          items:
> > +            - description: Channel 0 End of frame
> > +            - description: Channel 1 End of frame
> > +            - description: Channel 2 End of frame
> > +        interrupt-names:
> > +          items:
> > +            - const: ch0-eof
> > +            - const: ch1-eof
> > +            - const: ch2-eof
> > +      required:
> > +        - clocks
> > +        - clock-names
> > +        - interrupt-names
>
> My previous comment still stands. Reply to people's feedback instead of
> ignoring it.

Your previous comment was
"Why requiring last two names? Commit msg does not explain that."

I didn't ignore it. The driver needs them, and the commit msg states
" but missed out that the number of interrupts and clocks changed too,
and *both need to be
named*.
Update to validate clock, interrupts, and *their names* for the variants."

Is that insufficient?

  Dave

> Best regards,
> Krzysztof
>
