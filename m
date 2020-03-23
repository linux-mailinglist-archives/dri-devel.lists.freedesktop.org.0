Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFCE1901C7
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 00:18:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10AE089240;
	Mon, 23 Mar 2020 23:18:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9154D89240
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 23:18:50 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 390345C061C;
 Tue, 24 Mar 2020 00:18:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1585005529;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UMs7uFs9WWfE+96GU/cP1vB35aOQG8t4nUBICo/RJaI=;
 b=Kfriwo629DX42Y2DUOMkSpH3Vh+nTW2u7OnU4aA9Vx8vD0O6EJTAiA+VENot6nlfJcnwKv
 qnhsqjSZc8Up+RcWCgjLAFqjiEmxh9u5xoy11fN4IFOoE+8T9hgoDh+2QNocbzGdanoN3b
 p/ttC5y9BY3+ZsIPb0EH2UAwgiSrOcw=
MIME-Version: 1.0
Date: Tue, 24 Mar 2020 00:18:49 +0100
From: Stefan Agner <stefan@agner.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 16/21] drm: mxsfb: Add i.MX7 to the list of supported SoCs
 in Kconfig
In-Reply-To: <20200309195216.31042-17-laurent.pinchart@ideasonboard.com>
References: <20200309195216.31042-1-laurent.pinchart@ideasonboard.com>
 <20200309195216.31042-17-laurent.pinchart@ideasonboard.com>
User-Agent: Roundcube Webmail/1.4.1
Message-ID: <0634e7d44ebc7500330111c71d0db7ea@agner.ch>
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
Cc: Marek Vasut <marex@denx.de>, kernel@pengutronix.de,
 dri-devel@lists.freedesktop.org, linux-imx@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-03-09 20:52, Laurent Pinchart wrote:
> Extend the Kconfig option description by listing the i.MX7 SoCs, as they
> are supported by the same driver.

Can you also add "i.MX8M" to the list since the bindings for this driver
are also used in arch/arm64/boot/dts/freescale/imx8mq.dtsi.

--
Stefan

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/gpu/drm/mxsfb/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index 0dca8f27169e..e91841f8f8a2 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -5,7 +5,7 @@ config DRM_MXS
>  	  Choose this option to select drivers for MXS FB devices
>  
>  config DRM_MXSFB
> -	tristate "i.MX23/i.MX28/i.MX6SX MXSFB LCD controller"
> +	tristate "i.MX23/i.MX28/i.MX6SX/i.MX7 MXSFB LCD controller"
>  	depends on DRM && OF
>  	depends on COMMON_CLK
>  	select DRM_MXS
> @@ -14,7 +14,7 @@ config DRM_MXSFB
>  	select DRM_KMS_CMA_HELPER
>  	select DRM_PANEL
>  	help
> -	  Choose this option if you have an i.MX23/i.MX28/i.MX6SX MXSFB
> +	  Choose this option if you have an i.MX23/i.MX28/i.MX6SX/i.MX7 MXSFB
>  	  LCD controller.
>  
>  	  If M is selected the module will be called mxsfb.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
