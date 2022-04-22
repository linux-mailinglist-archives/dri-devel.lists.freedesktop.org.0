Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B20A550BB68
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 17:12:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17DA10E7D9;
	Fri, 22 Apr 2022 15:12:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5331310F3EE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 15:12:44 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id dw17so6230492qvb.9
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 08:12:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=YFL7vUw4s4gTTJ+ZHT3bb/JvWHIOBf/dbu5Vbd21s5Y=;
 b=nlVifmGS4ozGRN65tVb9fKLGqWeWN/jP9zg4MG39pamOrV4kCpjQs1DACD7YKvPW2O
 sTUIOJsfvNnSCSJp3SplnsKU2MtUZj2Hhe6e82xJMcPmbUNl+bzlenCDa5j0Y3bIeP10
 II9Tqq1gi5Vk8bh2p+O85DiTqjKOuOxBq2YHLvdpzc5M+PA9QPgIgshFuoa3SVoz1TwR
 wE7G+txqqHBxcEaDcXKefdA790BRsscbYY6CH6eKG9VUN1BsatYwjAB5RTbUFAPgSl54
 qdwjJdV0QpdEUok1vyra6hFeNV3JXg7tfI5IlLqPrCyGakLxbkDcSA1kheA5LYPqD967
 toOw==
X-Gm-Message-State: AOAM532NVelrGNPBo6CaKjdwaAoSNX8i1Yuz5JVy2aRO86cUM8GOlu4u
 3jzWQOzTlwbQ0DSvBbti4dRLQsNxg5q2aA==
X-Google-Smtp-Source: ABdhPJzPdof4Nm7QPSpoeacWmiTrkq1Kue20pses+tod3KKHoqUgAiGGgoyJGmM4KwEmgCjxohiWBQ==
X-Received: by 2002:a05:6214:2aa7:b0:446:2f18:d005 with SMTP id
 js7-20020a0562142aa700b004462f18d005mr3837201qvb.33.1650640363248; 
 Fri, 22 Apr 2022 08:12:43 -0700 (PDT)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com.
 [209.85.219.177]) by smtp.gmail.com with ESMTPSA id
 j12-20020ae9c20c000000b0067ec380b320sm1026929qkg.64.2022.04.22.08.12.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 08:12:43 -0700 (PDT)
Received: by mail-yb1-f177.google.com with SMTP id f17so14991063ybj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 08:12:42 -0700 (PDT)
X-Received: by 2002:a25:3492:0:b0:645:6f78:b3b4 with SMTP id
 b140-20020a253492000000b006456f78b3b4mr5142958yba.546.1650640362526; Fri, 22
 Apr 2022 08:12:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220421163128.101520-1-biju.das.jz@bp.renesas.com>
 <20220421163128.101520-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdWMmkY+_O_oyKeumuOqNvw_KJaDxuiwrETc3W-kCV2MCg@mail.gmail.com>
 <OS0PR01MB5922728B940A386674DAB36786F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAMuHMdXqYm1WtgnEGhXdOipXwJ9s3NV8CkNWCYhin3SF7tnv+Q@mail.gmail.com>
 <OS0PR01MB5922446E9F1126BF8E06E9F286F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB5922446E9F1126BF8E06E9F286F79@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 22 Apr 2022 17:12:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdURrGhF=Eo3GA_PQXM-r-_NnS_knByzNptkjcb70=_AqA@mail.gmail.com>
Message-ID: <CAMuHMdURrGhF=Eo3GA_PQXM-r-_NnS_knByzNptkjcb70=_AqA@mail.gmail.com>
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

On Fri, Apr 22, 2022 at 11:31 AM Biju Das <biju.das.jz@bp.renesas.com> wrot=
e:
> > Subject: Re: [PATCH v3 1/4] dt-bindings: display: Document Renesas RZ/G=
2L
> > DU bindings
> > On Fri, Apr 22, 2022 at 10:11 AM Biju Das <biju.das.jz@bp.renesas.com>
> > wrote:
> > > > Subject: Re: [PATCH v3 1/4] dt-bindings: display: Document Renesas
> > > > RZ/G2L DU bindings On Thu, Apr 21, 2022 at 6:31 PM Biju Das
> > > > <biju.das.jz@bp.renesas.com>
> > > > wrote:
> > > > > The RZ/G2L LCD controller is composed of Frame Compression
> > > > > Processor (FCPVD), Video Signal Processor (VSPD), and Display Uni=
t
> > (DU).
> > > > >
> > > > > The DU module supports the following hardware features =E2=88=92 =
Display
> > > > > Parallel Interface (DPI) and MIPI LINK Video Interface =E2=88=92 =
Display
> > > > > timing master =E2=88=92 Generates video timings =E2=88=92 Selecti=
ng the polarity
> > > > > of output DCLK, HSYNC, VSYNC, and DE =E2=88=92 Supports Progressi=
ve =E2=88=92
> > > > > Input data format (from VSPD): RGB888, RGB666 =E2=88=92 Output da=
ta
> > > > > format: same as Input data format =E2=88=92 Supporting Full HD (1=
920
> > > > > pixels x 1080 lines) for MIPI-DSI Output =E2=88=92 Supporting WXG=
A (1280
> > > > > pixels x 800 lines) for Parallel Output
> > > > >
> > > > > This patch document DU module found on RZ/G2L LCDC.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- /dev/null
> > > > > +++ b/Documentation/devicetree/bindings/display/renesas,rzg2l-du.=
y
> > > > > +++ aml
> > > > > @@ -0,0 +1,159 @@
> > > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML
> > > > > +1.2
> > > > > +---
> > > > > +$id:
> > > > > +
> > > > > +title: Renesas RZ/G2L Display Unit (DU)
> > > > > +
> > > > > +maintainers:
> > > > > +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > > > +  - Biju Das <biju.das.jz@bp.renesas.com>
> > > > > +
> > > > > +description: |
> > > > > +  These DT bindings describe the Display Unit embedded in the
> > > > > +Renesas RZ/G2L
> > > > > +  and RZ/V2L SoCs.
> > > > > +
> > > > > +properties:
> > > > > +  compatible:
> > > > > +    enum:
> > > > > +      - renesas,du-r9a07g044c # for RZ/G2LC compatible DU
> > > > > +      - renesas,du-r9a07g044l # for RZ/G2L compatible DU
> > > >
> > > > Please use the format "<manuf>,<soc>-<modulo>" for new bindings.
> > > >
> > >
> > > OK.
> > >
> > > > I thought there was no need to differentiate RZ/G2LC and RZ/G2L, as
> > > > the only difference is a wiring difference due to the limited numbe=
r
> > > > of pins on the RZ/G2LC package, as per your confirmation[1]?
> > > > Hence please just use "renesas,r9a07g044-du".
> > >
> > > I cross checked HW manual, on the overview section(page 69) Supported
> > > DU channels on various SoC's are as below
> > >
> > > RZ/{G2L,V2L}
> > > =E2=88=92 1 channel MIPI DSI interface or 1channel parallel output in=
terface
> > > selectable,
> > >
> > > RZ/G2LC
> > > =E2=88=92 1 channel MIPI DSI interface
> > >
> > > RZ/G2UL ( From RZ/G2UL hardware manual overview) =E2=88=92 1 channel =
parallel
> > > output interface.
> > >
> > > >
> > > > Do you want a family-specific compatible value ("rzg2l-"), as this
> > > > IP block is shared by (at least) RZ/GL(C), RZ/V2L, and RZ/G2UL?
> > >
> > > May be will conclude after the above discussion??
> >
> > I don't insist on family-specific compatible values here, as the DUs on
> > RZ/G2UL and RZ/V2L may differ.
> > But RZ/G2L and RZ/G2LC are identical otherwise...
>
> OK, Will use
>
> compatible:
>     items:
>      - enum:
>          - renesas,r9a07g044-du # RZ/G2{L,LC}
>      - const: renesas,rzg2l-du

Please drop "renesas,rzg2l-du"...

> >
> > > > > +allOf:
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          contains:
> > > > > +            enum:
> > > > > +              - renesas,du-r9a07g044c
> > > > > +    then:
> > > > > +      properties:
> > > > > +        ports:
> > > > > +          properties:
> > > > > +            port@0:
> > > > > +              description: DSI 0
> > > > > +          required:
> > > > > +            - port@0
> > > > > +
> > > > > +  - if:
> > > > > +      properties:
> > > > > +        compatible:
> > > > > +          contains:
> > > > > +            enum:
> > > > > +              - renesas,du-r9a07g044l
> > > > > +    then:
> > > > > +      properties:
> > > > > +        ports:
> > > > > +          properties:
> > > > > +            port@0:
> > > > > +              description: DPAD 0
> > > > > +            port@1:
> > > > > +              description: DSI 0
> > > > > +          required:
> > > > > +            - port@0
> > > > > +            - port@1
> > > >
> > > > Having different port numbers for the common DSI0 output indeed
> > > > complicates matters ;-)
> > >
> > > But we could delete as per [1] for RZ/G2LC where it supports only DSI=
 and
> > [2] for RZ/G2UL where it supports only DPI, right?
> >
> > Yes we can. But as the internal hardware is the same, I think we should
> > keep the port numbers the same on RZ/G2L and RZ/G2LC.
>
> OK, Will keep the same port number for both RZ/G2L and RZ/G2LC.
>
> >
> > For RZ/V2L, you probably want to treat it exactly the same as RZ/G2L, i=
.e.,
> > the same port numbering.
>
> OK.
>
> >
> > For RZ/G2UL, you can use a different numbering, assuming no family-spec=
ific
> > compatible value is introduced.
>
> OK.

... as that will interfere here.  If the numbering will be SoC-specific,
the driver has to match on the SoC-specific compatible value anyway.

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
