Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 114481A77EB
	for <lists+dri-devel@lfdr.de>; Tue, 14 Apr 2020 11:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86A3B89CA0;
	Tue, 14 Apr 2020 09:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0747789CA0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Apr 2020 09:55:34 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03E9tVEi020102;
 Tue, 14 Apr 2020 04:55:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1586858131;
 bh=2vfDE/UDiAAIXwZSC66VTPzR+TiMbKXqSyJA07trdiM=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=WDwarCoblaLZSXxQXb7eYaBaO+pkaW+fdQhmHfKNKnhMFCmijXWpBIeS/4jPi5+oA
 VKqx80DxrU8wY+qS7bTnLh3YRJA+X0XWWLssnRxE8xea3+G4gU3u3xPSXWo4T22ghr
 TWv6QO50xDeLLtAvjElXFFmTuP7a6c0BDmTMIuJM=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 03E9tVt7088945
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 14 Apr 2020 04:55:31 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Tue, 14
 Apr 2020 04:55:31 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Tue, 14 Apr 2020 04:55:31 -0500
Received: from [10.1.3.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03E9tTLP000539;
 Tue, 14 Apr 2020 04:55:30 -0500
Subject: Re: [PATCH 28/44] drm/tidss: Don't use drm_device->dev_private
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
 <20200403135828.2542770-29-daniel.vetter@ffwll.ch>
From: Jyri Sarha <jsarha@ti.com>
Autocrypt: addr=jsarha@ti.com; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7911216a-4319-daeb-70a2-ed849f590b8e@ti.com>
Date: Tue, 14 Apr 2020 12:55:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200403135828.2542770-29-daniel.vetter@ffwll.ch>
Content-Language: en-GB
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 03/04/2020 16:58, Daniel Vetter wrote:
> Upcasting using a container_of macro is more typesafe, faster and
> easier for the compiler to optimize.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>

Tested-by: Jyri Sarha <jsarha@ti.com>

> ---
>  drivers/gpu/drm/tidss/tidss_crtc.c  | 16 ++++++++--------
>  drivers/gpu/drm/tidss/tidss_drv.c   |  2 --
>  drivers/gpu/drm/tidss/tidss_drv.h   |  2 ++
>  drivers/gpu/drm/tidss/tidss_irq.c   | 12 ++++++------
>  drivers/gpu/drm/tidss/tidss_kms.c   |  2 +-
>  drivers/gpu/drm/tidss/tidss_plane.c |  6 +++---
>  6 files changed, 20 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
> index d4ce9bab8c7e..2396262c09e4 100644
> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> @@ -24,7 +24,7 @@
>  static void tidss_crtc_finish_page_flip(struct tidss_crtc *tcrtc)
>  {
>  	struct drm_device *ddev = tcrtc->crtc.dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	struct drm_pending_vblank_event *event;
>  	unsigned long flags;
>  	bool busy;
> @@ -88,7 +88,7 @@ static int tidss_crtc_atomic_check(struct drm_crtc *crtc,
>  				   struct drm_crtc_state *state)
>  {
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	struct dispc_device *dispc = tidss->dispc;
>  	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>  	u32 hw_videoport = tcrtc->hw_videoport;
> @@ -165,7 +165,7 @@ static void tidss_crtc_atomic_flush(struct drm_crtc *crtc,
>  {
>  	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	unsigned long flags;
>  
>  	dev_dbg(ddev->dev,
> @@ -216,7 +216,7 @@ static void tidss_crtc_atomic_enable(struct drm_crtc *crtc,
>  {
>  	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>  	unsigned long flags;
>  	int r;
> @@ -259,7 +259,7 @@ static void tidss_crtc_atomic_disable(struct drm_crtc *crtc,
>  {
>  	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	unsigned long flags;
>  
>  	dev_dbg(ddev->dev, "%s, event %p\n", __func__, crtc->state->event);
> @@ -295,7 +295,7 @@ enum drm_mode_status tidss_crtc_mode_valid(struct drm_crtc *crtc,
>  {
>  	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  
>  	return dispc_vp_mode_valid(tidss->dispc, tcrtc->hw_videoport, mode);
>  }
> @@ -314,7 +314,7 @@ static const struct drm_crtc_helper_funcs tidss_crtc_helper_funcs = {
>  static int tidss_crtc_enable_vblank(struct drm_crtc *crtc)
>  {
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  
>  	dev_dbg(ddev->dev, "%s\n", __func__);
>  
> @@ -328,7 +328,7 @@ static int tidss_crtc_enable_vblank(struct drm_crtc *crtc)
>  static void tidss_crtc_disable_vblank(struct drm_crtc *crtc)
>  {
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  
>  	dev_dbg(ddev->dev, "%s\n", __func__);
>  
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 7d4465d58be8..99edc66ebdef 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -147,8 +147,6 @@ static int tidss_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, tidss);
>  
> -	ddev->dev_private = tidss;
> -
>  	ret = dispc_init(tidss);
>  	if (ret) {
>  		dev_err(dev, "failed to initialize dispc: %d\n", ret);
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index e2aa6436ad18..b23cd95c8d78 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -33,6 +33,8 @@ struct tidss_device {
>  	struct drm_atomic_state *saved_state;
>  };
>  
> +#define to_tidss(__dev) container_of(__dev, struct tidss_device, ddev)
> +
>  int tidss_runtime_get(struct tidss_device *tidss);
>  void tidss_runtime_put(struct tidss_device *tidss);
>  
> diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
> index 612c046738e5..1b80f2d62e0a 100644
> --- a/drivers/gpu/drm/tidss/tidss_irq.c
> +++ b/drivers/gpu/drm/tidss/tidss_irq.c
> @@ -23,7 +23,7 @@ static void tidss_irq_update(struct tidss_device *tidss)
>  void tidss_irq_enable_vblank(struct drm_crtc *crtc)
>  {
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>  	u32 hw_videoport = tcrtc->hw_videoport;
>  	unsigned long flags;
> @@ -38,7 +38,7 @@ void tidss_irq_enable_vblank(struct drm_crtc *crtc)
>  void tidss_irq_disable_vblank(struct drm_crtc *crtc)
>  {
>  	struct drm_device *ddev = crtc->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
>  	u32 hw_videoport = tcrtc->hw_videoport;
>  	unsigned long flags;
> @@ -53,7 +53,7 @@ void tidss_irq_disable_vblank(struct drm_crtc *crtc)
>  irqreturn_t tidss_irq_handler(int irq, void *arg)
>  {
>  	struct drm_device *ddev = (struct drm_device *)arg;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	unsigned int id;
>  	dispc_irq_t irqstatus;
>  
> @@ -95,7 +95,7 @@ void tidss_irq_resume(struct tidss_device *tidss)
>  
>  void tidss_irq_preinstall(struct drm_device *ddev)
>  {
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  
>  	spin_lock_init(&tidss->wait_lock);
>  
> @@ -109,7 +109,7 @@ void tidss_irq_preinstall(struct drm_device *ddev)
>  
>  int tidss_irq_postinstall(struct drm_device *ddev)
>  {
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	unsigned long flags;
>  	unsigned int i;
>  
> @@ -138,7 +138,7 @@ int tidss_irq_postinstall(struct drm_device *ddev)
>  
>  void tidss_irq_uninstall(struct drm_device *ddev)
>  {
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  
>  	tidss_runtime_get(tidss);
>  	dispc_set_irqenable(tidss->dispc, 0);
> diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
> index 4bd339a467a4..4b99e9fa84a5 100644
> --- a/drivers/gpu/drm/tidss/tidss_kms.c
> +++ b/drivers/gpu/drm/tidss/tidss_kms.c
> @@ -25,7 +25,7 @@
>  static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
>  {
>  	struct drm_device *ddev = old_state->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  
>  	dev_dbg(ddev->dev, "%s\n", __func__);
>  
> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> index ff99b2dd4a17..23bb3e59504b 100644
> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> @@ -22,7 +22,7 @@ static int tidss_plane_atomic_check(struct drm_plane *plane,
>  				    struct drm_plane_state *state)
>  {
>  	struct drm_device *ddev = plane->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	struct tidss_plane *tplane = to_tidss_plane(plane);
>  	const struct drm_format_info *finfo;
>  	struct drm_crtc_state *crtc_state;
> @@ -101,7 +101,7 @@ static void tidss_plane_atomic_update(struct drm_plane *plane,
>  				      struct drm_plane_state *old_state)
>  {
>  	struct drm_device *ddev = plane->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	struct tidss_plane *tplane = to_tidss_plane(plane);
>  	struct drm_plane_state *state = plane->state;
>  	u32 hw_videoport;
> @@ -133,7 +133,7 @@ static void tidss_plane_atomic_disable(struct drm_plane *plane,
>  				       struct drm_plane_state *old_state)
>  {
>  	struct drm_device *ddev = plane->dev;
> -	struct tidss_device *tidss = ddev->dev_private;
> +	struct tidss_device *tidss = to_tidss(ddev);
>  	struct tidss_plane *tplane = to_tidss_plane(plane);
>  
>  	dev_dbg(ddev->dev, "%s\n", __func__);
> 


-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
