Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5522A360E3A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 17:12:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9D406EA68;
	Thu, 15 Apr 2021 15:12:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 533 seconds by postgrey-1.36 at gabe;
 Thu, 15 Apr 2021 15:12:05 UTC
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D806EA68
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 15:12:05 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id AA3B35C2EFA;
 Thu, 15 Apr 2021 17:03:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1618498988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ymrpvhJYDT8MqOsvqD4BrAUPNhTb/7aVrozdYqpmC5A=;
 b=TqzK77e8su4ssEU+R/4HZNEUYT+0Tw1IPtaVCZL7Ifqhp1TbNDG52ZW3+bs9oPMt+Le0BO
 tkpLGKo+ENuMiK+PjpprSvYWmbFs/S/MpY6/Adi3osUKQuCETczuq0KjuCqFZJVQWPJTuY
 8+7huiHKxQHzzQ6cfeUgtBsVNj5aE3c=
MIME-Version: 1.0
Date: Thu, 15 Apr 2021 17:03:08 +0200
From: Stefan Agner <stefan@agner.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/4] drm/mxsfb: Don't select DRM_KMS_FB_HELPER
In-Reply-To: <20210415110040.23525-3-tzimmermann@suse.de>
References: <20210415110040.23525-1-tzimmermann@suse.de>
 <20210415110040.23525-3-tzimmermann@suse.de>
User-Agent: Roundcube Webmail/1.4.9
Message-ID: <edc956f96a143d8fd27abea47b6d5eaf@agner.ch>
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
Cc: marex@denx.de, kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 airlied@linux.ie, s.hauer@pengutronix.de, sroland@vmware.com,
 linux-graphics-maintainer@vmware.com, linux-imx@nxp.com, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-04-15 13:00, Thomas Zimmermann wrote:
> Selecting DRM_FBDEV_EMULATION will include the correct secttings for
> fbdev emulation. Drivers should not override this.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Acked-by: Stefan Agner <stefan@agner.ch>

--
Stefan

> ---
>  drivers/gpu/drm/mxsfb/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/Kconfig b/drivers/gpu/drm/mxsfb/Kconfig
> index 0143d539f8f8..ee22cd25d3e3 100644
> --- a/drivers/gpu/drm/mxsfb/Kconfig
> +++ b/drivers/gpu/drm/mxsfb/Kconfig
> @@ -10,7 +10,6 @@ config DRM_MXSFB
>  	depends on COMMON_CLK
>  	select DRM_MXS
>  	select DRM_KMS_HELPER
> -	select DRM_KMS_FB_HELPER
>  	select DRM_KMS_CMA_HELPER
>  	select DRM_PANEL
>  	select DRM_PANEL_BRIDGE
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
