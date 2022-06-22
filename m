Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C4155402F
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 03:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9915A11352B;
	Wed, 22 Jun 2022 01:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A36C113531
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jun 2022 01:44:42 +0000 (UTC)
X-UUID: 71deec2e79434e01958a2c632e2a0c65-20220622
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:7a8acf2d-bd8e-4dee-8cb7-d2e9845682c0, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:40
X-CID-INFO: VERSION:1.1.6, REQID:7a8acf2d-bd8e-4dee-8cb7-d2e9845682c0, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:40
X-CID-META: VersionHash:b14ad71, CLOUDID:da0428ea-f7af-4e69-92ee-0fd74a0c286c,
 C
 OID:8cd89d9b3457,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 71deec2e79434e01958a2c632e2a0c65-20220622
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 592251373; Wed, 22 Jun 2022 09:44:35 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 22 Jun 2022 09:44:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 22 Jun 2022 09:44:32 +0800
Message-ID: <be1069684f0482984234fb4e8509615dca2e602a.camel@mediatek.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Initialize decoder parameters
 after getting dec_capability
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Chen-Yu Tsai
 <wenst@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, "Tomasz Figa" <tfiga@google.com>
Date: Wed, 22 Jun 2022 09:44:32 +0800
In-Reply-To: <320bf3dd2bef0afec794d610b446d0085dcfe362.camel@ndufresne.ca>
References: <20220618072929.28783-1-yunfei.dong@mediatek.com>
 <320bf3dd2bef0afec794d610b446d0085dcfe362.camel@ndufresne.ca>
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nicolas,

Thanks for your comments.

I already sent patch v2 to add fixes table in June 20.

Best Regards,
Yunfei Dong
On Tue, 2022-06-21 at 10:20 -0400, Nicolas Dufresne wrote:
> Hi Yunfei,
> 
> Le samedi 18 juin 2022 à 15:29 +0800, Yunfei Dong a écrit :
> > Need to get dec_capability from scp first, then initialize decoder
> > supported format and other parameters according to dec_capability
> > value.
> 
> Perhaps something to improve in the future. On top of describing the
> fix, it
> could be useful to describe what issues is being fixed, and which
> platform will
> benefit.
> 
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> To add to this, this looks like a bug fix, can you relate it to an
> original
> commit and add a Fixes: tag here ?
> 
> regards,
> Nicolas
> 
> > ---
> >  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c     | 2 --
> >  drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c | 2 ++
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git
> > a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > index 1465ddff1c6b..41589470da32 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
> > @@ -112,8 +112,6 @@ void mtk_vcodec_dec_set_default_params(struct
> > mtk_vcodec_ctx *ctx)
> >  {
> >  	struct mtk_q_data *q_data;
> >  
> > -	ctx->dev->vdec_pdata->init_vdec_params(ctx);
> > -
> >  	ctx->m2m_ctx->q_lock = &ctx->dev->dev_mutex;
> >  	ctx->fh.m2m_ctx = ctx->m2m_ctx;
> >  	ctx->fh.ctrl_handler = &ctx->ctrl_hdl;
> > diff --git
> > a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
> > b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
> > index 4103d7c1b638..99d7b15f2b9d 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.c
> > @@ -208,6 +208,8 @@ static int fops_vcodec_open(struct file *file)
> >  
> >  		dev->dec_capability =
> >  			mtk_vcodec_fw_get_vdec_capa(dev->fw_handler);
> > +		ctx->dev->vdec_pdata->init_vdec_params(ctx);
> > +
> >  		mtk_v4l2_debug(0, "decoder capability %x", dev-
> > >dec_capability);
> >  	}
> >  
> 
> 

