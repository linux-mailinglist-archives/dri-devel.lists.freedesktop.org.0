Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183D21710D6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 07:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390826E4D0;
	Thu, 27 Feb 2020 06:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTP id D842E6E4D0
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 06:09:43 +0000 (UTC)
X-UUID: 090e36d2203c48729c8b76f2daca3830-20200227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=8hObMDkCZhI/DRnWGjAJpxpuzXkK7SPUl3OhA8dm39o=; 
 b=IdRx2Km31sN0fY3wFTEotJ/PWfrQ+GfiQdnfHck4R92x/7fk5b3SmddFlVXYUnJh5uUkCTTqNxgMTiXyMsfkKmPDPDD4/ZCGudXlhUpvOFVttzeccpdVabIs1ESzVgfnSwHHuuk/j5TXRAZv4jbu1RF3lFPCCFcXKjJz938M+3o=;
X-UUID: 090e36d2203c48729c8b76f2daca3830-20200227
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 180435795; Thu, 27 Feb 2020 14:09:37 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 27 Feb 2020 14:08:39 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkcas08.mediatek.inc
 (172.21.101.126) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 27 Feb 2020 14:09:40 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 27 Feb 2020 14:09:25 +0800
Message-ID: <1582783776.30808.1.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Remove debug messages for function calls
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Thu, 27 Feb 2020 14:09:36 +0800
In-Reply-To: <20200226112723.649954-1-enric.balletbo@collabora.com>
References: <20200226112723.649954-1-enric.balletbo@collabora.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Enric:

On Wed, 2020-02-26 at 12:27 +0100, Enric Balletbo i Serra wrote:
> Equivalent information can be nowadays obtained using function tracer.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 5 -----
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 2 --
>  2 files changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index a236499123aa..882c690d3f13 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -192,7 +192,6 @@ static int mtk_crtc_ddp_clk_enable(struct mtk_drm_crtc *mtk_crtc)
>  	int ret;
>  	int i;
>  
> -	DRM_DEBUG_DRIVER("%s\n", __func__);
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
>  		ret = clk_prepare_enable(mtk_crtc->ddp_comp[i]->clk);
>  		if (ret) {
> @@ -212,7 +211,6 @@ static void mtk_crtc_ddp_clk_disable(struct mtk_drm_crtc *mtk_crtc)
>  {
>  	int i;
>  
> -	DRM_DEBUG_DRIVER("%s\n", __func__);
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
>  		clk_disable_unprepare(mtk_crtc->ddp_comp[i]->clk);
>  }
> @@ -257,7 +255,6 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>  	int ret;
>  	int i;
>  
> -	DRM_DEBUG_DRIVER("%s\n", __func__);
>  	if (WARN_ON(!crtc->state))
>  		return -EINVAL;
>  
> @@ -298,7 +295,6 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>  		goto err_mutex_unprepare;
>  	}
>  
> -	DRM_DEBUG_DRIVER("mediatek_ddp_ddp_path_setup\n");
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr - 1; i++) {
>  		mtk_ddp_add_comp_to_path(mtk_crtc->config_regs,
>  					 mtk_crtc->ddp_comp[i]->id,
> @@ -348,7 +344,6 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
>  	struct drm_crtc *crtc = &mtk_crtc->base;
>  	int i;
>  
> -	DRM_DEBUG_DRIVER("%s\n", __func__);
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
>  		mtk_ddp_comp_stop(mtk_crtc->ddp_comp[i]);
>  		if (i == 1)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 17f118ee0e57..4934834977b3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -570,7 +570,6 @@ static int mtk_drm_sys_suspend(struct device *dev)
>  	int ret;
>  
>  	ret = drm_mode_config_helper_suspend(drm);
> -	DRM_DEBUG_DRIVER("mtk_drm_sys_suspend\n");
>  
>  	return ret;
>  }
> @@ -582,7 +581,6 @@ static int mtk_drm_sys_resume(struct device *dev)
>  	int ret;
>  
>  	ret = drm_mode_config_helper_resume(drm);
> -	DRM_DEBUG_DRIVER("mtk_drm_sys_resume\n");
>  
>  	return ret;
>  }

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
