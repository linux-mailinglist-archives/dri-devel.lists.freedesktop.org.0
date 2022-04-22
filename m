Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE8450B211
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 09:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30A31121F1;
	Fri, 22 Apr 2022 07:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com
 [209.85.222.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AFAC1121F1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 07:53:55 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id b68so5296841qkc.4
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 00:53:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tggspirRgaeR4RvyIWiBijycx+/HqfnmFSxlQfeFHJc=;
 b=d+cVQLEOWXrGGWQUKHSgLlAW0ivqkSf/gVTNZBuj6xYfW/5I6CUkFoV2p8vX6FnLVW
 GXPq/R3b7rdOwstqp+0a8URt2qc8Qi2FDXNEgIgUNr65fv9j6Pq13KLUaznhgqej4e+W
 EGXd4+z1OjfFfsO64pcgQVH3Ugt0rAWOwNzuFXj817T2Xdy7/BwyV48QXl7sjxBz8BPg
 pSA38Dc+rJjhiVCwNL4aaRW7dVoKRgK6hW/39KJJ2mrhvpUBuzL/kDPObjO8uH7+XWVc
 vJvdgGysQqOcuw8IP+KXeoYXnW7Sv4IQDQ3YIR2oGhaqFACflfkU+TYk+q+CccvHVaOY
 HChg==
X-Gm-Message-State: AOAM532svYFPUgQDxR26DGHyNKmeX+vZ2iT1I9p8VfPu06rL+Mh8gJN5
 8gYLTSs4ZHi6o8tqY6RrMYFx6Voc5a0PDQ==
X-Google-Smtp-Source: ABdhPJwKATZSxjuIqSzupdQcJCTHltXuexI4jVBeMLXHlFlLRrg/sG4q1yUxCWwquC3hzqI1Eo5+xQ==
X-Received: by 2002:a05:620a:4721:b0:69e:d510:b42b with SMTP id
 bs33-20020a05620a472100b0069ed510b42bmr1870427qkb.65.1650614033982; 
 Fri, 22 Apr 2022 00:53:53 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com.
 [209.85.128.175]) by smtp.gmail.com with ESMTPSA id
 n10-20020a05622a040a00b002e315b9f08asm854828qtx.35.2022.04.22.00.53.53
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 00:53:53 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-2ec0bb4b715so77114557b3.5
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 00:53:53 -0700 (PDT)
X-Received: by 2002:a81:4f0d:0:b0:2ec:1556:815 with SMTP id
 d13-20020a814f0d000000b002ec15560815mr3603625ywb.256.1650614033040; Fri, 22
 Apr 2022 00:53:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
 <20220421163128.101520-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220421163128.101520-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Apr 2022 09:53:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWMmkY+_O_oyKeumuOqNvw_KJaDxuiwrETc3W-kCV2MCg@mail.gmail.com>
Message-ID: <CAMuHMdWMmkY+_O_oyKeumuOqNvw_KJaDxuiwrETc3W-kCV2MCg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: display: Document Renesas RZ/G2L DU
 bindings
To: Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
 <devicetree@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Biju,

On Thu, Apr 21, 2022 at 6:31 PM Biju Das <biju.das.jz@bp.renesas.com> wrote=
:
> The RZ/G2L LCD controller is composed of Frame Compression Processor
> (FCPVD), Video Signal Processor (VSPD), and Display Unit (DU).
>
> The DU module supports the following hardware features
> =E2=88=92 Display Parallel Interface (DPI) and MIPI LINK Video Interface
> =E2=88=92 Display timing master
> =E2=88=92 Generates video timings
> =E2=88=92 Selecting the polarity of output DCLK, HSYNC, VSYNC, and DE
> =E2=88=92 Supports Progressive
> =E2=88=92 Input data format (from VSPD): RGB888, RGB666
> =E2=88=92 Output data format: same as Input data format
> =E2=88=92 Supporting Full HD (1920 pixels x 1080 lines) for MIPI-DSI Outp=
ut
> =E2=88=92 Supporting WXGA (1280 pixels x 800 lines) for Parallel Output
>
> This patch document DU module found on RZ/G2L LCDC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/renesas,rzg2l-du.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L Display Unit (DU)
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +  - Biju Das <biju.das.jz@bp.renesas.com>
> +
> +description: |
> +  These DT bindings describe the Display Unit embedded in the Renesas RZ=
/G2L
> +  and RZ/V2L SoCs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,du-r9a07g044c # for RZ/G2LC compatible DU
> +      - renesas,du-r9a07g044l # for RZ/G2L compatible DU

Please use the format "<manuf>,<soc>-<modulo>" for new bindings.

I thought there was no need to differentiate RZ/G2LC and RZ/G2L, as
the only difference is a wiring difference due to the limited number
of pins on the RZ/G2LC package, as per your confirmation[1]?
Hence please just use "renesas,r9a07g044-du".

Do you want a family-specific compatible value ("rzg2l-"), as this
IP block is shared by (at least) RZ/GL(C), RZ/V2L, and RZ/G2UL?

> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r9a07g044c
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DSI 0
> +          required:
> +            - port@0
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - renesas,du-r9a07g044l
> +    then:
> +      properties:
> +        ports:
> +          properties:
> +            port@0:
> +              description: DPAD 0
> +            port@1:
> +              description: DSI 0
> +          required:
> +            - port@0
> +            - port@1

Having different port numbers for the common DSI0 output indeed
complicates matters ;-)

[1] https://lore.kernel.org/r/OS0PR01MB5922C4C58329F538A418547886ED9@OS0PR0=
1MB5922.jpnprd01.prod.outlook.com/

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
