Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DB14C8072
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 02:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C615110E148;
	Tue,  1 Mar 2022 01:47:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D5710E148
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 01:47:00 +0000 (UTC)
X-UUID: 6f33e31bd00749f998d87b09d184cfc6-20220301
X-UUID: 6f33e31bd00749f998d87b09d184cfc6-20220301
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1245295757; Tue, 01 Mar 2022 09:46:43 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 1 Mar 2022 09:46:42 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Mar 2022 09:46:42 +0800
Message-ID: <fa9a04263ed0b1aa54a140e7eec47e838d3e5587.camel@mediatek.com>
Subject: Re: [PATCH v4 2/2] drm/mediatek: add devlink to cmdq dev
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 1 Mar 2022 09:46:42 +0800
In-Reply-To: <CAAOTY__rnVMRB=OhkTm4Ojh31yAcYwCQTBGozpGsnC_oC_jqvQ@mail.gmail.com>
References: <20211202064039.20797-1-jason-jh.lin@mediatek.com>
 <20211202064039.20797-3-jason-jh.lin@mediatek.com>
 <CAAOTY__rnVMRB=OhkTm4Ojh31yAcYwCQTBGozpGsnC_oC_jqvQ@mail.gmail.com>
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
Cc: Fei Shao <fshao@chromium.org>, David Airlie <airlied@linux.ie>,
 singo.chang@mediatek.com, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, tzungbi@google.com,
 Nancy Lin <nancy.lin@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chun-Kuang,

Thanks for the reviews.

I forgot to add the comment that the patch should be based on [1].
We can only apply it after applying [1].

So please apply it after that. Thank you very much!

Regards,
Jason-JH.Lin
---
[1] drm/mediatek: modify mediatek-drm for mt8195 multi mmsys support

https://patchwork.kernel.org/project/linux-mediatek/patch/20220222100741.30138-21-nancy.lin@mediatek.com/
---

On Sun, 2022-02-27 at 11:33 +0800, Chun-Kuang Hu wrote:
> Hi, Jason:
> 
> Build error:
> 
> ../drivers/gpu/drm/mediatek/mtk_drm_crtc.c: In function
> ‘mtk_drm_crtc_create’:
> ../drivers/gpu/drm/mediatek/mtk_drm_crtc.c:902:26: error: ‘struct
> mtk_drm_private’ has no member named ‘dev’
>   mtk_crtc->drm_dev = priv->dev;
>                           ^
> ../drivers/gpu/drm/mediatek/mtk_drm_crtc.c:974:30: error: ‘struct
> mtk_drm_private’ has no member named ‘dev’
>    link = device_link_add(priv->dev, mtk_crtc->cmdq_client.chan-
> >mbox->dev,
>                               ^
> In file included from ../include/linux/device.h:15:0,
>                  from ../include/linux/dma-mapping.h:7,
>                  from ../drivers/gpu/drm/mediatek/mtk_drm_crtc.c:7:
> ../drivers/gpu/drm/mediatek/mtk_drm_crtc.c:977:16: error: ‘struct
> mtk_drm_private’ has no member named ‘dev’
>     dev_err(priv->dev, "Unable to link dev=%s\n",
>                 ^
> Regards,
> Chun-Kuang.


