Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF6D805FF7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 22:02:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2101E10E61A;
	Tue,  5 Dec 2023 21:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 202A510E61A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 21:02:03 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id
 5614622812f47-3b845ba9ba9so3870356b6e.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 13:02:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701810122; x=1702414922;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IdYRNh7Vlob6vHvVQj3FqYlHUzVIZf5EcZbK3xhngEg=;
 b=ivqHAp7PwNdwz+Zcrfd2QU4qWYhNn2CSHyGgRyI/AXAAs1gkRkSu6d6a172WpG8gTo
 xOlhdZvnoVjJwtU3SiQxen5lE3q/WD8bNJJKKEQ5AS5KF85gMt8sQ/edDLBhAdjTghFl
 S42RnFbSnM/SuGlsFxmgWVST/slkChimP50v9E4kzgBTnG6W2GxGGXy3CXKsL2Rq7DsS
 bNtByf3eSsnXeX8ZUqyM1adZnAtOdG1O6Fm7XRceDrUDhT75FodwZmiPE/jgbCR7L0E+
 xhIwleprYsfQYyGcx75UvK4sC/gZIiMdVniwxKfb4SZeK0EXpAfdOtGW5U3EQQ4UCbTq
 AXzw==
X-Gm-Message-State: AOJu0YzpbGFh+Btm/pfd57mX6nMgwVHU+dHyx/LUXDre/ZkQi8bqOOm7
 EESwzNLfi97XkcPYSAGczg==
X-Google-Smtp-Source: AGHT+IEELo2vI+di+qlC0rsG6Gdv4w/6prGhHS2OYuIkz413JcirnWVw4QzKEsB7bi8jrOvnQ/zU7Q==
X-Received: by 2002:a05:6870:b50e:b0:1fb:75c:3feb with SMTP id
 v14-20020a056870b50e00b001fb075c3febmr7677773oap.75.1701810122176; 
 Tue, 05 Dec 2023 13:02:02 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 ps14-20020a0568709e0e00b001fb4aaf261csm1037762oab.32.2023.12.05.13.01.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 13:02:01 -0800 (PST)
Received: (nullmailer pid 3792495 invoked by uid 1000);
 Tue, 05 Dec 2023 21:01:58 -0000
Date: Tue, 5 Dec 2023 15:01:58 -0600
From: Rob Herring <robh@kernel.org>
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: Re: [DO NOT MERGE v5 19/37] dt-bindings: interrupt-controller:
 renesas,sh7751-irl-ext: Add json-schema
Message-ID: <20231205210158.GA3774253-robh@kernel.org>
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <1623383c89532994218795cd3755c37819be426b.1701768028.git.ysato@users.sourceforge.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1623383c89532994218795cd3755c37819be426b.1701768028.git.ysato@users.sourceforge.jp>
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
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Bin Meng <bmeng@tinylab.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pci@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Guo Ren <guoren@kernel.org>, Lee Jones <lee@kernel.org>,
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
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Damien Le Moal <dlemoal@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 linux-ide@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 linux-renesas-soc@vger.kernel.org, Tom Rix <trix@redhat.com>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 05, 2023 at 06:45:38PM +0900, Yoshinori Sato wrote:
> Renesas SH7751 external interrupt encoder json-schema.
> 
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  .../renesas,sh7751-irl-ext.yaml               | 83 +++++++++++++++++++
>  1 file changed, 83 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.yaml
> new file mode 100644
> index 000000000000..ba4fe2e4d749
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,sh7751-irl-ext.yaml
> @@ -0,0 +1,83 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/renesas,sh7751-irl-ext.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SH7751 IRL external encoder with enable regs.

IRL? In Real Life?

> +
> +maintainers:
> +  - Yoshinori Sato <ysato@users.sourceforge.jp>
> +
> +description: |

Don't need '|' if no formatting to preserve.

> +  This is the generally used external interrupt encoder on SH7751 based boards.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: renesas,sh7751-irl-ext
> +
> +  reg:
> +    minItems: 1

maxItems: 1

> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  '#address-cells':
> +    const: 0
> +
> +  '#size-cells':
> +    const: 0

Don't need #size-cells.

> +
> +  renesas,width:
> +    description: Enable register width
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [8, 16, 32]

reg-io-width is the standard property for this purpose.

> +
> +  renesas,set-to-disable:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: Setting this flag to 1 disables it.

You can't set a boolean to 1. What is 'it' here? 

> +
> +  renesas,enable-bit:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array

You've described a 2 entry matrix, not an array.

> +    description: |
> +      IRL enable register bit mapping
> +      1st word IRL
> +      2nd word bit index of enable register

Needs a better description of what this is for. If it is per SoC then it 
should be implied from the compatible string.


> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - renesas,width
> +  - renesas,enable-bit
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    r2dintc: sh7751irl_encoder@a4000000 {

interrupt-controller@...

Drop unused labels.

> +        compatible = "renesas,sh7751-irl-ext";
> +        reg = <0xa4000000 0x02>;
> +        interrupt-controller;
> +        #address-cells = <0>;
> +        #size-cells = <0>;
> +        #interrupt-cells = <1>;
> +        renesas,width = <16>;
> +        renesas,enable-bit = <0 11>,            /* PCI INTD */
> +                             <1 9>,             /* CF IDE */
> +                             <2 8>,             /* CF CD */
> +                             <3 12>,            /* PCI INTC */
> +                             <4 10>,            /* SM501 */
> +                             <5 6>,             /* KEY */
> +                             <6 5>,             /* RTC ALARM */
> +                             <7 4>,             /* RTC T */
> +                             <8 7>,             /* SDCARD */
> +                             <9 14>,            /* PCI INTA */
> +                             <10 13>,           /* PCI INTB */
> +                             <11 0>,            /* EXT */
> +                             <12 15>;           /* TP */

Looks like the first value is just the index of the entry, so drop it 
and use the index.

But better yet, these are all per interrupt values. Put them into the 
interrupt cell values instead. For example the RTC would have something 
like:

interrupts = <6 5>, <7 4>;

Though I do wonder if you really need the first value, or that was just 
interrupt numbers you made up and then created this mapping?

Rob
