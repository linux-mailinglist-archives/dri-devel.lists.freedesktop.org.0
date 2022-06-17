Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B2E54F1E1
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 09:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7B8411A9D5;
	Fri, 17 Jun 2022 07:27:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC2B11A9A8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 07:27:15 +0000 (UTC)
X-UUID: 875e58a613d84ca7b1b3e3664cb22b0a-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:b9c83141-81c7-4b66-99e4-0ab89fdcab8d, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:40
X-CID-INFO: VERSION:1.1.6, REQID:b9c83141-81c7-4b66-99e4-0ab89fdcab8d, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:40
X-CID-META: VersionHash:b14ad71, CLOUDID:8438e048-4c92-421c-ad91-b806c0f58b2a,
 C
 OID:e5c3e4578f40,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 875e58a613d84ca7b1b3e3664cb22b0a-20220617
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 389779066; Fri, 17 Jun 2022 15:27:09 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 17 Jun 2022 15:27:07 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jun 2022 15:27:04 +0800
Message-ID: <c6ec34ff6b2a2ead4813a73b989ac21a863b2035.camel@mediatek.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Fix non subdev architecture
 open power fail
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Jun 2022 15:27:04 +0800
In-Reply-To: <CAGXv+5EZ+Mu1481gM9h0kgqO3a0xFKP8drvGv7gRp6=3NU2oKA@mail.gmail.com>
References: <20220617032113.18576-1-yunfei.dong@mediatek.com>
 <CAGXv+5EZ+Mu1481gM9h0kgqO3a0xFKP8drvGv7gRp6=3NU2oKA@mail.gmail.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
 George Sun <george.sun@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Nicolas Dufresne <nicolas@ndufresne.ca>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>,
 Tomasz Figa <tfiga@google.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chen-Yu,

Thanks for your suggestion.
On Fri, 2022-06-17 at 14:56 +0800, Chen-Yu Tsai wrote:
> On Fri, Jun 17, 2022 at 11:21 AM Yunfei Dong <
> yunfei.dong@mediatek.com> wrote:
> > 
> > According to subdev_bitmap bit value to open hardware power, need
> > to
> > set subdev_bitmap value for non subdev architecture.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> Fixes: c05bada35f01 ("media: mtk-vcodec: Add to support multi
> hardware decode")
> 
> ?
> 
> ChenYu
Fix it in patch v2.

Best Regards,
Yunfei Dong

