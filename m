Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2A494E69C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 08:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8926A10E0E0;
	Mon, 12 Aug 2024 06:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fpCt6tRT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 363EA10E0E0
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 06:30:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7DA2260ED8;
 Mon, 12 Aug 2024 06:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC2EC32782;
 Mon, 12 Aug 2024 06:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723444229;
 bh=1kDfnqYKqD/qFUN18LfI9j1JYvbLoJ+As5yqStFl0qU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fpCt6tRTGKVFzYcJrmbhhkP8eJOQq/rVru8bR5gmNc2aFEWIzXbEE42NF4ndv9A07
 i/b4++0zyaS3I2H/Nvm2ZYJCVtX4EKOGLOs89RVdUj2eJYnJFBafOcUu61olf7ZO2M
 3Pl1lIJUwxYHxnY6pLAoRaWM0Zq12fnH7q/ZPhuK4stCCImppiX8eaXGCWGWEFZEMW
 ILR3fOxtZjNF/uNHnrSmdAiXTOpSQFEBNJp6MdwO28c/LX9EeGweboRl+El3MzU6bK
 GRG8qzG/q+OjS12Sa5cSKcJRMgkrEihMAyIrugVTN+cLIT6KGLO1N9fTsBlr09UnqL
 x6b8GL10UWdmw==
Message-ID: <06d627d5-947c-4da4-826a-76033386b575@kernel.org>
Date: Mon, 12 Aug 2024 08:30:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] mtd: rawnand: nuvoton: add new driver for the Nuvoton
 MA35 SoC
To: Hui-Ping Chen <hpchen0nvt@gmail.com>, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, sumit.semwal@linaro.org, christian.koenig@amd.com,
 esben@geanix.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
References: <20240812030045.20831-1-hpchen0nvt@gmail.com>
 <20240812030045.20831-3-hpchen0nvt@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240812030045.20831-3-hpchen0nvt@gmail.com>
Content-Type: text/plain; charset=UTF-8
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

On 12/08/2024 05:00, Hui-Ping Chen wrote:
> Nuvoton MA35 SoCs NAND Flash Interface Controller
> supports 2KB, 4KB and 8KB page size, and up to 8-bit,
> 12-bit, and 24-bit hardware ECC calculation circuit
> to protect data communication.
> 
> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
> ---
>  drivers/mtd/nand/raw/Kconfig               |    8 +
>  drivers/mtd/nand/raw/Makefile              |    1 +
>  drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c | 1109 ++++++++++++++++++++
>  3 files changed, 1118 insertions(+)
>  create mode 100644 drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c
> 
> diff --git a/drivers/mtd/nand/raw/Kconfig b/drivers/mtd/nand/raw/Kconfig
> index 614257308516..932bf2215470 100644
> --- a/drivers/mtd/nand/raw/Kconfig
> +++ b/drivers/mtd/nand/raw/Kconfig
> @@ -448,6 +448,14 @@ config MTD_NAND_RENESAS
>  	  Enables support for the NAND controller found on Renesas R-Car
>  	  Gen3 and RZ/N1 SoC families.
>  
> +config MTD_NAND_NVT_MA35
> +	tristate "Nuvoton MA35 SoC NAND controller"
> +	depends on ARCH_MA35 || COMPILE_TEST
> +	depends on OF
> +	help
> +	  Enables support for the NAND controller found on
> +	  the Nuvoton MA35 series SoCs.
> +
>  comment "Misc"
>  
>  config MTD_SM_COMMON
> diff --git a/drivers/mtd/nand/raw/Makefile b/drivers/mtd/nand/raw/Makefile
> index 25120a4afada..cdfdfee3f5f3 100644
> --- a/drivers/mtd/nand/raw/Makefile
> +++ b/drivers/mtd/nand/raw/Makefile
> @@ -57,6 +57,7 @@ obj-$(CONFIG_MTD_NAND_INTEL_LGM)	+= intel-nand-controller.o
>  obj-$(CONFIG_MTD_NAND_ROCKCHIP)		+= rockchip-nand-controller.o
>  obj-$(CONFIG_MTD_NAND_PL35X)		+= pl35x-nand-controller.o
>  obj-$(CONFIG_MTD_NAND_RENESAS)		+= renesas-nand-controller.o
> +obj-$(CONFIG_MTD_NAND_NVT_MA35)	+= nuvoton_ma35d1_nand.o
>  
>  nand-objs := nand_base.o nand_legacy.o nand_bbt.o nand_timings.o nand_ids.o
>  nand-objs += nand_onfi.o
> diff --git a/drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c b/drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c
> new file mode 100644
> index 000000000000..7445eb489c38
> --- /dev/null
> +++ b/drivers/mtd/nand/raw/nuvoton_ma35d1_nand.c
> @@ -0,0 +1,1109 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +#include <linux/slab.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/delay.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/of.h>
> +
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/mtd/rawnand.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dmaengine.h>
> +
> +/* NFI DMA Registers */
> +#define MA35_NFI_REG_BUFFER0		(0x000)
> +#define MA35_NFI_REG_DMACTL		(0x400)
> +#define   DMA_EN				BIT(0)
> +#define   DMA_RST				BIT(1)
> +#define   DMA_BUSY				BIT(9)
> +
> +#define MA35_NFI_REG_DMASA		(0x408)
> +#define MA35_NFI_REG_DMABCNT		(0x40C)
> +#define MA35_NFI_REG_DMAINTEN		(0x410)
> +#define MA35_NFI_REG_DMAINTSTS	(0x414)
> +
> +/* NFI Global Registers */
> +#define MA35_NFI_REG_GCTL		(0x800)
> +#define   NAND_EN				BIT(3)
> +#define MA35_NFI_REG_GINTEN		(0x804)
> +#define MA35_NFI_REG_GINTSTS		(0x808)
> +
> +/* NAND-type Flash Registers */
> +#define MA35_NFI_REG_NANDCTL		(0x8A0)
> +#define   SWRST				BIT(0)
> +#define   DMA_W_EN				BIT(1)
> +#define   DMA_R_EN				BIT(2)
> +#define   ECC_CHK				BIT(7)
> +#define   PROT3BEN				BIT(8)
> +#define   PSIZE_2K				(1 << 16)
> +#define   PSIZE_4K				(2 << 16)
> +#define   PSIZE_8K				(3 << 16)
> +#define   PSIZE_MASK				(3 << 16)
> +#define   BCH_T24				BIT(18)
> +#define   BCH_T8				BIT(20)
> +#define   BCH_T12				BIT(21)
> +#define   BCH_MASK				(0x1f << 18)
> +#define   ECC_EN				BIT(23)
> +#define   DISABLE_CS0				BIT(25)
> +
> +#define MA35_NFI_REG_NANDTMCTL	(0x8A4)
> +#define MA35_NFI_REG_NANDINTEN	(0x8A8)
> +#define MA35_NFI_REG_NANDINTSTS	(0x8AC)
> +#define   INT_DMA				BIT(0)
> +#define   INT_ECC				BIT(2)
> +#define   INT_RB0				BIT(10)
> +#define   INT_RB0_STS				BIT(18)
> +
> +#define MA35_NFI_REG_NANDCMD		(0x8B0)
> +#define MA35_NFI_REG_NANDADDR		(0x8B4)
> +#define   ENDADDR				BIT(31)
> +
> +#define MA35_NFI_REG_NANDDATA		(0x8B8)
> +#define MA35_NFI_REG_NANDRACTL	(0x8BC)
> +#define MA35_NFI_REG_NANDECTL		(0x8C0)
> +#define   ENABLE_WP				(0x0)
> +#define   DISABLE_WP				BIT(0)
> +
> +#define MA35_NFI_REG_NANDECCES0	(0x8D0)
> +#define   ECC_STATUS_MASK			(0x3)
> +#define   ECC_ERR_CNT_MASK			(0x1f)
> +
> +#define MA35_NFI_REG_NANDECCES1	(0x8D4)
> +#define MA35_NFI_REG_NANDECCES2	(0x8D8)
> +#define MA35_NFI_REG_NANDECCES3	(0x8DC)
> +
> +/* NAND-type Flash BCH Error Address Registers */
> +#define MA35_NFI_REG_NANDECCEA0	(0x900)
> +#define MA35_NFI_REG_NANDECCEA1	(0x904)
> +#define MA35_NFI_REG_NANDECCEA2	(0x908)
> +#define MA35_NFI_REG_NANDECCEA3	(0x90C)
> +#define MA35_NFI_REG_NANDECCEA4	(0x910)
> +#define MA35_NFI_REG_NANDECCEA5	(0x914)
> +#define MA35_NFI_REG_NANDECCEA6	(0x918)
> +#define MA35_NFI_REG_NANDECCEA7	(0x91C)
> +#define MA35_NFI_REG_NANDECCEA8	(0x920)
> +#define MA35_NFI_REG_NANDECCEA9	(0x924)
> +#define MA35_NFI_REG_NANDECCEA10	(0x928)
> +#define MA35_NFI_REG_NANDECCEA11	(0x92C)
> +
> +/* NAND-type Flash BCH Error Data Registers */
> +#define MA35_NFI_REG_NANDECCED0	(0x960)
> +#define MA35_NFI_REG_NANDECCED1	(0x964)
> +#define MA35_NFI_REG_NANDECCED2	(0x968)
> +#define MA35_NFI_REG_NANDECCED3	(0x96C)
> +#define MA35_NFI_REG_NANDECCED4	(0x970)
> +#define MA35_NFI_REG_NANDECCED5	(0x974)
> +
> +/* NAND-type Flash Redundant Area Registers */
> +#define MA35_NFI_REG_NANDRA0		(0xA00)
> +#define MA35_NFI_REG_NANDRA1		(0xA04)
> +
> +#define SKIP_SPARE_BYTES	4
> +
> +/* BCH algorithm related constants and variables */
> +enum {
> +	eBCH_NONE = 0,
> +	eBCH_T8,
> +	eBCH_T12,
> +	eBCH_T24,
> +	eBCH_CNT
> +} E_BCHALGORITHM;
> +
> +static const int g_i32BCHAlgoIdx[eBCH_CNT] = {BCH_T8, BCH_T8, BCH_T12, BCH_T24};
> +static struct nand_ecclayout_user ma35_nand_oob;

Why this is file-scope?

> +static const int g_i32ParityNum[3][eBCH_CNT] = {


This is not a Linux coding style. Do not send Windows or some other
platform-independent patches to review.


> +	{0,  60,  92,  90},  /* for 2K */
> +	{0, 120, 184, 180},  /* for 4K */
> +	{0, 240, 368, 360},  /* for 8K */
> +};
> +
> +
> +struct ma35_nand_info {
> +	struct nand_controller controller;
> +	struct device *dev;
> +	void __iomem *regs;
> +	int irq;
> +	struct clk *clk;
> +	struct completion complete;
> +
> +	struct mtd_info mtd;
> +	struct nand_chip chip;
> +	struct mtd_partition *parts;
> +	int nr_parts;
> +
> +	int eBCHAlgo;

No, use Linux coding style.

> +	u8 *dma_buf;
> +	spinlock_t dma_lock;
> +	dma_addr_t dma_addr;
> +};
> +
> +static int ma35_ooblayout_ecc(struct mtd_info *mtd, int section,
> +			      struct mtd_oob_region *oobregion)
> +{
> +	struct nand_chip *chip = mtd_to_nand(mtd);
> +	struct nand_ecc_ctrl *ecc = &chip->ecc;
> +
> +	if (section || !ecc->total)
> +		return -ERANGE;
> +
> +	oobregion->length = ecc->total;
> +	oobregion->offset = mtd->oobsize - oobregion->length;
> +
> +	return 0;
> +}

... this code looks poor, really poor.

> +}
> +
> +static int ma35_nfi_correct(struct nand_chip *chip, unsigned long addr)
> +{
> +	struct ma35_nand_info *nand = nand_get_controller_data(chip);
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	int uStatus, i, j, i32FieldNum = 0;
> +	int uReportErrCnt = 0;
> +	int uErrorCnt = 0;
> +

More of weird coding style. Use Linux coding style. Patch is for Linux.

> +	if ((readl(nand->regs + MA35_NFI_REG_NANDCTL) & BCH_MASK) == BCH_T24)
> +		i32FieldNum = mtd->writesize / 1024;
> +	else
> +		i32FieldNum = mtd->writesize / 512;


...

> +static int ma35_nand_probe(struct platform_device *pdev)
> +{
> +	struct ma35_nand_info *nand;
> +	struct nand_chip *chip;
> +	struct mtd_info *mtd;
> +	int retval = 0;
> +
> +	nand = devm_kzalloc(&pdev->dev, sizeof(struct ma35_nand_info), GFP_KERNEL);

sizeof(*)

> +	if (!nand)
> +		return -ENOMEM;
> +
> +	nand_controller_init(&nand->controller);
> +
> +	nand->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(nand->regs))
> +		return PTR_ERR(nand->regs);
> +
> +	nand->dev = &pdev->dev;
> +	chip = &nand->chip;
> +	mtd = nand_to_mtd(chip);
> +	nand_set_controller_data(chip, nand);
> +	nand_set_flash_node(chip, pdev->dev.of_node);
> +
> +	mtd->priv = chip;
> +	mtd->owner = THIS_MODULE;
> +	mtd->dev.parent = &pdev->dev;
> +
> +	nand->clk = of_clk_get(pdev->dev.of_node, 0);

No, no. That's not how you get a clock. Use devm_clk_get().

> +	if (IS_ERR(nand->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(nand->clk),
> +				     "failed to find nand clock\n");
> +
> +	retval = clk_prepare_enable(nand->clk);
> +	if (retval < 0) {
> +		dev_err(&pdev->dev, "Failed to enable clock\n");
> +		return -ENXIO;
> +	}
> +
> +	nand->chip.controller    = &nand->controller;
> +
> +	chip->legacy.cmdfunc     = ma35_nand_command;
> +	chip->legacy.waitfunc    = ma35_waitfunc;
> +	chip->legacy.read_byte   = ma35_nand_read_byte;
> +	chip->legacy.select_chip = ma35_nand_select_chip;
> +	chip->legacy.read_buf    = ma35_read_buf_dma;
> +	chip->legacy.write_buf   = ma35_write_buf_dma;
> +	chip->legacy.dev_ready   = ma35_nand_devready;
> +	chip->legacy.chip_delay  = 25; /* us */
> +
> +	/* Read OOB data first, then HW read page */
> +	chip->ecc.hwctl      = ma35_nand_enable_hwecc;
> +	chip->ecc.calculate  = ma35_nand_calculate_ecc;
> +	chip->ecc.correct    = ma35_nand_correct_data;
> +	chip->ecc.write_page = ma35_nand_write_page_hwecc;
> +	chip->ecc.read_page  = ma35_nand_read_page_hwecc_oob_first;
> +	chip->ecc.read_oob   = ma35_nand_read_oob_hwecc;
> +	chip->options |= (NAND_NO_SUBPAGE_WRITE | NAND_USES_DMA);
> +
> +	ma35_nand_initialize(nand);
> +	platform_set_drvdata(pdev, nand);
> +
> +	nand->controller.ops = &ma35_nand_controller_ops;
> +
> +	nand->irq = platform_get_irq(pdev, 0);
> +	if (nand->irq < 0) {
> +		dev_err(&pdev->dev, "failed to get platform irq\n");

Syntax is return dev_err_probe

> +		return -EINVAL;
> +	}
> +
> +	if (request_irq(nand->irq, (irq_handler_t)&ma35_nand_irq,
> +			IRQF_TRIGGER_HIGH, "ma35d1-nand", nand)) {
> +		dev_err(&pdev->dev, "Error requesting NAND IRQ\n");
> +		return -ENXIO;
> +	}
> +
> +	retval = nand_scan(chip, 1);
> +	if (retval)
> +		return retval;
> +
> +	if (mtd_device_register(mtd, nand->parts, nand->nr_parts)) {
> +		nand_cleanup(chip);
> +		devm_kfree(&pdev->dev, nand);
> +		return retval;
> +	}
> +
> +	pr_info("ma35-nfi: registered successfully! mtdid=%s\n", mtd->name);

Drop, does not help.

Drivers do not use pr_xxx anyway. Why your code is so inconsistent? It's
like random junk glued together.

> +
> +	return retval;
> +}
> +
> +static void ma35_nand_remove(struct platform_device *pdev)
> +{
> +	struct ma35_nand_info *nand = platform_get_drvdata(pdev);
> +	struct nand_chip *chip = &nand->chip;
> +	int ret;
> +
> +	ret = mtd_device_unregister(nand_to_mtd(chip));
> +	WARN_ON(ret);
> +	nand_cleanup(chip);
> +
> +	clk_disable_unprepare(nand->clk);
> +
> +	kfree(nand);
> +	platform_set_drvdata(pdev, NULL);
> +}
> +
> +/* PM Support */
> +#ifdef CONFIG_PM
> +static int ma35_nand_suspend(struct platform_device *pdev, pm_message_t pm)
> +{
> +	struct ma35_nand_info *nand = platform_get_drvdata(pdev);
> +	unsigned long timeo = jiffies + HZ/2;
> +
> +	/* wait DMAC to ready */
> +	while (1) {
> +		if ((readl(nand->regs + MA35_NFI_REG_DMACTL) & DMA_BUSY) == 0)
> +			break;
> +		if (time_after(jiffies, timeo))
> +			return -ETIMEDOUT;
> +	}
> +
> +	clk_disable(nand->clk);
> +
> +	return 0;
> +}
> +
> +static int ma35_nand_resume(struct platform_device *pdev)
> +{
> +	struct ma35_nand_info *nand = platform_get_drvdata(pdev);
> +
> +	clk_enable(nand->clk);
> +	ma35_nand_hwecc_init(nand);
> +	ma35_nand_dmac_init(nand);
> +
> +	return 0;
> +}
> +
> +#else
> +#define ma35_nand_suspend NULL
> +#define ma35_nand_resume NULL
> +#endif
> +
> +static const struct of_device_id ma35_nfi_of_match[] = {
> +	{ .compatible = "nuvoton,ma35d1-nand" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, ma35_nfi_of_match);
> +
> +static struct platform_driver ma35_nand_driver = {
> +		.driver = {
> +		.name   = "ma35d1-nand",
> +		.owner  = THIS_MODULE,
> +		.of_match_table = of_match_ptr(ma35_nfi_of_match),

Drop of_match_ptr. You have warnings here.

> +		},
> +		.probe = ma35_nand_probe,
> +		.remove_new = ma35_nand_remove,
> +		.suspend = ma35_nand_suspend,
> +		.resume = ma35_nand_resume,
> +};
> +
> +static int __init ma35_nand_init(void)
> +{
> +	int ret;
> +
> +	pr_info("ma35 mtd nand driver\n");

NAK, drop, useless and really pointless.

> +
> +	ret = platform_driver_register(&ma35_nand_driver);
> +	if (ret) {
> +		pr_warn("nand: failed to add device driver %s\n",
> +			ma35_nand_driver.driver.name);
> +		return ret;
> +	}
> +
> +	return ret;
> +}
> +
> +static void __exit ma35_nand_exit(void)
> +{
> +	platform_driver_unregister(&ma35_nand_driver);
> +	pr_info("nand: unregistered successfully!\n");

NAK, drop, useless and really pointless.

> +}
> +
> +module_init(ma35_nand_init);
> +module_exit(ma35_nand_exit);

Do not open-code these functions, there are wrappers for this.

> +
> +MODULE_DESCRIPTION("Nuvoton ma35 NAND driver");
> +MODULE_AUTHOR("Hui-Ping Chen <hpchen0nvt@gmail.com>");
> +MODULE_LICENSE("GPL");

Best regards,
Krzysztof

