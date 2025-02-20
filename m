Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88684A3D94D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 12:59:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C02810E0F1;
	Thu, 20 Feb 2025 11:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="OpdJAaMW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC9610E0F1
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 11:59:08 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20250220115906euoutp016aca34e2c0b6e83062067e0d0ecaf602~l6MEMqNI-2891928919euoutp01X
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 11:59:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20250220115906euoutp016aca34e2c0b6e83062067e0d0ecaf602~l6MEMqNI-2891928919euoutp01X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1740052746;
 bh=WbaQ/9sdFTSMT3Yx7rM6sR9ucSIGsvWzGNFoPHlanDU=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=OpdJAaMWXPczJL7Uerl9a12kMs2IwV/bFHpHXjQabRPG9dyTOIXk5e8DoTObBlzZT
 NbOWKFkv/lajLO4uymNTgLtzFuBfVve/a5Gdbq06dFrp8aPEtb8NMvuTEc6qp8xIya
 gmJK3kU05yh5a8LlON+MjMslTzSVqD5Bf+l3mw+A=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20250220115906eucas1p17e772d521e9c62859b685c9b0b9f883c~l6MDu_D1T2222722227eucas1p1g;
 Thu, 20 Feb 2025 11:59:06 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 5F.58.20821.A0917B76; Thu, 20
 Feb 2025 11:59:06 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20250220115905eucas1p19d7a7c4bdcac611e8d810173f5790242~l6MDNZrp82222722227eucas1p1f;
 Thu, 20 Feb 2025 11:59:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250220115905eusmtrp23dfc9c96453f0fe7bffb3de8989e8571~l6MDMcmrc1063110631eusmtrp2q;
 Thu, 20 Feb 2025 11:59:05 +0000 (GMT)
X-AuditID: cbfec7f2-b09c370000005155-a1-67b7190a7ede
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 8C.EF.19654.90917B76; Thu, 20
 Feb 2025 11:59:05 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20250220115904eusmtip16430da047a27d83e0e36535305bd5ae9~l6MB9RR6c2207222072eusmtip11;
 Thu, 20 Feb 2025 11:59:04 +0000 (GMT)
Message-ID: <803202e2-66ed-448a-927b-c9cd02af63db@samsung.com>
Date: Thu, 20 Feb 2025 12:59:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 12/21] reset: thead: Add TH1520 reset controller driver
To: Philipp Zabel <p.zabel@pengutronix.de>, mturquette@baylibre.com,
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 drew@pdp7.com, guoren@kernel.org, wefu@redhat.com, jassisinghbrar@gmail.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 frank.binns@imgtec.com, matt.coster@imgtec.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, ulf.hansson@linaro.org,
 jszhang@kernel.org, m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <ef2026c28b9e6d59a98f6f33eb14f3b762454423.camel@pengutronix.de>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxbVRjGd25v7700KbsUkLMpMmtENgeMuc2TbbLNbPFq1AB+zPiHrmHX
 svBpu6KSKWPQjrEy6tgUi6UtIJCGQoYtUKSitaEwFsbHBqxZCxPEdR8wPqaBBablovLf733e
 5z3veU4OxRP9SGykjmUcZ2UZkjQxIcCbOxeuRgs2tEi3uQxBqGu4EkPWR1oS1dt7MaR39vKR
 d8CCoWsPpwnU8HsfiW7b83A0VKcjUX5nI4F8Wi+BZtRePhps+45Ac8VOgJrnCghkdnpIZJyx
 4qi6tQ0g1ZkaPuq/fAh5vF048g2qeUilXY8et7eSaHnoEo7KpzpIZLn3FR+5zIdRQccFfH84
 Mz2iJJl7Ph/O/Fo4TzL2Pw04Y9N6SEZtuwKYJtMZgrk51E4wFd2JzOhZF8b8UJ3LFJg7MaZk
 aRsz/dN1gjlnMQFmIH+YTBB9INh7lE07ls3KYuOPCFLKblThWfaXPtNO1uMnwaXoIhBAQXoH
 /NpnIoqAgBLRdQDOd6p5XDEP4ILRg/ldInoOwN8swUWAWplw50POUwvgVH0hxhX3AexrHVsZ
 ENLxsNB8jvQzTj8HnYtewOlBsPvbCdzPoXQEHHWXrXiC6QRou27F/QeF0BdxWFrhW2nw6BYA
 u64IOQ6D7gn9ygKC3g7HavV8PwfQb8DxIR3GeSJgvrWcx2XrF8DZJZzjg/BCXwfGcTC847KQ
 HD8FH9v0q3omHLPOrs6egDa1a5X3wJu9i4Q/PY/eDBvbYjn5AHy45MS4RwmEI/eDuBsEwvPN
 3/A4WQgLVSLOHQkvqov/W9pb14xpgFi75lG0azJq12TR/r/XAHATCGMV8nQpK4/LYD+NkUvS
 5YoMaUxyZnoT+Od/9yy7ZluB7s5MjANgFHAASPHEIUJVrkUqEh6VfJ7DyjI/kinSWLkDPEnh
 4jBhZYdSKqKlkuNsKstmsbJ/uxgVsPEk9m5ypcA4lxhVSemUW/KeTjaNlr6ueU3UjmlCcj+J
 2SUqvfbXPrEluwzsDa9TMs/nRCzsu0u+qe1oWGdKDupxdA/W7Izd/eXmHYaoPdsH8puULxdc
 NY492HT+1B/WqnSBMSa64a47KUpnesfwi2tI/PEDc8XutvJNw4/C0HLJTqXi9mnz94klWVPv
 6agKugxzYIs3XlAZJp/5sKunvkvff+DtVFXficBDlyO9k+EBA7yJn+Nv5YUFJDXU5Ng19oR1
 bkHl1tmk6iMq99nFxmffChWdGo94NaX2RU37YNYrU6kjS/uLFJpbWyUt2d5d5sPz/NAN6z1l
 Vafjxt9/4otIxXRUsUaMy1MkcVt4Mrnkb/GpMSpOBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsVy+t/xu7qcktvTDaZe0LI4cX0Rk8XW37PY
 LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
 cXnXHDaLz71HGC22fW5hs1h75C67xcKPW1ksluzYxWjR1rmM1eLiKVeLu/dOsFi8vNzDbNE2
 i9/i/54d7Bb/rm1ksZj9bj+7xZY3E1ktjq8Nt2jZP4XFQdbj/Y1Wdo83L1+yeBzu+MLusffb
 AhaPnbPusnv07DzD6LFpVSebx51re9g85p0M9LjffZzJY/OSeo+WtceYPPr/Gni833eVzaNv
 yypGj0vN19kDhKL0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1jrYxMlfTtbFJSczLL
 Uov07RL0MmbcXMxSsNe8YtazNSwNjBt1uxg5OCQETCRuNUt0MXJxCAksZZTYtuIxUxcjJ1Bc
 RuJa90sWCFtY4s+1LjaIoteMEh9fLWEHSfAK2El0rO0Ds1kEVCWO/LrHCBEXlDg58wlYs6iA
 vMT9WzPAaoQF/CTW3FzMDDJIRGAqi8SRq39ZQRxmge2MEhtmTmWEWNHDJLG3tZEZpIVZQFzi
 1pP5YDexCRhJPFg+nxXE5hTwkXh8bS4TyA/MAuoS6+cJQZTLSzRvnc08gVFoFpJDZiGZNAuh
 YxaSjgWMLKsYRVJLi3PTc4uN9IoTc4tL89L1kvNzNzECk9a2Yz+37GBc+eqj3iFGJg7GQ4wS
 HMxKIrxt9VvShXhTEiurUovy44tKc1KLDzGaAgNjIrOUaHI+MG3mlcQbmhmYGpqYWRqYWpoZ
 K4nzsl05nyYkkJ5YkpqdmlqQWgTTx8TBKdXAlBrT79epMs/G4Qp7WeaqM9INt36uDys69/Ln
 dMkktjWT6rtOz+mqOTrxvtuPE6wWRtozL9smFfMIT1u5eJ/Put13mW0XFEUc1Mrnz2BZG7c2
 5fO5c7e6nu5elL1PNsF66uS4jKadmy/u/Rewo/Qb1xzxphOWne+tMnra9z9q/tfvmbu/Slds
 CvvkrR+C6z97lcjq2WwT22uYdjJN6fWm+fdzGPVKzecarpA5W8h03pTD2UtmlUDf37b7bq5b
 tzdmdRlm6btoLXHYLSy83mTjtBOtaq275867tHNJ8bKrX1b7uCeFHPToYPy1+uMOr0jX4wW9
 6zquOO1f4LpTz0jcWjjdKNd8cuD7xSdeWV8IUGIpzkg01GIuKk4EAABdgL/jAwAA
X-CMS-MailID: 20250220115905eucas1p19d7a7c4bdcac611e8d810173f5790242
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250219140305eucas1p26317b54727c68cf069458d270e06d962
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140305eucas1p26317b54727c68cf069458d270e06d962
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
 <CGME20250219140305eucas1p26317b54727c68cf069458d270e06d962@eucas1p2.samsung.com>
 <20250219140239.1378758-13-m.wilczynski@samsung.com>
 <ef2026c28b9e6d59a98f6f33eb14f3b762454423.camel@pengutronix.de>
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



On 2/19/25 16:01, Philipp Zabel wrote:
> On Mi, 2025-02-19 at 15:02 +0100, Michal Wilczynski wrote:
>> Add reset controller driver for the T-HEAD TH1520 SoC that manages
>> hardware reset lines for various subsystems. The driver currently
>> implements support for GPU reset control, with infrastructure in place
>> to extend support for NPU and Watchdog Timer resets in future updates.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  MAINTAINERS                  |   1 +
>>  drivers/reset/Kconfig        |  10 +++
>>  drivers/reset/Makefile       |   1 +
>>  drivers/reset/reset-th1520.c | 141 +++++++++++++++++++++++++++++++++++
>>  4 files changed, 153 insertions(+)
>>  create mode 100644 drivers/reset/reset-th1520.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 819686e98214..e4a0a83b4c11 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -20425,6 +20425,7 @@ F:	drivers/mailbox/mailbox-th1520.c
>>  F:	drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>>  F:	drivers/pinctrl/pinctrl-th1520.c
>>  F:	drivers/pmdomain/thead/
>> +F:	drivers/reset/reset-th1520.c
>>  F:	include/dt-bindings/clock/thead,th1520-clk-ap.h
>>  F:	include/dt-bindings/power/thead,th1520-power.h
>>  F:	include/dt-bindings/reset/thead,th1520-reset.h
>> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
>> index 5b3abb6db248..fa0943c3d1de 100644
>> --- a/drivers/reset/Kconfig
>> +++ b/drivers/reset/Kconfig
>> @@ -272,6 +272,16 @@ config RESET_SUNXI
>>  	help
>>  	  This enables the reset driver for Allwinner SoCs.
>>  
>> +config RESET_TH1520
>> +	tristate "T-HEAD 1520 reset controller"
>> +	depends on ARCH_THEAD || COMPILE_TEST
>> +	select REGMAP_MMIO
>> +	help
>> +	  This driver provides support for the T-HEAD TH1520 SoC reset controller,
>> +	  which manages hardware reset lines for SoC components such as the GPU.
>> +	  Enable this option if you need to control hardware resets on TH1520-based
>> +	  systems.
>> +
>>  config RESET_TI_SCI
>>  	tristate "TI System Control Interface (TI-SCI) reset driver"
>>  	depends on TI_SCI_PROTOCOL || (COMPILE_TEST && TI_SCI_PROTOCOL=n)
>> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
>> index 677c4d1e2632..d6c2774407ae 100644
>> --- a/drivers/reset/Makefile
>> +++ b/drivers/reset/Makefile
>> @@ -35,6 +35,7 @@ obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
>>  obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
>>  obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
>>  obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
>> +obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
>>  obj-$(CONFIG_RESET_TI_SCI) += reset-ti-sci.o
>>  obj-$(CONFIG_RESET_TI_SYSCON) += reset-ti-syscon.o
>>  obj-$(CONFIG_RESET_TI_TPS380X) += reset-tps380x.o
>> diff --git a/drivers/reset/reset-th1520.c b/drivers/reset/reset-th1520.c
>> new file mode 100644
>> index 000000000000..d6816c86ba95
>> --- /dev/null
>> +++ b/drivers/reset/reset-th1520.c
>> @@ -0,0 +1,141 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
>> + * Author: Michal Wilczynski <m.wilczynski@samsung.com>
>> + */
>> +
>> +#include <linux/of.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/reset-controller.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/reset/thead,th1520-reset.h>
>> +
>> + /* register offset in VOSYS_REGMAP */
>> +#define TH1520_GPU_RST_CFG		0x0
>> +#define TH1520_GPU_RST_CFG_MASK		GENMASK(1, 0)
>> +
>> +/* register values */
>> +#define TH1520_GPU_SW_GPU_RST		BIT(0)
>> +#define TH1520_GPU_SW_CLKGEN_RST	BIT(1)
>> +
>> +struct th1520_reset_priv {
>> +	struct reset_controller_dev rcdev;
>> +	struct regmap *map;
>> +};
>> +
>> +struct th1520_reset_map {
>> +	u32 bit;
>> +	u32 reg;
>> +};
>> +
>> +static const struct th1520_reset_map th1520_resets[] = {
>> +	[TH1520_RESET_ID_GPU] = {
>> +		.bit = TH1520_GPU_SW_GPU_RST,
>> +		.reg = TH1520_GPU_RST_CFG,
>> +	},
>> +	[TH1520_RESET_ID_GPU_CLKGEN] = {
>> +		.bit = TH1520_GPU_SW_CLKGEN_RST,
>> +		.reg = TH1520_GPU_RST_CFG,
>> +	}
> 
> I expect the NPU and WDT resets will be added to this list later?

Thanks! Yes, the NPU and WDT resets will be added later. For now, we’re
hoping to merge the current patchset as it has already grown quite a
bit.

I'll be back from my time off at the beginning of March and will re-send
the series with fixes for any remaining issues.

> 
>> +};
>> +
>> +static inline struct th1520_reset_priv *
>> +to_th1520_reset(struct reset_controller_dev *rcdev)
>> +{
>> +	return container_of(rcdev, struct th1520_reset_priv, rcdev);
>> +}
>> +
>> +static int th1520_reset_assert(struct reset_controller_dev *rcdev,
>> +			       unsigned long id)
>> +{
>> +	struct th1520_reset_priv *priv = to_th1520_reset(rcdev);
>> +	const struct th1520_reset_map *reset;
>> +
>> +	if (id >= ARRAY_SIZE(th1520_resets))
>> +		return -EINVAL;
> 
> This check is not necessary. The core will have checked this in
> of_reset_simple_xlate() before returning the reset control.
> 
>> +
>> +	reset = &th1520_resets[id];
>> +
>> +	return regmap_update_bits(priv->map, reset->reg, reset->bit, 0);
>> +}
>> +
>> +static int th1520_reset_deassert(struct reset_controller_dev *rcdev,
>> +				 unsigned long id)
>> +{
>> +	struct th1520_reset_priv *priv = to_th1520_reset(rcdev);
>> +	const struct th1520_reset_map *reset;
>> +
>> +	if (id >= ARRAY_SIZE(th1520_resets))
>> +		return -EINVAL;
> 
> This check is not necessary.
> 
>> +
>> +	reset = &th1520_resets[id];
>> +
>> +	return regmap_update_bits(priv->map, reset->reg, reset->bit,
>> +				  reset->bit);
>> +}
>> +
>> +static const struct reset_control_ops th1520_reset_ops = {
>> +	.assert	= th1520_reset_assert,
>> +	.deassert = th1520_reset_deassert,
>> +};
>> +
>> +static const struct regmap_config th1520_reset_regmap_config = {
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>> +	.reg_stride = 4,
>> +	.fast_io = true,
>> +};
>> +
>> +static int th1520_reset_probe(struct platform_device *pdev)
>> +{
>> +	struct device *dev = &pdev->dev;
>> +	struct th1520_reset_priv *priv;
>> +	void __iomem *base;
>> +	int ret;
>> +
>> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	base = devm_platform_ioremap_resource(pdev, 0);
>> +	if (IS_ERR(base))
>> +		return PTR_ERR(base);
>> +
>> +	priv->map = devm_regmap_init_mmio(dev, base,
>> +					  &th1520_reset_regmap_config);
>> +	if (IS_ERR(priv->map))
>> +		return PTR_ERR(priv->map);
>> +
>> +	/* Initialize GPU resets to asserted state */
>> +	ret = regmap_update_bits(priv->map, TH1520_GPU_RST_CFG,
>> +				 TH1520_GPU_RST_CFG_MASK, 0);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv->rcdev.owner = THIS_MODULE;
>> +	priv->rcdev.nr_resets = 2;
> 
> Better use ARRAY_SIZE(th1520_resets) here, this will simplify adding
> further resets in the future. With that,
> 
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> 
> regards
> Philipp
> 
