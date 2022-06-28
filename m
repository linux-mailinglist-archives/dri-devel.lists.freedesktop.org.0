Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7195155BD07
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 03:38:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF95A10E1F2;
	Tue, 28 Jun 2022 01:38:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA67F10E1F2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 01:38:04 +0000 (UTC)
X-UUID: c866ff08342c4b9cace1d2c94e394864-20220628
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7, REQID:ef4bf89d-eb2f-4a90-9f22-8a9b2476a896, OB:0,
 LO
 B:10,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:45
X-CID-INFO: VERSION:1.1.7, REQID:ef4bf89d-eb2f-4a90-9f22-8a9b2476a896, OB:0,
 LOB:
 10,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-META: VersionHash:87442a2, CLOUDID:e6c8fdd5-5d6d-4eaf-a635-828a3ee48b7c,
 C
 OID:e8416156aa42,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: c866ff08342c4b9cace1d2c94e394864-20220628
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1640626052; Tue, 28 Jun 2022 09:38:00 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 28 Jun 2022 09:37:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jun 2022 09:37:58 +0800
Message-ID: <e58b55e1992ce37f35491f90cf7ccfb419a739e2.camel@mediatek.com>
Subject: Re: [PATCH v23 06/14] drm/mediatek: add display merge mute/unmute
 support for MT8195
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Tue, 28 Jun 2022 09:37:58 +0800
In-Reply-To: <20220620091930.27797-7-nancy.lin@mediatek.com>
References: <20220620091930.27797-1-nancy.lin@mediatek.com>
 <20220620091930.27797-7-nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

On Mon, 2022-06-20 at 17:19 +0800, Nancy.Lin wrote:
> Add merge mute/unmute setting for MT8195.
> MT8195 Vdosys1 merge1~merge4 support HW mute function.

Applied to mediatek-drm-next [1], thanks.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Regards,
CK

> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> index c7af5ccab916..2e13d2fb429e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -58,12 +58,15 @@
>  #define FLD_PREULTRA_TH_LOW			GENMASK(15, 0)
>  #define FLD_PREULTRA_TH_HIGH			GENMASK(31, 16)
>  
> +#define DISP_REG_MERGE_MUTE_0		0xf00
> +
>  struct mtk_disp_merge {
>  	void __iomem			*regs;
>  	struct clk			*clk;
>  	struct clk			*async_clk;
>  	struct cmdq_client_reg		cmdq_reg;
>  	bool				fifo_en;
> +	bool				mute_support;
>  };
>  
>  void mtk_merge_start(struct device *dev)
> @@ -80,6 +83,10 @@ void mtk_merge_start_cmdq(struct device *dev,
> struct cmdq_pkt *cmdq_pkt)
>  {
>  	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
>  
> +	if (priv->mute_support)
> +		mtk_ddp_write(cmdq_pkt, 0x0, &priv->cmdq_reg, priv-
> >regs,
> +			      DISP_REG_MERGE_MUTE_0);
> +
>  	mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
>  		      DISP_REG_MERGE_CTRL);
>  }
> @@ -88,6 +95,10 @@ void mtk_merge_stop_cmdq(struct device *dev,
> struct cmdq_pkt *cmdq_pkt)
>  {
>  	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
>  
> +	if (priv->mute_support)
> +		mtk_ddp_write(cmdq_pkt, 0x1, &priv->cmdq_reg, priv-
> >regs,
> +			      DISP_REG_MERGE_MUTE_0);
> +
>  	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
>  		      DISP_REG_MERGE_CTRL);
>  }
> @@ -262,6 +273,8 @@ static int mtk_disp_merge_probe(struct
> platform_device *pdev)
>  	priv->fifo_en = of_property_read_bool(dev->of_node,
>  					      "mediatek,merge-fifo-
> en");
>  
> +	priv->mute_support = of_property_read_bool(dev->of_node,
> +						   "mediatek,merge-
> mute");
>  	platform_set_drvdata(pdev, priv);
>  
>  	ret = component_add(dev, &mtk_disp_merge_component_ops);

