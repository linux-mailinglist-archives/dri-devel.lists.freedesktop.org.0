Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E771B869CB4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 17:47:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4987110E149;
	Tue, 27 Feb 2024 16:47:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE9010E146
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 16:47:39 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-6e4a0e80d14so1497106a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:47:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709052458; x=1709657258;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HZPoTNL+iADoSj5Qyix6GRoCmMKDXGJWybMxRcvYTvA=;
 b=F0uyzvOuAFQ/hbfvSnjhlRJxvXUySn1bO+QN5V3LDVybKNrWQkVwoLHBfBZogfeV0G
 shpbXQzWhxrsQlzlDvLn2iKLj7KvODdfR2RhjUyTZwuMHrpVK8beef6chkRTitNFUj6R
 jbZHyUO0SvPufH0ErhGGcqXIODqgjfh3qEOpXNoO17Ku0WhJ11GMFRpCCkckWxdZxl/0
 wcxd1Vrh6+I+T8xP1X4L5AhW6WH8wkltrOU1TszNMFw7dalRr/XQDLVtN1SRgXO4+hWy
 K2FUF9LLOVb6bgfuNX/SObpzh488cOMxgk6eruorzUNqaWb22GnmrP10jbaEY8yR2G3h
 Vzew==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV1LpoEDXg/YuM6Th7OzBpOpSYkewuv4Bm1TNqGDBUVds+CSPqAOPZu3urhNSlGcEO+RBp8oyIj5wWbIVATwXU+gZG54dS/5h+Q86PRPxP
X-Gm-Message-State: AOJu0YwHh3OBVk9lEUGvJeArOahih8ApYCY7FOAp6Mg1eEZyWRswyMgh
 kpCWllLHPFVKI03FBu3I+7jS6hk69Fd0qULz6TObOCSacfxAllyoTIotfOJbulGrAQ==
X-Google-Smtp-Source: AGHT+IHaZk2+6OqxGgMAzFw26mDnY6fTa95spECq1hGeoXX2MgNVbEpY/tFk76lkzIBoS71relBmGw==
X-Received: by 2002:a9d:4d92:0:b0:6e4:a8bd:27e4 with SMTP id
 u18-20020a9d4d92000000b006e4a8bd27e4mr4055763otk.21.1709052457837; 
 Tue, 27 Feb 2024 08:47:37 -0800 (PST)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com.
 [209.85.210.42]) by smtp.gmail.com with ESMTPSA id
 d11-20020a05683025cb00b006e4b1b48e7csm117053otu.28.2024.02.27.08.47.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 08:47:37 -0800 (PST)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-6e497a1481cso854550a34.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 08:47:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUE5T9qteg3o5UkprKOF/ryp5WnZACW9shEL5pPtABc4O5yut7mLuX8SQCtj50reeRv6WVlGUHwNajcjAIEVlmiBw+GqIpw0VBIerHV8EqT
X-Received: by 2002:a25:81cd:0:b0:dc7:776b:5e4a with SMTP id
 n13-20020a2581cd000000b00dc7776b5e4amr10070ybm.56.1709052436589; Tue, 27 Feb
 2024 08:47:16 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <8dd000fd9040804ec520b76de1b026747e16fc2c.1704788539.git.ysato@users.sourceforge.jp>
In-Reply-To: <8dd000fd9040804ec520b76de1b026747e16fc2c.1704788539.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 17:47:05 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVsJ+VvfcV4UncRsq6mTUcR2njFL4XC+mJuA9hZ-GJAaw@mail.gmail.com>
Message-ID: <CAMuHMdVsJ+VvfcV4UncRsq6mTUcR2njFL4XC+mJuA9hZ-GJAaw@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 13/37] dt-bindings: clock: sh7750-cpg: Add
 renesas,sh7750-cpg header.
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Thomas Gleixner <tglx@linutronix.de>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Bjorn Helgaas <bhelgaas@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lee Jones <lee@kernel.org>, 
 Helge Deller <deller@gmx.de>, Heiko Stuebner <heiko@sntech.de>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chris Morgan <macromorgan@hotmail.com>, 
 Yang Xiwen <forbidden405@foxmail.com>, Sebastian Reichel <sre@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Vlastimil Babka <vbabka@suse.cz>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
 David Rientjes <rientjes@google.com>, Baoquan He <bhe@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, Azeem Shaikh <azeemshaikh38@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, 
 Palmer Dabbelt <palmer@rivosinc.com>, Bin Meng <bmeng@tinylab.org>, 
 Jonathan Corbet <corbet@lwn.net>, Jacky Huang <ychuang3@nuvoton.com>, 
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sam Ravnborg <sam@ravnborg.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sato-san,

Thanks for your patch!

On Tue, Jan 9, 2024 at 9:24=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> SH7750 CPG Clock output define.

Please improve the patch description.

> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/renesas,sh7750-cpg.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/renesas,sh7750-cpg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SH7750/7751 Clock Pulse Generator (CPG)
> +
> +maintainers:
> +  - Yoshinori Sato <ysato@users.sourceforge.jp>
> +
> +description:
> +  The Clock Pulse Generator (CPG) generates core clocks for the SoC.  It
> +  includes PLLs, and variable ratio dividers.
> +
> +  The CPG may also provide a Clock Domain for SoC devices, in combinatio=
n with
> +  the CPG Module Stop (MSTP) Clocks.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,sh7750-cpg             # SH7750
> +      - renesas,sh7750s-cpg            # SH775S
> +      - renesas,sh7750r-cpg            # SH7750R
> +      - renesas,sh7751-cpg             # SH7751
> +      - renesas,sh7751r-cpg            # SH7751R
> +
> +  reg: true
> +
> +  reg-names: true
> +
> +  clocks: true

  clocks:
    maxItems: 1

> +
> +  clock-names: true

  clock-names:
      const: extal

> +examples:
> +  - |
> +    #include <dt-bindings/clock/sh7750-cpg.h>
> +    cpg: clock-controller@ffc00000 {
> +        #clock-cells =3D <1>;
> +        #power-domain-cells =3D <0>;
> +        compatible =3D "renesas,sh7751r-cpg";
> +        clocks =3D <&xtal>;
> +        clock-names =3D "xtal";

"extal"

"xtal" is an output pin, connected to a crystal resonator.
"extal" is the clock input put (either crystal resonator or exteral
clock input.

> +        reg =3D <0xffc00000 20>, <0xfe0a0000 16>;
> +        reg-names =3D "FRQCR", "CLKSTP00";
> +        renesas,mode =3D <0>;
> +    };
> diff --git a/include/dt-bindings/clock/sh7750-cpg.h b/include/dt-bindings=
/clock/sh7750-cpg.h
> new file mode 100644
> index 000000000000..17d5a8076aac
> --- /dev/null
> +++ b/include/dt-bindings/clock/sh7750-cpg.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> + *
> + * Copyright 2023 Yoshinori Sato
> + */
> +
> +#ifndef __DT_BINDINGS_CLOCK_SH7750_H__
> +#define __DT_BINDINGS_CLOCK_SH7750_H__
> +
> +#define SH7750_CPG_PLLOUT      0
> +
> +#define SH7750_CPG_FCK         1

PCK?

> +#define SH7750_CPG_BCK         2
> +#define SH7750_CPG_ICK         3

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
