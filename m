Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D05C58D41E3
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 01:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FAD10E856;
	Wed, 29 May 2024 23:15:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OabscRPI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AB2510E856
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 23:15:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6368961F9F;
 Wed, 29 May 2024 23:15:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDF6DC32781;
 Wed, 29 May 2024 23:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717024522;
 bh=7HtHIBMnOSfXwlIN2FN4JThv0qqYOxoaXPTbFn/okcY=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=OabscRPIEp57y8+0XlGk2MoMOeUdg3DFch7rE9IX08FLlS4oK8rykJtvab3sIEtiA
 bRKPiWK35XtvcazFBhiVQFUOddAQgdYj+QVCvdrPBzcU9X3d/30Gviua7TUav5HcVH
 ifDThHZQalm9753WBOnV8YV5lSp4qJgxmXRDfyTMrk2+eTjTsr1Tx0gsrPMLu8yfMp
 f4K/Uum4draifjed4IA71oYuDtsQwdkKU4U3aojjuTNeYziub9jTJi54QezxYVXe7/
 K4QJdoFY4b00+gH/sYrGVsHbk4NdQ+Hv/vn/al2ck+PIe7Q0n1ndrOSIs8/MUlVFzB
 UmKhhc3IAcIoA==
Message-ID: <3280d9e3c7ba19f86b85a7fa89f5be25.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <a3bed3c2940edc238afbc191d595a727944892f3.1716965617.git.ysato@users.sourceforge.jp>
References: <cover.1716965617.git.ysato@users.sourceforge.jp>
 <a3bed3c2940edc238afbc191d595a727944892f3.1716965617.git.ysato@users.sourceforge.jp>
Subject: Re: [DO NOT MERGE v8 14/36] clk: Compatible with narrow registers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>,
 Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kw@linux.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Lee Jones <lee@kernel.org>, Helge Deller <deller@gmx
 .de>, Heiko Stuebner <heiko.stuebner@cherry.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>, Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Baoquan He <bhe@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck <linux@roeck-us.net>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Azeem Shaikh <azeemshaikh38@gmail.com>, Guo Ren <guoren@kernel.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Anup Patel <apatel@ventanamicro.com>, Jacky Huang <ychuang3@nuvoton.com>,
 Hugo Villeneuve <hvilleneuve@dimonoff.com>, Jonathan Corbet <corbet@lwn.net>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Christophe JAI
 LLET <christophe.jaillet@wanadoo.fr>, Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Sergey Shtylyov <s.shtylyov@omp.ru>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pci@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-fbdev@vger.kernel.org
To: Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org
Date: Wed, 29 May 2024 16:15:19 -0700
User-Agent: alot/0.10
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

Quoting Yoshinori Sato (2024-05-29 01:01:00)
> divider and gate only support 32-bit registers.
> Older hardware uses narrower registers, so I want to be able to handle
> 8-bit and 16-bit wide registers.
>=20
> Seven clk_divider flags are used, and if I add flags for 8bit access and
> 16bit access, 8bit will not be enough, so I expanded it to u16.
>=20
> Signed-off-by: Yoshinori Sato <ysato@users.sourceforge.jp>
> ---
>  drivers/clk/clk-divider.c    | 41 +++++++++++++++++++++---------
>  drivers/clk/clk-gate.c       | 49 ++++++++++++++++++++++++++++++++----
>  include/linux/clk-provider.h | 20 ++++++++++++---
>  3 files changed, 89 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/clk/clk-divider.c b/drivers/clk/clk-divider.c
> index a2c2b5203b0a..abafcbbb6578 100644
> --- a/drivers/clk/clk-divider.c
> +++ b/drivers/clk/clk-divider.c
> @@ -26,17 +26,34 @@
>   * parent - fixed parent.  No clk_set_parent support
>   */
> =20
> -static inline u32 clk_div_readl(struct clk_divider *divider)
> -{
> +static inline u32 clk_div_read(struct clk_divider *divider)

Please don't change the name. The 'l' is for the return type, u32, which
is not changed.

> +{
> +       if (divider->flags & CLK_DIVIDER_REG_8BIT)
> +               return readb(divider->reg);
> +       if (divider->flags & CLK_DIVIDER_REG_16BIT) {
> +               if (divider->flags & CLK_DIVIDER_BIG_ENDIAN) {
> +                       return ioread16be(divider->reg);
> +               } else {
> +                       return readw(divider->reg);
> +               }
> +       }
>         if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
>                 return ioread32be(divider->reg);
> =20
>         return readl(divider->reg);
>  }
> =20
> -static inline void clk_div_writel(struct clk_divider *divider, u32 val)
> +static inline void clk_div_write(struct clk_divider *divider, u32 val)

Same comment.

>  {
> -       if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
> +       if (divider->flags & CLK_DIVIDER_REG_8BIT)
> +               writeb(val, divider->reg);
> +       else if (divider->flags & CLK_DIVIDER_REG_16BIT) {
> +               if (divider->flags & CLK_DIVIDER_BIG_ENDIAN) {
> +                       iowrite16be(val, divider->reg);
> +               } else {
> +                       writew(val, divider->reg);
> +               }
> +       } else if (divider->flags & CLK_DIVIDER_BIG_ENDIAN)
>                 iowrite32be(val, divider->reg);
>         else
>                 writel(val, divider->reg);
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 4a537260f655..25f61bd5b952 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -508,6 +508,10 @@ void of_fixed_clk_setup(struct device_node *np);
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
> @@ -522,6 +526,8 @@ struct clk_gate {
>  #define CLK_GATE_SET_TO_DISABLE                BIT(0)
>  #define CLK_GATE_HIWORD_MASK           BIT(1)
>  #define CLK_GATE_BIG_ENDIAN            BIT(2)
> +#define CLK_GATE_REG_8BIT              BIT(3)
> +#define CLK_GATE_REG_16BIT             BIT(4)

Please add kunit tests for the gate at least.

> =20
>  extern const struct clk_ops clk_gate_ops;
>  struct clk_hw *__clk_hw_register_gate(struct device *dev,
> @@ -675,13 +681,17 @@ struct clk_div_table {
>   * CLK_DIVIDER_BIG_ENDIAN - By default little endian register accesses a=
re used
>   *     for the divider register.  Setting this flag makes the register a=
ccesses
>   *     big endian.
> + * CLK_DIVIDER_REG_8BIT - by default 32bit register accesses are used for
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
> @@ -697,6 +707,8 @@ struct clk_divider {
>  #define CLK_DIVIDER_READ_ONLY          BIT(5)
>  #define CLK_DIVIDER_MAX_AT_ZERO                BIT(6)
>  #define CLK_DIVIDER_BIG_ENDIAN         BIT(7)
> +#define CLK_DIVIDER_REG_8BIT           BIT(8)
> +#define CLK_DIVIDER_REG_16BIT          BIT(9)
> =20
>  extern const struct clk_ops clk_divider_ops;
>  extern const struct clk_ops clk_divider_ro_ops;
> @@ -726,18 +738,18 @@ struct clk_hw *__clk_hw_register_divider(struct dev=
ice *dev,
>                 struct device_node *np, const char *name,
>                 const char *parent_name, const struct clk_hw *parent_hw,
>                 const struct clk_parent_data *parent_data, unsigned long =
flags,
> -               void __iomem *reg, u8 shift, u8 width, u8 clk_divider_fla=
gs,
> +               void __iomem *reg, u8 shift, u8 width, u16 clk_divider_fl=
ags,

Let's just make this unsigned long for the flags. We don't need to
specify a strict size like this for the callers.

>                 const struct clk_div_table *table, spinlock_t *lock);
>  struct clk_hw *__devm_clk_hw_register_divider(struct device *dev,
>                 struct device_node *np, const char *name,
>                 const char *parent_name, const struct clk_hw *parent_hw,
>                 const struct clk_parent_data *parent_data, unsigned long =
flags,
> -               void __iomem *reg, u8 shift, u8 width, u8 clk_divider_fla=
gs,
> +               void __iomem *reg, u8 shift, u8 width, u16 clk_divider_fl=
ags,

Same here.

>                 const struct clk_div_table *table, spinlock_t *lock);
>  struct clk *clk_register_divider_table(struct device *dev, const char *n=
ame,
>                 const char *parent_name, unsigned long flags,
>                 void __iomem *reg, u8 shift, u8 width,
> -               u8 clk_divider_flags, const struct clk_div_table *table,
> +               u16 clk_divider_flags, const struct clk_div_table *table,

Same here. Preferably do that in another patch too.
