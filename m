Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F95389DB5D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 15:57:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030B210FD4D;
	Tue,  9 Apr 2024 13:57:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D32A710FD4D
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 13:56:58 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id
 d75a77b69052e-4347dadc2cfso16693301cf.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 06:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712671017; x=1713275817;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2HZbjvWyXpSYd1puM+93tZG9TcNwqCrELS7hscC5PVY=;
 b=nU+UNqpZIzt8ZdJva4twDlOrswGRlSo2B/T+kw84GetBpu6Z2OQbNutT4xUHNzmOg9
 MWuJHSyaUElPuMbAmpOMrXyD2rfeee9nPgx66V510Pz6SzHd4kUF5m9PIKJogIYJIuLq
 hfbXY6sX7qk0sjp2GWLqpAdBBR302tNOf/WbClPhJQxSFyuhwyxO5kTWSv5mJuOK2fDP
 GfB0b0oUWsOJ9+Lp9I2byAQmQuQ3LyNQLBgLxfcysqaiKpV/C1mjuqyXYV1wQGMyR4NV
 AW/pejARzXVRgXAp6UaModGCYWcl+C3F0oEmeEntJm0EGFtc/64XqncsmZV5i5QIWhyr
 bF6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ+HzYnmVQ5LExtTfxax57w7R38htYqiznQEH03Nsgjc2ryak0x6CYRzoxOUKUV9f5BNyfkthooyk+7BEvIp8mG2iXkFfvp4iknTJcQ0qA
X-Gm-Message-State: AOJu0YzIm3bRxYm4AEoju2k5iVSAfPxGppmdkt5j3QSe7sfNRYAyGoNS
 HByKdOnzzqbbI1MRX80fbbV/wB1gMc52+nOvgPavUvPKboZh5YhCJ5JejZKHyVQ=
X-Google-Smtp-Source: AGHT+IFSLzB2HTmDIeTTFIqSty42KpVkwad+N29pNX3zCe8rpxjMDCRVeK+d3B2CRkUKfypUWjQY4w==
X-Received: by 2002:ac8:574f:0:b0:432:f709:b4f1 with SMTP id
 15-20020ac8574f000000b00432f709b4f1mr11928348qtx.63.1712671016524; 
 Tue, 09 Apr 2024 06:56:56 -0700 (PDT)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com.
 [209.85.222.181]) by smtp.gmail.com with ESMTPSA id
 q13-20020ac8450d000000b004318358451fsm3350525qtn.75.2024.04.09.06.56.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Apr 2024 06:56:55 -0700 (PDT)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-78a26aaefc8so309472885a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Apr 2024 06:56:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVjDj0hkhoHW9kN5zKiPwxw3kaPsWNA9JS3+/V9xhgbzeIaNPRj3HipOeklxrjAUxmXLyVsyMRrTSxMVKqS9gisw+1H+AnYGaWf+UXOhKLy
X-Received: by 2002:a5b:40c:0:b0:dc6:b779:7887 with SMTP id
 m12-20020a5b040c000000b00dc6b7797887mr8362504ybp.20.1712670994533; Tue, 09
 Apr 2024 06:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <4a9b59733c7a8e7d042f3987ca6bf601eea5b30d.1712207606.git.ysato@users.sourceforge.jp>
In-Reply-To: <4a9b59733c7a8e7d042f3987ca6bf601eea5b30d.1712207606.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Apr 2024 15:56:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVEj-TEV5iYjknTKOJ0_MBO8sMzc6-7NSAL-XoxLGn9g@mail.gmail.com>
Message-ID: <CAMuHMdUVEj-TEV5iYjknTKOJ0_MBO8sMzc6-7NSAL-XoxLGn9g@mail.gmail.com>
Subject: Re: [RESEND v7 08/37] clocksource: sh_tmu: CLOCKSOURCE support.
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
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

Hi Sato-san,

On Thu, Apr 4, 2024 at 7:15=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Allows initialization as CLOCKSOURCE.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Thanks for your patch!

> --- a/drivers/clocksource/sh_tmu.c
> +++ b/drivers/clocksource/sh_tmu.c

> @@ -495,7 +514,12 @@ static int sh_tmu_map_memory(struct sh_tmu_device *t=
mu)
>
>  static int sh_tmu_parse_dt(struct sh_tmu_device *tmu)
>  {
> -       struct device_node *np =3D tmu->pdev->dev.of_node;
> +       struct device_node *np;

Technically, np might be used uninitialized.

> +
> +       if (tmu->pdev)
> +               np =3D tmu->pdev->dev.of_node;

If you would set up tmu->np in sh_tmu_setup_pdev()...

> +       if (tmu->np)
> +               np =3D tmu->np;

... you could just assign np =3D tmu->np unconditionally.

>
>         tmu->model =3D SH_TMU;
>         tmu->num_channels =3D 3;

> @@ -665,6 +734,7 @@ static void __exit sh_tmu_exit(void)
>         platform_driver_unregister(&sh_tmu_device_driver);
>  }
>
> +TIMER_OF_DECLARE(sh_tmu, "renesas,tmu", sh_tmu_of_register);

As there are now two entry points, the device is actually probed twice:
once from TIMER_OF_DECLARE/sh_tmu_of_register(), and a second
time from platform_driver/sh_tmu_probe().

E.g. on Armadillo-800-EVA with R-Mobile A1 (booting Linux on ARM
(not SH), and using TMU as the main clock source):

    timer@fff80000 ch0: used for clock events
    timer@fff80000 ch0: used for periodic clock events
    timer@fff80000 ch1: used as clock source
    clocksource: timer@fff80000: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 154445288668 ns
    ...
    fff80000.timer ch0: used for clock events
    genirq: Flags mismatch irq 16. 00015a04 (fff80000.timer) vs.
00015a04 (timer@fff80000)
    fff80000.timer ch0: failed to request irq 16
    fff80000.timer ch1: used as clock source
    clocksource: fff80000.timer: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 154445288668 ns

After this, the timer seems to be stuck, and the boot is blocked.

On Marzen with R-Car H1 (booting Linux on ARM (not SH), and using
arm_global_timer as the main clock source), I also see the double
timer probe, but no such lock-up.  I expect you to see the double
timer probe on SH775x, too?

The double probe can be fixed by adding a call to
of_node_set_flag(np, OF_POPULATED) at the end of sh_tmu_of_register()
in case of success, cfr. [1].

I haven't found the cause of the stuck timer on R-Mobile A1 yet;
both the TMU clock and the A4R power domain seem to be activated...

>  #ifdef CONFIG_SUPERH
>  sh_early_platform_init("earlytimer", &sh_tmu_device_driver);
>  #endif

[1] "[PATCH] clocksource/drivers/renesas-ostm: Avoid reprobe after
successful early probe"
    https://lore.kernel.org/all/bd027379713cbaafa21ffe9e848ebb7f475ca0e7.17=
10930542.git.geert+renesas@glider.be/

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
