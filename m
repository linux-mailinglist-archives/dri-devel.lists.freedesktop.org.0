Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1232557146
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 05:34:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16C4D113692;
	Thu, 23 Jun 2022 03:34:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807A8113692
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 03:34:17 +0000 (UTC)
X-UUID: a79ae7d571454f528d2d996e8fb2a215-20220623
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:c7583246-f3e0-477c-a035-85da7ab95b6b, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.6, REQID:c7583246-f3e0-477c-a035-85da7ab95b6b, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:b14ad71, CLOUDID:67213c38-5e4b-44d7-80b2-bb618cb09d29,
 C
 OID:7494f817c6eb,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: a79ae7d571454f528d2d996e8fb2a215-20220623
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 106634298; Thu, 23 Jun 2022 11:34:11 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 23 Jun 2022 11:34:10 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jun 2022 11:34:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 23 Jun 2022 11:34:09 +0800
Message-ID: <0c269c54042d556bd5c7f4a7a13d4e33074888d1.camel@mediatek.com>
Subject: Re: [PATCH v13 12/14] drm/mediatek: dpi: add config to control
 setting of direct connection to pins
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <matthias.bgg@gmail.com>, <airlied@linux.ie>
Date: Thu, 23 Jun 2022 11:34:09 +0800
In-Reply-To: <3246fb94ec05a43b7017849198d949ce8c8636a7.camel@mediatek.com>
References: <20220621113732.11595-1-rex-bc.chen@mediatek.com>
 <20220621113732.11595-13-rex-bc.chen@mediatek.com>
 <55c98626-9b95-7721-94cf-8c471580a53b@collabora.com>
 <3246fb94ec05a43b7017849198d949ce8c8636a7.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-06-22 at 17:08 +0800, Rex-BC Chen wrote:
> On Tue, 2022-06-21 at 14:11 +0200, AngeloGioacchino Del Regno wrote:
> > Il 21/06/22 13:37, Bo-Chen Chen ha scritto:
> > > MediaTek dpi supports direct connection to pins while dp_intf
> > > does
> > > not
> > > support. Therefore, add a config "support_direct_pin" to control
> > > this.
> > > 
> > > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > > ---
> > >   drivers/gpu/drm/mediatek/mtk_dpi.c | 17 +++++++++++++----
> > >   1 file changed, 13 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > index 438bf3bc5e4a..ef7f828a4b1e 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > > @@ -129,6 +129,8 @@ struct mtk_dpi_yc_limit {
> > >    * @is_ck_de_pol: Support CK/DE polarity.
> > >    * @swap_input_support: Support input swap function.
> > >    * @color_fmt_trans_support: Enable color format transfer.
> > > + * @support_direct_pin: Dpi can directly connect pins, and
> > > enable
> > > this config
> > > + *			to do this.
> > 
> > @support_direct_pin: IP supports direct connection to pins
> > 
> > or
> > 
> > @support_direct_pin: IP has direct connection to DP pins
> > 
> > or
> > 
> > @support_direct_pin: IP connects directly to DP pins
> > 
> > pick one, after which:
> > 
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > 
> > 
> 
> Hello Angelo,
> 
> this is not connect to "DP" pin. This setting is for dpi to connect
> to
> panel directly and there is no such usecase for dp_intf.
> 
> Therefore, I will use "@support_direct_pin: IP supports direct
> connection to pins".
> 
> Thanks
> 
> BRs,
> Bo-Chen
> 

Hello Angelo,

I think "@support_direct_pin: IP supports direct connection to dpi
panels" is more precise for this config. I will use this description.

BRs,
Bo-Chen

