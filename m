Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B9557DA76
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 08:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C18F10EC6D;
	Fri, 22 Jul 2022 06:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4D010EC6D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Jul 2022 06:43:09 +0000 (UTC)
X-UUID: 04bcd04a01a742cdb764386f66409ece-20220722
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:a7825040-aa15-4457-9e25-becf99aa36e6, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:0f94e32, CLOUDID:4975aa33-b9e4-42b8-b28a-6364427c76bb,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: 04bcd04a01a742cdb764386f66409ece-20220722
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <mingjia.zhang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1310787261; Fri, 22 Jul 2022 14:43:03 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 22 Jul 2022 14:43:02 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 22 Jul 2022 14:43:00 +0800
Message-ID: <cf62ea99e74ea729a38fe7f806cbc06a0c549ddc.camel@mediatek.com>
Subject: Re: [RESEND] media: mediatek: vcodec: Add to support VP9 inner
 racing mode
From: "mingjia.zhang@mediatek.com" <mingjia.zhang@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Nicolas Dufresne <nicolas@ndufresne.ca>, "Hans
 Verkuil" <hverkuil-cisco@xs4all.nl>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
Date: Fri, 22 Jul 2022 14:43:00 +0800
In-Reply-To: <6d8aeee4-9732-1c62-67e0-6e8f56373aa6@collabora.com>
References: <20220715064938.5812-1-mingjia.zhang@mediatek.com>
 <6d8aeee4-9732-1c62-67e0-6e8f56373aa6@collabora.com>
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
Cc: Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Angelo,

Thanks for your reply and useful comments.

In addition to running cts/gts test, I ran the fluster test with
GStreamer locally. The test result is "Ran 240/303 tests successfully"


Thanks,
mingjia


On Fri, 2022-07-15 at 10:34 +0200, AngeloGioacchino Del Regno wrote:
> Il 15/07/22 08:49, Mingjia Zhang ha scritto:
> > In order to reduce decoder latency, enable VP9 inner racing mode.
> > Send lat trans buffer information to core when trigger lat to work,
> > need not to wait until lat decode done.
> > 
> > Signed-off-by: mingjia zhang <mingjia.zhang@mediatek.com>
> > ---
> > CTS/GTS test pass
> 
> CTS/GTS passing is a good indication but, please, test with GStreamer
> (and
> show the output, as well!).
> 
> Thanks,
> Angelo
> 
> > ---
> >   .../vcodec/vdec/vdec_vp9_req_lat_if.c         | 64 ++++++++++++
> > -------
> >   1 file changed, 40 insertions(+), 24 deletions(-)
> > 

