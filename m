Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACB71896A1
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 09:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45F66E87A;
	Wed, 18 Mar 2020 08:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AAC6E87A
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 08:06:31 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 2129D804FE;
 Wed, 18 Mar 2020 09:06:26 +0100 (CET)
Date: Wed, 18 Mar 2020 09:06:25 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/hisilicon: Drop unused #include
Message-ID: <20200318080625.GA6331@ravnborg.org>
References: <20200318073122.1032945-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318073122.1032945-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QX4gbG5DAAAA:8
 a=7gkXJVJtAAAA:8 a=sozttTNsAAAA:8 a=3jHMjg6xAAAA:8 a=P1BnusSwAAAA:8
 a=e5mUnYsNAAAA:8 a=CINfGiwCVuFth2m_LWYA:9 a=CjuIK1q_8ugA:10
 a=AbAUZ8qAyYyZVLSsDulk:22 a=E9Po1WZjFZOl8hwRPBS3:22
 a=aeg5Gbbo78KNqacMgKqU:22 a=_Ilv_KrDiT527o6t6YB_:22
 a=D0XLA9XvdZm18NrgonBM:22 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 18, 2020 at 08:31:22AM +0100, Daniel Vetter wrote:
> drm_encoder_slave is really not something anyone should be using,
> the last real user is only nouveau.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Allison Randal <allison@lohutok.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Acked-by: Sam Ravnborg <sam@ravnborg.org>

I did throw this after my build setup - no problems.

drm_encoder_slave is also used by i2c/ch7006 - but this
is a nouveau only driver so the explanation is also OK.

	Sam


> ---
>  drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> index f31068d74b18..d399c1077242 100644
> --- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> +++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
> @@ -20,7 +20,6 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
>  #include <drm/drm_device.h>
> -#include <drm/drm_encoder_slave.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_print.h>
> -- 
> 2.25.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
