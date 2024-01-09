Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EE7828628
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 13:43:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B75A10E0D7;
	Tue,  9 Jan 2024 12:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com
 [IPv6:2607:f8b0:4864:20::1134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECA610E0D7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 12:43:05 +0000 (UTC)
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-5ed10316e22so24123247b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 04:43:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704804184; x=1705408984; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YRdzfj7JEW1eBQjWfVgccO0cPj0nGjhcrGXH3osu83E=;
 b=i8gYYOKOWrJnpWpUmomULieeA48poxgQNdLVkNfj/JaQdOHSXgMi85NuX676sH3tuk
 dTrH/hUnfLqL5zIQX15F1TbSF5/oK5rryThituQAgCK+xyL/CTuqU/uqyi+gp+gmXLE8
 8hOhlrM4n5a80dZKj16P7vF+XfULkxgz/APfYDQapqoXwEfrzTd9K1NoSLJq4idCBGqQ
 YukO4R65QD4e5HnnfRo/Gn8v3GNoBk3dW7BQ1kAQ+ufriT2+a+ZushEiwWILa7smKGf9
 XTeHukkAKRIeKgYjEIbeSlfrL2HX7fE2gbuerq6L4VkvYqoZZYMkn+nzw961iM8Yl6ZK
 56Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704804184; x=1705408984;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YRdzfj7JEW1eBQjWfVgccO0cPj0nGjhcrGXH3osu83E=;
 b=TOKzGSsg7H3j2huKIgfp67fStbkrNIvPQf9HZrSt14SAlzfoABRn+5i6F/YHCvDQXK
 EBtNFGPEyfimmbv+d7wpzPdoXpcvfW78+h+Kaj3mokfqrKSpOQeRO7c5XwxwsahAE38o
 R+ApFE0/higcjmN5JsQRhleuAJ/g1aRW1PlGm1hoSADqeGbh3/dmPSXYbCL9tbW7BfgM
 ZP7LpUJ6DIAArq+cmusgRxfiwD3Zzp9o5uZNJcs2ur6NZR97SvTeg4V1KHdqew2x8AZq
 yb4Gtr5dEEV8jN3T9O2hgY8h5f6y3Mya8nNRc2pj7EjHHwomojtU4DVakP8jBEDNwrFY
 PnsA==
X-Gm-Message-State: AOJu0YwuesKUKBftPuHTtcjUQnP8q+r9VanQTeAtBJMUGWG7hvrgLaXs
 ngpY0Gqgc1UcTOz5vrpbGdJVEvNUT2zW+0cHpCqhBLhL12PASw==
X-Google-Smtp-Source: AGHT+IGP2TpOD/2aQljjLpEh7rgxkZ1rPK7JLdhb+SJI4gzWB4npHJxZY6IBNmQ0p0RFR21+Q3sEEaYhEw7pDx3EeW0=
X-Received: by 2002:a0d:cb85:0:b0:5f1:7189:b9d with SMTP id
 n127-20020a0dcb85000000b005f171890b9dmr2932736ywd.82.1704804184379; Tue, 09
 Jan 2024 04:43:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <160ee086771703c951c5522d997662aeac122a28.1704788539.git.ysato@users.sourceforge.jp>
In-Reply-To: <160ee086771703c951c5522d997662aeac122a28.1704788539.git.ysato@users.sourceforge.jp>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 9 Jan 2024 13:42:53 +0100
Message-ID: <CACRpkdZMkyJdkFt_x-6iubLZ-KzewvmT0zi4HAas0Xy9DpPn3g@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 12/37] dt-bindings: pci: pci-sh7751: Add SH7751
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
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
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
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
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

Hi Yoshinori,

thanks for your patch!

On Tue, Jan 9, 2024 at 9:24=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:

> Renesas SH7751 PCI Controller json-schema.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
(...)
> +  renesas,bus-arbit-round-robin:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Set DMA bus arbitration to round robin.
> +
> +  pci-command-reg-fast-back-to-back:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Set for PCI command register Fast Back-to-Back enable bit.
> +
> +  pci-command-reg-serr:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Set for PCI command register SERR# enable.
> +
> +  pci-command-reg-wait-cycle-control:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Set for PCI command register Wait cycle control bit.
> +
> +  pci-command-reg-parity-error-response:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Set for PCI Command register Parity error response bit.
> +
> +  pci-command-reg-vga-snoop:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Set for PCI Command register VGA palette snoop bit.
> +
> +  pci-command-reg-write-invalidate:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Set for PCI Command register Memory write and invaldate enable bit=
.
> +
> +  pci-command-reg-special-cycle:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Set for PCI Command register Special cycle bit.
> +
> +  pci-command-reg-bus-master:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Set for PCI Command register Bus master bit.
> +
> +  pci-command-reg-memory-space:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Set for PCI Command register Memory space bit.
> +
> +  pci-command-reg-io-space:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Set for PCI Command register I/O space bit.

Do you really need to configure all these things? It seems they are
just set to default values anyway?

Can't you just look at the compatible "renesas,sh7751-pci" and
set it to the values you know are needed for that compatible?

> +  pci-bar:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    description: Overwrite to  PCI CONFIG Base Address Registers value.
> +    items:
> +      items:
> +        - description: BAR register number
> +        - description: BAR register value
> +    minItems: 1
> +    maxItems: 6

Same with this, isn't this always the same (hardcoded) values
for "renesas,sh7751-pci" if used?

> +            interrupt-map =3D <0x0000 0 0 1 &julianintc 5>,
> +                            <0x0000 0 0 2 &julianintc 6>,
> +                            <0x0000 0 0 3 &julianintc 7>,
> +                            <0x0000 0 0 4 &julianintc 8>,
> +                            <0x0800 0 0 1 &julianintc 6>,
> +                            <0x0800 0 0 2 &julianintc 7>,
> +                            <0x0800 0 0 3 &julianintc 8>,
> +                            <0x0800 0 0 4 &julianintc 5>,
> +                            <0x1000 0 0 1 &julianintc 7>,
> +                            <0x1000 0 0 2 &julianintc 8>,
> +                            <0x1000 0 0 3 &julianintc 5>,
> +                            <0x1000 0 0 4 &julianintc 6>;

This interrupt-map looks very strange, usually the last cell is the polarit=
y
flag and here it is omitted? I would expect something like:

<0x0000 0 0 1 &julianintc 5 IRQ_TYPE_LEVEL_LOW>, (...)

The interrupt-map schema in dtschema isn't really looking at this
so it is easy to get it wrong.

Yours,
Linus Walleij
