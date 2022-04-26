Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF5C50FB98
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 12:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A80010E42F;
	Tue, 26 Apr 2022 10:57:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D0A10E464
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 10:57:36 +0000 (UTC)
X-UUID: d1f92736147f453d98dedf5da273e11e-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:3adac9f4-5fea-4483-993e-9dcaa7b1b077, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:1,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:9
X-CID-INFO: VERSION:1.1.4, REQID:3adac9f4-5fea-4483-993e-9dcaa7b1b077, OB:0,
 LOB:
 0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:1,FILE:0,RULE:Release_UHam,ACTIO
 N:release,TS:9
X-CID-META: VersionHash:faefae9, CLOUDID:fda388c6-85ee-4ac1-ac05-bd3f1e72e732,
 C
 OID:IGNORED,Recheck:0,SF:13|15|28|100|16|19|48|101|20,TC:nil,Content:0,EDM
 :-3,File:nil,QS:0,BEC:nil
X-UUID: d1f92736147f453d98dedf5da273e11e-20220426
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1935830264; Tue, 26 Apr 2022 18:57:31 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 26 Apr 2022 18:57:29 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Apr 2022 18:57:29 +0800
Message-ID: <f26dd0fd443ee04a5c27b3709ba053ee9bd0316e.camel@mediatek.com>
Subject: Re: [PATCH v17 14/21] drm/mediatek: add ETHDR support for MT8195
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, <wim@linux-watchdog.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Tue, 26 Apr 2022 18:57:29 +0800
In-Reply-To: <0e642da615b8f52fb36cd1248f8a124ea4e4b7b8.camel@pengutronix.de>
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-15-nancy.lin@mediatek.com>
 <0e642da615b8f52fb36cd1248f8a124ea4e4b7b8.camel@pengutronix.de>
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

On Mon, 2022-04-25 at 12:00 +0200, Philipp Zabel wrote:
> On Sa, 2022-04-16 at 10:07 +0800, Nancy.Lin wrote:
> > ETHDR is a part of ovl_adaptor.
> > ETHDR is designed for HDR video and graphics conversion in the
> > external
> > display path. It handles multiple HDR input types and performs tone
> > mapping, color space/color format conversion, and then combine
> > different layers, output the required HDR or SDR signal to the
> > subsequent display path.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> 
> [...]
> > +static int mtk_ethdr_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct mtk_ethdr *priv;
> > +	int ret;
> > +	int i;
> > +
> > +	dev_info(dev, "%s+\n", __func__);
> 
> Left-over debug statements?
> 
Yes, I will remove the redundent log.

Regards,
Nancy

> > +
> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < ETHDR_ID_MAX; i++) {
> > +		priv->ethdr_comp[i].dev = dev;
> > +		priv->ethdr_comp[i].regs = of_iomap(dev->of_node, i);
> > +#if IS_REACHABLE(CONFIG_MTK_CMDQ)
> > +		ret = cmdq_dev_get_client_reg(dev,
> > +					      &priv-
> > >ethdr_comp[i].cmdq_base, i);
> > +		if (ret)
> > +			dev_dbg(dev, "get mediatek,gce-client-reg
> > fail!\n");
> > +#endif
> > +		dev_dbg(dev, "[DRM]regs:0x%p, node:%d\n", priv-
> > >ethdr_comp[i].regs, i);
> > +	}
> > +
> > +	for (i = 0; i < ETHDR_CLK_NUM; i++)
> > +		priv->ethdr_clk[i].id = ethdr_clk_str[i];
> > +	ret = devm_clk_bulk_get_optional(dev, ETHDR_CLK_NUM, priv-
> > >ethdr_clk);
> > +	if (ret)
> > +		return ret;
> > +
> > +	priv->irq = platform_get_irq(pdev, 0);
> > +	if (priv->irq < 0)
> > +		priv->irq = 0;
> > +
> > +	if (priv->irq) {
> > +		ret = devm_request_irq(dev, priv->irq,
> > mtk_ethdr_irq_handler,
> > +				       IRQF_TRIGGER_NONE,
> > dev_name(dev), priv);
> > +		if (ret < 0) {
> > +			dev_err(dev, "Failed to request irq %d: %d\n",
> > priv->irq, ret);
> > +			return ret;
> > +		}
> > +	}
> > +
> > +	priv->reset_ctl =
> > devm_reset_control_array_get_optional_exclusive(dev);
> 
> This is missing error handling. You could use dev_err_probe() here.
> 
> regards
> Philipp

OK, I will add error handling in the next revision. Thank you.

Regards,
Nancy

