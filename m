Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5859B4D7D72
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 09:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C15CA10E8A7;
	Mon, 14 Mar 2022 08:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BBB10E8A7
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Mar 2022 08:16:28 +0000 (UTC)
X-UUID: 6a5bb6c471d04ddf9b8f9838f4c1c4fc-20220314
X-UUID: 6a5bb6c471d04ddf9b8f9838f4c1c4fc-20220314
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 995635809; Mon, 14 Mar 2022 16:16:24 +0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 14 Mar 2022 16:16:23 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 14 Mar 2022 16:16:23 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Mar 2022 16:16:22 +0800
Message-ID: <9671f38a0e22d70fba77d1e35520c2a16c93d119.camel@mediatek.com>
Subject: Re: [RESEND V6 0/5] add display support for MediaTek SoC MT8186
From: CK Hu <ck.hu@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>
Date: Mon, 14 Mar 2022 16:16:17 +0800
In-Reply-To: <bf6c9d9270f54fe7baff62998498c1a75a69f723.camel@mediatek.com>
References: <20220303065725.23384-1-rex-bc.chen@mediatek.com>
 <bf6c9d9270f54fe7baff62998498c1a75a69f723.camel@mediatek.com>
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
Cc: devicetree@vger.kernel.org, airlied@linux.ie, jassisinghbrar@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, yongqiang.niu@mediatek.com,
 hsinyi@chromium.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Rex:

On Mon, 2022-03-14 at 14:30 +0800, Rex-BC Chen wrote:
> Hello Chun-Kuang,
> 
> Do I need to rebase this series to your branch mediatek-drm-fixes and
> send next version?

That's good.

Regards,
CK

> 
> BRs,
> Rex
> 
> On Thu, 2022-03-03 at 14:57 +0800, Rex-BC Chen wrote:
> > v6:
> > 1. Remove mmsys patches which are accepted.
> > 2. Fix error of dt-binding.
> > 
> > v5:
> > 1. Add binding patch of aal for MT8183.
> > 2. Revise enum to const.
> > 3. Change to use enum for mutex.
> > 4. Remove patches which are accepted by maintainers. (mmsys and
> > mutex)
> > 
> > v4:
> > 1. Remove binding of dsi and dpi.
> > 2. Revise aal binding.
> > 3. Fix indention in [4/5].
> > 
> > v3:
> > 1. Modify display binding based on mtk display binding patch. ([1])
> > 2. Remove patch: drm/mediatek: separate postmask component from
> > mtk_disp_drv.c
> > 3. Remove compatible of 8186 ovl because we can re-use compatible
> > of
> > 8192 for 8186.
> > 4. Fix issue of space before tab on mutex patch.
> > 
> > [1]: 
> > 
https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-drm-next&id=4ed545e7d10049b5492afc184e61a67e478a2cfd__;!!CTRNKA9wMg0ARbw!wkqxkeKHyS9CpOeGc9hmbilFWKk7g6fyeckortZrr_qhtb7VTP8zMYcuaYjw_w$
> >  
> > 
> > v2:
> > 1. Add binding documentation for mmsys, mutex and mtk_display.
> > 2. Remove duplicated definition of postmask registers on
> > mtk_drm_drv.
> > 3. Add disp_ovl support for MT8186.
> > 4. Add detailed commit messages.
> > 
> > Rex-BC Chen (4):
> >   dt-bindings: display: mediatek: add aal binding for MT8183
> >   dt-bindings: display: mediatek: revise enum to const
> >   dt-bindings: display: mediatek: change to use enum for mutex
> >   dt-bindings: display: mediatek: add MT8186 SoC binding
> > 
> > Yongqiang Niu (1):
> >   drm/mediatek: add display support for MT8186
> > 
> >  .../display/mediatek/mediatek,aal.yaml        |  7 +++-
> >  .../display/mediatek/mediatek,ccorr.yaml      |  5 ++-
> >  .../display/mediatek/mediatek,color.yaml      |  7 ++--
> >  .../display/mediatek/mediatek,dither.yaml     |  4 +--
> >  .../display/mediatek/mediatek,gamma.yaml      |  4 +--
> >  .../display/mediatek/mediatek,mutex.yaml      | 25 ++++++--------
> >  .../display/mediatek/mediatek,ovl-2l.yaml     |  4 +++
> >  .../display/mediatek/mediatek,ovl.yaml        |  8 +++--
> >  .../display/mediatek/mediatek,postmask.yaml   |  4 +++
> >  .../display/mediatek/mediatek,rdma.yaml       |  7 ++--
> >  drivers/gpu/drm/mediatek/mtk_drm_drv.c        | 33
> > +++++++++++++++++++
> >  11 files changed, 76 insertions(+), 32 deletions(-)
> > 
> 
> 

