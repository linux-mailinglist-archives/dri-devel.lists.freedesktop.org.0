Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00388806108
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 22:48:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73BF810E044;
	Tue,  5 Dec 2023 21:48:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815FC10E044
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 21:48:53 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-5d33574f64eso68601607b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 13:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701812932; x=1702417732; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5eP0uI2tmZM9ZtqjfsWxJwWzFVr6JH04FbBdTmyNv/w=;
 b=SDmYQEUCl/xyLvxRGaurdyWoK+7IoAKmF4svsqwz//6LXOmCYQErpYhKp/9+0yVBqP
 pTe0wjXV+D9A29ehfUmptkKkpT4m0PbaAiv/YPn1dSJmJtuXh8Utzidh6kt8H0PnQNtN
 rN03WTp5h7Lb3bP0RkkzSeOzZvbLuFFXUP0yPNebJP8kXp2ZKcfbZpMeVB6+o7ksFsnh
 TPEPgjDvRp7sP4NFf5s0XwArzh+WSAqfqmzkROnCs+oyk6Y2CbaFaluUz2Apf5wArk47
 UzzvVXHWLFhwlfkzQlmouHbxTjM2fXvzX+qaHBtQX1LeZIxr1raOuhVw8LP0V+squrhY
 /57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701812932; x=1702417732;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5eP0uI2tmZM9ZtqjfsWxJwWzFVr6JH04FbBdTmyNv/w=;
 b=XTo0eUI8aO3oUOc7EmlmkR0HD+7ldT18w9GbzNp7USuy1uzulKvAHmlQMqvB0h04sA
 6iuQ1W9N2uNhBdGxJw7ZU7zSNAYmZIUli8K8kWkwA+1jsoyv+kg80Xvkw7nHGTFfEU0q
 8uUqw7yuD5Au+swKawx3Od/vYH2rqyuyB3ue17UcIPmuNWivH64kD0uNQu3Mp1N80UwE
 W6xgDjcxz+t/i6KPyGzRoSlkKyqmhKL6xi32O2/OiRqeA8+kT9//F1GT/96YRMsHZV9z
 7p/rtpY19k98TwwcFGiZYFdz2sqDtz5g6EcoADhkKlavIuuYmnCboHeZopty8qt3dfna
 Gh+w==
X-Gm-Message-State: AOJu0YyJl3uYVwZkRN9f4fQnQsN+V4apafCImO/H3dXZyWYRAXtb7mxe
 6PWHmhGo83xxRav2ZtwxJ7BhXnoygdtyVAmYDn8HUQ==
X-Google-Smtp-Source: AGHT+IEC7pNshX6Y57af6XTx4hp1z/Y9MEpMHk/hv4YF7sUJybFapw88Qbjz6GB2s4WrIdgZn+IiEoCY/A4u2lTVAiA=
X-Received: by 2002:a25:aac2:0:b0:db7:dacf:59d1 with SMTP id
 t60-20020a25aac2000000b00db7dacf59d1mr4535677ybi.69.1701812932200; Tue, 05
 Dec 2023 13:48:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <602e1ba4f02489fcbc47e8f9904f3c1db1c9f14a.1701768028.git.ysato@users.sourceforge.jp>
 <2ef81211-9525-4f96-a6b2-3fcfbed0c6e5@app.fastmail.com>
In-Reply-To: <2ef81211-9525-4f96-a6b2-3fcfbed0c6e5@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 5 Dec 2023 22:48:41 +0100
Message-ID: <CACRpkdZUAMXJ4YM9+xW2Snzt0Dx5mxWjcwHZifsXPJH9ozL5bg@mail.gmail.com>
Subject: Re: [DO NOT MERGE v5 11/37] pci: pci-sh7751: Add SH7751 PCI driver
To: Arnd Bergmann <arnd@arndb.de>
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
 Herve Codina <herve.codina@bootlin.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 Bin Meng <bmeng@tinylab.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pci@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Max Filippov <jcmvbkbc@gmail.com>,
 guoren <guoren@kernel.org>, Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>,
 Helge Deller <deller@gmx.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Baoquan He <bhe@redhat.com>, linux-ide@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Tom Rix <trix@redhat.com>,
 Damien Le Moal <dlemoal@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 5, 2023 at 2:26=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Dec 5, 2023, at 10:45, Yoshinori Sato wrote:

> > +     if (of_property_read_u32_array(pdev->dev.of_node,
> > +                                    "renesas,memory", memory, 2) < 0) =
{
> > +             /*
> > +              * If no memory range is specified,
> > +              *  the entire main memory will be targeted for DMA.
> > +              */
> > +             memory[0] =3D memory_start;
> > +             memory[1] =3D memory_end - memory_start;
> > +     }
>
> There is a generic "dma-ranges" proerty for describing
> which memory is visible by a bus.

It's really a headache to use, so I put a bit of documentation here:
https://elinux.org/Device_Tree_Usage#PCI_DMA_Address_Translation

Yoshinoro, you can look at these bindings and drivers that use
dma-ranges for help:
Documentation/devicetree/bindings/pci/intel,ixp4xx-pci.yaml
drivers/pci/controller/pci-ixp4xx.c
Documentation/devicetree/bindings/pci/faraday,ftpci100.yaml
drivers/pci/controller/pci-ftpci100.c

Yours,
Linus Walleij
