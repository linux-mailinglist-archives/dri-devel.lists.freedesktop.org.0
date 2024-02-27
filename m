Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0486869AB4
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 16:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C59C10E92D;
	Tue, 27 Feb 2024 15:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FD3510E942
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 15:42:28 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dbed0710c74so3987668276.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 07:42:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709048546; x=1709653346;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PepN+vzOJ7FGNHjryvCGPsAuXBvDik+gwGMOhn9mKt8=;
 b=O9e6iNmK2yYy+7YcBhK0rHbSFHKf7WD5eyQj4mhKzjl+uh8CRBg3tZz+CnSMeQa9AA
 iFKtNV7uRaodp+e4bjs1wqzrLz9XQ7vToDCqQFZlqBy57NNumhpi/LvvfwzyQL33Nk8N
 dwy4ldHR3NtnpDX9MEly58OsaTz08HJhgo95JX1zER4qoX8SU+Aaw/bl/j400tXb8N3O
 +G4MrcuOh4u42Ruh6jqcQWOHyscgGfBGPNKfZB8jeRdxQnGfcqPVk8/t7hHukH9tS9PJ
 AOxfXq4RaOyC85V+5QVx3CzenQtZkJNcUV90O0LAvBkvi6/0ToJ3vCq9/XhGOEKL6JJD
 P40Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlUH861EqnisF1Y5Go2zF5VJhOdkI0t/9M/u1K1bObhuHX/ne/QkI2q2H/NyYxX98d3qanPKk8P3yFIiZ1ffjZAgPA0WrFma/BjpXoJcER
X-Gm-Message-State: AOJu0YwYxqd6fsD9EksoppXuPJG4CQxnTDLuMu9Fo8fg+yt4jEIo2xrF
 VdTLQC5onKrO0lU30U82mhz7LKkPf2st65BZv2Z7zbn9dcmhv++sdinxb/2TQr4=
X-Google-Smtp-Source: AGHT+IHYromnFQ6iPEZHEcLUs0mKCLA6n+4DUA7cGGzXzneJnCZNSa7LuowU/fJcdAY6YGjgHNNBdQ==
X-Received: by 2002:a25:e904:0:b0:dcc:96db:fc0d with SMTP id
 n4-20020a25e904000000b00dcc96dbfc0dmr1916043ybd.25.1709048546420; 
 Tue, 27 Feb 2024 07:42:26 -0800 (PST)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com.
 [209.85.219.174]) by smtp.gmail.com with ESMTPSA id
 t13-20020a25aa8d000000b00dcc620f4139sm1522450ybi.14.2024.02.27.07.42.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Feb 2024 07:42:26 -0800 (PST)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dcc80d6006aso4503430276.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 07:42:26 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVxGsq2VAELgKNf6xxyFDl1ItuiFNjNwszeNZ42Owlo/jV+xrkweNnNUL/CSvVXuhK+C5kGqYe5RldDrZ/8rp+ExDdNXzzKmbQ+pyb++PaP
X-Received: by 2002:a05:6902:2412:b0:dc7:4cb1:6817 with SMTP id
 dr18-20020a056902241200b00dc74cb16817mr2901377ybb.22.1709048525820; Tue, 27
 Feb 2024 07:42:05 -0800 (PST)
MIME-Version: 1.0
References: <cover.1704788539.git.ysato@users.sourceforge.jp>
 <222dd134b5e1c8cc5baa7afc64a3441a8174e979.1704788539.git.ysato@users.sourceforge.jp>
In-Reply-To: <222dd134b5e1c8cc5baa7afc64a3441a8174e979.1704788539.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Feb 2024 16:41:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxWrrKT8H_47EPjZ61QnEvvtrZYXFo=FmozhVeYf=4Bw@mail.gmail.com>
Message-ID: <CAMuHMdVxWrrKT8H_47EPjZ61QnEvvtrZYXFo=FmozhVeYf=4Bw@mail.gmail.com>
Subject: Re: [DO NOT MERGE v6 14/37] clk: Compatible with narrow registers
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
> divider and gate only support 32-bit registers.
> Older hardware uses narrower registers, so I want to be able to handle
> 8-bit and 16-bit wide registers.
>
> Seven clk_divider flags are used, and if I add flags for 8bit access and
> 16bit access, 8bit will not be enough, so I expanded it to u16.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Thanks for your patch!

> --- a/drivers/clk/clk-gate.c
> +++ b/drivers/clk/clk-gate.c
> @@ -143,6 +161,18 @@ struct clk_hw *__clk_hw_register_gate(struct device =
*dev,
>                         return ERR_PTR(-EINVAL);
>                 }

Please add a check for invalid CLK_GATE_HIWORD_MASK
and register width combinations:

                if (clk_gate_flags & (CLK_GATE_REG_16BIT | CLK_GATE_REG_8BI=
T)) {
                        pr_err("HIWORD_MASK needs 32-bit registers\n");
                        return ERR_PTR(-EINVAL);
                }

>         }
> +       if (clk_gate_flags & CLK_GATE_REG_16BIT) {
> +               if (bit_idx > 15) {
> +                       pr_err("gate bit exceeds 16 bits\n");
> +                       return ERR_PTR(-EINVAL);
> +               }
> +       }
> +       if (clk_gate_flags & CLK_GATE_REG_8BIT) {
> +               if (bit_idx > 7) {
> +                       pr_err("gate bit exceeds 8 bits\n");
> +                       return ERR_PTR(-EINVAL);
> +               }
> +       }
>
>         /* allocate the gate */
>         gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index ace3a4ce2fc9..e2dfc1f083f4 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -508,12 +508,16 @@ void of_fixed_clk_setup(struct device_node *np);
>   * CLK_GATE_BIG_ENDIAN - by default little endian register accesses are =
used for
>   *     the gate register.  Setting this flag makes the register accesses=
 big
>   *     endian.
> + * CLK_GATE_REG_8BIT - by default 32bit register accesses are used for
> + *     the gate register.  Setting this flag makes the register accesses=
 8bit.
> + * CLK_GATE_REG_16BIT - by default 32bit register accesses are used for
> + *     the gate register.  Setting this flag makes the register accesses=
 16bit.
>   */
>  struct clk_gate {
>         struct clk_hw hw;
>         void __iomem    *reg;
>         u8              bit_idx;
> -       u8              flags;
> +       u32             flags;

There is no need to increase the size of the flags field for the gate clock=
.

>         spinlock_t      *lock;
>  };
>
> @@ -522,6 +526,8 @@ struct clk_gate {
>  #define CLK_GATE_SET_TO_DISABLE                BIT(0)
>  #define CLK_GATE_HIWORD_MASK           BIT(1)
>  #define CLK_GATE_BIG_ENDIAN            BIT(2)
> +#define CLK_GATE_REG_8BIT              BIT(3)
> +#define CLK_GATE_REG_16BIT             BIT(4)
>
>  extern const struct clk_ops clk_gate_ops;
>  struct clk_hw *__clk_hw_register_gate(struct device *dev,

The rest LGTM.

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
