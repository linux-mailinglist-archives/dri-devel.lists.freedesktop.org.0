Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 765001F6D8D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 20:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D5506E1BC;
	Thu, 11 Jun 2020 18:37:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D826E1BC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 18:37:14 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 574555C8E3D;
 Thu, 11 Jun 2020 20:37:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1591900632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/2K6hYnGaeKU794MTT+bI1SayNgY/MVl5scHgUHMB0c=;
 b=gV4bQvzQNumU9qObh3G2w9qHxdn/sYS7Z8f9eXPdbfj/eKHGZe+C21GXna+H18BPg4mZr0
 Uqupd1pt5sv4njLU6MBQyJyFBGnmhNq8XRcvcQ0uPJpwuc2OlbYWyja+dLromk00EEeUKz
 xd0XnaSI76WhFXH9LwHmffWHqV8aYG0=
MIME-Version: 1.0
Date: Thu, 11 Jun 2020 20:37:12 +0200
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 16/22] drm: mxsfb: Add i.MX7 and i.MX8M to the list of
 supported SoCs in Kconfig
In-Reply-To: <20200530031015.15492-17-laurent.pinchart@ideasonboard.com>
References: <20200530031015.15492-1-laurent.pinchart@ideasonboard.com>
 <20200530031015.15492-17-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <dcb15190ef95e5a9bf3ad76ccbe7a3ba@agner.ch>
X-Sender: stefan@agner.ch
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
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, kernel@pengutronix.de, robert.chiras@nxp.com,
 leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-30 05:10, Laurent Pinchart wrote:
> Extend the Kconfig option description by listing the i.MX7 and i.MX8M
> SoCs, as they are supported by the same driver. Replace the list of SoCs
> in the short description with just "(e)LCDIF LCD controller" to avoid
> expanding it further in the future as support for more SoCs is added.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Stefan Agner <stefan@agner.ch>

> ---
> Changes since v1:
> 
> - Make description more explicit by mentioning LCDIF and eLCDIF
> - Add i.MX8M
> ---
>  drivers/gpu/drm/mxsfb/Kconfig | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index e43b326e9147..0143d539f8f8 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -5,7 +5,7 @@ config DRM_MXS
>  	  Choose this option to select drivers for MXS FB devices
>  
>  config DRM_MXSFB
> -	tristate "i.MX23/i.MX28/i.MX6SX MXSFB LCD controller"
> +	tristate "i.MX (e)LCDIF LCD controller"
>  	depends on DRM && OF
>  	depends on COMMON_CLK
>  	select DRM_MXS
> @@ -15,7 +15,8 @@ config DRM_MXSFB
>  	select DRM_PANEL
>  	select DRM_PANEL_BRIDGE
>  	help
> -	  Choose this option if you have an i.MX23/i.MX28/i.MX6SX MXSFB
> -	  LCD controller.
> +	  Choose this option if you have an LCDIF or eLCDIF LCD controller.
> +	  Those devices are found in various i.MX SoC (including i.MX23,
> +	  i.MX28, i.MX6SX, i.MX7 and i.MX8M).
>  
>  	  If M is selected the module will be called mxsfb.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
