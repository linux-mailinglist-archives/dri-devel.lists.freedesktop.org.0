Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9427C9A98CD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 07:43:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863CF10E029;
	Tue, 22 Oct 2024 05:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CVQzIT3Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F3A10E029
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 05:43:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 77C65A40793;
 Tue, 22 Oct 2024 05:43:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C1A1C4CEC3;
 Tue, 22 Oct 2024 05:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729575831;
 bh=GwxDxDoeyBK62Hochtj/t2RR/Cl82p6Om5xIRuyQs0s=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=CVQzIT3Qp8oOeEpx5K1XZO7DkJkuUMZ4X+vkYJFS9LTFWGUA9VVm8nsNQBviwNrzi
 LtiPlGQ7Mip/sXrlr6vYg1BGmG2lnNadQI2SzvH6662qFdMPJYnfol8nKI03O2LT0u
 DEL1sdN0ZtsXfaiRq/u/gW8/fMR9JZl8gONjFAcesiQJe3yMCUALB3hjfxsJJv9jR2
 ud30fWXMjZIW3R2NDfj4PbRrXF/Zm+X6HUuelRMUNOHmzL/ZfTPj4xaGLttiabxJjf
 Nd1xp9wAQyxiWChqgesdv54lBwrbAYQ1y4hrL8Z125aUzgAgnFfITeb1Ob7mUkRNPE
 yrJi04ZvtPstQ==
Message-ID: <3fe52ed8-aeb2-49d9-9b81-b6cd53b83425@kernel.org>
Date: Tue, 22 Oct 2024 07:43:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/10] media: platform: mediatek: add isp_7x cam-raw
 unit
To: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Konig <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, yaya.chang@mediatek.com,
 teddy.chen@mediatek.com, hidenorik@chromium.org, yunkec@chromium.org,
 shun-yi.wang@mediatek.com
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
 <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241009111551.27052-5-Shu-hsiang.Yang@mediatek.com>
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

On 09/10/2024 13:15, Shu-hsiang Yang wrote:
> Introduces the ISP pipeline driver for the MediaTek ISP raw and yuv
> modules. Key functionalities include data processing, V4L2 integration,
> resource management, debug support, and various control operations.
> Additionally, IRQ handling, platform device management, and MediaTek
> ISP DMA format support are also included.
> 
> Signed-off-by: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>

...

> +
> +static int mtk_yuv_of_probe(struct platform_device *pdev,
> +			    struct mtk_yuv_device *drvdata)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct resource *res;
> +	int irq, ret;
> +	int n_clks;
> +
> +	ret = of_property_read_u32(dev->of_node, "mediatek,cam-id",
> +				   &drvdata->id);
> +	if (ret) {
> +		dev_dbg(dev, "missing camid property\n");

Debug? Or error?

> +		return ret;
> +	}
> +
> +	if (dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34))) {
> +		dev_err(dev, "%s: No suitable DMA available\n", __func__);
> +		return -EIO;
> +	}
> +
> +	if (!dev->dma_parms) {
> +		dev->dma_parms =
> +			devm_kzalloc(dev, sizeof(*dev->dma_parms), GFP_KERNEL);
> +		if (!dev->dma_parms)
> +			return -ENOMEM;
> +	}
> +
> +	dma_set_max_seg_size(dev, UINT_MAX);
> +
> +	/* base outer register */
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "base");
> +	if (!res) {
> +		dev_err(dev, "failed to get mem\n");
> +		return -ENODEV;
> +	}
> +
> +	drvdata->base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(drvdata->base)) {
> +		dev_dbg(dev, "failed to map register base\n");

Dbg? What?

> +		return PTR_ERR(drvdata->base);
> +	}
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0) {
> +		dev_err(dev, "failed to get irq\n");
> +		return -ENODEV;
> +	}
> +
> +	ret = devm_request_irq(dev, irq, mtk_irq_yuv, 0,
> +			       dev_name(dev), drvdata);
> +	if (ret) {
> +		dev_err(dev, "failed to request irq=%d\n", irq);
> +		return ret;
> +	}
> +	dev_dbg(dev, "registered irq=%d\n", irq);

Drop

> +
> +	n_clks = devm_clk_bulk_get_all(dev, &drvdata->clk_b);
> +	if (n_clks < 0) {
> +		dev_err(dev, "failed to devm_clk_bulk_get_all=%d\n", n_clks);

Syntax is: return dev_err_probe()

> +		return n_clks;
> +	}
> +
> +	drvdata->num_clks = n_clks;
> +	dev_info(dev, "clk_num:%d\n", drvdata->num_clks);

Drop

> +
> +#ifdef CONFIG_PM_SLEEP
> +	drvdata->pm_notifier.notifier_call = yuv_pm_notifier;
> +	ret = register_pm_notifier(&drvdata->pm_notifier);
> +	if (ret) {
> +		dev_err(dev, "failed to register notifier block.\n");
> +		return ret;
> +	}
> +#endif
> +
> +	return 0;
> +}
> +
> +static int mtk_yuv_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_yuv_device *drvdata;
> +	struct v4l2_subdev *sd;
> +	int ret;
> +
> +	dev_dbg(dev, "camsys | start %s\n", __func__);

NAK

> +
> +	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
> +	if (!drvdata)
> +		return -ENOMEM;
> +
> +	drvdata->dev = dev;
> +	dev_set_drvdata(dev, drvdata);
> +
> +	ret = mtk_yuv_of_probe(pdev, drvdata);
> +	if (ret) {
> +		dev_info(dev, "mtk_yuv_of_probe failed\n");

NAK. Neither info nor proper for memory allocation errors. Drop.

> +		return ret;
> +	}
> +
> +	/* register yuv as mtk_cam async child */
> +	sd = &drvdata->subdev;
> +	v4l2_subdev_init(sd, &mtk_raw_subdev_ops);
> +	sd->internal_ops = &mtk_raw_subdev_internal_ops;
> +	snprintf(sd->name, sizeof(sd->name), "%s",
> +		 of_node_full_name(dev->of_node));
> +	sd->dev = dev;
> +	sd->owner = THIS_MODULE;
> +
> +	ret = v4l2_async_register_subdev(sd);
> +	if (ret) {
> +		dev_err(dev, "%s failed on async_register_subdev\n", __func__);
> +		return ret;
> +	}
> +
> +	pm_runtime_enable(dev);
> +
> +	dev_info(dev, "camsys | [%s] success\n", __func__);

NAK

> +
> +	return 0;
> +}
> +
> +static void mtk_yuv_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct mtk_yuv_device *yuv_dev = dev_get_drvdata(dev);
> +	struct v4l2_subdev *sd = &yuv_dev->subdev;
> +
> +	dev_dbg(dev, "camsys | start %s\n", __func__);

NAK

> +
> +	unregister_pm_notifier(&yuv_dev->pm_notifier);
> +
> +	pm_runtime_disable(dev);
> +
> +	v4l2_async_unregister_subdev(sd);
> +}
> +
> +/* driver for yuv part */
> +static int mtk_yuv_runtime_suspend(struct device *dev)
> +{
> +	struct mtk_yuv_device *drvdata = dev_get_drvdata(dev);
> +
> +	dev_info(dev, "%s:disable clock\n", __func__);

NAK

> +
> +	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clk_b);
> +
> +	return 0;
> +}
> +
> +static int mtk_yuv_runtime_resume(struct device *dev)
> +{
> +	struct mtk_yuv_device *drvdata = dev_get_drvdata(dev);
> +	int ret;
> +
> +	dev_info(dev, "%s:enable clock\n", __func__);

NAK. Not even dev_dbg. Please don't ever post such code.


> +
> +	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clk_b);
> +	if (ret) {
> +		dev_info(dev, "failed at clk_bulk_prepare_enable, ret = %d\n", ret);
> +		clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clk_b);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops mtk_yuv_pm_ops = {
> +	SET_RUNTIME_PM_OPS(mtk_yuv_runtime_suspend, mtk_yuv_runtime_resume,
> +			   NULL)
> +};
> +
> +static const struct of_device_id mtk_yuv_of_ids[] = {
> +	{.compatible = "mediatek,cam-yuv",},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, mtk_yuv_of_ids);
> +
> +struct platform_driver mtk_cam_yuv_driver = {
> +	.probe   = mtk_yuv_probe,
> +	.remove  = mtk_yuv_remove,
> +	.driver  = {
> +		.name  = "mtk-cam yuv",
> +		.of_match_table = of_match_ptr(mtk_yuv_of_ids),

Drop of_match_ptr(), you will have here warnings.

> +		.pm     = &mtk_yuv_pm_ops,
> +	}
> +};

...



> diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_camera-v4l2-controls.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_camera-v4l2-controls.h
> new file mode 100644
> index 000000000000..b775e6c30aa1
> --- /dev/null
> +++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_camera-v4l2-controls.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_CAMERA_V4l2_CONTROLS_H
> +#define __MTK_CAMERA_V4l2_CONTROLS_H
> +
> +#include <linux/videodev2.h>
> +#include <linux/v4l2-controls.h>
> +#include <linux/mtkisp_camsys.h>

How these headers are used here? I don't see. Don't include unrelated
stuff in your files.

> +
> +/* Allowed value of V4L2_CID_MTK_CAM_RAW_PATH_SELECT */
> +#define V4L2_MTK_CAM_RAW_PATH_SELECT_BPC	1
> +#define V4L2_MTK_CAM_RAW_PATH_SELECT_FUS	3
> +#define V4L2_MTK_CAM_RAW_PATH_SELECT_DGN	4
> +#define V4L2_MTK_CAM_RAW_PATH_SELECT_LSC	5
> +#define V4L2_MTK_CAM_RAW_PATH_SELECT_LTM	7
> +
> +#define V4L2_MBUS_FRAMEFMT_PAD_ENABLE  BIT(1)


Best regards,
Krzysztof

