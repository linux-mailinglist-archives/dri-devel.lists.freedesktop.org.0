Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4701B17343B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2020 10:37:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6F1D6E148;
	Fri, 28 Feb 2020 09:37:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2D6396E148
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2020 09:37:48 +0000 (UTC)
X-UUID: f3b7790cce4e46a48dd3fb5a2e6e76ae-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=wbDyMawynlrwHWkUP0rf/CmT5tZ9aeV3JKqgN+jnUl8=; 
 b=ZRx8M3Wnifgb+h9tl0gfO6h5jaIQLReCZBPxWaOoSwovd/QlrWYu7DNqjAV7NACZooSZvcV1UjGyrTZFHhGlelpTLEpVpDaTzAsdymzfuVlK1mzucRwLmXvIUAEG4Lg9dM29X9j1G1KMI2s9myAZmEISNLp5h5GGR4IRTf7Lc8I=;
X-UUID: f3b7790cce4e46a48dd3fb5a2e6e76ae-20200228
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 1750308215; Fri, 28 Feb 2020 17:37:45 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 17:36:54 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 28 Feb 2020 17:37:27 +0800
Message-ID: <1582882664.22475.6.camel@mtksdaap41>
Subject: Re: [PATCH v10 4/5] soc / drm: mediatek: Move routing control to
 mmsys device
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Fri, 28 Feb 2020 17:37:44 +0800
In-Reply-To: <20200227180858.1514157-5-enric.balletbo@collabora.com>
References: <20200227180858.1514157-1-enric.balletbo@collabora.com>
 <20200227180858.1514157-5-enric.balletbo@collabora.com>
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
Cc: mark.rutland@arm.com, Kate Stewart <kstewart@linuxfoundation.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, airlied@linux.ie,
 mturquette@baylibre.com, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, laurent.pinchart@ideasonboard.com,
 ulrich.hecht+renesas@gmail.com, Collabora
 Kernel ML <kernel@collabora.com>, linux-clk@vger.kernel.org,
 Weiyi Lu <weiyi.lu@mediatek.com>, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 frank-w@public-files.de, Seiya
 Wang <seiya.wang@mediatek.com>, sean.wang@mediatek.com,
 Houlong Wei <houlong.wei@mediatek.com>, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Allison Randal <allison@lohutok.net>,
 Matthias Brugger <mbrugger@suse.com>, sboyd@kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Enric:

On Thu, 2020-02-27 at 19:08 +0100, Enric Balletbo i Serra wrote:
> Provide a mtk_mmsys_ddp_connect() and mtk_mmsys_disconnect() functions to
> replace mtk_ddp_add_comp_to_path() and mtk_ddp_remove_comp_from_path().
> Those functions will allow DRM driver and others to control the data
> path routing.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v10:
> - Introduced a new patch to move routing control into mmsys driver.
> - Removed the patch to use regmap as is not needed anymore.
> 
> Changes in v9: None
> Changes in v8: None
> Changes in v7: None
> 
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c |  13 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c  | 256 ----------------------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h  |   7 -
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  |  13 +-
>  drivers/soc/mediatek/mtk-mmsys.c        | 275 ++++++++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mmsys.h  |  19 ++
>  6 files changed, 306 insertions(+), 277 deletions(-)
>  create mode 100644 include/linux/soc/mediatek/mtk-mmsys.h
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index fd4042de12f2..3c89449bea6e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -6,6 +6,7 @@
>  #include <linux/clk.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/soc/mediatek/mtk-cmdq.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
>  
>  #include <asm/barrier.h>
>  #include <soc/mediatek/smi.h>
> @@ -296,9 +297,9 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>  	}
>  
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
> -		mtk_ddp_add_comp_to_path(mtk_crtc->config_regs,
> -					 mtk_crtc->ddp_comp[i]->id,
> -					 mtk_crtc->ddp_comp[i + 1]->id);
> +		mtk_mmsys_ddp_connect(mtk_crtc->config_regs,
> +				      mtk_crtc->ddp_comp[i]->id,
> +				      mtk_crtc->ddp_comp[i + 1]->id);

When CONFIG_MTK_MMSYS is not enable, this would built fail. So make some
modification in Kconfig.

>  		mtk_disp_mutex_add_comp(mtk_crtc->mutex,
>  					mtk_crtc->ddp_comp[i]->id);
>  	}
> @@ -355,9 +356,9 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
>  					   mtk_crtc->ddp_comp[i]->id);
>  	mtk_disp_mutex_disable(mtk_crtc->mutex);
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
> -		mtk_ddp_remove_comp_from_path(mtk_crtc->config_regs,
> -					      mtk_crtc->ddp_comp[i]->id,
> -					      mtk_crtc->ddp_comp[i + 1]->id);
> +		mtk_mmsys_ddp_disconnect(mtk_crtc->config_regs,
> +					 mtk_crtc->ddp_comp[i]->id,
> +					 mtk_crtc->ddp_comp[i + 1]->id);
>  		mtk_disp_mutex_remove_comp(mtk_crtc->mutex,
>  					   mtk_crtc->ddp_comp[i]->id);
>  	}
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index b885f60f474c..014c1bbe1df2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -13,26 +13,6 @@
>  #include "mtk_drm_ddp.h"
>  #include "mtk_drm_ddp_comp.h"
>  

[snip]

> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> new file mode 100644
> index 000000000000..02fd86e62a8d
> --- /dev/null
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + */
> +
> +#ifndef __MTK_MMSYS_H
> +#define __MTK_MMSYS_H
> +
> +enum mtk_ddp_comp_id;
> +
> +void mtk_mmsys_ddp_connect(void __iomem *config_regs,

I prefer the first parameter to be 'struct device *dev' which is the
device pointer of mmsys device. and mmsys driver could use this pointer
to get its register address.

Regards,
CK

> +			   enum mtk_ddp_comp_id cur,
> +			   enum mtk_ddp_comp_id next);
> +
> +void mtk_mmsys_ddp_disconnect(void __iomem *config_regs,
> +			      enum mtk_ddp_comp_id cur,
> +			      enum mtk_ddp_comp_id next);
> +
> +#endif /* __MTK_MMSYS_H */

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
