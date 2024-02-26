Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF9C867CE4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 17:55:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED61410E37B;
	Mon, 26 Feb 2024 16:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B050C10E7DD
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 16:55:22 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id
 a1e0cc1a2514c-7d6024b181bso1522240241.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 08:55:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708966519; x=1709571319;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=W+9BchcdAdA5Rmse93Wm2Y92LoxElKC7hpYEsTuUwfs=;
 b=qwBExcx5gVcDUB6GmNXL59O5YrgkH8JNy/XMAluS7Lkaa72C2f3a1GPnJRn095FHVy
 w9NSGZDwVCgZxR39gE+cnFy3kSh62N3w0+OSk1qOAeVFKaQkbWWhI2cjc7WqGNoKWhaU
 Ey58YZ5/9x83lcXySvg7TV8ffbH9tYoc1IKQrqLAFiVoZkxxdw70+u+yWKnQgjNdWPUe
 0J9xmi2dDnAsjdZcLjVHwpZzJMw+gyKml+KsR8qRzdXIkzrymwrC8ObLLnWjAeixRHr5
 8KVcofL5FPGpCmh9cD1f39vW5OQ15G6RNdMPNwOt6mEvJ4orgrDzGtCZh5rwLh7c8D8t
 iryA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXa/4JHYpAubPIckiyGRGvevaHMKlw0wmym7jZyIPJZjfN4xX8sQ8IBzENd3JZ8Lsrv8I+QHTP10YsxfmahFn2PuR8MrWHDmdteqA1HcWV
X-Gm-Message-State: AOJu0YyFlGVUuW7k7N8Z43OZQ+lXwA6+6GII40Od43KnXa1ai4tyk+FZ
 sCheMiINqiqJckL3KT92vecfxPaiiQ5+pcMAWifjCgSr2eRzSOImsYfZqMLVRSM=
X-Google-Smtp-Source: AGHT+IGyNYq8qFFO5ENXMdmGOIWlt8CkzK74qYDLeOpWR8kGmEWzKsS5IIPQdyR6eJ3V4yQy4YRY7g==
X-Received: by 2002:a67:cd09:0:b0:470:510d:742f with SMTP id
 u9-20020a67cd09000000b00470510d742fmr3460875vsl.35.1708966518264; 
 Mon, 26 Feb 2024 08:55:18 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com.
 [209.85.222.181]) by smtp.gmail.com with ESMTPSA id
 j24-20020ac85518000000b0042e64081af8sm2636450qtq.35.2024.02.26.08.55.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Feb 2024 08:55:17 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-787d737a7abso29901285a.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 08:55:17 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXf3JBru5w8MTTAUvTO3rLb/vEGYun3gUF3tu6dRK3HDRzQqxKC4DK82+4i2BbmjzmukC0SXTCuAOzLnIrC/j590LDp48XixyiYMeXwF7iu
X-Received: by 2002:a25:9346:0:b0:dcd:98bd:7cc8 with SMTP id
 g6-20020a259346000000b00dcd98bd7cc8mr5030611ybo.48.1708966495877; Mon, 26 Feb
 2024 08:54:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <f7a504fc42486f4f3f75ca7ac8cd57c084407da0.1704788539.git.ysato@users.sourceforge.jp>
In-Reply-To: <f7a504fc42486f4f3f75ca7ac8cd57c084407da0.1704788539.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Feb 2024 17:54:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXOaasX9Dv-Kv=VOO0dhnp8ObQC6-YqsFZT0Q-VeqPg+Q@mail.gmail.com>
Message-ID: <CAMuHMdXOaasX9Dv-Kv=VOO0dhnp8ObQC6-YqsFZT0Q-VeqPg+Q@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 08/37] clocksource: sh_tmu: CLOCKSOURCE support.
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

Hi Saton-san,

Thanks for your patch!

Please drop the period at the end of the one-line summary.

On Tue, Jan 9, 2024 at 9:23=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> Allows initialization as CLOCKSOURCE.

Please explain why this is needed. E.g.

    Add support for early registration using TIMER_OF_DECLARE(),
    so the timer can be used as a clocksource on SoCs that do not
    have any other suitable timer.

>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

> --- a/drivers/clocksource/sh_tmu.c
> +++ b/drivers/clocksource/sh_tmu.c

> @@ -148,8 +151,8 @@ static int __sh_tmu_enable(struct sh_tmu_channel *ch)
>         /* enable clock */
>         ret =3D clk_enable(ch->tmu->clk);
>         if (ret) {
> -               dev_err(&ch->tmu->pdev->dev, "ch%u: cannot enable clock\n=
",
> -                       ch->index);
> +               pr_err("%s ch%u: cannot enable clock\n",
> +                      ch->tmu->name, ch->index);

Please wrap the line after, not before, "ch->tmu->name,".

>                 return ret;
>         }
>

> @@ -324,14 +332,14 @@ static int sh_tmu_register_clocksource(struct sh_tm=
u_channel *ch,
>         cs->mask =3D CLOCKSOURCE_MASK(32);
>         cs->flags =3D CLOCK_SOURCE_IS_CONTINUOUS;
>
> -       dev_info(&ch->tmu->pdev->dev, "ch%u: used as clock source\n",
> -                ch->index);
> +       pr_info("%s ch%u: used as clock source\n",
> +               ch->tmu->name, ch->index);

No need to wrap this line at all.

>
>         clocksource_register_hz(cs, ch->tmu->rate);
>         return 0;
>  }
>
> -static struct sh_tmu_channel *ced_to_sh_tmu(struct clock_event_device *c=
ed)
> +static inline struct sh_tmu_channel *ced_to_sh_tmu(struct clock_event_de=
vice *ced)
>  {
>         return container_of(ced, struct sh_tmu_channel, ced);
>  }
> @@ -364,8 +372,8 @@ static int sh_tmu_clock_event_set_state(struct clock_=
event_device *ced,
>         if (clockevent_state_oneshot(ced) || clockevent_state_periodic(ce=
d))
>                 sh_tmu_disable(ch);
>
> -       dev_info(&ch->tmu->pdev->dev, "ch%u: used for %s clock events\n",
> -                ch->index, periodic ? "periodic" : "oneshot");
> +       pr_info("%s ch%u: used for %s clock events\n",
> +               ch->tmu->name, ch->index, periodic ? "periodic" : "onesho=
t");

Please wrap the line after, not before, "ch->tmu->name,".

>         sh_tmu_clock_event_start(ch, periodic);
>         return 0;
>  }
> @@ -403,7 +411,8 @@ static void sh_tmu_clock_event_resume(struct clock_ev=
ent_device *ced)
>  }
>
>  static void sh_tmu_register_clockevent(struct sh_tmu_channel *ch,
> -                                      const char *name)
> +                                      const char *name,
> +                                      struct device_node *np)

"np" is unused in this function, hence this change is unneeded.
(Hey, I already said that in my review of v3)

>  {
>         struct clock_event_device *ced =3D &ch->ced;
>         int ret;
> @@ -417,30 +426,32 @@ static void sh_tmu_register_clockevent(struct sh_tm=
u_channel *ch,
>         ced->set_state_shutdown =3D sh_tmu_clock_event_shutdown;
>         ced->set_state_periodic =3D sh_tmu_clock_event_set_periodic;
>         ced->set_state_oneshot =3D sh_tmu_clock_event_set_oneshot;
> -       ced->suspend =3D sh_tmu_clock_event_suspend;
> -       ced->resume =3D sh_tmu_clock_event_resume;
> -
> -       dev_info(&ch->tmu->pdev->dev, "ch%u: used for clock events\n",
> -                ch->index);
> +       if (ch->tmu->pdev) {
> +               ced->suspend =3D sh_tmu_clock_event_suspend;
> +               ced->resume =3D sh_tmu_clock_event_resume;
> +       }
> +       pr_info("%s ch%u: used for clock events\n",
> +               ch->tmu->name, ch->index);

No need to wrap this line at all.

>
>         clockevents_config_and_register(ced, ch->tmu->rate, 0x300, 0xffff=
ffff);
>
>         ret =3D request_irq(ch->irq, sh_tmu_interrupt,
>                           IRQF_TIMER | IRQF_IRQPOLL | IRQF_NOBALANCING,
> -                         dev_name(&ch->tmu->pdev->dev), ch);
> +                         ch->tmu->name, ch);
>         if (ret) {
> -               dev_err(&ch->tmu->pdev->dev, "ch%u: failed to request irq=
 %d\n",
> -                       ch->index, ch->irq);
> +               pr_err("%s ch%u: failed to request irq %d\n",
> +                      ch->tmu->name, ch->index, ch->irq);

Please wrap the line after, not before, "ch->tmu->name,".

>                 return;
>         }
>  }
>
>  static int sh_tmu_register(struct sh_tmu_channel *ch, const char *name,
> +                          struct device_node *np,

np is unneeded.

>                            bool clockevent, bool clocksource)
>  {
>         if (clockevent) {
>                 ch->tmu->has_clockevent =3D true;
> -               sh_tmu_register_clockevent(ch, name);
> +               sh_tmu_register_clockevent(ch, name, np);
>         } else if (clocksource) {
>                 ch->tmu->has_clocksource =3D true;
>                 sh_tmu_register_clocksource(ch, name);

> @@ -465,53 +477,59 @@ static int sh_tmu_channel_setup(struct sh_tmu_chann=
el *ch, unsigned int index,
>         else
>                 ch->base =3D tmu->mapbase + 8 + ch->index * 12;
>
> -       ch->irq =3D platform_get_irq(tmu->pdev, index);
> +       if (tmu->pdev)
> +               ch->irq =3D platform_get_irq(tmu->pdev, index);
> +       else
> +               ch->irq =3D of_irq_get(np, index);

You can use of_irq_get() unconditionally.

>         if (ch->irq < 0)
>                 return ch->irq;
>
>         ch->cs_enabled =3D false;
>         ch->enable_count =3D 0;
>
> -       return sh_tmu_register(ch, dev_name(&tmu->pdev->dev),
> +       return sh_tmu_register(ch, tmu->name, np,

No need to pass np.

>                                clockevent, clocksource);
>  }
>
> -static int sh_tmu_map_memory(struct sh_tmu_device *tmu)
> +static int sh_tmu_map_memory(struct sh_tmu_device *tmu, struct device_no=
de *np)
>  {
>         struct resource *res;
>
> -       res =3D platform_get_resource(tmu->pdev, IORESOURCE_MEM, 0);
> -       if (!res) {
> -               dev_err(&tmu->pdev->dev, "failed to get I/O memory\n");
> -               return -ENXIO;
> -       }
> +       if (tmu->pdev) {
> +               res =3D platform_get_resource(tmu->pdev, IORESOURCE_MEM, =
0);
> +               if (!res) {
> +                       pr_err("sh_tmu failed to get I/O memory\n");
> +                       return -ENXIO;
> +               }
> +
> +               tmu->mapbase =3D ioremap(res->start, resource_size(res));
> +       } else
> +               tmu->mapbase =3D of_iomap(np, 0);

You can use of_iomap() unconditionally.

>
> -       tmu->mapbase =3D ioremap(res->start, resource_size(res));
>         if (tmu->mapbase =3D=3D NULL)
>                 return -ENXIO;
>
>         return 0;
>  }
>
> -static int sh_tmu_parse_dt(struct sh_tmu_device *tmu)
> +static int sh_tmu_parse_dt(struct sh_tmu_device *tmu, struct device_node=
 *np)
>  {
> -       struct device_node *np =3D tmu->pdev->dev.of_node;
> -
>         tmu->model =3D SH_TMU;
>         tmu->num_channels =3D 3;
>
>         of_property_read_u32(np, "#renesas,channels", &tmu->num_channels)=
;
>
>         if (tmu->num_channels !=3D 2 && tmu->num_channels !=3D 3) {
> -               dev_err(&tmu->pdev->dev, "invalid number of channels %u\n=
",
> -                       tmu->num_channels);
> +               pr_err("%s: invalid number of channels %u\n",
> +                      tmu->name, tmu->num_channels);

Please wrap the line after, not before, "ch->tmu->name,".

>                 return -EINVAL;
>         }
>
>         return 0;
>  }
>
> -static int sh_tmu_setup(struct sh_tmu_device *tmu, struct platform_devic=
e *pdev)
> +static int sh_tmu_setup(struct sh_tmu_device *tmu,
> +                       struct platform_device *pdev, struct device_node =
*np)
>  {
>         unsigned int i;
>         int ret;

> @@ -531,14 +554,17 @@ static int sh_tmu_setup(struct sh_tmu_device *tmu, =
struct platform_device *pdev)
>                 tmu->model =3D id->driver_data;
>                 tmu->num_channels =3D hweight8(cfg->channels_mask);
>         } else {
> -               dev_err(&tmu->pdev->dev, "missing platform data\n");
> +               pr_err("%s missing platform data\n", tmu->name);
>                 return -ENXIO;
>         }
>
>         /* Get hold of clock. */
> -       tmu->clk =3D clk_get(&tmu->pdev->dev, "fck");
> +       if (pdev)
> +               tmu->clk =3D clk_get(&tmu->pdev->dev, "fck");
> +       else
> +               tmu->clk =3D of_clk_get(np, 0);

You can use of_clk_get() unconditionally.

>         if (IS_ERR(tmu->clk)) {
> -               dev_err(&tmu->pdev->dev, "cannot get clock\n");
> +               pr_err("%s: cannot get clock\n", tmu->name);
>                 return PTR_ERR(tmu->clk);
>         }
>

> @@ -665,12 +711,17 @@ static void __exit sh_tmu_exit(void)
>         platform_driver_unregister(&sh_tmu_device_driver);
>  }
>
> +subsys_initcall(sh_tmu_init);
> +module_exit(sh_tmu_exit);
> +#endif
> +
>  #ifdef CONFIG_SUPERH
> +#ifdef CONFIG_SH_DEVICE_TREE
> +TIMER_OF_DECLARE(sh_tmu, "renesas,tmu", sh_tmu_of_register);

Probably this TIMER_OF_DECLARE() should be done unconditionally,
like is done in drivers/clocksource/renesas-ostm.c.

I gave that a try on R-Mobile A1, which also has TMU, but it didn't
seem to work (timer not firing?). So I suspect there are some missing
clk_enable() calls.  In the case of the platform driver, these are
handled using pm_runtime_get_sync().

> +#else
>  sh_early_platform_init("earlytimer", &sh_tmu_device_driver);
>  #endif
> -
> -subsys_initcall(sh_tmu_init);
> -module_exit(sh_tmu_exit);
> +#endif
>
>  MODULE_AUTHOR("Magnus Damm");
>  MODULE_DESCRIPTION("SuperH TMU Timer Driver");

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
