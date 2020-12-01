Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFD02C93EA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 01:27:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AEC89DF9;
	Tue,  1 Dec 2020 00:27:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F4189DF9
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 00:27:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 369A245D;
 Tue,  1 Dec 2020 01:27:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1606782469;
 bh=syhNt4kCoLazCymjdAxotM6Lqo0Sbi0tVC8ody0LlU8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MqXPzieUkm2MnGj5BMyKeQrnkquFfCMpf703QJCeCZnl5fnNg1mMQK6DxM1l9IWej
 iUB4/vQJAUVY60tlFoB3GzvxxxtmLSfzaarYQP/fT2OyDuSYTjNtRX9T+I3T+NzIis
 F7p8GPTYokz8DgI0XrkgEusqQQJ4dZIQMup9H+l0=
Date: Tue, 1 Dec 2020 02:27:40 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 70/80] drm/panel: panel-dsi-cm: drop unneeded includes
Message-ID: <20201201002740.GO25713@pendragon.ideasonboard.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-71-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-71-tomi.valkeinen@ti.com>
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
Cc: Tony Lindgren <tony@atomide.com>, hns@goldelico.com,
 Sekhar Nori <nsekhar@ti.com>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
 Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Tue, Nov 24, 2020 at 02:45:28PM +0200, Tomi Valkeinen wrote:
> Drop unneeded includes.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/gpu/drm/panel/panel-dsi-cm.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index ec87b785871f..91ed8237a1c2 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -9,12 +9,7 @@
>  #include <linux/backlight.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> -#include <linux/interrupt.h>

This could go to the patch that moves TE handling to the code.

>  #include <linux/jiffies.h>
> -#include <linux/module.h>

I'd keep module.h as you use macros it defines, and we shouldn't depend
in indirect includes.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> -#include <linux/sched/signal.h>
> -#include <linux/slab.h>
> -#include <linux/of_device.h>
>  #include <linux/regulator/consumer.h>
>  
>  #include <drm/drm_connector.h>

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
