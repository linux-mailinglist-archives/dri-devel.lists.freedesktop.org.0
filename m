Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB7A8056F3
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 15:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5661110E53E;
	Tue,  5 Dec 2023 14:15:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2A810E53E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 14:15:25 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-6ce26a03d9eso1890190b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 06:15:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701785725; x=1702390525;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wjEDTZbGLWl0kPzOEjqjXQ57XT0xydUQvJCUY6FowqA=;
 b=ZL4jwfqJ4qn6xu1aqxxlcY40uStRDqCj6XtnFdHWe1xNogdr7iZUlSTmcU1P3RK3FA
 6PyNGqCtjGsMCfhW8T3a5TJCeVOXrRhJvquQKYdVh5UfvaaETF7U3CoATPUXS7N0iKWo
 1na88c+8Qzez3BoCZ6WNofZw9T+j+/4iYsLU2BiYyKNYBLlV1kwZVbnEYix/cr8W6WKR
 1I6aFQNnyK/n5B7mmLxganfhrQXG5xFZVN+Xwx9bI1zq77McgB95SWuZokfkx8DdtNAb
 zP048mg4TuhBHx3AtqU7pm2BTbfnfPEwkUqlfRi5ewUtyogNnur9JxsCW0Ll0eNC6nW1
 pHtw==
X-Gm-Message-State: AOJu0YzV9V5GCsiVSEvn2/xoBt9cOVokQKQeG1dg0qtlO0ZOLaDFXnAJ
 rWxJgIT9V/tgx1hWU5TqmAoOuHe6VHvLCw==
X-Google-Smtp-Source: AGHT+IFv5UM3C3dR9fqFGnXYs1WIpGrkyh3kUN7E4Jx/hIZ4201JOh+Ii9gBvooGWxRO5NZBszsQqA==
X-Received: by 2002:a05:6a20:f388:b0:18f:bce9:5961 with SMTP id
 qr8-20020a056a20f38800b0018fbce95961mr14438pzb.15.1701785725158; 
 Tue, 05 Dec 2023 06:15:25 -0800 (PST)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com.
 [209.85.216.52]) by smtp.gmail.com with ESMTPSA id
 u197-20020a6379ce000000b005b92d3cb4c2sm1660206pgc.58.2023.12.05.06.15.23
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 06:15:23 -0800 (PST)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2864f8131d0so3458703a91.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 06:15:23 -0800 (PST)
X-Received: by 2002:a81:ee0b:0:b0:5d7:1941:a9a with SMTP id
 l11-20020a81ee0b000000b005d719410a9amr4666145ywm.53.1701785702584; Tue, 05
 Dec 2023 06:15:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <ca3122511b201a0da0a3f930c0f894bf11954423.1701768028.git.ysato@users.sourceforge.jp>
In-Reply-To: <ca3122511b201a0da0a3f930c0f894bf11954423.1701768028.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2023 15:14:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUY1aduN=6kaHFyfT=U3J3K3NPZDK2mCct8vS9XaMfaiA@mail.gmail.com>
Message-ID: <CAMuHMdUY1aduN=6kaHFyfT=U3J3K3NPZDK2mCct8vS9XaMfaiA@mail.gmail.com>
Subject: Re: [DO NOT MERGE v5 12/37] dt-bindings: pci: pci-sh7751: Add SH7751
 PCI
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
 Herve Codina <herve.codina@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-sh@vger.kernel.org, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>,
 Lee Jones <lee@kernel.org>,
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
 Thomas Zimmermann <tzimmermann@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sato-san,

On Tue, Dec 5, 2023 at 10:46=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Renesas SH7751 PCI Controller json-schema.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/renesas,sh7751-pci.yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/renesas,sh7751-pci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SH7751 PCI Host controller
> +
> +maintainers:
> +  - Yoshinori Sato <ysato@users.sourceforge.jp>
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-bus.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,sh7751-pci
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2

Please add "reg-names", as there is more than one entry.
If that is not sufficient to document what each entry means, please add
"description"s, too.

> +  renesas,memory:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      PCI BMDMA src/dst memory area.

Isn't that the purpose of the "dma-ranges" property?

> +
> +  renesas,bcr1:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      SH7751 PCIC PCIBCR1 value. This value makes add the value of BSC's=
 BCR1.

What does this mean?

> +
> +  renesas,mcrmask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      SH7751 PCIC PCIMCR value. This value makes clear bit in the value =
of BSC's MCR.

What does this mean?

> +
> +  renesas,intm:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      SH7751 PCIC PCIINTM value.
> +
> +  renesas,aintm:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      SH7751 PCIC PCIIANTM value.
> +
> +  renesas,lsr:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      SH7751 PCIC PCILSR0 and PCILSR1 values.
> +      First word is PCILSR0, Second word is PCILSR1.
> +
> +  renesas,lar:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      SH7751 PCIC PCILSA0 and PCILAR1 values.
> +      First word is PCILAR0, Second word is PCILAR1.
> +
> +  renesas,dmabt:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      SH7751 PCIC PCIDMABT value.
> +
> +  renesas,pintm:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      SH7751 PCIC PCIPINTM value.
> +
> +  renesas,config:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description: |
> +      SH7751 PCIC PCICONFIG values array. Register Number and value pair=
 list.

Several of these properties look like pure hardware programming.
Can these values be derived from other (standard) DT properties?

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
