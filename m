Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB627127721
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 09:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71E246EBE6;
	Fri, 20 Dec 2019 08:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id C26CD6EBE6
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 08:28:22 +0000 (UTC)
X-UUID: c65f143ada1c46afac0f06d2010f4ee7-20191220
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2fvqpXZ4f+f8Am+74fysA+SXl4Y8KX7VvKLUjOFoqG0=; 
 b=s2UOmCDxarzcVbKJicgl9WQddBKO1XD3I5dKz8Kv/gCpn685W0zCUWxqUj9ZQ3sV6mRrW1pWyZ6PMDgf5xr34SbJWyXbMnK/nzqQ7ERlXNd5SgU+cbl6ZdGNYcI87+5EfKcWoMoNfc6eIkTVtV1t9XyGkTMIx1pZbgMMwMlo440=;
X-UUID: c65f143ada1c46afac0f06d2010f4ee7-20191220
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1412223534; Fri, 20 Dec 2019 16:28:18 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 16:28:24 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 20 Dec 2019 16:28:14 +0800
Message-ID: <1576830496.22904.1.camel@mtksdaap41>
Subject: Re: [PATCH v5 0/7] drm/mediatek: fix cursor issue and apply CMDQ in
 MTK DRM
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Fri, 20 Dec 2019 16:28:16 +0800
In-Reply-To: <20191210050526.4437-1-bibby.hsieh@mediatek.com>
References: <20191210050526.4437-1-bibby.hsieh@mediatek.com>
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
Cc: drinkcat@chromium.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tfiga@chromium.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bibby:

For this series, applied to mediatek-drm-next-5.6 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-next-5.6

Regards,
CK

On Tue, 2019-12-10 at 13:05 +0800, Bibby Hsieh wrote:
> The CMDQ (Command Queue) in MT8183 is used to help update all
> relevant display controller registers with critical time limation.
> This patch add cmdq interface in ddp_comp interface, let all
> ddp_comp interface can support cpu/cmdq function at the same time.
> 
> These patches also can fixup cursor moving is not smooth
> when heavy load in webgl.
> 
> This patch depends on ptach:
> add drm support for MT8183
> (https://patchwork.kernel.org/cover/11121519/)
> support gce on mt8183 platform
> (https://patchwork.kernel.org/cover/11255147/)
> drm/mediatek: Check return value of mtk_drm_ddp_comp_for_plane
> (https://lore.kernel.org/patchwork/patch/1154517/)
> 
> Changes since v4:
>  - rebase to Linux 5.5-rc1
>  - add fixes tag
> 
> Changes since v3:
>  - remove redundant code and variable
> 
> Changes since v2:
>  - move some changes to another patch
>  - disable layer in atomic_disable()
> 
> Changes since v1:
>  - remove redundant code
>  - merge the duplicate code
>  - use async instead of cursor
> 
> Changes since v0:
>  - remove redundant code
>  - remove patch
>    "drm/mediatek: fix atomic_state reference counting"
>    After remove this patch, the issue we met before is gone.
>    So I do not add any extra code to do something.
> 
> Bibby Hsieh (7):
>   drm/mediatek: use DRM core's atomic commit helper
>   drm/mediatek: handle events when enabling/disabling crtc
>   drm/mediatek: update cursors by using async atomic update
>   drm/mediatek: disable all the planes in atomic_disable
>   drm/mediatek: remove unused external function
>   drm/mediatek: support CMDQ interface in ddp component
>   drm/mediatek: apply CMDQ control flow
> 
>  drivers/gpu/drm/mediatek/mtk_disp_color.c   |   7 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c     |  67 ++++----
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c    |  43 ++---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 165 ++++++++++++++++----
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   2 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 131 ++++++++++++----
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  47 +++---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  86 +---------
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   7 -
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c    |  47 ++++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h    |   2 +
>  11 files changed, 380 insertions(+), 224 deletions(-)
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
