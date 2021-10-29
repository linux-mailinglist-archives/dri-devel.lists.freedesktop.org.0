Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C967C43F8D6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 10:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A23906E140;
	Fri, 29 Oct 2021 08:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8D46E140
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 08:28:36 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id b125so3446147vkb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 01:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7D7n4zKwOftMKeYPi/HfP+/e549fNZjw4uN7YVlzcCA=;
 b=j5s+/KTnd+kXkfo9XkTupqymTxnjc5C2WDprS+joPA54TzH/j2uHYj9b8UI9PFbDvW
 ia4QlniGAUoVRTvyaLvQT3jKS4LEKIyza9k0SoUl7NHFCbtzwaJ2r05DSUgzDBOvXNRA
 rYZQaP81nD9TKIusVloTveDP2hsJZFxGDGeubF5Ka4vhXp3r5m4b1yVpNLDK1/NNSKna
 UWGdg13EIIbIHotxSOunZ5q0GrzDcRmZZB9pSYn24G5T19+YgBvV4jH54BoJIaRAuNNq
 msXoef8UC36G5wMmpsyJRN/chsK9ujkFxH6zubAGzbA9z4iF4FzlQQcW0vWbO/YZw04e
 sqVg==
X-Gm-Message-State: AOAM532nNbLTSBoYnwoeF68ivOVJvmSWupz6GpBAOcCE4pLu+EY8P95+
 cupJ886zuEL2HnDg7b8BT02FTJcwys3Aqw==
X-Google-Smtp-Source: ABdhPJyQ59y2h+U2+4rtbAQ25VgOPUgYf2S8Aa4A1C7x03NMp/BWybrr/Bxm1sBaThN25f4FYe3VCw==
X-Received: by 2002:a05:6122:d0e:: with SMTP id
 az14mr3763757vkb.17.1635496114886; 
 Fri, 29 Oct 2021 01:28:34 -0700 (PDT)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com.
 [209.85.221.172])
 by smtp.gmail.com with ESMTPSA id w194sm826837vkh.53.2021.10.29.01.28.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 01:28:34 -0700 (PDT)
Received: by mail-vk1-f172.google.com with SMTP id b125so3446124vkb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 01:28:34 -0700 (PDT)
X-Received: by 2002:a05:6122:804:: with SMTP id 4mr9584050vkj.7.1635496113976; 
 Fri, 29 Oct 2021 01:28:33 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634822085.git.geert+renesas@glider.be>
 <1f6bf58d76efc2e869b800534b818d1451ef98a2.1634822085.git.geert+renesas@glider.be>
 <YXtIsCnJ+L5zqCVk@robh.at.kernel.org> <YXusEUpTBUdvS7LY@shell.armlinux.org.uk>
In-Reply-To: <YXusEUpTBUdvS7LY@shell.armlinux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 29 Oct 2021 10:28:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX+Ke54zyi2Z2ROk-2xpbcXU6+FFH71gEz0vEBXCAgVXw@mail.gmail.com>
Message-ID: <CAMuHMdX+Ke54zyi2Z2ROk-2xpbcXU6+FFH71gEz0vEBXCAgVXw@mail.gmail.com>
Subject: Re: [PATCH 3/3] [RFC] dt-bindings: display: bridge: nxp,tda998x:
 Convert to json-schema
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Rob Herring <robh@kernel.org>,
 =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
 Tony Lindgren <tony@atomide.com>, Magnus Damm <magnus.damm@gmail.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "open list:TI ETHERNET SWITCH DRIVER (CPSW)" <linux-omap@vger.kernel.org>, 
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>
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

Hi Russell,

Thanks for your comments!

On Fri, Oct 29, 2021 at 10:08 AM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Thu, Oct 28, 2021 at 08:04:48PM -0500, Rob Herring wrote:
> > On Thu, Oct 21, 2021 at 03:18:53PM +0200, Geert Uytterhoeven wrote:
> > > +    properties:
> > > +      port@0:
> > > +        type: object
> > > +        description: FIXME
> >
> > Looks like the input from the example
> >
> > > +
> > > +      port@1:
> > > +        type: object
> > > +        description: FIXME
> >
> > Presumably the output to connector or another bridge.
>
> This is changing the binding. The original had:
>
> Required node:
>   - port: Input port node with endpoint definition, as described
>         in Documentation/devicetree/bindings/graph.txt

Indeed, cfr. "Add ports hierarchy, as an alternative to port." in the
patch description. Some users use port, other use ports with one or
two port subnodes.

> The above change appears to require that tda998x now has two ports.

No, you can still use port:

+oneOf:
+  - required:
+      - port
+  - required:
+      - ports

When using ports, no further requirements are set, but perhaps port@0
should be made required in that case?

> This goes against current usage in DT and the example.

The original example didn't even have the original required input
port node, so it was incomplete.

arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts has two port subnodes.
Is that wrong?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
