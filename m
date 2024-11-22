Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AD69D5BD3
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 10:21:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE13710EB1E;
	Fri, 22 Nov 2024 09:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="f2cx4Iav";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9C610EB1E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 09:21:57 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 4AM80ENR014706;
 Fri, 22 Nov 2024 02:00:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1732262414;
 bh=NzwBJ9hoNy9zYFQF0RIjxpT+VZivN/OIvGYGZWYheJw=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=f2cx4IavxdZ3ahzhjXIx07KhHeXhX9ET4PWQ56OAfnq8uVuu1ADYhF8umzu4HI1kZ
 VRFxR3Vk2N/vtk+/QEWYa6Azsgrg8kPSDUAPVuAkEB3zXoCmMCXJ7Ih8smwig0+jWZ
 j3INL2XAbltdIFGt9+wqIqTGcPwilYT1B9OB4sxE=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4AM80EaC049337
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 22 Nov 2024 02:00:14 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 22
 Nov 2024 02:00:14 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 22 Nov 2024 02:00:14 -0600
Received: from [172.24.227.193] (devarsht.dhcp.ti.com [172.24.227.193] (may be
 forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4AM80AMi052433;
 Fri, 22 Nov 2024 02:00:11 -0600
Message-ID: <1f47c3c3-812d-2e0e-16f8-db0209f1ebad@ti.com>
Date: Fri, 22 Nov 2024 13:30:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 2/7] drm/tidss: Remove unused OCP error flag
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Jyri Sarha
 <jyri.sarha@iki.fi>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, Jonathan
 Cormier <jcormier@criticallink.com>
References: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
 <20241021-tidss-irq-fix-v1-2-82ddaec94e4a@ideasonboard.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20241021-tidss-irq-fix-v1-2-82ddaec94e4a@ideasonboard.com>
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
> We never use the DSS_IRQ_DEVICE_OCP_ERR flag, and the HW doesn't even
> have such a bit... So remove it.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>  drivers/gpu/drm/tidss/tidss_irq.c | 5 +----
>  drivers/gpu/drm/tidss/tidss_irq.h | 4 +---
>  2 files changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/tidss_irq.c
> index 604334ef526a..91498ff664a2 100644
> --- a/drivers/gpu/drm/tidss/tidss_irq.c
> +++ b/drivers/gpu/drm/tidss/tidss_irq.c
> @@ -78,9 +78,6 @@ static irqreturn_t tidss_irq_handler(int irq, void *arg)
>  			tidss_crtc_error_irq(crtc, irqstatus);
>  	}
>  
> -	if (irqstatus & DSS_IRQ_DEVICE_OCP_ERR)
> -		dev_err_ratelimited(tidss->dev, "OCP error\n");
> -
>  	return IRQ_HANDLED;
>  }
>  
> @@ -105,7 +102,7 @@ int tidss_irq_install(struct drm_device *ddev, unsigned int irq)
>  	if (ret)
>  		return ret;
>  
> -	tidss->irq_mask = DSS_IRQ_DEVICE_OCP_ERR;
> +	tidss->irq_mask = 0;
>  
>  	for (unsigned int i = 0; i < tidss->num_crtcs; ++i) {
>  		struct tidss_crtc *tcrtc = to_tidss_crtc(tidss->crtcs[i]);
> diff --git a/drivers/gpu/drm/tidss/tidss_irq.h b/drivers/gpu/drm/tidss/tidss_irq.h
> index b512614d5863..dd61f645f662 100644
> --- a/drivers/gpu/drm/tidss/tidss_irq.h
> +++ b/drivers/gpu/drm/tidss/tidss_irq.h
> @@ -19,15 +19,13 @@
>   * bit use   |D  |fou|FEOL|FEOL|FEOL|FEOL|  UUUU  |          |
>   * bit number|0  |1-3|4-7 |8-11|  12-19  | 20-23  |  24-31   |
>   *
> - * device bits:	D = OCP error
> + * device bits:	D = Unused
>   * WB bits:	f = frame done wb, o = wb buffer overflow,
>   *		u = wb buffer uncomplete
>   * vp bits:	F = frame done, E = vsync even, O = vsync odd, L = sync lost
>   * plane bits:	U = fifo underflow
>   */
>  
> -#define DSS_IRQ_DEVICE_OCP_ERR			BIT(0)
> -
>  #define DSS_IRQ_DEVICE_FRAMEDONEWB		BIT(1)
>  #define DSS_IRQ_DEVICE_WBBUFFEROVERFLOW		BIT(2)
>  #define DSS_IRQ_DEVICE_WBUNCOMPLETEERROR	BIT(3)
> 
