Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1017D82D66A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 10:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8415510E1C5;
	Mon, 15 Jan 2024 09:53:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4938610E1C5
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 09:53:10 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-5ce0efd60ddso4297764a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 01:53:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705312389; x=1705917189;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wsMhOFSC0mxjAJYvrikbFmAm65pBG0U6QI3j9yJqaic=;
 b=sUmqAUj8kfauzMVSpl3zQZUiGEakD1XHBkgX+ixHNc4YY7Fq2EhzpJ+h5vrzHMN0Qg
 8WVrao/PE2Kqog39DEKlx01yzkMHqYLCVoAfILplwJejheCGIY/XAYlUxuzmMsXjBO3/
 YVECI7HIyCo5zhsmSNPPcgFTADxSARRhYPAD2653C7ycJxInFvt648TQ/iztBBbnp7iB
 Vr+f3b2/veq5jpC4hyot+gAsTGoCkZcTBIZCDpJwXxuzWQC5pZsefXhogKZqqGlo1C/L
 srQOQ8lBWQ9MKOCoCoDM+W9XO+hkBZftBjoQbEMclQa52nBxobiC58qWIPsBrhp2WkW0
 v1Qg==
X-Gm-Message-State: AOJu0YwAh9GIMckH+wNsbVEbkwTYg/OAaK4AtTiTqzkZ9oacHcFKlaLB
 zdxxfEHjCyW7A+DGAgc8Jt0kgqG916iyfQ==
X-Google-Smtp-Source: AGHT+IEPY1qvcYX6abJWYuChB9Ipgo+7ToqSUPTwY0YmtmiGNVv05zaPCkpfTiQio/F1577VR/z3NA==
X-Received: by 2002:a05:6a20:a891:b0:199:88fa:adbe with SMTP id
 ca17-20020a056a20a89100b0019988faadbemr2035046pzb.35.1705312389281; 
 Mon, 15 Jan 2024 01:53:09 -0800 (PST)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com.
 [209.85.216.45]) by smtp.gmail.com with ESMTPSA id
 ku6-20020a170903288600b001d555735b6bsm7279646plb.239.2024.01.15.01.53.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 01:53:09 -0800 (PST)
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-28be52a85b9so5641407a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 01:53:08 -0800 (PST)
X-Received: by 2002:a81:6d41:0:b0:5f6:46b:b0be with SMTP id
 i62-20020a816d41000000b005f6046bb0bemr2963784ywc.61.1705312367679; Mon, 15
 Jan 2024 01:52:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <9c3a9caaa1e2fc7e515cac67f07a20af071bd1be.1704788539.git.ysato@users.sourceforge.jp>
In-Reply-To: <9c3a9caaa1e2fc7e515cac67f07a20af071bd1be.1704788539.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 Jan 2024 10:52:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWSR3ikL7VZYkNOb1Y8mPU5LaUnc8+WLj-Ec99EOWxs_w@mail.gmail.com>
Message-ID: <CAMuHMdWSR3ikL7VZYkNOb1Y8mPU5LaUnc8+WLj-Ec99EOWxs_w@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 22/37] dt-bindings: display: smi,sm501: SMI
 SM501 binding json-schema
To: Yoshinori Sato <ysato@users.sourceforge.jp>
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
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-sh@vger.kernel.org,
 Bin Meng <bmeng@tinylab.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pci@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org,
 Max Filippov <jcmvbkbc@gmail.com>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Yang Xiwen <forbidden405@foxmail.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>, linux-ide@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Sebastian Reichel <sre@kernel.org>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sato-san,

On Tue, Jan 9, 2024 at 9:24=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Thanks for your patch!

> ---
>  .../bindings/display/smi,sm501.yaml           | 417 ++++++++++++++++++
>  1 file changed, 417 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/smi,sm501.y=
aml

Surely Documentation/devicetree/bindings/display/sm501fb.txt should
be removed, too?

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/smi,sm501.yaml

> +  crt:
> +    type: object
> +    description: CRT output control
> +    properties:
> +      edid:
> +        $ref: /schemas/types.yaml#/definitions/uint8-array
> +        description: |
> +          verbatim EDID data block describing attached display.
> +          Data from the detailed timing descriptor will be used to
> +          program the display controller.
> +
> +      smi,flags:
> +        $ref: /schemas/types.yaml#/definitions/string-array
> +        description: Display control flags.
> +        items:
> +          anyOf:
> +            - const: use-init-done
> +            - const: disable-at-exit
> +            - const: use-hwcursor
> +            - const: use-hwaccel

The "use-*" flags look like software policy, not hardware description,
and thus do not belong in DT?

> +            - const: panel-no-fpen
> +            - const: panel-no-vbiasen
> +            - const: panel-inv-fpen
> +            - const: panel-inv-vbiasen
> +        maxItems: 8
> +
> +      bpp:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Color depth
> +
> +  panel:
> +    type: object
> +    description: Panel output control
> +    properties:
> +      edid:
> +        $ref: /schemas/types.yaml#/definitions/uint8-array
> +        description: |
> +          verbatim EDID data block describing attached display.
> +          Data from the detailed timing descriptor will be used to
> +          program the display controller.
> +
> +      smi,flags:
> +        $ref: /schemas/types.yaml#/definitions/string-array
> +        description: Display control flags.
> +        items:
> +          anyOf:
> +            - const: use-init-done
> +            - const: disable-at-exit
> +            - const: use-hwcursor
> +            - const: use-hwaccel

The "use-*" flags look like software policy, not hardware description,
and thus do not belong in DT?

> +            - const: panel-no-fpen
> +            - const: panel-no-vbiasen
> +            - const: panel-inv-fpen
> +            - const: panel-inv-vbiasen
> +        maxItems: 8
> +
> +      bpp:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Color depth
> +
> +  smi,devices:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description: Select SM501 device functions.
> +    items:
> +      anyOf:
> +        - const: usb-host
> +        - const: usb-slave
> +        - const: ssp0
> +        - const: ssp1
> +        - const: uart0
> +        - const: uart1
> +        - const: fbaccel
> +        - const: ac97
> +        - const: i2s
> +        - const: gpio
> +    minItems: 1
> +    maxItems: 10

I think it would be better to have individual subnodes for the sub devices,
with status =3D "ok"/"disabled".

If you go that route, you do need some fallback code to handle the lack
of subnodes in the existing user in arch/powerpc/boot/dts/charon.dts.

BTW, why can sm501_pci_initdata get away with setting ".devices
=3D SM501_USE_ALL"?  Or, would it hurt to enable all subdevices
unconditionally?

> +
> +  smi,mclk:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: mclk frequency.
> +
> +  smi,m1xclk:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: m1xclk frequency.

These two should be clock specifiers (i.e. phandles pointing to clock
nodes + optional clock indices).

> +
> +  misc-timing:
> +    type: object
> +    description: Miscellaneous Timing register values.
> +    properties:
> +      ex:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Extend bus holding time.
> +        enum: [0, 16, 32, 48, 64, 80, 96, 112, 128, 144, 160, 176, 192, =
208, 224, 240]
> +
> +      xc:
> +        $ref: /schemas/types.yaml#/definitions/string
> +        description: Xscale clock input select.
> +        items:
> +          enum:
> +            - internal-pll
> +            - hclk
> +            - gpio33

Software policy instead of hardware description again?

I am not familiar with how the SM501 works, so I cannot comment on
the other properties, but several of them look like they need rework.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
