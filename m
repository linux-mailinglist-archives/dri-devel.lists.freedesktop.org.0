Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA91193409
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 23:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69256E84D;
	Wed, 25 Mar 2020 22:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTP id 33F106E84D
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Mar 2020 22:59:14 +0000 (UTC)
X-UUID: 1100fe8046364fd3b0b1e29e5c74b3b9-20200326
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Rwm8uk+VZBk+Tue2u7MEctjQsGy1qba7rFKBvQkm1A0=; 
 b=i7boojxICfrjyewIWC+X1xbxvlH2IaBTv9AkbDdvDCpyVHtABq0wLj537y3B9jkvO+nQ9icTQZdHivcHeQ5LUaKLrihgdEXtJNsqsGTSTZPbqLD+3G/knMwR+c0dQIfsRcVPy2enuCgOc5Awsl28JYCE/nUviKT2VLkSxdZWOwk=;
X-UUID: 1100fe8046364fd3b0b1e29e5c74b3b9-20200326
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
 with ESMTP id 982338510; Thu, 26 Mar 2020 06:59:08 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 26 Mar 2020 06:59:08 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 26 Mar 2020 06:59:06 +0800
Message-ID: <1585177148.26117.0.camel@mtksdaap41>
Subject: Re: [SPAM][PATCH] drm/mediatek: Remove debug messages for function
 calls
From: CK Hu <ck.hu@mediatek.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Date: Thu, 26 Mar 2020 06:59:08 +0800
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

Acked-by: CK Hu <ck.hu@mediatek.com>

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
