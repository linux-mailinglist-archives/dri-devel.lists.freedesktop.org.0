Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 489D219F1CA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 10:47:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DFE689F55;
	Mon,  6 Apr 2020 08:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9790589F55
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 08:47:49 +0000 (UTC)
Received: by mail-oi1-f194.google.com with SMTP id k5so12378325oiw.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 01:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ofe9gpx/rAfxW7TO3g+sj7lCoLVUw0RfPyc4HUwJq/0=;
 b=PvAVl6urem1HoQ5GQ4Kt7pPkAYanwGDCanLAvRzEI6HBSlXzZajJXy43puSINuibWv
 HyjNS0f4d5VwYq7bF7epKPxKOqCv05xS03g4kNjmp1z0g1/CiVPVPJXSIABbXcpjcHY+
 PqhULe6j3slV+PXl7BN96ewiCQqMm/hzSAgUQgRBmlvlgBdIDm3SRWBPMl9GH6EWh1d6
 2g0EjEQgP2WXvQYxgZdcJJ9Ja7cZe4aqQkTCWzCToN0UiZzGlhUwRihYYltMzVknz2Wt
 DfSi8LPFO8HF89/J3qCVc6vcLMERlqHIO04T8ES6oMaHghCbgFIZlgtJLCD/aNG/tDOF
 wiFg==
X-Gm-Message-State: AGi0PuZCis83VZeNNwzCuRDDpy69PSvaMBWJez2VT53ucZIPspiRYe86
 perw0YQe+2opETUhJtQHv/DcsYo6KT3qz+SKh5o=
X-Google-Smtp-Source: APiQypI0xhIzfIwCX4pr1CeA1Z/0H4YxMtzB3XTU4byr19XfCp2qMUh0J0OZzFv0dnImP8Rwz0MkG5uV0lsmtuR32VU=
X-Received: by 2002:aca:4e57:: with SMTP id c84mr11513006oib.148.1586162868764; 
 Mon, 06 Apr 2020 01:47:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200405232318.26833-5-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Apr 2020 10:47:37 +0200
Message-ID: <CAMuHMdXJcw0eGY7J=JcGv6Hs9E_GCybsYSeKKeH5pAH8nkdTrg@mail.gmail.com>
Subject: Re: [PATCH 4/4] dt-bindings: display: bridge: renesas,lvds: Convert
 binding to YAML
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Mon, Apr 6, 2020 at 1:24 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Convert the Renesas R-Car LVDS encoder text binding to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
> @@ -0,0 +1,248 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/renesas,lvds.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas R-Car LVDS Encoder
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description: |
> +  These DT bindings describe the LVDS encoder embedded in the Renesas R-Car
> +  Gen2, R-Car Gen3 and RZ/G SoCs.

RZ/G1 and RZ/G2 (no idea what'll RZ/G3 will bring ;-)

> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r8a7743-lvds # for R8A7743 (RZ/G1M) compatible LVDS encoders
> +      - renesas,r8a7744-lvds # for R8A7744 (RZ/G1N) compatible LVDS encoders
> +      - renesas,r8a774a1-lvds # for R8A774A1 (RZ/G2M) compatible LVDS encoders
> +      - renesas,r8a774b1-lvds # for R8A774B1 (RZ/G2N) compatible LVDS encoders
> +      - renesas,r8a774c0-lvds # for R8A774C0 (RZ/G2E) compatible LVDS encoders
> +      - renesas,r8a7790-lvds # for R8A7790 (R-Car H2) compatible LVDS encoders
> +      - renesas,r8a7791-lvds # for R8A7791 (R-Car M2-W) compatible LVDS encoders
> +      - renesas,r8a7793-lvds # for R8A7793 (R-Car M2-N) compatible LVDS encoders
> +      - renesas,r8a7795-lvds # for R8A7795 (R-Car H3) compatible LVDS encoders
> +      - renesas,r8a7796-lvds # for R8A7796 (R-Car M3-W) compatible LVDS encoders

R8A77960 (I know you don't have support for R8A77961 yet ;-)

> +      - renesas,r8a77965-lvds # for R8A77965 (R-Car M3-N) compatible LVDS encoders
> +      - renesas,r8a77970-lvds # for R8A77970 (R-Car V3M) compatible LVDS encoders
> +      - renesas,r8a77980-lvds # for R8A77980 (R-Car V3H) compatible LVDS encoders
> +      - renesas,r8a77990-lvds # for R8A77990 (R-Car E3) compatible LVDS encoders
> +      - renesas,r8a77995-lvds # for R8A77995 (R-Car D3) compatible LVDS encoders

Wouldn't it be sufficient to just have the SoC name (e.g. "R-Car D3") in
the comments?

> +if:
> +  properties:
> +    compatible:
> +      enum:
> +        - renesas,r8a774c0-lvds
> +        - renesas,r8a77990-lvds
> +        - renesas,r8a77995-lvds
> +then:
> +  properties:
> +    clocks:
> +      minItems: 1
> +      maxItems: 4
> +      items:
> +        - description: Functional clock
> +        - description: EXTAL input clock
> +        - description: DU_DOTCLKIN0 input clock
> +        - description: DU_DOTCLKIN1 input clock
> +
> +    clock-names:
> +      minItems: 1
> +      maxItems: 4
> +      items:
> +        - const: fck
> +        # The LVDS encoder can use the EXTAL or DU_DOTCLKINx clocks.
> +        # These clocks are optional.
> +        - enum:
> +          - extal
> +          - dclkin.0
> +          - dclkin.1
> +        - enum:
> +          - extal
> +          - dclkin.0
> +          - dclkin.1
> +        - enum:
> +          - extal
> +          - dclkin.0
> +          - dclkin.1

Can the duplication of the last 3 entries be avoided?
Perhaps like in
Documentation/devicetree/bindings/serial/renesas,scif.yaml?

> +examples:
> +  - |
> +    #include <dt-bindings/clock/renesas-cpg-mssr.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    lvds@feb90000 {
> +        compatible = "renesas,r8a7795-lvds";
> +        reg = <0 0xfeb90000 0 0x14>;

Examples are built with #{address,size}-cells = <1>.

> +    lvds0: lvds@feb90000 {
> +        compatible = "renesas,r8a77990-lvds";
> +        reg = <0 0xfeb90000 0 0x20>;

Likewise.

> +    lvds1: lvds@feb90100 {
> +        compatible = "renesas,r8a77990-lvds";
> +        reg = <0 0xfeb90100 0 0x20>;

Likewise.

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
