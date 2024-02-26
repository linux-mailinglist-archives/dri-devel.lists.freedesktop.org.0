Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36F0867BAB
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 17:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABCBE10E1C0;
	Mon, 26 Feb 2024 16:21:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com
 [209.85.160.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6014610E1C0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 16:21:50 +0000 (UTC)
Received: by mail-oa1-f53.google.com with SMTP id
 586e51a60fabf-218642337c9so1730574fac.3
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 08:21:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708964507; x=1709569307;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AnNfNm5GP8AlHR3LpO3OZDALnBwQPt1VpdE5YdvyhHU=;
 b=bb1zkeLxmy3H4P1G2i95aG0vLmQ4FTR1PwCrhTcZwjw0Vb9PTtZDrpmsDeplruyfZj
 86b5r3ABR3QXOO7SFNpca90DmnBpMsxLtu16aWR8HLHwb5hA/I8Ag8WgiDkM2bKBR6YO
 B9jcZgkA5LlTAOX1JdJzotEKBFJRFdj4LWKpM5T41U3wrF/48cXaC6ABfijK7VvH10Cj
 4L+cfw7y1a7MYgT7R0+BTczRBEOIVebzyyIaZNrvgwofpvH6fiYLrfYymEA2PNNas4V4
 gICPC3G0GwK2+fsIfQvgCBzMrBkYxGAz3LiRyY/K+semFpiYkyx0rEf0g607Dp+aSbWg
 SBFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZR9j5BPQEzZaSa1tbHzNaYMP8kuBvFtaJuijvRgOq6ty8X6FMDantlHyYKJJcZxCgl2D56eBFotV7pFpJznS/QSWJZj7wzy+v+xoKauKb
X-Gm-Message-State: AOJu0YxpOkjxq0vAaTnDVFGkLr53XW+l7cswZHu3HTckqciBikulIDZQ
 CPYSJFBFqUG2KPl6l/UEGZYboWvb/I1pGfgiPpDdw4LsZkwHXIPJLj91NVl1V/U=
X-Google-Smtp-Source: AGHT+IHUE5Q9Ag8FZbtz6pFZ1o2kLOLe/oYr/ne+IUGwNMrFp9RO5m+7EjpuOffYyt6aD0CnaD/taw==
X-Received: by 2002:a05:6870:3a0e:b0:21e:6d41:3a86 with SMTP id
 du14-20020a0568703a0e00b0021e6d413a86mr7214593oab.59.1708964507269; 
 Mon, 26 Feb 2024 08:21:47 -0800 (PST)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com.
 [209.85.167.181]) by smtp.gmail.com with ESMTPSA id
 lu5-20020a056871430500b0021f3c2ebc42sm1593139oab.45.2024.02.26.08.21.46
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:21:46 -0800 (PST)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3bba50cd318so2440381b6e.0
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 08:21:46 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUqidrQceBTR3m4hQm5J/HPoVFEjSQgr735Q+hM+NIVLjP+A/XqgP09bBjSSNoTWS8ih8GYRj/L9t3dKhDBvMkRkzSxtZlw3LoLZeIFK0ci
X-Received: by 2002:a25:360b:0:b0:dcc:35ca:aac4 with SMTP id
 d11-20020a25360b000000b00dcc35caaac4mr5201494yba.51.1708964485283; Mon, 26
 Feb 2024 08:21:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <e5d965a1ba1447466c4a70c95b1e3aa8c1aebe4b.1704788539.git.ysato@users.sourceforge.jp>
In-Reply-To: <e5d965a1ba1447466c4a70c95b1e3aa8c1aebe4b.1704788539.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2024 17:21:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVyz4mbExe8ZzPkVxEujYBhCBBrh88n8D6ykcZyy3=SEA@mail.gmail.com>
Message-ID: <CAMuHMdVyz4mbExe8ZzPkVxEujYBhCBBrh88n8D6ykcZyy3=SEA@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 02/37] sh: Kconfig unified OF supported targets.
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

On Tue, Jan 9, 2024 at 9:23=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Targets that support OF should be treated as one board.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Thanks for your patch!

> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -710,6 +710,7 @@ choice
>         prompt "Kernel command line"
>         optional
>         default CMDLINE_OVERWRITE
> +       depends on !OF || USE_BUILTIN_DTB

This is still useful in the generic OF case.

I think it would be good to model this similar to what arm/arm64/riscv
are using (from bootloader / extend / force).

>         help
>           Setting this option allows the kernel command line arguments
>           to be set.
> diff --git a/arch/sh/boards/Kconfig b/arch/sh/boards/Kconfig
> index 109bec4dad94..e7e52779ef62 100644
> --- a/arch/sh/boards/Kconfig
> +++ b/arch/sh/boards/Kconfig
> @@ -19,16 +19,9 @@ config SH_DEVICE_TREE
>         select TIMER_OF
>         select COMMON_CLK
>         select GENERIC_CALIBRATE_DELAY
> -
> -config SH_JCORE_SOC
> -       bool "J-Core SoC"
> -       select SH_DEVICE_TREE
> -       select CLKSRC_JCORE_PIT
> -       select JCORE_AIC
> -       depends on CPU_J2
> -       help
> -         Select this option to include drivers core components of the
> -         J-Core SoC, including interrupt controllers and timers.
> +       select GENERIC_IRQ_CHIP
> +       select SYS_SUPPORTS_PCI
> +       select GENERIC_PCI_IOMAP if PCI
>
>  config SH_SOLUTION_ENGINE
>         bool "SolutionEngine"
> @@ -293,6 +286,7 @@ config SH_LANDISK
>         bool "LANDISK"
>         depends on CPU_SUBTYPE_SH7751R
>         select HAVE_PCI
> +       select SYS_SUPPORTS_PCI
>         help
>           I-O DATA DEVICE, INC. "LANDISK Series" support.
>
> @@ -369,6 +363,16 @@ config SH_APSH4AD0A
>         help
>           Select AP-SH4AD-0A if configuring for an ALPHAPROJECT AP-SH4AD-=
0A.
>
> +config SH_OF_BOARD
> +       bool "General Open Firmware boards"
> +       select SH_DEVICE_TREE
> +       select CLKSRC_JCORE_PIT if CPU_J2
> +       select JCORE_AIC if CPU_J2

Please move these selects to CPU_J2 instead...

> +       select HAVE_PCI if CPU_SUBTYPE_SH7751R

... and this to CPU_SUBTYPE_SH7751R, else it will become
a long unmaintainable list soon...

> +       help
> +         This board means general OF supported targets.
> +
> +

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
