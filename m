Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7919F189A48
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 12:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB09E6E8B9;
	Wed, 18 Mar 2020 11:09:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 519C06E8B9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 11:09:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5D8B9F9;
 Wed, 18 Mar 2020 12:09:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1584529783;
 bh=QJ6mWUIFDbMFgu2x8gYxaJIDZr94t35qCFtkJmmPQFo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fw/lhjuXtZwtXOXrSqMgvyab8mzxqjEKratQQAWK7t/qtoUgZDabzBfdp8Ga3pzaW
 9/n8twKw4vxgaong8FlTw13GuMXOkoKD6/AyaAcRstSb2PBMUwXp21VoGESVtA1Wf9
 G6E6EVWAjayuslub85FrEbVvjNwC8E0/urXrOOdY=
Date: Wed, 18 Mar 2020 13:09:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/hisilicon: Drop unused #include
Message-ID: <20200318110937.GA4733@pendragon.ideasonboard.com>
References: <20200318073122.1032945-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200318073122.1032945-1-daniel.vetter@ffwll.ch>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, Mar 18, 2020 at 08:31:22AM +0100, Daniel Vetter wrote:
> drm_encoder_slave is really not something anyone should be using,
> the last real user is only nouveau.

Fully agreed.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Is there any plan to convert nouveau to drm_bridge ?

> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Cc: Allison Randal <allison@lohutok.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
