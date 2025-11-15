Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FA2C6097F
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 18:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE8C898F0;
	Sat, 15 Nov 2025 17:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212CB898F0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 17:37:43 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-37a3d86b773so29112951fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 09:37:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763228258; x=1763833058;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :reply-to:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iS8st6S4NEhfwQi2ADWQ0RHyYWa8wB83L+ih+AMC2co=;
 b=AwlzuJvO7nXLTPlF+feJ6CcnMZtZb+P2WlMj5eXxLBJ0xEdEZSB0tw+Z4Kg5+f3C1c
 J9cxJbc3Etb6RlwKAeKVxo3+7vEsGTMb7aKwpE8tteWdBIIPZ4/SrpsrkNmN/hiNrE5q
 ue9Rto1bkdZ7pXbwZoQfLfwxVrgQKmt/LPizfAGS/kWZBeNI6cL1qSo8QKhxFJFalHqE
 UUtcwi+XYL/kyjBiyWMooCI9iclOuGgORuGKjQ+YU28OektlReVBC5qY11o4kL39fyZo
 mpzmOUxhqKpFuk0HW5kFRP9Eo2QCjsPZkUjvp8ns7i7NA7VHo53Zwpl2LB/c1MHKDxGx
 SHPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHY/+WYUK3wIOuaHrwkhdrmItM+SW8+qzyDlCoqqxb/xbcEvH6X4CnBEwhQrJXkrQ0nLz3Q7K7cG8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFMqIkG6KMCc5LPK9rUQzAJNbH1Cn+FmT9DfNBZRLfSdyx3rxO
 5RAHZKG+r/GatAnPY4EcNBzpIRo78LU0cnGQmcHL0oNg1lFOLrT5woDeffXyB8ft
X-Gm-Gg: ASbGnctx23/LCrMdhTB8sNDfMh54Z9uFItmbMAnHskfP73crfvfn3LNusm+9/JHoyVc
 4NOCmTkfeRHk+UvIURtUokHmkBqRDVY1yA2lx6lu9+7/dy5zuFIxU7/Hr+i23xIXxyXG8hRZTid
 tcJIKA/hogxbXHzrj7L7F/6UAR8nxwaWxCf1IN7wW7uYwUmEZkj4c0F1MHGGpR/wqOLVbNWfkQW
 UiNzmWWvh+nCtJl983D+ea8tbOsnXKOcYW2RHzZKhGT31iEpyEMylDwgFEaEIWpGGnITQFBt0s/
 HgbmzRsJmBrI2bOL94fRsEUAT8MKrdOJnxOjSbEnRwqNCtfOEmvXvMcL5mgmV+uUW4yOmRAXU+4
 ls4NoN/s54UcfYwwo+Zc3oM5dbzZvRjw3nMtRL7WmXB4jbYZAbQVRWIv6RqDghah0V7sNaJ04Yk
 le0f96I19xYjYIOLJaafjbhXW2sDQjYsJy+FbiZwo7r2c=
X-Google-Smtp-Source: AGHT+IEQWk7nWq0H2gHgAaJk7N/GGYzWRzGPYFVasYcQ8vs7m5d1p64r5l9OOZ3/TRw9vmaFT6nMyw==
X-Received: by 2002:a05:6512:4028:b0:594:34c4:a33a with SMTP id
 2adb3069b0e04-595841b4b06mr2333313e87.19.1763228257941; 
 Sat, 15 Nov 2025 09:37:37 -0800 (PST)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59580400458sm1878957e87.63.2025.11.15.09.37.37
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 15 Nov 2025 09:37:37 -0800 (PST)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-37a875e3418so22079981fa.1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 09:37:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWtPqulMrkX4W6x3B9glcmY+ktwPUdIfRQjGTsvqyA2585AM3SYbkvbqGfLwxSGaIMmD2iin3w+yQk=@lists.freedesktop.org
X-Received: by 2002:a05:651c:41d5:b0:37a:4c29:3a90 with SMTP id
 38308e7fff4ca-37babac1aa5mr18627811fa.0.1763228257141; Sat, 15 Nov 2025
 09:37:37 -0800 (PST)
MIME-Version: 1.0
References: <20251115141347.13087-1-jernej.skrabec@gmail.com>
 <20251115141347.13087-4-jernej.skrabec@gmail.com>
In-Reply-To: <20251115141347.13087-4-jernej.skrabec@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 16 Nov 2025 01:37:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v64xOrLzPYNOfFNFfPckR8EUF_U6xY0J_a3G7b0Ymb4OnA@mail.gmail.com>
X-Gm-Features: AWmQ_bmhcY2-o8gJRo_3ltGzVFP1TpTD5csESojSsWw724bLMcf3HNL8i2V4XHQ
Message-ID: <CAGb2v64xOrLzPYNOfFNFfPckR8EUF_U6xY0J_a3G7b0Ymb4OnA@mail.gmail.com>
Subject: Re: [PATCH 3/7] clk: sunxi-ng: de2: Export register regmap for DE33
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: samuel@sholland.org, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, mturquette@baylibre.com, 
 sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
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
Reply-To: wens@csie.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Nov 15, 2025 at 10:14=E2=80=AFPM Jernej Skrabec
<jernej.skrabec@gmail.com> wrote:
>
> DE33 clock pre-set plane mapping, which is not something that we want
> from clock driver. Export registers instead, so DRM driver can set them
> properly.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 53 ++++++++++++++++++++++++++--
>  1 file changed, 50 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/=
ccu-sun8i-de2.c
> index a6cd0f988859..2841ec922025 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> @@ -6,9 +6,11 @@
>  #include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/io.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/regmap.h>
>  #include <linux/reset.h>
>
>  #include "ccu_common.h"
> @@ -250,6 +252,41 @@ static const struct sunxi_ccu_desc sun50i_h616_de33_=
clk_desc =3D {
>         .num_resets     =3D ARRAY_SIZE(sun50i_h5_de2_resets),
>  };
>
> +/*
> + * Add a regmap for the DE33 plane driver to access plane
> + * mapping registers.
> + * Only these registers are allowed to be written, to prevent
> + * overriding clock and reset configuration.
> + */
> +
> +#define SUN50I_DE33_CHN2CORE_REG 0x24
> +#define SUN50I_DE33_PORT02CHN_REG 0x28
> +#define SUN50I_DE33_PORT12CHN_REG 0x2c
> +
> +static bool sun8i_de2_ccu_regmap_accessible_reg(struct device *dev,
> +                                               unsigned int reg)
> +{
> +       switch (reg) {
> +       case SUN50I_DE33_CHN2CORE_REG:
> +       case SUN50I_DE33_PORT02CHN_REG:
> +       case SUN50I_DE33_PORT12CHN_REG:
> +               return true;
> +       default:
> +               return false;
> +       }
> +}

Since the registers are contiguous, I think it makes a bit more sense
to use the .rd_table and .wr_table. A bonus is that the check can be
inlined in the core instead of calling a function pointer.

> +static const struct regmap_config sun8i_de2_ccu_regmap_config =3D {
> +       .reg_bits       =3D 32,
> +       .val_bits       =3D 32,
> +       .reg_stride     =3D 4,
> +       .max_register   =3D 0xe0,

None of the registers past SUN50I_DE33_PORT12CHN_REG are accessible,
so we should probably just put that here.

> +
> +       /* other devices have no business accessing other registers */
> +       .readable_reg   =3D sun8i_de2_ccu_regmap_accessible_reg,
> +       .writeable_reg  =3D sun8i_de2_ccu_regmap_accessible_reg,
> +};
> +
>  static int sunxi_de2_clk_probe(struct platform_device *pdev)
>  {
>         struct clk *bus_clk, *mod_clk;
> @@ -303,13 +340,23 @@ static int sunxi_de2_clk_probe(struct platform_devi=
ce *pdev)
>         }
>
>         /*
> -        * The DE33 requires these additional (unknown) registers set
> +        * The DE33 requires these additional plane mapping registers set
>          * during initialisation.
>          */
>         if (of_device_is_compatible(pdev->dev.of_node,
>                                     "allwinner,sun50i-h616-de33-clk")) {
> -               writel(0, reg + 0x24);
> -               writel(0x0000a980, reg + 0x28);
> +               struct regmap *regmap;
> +
> +               regmap =3D devm_regmap_init_mmio(&pdev->dev, reg,
> +                                              &sun8i_de2_ccu_regmap_conf=
ig);
> +               if (IS_ERR(regmap)) {
> +                       ret =3D PTR_ERR(regmap);
> +                       goto err_assert_reset;
> +               }
> +
> +               ret =3D of_syscon_register_regmap(pdev->dev.of_node, regm=
ap);

dev_of_node(&pdev->dev) instead of directly accessing the member.
IIRC this is the new preferred style.


Thanks
ChenYu

> +               if (ret)
> +                       goto err_assert_reset;
>         }
>
>         ret =3D devm_sunxi_ccu_probe(&pdev->dev, reg, ccu_desc);
> --
> 2.51.2
>
>
