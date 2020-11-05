Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4CC2A846A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 18:06:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6E36E183;
	Thu,  5 Nov 2020 17:06:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98E0A6EDD2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 17:06:12 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0A5H6Abp043328;
 Thu, 5 Nov 2020 11:06:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1604595970;
 bh=4gaKFpK8PJGCAAmmXQzonqFwV4ZrZVTTuRDhDq5Bgls=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=RMu/nVGke+7u/agYvacjXjqt8YpTafjN6PDCl9ZOY0oIUrBc/6w6KawvRKdWAIkzt
 5nvkYgZDcqOxMTxaQUgjYtvSovHLALAVDCFr2aMZeTIo3bKFkpUgIRP/Gm3GzJgdZw
 QDRHNgnt6WpJbijRyrUgC1/w3E8rjjEDAjwL1vG8=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0A5H6Ar6108561
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 5 Nov 2020 11:06:10 -0600
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 5 Nov
 2020 11:06:10 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 5 Nov 2020 11:06:10 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0A5H687K073591;
 Thu, 5 Nov 2020 11:06:09 -0600
Subject: Re: [PATCH 04/19] gpu: drm: omapdrm: omap_irq: Fix a couple of
 doc-rot issues
To: Lee Jones <lee.jones@linaro.org>
References: <20201105144517.1826692-1-lee.jones@linaro.org>
 <20201105144517.1826692-5-lee.jones@linaro.org>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <429684b9-c967-95cf-1d8a-9f5249a00a5d@ti.com>
Date: Thu, 5 Nov 2020 19:06:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201105144517.1826692-5-lee.jones@linaro.org>
Content-Language: en-US
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <rob.clark@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/11/2020 16:45, Lee Jones wrote:
> The API has been updated, but the header was not.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/omapdrm/omap_irq.c:115: warning: Function parameter or member 'crtc' not described in 'omap_irq_enable_vblank'
>  drivers/gpu/drm/omapdrm/omap_irq.c:115: warning: Excess function parameter 'dev' description in 'omap_irq_enable_vblank'
>  drivers/gpu/drm/omapdrm/omap_irq.c:115: warning: Excess function parameter 'pipe' description in 'omap_irq_enable_vblank'
>  drivers/gpu/drm/omapdrm/omap_irq.c:142: warning: Function parameter or member 'crtc' not described in 'omap_irq_disable_vblank'
>  drivers/gpu/drm/omapdrm/omap_irq.c:142: warning: Excess function parameter 'dev' description in 'omap_irq_disable_vblank'
>  drivers/gpu/drm/omapdrm/omap_irq.c:142: warning: Excess function parameter 'pipe' description in 'omap_irq_disable_vblank'
> 
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Rob Clark <rob.clark@linaro.org>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/omapdrm/omap_irq.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/omap_irq.c b/drivers/gpu/drm/omapdrm/omap_irq.c
> index 382bcdc72ac06..8643871e23a83 100644
> --- a/drivers/gpu/drm/omapdrm/omap_irq.c
> +++ b/drivers/gpu/drm/omapdrm/omap_irq.c
> @@ -100,8 +100,7 @@ int omap_irq_enable_framedone(struct drm_crtc *crtc, bool enable)
>  
>  /**
>   * enable_vblank - enable vblank interrupt events
> - * @dev: DRM device
> - * @pipe: which irq to enable
> + * @crtc: DRM CRTC
>   *
>   * Enable vblank interrupts for @crtc.  If the device doesn't have
>   * a hardware vblank counter, this routine should be a no-op, since
> @@ -131,8 +130,7 @@ int omap_irq_enable_vblank(struct drm_crtc *crtc)
>  
>  /**
>   * disable_vblank - disable vblank interrupt events
> - * @dev: DRM device
> - * @pipe: which irq to enable
> + * @crtc: DRM CRTC
>   *
>   * Disable vblank interrupts for @crtc.  If the device doesn't have
>   * a hardware vblank counter, this routine should be a no-op, since
> 

Hmm, I don't know why we have the doc texts there. These are omapdrm internal functions, and the
text sounds like it was copied from a framework function. I think we can drop the texts here.

But this patch is fine too, and I can drop the text later:

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
