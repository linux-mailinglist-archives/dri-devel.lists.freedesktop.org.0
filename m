Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DE51734F9
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 11:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4F81890EF;
	Fri, 28 Feb 2020 10:07:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 14507890EF
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 10:07:41 +0000 (UTC)
X-UUID: 0ec4a2220662443b863fd358cded835e-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1DhT26Nw0ev4Fr8ahrt98NxVPN2Jg/ECXsapb7EkmRI=; 
 b=HtrLp0Fn/52njlsl7gP4qX/rtdjoWM3Yx5sAZb02xfx13B6XMjhW2GRxxZ1QEn5fRsNCeJ1dIXrb1LeGxJqkuBUieJpcVZvnWdYZ+nUcqKo/fcC/CfQNoZKj82PlQKj4vPBihy3rEzou/j8HSQupuH3lJdKG9VAOCF+v+jzFRtU=;
X-UUID: 0ec4a2220662443b863fd358cded835e-20200228
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1660331952; Fri, 28 Feb 2020 18:07:38 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 18:06:43 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 28 Feb 2020 18:07:36 +0800
Message-ID: <1582884456.25698.0.camel@mtksdaap41>
Subject: Re: [PATCH v10 5/5] soc / drm: mediatek: Fix mediatek-drm device
 probing
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Fri, 28 Feb 2020 18:07:36 +0800
In-Reply-To: <20200227180858.1514157-6-enric.balletbo@collabora.com>
References: <20200227180858.1514157-1-enric.balletbo@collabora.com>
 <20200227180858.1514157-6-enric.balletbo@collabora.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora
 Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya
 Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Allison Randal <allison@lohutok.net>,
 Matthias Brugger <mbrugger@suse.com>, sboyd@kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Enric:

On Thu, 2020-02-27 at 19:08 +0100, Enric Balletbo i Serra wrote:
> In the actual implementation the same compatible string
> "mediatek,<chip>-mmsys" is used to bind the clock drivers
> (drivers/soc/mediatek) as well as to the gpu driver
> (drivers/gpu/drm/mediatek/mtk_drm_drv.c). This ends with the problem
> that the only probed driver is the clock driver and there is no display
> at all.
> 
> In any case having the same compatible string for two drivers is not
> correct and should be fixed. To fix this, and maintain backward
> compatibility, we can consider that the mmsys driver is the top-level
> entry point for the multimedia subsystem, so is not a pure clock
> controller but a system controller, and the drm driver is instantiated
> by that MMSYS driver.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v10:
> - Match driver data to get display routing.
> 
> Changes in v9:
> - Do not move the display routing from the drm driver (CK)
> 
> Changes in v8:
> - New patch introduced in this series.
> 
> Changes in v7: None
> 
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 31 ++++++++++++++++----------
>  drivers/soc/mediatek/mtk-mmsys.c       |  6 +++++
>  2 files changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 02011d3168df..29252fc0aab7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -422,9 +422,21 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>  	{ }
>  };
>  
> +static const struct of_device_id mtk_drm_of_ids[] = {
> +	{ .compatible = "mediatek,mt2701-mmsys",
> +	  .data = &mt2701_mmsys_driver_data},
> +	{ .compatible = "mediatek,mt2712-mmsys",
> +	  .data = &mt2712_mmsys_driver_data},
> +	{ .compatible = "mediatek,mt8173-mmsys",
> +	  .data = &mt8173_mmsys_driver_data},
> +	{ }
> +};
> +
>  static int mtk_drm_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> +	struct device_node *phandle = dev->parent->of_node;
> +	const struct of_device_id *of_id;
>  	struct mtk_drm_private *private;
>  	struct device_node *node;
>  	struct component_match *match = NULL;
> @@ -443,8 +455,14 @@ static int mtk_drm_probe(struct platform_device *pdev)
>  		return -ENODEV;
>  	}
>  
> +	of_id = of_match_node(mtk_drm_of_ids, phandle);
> +	if (!of_id)
> +		return -ENODEV;
> +
> +	private->data = of_id->data;
> +
>  	/* Iterate over sibling DISP function blocks */
> -	for_each_child_of_node(dev->of_node->parent, node) {
> +	for_each_child_of_node(phandle->parent, node) {
>  		const struct of_device_id *of_id;
>  		enum mtk_ddp_comp_type comp_type;
>  		int comp_id;
> @@ -576,22 +594,11 @@ static int mtk_drm_sys_resume(struct device *dev)
>  static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
>  			 mtk_drm_sys_resume);
>  
> -static const struct of_device_id mtk_drm_of_ids[] = {
> -	{ .compatible = "mediatek,mt2701-mmsys",
> -	  .data = &mt2701_mmsys_driver_data},
> -	{ .compatible = "mediatek,mt2712-mmsys",
> -	  .data = &mt2712_mmsys_driver_data},
> -	{ .compatible = "mediatek,mt8173-mmsys",
> -	  .data = &mt8173_mmsys_driver_data},
> -	{ }
> -};
> -
>  static struct platform_driver mtk_drm_platform_driver = {
>  	.probe	= mtk_drm_probe,
>  	.remove	= mtk_drm_remove,
>  	.driver	= {
>  		.name	= "mediatek-drm",
> -		.of_match_table = mtk_drm_of_ids,
>  		.pm     = &mtk_drm_pm_ops,
>  	},
>  };
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index a8a98777064e..d99c8beb2ed2 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -377,6 +377,7 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>  	const struct mtk_mmsys_driver_data *data;
>  	struct clk_onecell_data *clk_data;
>  	struct device *dev = &pdev->dev;
> +	struct platform_device *drm;
>  	void __iomem *config_regs;
>  	struct resource *mem;
>  	int ret;
> @@ -407,6 +408,11 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	drm = platform_device_register_data(&pdev->dev, "mediatek-drm",
> +					    PLATFORM_DEVID_NONE, NULL, 0);
> +	if (IS_ERR(drm))
> +		return PTR_ERR(drm);
> +
>  	return 0;
>  }
>  

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
