Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369F3869B71
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 16:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 048B810E938;
	Tue, 27 Feb 2024 15:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D34210E7A3
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 15:59:13 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-565d1656c12so4771960a12.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 07:59:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709049549; x=1709654349;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IptBoEO/nbU9/WEAcwSC51BarbPlLUIodqi54T15K7k=;
 b=AQidJVoSfTr2RBqDZdovb5vcH0FFPDytLRQBM3RsG3SpFhpQ3IQPp1BmbXNzD9VvRN
 zTaBnG6rOiyqYeVHW32tHHtMCk8mLBJUJw1uaPKVv69IRR0r4lIVgvRPBEYuRyISGZuy
 +7++OhlZSJAtP9Jq9iy3sEkCEweuG5iWX1R3iHyIhUZsdoHUcXMGG58K4TGN00CIZ/9R
 QIDAo4nvbXR3SdiGXxWsXGo1uge9QS6nLPdTD/e9zkXGhQLpkUupy5tR7hz/LP78+mZG
 hXFyas0eFiiqIG2ohDAMjNJPEinNmKjESPtbn1vwrco6V9/OLgnVmzFP2JDYZ0RfhdH7
 Etvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbqncvQPHrq7yWgiq6UCsirJ8ZWPuOwqRsVW43hsDCy3ATgwWMTpIlVxbN6IrgH1jx7+sEsgNIrbiuhHhgbNmiU3n15gj/oA6+mfl+xz5O
X-Gm-Message-State: AOJu0Yyj6g25aJK6maa9fGZG73m0ECEtl/bM2uOCF/nsjsrnZeE4DSy1
 QzFE/Lp2sE7oLnlLMF4/M+m+D7/D9u5YbVVJ+ujCIvqlvA5HDAbkdeQcvif2aZ+fvA==
X-Google-Smtp-Source: AGHT+IEBq1eDmFPrANqKy8U7w91yJcHBYg4TFxCMVOd7GehxZPXSqgDGYQmbXKnqgPTXgMByeo+XIg==
X-Received: by 2002:a05:6402:530c:b0:561:3b53:d0af with SMTP id
 eo12-20020a056402530c00b005613b53d0afmr9498780edb.12.1709049549166; 
 Tue, 27 Feb 2024 07:59:09 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com.
 [209.85.218.42]) by smtp.gmail.com with ESMTPSA id
 b11-20020a0564021f0b00b005662c8240aesm867912edb.80.2024.02.27.07.59.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 07:59:08 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id
 a640c23a62f3a-a3e75e30d36so818440366b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 07:59:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXNRlvfQXwzT6+ZMt2315PwBowrtXMC3A3QRjDyYUwiS32bN06scvyKgdZYqCiK+ZMoX9WWeeLEIIPIU6aTRWv9YmPqpyFfCkPzT1EVp5hM
X-Received: by 2002:a2e:b541:0:b0:2d2:43a3:1355 with SMTP id
 a1-20020a2eb541000000b002d243a31355mr2766471ljn.15.1709049527187; Tue, 27 Feb
 2024 07:58:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <d832abfa099355b90eba461f22116a6e426c1648.1704788539.git.ysato@users.sourceforge.jp>
In-Reply-To: <d832abfa099355b90eba461f22116a6e426c1648.1704788539.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 16:58:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXMLPtO49kmxfSVEXLYOVLj+tqisYTwYqSeyJgy3bir8A@mail.gmail.com>
Message-ID: <CAMuHMdXMLPtO49kmxfSVEXLYOVLj+tqisYTwYqSeyJgy3bir8A@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 28/37] dt-bindings: soc: renesas: sh: Add SH7751
 based target
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

On Tue, Jan 9, 2024 at 9:24=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/renesas/sh.yaml
> @@ -0,0 +1,32 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/renesas/sh.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas SuperH Platform
> +
> +maintainers:
> +  - Yoshinori Sato <ysato@users.sourceforge.jp>
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: RTS7751R2D Plus
> +        items:
> +          - enum:
> +              - renesas,rts7751r2d # Renesas SH4 2D graphics board
> +          - const: renesas,sh7751r
> +
> +      - description: Julian board
> +        items:
> +          - enum:
> +              - iodata,landisk  # LANDISK HDL-U
> +              - iodata,usl-5p   # USL-5P
> +          - const: renesas,sh7751r

As both use the same fallback compatible value, I would just merge
them into a single section for SH7751R.

> +
> +additionalProperties: true
> +
> +...

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
