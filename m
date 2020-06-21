Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 600B7202D6F
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jun 2020 00:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 806F16E1E5;
	Sun, 21 Jun 2020 22:29:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744AC6E1E5
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 22:29:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 508DCA5E;
 Mon, 22 Jun 2020 00:29:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592778586;
 bh=h3DvNQrBW/7Awdz64VgXnEQbAUtTAIR4h5qUzpDJs0E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iXxH8ybuMEmE2+cEXdkRA09m8iBxbR5IKa1C3n8F6ZG+Q23WTIs2Dzio1nIGxhLEc
 kfgcdOPyszDgNDrY5h5JFHemAsMXrabaPeSo/6eMrIy31eYSxkZhSsf94AUCcQGLyx
 kpb/r0+0kBhq+qQCWeRbuyBygkBUK5+Wst/F3dpo=
Date: Mon, 22 Jun 2020 01:29:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 1/2] drm/panel-simple: Correct EDT ET057090DHU
 connector type
Message-ID: <20200621222922.GA25355@pendragon.ideasonboard.com>
References: <20200621222742.25695-1-digetx@gmail.com>
 <20200621222742.25695-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200621222742.25695-2-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Thank you for the patch.

On Mon, Jun 22, 2020 at 01:27:41AM +0300, Dmitry Osipenko wrote:
> The EDT ET057090DHU panel has a DPI connector and not LVDS. This patch
> corrects the panel's description.
> 
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Fixes: 94f07917ebe8 ("drm/panel-simple: Add missing connector type for some panels")
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/panel/panel-simple.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index ea6973d5cf54..87edd2bdf09a 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -1588,7 +1588,7 @@ static const struct panel_desc edt_et057090dhu = {
>  	},
>  	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
>  	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
> -	.connector_type = DRM_MODE_CONNECTOR_LVDS,
> +	.connector_type = DRM_MODE_CONNECTOR_DPI,
>  };
>  
>  static const struct drm_display_mode edt_etm0700g0dh6_mode = {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
