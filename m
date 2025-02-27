Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D753A48BE5
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 23:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB5910EBA8;
	Thu, 27 Feb 2025 22:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EONHpAQK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545AA10EBA8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 22:44:06 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-e545c1e8a15so1847609276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 14:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740696245; x=1741301045; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KU04ndGRpVnkCi2LzBZ0RaQjHf6S8suG7PAxWO1HqFQ=;
 b=EONHpAQKZaq21jvfdnPK2q0s1LUogYcn+Gmsrj/tVtieoEG0OrMWnKIHrFOH0c7xN9
 bIqgOCn9BLNlD4+iNgZkVRKtyZAjnxiTxwlHClD6xA+3XmHEGI91C3mJxGnmyyPqLhll
 xon4xnyA9Tx6pAqW8DGmpVNYXbdtWf5aZ3aZ8GBGS3wf5Y+/xaRI8z6rfmLKfF7LPncZ
 012bJH/1DO/jJAxJSvj3EtLVyDW8BNv6W3z2r7yTuyAOFSIxXAZrtZBJKDANxOPGGmTn
 gDWA9VRlpOLBAKtXKRhsMZblmW5SK+LKFZOxOXY9g90/ciMuqV4GWLQc1TVAcomImLdI
 yQJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740696245; x=1741301045;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KU04ndGRpVnkCi2LzBZ0RaQjHf6S8suG7PAxWO1HqFQ=;
 b=CkOABqk5FAI/eK+fvhKtTseqW1WbzbN6Urb2z6F8JuUeRBWmqQwC7Zuigw6yOqgBY9
 u/Xsx1phwYoNs9tOrIzdBOF1/IzKX1T+LYIXBcZvQhDYfi/2BO+4zwkLsX+3zWBkdU+R
 7uG2JnvfoHW90QAjYaHRnljBiGMdEgOKwyIYD0yOf4BbjB3q9xfLIsz2/aAwNFBBNb4U
 On+u0Rx3ku9z4SF7mfgCt2JKdmbkoUWwK1jFpvkCTY6ES5c+lSSuhXhyRnU8WmJkN3nb
 /67HAADEKupCBnNLbdzPDAPogBxNpgt8wVWUIvN6EtaKsUhLIDLTuZvbQfnlKlfmO5fa
 ACDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKcupHIRoqdeCB3OZfYjPOfkUiRl1yKvZTFHj/zFBTPC3T52WzFWsAhxPB/19qzyDNfqrgnM0pdio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymLu7RFe2fPGXHwNfNfGfGgivlnI9gJHBY7w53RdIuFdWnASQV
 uXzfMHgAKb/AoLMSjOiWN8qE7f8i3w1xeB2PSYFyz//uy/cBCTxvnX1FjqsoFzchNFAw/WElVs5
 aXBkrth5GJpjo4n816ld0QFpwirQ+HOqrdOc+0w==
X-Gm-Gg: ASbGncuEeZ3aURCrt8ehqvvLj/a0Ws05pgCYqs09h/GscxdSL/80uuHBRmqfuFC3TlP
 0LGckvGur3IOwsvLQqbBbl1qnFkjf+gdh7qPtW34qHnvhfxRGmHBRCRxlEW+8sswl6sHTGxSojs
 N2Mc7rA5S4
X-Google-Smtp-Source: AGHT+IGEy3bc1Bp1xRr8BLb+QC/rd48GSWbVDCH5GXU6tDDpNE7TqnX1Hma037xcueQcp7T70U4jid/sXaVT3cNYdms=
X-Received: by 2002:a05:6902:1687:b0:e60:9acd:7f1e with SMTP id
 3f1490d57ef6-e60b2f2eae2mr1177565276.46.1740696244810; Thu, 27 Feb 2025
 14:44:04 -0800 (PST)
MIME-Version: 1.0
References: <20250221005802.11001-1-andre.przywara@arm.com>
 <20250221005802.11001-3-andre.przywara@arm.com>
In-Reply-To: <20250221005802.11001-3-andre.przywara@arm.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 27 Feb 2025 23:43:29 +0100
X-Gm-Features: AQ5f1Jqs172d4wK_E6GAR9ZUw6OL7SIpKMGguaBKR7COOTYVobqJK7Uj4skIcjU
Message-ID: <CAPDyKFqne4VLemkkgS948whoNm4pOdvp_CCJ4SSBJOBzt9k2Nw@mail.gmail.com>
Subject: Re: [PATCH 2/5] pmdomain: sunxi: add H6 PRCM PPU driver
To: Andre Przywara <andre.przywara@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 21 Feb 2025 at 02:00, Andre Przywara <andre.przywara@arm.com> wrote:
>
> The Allwinner Power Reset Clock Management (RPCM) block contains a few
> bits that control some power domains. The most prominent one is the one
> for the Mali GPU. On the Allwinner H6 this domain is enabled at reset, so
> we didn't care about it so far, but the H616 defaults to it being disabled.
>
> Add a power domain driver for those bits. Some BSP code snippets and
> some spare documentation describe three bits, slightly different between
> the H6 and H616, so add three power domains for each SoC, connected to
> their compatible string.
>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/pmdomain/sunxi/Kconfig              |  10 +
>  drivers/pmdomain/sunxi/Makefile             |   1 +
>  drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c | 191 ++++++++++++++++++++
>  3 files changed, 202 insertions(+)
>  create mode 100644 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
>
> diff --git a/drivers/pmdomain/sunxi/Kconfig b/drivers/pmdomain/sunxi/Kconfig
> index 17781bf8d86d7..43eecb3ea9819 100644
> --- a/drivers/pmdomain/sunxi/Kconfig
> +++ b/drivers/pmdomain/sunxi/Kconfig
> @@ -8,3 +8,13 @@ config SUN20I_PPU
>         help
>           Say y to enable the PPU power domain driver. This saves power
>           when certain peripherals, such as the video engine, are idle.
> +
> +config SUN50I_H6_PRCM_PPU
> +       tristate "Allwinner H6 PRCM power domain driver"
> +       depends on ARCH_SUNXI || COMPILE_TEST
> +       depends on PM
> +       select PM_GENERIC_DOMAINS
> +       help
> +         Say y to enable the Allwinner H6/H616 PRCM power domain driver.
> +         This is required to enable the Mali GPU in the H616 SoC, it is
> +         optional for the H6.
> diff --git a/drivers/pmdomain/sunxi/Makefile b/drivers/pmdomain/sunxi/Makefile
> index ec1d7a2fb21db..c1343e1237599 100644
> --- a/drivers/pmdomain/sunxi/Makefile
> +++ b/drivers/pmdomain/sunxi/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_SUN20I_PPU)               += sun20i-ppu.o
> +obj-$(CONFIG_SUN50I_H6_PRCM_PPU)       += sun50i-h6-prcm-ppu.o
> diff --git a/drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c b/drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
> new file mode 100644
> index 0000000000000..1c6b0c78b222d
> --- /dev/null
> +++ b/drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
> @@ -0,0 +1,191 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) Arm Ltd. 2024
> + *
> + * Allwinner H6/H616 PRCM power domain driver.
> + * This covers a few registers inside the PRCM (Power Reset Clock Management)
> + * block that control some power rails, most prominently for the Mali GPU.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/reset.h>
> +
> +/*
> + * The PRCM block covers multiple devices, starting with some clocks,
> + * then followed by the power rails.
> + * The clocks are covered by a different driver, so this driver's MMIO range
> + * starts later in the PRCM MMIO frame, not at the beginning of it.
> + * To keep the register offsets consistent with other PRCM documentation,
> + * express the registers relative to the beginning of the whole PRCM, and
> + * subtract the PPU offset this driver is bound to.
> + */
> +#define PD_H6_PPU_OFFSET               0x250
> +#define PD_H6_VDD_SYS_REG              0x250
> +#define PD_H616_ANA_VDD_GATE                   BIT(4)
> +#define PD_H6_CPUS_VDD_GATE                    BIT(3)
> +#define PD_H6_AVCC_VDD_GATE                    BIT(2)
> +#define PD_H6_GPU_REG                  0x254
> +#define PD_H6_GPU_GATE                         BIT(0)
> +
> +struct sun50i_h6_ppu_pd {
> +       struct generic_pm_domain        genpd;
> +       void __iomem                    *reg;
> +       u32                             gate_mask;
> +       bool                            negated;
> +};
> +
> +#define FLAG_PPU_ALWAYS_ON     BIT(0)
> +#define FLAG_PPU_NEGATED       BIT(1)
> +
> +struct sun50i_h6_ppu_desc {
> +       const char *name;
> +       u32 offset;
> +       u32 mask;
> +       unsigned int flags;
> +};
> +
> +struct sun50i_h6_ppu_desc sun50i_h6_ppus[] = {
> +       { "AVCC", PD_H6_VDD_SYS_REG, PD_H6_AVCC_VDD_GATE },
> +       { "CPUS", PD_H6_VDD_SYS_REG, PD_H6_CPUS_VDD_GATE },
> +       { "GPU", PD_H6_GPU_REG, PD_H6_GPU_GATE },
> +       {}
> +};

I suggest we define a new struct (perhaps sun50_domain_data!?) that
has a struct sun50i_h6_ppu_desc* member along with a size_t member to
keep the number of the domains, set by using ARRAY_SIZE().

In this way we don't need the additional NULL domain at the end - and
we can also avoid looping through the array during probe  to count
them.

> +
> +struct sun50i_h6_ppu_desc sun50i_h616_ppus[] = {
> +       { "PLL", PD_H6_VDD_SYS_REG, PD_H6_AVCC_VDD_GATE,
> +               FLAG_PPU_ALWAYS_ON | FLAG_PPU_NEGATED },
> +       { "ANA", PD_H6_VDD_SYS_REG, PD_H616_ANA_VDD_GATE, FLAG_PPU_ALWAYS_ON },
> +       { "GPU", PD_H6_GPU_REG, PD_H6_GPU_GATE, FLAG_PPU_NEGATED },
> +       {}
> +};
> +#define to_sun50i_h6_ppu_pd(_genpd) \
> +       container_of(_genpd, struct sun50i_h6_ppu_pd, genpd)
> +
> +static bool sun50i_h6_ppu_power_status(const struct sun50i_h6_ppu_pd *pd)
> +{
> +       bool bit = readl(pd->reg) & pd->gate_mask;
> +
> +       return bit ^ pd->negated;
> +}
> +
> +static int sun50i_h6_ppu_pd_set_power(const struct sun50i_h6_ppu_pd *pd,
> +                                     bool set_bit)
> +{
> +       u32 reg = readl(pd->reg);
> +
> +       if (set_bit)
> +               writel(reg | pd->gate_mask, pd->reg);
> +       else
> +               writel(reg & ~pd->gate_mask, pd->reg);
> +
> +       return 0;
> +}
> +
> +static int sun50i_h6_ppu_pd_power_on(struct generic_pm_domain *genpd)
> +{
> +       const struct sun50i_h6_ppu_pd *pd = to_sun50i_h6_ppu_pd(genpd);
> +
> +       return sun50i_h6_ppu_pd_set_power(pd, !pd->negated);
> +}
> +
> +static int sun50i_h6_ppu_pd_power_off(struct generic_pm_domain *genpd)
> +{
> +       const struct sun50i_h6_ppu_pd *pd = to_sun50i_h6_ppu_pd(genpd);
> +
> +       return sun50i_h6_ppu_pd_set_power(pd, pd->negated);
> +}
> +
> +static int sun50i_h6_ppu_probe(struct platform_device *pdev)
> +{
> +       struct device *dev = &pdev->dev;
> +       struct genpd_onecell_data *ppu;
> +       struct sun50i_h6_ppu_pd *pds;
> +       const struct sun50i_h6_ppu_desc *desc;
> +       void __iomem *base;
> +       int ret, i, count;
> +
> +       desc = of_device_get_match_data(dev);
> +       if (!desc)
> +               return -EINVAL;
> +
> +       for (count = 0; desc[count].name; count++)
> +               ;
> +
> +       pds = devm_kcalloc(dev, count, sizeof(*pds), GFP_KERNEL);
> +       if (!pds)
> +               return -ENOMEM;
> +
> +       ppu = devm_kzalloc(dev, sizeof(*ppu), GFP_KERNEL);
> +       if (!ppu)
> +               return -ENOMEM;
> +
> +       ppu->num_domains = count;
> +       ppu->domains = devm_kcalloc(dev, count, sizeof(*ppu->domains),
> +                                   GFP_KERNEL);
> +       if (!ppu->domains)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, ppu);
> +
> +       base = devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
> +       for (i = 0; i < count; i++) {
> +               struct sun50i_h6_ppu_pd *pd = &pds[i];
> +
> +               pd->genpd.name          = desc[i].name;
> +               pd->genpd.power_off     = sun50i_h6_ppu_pd_power_off;
> +               pd->genpd.power_on      = sun50i_h6_ppu_pd_power_on;
> +               if (desc[i].flags & FLAG_PPU_ALWAYS_ON)
> +                       pd->genpd.flags = GENPD_FLAG_ALWAYS_ON;
> +               pd->negated             = !!(desc[i].flags & FLAG_PPU_NEGATED);
> +               pd->reg                 = base + desc[i].offset - PD_H6_PPU_OFFSET;
> +               pd->gate_mask           = desc[i].mask;
> +
> +               ret = pm_genpd_init(&pd->genpd, NULL,
> +                                   !sun50i_h6_ppu_power_status(pd));
> +               if (ret) {
> +                       dev_warn(dev, "Failed to add GPU power domain: %d\n", ret);
> +                       return ret;
> +               }
> +               ppu->domains[i] = &pd->genpd;
> +       }
> +
> +       ret = of_genpd_add_provider_onecell(dev->of_node, ppu);
> +       if (ret)
> +               dev_warn(dev, "Failed to add provider: %d\n", ret);

If of_genpd_add_provider_onecell() fails, shouldn't we remove the
genpds in the error path?

> +
> +       return 0;
> +}
> +
> +static const struct of_device_id sun50i_h6_ppu_of_match[] = {
> +       { .compatible   = "allwinner,sun50i-h6-prcm-ppu",
> +         .data         = &sun50i_h6_ppus },
> +       { .compatible   = "allwinner,sun50i-h616-prcm-ppu",
> +         .data         = &sun50i_h616_ppus },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(of, sun50i_h6_ppu_of_match);
> +
> +static struct platform_driver sun50i_h6_ppu_driver = {
> +       .probe  = sun50i_h6_ppu_probe,
> +       .driver = {
> +               .name                   = "sun50i-h6-prcm-ppu",
> +               .of_match_table         = sun50i_h6_ppu_of_match,
> +               /* Power domains cannot be removed while they are in use. */
> +               .suppress_bind_attrs    = true,
> +       },
> +};
> +module_platform_driver(sun50i_h6_ppu_driver);
> +
> +MODULE_AUTHOR("Andre Przywara <andre.przywara@arm.com>");
> +MODULE_DESCRIPTION("Allwinner H6 PRCM power domain driver");
> +MODULE_LICENSE("GPL");
> --
> 2.46.3
>

Kind regards
Uffe
