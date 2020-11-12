Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B95D52B04E4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 13:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040D06E20B;
	Thu, 12 Nov 2020 12:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4958D6E20B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 12:19:47 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id s30so8115218lfc.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 04:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fNo0JKoiJ1vOX3ZB6BEwcttXVx3kYmziVKFAjG7xIvE=;
 b=RG4CArdxOaLNInraDXtxYeMoHrIrSbm3URzrzTYvW2d303uiTqraoK8L0TP+BJJi5r
 T8Z6D0h1ThQttR6Iov8OKg3fduf+fufh1pSuzGfFupNwXRAGM9SWZ1kpQEwMEzZYeD9R
 7X5+/O6KpZ4IaCmtqR3Aj/VnyuNMiYAaLKtNpSVk64tgPT5jL4jTWSujWpYdH/r0Djdy
 j5wVqzhzW0frsyik2N5xDDvh41ZpWcXBqD6rkecuLvzuOQ5SaSYkX+ebDVsQSmd+dkq/
 uBP0+cfY4nWEZTIBip7vG4lYGXda4R6xJVdxTtdiyLk8PUZOE7IJvduQ6i0EBeGRDQb7
 BvjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fNo0JKoiJ1vOX3ZB6BEwcttXVx3kYmziVKFAjG7xIvE=;
 b=MQ2PAMw+lnWigqIt8YHLMv7wrQKI5ihUUT8LYcSBaSrrOKD/qz71MoYfCYREvW8Ymd
 O/4O5pHjN38xMMErWc4ca8tFb+8jzyz+89vlUuBiVTljFBGVdZhnu7RLyDYKJgrlRD2x
 fIumXYOBlxwpJ+5IJyq6QbgrT836shYEiYk+Rx4vkFjhUpoAZ4q8WFI3OsssogXy3v6r
 ZAvsELf47EkZLyLjyjiwExnVDDO25TkiJ08Cl3iveVyHcqM836DcYC/N4jZdAy/EXLlU
 R9TVUWRsUeJJPWuh7XdK3Dbt4xspSteC1j2ALWRs/05FaTFyt7mU26//VFR3hRbe3zIn
 sfuQ==
X-Gm-Message-State: AOAM531Ccvn+2Epesq15UmalAQ7r3nWUegztBBcJIzGgfU8R6ExxLFyI
 XugyqWo9PaBo147ogxzVppC3k6+K6QFn0o1FblPxxA==
X-Google-Smtp-Source: ABdhPJwhVAqY9IgDLkJKooOcv72RFKtk97zrU2tY0DMdBtlXUE7NyZpIvLivv7gH+mTnWrLiDkVNxEsaUL91IL5j9Y4=
X-Received: by 2002:a19:e08:: with SMTP id 8mr2688842lfo.441.1605183585470;
 Thu, 12 Nov 2020 04:19:45 -0800 (PST)
MIME-Version: 1.0
References: <20201111130754.2283993-1-linus.walleij@linaro.org>
 <20201111205857.GB3013948@ravnborg.org>
In-Reply-To: <20201111205857.GB3013948@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 12 Nov 2020 13:19:34 +0100
Message-ID: <CACRpkdaUZMNQn7bvmPKP+kbqsW66HrS0RTDkUjrAW15EEf+8EA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: mcde: Convert to YAML schema
To: Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>
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
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 11, 2020 at 9:59 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> On Wed, Nov 11, 2020 at 02:07:54PM +0100, Linus Walleij wrote:

> > -- clocks: an array of the MCDE clocks in this strict order:
> > -  MCDECLK (main MCDE clock), LCDCLK (LCD clock), PLLDSI
> > -  (HDMI clock), DSI0ESCLK (DSI0 energy save clock),
>
> > -  DSI1ESCLK (DSI1 energy save clock), DSI2ESCLK (DSI2 energy
> > -  save clock)
>
> I did not find these two clocks in the binding below.

The old bindings are wrong. These clocks belong on the DSI
host adapters, so they are in this part of the binding:

+      clocks:
+        description: phandles to the high speed and low power (energy
save) clocks
+          the high speed clock is not present on the third (dsi2) block, so it
+          should only have the "lp" clock
+        minItems: 1
+        maxItems: 2
+
+      clock-names:
+        oneOf:
+          - items:
+              - const: hs
+              - const: lp
+          - items:
+              - const: lp

All device trees have these in the right place, we just didn't notice that
the bindings were wrong exactly because we weren't using
formal YAML syntax. Now the strictness of this parser makes me
fix my bugs...

> > +  port:
> > +    type: object
> > +    description:
> > +      A DPI port node with endpoint definitions as defined in
> > +      Documentation/devicetree/bindings/media/video-interfaces.txt
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 1
> > +
> > +  ranges: true
>
> This is a transition from .txt to DT Schema so OK with this sub-node.
> But otherwise the dsi node should have been linked using graph nodes.
> So OK - just thinking out loud.

Actually when I introduced the MCDE DSI last year at first I used port
and graphs:
https://lore.kernel.org/dri-devel/20190207083647.20615-3-linus.walleij@linaro.org/
Then Rob asked "why?":
https://lore.kernel.org/dri-devel/20190225223124.GA29057@bogus/
And then I removed it, as having a panel directly under a
DSI host is fine.

> > +patternProperties:
> > +  "^dsi@[0-9a-f]+$":
> > +    description: subnodes for the three DSI host adapters
> > +    type: object
> > +    allOf:
> > +      - $ref: dsi-controller.yaml#
(...)
> The dsi nodes needs the #address-cells and #size-cells - at least if a
> panel node is specified.

This is specified in the referenced schema dsi-controller.yaml.

> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupts
> > +  - clocks
> > +  - clock-names
> > +  - epod-supply
> > +  - vana-supply
> > +
> > +additionalProperties: true
>
> Why are additional properties allowed here?

It's because the SoC peripherals have things like pin control
(currently handled by a quirk in the YAML validator I think) and
resets is something else I will likely add at some point, and then
this would result in warnings unless I lock-step changes in the
schema and DTS files.

I *can* disallow this if you insist.

Yours.
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
