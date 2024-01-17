Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9900D83033B
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 11:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D278110E107;
	Wed, 17 Jan 2024 10:06:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1948910E686
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 10:06:36 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6d98ce84e18so9491340b3a.3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 02:06:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705485995; x=1706090795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ktKDg1Kr1k5upORAnFgj9TjW3VLUUCKOkhGf1ZiTWq0=;
 b=Xs2Ba0u5hpXr6IL0/NmUCAX53L3R21Cp5QjG8WHDEu/5SyAcSVGzWzZcgYA5ivecxd
 xlv7KunsY+pJiCXuVAr0jvfkmbak4Db5Or1PxolxpiO436W/P0OvOceFlfaL4YUbPWWb
 ChNlYaP/pv6duZz57M3H7kMremG80gMn0pYRVl5OFHn+Ue/GGJxbUl8NI7je67iewXJ3
 oBvFwhfnjsepd4NQVhnZN38y+QoFC3zjjWkQjq4COUhvnDbg9s5ofwZVsACZRIqj3bOY
 1ygOZ7v0WBGTHURP48GHcaRRQwoH0GPmeFIlv6M8P3WO5yC4sYw6izK/zeol09JF8tdo
 5I+A==
X-Gm-Message-State: AOJu0YziLKwDjr5XguT9HNoZAtlcjoE4Dy1w0D3j+jtIvmD6voZe+Q2g
 ed2Jeldn1aywWnQGYbeDwrVd9KQ9lKw2CQ==
X-Google-Smtp-Source: AGHT+IEFUwVtXOf7BPfDa3cW4S3M6wlV1FNaM7cWnvpWnYIcgw9qy8OIfetr9XzCepti2B3XUIjMmw==
X-Received: by 2002:a05:6a20:c703:b0:19b:434a:df3 with SMTP id
 hi3-20020a056a20c70300b0019b434a0df3mr1930326pzb.18.1705485995401; 
 Wed, 17 Jan 2024 02:06:35 -0800 (PST)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com.
 [209.85.210.172]) by smtp.gmail.com with ESMTPSA id
 g7-20020a62f947000000b006d9bf71461asm1034442pfm.86.2024.01.17.02.06.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Jan 2024 02:06:35 -0800 (PST)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6db05618c1fso7958570b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jan 2024 02:06:34 -0800 (PST)
X-Received: by 2002:a05:690c:fd5:b0:5ee:7299:e2cf with SMTP id
 dg21-20020a05690c0fd500b005ee7299e2cfmr5153857ywb.52.1705485974135; Wed, 17
 Jan 2024 02:06:14 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <bc794e2165244bd0cee81bc0106f1e2d1bef1613.1704788539.git.ysato@users.sourceforge.jp>
 <CACRpkdYLsf-uWdMCTpieji7u1-H3oTGojvC4xm7Erox97XJ6RQ@mail.gmail.com>
 <8734uwwavx.wl-ysato@users.sourceforge.jp>
In-Reply-To: <8734uwwavx.wl-ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Jan 2024 11:06:02 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_2Tgm2LLM1TgFrkLdokD99gAeKHJWrKy9Y2A+wtf5RA@mail.gmail.com>
Message-ID: <CAMuHMdX_2Tgm2LLM1TgFrkLdokD99gAeKHJWrKy9Y2A+wtf5RA@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 17/37] dt-bindings: interrupt-controller:
 renesas,sh7751-intc: Add json-schema
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
 Bin Meng <bmeng@tinylab.org>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 linux-kernel@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Lee Jones <lee@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-clk@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Baoquan He <bhe@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@gmail.com>, Helge Deller <deller@gmx.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, linux-serial@vger.kernel.org,
 David Rientjes <rientjes@google.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@arndb.de>,
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
 linux-renesas-soc@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Damien Le Moal <dlemoal@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sato-san,

On Wed, Jan 17, 2024 at 10:46=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> On Tue, 09 Jan 2024 21:30:34 +0900,
> Linus Walleij wrote:
> > On Tue, Jan 9, 2024 at 9:24=E2=80=AFAM Yoshinori Sato
> > <ysato@users.sourceforge.jp> wrote:
> >
> > > +  renesas,icr-irlm:
> > > +    $ref: /schemas/types.yaml#/definitions/flag
> > > +    description: If true four independent interrupt requests mode (I=
CR.IRLM is 1).
> > > +
> > > +  renesas,ipr-map:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > > +    description: |
> > > +      IRQ to IPR mapping definition.
> > > +      1st - INTEVT code
> > > +      2nd - Register
> > > +      3rd - bit index
> >
> > (...)
> >
> > > +            renesas,ipr-map =3D <0x240 IPRD IPR_B12>, /* IRL0 */
> > > +                              <0x2a0 IPRD IPR_B8>,  /* IRL1 */
> > > +                              <0x300 IPRD IPR_B4>,  /* IRL2 */
> > > +                              <0x360 IPRD IPR_B0>,  /* IRL3 */
> > (...)
> >
> > Is it really necessary to have all this in the device tree?
> >
> > You know from the compatible that this is "renesas,sh7751-intc"
> > and I bet this table will be the same for any sh7751 right?
> >
> > Then just put it in a table in the driver instead and skip this from
> > the device tree and bindings. If more interrupt controllers need
> > to be supported by the driver, you can simply look up the table from
> > the compatible string.
>
> The SH interrupt controller has the same structure, only this part is dif=
ferent for each SoC.
> Currently, we are targeting only the 7751, but in the future we plan to h=
andle all SoCs.
> Is it better to differentiate SoC only by compatible?

Yes, it is better to differentiate SoC only by compatible value.

When you describe all differences explicitly using properties, you
might discover later that you missed something important, causing
backwards compatibility issues with old DTBs.
DT is a stable ABI, while you can always update a driver when needed.

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
