Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A79655196BA
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 07:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D370B11217C;
	Wed,  4 May 2022 05:05:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C55D011217C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 05:05:29 +0000 (UTC)
X-UUID: 3933d28452bf4d65a5ad49e94a66acee-20220504
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:d28a3d8d-d83e-432b-8ea9-57e405c41ac2, OB:0,
 LO
 B:10,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:53
X-CID-INFO: VERSION:1.1.4, REQID:d28a3d8d-d83e-432b-8ea9-57e405c41ac2, OB:0,
 LOB:
 10,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:53
X-CID-META: VersionHash:faefae9, CLOUDID:d09ca12f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:8492e884c8a8,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,File:nil
 ,QS:0,BEC:nil
X-UUID: 3933d28452bf4d65a5ad49e94a66acee-20220504
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1363498504; Wed, 04 May 2022 13:05:25 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 4 May 2022 13:05:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 4 May 2022 13:05:23 +0800
Message-ID: <dd0648c549886a82156dabf73335d396df292628.camel@mediatek.com>
Subject: Re: [PATCH v19 07/25] soc: mediatek: add mtk-mmsys config API for
 mt8195 vdosys1
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Wed, 4 May 2022 13:05:23 +0800
In-Reply-To: <20220503102345.22817-8-nancy.lin@mediatek.com>
References: <20220503102345.22817-1-nancy.lin@mediatek.com>
 <20220503102345.22817-8-nancy.lin@mediatek.com>
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

On Tue, 2022-05-03 at 18:23 +0800, Nancy.Lin wrote:
> Add four mmsys config APIs. The config APIs are used for config
> mmsys reg. Some mmsys regs need to be set according to the
> HW engine binding to the mmsys simultaneously.
> 
> 1. mtk_mmsys_merge_async_config: config merge async width/height.
>    async is used for cross-clock domain synchronization.
> 2. mtk_mmsys_hdr_confing: config hdr backend async width/height.
> 3. mtk_mmsys_mixer_in_config and mtk_mmsys_mixer_in_config:
>    config mixer related settings.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/soc/mediatek/mt8195-mmsys.h    |  6 +++++
>  drivers/soc/mediatek/mtk-mmsys.c       | 35
> ++++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mmsys.h |  9 +++++++
>  3 files changed, 50 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> b/drivers/soc/mediatek/mt8195-mmsys.h
> index fd7b455bd675..454944a9409c 100644
> --- a/drivers/soc/mediatek/mt8195-mmsys.h
> +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> @@ -75,6 +75,12 @@
>  #define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 <<
> 16)
>  #define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			
> (3 << 16)
>  
> +#define MT8195_VDO1_MERGE0_ASYNC_CFG_WD				
> 0xe30
> +#define MT8195_VDO1_HDRBE_ASYNC_CFG_WD				
> 0xe70
> +#define MT8195_VDO1_HDR_TOP_CFG					
> 0xd00
> +#define MT8195_VDO1_MIXER_IN1_ALPHA				0xd30
> +#define MT8195_VDO1_MIXER_IN1_PAD				0xd40
> +
>  #define MT8195_VDO1_VPP_MERGE0_P0_SEL_IN			0xf04
>  #define MT8195_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0			
> 1
>  
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index 3e2e5e3f721d..199503dd544a 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -228,6 +228,41 @@ void mtk_mmsys_ddp_disconnect(struct device
> *dev,
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>  
> +void mtk_mmsys_merge_async_config(struct device *dev, int idx, int
> width, int height)
> +{
> +	mtk_mmsys_write_reg(dev_get_drvdata(dev),
> MT8195_VDO1_MERGE0_ASYNC_CFG_WD + 0x10 * idx,
> +			    ~0, height << 16 | width);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_merge_async_config);
> +
> +void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int
> be_height)
> +{
> +	mtk_mmsys_write_reg(dev_get_drvdata(dev),
> MT8195_VDO1_HDRBE_ASYNC_CFG_WD, ~0,
> +			    be_height << 16 | be_width);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_hdr_confing);
> +
> +void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool
> alpha_sel, u16 alpha,
> +			       u8 mode, u32 biwidth)
> +{
> +	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> +
> +	mtk_mmsys_write_reg(mmsys, MT8195_VDO1_MIXER_IN1_ALPHA + (idx -
> 1) * 4, ~0,
> +			    alpha << 16 | alpha);
> +	mtk_mmsys_write_reg(mmsys, MT8195_VDO1_HDR_TOP_CFG, BIT(19 +
> idx),
> +			    alpha_sel << (19 + idx));
> +	mtk_mmsys_write_reg(mmsys, MT8195_VDO1_MIXER_IN1_PAD + (idx -
> 1) * 4,
> +			    GENMASK(31, 16) | GENMASK(1, 0), biwidth <<
> 16 | mode);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_config);
> +
> +void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> bool channel_swap)
> +{
> +	mtk_mmsys_write_reg(dev_get_drvdata(dev),
> MT8195_VDO1_MIXER_IN1_PAD + (idx - 1) * 4,
> +			    BIT(4), channel_swap << 4);
> +}
> +EXPORT_SYMBOL_GPL(mtk_mmsys_mixer_in_channel_swap);
> +
>  static int mtk_mmsys_reset_update(struct reset_controller_dev
> *rcdev, unsigned long id,
>  				  bool assert)
>  {
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> b/include/linux/soc/mediatek/mtk-mmsys.h
> index b4388ba43341..fe620929b0f9 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -73,4 +73,13 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>  			      enum mtk_ddp_comp_id cur,
>  			      enum mtk_ddp_comp_id next);
>  
> +void mtk_mmsys_merge_async_config(struct device *dev, int idx, int
> width, int height);
> +
> +void mtk_mmsys_hdr_confing(struct device *dev, int be_width, int
> be_height);
> +
> +void mtk_mmsys_mixer_in_config(struct device *dev, int idx, bool
> alpha_sel, u16 alpha,
> +			       u8 mode, u32 biwidth);
> +
> +void mtk_mmsys_mixer_in_channel_swap(struct device *dev, int idx,
> bool channel_swap);
> +
>  #endif /* __MTK_MMSYS_H */

