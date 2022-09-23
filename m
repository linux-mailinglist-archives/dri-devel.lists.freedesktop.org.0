Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 255C75E7472
	for <lists+dri-devel@lfdr.de>; Fri, 23 Sep 2022 08:57:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690D110E3F2;
	Fri, 23 Sep 2022 06:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FF1B10E3F2
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Sep 2022 06:57:10 +0000 (UTC)
X-UUID: f437833b6e044f3b877701f9744536e8-20220923
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=rHY+FiM06dlsyrt7Uuce8+/2PC7uc1ZlmHH/FL1QnX8=; 
 b=YwLIp7WTJggrXaaz2nOT8tmkZ4M+BAty+XN9/jiWUCw6St/1YqrHwbSFCcYpWcOnN98t5LueWlE9z5AFAKWIgp7cQ+bcGF+UBQ/jSUdXCcMZmZdpZKXYgz2jUBQIIaeak9K+JBsDlA6WxmMIy9BaXAxGSUJ2wjtyD06GQGpmj7Y=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11, REQID:16cc0608-da54-4760-b2cb-cadbcec7e372, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:39a5ff1, CLOUDID:cd8fd4a2-dc04-435c-b19b-71e131a5fc35,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f437833b6e044f3b877701f9744536e8-20220923
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <xinlei.lee@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 2055714459; Fri, 23 Sep 2022 14:57:04 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 23 Sep 2022 14:57:03 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Sep 2022 14:57:02 +0800
Message-ID: <2941a6e319e80c489bd2872efd836063f4984b86.camel@mediatek.com>
Subject: Re: [PATCH v8,2/3]drm: mediatek: Adjust the dpi output format to
 MT8186
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= <ck.hu@mediatek.com>, 
 Jason-JH Lin =?UTF-8?Q?=28=E6=9E=97=E7=9D=BF=E7=A5=A5=29?=
 <Jason-JH.Lin@mediatek.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "airlied@linux.ie"
 <airlied@linux.ie>, Rex-BC Chen =?UTF-8?Q?=28=E9=99=B3=E6=9F=8F=E8=BE=B0=29?=
 <Rex-BC.Chen@mediatek.com>, "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Date: Fri, 23 Sep 2022 14:57:03 +0800
In-Reply-To: <a137c801f5263abaef8a13a14a1f4b24a5bcdf1b.camel@mediatek.com>
References: <1663850702-26529-1-git-send-email-xinlei.lee@mediatek.com>
 <1663850702-26529-3-git-send-email-xinlei.lee@mediatek.com>
 <a137c801f5263abaef8a13a14a1f4b24a5bcdf1b.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Jitao Shi =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?=
 <jitao.shi@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 2022-09-23 at 13:59 +0800, CK Hu (胡俊光) wrote:
> Hi, Xinlei:
> 
> From the code you modify, I do not understand why the title is
> "Adjust
> the dpi output format to MT8186". You just call mmsys driver function
> to set single edge or dual edge, but single edge or dual edge already
> exist in other SoC and is not special in MT8186. So I think you
> should
> change the title to 'Set dpi format in mmsys'
> 
> 
> On Thu, 2022-09-22 at 20:45 +0800, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Due to the mt8186  hardware changes, we need to modify the dpi
> > output 
> > format corresponding to the mmsys register(mmsys_base+0x400).
> > 
> 
> The below description is not related to this patch and it's common
> with
> mt8183, so I think we don't need below description.
> 
> > Because different sink ICs may support other output formats.
> > The current DRM architecture supports retrieving the output format
> > of
> > all bridges (eg dpi is implemented via DRM's .atomic_check and
> > .atomic_get_output_bus_fmts and .atomic_get_input_bus_fmts).
> > If no unified output format is found, the default soc format
> > (MEDIA_BUS_FMT_RGB888_2X12_LE in mt8186) is used.
> > 
> > Therefore, if there are other format sink ICs
> > (RGB888_DDR/RGB888_SDR)
> > in
> > the future, the sink IC needs to add the func implementation
> > mentioned
> > above needs to be added. 
> > And the drm architecture will select the appropriate format to
> > change
> > the dpi output.
> > 
> > Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 630a4e301ef6..bd1870a8504a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/of_graph.h>
> >  #include <linux/pinctrl/consumer.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/soc/mediatek/mtk-mmsys.h>
> >  #include <linux/types.h>
> >  
> >  #include <video/videomode.h>
> > @@ -30,6 +31,7 @@
> >  #include "mtk_disp_drv.h"
> >  #include "mtk_dpi_regs.h"
> >  #include "mtk_drm_ddp_comp.h"
> > +#include "mtk_drm_drv.h"
> >  
> >  enum mtk_dpi_out_bit_num {
> >  	MTK_DPI_OUT_BIT_NUM_8BITS,
> > @@ -82,6 +84,7 @@ struct mtk_dpi {
> >  	struct pinctrl_state *pins_dpi;
> >  	u32 output_fmt;
> >  	int refcount;
> > +	struct device *mmsys_dev;
> >  };
> >  
> >  static inline struct mtk_dpi *bridge_to_dpi(struct drm_bridge *b)
> > @@ -135,6 +138,7 @@ struct mtk_dpi_yc_limit {
> >   * @yuv422_en_bit: Enable bit of yuv422.
> >   * @csc_enable_bit: Enable bit of CSC.
> >   * @pixels_per_iter: Quantity of transferred pixels per iteration.
> > + * @edge_cfg_in_mmsys: If the edge configuration for DPI's output
> > needs to be set in MMSYS.
> >   */
> >  struct mtk_dpi_conf {
> >  	unsigned int (*cal_factor)(int clock);
> > @@ -153,6 +157,7 @@ struct mtk_dpi_conf {
> >  	u32 yuv422_en_bit;
> >  	u32 csc_enable_bit;
> >  	u32 pixels_per_iter;
> > +	bool edge_cfg_in_mmsys;
> >  };
> >  
> >  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val,
> > u32 mask)
> > @@ -449,8 +454,12 @@ static void mtk_dpi_dual_edge(struct mtk_dpi
> > *dpi)
> >  		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING,
> >  			     dpi->output_fmt ==
> > MEDIA_BUS_FMT_RGB888_2X12_LE ?
> >  			     EDGE_SEL : 0, EDGE_SEL);
> > +		if (dpi->conf->edge_cfg_in_mmsys)
> > +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev,
> > MTK_DPI_RGB888_DDR_CON);
> >  	} else {
> >  		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
> > 0);
> > +		if (dpi->conf->edge_cfg_in_mmsys)
> > +			mtk_mmsys_ddp_dpi_fmt_config(dpi->mmsys_dev,
> > MTK_DPI_RGB888_SDR_CON);
> >  	}
> >  }
> >  
> > @@ -778,8 +787,10 @@ static int mtk_dpi_bind(struct device *dev,
> > struct device *master, void *data)
> >  {
> >  	struct mtk_dpi *dpi = dev_get_drvdata(dev);
> >  	struct drm_device *drm_dev = data;
> > +	struct mtk_drm_private *priv = drm_dev->dev_private;
> >  	int ret;
> >  
> > +	dpi->mmsys_dev = priv->mmsys_dev;
> >  	ret = drm_simple_encoder_init(drm_dev, &dpi->encoder,
> >  				      DRM_MODE_ENCODER_TMDS);
> >  	if (ret) {

Hi CK:

Thanks for your suggestion.

I will revise the next edition as you suggested.

Best Regards!
xinlei

