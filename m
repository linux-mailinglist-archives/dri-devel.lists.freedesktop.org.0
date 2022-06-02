Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 439BD53B240
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 05:50:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2FD10E429;
	Thu,  2 Jun 2022 03:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB68010E436
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 03:50:14 +0000 (UTC)
X-UUID: e362700a8d8d4b6ea2f942f28d9e6338-20220602
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:f76b4cdc-e8fa-4f57-9431-097f5be524d7, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:7b998c0d-3a0d-4bbe-9d72-0e5d26d57423,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: e362700a8d8d4b6ea2f942f28d9e6338-20220602
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1420575617; Thu, 02 Jun 2022 11:50:02 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Thu, 2 Jun 2022 11:50:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Thu, 2 Jun 2022 11:50:00 +0800
Message-ID: <358b183faed73672e8fa4f6eb0d48fb067aec87d.camel@mediatek.com>
Subject: Re: [PATCH v10 00/21] drm/mediatek: Add mt8195 DisplayPort driver
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>, "Kishon
 Vijay Abraham I" <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, "Helge
 Deller" <deller@gmx.de>, CK Hu <ck.hu@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <maxime@cerno.tech>
Date: Thu, 2 Jun 2022 11:50:00 +0800
In-Reply-To: <20220523104758.29531-1-granquet@baylibre.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> this series is built around the DisplayPort driver. The dpi/dpintf
> driver and the added helper functions are required for the
> DisplayPort
> driver to work.
> 
> This v10 still has some un-answered comments and TODOs for v11.
> 
> This has been tested sucessfully on a 5.18-next based "vendor
> branch".
> 
> There's a missing dependency in the mediatek clock framework to allow
> a
> mux clock to change it's parent automatically on rate change.
> Without this change, the dpi driver won't properly set the clocks on
> mode change and thus nothing will be displayed on screen.
> 
> Changes from v9:
> - The DP-Phy is back to being a child device of the DP driver (as in
> v8)
> - hot plug detection has been added back to Embedded Display Port...
> as
>   after discussing with mediatek experts, this is needed eventhough
> the
>   Embedded Display port is not un-pluggable
> - rebased on linux-next
> - simplified/split train_handler function, as suggested by Rex
> - added comments on the sleep/delays present in the code
> - removed previous patch introducing retries when receiving AUX_DEFER
> as
>   this is already handled in the dp_aux framework
> - added max-lane and max-linkrate device tree u8 properties instead
> of
>   hardcoded #defines
> 
> Things that are in my todolist for v11:
> - retrieve CK/DE support from panel driver instead of hardcoding it
> into
>   the dpi driver
> - refcount the dp driver "enabled" status for "future proofing"
> - review the drm_dp_helpers for features/functions that have been
>   re-implemented in the mediatek dp drivers
> 
> Older revisions:
> RFC - 
> https://lore.kernel.org/linux-mediatek/20210816192523.1739365-1-msp@baylibre.com/
> v1  - 
> https://lore.kernel.org/linux-mediatek/20210906193529.718845-1-msp@baylibre.com/
> v2  - 
> https://lore.kernel.org/linux-mediatek/20210920084424.231825-1-msp@baylibre.com/
> v3  - 
> https://lore.kernel.org/linux-mediatek/20211001094443.2770169-1-msp@baylibre.com/
> v4  - 
> https://lore.kernel.org/linux-mediatek/20211011094624.3416029-1-msp@baylibre.com/
> v5  - 
> https://lore.kernel.org/all/20211021092707.3562523-1-msp@baylibre.com/
> v6  - 
> https://lore.kernel.org/linux-mediatek/20211110130623.20553-1-granquet@baylibre.com/
> v7  - 
> https://lore.kernel.org/linux-mediatek/20211217150854.2081-1-granquet@baylibre.com/
> v8  - 
> https://lore.kernel.org/linux-mediatek/20220218145437.18563-1-granquet@baylibre.com/
> v9  - 
> https://lore.kernel.org/all/20220327223927.20848-1-granquet@baylibre.com/
> 
> Functional dependencies are:
> - Add Mediatek Soc DRM (vdosys0) support for mt8195
>   
> https://lore.kernel.org/linux-mediatek/20220419094143.9561-2-jason-jh.lin@mediatek.com/
> - Add MediaTek SoC DRM (vdosys1) support for mt8195
>   
> https://lore.kernel.org/linux-mediatek/20220512053128.31415-1-nancy.lin@mediatek.com/
> 
> 
> Guillaume Ranquet (15):
>   drm/edid: Convert cea_sad helper struct to kernelDoc
>   drm/edid: Add cea_sad helpers for freq/length
>   drm/mediatek: dpi: move dpi limits to SoC config
>   drm/mediatek: dpi: implement a CK/DE pol toggle in SoC config
>   drm/mediatek: dpi: implement a swap_input toggle in SoC config
>   drm/mediatek: dpi: move dimension mask to SoC config
>   drm/mediatek: dpi: move hvsize_mask to SoC config
>   drm/mediatek: dpi: move swap_shift to SoC config
>   drm/mediatek: dpi: move the yuv422_en_bit to SoC config
>   drm/mediatek: dpi: move the csc_enable bit to SoC config
>   drm/mediatek: dpi: Add dpintf support
>   drm/mediatek: dpi: Only enable dpi after the bridge is enabled
>   drm/meditek: dpi: Add matrix_sel helper
>   drm/mediatek: Add mt8195 External DisplayPort support
>   drm/mediatek: DP audio support for mt8195
> 
> Jitao Shi (1):
>   drm/mediatek: add hpd debounce
> 
> Markus Schneider-Pargmann (5):
>   dt-bindings: mediatek,dpi: Add DPINTF compatible
>   dt-bindings: mediatek,dp: Add Display Port binding
>   video/hdmi: Add audio_infoframe packing for DP
>   phy: phy-mtk-dp: Add driver for DP phy
>   drm/mediatek: Add mt8195 Embedded DisplayPort driver
> 
>  .../display/mediatek/mediatek,dp.yaml         |   99 +
>  .../display/mediatek/mediatek,dpi.yaml        |   13 +-
>  MAINTAINERS                                   |    1 +
>  drivers/gpu/drm/drm_edid.c                    |   74 +
>  drivers/gpu/drm/mediatek/Kconfig              |    8 +
>  drivers/gpu/drm/mediatek/Makefile             |    2 +
>  drivers/gpu/drm/mediatek/mtk_dp.c             | 3419
> +++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  570 +++
>  drivers/gpu/drm/mediatek/mtk_dpi.c            |  272 +-
>  drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   38 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c   |    8 +
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h   |    1 +
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |    8 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h        |    3 +
>  drivers/phy/mediatek/Kconfig                  |    8 +
>  drivers/phy/mediatek/Makefile                 |    1 +
>  drivers/phy/mediatek/phy-mtk-dp.c             |  200 +
>  drivers/video/hdmi.c                          |   82 +-
>  include/drm/dp/drm_dp_helper.h                |    2 +
>  include/drm/drm_edid.h                        |   26 +-
>  include/linux/hdmi.h                          |    7 +-
>  include/linux/soc/mediatek/mtk-mmsys.h        |    4 +-
>  22 files changed, 4765 insertions(+), 81 deletions(-)
>  create mode 100644
> Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
>  create mode 100644 drivers/phy/mediatek/phy-mtk-dp.c

Hello all,

Due to the resource issue, I will keep upstreaming Guillaume's MT8195
dp/edp series.

I will check the comments for v8/v9/v10 and have some discussion with
you.

Thanks for your all comments.

BRs,
Bo-Chen

