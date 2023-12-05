Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DD380561B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 14:35:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F04AE10E52E;
	Tue,  5 Dec 2023 13:35:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54CE10E52E
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 13:35:21 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1d069b1d127so19485455ad.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 05:35:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701783321; x=1702388121;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRBQrJMVxE74uMXuNQQqL8IIVVzyGsSzO2s+5zIiPV0=;
 b=SlX97n/KbgmpghTygCMR/k/RWXizmo+XLkwrhVtKKnJJtufFm59A4ZeEWPvK5ZpCjR
 nPzbDuycpyEXTsGYBa8njfnTPbmHxPGlgfztcvNsd/nDBMpi85ksNPohrkcIuShXmotX
 iFj/xo92xCdmZ875SOvIAfLRNPZ1psoEt0c6FgGCPBPiZvc+RqFYg4rqXr+daj+BV3rQ
 HOL+Vms5+Qtz1S/qli+aZ7lqp4DDJjy0BcMSP+E3FFYiLUdDjg5y97qTV5pQvVxdtya4
 +O9F/xEjX2bjkQqMNHgdnsciH8DXmg8yPONWx4bjs9bfR5WUVggQnoM8lxmUej4XyJZx
 vWnQ==
X-Gm-Message-State: AOJu0YyfCj8L/n55KnL1NGYeLWry1olaIKCb4fuU/JlsO/mLMlv92zCL
 I7rsfQUzOS5ha5zAPJ6kHpdBxYPPbX0haQ==
X-Google-Smtp-Source: AGHT+IF10zs0TCVPOgo4Vj7PAHlKM62jBrz6KtOPJCZtimoi1T03iXRleK9Xcg8ht1XScqrRnqCMcw==
X-Received: by 2002:a17:902:c651:b0:1d0:6638:b9f2 with SMTP id
 s17-20020a170902c65100b001d06638b9f2mr3708410pls.54.1701783321059; 
 Tue, 05 Dec 2023 05:35:21 -0800 (PST)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com.
 [209.85.210.170]) by smtp.gmail.com with ESMTPSA id
 t15-20020a17090a024f00b00285621515e9sm10599427pje.15.2023.12.05.05.35.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 05:35:18 -0800 (PST)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-6ce46b78c1bso1573239b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Dec 2023 05:35:17 -0800 (PST)
X-Received: by 2002:a25:cc01:0:b0:db7:dacf:ed92 with SMTP id
 l1-20020a25cc01000000b00db7dacfed92mr4614162ybf.115.1701783296324; Tue, 05
 Dec 2023 05:34:56 -0800 (PST)
MIME-Version: 1.0
References: <cover.1701768028.git.ysato@users.sourceforge.jp>
 <602e1ba4f02489fcbc47e8f9904f3c1db1c9f14a.1701768028.git.ysato@users.sourceforge.jp>
 <2ef81211-9525-4f96-a6b2-3fcfbed0c6e5@app.fastmail.com>
In-Reply-To: <2ef81211-9525-4f96-a6b2-3fcfbed0c6e5@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 5 Dec 2023 14:34:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVPO13i8n=QZDnbds1=iMPtfZDcvmFZdst3r+Xf+82U_w@mail.gmail.com>
Message-ID: <CAMuHMdVPO13i8n=QZDnbds1=iMPtfZDcvmFZdst3r+Xf+82U_w@mail.gmail.com>
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
 Herve Codina <herve.codina@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-sh@vger.kernel.org, Bin Meng <bmeng@tinylab.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-pci@vger.kernel.org,
 Jacky Huang <ychuang3@nuvoton.com>, Palmer Dabbelt <palmer@rivosinc.com>,
 Max Filippov <jcmvbkbc@gmail.com>, guoren <guoren@kernel.org>,
 Lee Jones <lee@kernel.org>,
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
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org, Chris Morgan <macromorgan@hotmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Baoquan He <bhe@redhat.com>, linux-ide@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 linux-kernel@vger.kernel.org, Azeem Shaikh <azeemshaikh38@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Tom Rix <trix@redhat.com>,
 Damien Le Moal <dlemoal@kernel.org>,
 Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>,
 Andrew Morton <akpm@linux-foundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd,

On Tue, Dec 5, 2023 at 2:26=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote:
> On Tue, Dec 5, 2023, at 10:45, Yoshinori Sato wrote:
> > +     bscres =3D platform_get_resource(pdev, IORESOURCE_MEM, 1);
> > +     bsc =3D devm_ioremap_resource(&pdev->dev, bscres);
> > +     if (IS_ERR(bsc))
> > +             return PTR_ERR(bsc);
> > +
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

I was just going to give that comment on the bindings patch ;-)

> > --- /dev/null
> > +++ b/drivers/pci/controller/pci-sh7751.h
> > @@ -0,0 +1,76 @@
>
> If the header is only included from one file, just removed
> it and add the register definitions to the driver directly.

$ git grep pci-sh7751.h
arch/sh/drivers/pci/pci-sh4.h:#include "pci-sh7751.h"
drivers/pci/controller/pci-sh7751.c:#include "pci-sh7751.h"

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
