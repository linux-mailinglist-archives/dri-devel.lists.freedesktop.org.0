Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1758350B2FF
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 10:34:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F1A510E467;
	Fri, 22 Apr 2022 08:34:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66AE010E467
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 08:34:30 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id kc12so360841qvb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 01:34:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=06iECEq1zQndlMR7mMQtp+hvIytw9rPulWZWvzCfKtU=;
 b=f6CHa0vT+poC031mNUWD0CwE4ZHDbtWHFGbf8ujaEs8XCl3eYx60wtbG+asoIuCJqG
 tjIMJJHBxZm1mKbvIfykMwbTxBDz1FUhxN1NhOKSUj2+CiLn53gTTNicx5+Y1qH0mlqN
 CgTb23D77iGdygiA0nlOCfo46V986+vh5Pxq/RynZhcgvZgfJmApWkVDn/9VvTrctxkM
 d/zTQrGr0C85OD/JHuRBU2dRlIi8SYAZx3e0MEKFE+dVyCyBxxDOw36riPt0M95GrWUy
 A5NvZuC+qiG9YPEq7dNClYGGjeq2t16LU3ok4Vv94GeMHNx44/tAu5ZXbc8ddGLl9GJ7
 y8Eg==
X-Gm-Message-State: AOAM530rYy8dPw+5rPsLWwsPMJiC0uDf+qPpFlNXPVGst5L9Ap8OxPUP
 e+IGJPxgsnrgPQzuPokCXDRe41CWxqqltA==
X-Google-Smtp-Source: ABdhPJyutKmFKRCuGm9baP/6dDfZrwTHKSjnPYe8fyNXyos23ODE+A+ykaYsEXA3587ol6J6qfcmeg==
X-Received: by 2002:a0c:f8ca:0:b0:444:41e8:89b1 with SMTP id
 h10-20020a0cf8ca000000b0044441e889b1mr2745667qvo.22.1650616469122; 
 Fri, 22 Apr 2022 01:34:29 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com.
 [209.85.219.173]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05622a00cc00b002ebdd6ef303sm949928qtw.43.2022.04.22.01.34.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 01:34:27 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id b26so7581729ybj.13
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 01:34:27 -0700 (PDT)
X-Received: by 2002:a25:3492:0:b0:645:6f78:b3b4 with SMTP id
 b140-20020a253492000000b006456f78b3b4mr3528644yba.546.1650616467326; Fri, 22
 Apr 2022 01:34:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
 <20220421163128.101520-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdWMmkY+_O_oyKeumuOqNvw_KJaDxuiwrETc3W-kCV2MCg@mail.gmail.com>
 <OS0PR01MB5922728B940A386674DAB36786F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922728B940A386674DAB36786F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Apr 2022 10:34:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqYm1WtgnEGhXdOipXwJ9s3NV8CkNWCYhin3SF7tnv+Q@mail.gmail.com>
Message-ID: <CAMuHMdXqYm1WtgnEGhXdOipXwJ9s3NV8CkNWCYhin3SF7tnv+Q@mail.gmail.com>
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

On Fri, Apr 22, 2022 at 10:11 AM Biju Das <biju.das.jz@bp.renesas.com> wrot=
e:
> > Subject: Re: [PATCH v3 1/4] dt-bindings: display: Document Renesas RZ/G=
2L
> > DU bindings
> > On Thu, Apr 21, 2022 at 6:31 PM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > The RZ/G2L LCD controller is composed of Frame Compression Processor
> > > (FCPVD), Video Signal Processor (VSPD), and Display Unit (DU).
> > >
> > > The DU module supports the following hardware features =E2=88=92 Disp=
lay
> > > Parallel Interface (DPI) and MIPI LINK Video Interface =E2=88=92 Disp=
lay
> > > timing master =E2=88=92 Generates video timings =E2=88=92 Selecting t=
he polarity of
> > > output DCLK, HSYNC, VSYNC, and DE =E2=88=92 Supports Progressive =E2=
=88=92 Input data
> > > format (from VSPD): RGB888, RGB666 =E2=88=92 Output data format: same=
 as Input
> > > data format =E2=88=92 Supporting Full HD (1920 pixels x 1080 lines) f=
or
> > > MIPI-DSI Output =E2=88=92 Supporting WXGA (1280 pixels x 800 lines) f=
or
> > > Parallel Output
> > >
> > > This patch document DU module found on RZ/G2L LCDC.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> > > @@ -0,0 +1,159 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
> > > +---
> > > +$id:
> > > +
> > > +title: Renesas RZ/G2L Display Unit (DU)
> > > +
> > > +maintainers:
> > > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > > +
> > > +description: |
> > > +  These DT bindings describe the Display Unit embedded in the Renesa=
s
> > > +RZ/G2L
> > > +  and RZ/V2L SoCs.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - renesas,du-r9a07g044c # for RZ/G2LC compatible DU
> > > +      - renesas,du-r9a07g044l # for RZ/G2L compatible DU
> >
> > Please use the format "<manuf>,<soc>-<modulo>" for new bindings.
> >
>
> OK.
>
> > I thought there was no need to differentiate RZ/G2LC and RZ/G2L, as the
> > only difference is a wiring difference due to the limited number of pin=
s on
> > the RZ/G2LC package, as per your confirmation[1]?
> > Hence please just use "renesas,r9a07g044-du".
>
> I cross checked HW manual, on the overview section(page 69) Supported
> DU channels on various SoC's are as below
>
> RZ/{G2L,V2L}
> =E2=88=92 1 channel MIPI DSI interface or 1channel parallel output interf=
ace selectable,
>
> RZ/G2LC
> =E2=88=92 1 channel MIPI DSI interface
>
> RZ/G2UL ( From RZ/G2UL hardware manual overview)
> =E2=88=92 1 channel parallel output interface.
>
> >
> > Do you want a family-specific compatible value ("rzg2l-"), as this IP b=
lock
> > is shared by (at least) RZ/GL(C), RZ/V2L, and RZ/G2UL?
>
> May be will conclude after the above discussion??

I don't insist on family-specific compatible values here, as the DUs on
RZ/G2UL and RZ/V2L may differ.
But RZ/G2L and RZ/G2LC are identical otherwise...

> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - renesas,du-r9a07g044c
> > > +    then:
> > > +      properties:
> > > +        ports:
> > > +          properties:
> > > +            port@0:
> > > +              description: DSI 0
> > > +          required:
> > > +            - port@0
> > > +
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - renesas,du-r9a07g044l
> > > +    then:
> > > +      properties:
> > > +        ports:
> > > +          properties:
> > > +            port@0:
> > > +              description: DPAD 0
> > > +            port@1:
> > > +              description: DSI 0
> > > +          required:
> > > +            - port@0
> > > +            - port@1
> >
> > Having different port numbers for the common DSI0 output indeed complic=
ates
> > matters ;-)
>
> But we could delete as per [1] for RZ/G2LC where it supports only DSI and=
 [2] for RZ/G2UL where it supports only DPI, right?
>
> [1] https://github.com/renesas-rz/rz_linux-cip/blob/rz-5.10-cip1/arch/arm=
64/boot/dts/renesas/r9a07g044c2.dtsi#L24
>
> [2] https://github.com/renesas-rz/rz_linux-cip/blob/rz-5.10-cip1/arch/arm=
64/boot/dts/renesas/r9a07g043.dtsi#L1000

Yes we can. But as the internal hardware is the same, I think we
should keep the port numbers the same on RZ/G2L and RZ/G2LC.

For RZ/V2L, you probably want to treat it exactly the same as RZ/G2L,
i.e., the same port numbering.

For RZ/G2UL, you can use a different numbering, assuming no
family-specific compatible value is introduced.

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
