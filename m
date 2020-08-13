Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE55724374C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 11:09:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15BB26E97B;
	Thu, 13 Aug 2020 09:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58626E97C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 09:09:01 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id l204so4432003oib.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Aug 2020 02:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0K15ceWt7+lSEkvA7d3theI6XPwiCybuf39fCiNOnRI=;
 b=VqZ4WvSW0sJhv0k0csWfRQGx1IesJUiT2s5Y5Gj21k0bF/TUEchDLk4LYdG3YXKcB1
 sdljy6o1RhPZCQU8pLfwP5WYfm+B9h/j0sR6O9XtLWrxp5zG/q5PP/izPpL0DsYgfXpD
 7c/W+s3JoqHgFnpK0xT55xPUZn5Ba8Dhnb/gdJaViEqXqbPTy6VbvyQsCVWL4Gko5Vmx
 In8oS8deZhNH1u7vbQ6I3V25ZqgpmM6AOs2gEbC1Lfsc0zmnA2cUq/7xK7Ft6I/m1UzY
 zgFdT6VhF34CzNpOpMPaJlm4qzM+M1OLj2IWyBRweQdZKZHW30wrpp2TuJRH3QLWMMl6
 AcjA==
X-Gm-Message-State: AOAM532kdV3yHjyJuUyuseUqJoLvAH46pfZe02pK/0QPBrBu4wN9lOQm
 D8cknYRID9FCZ7htKxXOWYrTWw8WsU1nvjAffVs=
X-Google-Smtp-Source: ABdhPJzB4wNONrk31bsEMlFj7xQbcN5C5YD4hPJ1l4PHkQ8t4JH4EYjL3qUZVIwmP93aJw0pGYQeN5yq+3aKSoGMjuI=
X-Received: by 2002:aca:4b54:: with SMTP id y81mr2563000oia.54.1597309740957; 
 Thu, 13 Aug 2020 02:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20200812140217.24251-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 13 Aug 2020 11:08:49 +0200
Message-ID: <CAMuHMdVVL=ZWGmsZSBhxTNsnkJDzDrCQMXVpVPB74udOqAbvUg@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm64: dts: renesas: r8a774e1: Populate DU device node
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>,
 David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Prabhakar <prabhakar.csengg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 4:03 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> Populate the DU device node properties in R8A774E1 SoC dtsi.
>
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> @@ -2623,22 +2623,39 @@
>                 };
>
>                 du: display@feb00000 {
> +                       compatible = "renesas,du-r8a774e1";
>                         reg = <0 0xfeb00000 0 0x80000>;
> +                       interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&cpg CPG_MOD 724>,
> +                                <&cpg CPG_MOD 723>,
> +                                <&cpg CPG_MOD 721>;
> +                       clock-names = "du.0", "du.1", "du.3";
> +                       resets = <&cpg 724>, <&cpg 722>;
> +                       reset-names = "du.0", "du.3";
>                         status = "disabled";
>
> -                       /* placeholder */
> +                       renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
> +
>                         ports {
>                                 #address-cells = <1>;
>                                 #size-cells = <0>;
>
>                                 port@0 {
>                                         reg = <0>;
> +                                       du_out_rgb: endpoint {
> +                                       };
>                                 };
>                                 port@1 {
>                                         reg = <1>;
> +                                       du_out_hdmi0: endpoint {
> +                                       };
>                                 };
>                                 port@2 {
>                                         reg = <2>;
> +                                       du_out_lvds0: endpoint {
> +                                       };

Waiting for the port number discussion to settle before queuein in
renesas-devel for v5.10.

>                                 };
>                         };
>                 };
> --
> 2.17.1
>


-- 
Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
