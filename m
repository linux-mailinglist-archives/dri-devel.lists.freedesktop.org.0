Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB950898C8F
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 18:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E9C113312;
	Thu,  4 Apr 2024 16:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WQ7het0d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2456C11331B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 16:49:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A3C15CE335E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 16:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726F8C4166A
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 16:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712249347;
 bh=f0ZUc9cVkTYbWSm7SlkoyeQqtebVeW+MGfGHY9LAnds=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WQ7het0dgu5SJenA0Mu+HXt1GOsJL085hoWrWFb6WeZ3XwGEB8c4psO4VOinMHZVl
 rc8/WeKpEWNXOCh3Uy2yRne6v6pmIrjaAaJn+UPeXuyyCqPwoeym0nN7G2EYuCWTTV
 OE3b4FxDdRDnmFqeLgLPAkOsqdsWPkAgU2w2CYbDHq0EOd8GHDjD41B3nBmjiZQQ3z
 ipryVGdaQbH4buXI1M+AGRkTiGjIx1X7jWM341iOAmC3qBN+9+XJKjvf7oBSvyAbFS
 z+WFSOuvBf1Aryd+PGCZehP04gqzI3daZJoHqHDxFvc3m274FGnMx5rGoWluHqmYgl
 0qMQG3AwYlYZQ==
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-2d82713f473so22083221fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 09:49:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUqAUtzXlWI86Y+2Hl51KF7IBlEWeG/CMiu1CQXAOyI0JtUEXQZCjOBzwhak5l1KBk/eolcBVLM/6/MLkR47d1OQ9gOB0BSUh9tWS2fdJMv
X-Gm-Message-State: AOJu0YyFmLjTPmsXyXs2j78prtJMug+HGfH9yE/hO4OKzKIo1h7QQEDr
 gAuQ39Yswwu3Uoos6k29eS3Q+iogmF10+R2uWRHPQ96Q/Gbhj4M6bGjx4EIE01jcvkGCwNgKoST
 NVuklxb7tcKfQpgrcI2rSp0elQA==
X-Google-Smtp-Source: AGHT+IGA/B0Olc8HVdDCHlF8+fjMTjFHUiVbJhjDnxrx6ejO3lXuUhtHy5hp5vmBhc80/3eocgT9w6rQF0BvJQeGA5M=
X-Received: by 2002:a05:651c:1417:b0:2d3:8c1f:c0ff with SMTP id
 u23-20020a05651c141700b002d38c1fc0ffmr2449840lje.16.1712249325311; Thu, 04
 Apr 2024 09:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <a4ce7771faec761b9bbb91ff6694a99e5bc293b6.1712207606.git.ysato@users.sourceforge.jp>
In-Reply-To: <a4ce7771faec761b9bbb91ff6694a99e5bc293b6.1712207606.git.ysato@users.sourceforge.jp>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Apr 2024 11:48:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLG+v1ujhMM45dQcMXiQkCvjif3pAWZxgeAcKFMe9Sy9Q@mail.gmail.com>
Message-ID: <CAL_JsqLG+v1ujhMM45dQcMXiQkCvjif3pAWZxgeAcKFMe9Sy9Q@mail.gmail.com>
Subject: Re: [RESEND v7 06/37] sh: kernel/setup Update DT support.
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Thomas Gleixner <tglx@linutronix.de>, 
 Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx.de>, 
 Heiko Stuebner <heiko.stuebner@cherry.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sebastian Reichel <sre@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 David Rientjes <rientjes@google.com>, Hyeonggon Yoo <42.hyeyoo@gmail.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Baoquan He <bhe@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, 
 Javier Martinez Canillas <javierm@redhat.com>, Guo Ren <guoren@kernel.org>, 
 Azeem Shaikh <azeemshaikh38@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Jacky Huang <ychuang3@nuvoton.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
 Anup Patel <apatel@ventanamicro.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Sam Ravnborg <sam@ravnborg.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
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

On Thu, Apr 4, 2024 at 12:15=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
>
> Fix extrnal fdt initialize and bootargs.

What is the problem you are trying to solve?

And a typo.

>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  arch/sh/Kconfig             | 23 +++++++++++------------
>  arch/sh/include/asm/setup.h |  1 +
>  arch/sh/kernel/setup.c      | 36 +++++++++++++++++++++++-------------
>  3 files changed, 35 insertions(+), 25 deletions(-)
>
> diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
> index 6711cde0d973..242cf30e704d 100644
> --- a/arch/sh/Kconfig
> +++ b/arch/sh/Kconfig
> @@ -708,17 +708,22 @@ config ROMIMAGE_MMCIF
>           first part of the romImage which in turn loads the rest the ker=
nel
>           image to RAM using the MMCIF hardware block.
>
> +config CMDLINE
> +       string "Kernel command line arguments string"
> +       default "console=3DttySC1,115200"
> +
>  choice
>         prompt "Kernel command line"
> -       optional
> -       default CMDLINE_OVERWRITE
> -       depends on !OF || USE_BUILTIN_DTB
> +       default CMDLINE_BOOTLOADER
> +
> +config CMDLINE_BOOTLOADER
> +       bool "Use bootloader kernel arguments"

This should be the preferred, normal, default way. So why is it a user
visible option?

>         help
> -         Setting this option allows the kernel command line arguments
> -         to be set.
> +         Uses the command-line options passed by the boot loader.
> +         If boot loader dosen't provide kernel argments, Use built-in ar=
gments.

typos

bootloader in some spots, "boot loader" in others. Go with the former.

>
>  config CMDLINE_OVERWRITE
> -       bool "Overwrite bootloader kernel arguments"
> +       bool "Overwrite built-in kernel arguments"

The original made more sense to me. The default should be to use
bootloader args. Any built-in kernel command line should be prepend,
append (extend), or overwrite/replace.

Rob
