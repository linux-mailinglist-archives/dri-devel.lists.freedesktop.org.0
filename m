Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F9A54C7A4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 13:43:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55E3E10E12E;
	Wed, 15 Jun 2022 11:43:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FAD010E11B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jun 2022 11:43:33 +0000 (UTC)
X-UUID: 9c29b81c6b584b1c85b8406c888a4a2c-20220615
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:d05bd642-51b7-4179-969c-359d3066bf4a, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:b14ad71, CLOUDID:fba955f6-e099-41ba-a32c-13b8bfe63214,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 9c29b81c6b584b1c85b8406c888a4a2c-20220615
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1633028829; Wed, 15 Jun 2022 19:43:27 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 15 Jun 2022 19:43:26 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 15 Jun 2022 19:43:25 +0800
Message-ID: <3e084cf745e1425084186368c867f54b54c91ce6.camel@mediatek.com>
Subject: Re: [PATCH v4, 0/3] add h264 decoder driver for mt8186
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Wed, 15 Jun 2022 19:43:25 +0800
In-Reply-To: <5316234cef174e49110f949991ef71c578a3478e.camel@ndufresne.ca>
References: <20220512034620.30500-1-yunfei.dong@mediatek.com>
 <edbb4605c9e30329d2f5a4ff738571acb6b91f1f.camel@ndufresne.ca>
 <5316234cef174e49110f949991ef71c578a3478e.camel@ndufresne.ca>
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
On Tue, 2022-06-14 at 13:46 -0400, Nicolas Dufresne wrote:
> Le lundi 13 juin 2022 à 16:10 -0400, Nicolas Dufresne a écrit :
> > Le jeudi 12 mai 2022 à 11:46 +0800, Yunfei Dong a écrit :
> > > Firstly, add mt8186 compatible and private data, then add
> > > document for
> > > compatible "mediatek,mt8186-vcodec-dec". For mt8186 is single
> > > core
> > > architecture, need to add new interface for h264 hardware
> > > decoder.
> > 
> > Would be nice to take the habit of sharing fluster score for this
> > new HW, I
> > would expect no less then what the numbers you'd get from running
> > over MT8195 or
> > 92, remains nice to demonstrate that this was tested and document
> > any oops along
> > the way.
> > > 
> > > Patche 1 add mt8186 compatible and private data.
> > > Patche 2 add mt8186 compatible document.
> > > Patche 3 add h264 single core driver.
> > > ---
> > > This patch depends on "support for MT8192 decoder"[1]
> > > 
> > > [1]  
> > > https://patchwork.kernel.org/project/linux-mediatek/cover/20220512021950.29087-1-yunfei.dong@mediatek.com/
> 
> I forgot earlier, but I suppose this will also depends on an scp.img
> firmware ?
> If so, any linux-firmware submission to link to ?
> 
For the tast/cts/gts test are coming to the end, after all ec patches
are merged, I will upstream scp.img

Best Regards,
Yunfei Dong
> > > ---
> > > changed with v3:
> > > - fix __iomem not reasonable, align share memory to dram.
> > > changed with v2:
> > > - fix sparse and smatch check fail for patch 3
> > > changed with v1:
> > > - rebase driver to the latest media_stage.
> > > ---
> > > Yunfei Dong (3):
> > >   dt-bindings: media: mediatek: vcodec: Adds decoder dt-bindings
> > > for
> > >     mt8186
> > >   media: mediatek: vcodec: Support MT8186
> > >   media: mediatek: vcodec: add h264 decoder driver for mt8186
> > > 
> > >  .../media/mediatek,vcodec-subdev-decoder.yaml |   4 +-
> > >  .../platform/mediatek/vcodec/mtk_vcodec_dec.h |   1 +
> > >  .../mediatek/vcodec/mtk_vcodec_dec_drv.c      |   4 +
> > >  .../vcodec/mtk_vcodec_dec_stateless.c         |  19 ++
> > >  .../vcodec/vdec/vdec_h264_req_multi_if.c      | 177
> > > +++++++++++++++++-
> > >  5 files changed, 203 insertions(+), 2 deletions(-)
> > > 
> 
> 

