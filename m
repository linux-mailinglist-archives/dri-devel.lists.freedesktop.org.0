Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0ED55BD0A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 03:42:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509CE10E8E4;
	Tue, 28 Jun 2022 01:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF9EF10E8E4
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 01:42:10 +0000 (UTC)
X-UUID: e83c6e49b1e64494b837e5c13ccd3e9d-20220628
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7, REQID:c462e8d4-a615-4726-bc8e-3bffc0b621d1, OB:10,
 L
 OB:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,A
 CTION:release,TS:45
X-CID-INFO: VERSION:1.1.7, REQID:c462e8d4-a615-4726-bc8e-3bffc0b621d1, OB:10,
 LOB
 :0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-META: VersionHash:87442a2, CLOUDID:8ce6fdd5-5d6d-4eaf-a635-828a3ee48b7c,
 C
 OID:ce89120f3ff4,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: e83c6e49b1e64494b837e5c13ccd3e9d-20220628
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1960792024; Tue, 28 Jun 2022 09:42:05 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 28 Jun 2022 09:42:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jun 2022 09:42:03 +0800
Message-ID: <026149c3a069eaf13f83bb3f57669d6853a4e795.camel@mediatek.com>
Subject: Re: [PATCH v23 09/14] drm/mediatek: add mediatek-drm plane color
 encoding info
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 <wim@linux-watchdog.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
Date: Tue, 28 Jun 2022 09:42:03 +0800
In-Reply-To: <20220620091930.27797-10-nancy.lin@mediatek.com>
References: <20220620091930.27797-1-nancy.lin@mediatek.com>
 <20220620091930.27797-10-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Nancy:

On Mon, 2022-06-20 at 17:19 +0800, Nancy.Lin wrote:
> Add plane color encoding information for color space conversion.
> It's a preparation for adding support for mt8195 ovl_adaptor mdp_rdma
> csc control.

Applied to mediatek-drm-next [1], thanks.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Regards,
CK

> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 1 +
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index e5fae4ec2337..39cb9a80d976 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -138,6 +138,7 @@ static void mtk_plane_update_new_state(struct
> drm_plane_state *new_state,
>  	mtk_plane_state->pending.width = drm_rect_width(&new_state-
> >dst);
>  	mtk_plane_state->pending.height = drm_rect_height(&new_state-
> >dst);
>  	mtk_plane_state->pending.rotation = new_state->rotation;
> +	mtk_plane_state->pending.color_encoding = new_state-
> >color_encoding;
>  }
>  
>  static void mtk_plane_atomic_async_update(struct drm_plane *plane,
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> index d454bece9535..2d5ec66e3df1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -24,6 +24,7 @@ struct mtk_plane_pending_state {
>  	bool				dirty;
>  	bool				async_dirty;
>  	bool				async_config;
> +	enum drm_color_encoding		color_encoding;
>  };
>  
>  struct mtk_plane_state {

