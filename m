Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E8B899DBE
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 14:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5543113BDB;
	Fri,  5 Apr 2024 12:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com
 [209.85.221.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB732113BDF
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 12:57:31 +0000 (UTC)
Received: by mail-vk1-f180.google.com with SMTP id
 71dfb90a1353d-4daab3cf090so718888e0c.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 05:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712321849; x=1712926649;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IrYQalnHLpNlFPtXNRcvWmXwt3g+egtwV8d+Fjl7XAg=;
 b=T+u+4JbVvIV6Nu8APLuWu8eNPKGQyXRzib59c2f4SOdGaZBYS8RZ3AuH9oU2iXRTUf
 ePlgyAB8tTIPq3w83Z3VjD2VR7hqh2mJ0mpQ6anWrup72FtUGvRFFxn9zRaGTp/nuHLn
 o53KLzz33io/Vh2mB/YzfSLPcAY+V+pPaFxewsVm9PH0nWjBFIX/YIzo9Zej7Rs3fgh+
 QTv07FvmMQ99bfE6zdNVlLjYGFOYhU5Iz1ye8sNlSouv/+mSwYXtxIsA45uTvLf1itu7
 ZHYOqKMXuKpC02Z8NFkY8QTkWCgx1sHWDLIK0zRPIO3tZ0e3+Iillhjy8Ins1HyRczM0
 p9aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9K+LzNyVva88DCpGP29eADElSvy/ZpoSWnRcon576jQTpzEphM3rfrp8CSSvfx+IfBO/oTcKWvzOZm5KxURzE0uN15oRJ6OlitcbyZ38R
X-Gm-Message-State: AOJu0YyuYThVTiGJR9CoVeUikFh0tSe/8lCnBBVzFy0TnPXjnt6lsxvt
 WoLkwT+Td5RtgkzsUPaB/ppdcaSz+Dz6hmbxCbIq3RSzP6xuM7IAHjVG5dFDYtI=
X-Google-Smtp-Source: AGHT+IEedLL93/08rJ0d6GcXehqGgrDVz1ETyrcvOmCJZ9OVjFPBn/8bkZ1QaMtqPlbESmaSHHp+Qw==
X-Received: by 2002:a05:6122:200c:b0:4c8:df97:139d with SMTP id
 l12-20020a056122200c00b004c8df97139dmr1838826vkd.2.1712321849056; 
 Fri, 05 Apr 2024 05:57:29 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com.
 [209.85.217.41]) by smtp.gmail.com with ESMTPSA id
 m135-20020a1fee8d000000b004d40a723fe2sm215930vkh.39.2024.04.05.05.57.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Apr 2024 05:57:28 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id
 ada2fe7eead31-479d6c6f2c0so534537137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Apr 2024 05:57:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVXgpY2Juflm1V30iENBJogKLBk4S8PEpxFabrgcY2M3uKIanTJkAlQxyFms0iWY9iBJmrSOUIYzy9x+W0fau1ZIIdS9/UmMcgh6wqWvU/r
X-Received: by 2002:a05:6902:2b10:b0:dcd:b806:7446 with SMTP id
 fi16-20020a0569022b1000b00dcdb8067446mr1084419ybb.1.1712321827974; Fri, 05
 Apr 2024 05:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1712207606.git.ysato@users.sourceforge.jp>
 <9c1d56d37f5d3780d3c506ae680133b6bdaa5fdc.1712207606.git.ysato@users.sourceforge.jp>
In-Reply-To: <9c1d56d37f5d3780d3c506ae680133b6bdaa5fdc.1712207606.git.ysato@users.sourceforge.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Apr 2024 14:56:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXvPW+3-sY2XPQ2aMcTZkK9zoMnxWeZ+PRB+VRgGszdQ@mail.gmail.com>
Message-ID: <CAMuHMdVXvPW+3-sY2XPQ2aMcTZkK9zoMnxWeZ+PRB+VRgGszdQ@mail.gmail.com>
Subject: Re: [RESEND v7 14/37] clk: Compatible with narrow registers
To: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: linux-sh@vger.kernel.org, Damien Le Moal <dlemoal@kernel.org>, 
 Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
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

Hi Sato-san,

On Thu, Apr 4, 2024 at 7:15=E2=80=AFAM Yoshinori Sato
<ysato@users.sourceforge.jp> wrote:
> divider and gate only support 32-bit registers.
> Older hardware uses narrower registers, so I want to be able to handle
> 8-bit and 16-bit wide registers.
>
> Seven clk_divider flags are used, and if I add flags for 8bit access and
> 16bit access, 8bit will not be enough, so I expanded it to u16.
>
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>

Thanks for the update!

> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -26,20 +26,38 @@
>   * parent - fixed parent.  No clk_set_parent support
>   */
>
> -static inline u32 clk_div_readl(struct clk_divider *divider)
> -{
> -       if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
> -               return ioread32be(divider->reg);
> -
> -       return readl(divider->reg);
> +static inline u32 clk_div_read(struct clk_divider *divider)
> +{
> +       if (divider->flags & CLK_DIVIDER_REG_8BIT)

When you need curly braces in one branch of an if/else statement,
please use curly braces in all branches (everywhere).

> +               return readb(divider->reg);
> +       else if (divider->flags & CLK_DIVIDER_REG_16BIT) {
> +               if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
> +                       return ioread16be(divider->reg);
> +               else
> +                       return readw(divider->reg);
> +       } else {
> +               if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
> +                       return ioread32be(divider->reg);
> +               else
> +                       return readl(divider->reg);
> +       }
>  }

> --- a/drivers/clk/clk-gate.c
> +++ b/drivers/clk/clk-gate.c

> @@ -137,12 +155,30 @@ struct clk_hw *__clk_hw_register_gate(struct device=
 *dev,
>         struct clk_init_data init =3D {};
>         int ret =3D -EINVAL;
>
> +       /* validate register size option and bit_idx */
>         if (clk_gate_flags & CLK_GATE_HIWORD_MASK) {
>                 if (bit_idx > 15) {
>                         pr_err("gate bit exceeds LOWORD field\n");
>                         return ERR_PTR(-EINVAL);
>                 }
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
> +       if ((clk_gate_flags & CLK_GATE_HIWORD_MASK) &&

If you use parentheses around "a & b" here...

> +           clk_gate_flags & (CLK_GATE_REG_8BIT | CLK_GATE_REG_16BIT)) {

please add parentheses here, too.

> +               pr_err("HIWORD_MASK required 32-bit register\n");
> +               return ERR_PTR(-EINVAL);
> +       }
>
>         /* allocate the gate */
>         gate =3D kzalloc(sizeof(*gate), GFP_KERNEL);
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 4a537260f655..eaa6ff1d0b2e 100644
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

(from my comments on v6)
There is no need to increase the size of the flags field for the gate clock=
.


>         spinlock_t      *lock;
>  };
>

> @@ -675,13 +681,17 @@ struct clk_div_table {
>   * CLK_DIVIDER_BIG_ENDIAN - By default little endian register accesses a=
re used
>   *     for the divider register.  Setting this flag makes the register a=
ccesses
>   *     big endian.
> + * CLK_DIVIDER_REG_8BIT - by default 32bit register accesses are used fo=
r
> + *     the gate register.  Setting this flag makes the register accesses=
 8bit.
> + * CLK_DIVIDER_REG_16BIT - by default 32bit register accesses are used f=
or
> + *     the gate register.  Setting this flag makes the register accesses=
 16bit.
>   */
>  struct clk_divider {
>         struct clk_hw   hw;
>         void __iomem    *reg;
>         u8              shift;
>         u8              width;
> -       u8              flags;
> +       u16             flags;
>         const struct clk_div_table      *table;
>         spinlock_t      *lock;
>  };

> @@ -726,18 +738,18 @@ struct clk_hw *__clk_hw_register_divider(struct dev=
ice *dev,
>                 struct device_node *np, const char *name,
>                 const char *parent_name, const struct clk_hw *parent_hw,
>                 const struct clk_parent_data *parent_data, unsigned long =
flags,
> -               void __iomem *reg, u8 shift, u8 width, u8 clk_divider_fla=
gs,
> +               void __iomem *reg, u8 shift, u8 width, u32 clk_divider_fl=
ags,

"u16 clk_divider_flags", to match clk_divider.flags.

>                 const struct clk_div_table *table, spinlock_t *lock);
>  struct clk_hw *__devm_clk_hw_register_divider(struct device *dev,
>                 struct device_node *np, const char *name,
>                 const char *parent_name, const struct clk_hw *parent_hw,
>                 const struct clk_parent_data *parent_data, unsigned long =
flags,
> -               void __iomem *reg, u8 shift, u8 width, u8 clk_divider_fla=
gs,
> +               void __iomem *reg, u8 shift, u8 width, u32 clk_divider_fl=
ags,

Likewise.

>                 const struct clk_div_table *table, spinlock_t *lock);
>  struct clk *clk_register_divider_table(struct device *dev, const char *n=
ame,
>                 const char *parent_name, unsigned long flags,
>                 void __iomem *reg, u8 shift, u8 width,
> -               u8 clk_divider_flags, const struct clk_div_table *table,
> +               u32 clk_divider_flags, const struct clk_div_table *table,

Likewise.

>                 spinlock_t *lock);
>  /**
>   * clk_register_divider - register a divider clock with the clock framew=
ork

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
