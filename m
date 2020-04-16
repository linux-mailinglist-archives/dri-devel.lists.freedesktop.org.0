Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3280A1ACE49
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 19:03:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BDE6E415;
	Thu, 16 Apr 2020 17:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51036E415
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 17:03:40 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7957F97D;
 Thu, 16 Apr 2020 19:03:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587056617;
 bh=ub1B1IcZSLEWleDHY8gnWOomy9qkKYullnvOHINq9K0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i+E3b4Vf4b0hPQlkTJENwVcfiNm6KUV0Xlc8TZr/3iNoySXvfGXaa7MyIe0XG6Ufv
 0dSoj9phmYSsdxKMEGJpPSNBw9sdUSoMZ4zWVkY4dCUvOwB3I9zFV8wupZSnljch+B
 2U2WXN1I7ge3yOWErGvygFj3xHpS86/cODsZdyFo=
Date: Thu, 16 Apr 2020 20:03:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH 1/2] drm: panel: Set connector type for LP120UP1
Message-ID: <20200416170325.GG4796@pendragon.ideasonboard.com>
References: <20200416164404.2418426-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416164404.2418426-1-enric.balletbo@collabora.com>
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
Cc: drinkcat@chromium.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>, hsinyi@chromium.org,
 matthias.bgg@gmail.com, Collabora Kernel ML <kernel@collabora.com>,
 sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Enric,

Thank you for the patch.

On Thu, Apr 16, 2020 at 06:44:03PM +0200, Enric Balletbo i Serra wrote:
> The LP120UP1 is a eDP panel, set the connector type accordingly.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
>  drivers/gpu/drm/panel/panel-simple.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 3ad828eaefe1..6253635601bb 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -2168,6 +2168,7 @@ static const struct panel_desc lg_lp120up1 = {
>  		.width = 267,
>  		.height = 183,
>  	},
> +	.connector_type = DRM_MODE_CONNECTOR_eDP,
>  };
>  
>  static const struct drm_display_mode lg_lp129qe_mode = {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
