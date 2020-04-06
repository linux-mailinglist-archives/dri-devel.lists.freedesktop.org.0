Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A4619F1D4
	for <lists+dri-devel@lfdr.de>; Mon,  6 Apr 2020 10:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A01189EB8;
	Mon,  6 Apr 2020 08:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7FC689EB8
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 08:51:20 +0000 (UTC)
Received: by mail-oi1-f196.google.com with SMTP id k9so12393032oia.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Apr 2020 01:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fXYbNmUk7gx6u1EZ+3zkQdCAzF6iKPs8wapVvWfN48o=;
 b=Ciev4gHRxi96xYFi28Qt6iQTZCZ6xle2s6MnRkKQEWNtGQ6pn1XgMASuFTxCKDnNap
 l0bW1x0qIRs+ihRhecXd21PpffcS8rhw8dFC54gzCFxLrrE/ZK3WsSdPu3zlmNAlAFeX
 vr53lod8OpaJing3fMzIlS3nzU8GnLMWAL03PZj+i1t1ZdzZCmaSNy/E98N8qBHcp/wZ
 XzOxzNOF/C4cNFDRh9sYNVZvV95v7XK1h/Iy6mPODxww8UlpNWnpcxRWh77egjqhHC71
 5E3rbqqGxQuKjWnVzcuVp/Hpvgb+qpah8EXWyrik37wXtvpnZdrJ33tA+8O2O+NOqS1Z
 Xj1w==
X-Gm-Message-State: AGi0Puatc9jia8bMgIgEjAzXst71MqyHNP/DwqPBiWCIGyHLGkzi2RnE
 UdfXCmVDHOEUSzn4BLa0ES+EUoro9oXfhF5yD4iu9q6j
X-Google-Smtp-Source: APiQypIR0yeblmw39zrWYRRtW33lWN0V41HsYayCa9b+tH6tni6QJUl7ScskTs14bJYWvH1xLH3vofcWL4Y1Ilevefo=
X-Received: by 2002:aca:cdd1:: with SMTP id
 d200mr11498601oig.153.1586163080068; 
 Mon, 06 Apr 2020 01:51:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200405233935.27599-3-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20200405233935.27599-3-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Apr 2020 10:51:08 +0200
Message-ID: <CAMuHMdW2-JdDk5KB+K1-QMp20edU-5U--y4utvTn0H-RDYgyaQ@mail.gmail.com>
Subject: Re: [PATCH/RFC 2/6] dt-bindings: display: bridge: renesas,dw-hdmi:
 Convert binding to YAML
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
 <devicetree@vger.kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <maxime@cerno.tech>, Mark Yao <mark.yao@rock-chips.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Mon, Apr 6, 2020 at 1:40 AM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Convert the Renesas R-Car DWC HDMI TX text binding to YAML.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml

> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +        - renesas,r8a774a1-hdmi # for R8A774A1 (RZ/G2M) compatible HDMI TX
> +        - renesas,r8a774b1-hdmi # for R8A774B1 (RZ/G2N) compatible HDMI TX
> +        - renesas,r8a7795-hdmi # for R8A7795 (R-Car H3) compatible HDMI TX
> +        - renesas,r8a7796-hdmi # for R8A7796 (R-Car M3-W) compatible HDMI TX

R8A77960 (I know you don't support R8A77961 yet ;-)

> +        - renesas,r8a77965-hdmi # for R8A77965 (R-Car M3-N) compatible HDMI TX

Wouldn't it be sufficient to just have the SoC name (e.g. "R-Car M3-N") in
the comments?

> +      - const: renesas,rcar-gen3-hdmi

# R-Car Gen3 and RZ/G2

> +examples:
> +  - |
> +    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/power/r8a7795-sysc.h>
> +
> +    hdmi@fead0000 {
> +        compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
> +        reg = <0 0xfead0000 0 0x10000>;

Examples are built with #{address,size}-cells = <1>.

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
