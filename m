Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 998939D5AB8
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 09:10:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F13010E215;
	Fri, 22 Nov 2024 08:10:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="xaEuqunG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 571 seconds by postgrey-1.36 at gabe;
 Fri, 22 Nov 2024 08:10:04 UTC
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300B910E215
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 08:10:04 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AM89asO017472;
 Fri, 22 Nov 2024 02:09:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1732262977;
 bh=ztkw06yK/nlz1vzFB2vJQ4gxrnuf2lEuQeRJnZIBOMk=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=xaEuqunGg9WHMljh1Kx7lPmr0WgC5asJsH4B4pD5WshzrnxOYnK3YIc2AnNBT79VA
 D/9/SFuxBctphfRuhagQn0bRA51zO0ugOdJ4XHjWJzDTnZX2mq2yON9yOBww0S8Usn
 3LL+U8K3iZSR6S4AdRsqOPwHUjcx+fsXHRMMDH1o=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AM89afS055593
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 22 Nov 2024 02:09:36 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 22
 Nov 2024 02:09:36 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 22 Nov 2024 02:09:36 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AM89WqI069075;
 Fri, 22 Nov 2024 02:09:33 -0600
Message-ID: <f044e2b1-be0b-ba59-c4fe-5a56db9fa858@ti.com>
Date: Fri, 22 Nov 2024 13:39:32 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 7/7] drm/tidss: Rename 'wait_lock' to 'irq_lock'
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Jonathan
 Cormier <jcormier@criticallink.com>
References: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
 <20241021-tidss-irq-fix-v1-7-82ddaec94e4a@ideasonboard.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20241021-tidss-irq-fix-v1-7-82ddaec94e4a@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 21/10/24 19:37, Tomi Valkeinen wrote:
> The 'wait_lock' name seems to be a copy-paste from omapdrm, and makes no
> sense here. Rename it to 'irq_lock'. Also clarify the related comment to
> make it clear what it protects, and drop any comments related to
> 'wait_list' which doesn't exist in tidss.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c |  4 ++--
>  drivers/gpu/drm/tidss/tidss_drv.c   |  2 +-
>  drivers/gpu/drm/tidss/tidss_drv.h   |  5 +++--
>  drivers/gpu/drm/tidss/tidss_irq.c   | 19 +++++++++----------
>  4 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
> index 07f5c26cfa26..cacb5f3d8085 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -2769,10 +2769,10 @@ static void dispc_softreset_k2g(struct dispc_device *dispc)
>  {
>  	unsigned long flags;
>  
> -	spin_lock_irqsave(&dispc->tidss->wait_lock, flags);
> +	spin_lock_irqsave(&dispc->tidss->irq_lock, flags);
>  	dispc_set_irqenable(dispc, 0);
>  	dispc_read_and_clear_irqstatus(dispc);
> -	spin_unlock_irqrestore(&dispc->tidss->wait_lock, flags);
> +	spin_unlock_irqrestore(&dispc->tidss->irq_lock, flags);
>  
>  	for (unsigned int vp_idx = 0; vp_idx < dispc->feat->num_vps; ++vp_idx)
>  		VP_REG_FLD_MOD(dispc, vp_idx, DISPC_VP_CONTROL, 0, 0, 0);
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index d15f836dca95..c7de8c9fa12e 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -138,7 +138,7 @@ static int tidss_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, tidss);
>  
> -	spin_lock_init(&tidss->wait_lock);
> +	spin_lock_init(&tidss->irq_lock);
>  
>  	ret = dispc_init(tidss);
>  	if (ret) {
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index d7f27b0b0315..7f4f4282bc04 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -29,8 +29,9 @@ struct tidss_device {
>  
>  	unsigned int irq;
>  
> -	spinlock_t wait_lock;	/* protects the irq masks */
> -	dispc_irq_t irq_mask;	/* enabled irqs in addition to wait_list */
> +	/* protects the irq masks field and irqenable/irqstatus registers */
> +	spinlock_t irq_lock;
> +	dispc_irq_t irq_mask;	/* enabled irqs */
>  };
>  
>  #define to_tidss(__dev) container_of(__dev, struct tidss_device, ddev)
> diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
> index 8af4682ba56b..5abc788781f4 100644
> --- a/drivers/gpu/drm/tidss/tidss_irq.c
> +++ b/drivers/gpu/drm/tidss/tidss_irq.c
> @@ -15,10 +15,9 @@
>  #include "tidss_irq.h"
>  #include "tidss_plane.h"
>  
> -/* call with wait_lock and dispc runtime held */
>  static void tidss_irq_update(struct tidss_device *tidss)
>  {
> -	assert_spin_locked(&tidss->wait_lock);
> +	assert_spin_locked(&tidss->irq_lock);
>  
>  	dispc_set_irqenable(tidss->dispc, tidss->irq_mask);
>  }
> @@ -31,11 +30,11 @@ void tidss_irq_enable_vblank(struct drm_crtc *crtc)
>  	u32 hw_videoport = tcrtc->hw_videoport;
>  	unsigned long flags;
>  
> -	spin_lock_irqsave(&tidss->wait_lock, flags);
> +	spin_lock_irqsave(&tidss->irq_lock, flags);
>  	tidss->irq_mask |= DSS_IRQ_VP_VSYNC_EVEN(hw_videoport) |
>  			   DSS_IRQ_VP_VSYNC_ODD(hw_videoport);
>  	tidss_irq_update(tidss);
> -	spin_unlock_irqrestore(&tidss->wait_lock, flags);
> +	spin_unlock_irqrestore(&tidss->irq_lock, flags);
>  }
>  
>  void tidss_irq_disable_vblank(struct drm_crtc *crtc)
> @@ -46,11 +45,11 @@ void tidss_irq_disable_vblank(struct drm_crtc *crtc)
>  	u32 hw_videoport = tcrtc->hw_videoport;
>  	unsigned long flags;
>  
> -	spin_lock_irqsave(&tidss->wait_lock, flags);
> +	spin_lock_irqsave(&tidss->irq_lock, flags);
>  	tidss->irq_mask &= ~(DSS_IRQ_VP_VSYNC_EVEN(hw_videoport) |
>  			     DSS_IRQ_VP_VSYNC_ODD(hw_videoport));
>  	tidss_irq_update(tidss);
> -	spin_unlock_irqrestore(&tidss->wait_lock, flags);
> +	spin_unlock_irqrestore(&tidss->irq_lock, flags);
>  }
>  
>  static irqreturn_t tidss_irq_handler(int irq, void *arg)
> @@ -60,9 +59,9 @@ static irqreturn_t tidss_irq_handler(int irq, void *arg)
>  	unsigned int id;
>  	dispc_irq_t irqstatus;
>  
> -	spin_lock(&tidss->wait_lock);
> +	spin_lock(&tidss->irq_lock);
>  	irqstatus = dispc_read_and_clear_irqstatus(tidss->dispc);
> -	spin_unlock(&tidss->wait_lock);
> +	spin_unlock(&tidss->irq_lock);
>  
>  	for (id = 0; id < tidss->num_crtcs; id++) {
>  		struct drm_crtc *crtc = tidss->crtcs[id];
> @@ -95,9 +94,9 @@ void tidss_irq_resume(struct tidss_device *tidss)
>  {
>  	unsigned long flags;
>  
> -	spin_lock_irqsave(&tidss->wait_lock, flags);
> +	spin_lock_irqsave(&tidss->irq_lock, flags);
>  	tidss_irq_update(tidss);
> -	spin_unlock_irqrestore(&tidss->wait_lock, flags);
> +	spin_unlock_irqrestore(&tidss->irq_lock, flags);
>  }
>  
>  int tidss_irq_install(struct drm_device *ddev, unsigned int irq)
> 
