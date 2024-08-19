Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0AD1956931
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 13:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBD4410E242;
	Mon, 19 Aug 2024 11:19:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB0F10E242
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 11:19:05 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-428243f928cso33391515e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 04:19:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724066344; x=1724671144;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sunZvLa92UkOqmspgUhzvam8WEnzIrC7wUHtIu/3w/s=;
 b=ht84aeB1cuCg3/KwMhAQ4lpQaUxgVhGAheqTiLdNhByD+HRIUnNvj2+3Pkkg05cTWM
 aR3OisWfBJkbpFiv2C72Y8FlZ5HBMFD4tT1N0JiPjukuXD25OENJzEbgNlQrBh2JTZMy
 vmMMaXJN5xrWmpdGu57Lfp9ksVRlH0zdPzO3iAjlnZYqexVmmWf9rKyvhJc7mndLlRg9
 6l5y2ZbMoV6nqgMxdbjzRfTI+42xVZooxt3tAf01QZk3ir3B8xHXJZ8cALtSzpPNYXoy
 DvGxcTLpvhPLz9iPdZjrPndXMrHRwOuT2UIBjh5f6lz7N5l3Reu+0pSww1Kqu9NP+x6e
 Oe9w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7tQZ+PTKqEugHCQY0k63jki17suOX0vl1D74JNvj+QDtTnsKaU9HbPGj/i7jtZgBS5O7n863K/wAr2iQrMXBKXO+q/Sa3vxjkOKvPgfpl
X-Gm-Message-State: AOJu0YyGu0WdXwSVS9BueqVcSnjxvQb1Xt2YNNPuKmfvoRgifa4Tu9pd
 pAI/lpqkwFs6KcZ3+Gp+i2EYSvJbSWmC46Fj6WYP2w8NFyZXcB7f
X-Google-Smtp-Source: AGHT+IHaE9BF0jWCsttsJkk+nv01MgngSkrhSoHa6kJlxiNainzPGo+JdtiEbmikHeT4Y6nIhCEvdA==
X-Received: by 2002:a05:600c:3152:b0:427:dae6:8416 with SMTP id
 5b1f17b1804b1-429ed7d3583mr63636465e9.36.1724066343511; 
 Mon, 19 Aug 2024 04:19:03 -0700 (PDT)
Received: from krzk-bin ([178.197.215.209])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-429ed648f55sm106525695e9.3.2024.08.19.04.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2024 04:19:02 -0700 (PDT)
Date: Mon, 19 Aug 2024 13:19:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hui-Ping Chen <hpchen0nvt@gmail.com>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, esben@geanix.com,
 linux-arm-kernel@lists.infradead.org, 
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: Re: [PATCH v2 2/2] mtd: rawnand: nuvoton: add new driver for the
 Nuvoton MA35 SoC
Message-ID: <t7igmxzylpem6qbasb2esnren743m4dnzw6j3i7vn3dveubu5n@4sy6mmmlhtw3>
References: <20240819092037.110260-1-hpchen0nvt@gmail.com>
 <20240819092037.110260-3-hpchen0nvt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240819092037.110260-3-hpchen0nvt@gmail.com>
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

On Mon, Aug 19, 2024 at 09:20:37AM +0000, Hui-Ping Chen wrote:
> Nuvoton MA35 SoCs NAND Flash Interface Controller
> supports 2KB, 4KB and 8KB page size, and up to 8-bit,
> 12-bit, and 24-bit hardware ECC calculation circuit
> to protect data communication.
> 
> Signed-off-by: Hui-Ping Chen <hpchen0nvt@gmail.com>
...

> +static int ma35_nand_probe(struct platform_device *pdev)
> +{
> +	struct ma35_nand_info *nand;
> +	struct nand_chip *chip;
> +	struct mtd_info *mtd;
> +	int retval = 0;
> +
> +	nand = devm_kzalloc(&pdev->dev, sizeof(*nand), GFP_KERNEL);
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
> +	nand->clk = devm_clk_get(&pdev->dev, "nand_gate");
> +	if (IS_ERR(nand->clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(nand->clk),
> +				     "failed to find nand clock\n");
> +
> +	retval = clk_prepare_enable(nand->clk);
> +	if (retval < 0) {
> +		dev_err(&pdev->dev, "failed to enable clock\n");
> +		retval = -ENXIO;
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
> +	if (nand->irq < 0)
> +		return dev_err_probe(&pdev->dev, nand->irq,
> +				     "failed to get platform irq\n");
> +
> +	if (request_irq(nand->irq, ma35_nand_irq, IRQF_TRIGGER_HIGH, "ma35d1-nand", nand)) {
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
> +	return retval;
> +}
> +
> +static void ma35_nand_remove(struct platform_device *pdev)
> +{
> +	struct ma35_nand_info *nand = platform_get_drvdata(pdev);
> +	struct nand_chip *chip = &nand->chip;
> +	int ret;
> +

Where do you release IRQ handler?

> +	ret = mtd_device_unregister(nand_to_mtd(chip));
> +	WARN_ON(ret);
> +	nand_cleanup(chip);
> +
> +	clk_disable_unprepare(nand->clk);
> +
> +	kfree(nand);

NAK, you never tested your code.

> +	platform_set_drvdata(pdev, NULL);

Why? Drop.

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

Messed indentation.

> +		.name   = "ma35d1-nand",
> +		.owner  = THIS_MODULE,

Drop. Please do not upstream some 10 year old code... Use recent code as
template, not 10yo stuff...

Best regards,
Krzysztof

