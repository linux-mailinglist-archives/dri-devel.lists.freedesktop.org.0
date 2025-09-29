Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6451ABA92FB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 14:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3332B10E3F2;
	Mon, 29 Sep 2025 12:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="F7lKlwBA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8F2D10E414
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 12:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759148563;
 bh=s5IQXqEcgAB5VpUChLCFtweMuTiZxaapht5zwbbuklY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=F7lKlwBA2xIrBex81Up74ZUNZGw4qX5gUCi+Dh9YKgYIMYcYyv90sIuAz8roPE3NL
 Pk4KLMxmlZXcc4kUXhbsDiJSnu8aMIJS4z6lOhYXV2G1DTkXXYxWuCQnpkxzKZ3qMQ
 ZtVA/PIRVMT2tCCSy4+CCyGxwwwQMawpUQNGsSx+av1hmy0+lyZID1xsK3iFETfWp4
 1ARZc/6BjPBam2pbarmowwjQjwBMFhMdQPrEQv3LvUwz6cQhefYpAkjPW0aD1uri6/
 TKzyFF4KdlwwnfBw6YvIqcYsp8BST7Wy/ferbgvbenWF9591Mc+wxBs2LQFugRzHEQ
 uW9QrTXf5WT5Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id D716317E129E;
 Mon, 29 Sep 2025 14:22:42 +0200 (CEST)
Message-ID: <c968c7c7-83b8-49ee-b1a5-b8551d855df4@collabora.com>
Date: Mon, 29 Sep 2025 14:22:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/7] pmdomain: mediatek: Add support for MFlexGraphics
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org
References: <20250929-mt8196-gpufreq-v5-0-3056e5ecf765@collabora.com>
 <20250929-mt8196-gpufreq-v5-7-3056e5ecf765@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250929-mt8196-gpufreq-v5-7-3056e5ecf765@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 29/09/25 09:46, Nicolas Frattaroli ha scritto:
> Various MediaTek SoCs use GPU integration silicon named "MFlexGraphics"
> by MediaTek. On the MT8196 and MT6991 SoCs, interacting with this
> integration silicon is required to power on the GPU.
> 
> This glue silicon is in the form of an embedded microcontroller running
> special-purpose firmware, which autonomously adjusts clocks and
> regulators.
> 
> Implement a driver, modelled as a pmdomain driver with a
> set_performance_state operation, to support these SoCs.
> 
> The driver also exposes the actual achieved clock rate, as read back
> from the MCU, as common clock framework clocks, by acting as a clock
> provider as well.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>   drivers/pmdomain/mediatek/Kconfig            |  16 +
>   drivers/pmdomain/mediatek/Makefile           |   1 +
>   drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c | 954 +++++++++++++++++++++++++++
>   3 files changed, 971 insertions(+)
> 
> diff --git a/drivers/pmdomain/mediatek/Kconfig b/drivers/pmdomain/mediatek/Kconfig
> index 0e34a517ab7d5a867bebaab11c0d866282a15e45..b06aaa9690f08f33519595916b8ea3ad9035fc55 100644
> --- a/drivers/pmdomain/mediatek/Kconfig
> +++ b/drivers/pmdomain/mediatek/Kconfig
> @@ -26,6 +26,22 @@ config MTK_SCPSYS_PM_DOMAINS
>   	  Control Processor System (SCPSYS) has several power management related
>   	  tasks in the system.
>   
> +config MTK_MFG_PM_DOMAIN
> +	bool "MediaTek MFlexGraphics power domain"
> +	default ARCH_MEDIATEK
> +	depends on PM
> +	depends on OF
> +	depends on COMMON_CLK
> +	select PM_GENERIC_DOMAINS
> +	imply MTK_GPUEB_MBOX
> +	help
> +	  Say y or m here to enable the power domains driver for MediaTek
> +	  MFlexGraphics. This driver allows for power and frequency control of
> +	  GPUs on MediaTek SoCs such as the MT8196 or MT6991.
> +
> +	  This driver is required for the Mali GPU to work at all on MT8196 and
> +	  MT6991.
> +
>   config AIROHA_CPU_PM_DOMAIN
>   	tristate "Airoha CPU power domain"
>   	default ARCH_AIROHA
> diff --git a/drivers/pmdomain/mediatek/Makefile b/drivers/pmdomain/mediatek/Makefile
> index 18ba92e3c418154e1d428dbc6b59b97b26056d98..b424f1ed867604393b3ff96364855363aedaa40c 100644
> --- a/drivers/pmdomain/mediatek/Makefile
> +++ b/drivers/pmdomain/mediatek/Makefile
> @@ -1,4 +1,5 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_MTK_MFG_PM_DOMAIN)		+= mtk-mfg-pmdomain.o
>   obj-$(CONFIG_MTK_SCPSYS)		+= mtk-scpsys.o
>   obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) 	+= mtk-pm-domains.o
>   obj-$(CONFIG_AIROHA_CPU_PM_DOMAIN) 	+= airoha-cpu-pmdomain.o
> diff --git a/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..ba8e493b15edf6f5648deb9bddbc5d63fe0ba43b
> --- /dev/null
> +++ b/drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c
> @@ -0,0 +1,954 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Driver for MediaTek MFlexGraphics Devices
> + *
> + * Copyright (C) 2025, Collabora Ltd.
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/container_of.h>
> +#include <linux/iopoll.h>
> +#include <linux/mailbox_client.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/overflow.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +#include <linux/pm_opp.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/units.h>
> +

..snip..


> +
> +static int mtk_mfg_eb_on(struct mtk_mfg *mfg)
> +{
> +	struct device *dev = &mfg->pdev->dev;
> +	u32 val;
> +	int ret;
> +
> +	/*
> +	 * If MFG is already on from e.g. the bootloader, we should skip doing

we ... who?

> +	 * the power-on sequence, as it wouldn't work without powering it off
> +	 * first.
> +	 */
> +	if (mtk_mfg_is_powered_on(mfg))
> +		return 0;
> +
> +	ret = readl_poll_timeout(mfg->rpc + RPC_GHPM_RO0_CON, val,
> +				 !(val & (GHPM_PWR_STATE_M | GHPM_STATE_M)),
> +				 GPUEB_POLL_US, GPUEB_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "timed out waiting for EB to power on\n");
> +		return ret;
> +	}
> +
> +	mtk_mfg_update_reg_bits(mfg->rpc + mfg->ghpm_en_reg, GHPM_ENABLE_M,
> +				GHPM_ENABLE_M);
> +
> +	mtk_mfg_update_reg_bits(mfg->rpc + RPC_GHPM_CFG0_CON, GHPM_ON_SEQ_M, 0);
> +	mtk_mfg_update_reg_bits(mfg->rpc + RPC_GHPM_CFG0_CON, GHPM_ON_SEQ_M,
> +				GHPM_ON_SEQ_M);
> +
> +	mtk_mfg_update_reg_bits(mfg->rpc + mfg->ghpm_en_reg, GHPM_ENABLE_M, 0);
> +
> +
> +	ret = readl_poll_timeout(mfg->rpc + RPC_PWR_CON, val,
> +				 (val & PWR_ACK_M) == PWR_ACK_M,
> +				 GPUEB_POLL_US, GPUEB_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "timed out waiting for EB power ack, val = 0x%X\n",
> +			val);
> +		return ret;
> +	}
> +
> +	ret = readl_poll_timeout(mfg->gpr + GPR_LP_STATE, val,
> +				 (val == EB_ON_RESUME),
> +				 GPUEB_POLL_US, GPUEB_TIMEOUT_US);
> +	if (ret) {
> +		dev_err(dev, "timed out waiting for EB to resume, status = 0x%X\n", val);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_mfg_eb_off(struct mtk_mfg *mfg)
> +{
> +	struct device *dev = &mfg->pdev->dev;
> +	struct mtk_mfg_ipi_sleep_msg msg = {
> +		.event = 0,
> +		.state = 0,
> +		.magic = GPUEB_SLEEP_MAGIC
> +	};
> +	u32 val;
> +	int ret;
> +
> +	ret = mbox_send_message(mfg->slp_mbox->ch, &msg);
> +	if (ret < 0) {
> +		dev_err(dev, "Cannot send sleep command: %pe\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	ret = readl_poll_timeout(mfg->rpc + RPC_PWR_CON, val,
> +				 !(val & PWR_ACK_M), GPUEB_POLL_US,
> +				 GPUEB_TIMEOUT_US);
> +
> +	if (ret)
> +		dev_err(dev, "Timed out waiting for EB to power off, val=0x%08X\n", val);

Please be consistent with mtk_mfg_eb_on (and with everything else, actually).

	if (ret) {
		dev_err...
		return ret
	}

	return 0;

> +
> +	return ret;
> +}
> +

..snip..

> +static int mtk_mfg_set_performance(struct generic_pm_domain *pd,
> +				   unsigned int state)
> +{
> +	struct mtk_mfg *mfg = mtk_mfg_from_genpd(pd);
> +
> +	/*
> +	 * pmdomain core intentionally sets a performance state before turning
> +	 * a domain on, and after turning it off. We don't want to act on those,

We..... who?!?!?!

> +	 * as we only want to set performance states while the domain is on, and

again, who's "we"? :-)

> +	 * can simply defer setting whatever the pmdomain subsystem thinks we

here we go again, who's that group of people? :-)

> +	 * should be at when powering it on.
> +	 */

Code comments shall be declarative: you describe an action or code behavior - you
have to explain a reason, not "who".

Example:

The pmdomain code intentionally sets a performance state both before turning
on a power domain and after turning it off. However, in the case of MediaTek
EB, the performance states can only be set while the controller is powered ON.
If any performance request comes while it is OFF, return cleanly without
taking any immediate action and defer setting the performance level until
the next poweron.

There's no "we", and describes all of reason, intention and intended code flow. :-)


> +	if (mfg->pd.status != GENPD_STATE_ON)
> +		return 0;
> +
> +	return mtk_mfg_set_oppidx(mfg, state);
> +}
> +
> +static int mtk_mfg_power_on(struct generic_pm_domain *pd)
> +{
> +	struct mtk_mfg *mfg = mtk_mfg_from_genpd(pd);
> +	int ret;
> +
> +	ret = regulator_bulk_enable(mfg->variant->num_regulators,
> +				    mfg->gpu_regs);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(mfg->clk_eb);
> +	if (ret)
> +		goto err_disable_regulators;
> +
> +	ret = clk_bulk_prepare_enable(mfg->variant->num_clks, mfg->gpu_clks);
> +	if (ret)
> +		goto err_disable_eb_clk;
> +
> +	ret = mtk_mfg_eb_on(mfg);
> +	if (ret)
> +		goto err_disable_clks;
> +
> +	mfg->ipi_magic = readl(mfg->gpr + GPR_IPI_MAGIC);
> +
> +	ret = mtk_mfg_power_control(mfg, true);
> +	if (ret)
> +		goto err_eb_off;
> +
> +	/* Don't try to set a OPP in probe before we have the OPPs */
> +	if (mfg->gpu_opps) {
> +		/* The aforementioned deferred setting of pmdomain's state */
> +		ret = mtk_mfg_set_oppidx(mfg, pd->performance_state);
> +		if (ret)
> +			dev_warn(&mfg->pdev->dev, "Failed to set oppidx in %s\n", __func__);
> +	}
> +
> +	return 0;
> +
> +err_eb_off:
> +	mtk_mfg_eb_off(mfg);
> +err_disable_clks:
> +	clk_bulk_disable_unprepare(mfg->variant->num_clks, mfg->gpu_clks);
> +err_disable_eb_clk:
> +	clk_disable_unprepare(mfg->clk_eb);
> +err_disable_regulators:
> +	regulator_bulk_disable(mfg->variant->num_regulators, mfg->gpu_regs);
> +
> +	return ret;
> +}
> +
> +static int mtk_mfg_power_off(struct generic_pm_domain *pd)
> +{
> +	struct mtk_mfg *mfg = mtk_mfg_from_genpd(pd);
> +	struct device *dev = &mfg->pdev->dev;
> +	int ret;
> +
> +	ret = mtk_mfg_power_control(mfg, false);
> +	if (ret) {
> +		dev_err(dev, "power_control failed: %pe\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	ret = mtk_mfg_eb_off(mfg);
> +	if (ret) {
> +		dev_err(dev, "eb_off failed: %pe\n", ERR_PTR(ret));
> +		return ret;
> +	}
> +
> +	clk_bulk_disable_unprepare(mfg->variant->num_clks, mfg->gpu_clks);
> +	clk_disable_unprepare(mfg->clk_eb);
> +	return regulator_bulk_disable(mfg->variant->num_regulators, mfg->gpu_regs);
> +}
> +
> +static int mtk_mfg_init_mbox(struct mtk_mfg *mfg)
> +{
> +	struct device *dev = &mfg->pdev->dev;
> +	struct mtk_mfg_mbox *gf;
> +	struct mtk_mfg_mbox *slp;
> +
> +	gf = devm_kzalloc(dev, sizeof(*gf), GFP_KERNEL);
> +	if (!gf)
> +		return -ENOMEM;

Please aggregate the allocations together. This doesn't guarantee that the
memory locations are sequential and that's not the target.

The target here is to improve readability, so...

gf = devm_kzalloc(...)
error_check
gf->rx_data = devm_kzalloc(...)
error_check

Then, you can either go with initialization and registration of gf, or you
can allocate slp here.

so, either:
- gf and gf->rx_data allocation
   - gf->mfg, gf.cl assignment
   - mbox_request_channel_byname(gf)
- slp allocation
   - slp->mfg, slp->cl assignment
   - mbox_request_channel_byname(slp)

or

- gf and gf->rx_data allocation
- slp allocation
- gf->mfg, gf.cl assignment
- mbox_request_channel_byname(gf)
   - slp->mfg, slp->cl assignment
- mbox_request_channel_byname(slp)

Honestly, though - I'd go for the first.

> +
> +	slp = devm_kzalloc(dev, sizeof(*slp), GFP_KERNEL);
> +	if (!slp)
> +		return -ENOMEM;
> +
> +	gf->mfg = mfg;
> +	init_completion(&gf->rx_done);
> +	gf->cl.dev = dev;
> +	gf->cl.rx_callback = mtk_mfg_mbox_rx_callback;
> +	gf->cl.tx_tout = GPUEB_TIMEOUT_US / USEC_PER_MSEC;
> +	gf->rx_data = devm_kzalloc(dev, GPUEB_MBOX_MAX_RX_SIZE, GFP_KERNEL);
> +	if (!gf->rx_data)
> +		return -ENOMEM;
> +	gf->ch = mbox_request_channel_byname(&gf->cl, "gpufreq");
> +	if (IS_ERR(gf->ch))
> +		return PTR_ERR(gf->ch);
> +
> +	mfg->gf_mbox = gf;
> +
> +	slp->mfg = mfg;
> +	init_completion(&slp->rx_done);
> +	slp->cl.dev = dev;
> +	slp->cl.tx_tout = GPUEB_TIMEOUT_US / USEC_PER_MSEC;
> +	slp->cl.tx_block = true;
> +	slp->ch = mbox_request_channel_byname(&slp->cl, "sleep");
> +	if (IS_ERR(slp->ch))
> +		return PTR_ERR(slp->ch);
> +
> +	mfg->slp_mbox = slp;
> +
> +	return 0;
> +}
> +

..snip..

> +
> +static int mtk_mfg_probe(struct platform_device *pdev)
> +{
> +	struct device_node *shmem __free(device_node);
> +	struct mtk_mfg *mfg;
> +	struct device *dev = &pdev->dev;
> +	const struct mtk_mfg_variant *data = of_device_get_match_data(dev);
> +	struct resource res;
> +	int ret, i;
> +
> +	mfg = devm_kzalloc(dev, sizeof(*mfg), GFP_KERNEL);
> +	if (!mfg)
> +		return -ENOMEM;
> +
> +	mfg->pdev = pdev;
> +	mfg->variant = data;
> +
> +	dev_set_drvdata(dev, mfg);
> +
> +	mfg->gpr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(mfg->gpr))
> +		return dev_err_probe(dev, PTR_ERR(mfg->gpr),
> +				     "Could not retrieve GPR MMIO registers\n");
> +
> +	mfg->rpc = devm_platform_ioremap_resource(pdev, 1);
> +	if (IS_ERR(mfg->rpc))
> +		return dev_err_probe(dev, PTR_ERR(mfg->rpc),
> +				     "Could not retrieve RPC MMIO registers\n");
> +
> +	mfg->clk_eb = devm_clk_get(dev, "eb");
> +	if (IS_ERR(mfg->clk_eb))
> +		return dev_err_probe(dev, PTR_ERR(mfg->clk_eb),
> +				     "Could not get 'eb' clock\n");
> +
> +	mfg->gpu_clks = devm_kcalloc(dev, data->num_clks, sizeof(*mfg->gpu_clks),
> +				     GFP_KERNEL);
> +	if (!mfg->gpu_clks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < data->num_clks; i++)
> +		mfg->gpu_clks[i].id = data->clk_names[i];
> +
> +	ret = devm_clk_bulk_get(dev, data->num_clks, mfg->gpu_clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "couldn't get GPU clocks\n");
> +
> +	mfg->gpu_regs = devm_kcalloc(dev, data->num_regulators,
> +				     sizeof(*mfg->gpu_regs), GFP_KERNEL);
> +	if (!mfg->gpu_regs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < data->num_regulators; i++)
> +		mfg->gpu_regs[i].supply = data->regulator_names[i];
> +
> +	ret = devm_regulator_bulk_get(dev, data->num_regulators, mfg->gpu_regs);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "couldn't get GPU regulators\n");
> +
> +	ret = of_reserved_mem_region_to_resource(dev->of_node, 0, &res);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to get GPUEB shared memory\n");

Good job! ...though, the dev_err_probe call fits in one line just fine (87 columns
is ok)

> +
> +	mfg->shared_mem = devm_ioremap(dev, res.start, resource_size(&res));
> +	if (!mfg->shared_mem)
> +		return dev_err_probe(dev, -EADDRNOTAVAIL,
> +				     "failed to ioremap GPUEB shared memory\n");

-EADDRNOTAVAIL == Cannot assign requested address (and that's in the networking
sense of it).

If devm_ioremap fails, you're most likely out of memory, because we can give for
granted that the phys addr is validated from the get go.

Just go with -ENOMEM then - and besides, fits in one line if you say instead:

return dev_err_probe(dev, -ENOMEM, "cannot ioremap GPUEB shared mem\n");

> +	mfg->shared_mem_size = resource_size(&res);
> +	mfg->shared_mem_phys = res.start;
> +
> +	if (data->init) {
> +		ret = data->init(mfg);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "Variant init failed\n");
> +	}
> +
> +	mfg->pd.name = dev_name(dev);
> +	mfg->pd.attach_dev = mtk_mfg_attach_dev;
> +	mfg->pd.detach_dev = mtk_mfg_detach_dev;
> +	mfg->pd.power_off = mtk_mfg_power_off;
> +	mfg->pd.power_on = mtk_mfg_power_on;
> +	mfg->pd.set_performance_state = mtk_mfg_set_performance;
> +	mfg->pd.flags = GENPD_FLAG_OPP_TABLE_FW;
> +
> +	ret = pm_genpd_init(&mfg->pd, NULL, false);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to initialise power domain\n");
> +
> +	ret = clk_prepare_enable(mfg->clk_eb);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to turn on EB clock\n");
> +
> +	ret = mtk_mfg_init_mbox(mfg);
> +	if (ret) {
> +		clk_disable_unprepare(mfg->clk_eb);
> +		return dev_err_probe(dev, ret, "Couldn't initialise mailbox\n");
> +	}
> +

Can you please add a comment here, explaining that mtk_mfg_power_on() is also
responsible for turning on all of the necessary clocks, hence it raises the
refcount of clk_eb?

All that so it becomes clear that there you're not disabling the clk_eb clock
but only lowering the refcount.

Saying that because while reviewing this code, after reaching the `out` label
the first thing that came to mind was "there we go, unclocked access" - but then
after 30 seconds I realized that the clocks are left on by the call to function
mtk_mfg_power_on().

A very brief comment explaining what's going on wouldn't have saved those 30
seconds because this is a review, but it would save those to the next person
reading a driver that is upstream anyway.

Of course, no strong opinions about having the comment, this is just a suggestion.

> +	ret = mtk_mfg_power_on(&mfg->pd);
> +	clk_disable_unprepare(mfg->clk_eb);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to power on MFG\n");
> +
> +	ret = mtk_mfg_init_shared_mem(mfg);
> +	if (ret) {
> +		dev_err(dev, "Couldn't initialize EB shared memory: %pe\n", ERR_PTR(ret));

Why is this dev_err and not dev_err_probe?

I get that the return value is already set, but nothing prevents you from calling
dev_err_probe() without assigning the result to anything.

	if (ret) {
		dev_err_probe(dev, ret, "Couldn't initialize EB shared memory\n");
		goto out;
	}

At least - we get the probe error prints consistent :-)

> +		goto out;
> +	}
> +
> +	ret = mtk_mfg_read_opp_tables(mfg);
> +	if (ret) {
> +		dev_err(dev, "Error reading OPP tables from EB: %pe\n",
> +			ERR_PTR(ret));

dev_err_probe.

> +		goto out;
> +	}
> +
> +	ret = mtk_mfg_init_clk_provider(mfg);
> +	if (ret)
> +		goto out;
> +
> +	ret = of_genpd_add_provider_simple(dev->of_node, &mfg->pd);
> +	if (ret) {
> +		ret = dev_err_probe(dev, ret, "Failed to add pmdomain provider\n");

Please avoid this redundant assignment.

> +		goto out;
> +	}
> +
> +	return 0;
> +

Everything else looks good to me - so after fixing this I'm confident that you'll
get my R-b tag on this commit.

Cheers,
Angelo


> +out:
> +	mtk_mfg_power_off(&mfg->pd);
> +	return ret;
> +}
> +
> +static const struct of_device_id mtk_mfg_of_match[] = {
> +	{ .compatible = "mediatek,mt8196-gpufreq", .data = &mtk_mfg_mt8196_variant },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mtk_mfg_of_match);
> +
> +static void mtk_mfg_remove(struct platform_device *pdev)
> +{
> +	struct mtk_mfg *mfg = dev_get_drvdata(&pdev->dev);
> +
> +	if (mtk_mfg_is_powered_on(mfg))
> +		mtk_mfg_power_off(&mfg->pd);
> +
> +	of_genpd_del_provider(pdev->dev.of_node);
> +	pm_genpd_remove(&mfg->pd);
> +
> +	mbox_free_channel(mfg->gf_mbox->ch);
> +	mfg->gf_mbox->ch = NULL;
> +
> +	mbox_free_channel(mfg->slp_mbox->ch);
> +	mfg->slp_mbox->ch = NULL;
> +}
> +
> +static struct platform_driver mtk_mfg_driver = {
> +	.driver = {
> +		.name = "mtk-mfg-pmdomain",
> +		.of_match_table = mtk_mfg_of_match,
> +		.suppress_bind_attrs = true,
> +	},
> +	.probe = mtk_mfg_probe,
> +	.remove = mtk_mfg_remove,
> +};
> +module_platform_driver(mtk_mfg_driver);
> +
> +MODULE_AUTHOR("Nicolas Frattaroli <nicolas.frattaroli@collabora.com>");
> +MODULE_DESCRIPTION("MediaTek MFlexGraphics Power Domain Driver");
> +MODULE_LICENSE("GPL");
> 

