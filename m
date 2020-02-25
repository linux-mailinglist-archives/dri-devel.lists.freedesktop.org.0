Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC60C16B8B6
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 06:07:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBD7E6E0DB;
	Tue, 25 Feb 2020 05:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 98DF36E0DB
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 05:07:47 +0000 (UTC)
X-UUID: e29ec071ec53492589a630c73f070c9f-20200225
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=/rtGSIQMd4B3KB57xrUi7K3ubIpRTDkINY3agOAnA5g=; 
 b=k6MaK41Z4INDrhlLEsvigYWeqTh9KMbVAE4ZQ0AUwAR/E6/XeZeuqynBxE/WxD1qeeiY7W6m6HsF1GYPTzQpTTLUSHUPGcjZs4u8fenJ3IydNtJ6BfnlT7x9HSypnkdAbgcTOR+2PeEMeKS5eV4IsmKz/Dev9txQai0K7pSeBEA=;
X-UUID: e29ec071ec53492589a630c73f070c9f-20200225
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 356552752; Tue, 25 Feb 2020 13:07:42 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkexhb02.mediatek.inc (172.21.101.103) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 25 Feb 2020 13:07:08 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 25 Feb 2020 13:07:28 +0800
Message-ID: <1582607261.2773.0.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: component type MTK_DISP_OVL_2L is not
 correctly handled
From: CK Hu <ck.hu@mediatek.com>
To: Phong LE <ple@baylibre.com>
Date: Tue, 25 Feb 2020 13:07:41 +0800
In-Reply-To: <1582162568.24713.0.camel@mtksdaap41>
References: <20200219141324.29299-1-ple@baylibre.com>
 <1582162568.24713.0.camel@mtksdaap41>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Phong:

On Thu, 2020-02-20 at 09:36 +0800, CK Hu wrote:
> Hi, Phong:
> 
> On Wed, 2020-02-19 at 15:13 +0100, Phong LE wrote:
> > The larb device remains NULL if the type is MTK_DISP_OVL_2L.
> > A kernel panic is raised when a crtc uses mtk_smi_larb_get or
> > mtk_smi_larb_put.
> > 
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 

Applied to mediatek-drm-fixes-5.6 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.6

Regards,
CK

> > Signed-off-by: Phong LE <ple@baylibre.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > index 1f5a112bb034..57c88de9a329 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > @@ -471,6 +471,7 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
> >  	/* Only DMA capable components need the LARB property */
> >  	comp->larb_dev = NULL;
> >  	if (type != MTK_DISP_OVL &&
> > +	    type != MTK_DISP_OVL_2L &&
> >  	    type != MTK_DISP_RDMA &&
> >  	    type != MTK_DISP_WDMA)
> >  		return 0;
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
