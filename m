Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8DE55BD03
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 03:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9853310E825;
	Tue, 28 Jun 2022 01:35:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C699210E754
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 01:35:47 +0000 (UTC)
X-UUID: 3fdf9f6aa0a64d638968139384fe12cc-20220628
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7, REQID:27914aab-7319-4e3b-8b9b-f4b78e19947e, OB:0,
 LO
 B:30,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:50
X-CID-INFO: VERSION:1.1.7, REQID:27914aab-7319-4e3b-8b9b-f4b78e19947e, OB:0,
 LOB:
 30,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:50
X-CID-META: VersionHash:87442a2, CLOUDID:49b8fdd5-5d6d-4eaf-a635-828a3ee48b7c,
 C
 OID:045ffb814135,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 3fdf9f6aa0a64d638968139384fe12cc-20220628
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1637222878; Tue, 28 Jun 2022 09:35:44 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 28 Jun 2022 09:35:43 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jun 2022 09:35:43 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jun 2022 09:35:43 +0800
Message-ID: <4c74f395d42152470c317965813180a3a4616d13.camel@mediatek.com>
Subject: Re: [PATCH v23 05/14] drm/mediatek: add display merge start/stop
 API for cmdq support
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Tue, 28 Jun 2022 09:35:43 +0800
In-Reply-To: <20220620091930.27797-6-nancy.lin@mediatek.com>
References: <20220620091930.27797-1-nancy.lin@mediatek.com>
 <20220620091930.27797-6-nancy.lin@mediatek.com>
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
> Add merge start/stop API for cmdq support. The ovl_adaptor merges
> are configured with each drm plane update. Need to enable/disable
> merge with cmdq making sure all the settings taken effect in the
> same vblank.

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
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h   |  2 ++
>  drivers/gpu/drm/mediatek/mtk_disp_merge.c | 18 +++++++++++++++---
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index e847e90f436d..33e61a136bbc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -66,6 +66,8 @@ void mtk_merge_stop(struct device *dev);
>  void mtk_merge_advance_config(struct device *dev, unsigned int l_w,
> unsigned int r_w,
>  			      unsigned int h, unsigned int vrefresh,
> unsigned int bpc,
>  			      struct cmdq_pkt *cmdq_pkt);
> +void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt
> *cmdq_pkt);
> +void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt
> *cmdq_pkt);
>  
>  void mtk_ovl_bgclr_in_on(struct device *dev);
>  void mtk_ovl_bgclr_in_off(struct device *dev);
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> index 40da0555416d..c7af5ccab916 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> @@ -67,17 +67,29 @@ struct mtk_disp_merge {
>  };
>  
>  void mtk_merge_start(struct device *dev)
> +{
> +	mtk_merge_start_cmdq(dev, NULL);
> +}
> +
> +void mtk_merge_stop(struct device *dev)
> +{
> +	mtk_merge_stop_cmdq(dev, NULL);
> +}
> +
> +void mtk_merge_start_cmdq(struct device *dev, struct cmdq_pkt
> *cmdq_pkt)
>  {
>  	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
>  
> -	writel(MERGE_EN, priv->regs + DISP_REG_MERGE_CTRL);
> +	mtk_ddp_write(cmdq_pkt, 1, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_MERGE_CTRL);
>  }
>  
> -void mtk_merge_stop(struct device *dev)
> +void mtk_merge_stop_cmdq(struct device *dev, struct cmdq_pkt
> *cmdq_pkt)
>  {
>  	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
>  
> -	writel(0x0, priv->regs + DISP_REG_MERGE_CTRL);
> +	mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs,
> +		      DISP_REG_MERGE_CTRL);
>  }
>  
>  static void mtk_merge_fifo_setting(struct mtk_disp_merge *priv,

