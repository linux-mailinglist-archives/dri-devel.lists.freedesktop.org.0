Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AB850FA79
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 12:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915EF10E5A3;
	Tue, 26 Apr 2022 10:28:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E289710E5A3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 10:28:39 +0000 (UTC)
X-UUID: 162355498c0b48f2b1df6850e9fcc7b6-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:51a7fbd9-65de-4ec1-bb7b-d6919820e1e8, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:53,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:61
X-CID-INFO: VERSION:1.1.4, REQID:51a7fbd9-65de-4ec1-bb7b-d6919820e1e8, OB:0,
 LOB:
 0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:53,FILE:0,RULE:Spam_GS981B3D,ACT
 ION:quarantine,TS:61
X-CID-META: VersionHash:faefae9, CLOUDID:bc09c02e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:01946d09fe8b,Recheck:0,SF:13|15|28|16|19|48,TC:nil,Content:0,EDM:-3,Fi
 le:nil,QS:0,BEC:nil
X-UUID: 162355498c0b48f2b1df6850e9fcc7b6-20220426
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1132310296; Tue, 26 Apr 2022 18:28:36 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 18:28:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Apr 2022 18:28:34 +0800
Message-ID: <2e336c54b07cf5b661fd4a613545a932bca792fb.camel@mediatek.com>
Subject: Re: [PATCH v17 13/21] drm/mediatek: add display merge async reset
 control
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, <wim@linux-watchdog.org>, AngeloGioacchino Del
 Regno <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Tue, 26 Apr 2022 18:28:34 +0800
In-Reply-To: <b4f438026fe208f8f6511de34c7e84c8c59d843c.camel@pengutronix.de>
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-14-nancy.lin@mediatek.com>
 <b4f438026fe208f8f6511de34c7e84c8c59d843c.camel@pengutronix.de>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan
 Chancellor <nathan@kernel.org>, linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

Thanks for the review.

On Mon, 2022-04-25 at 11:58 +0200, Philipp Zabel wrote:
> On Sa, 2022-04-16 at 10:07 +0800, Nancy.Lin wrote:
> > Add merge async reset control in mtk_merge_stop. Async hw doesn't
> > do self
> > reset on each sof signal(start of frame), so need to reset the
> > async to
> > clear the hw status for the next merge start.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_merge.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > index 9dca145cfb71..177473fa8160 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/of_device.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/reset.h>
> >  #include <linux/soc/mediatek/mtk-cmdq.h>
> >  
> > 
> > 
> > 
> >  #include "mtk_drm_ddp_comp.h"
> > @@ -79,6 +80,9 @@ void mtk_merge_stop(struct device *dev)
> >  	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> >  
> > 
> > 
> > 
> >  	mtk_merge_stop_cmdq(dev, NULL);
> > +
> > +	if (priv->async_clk)
> > +		device_reset_optional(dev);
> 
> To avoid the overhead of looking up the reset control in the device
> tree every time, it would be better to request a reset control during
> probe using devm_reset_control_get_optional_exclusive(). Here you'd
> just call reset_control_reset().
> 
> regards
> Philipp

OK. I will refine it in the next revision.

Regards,
Nancy

