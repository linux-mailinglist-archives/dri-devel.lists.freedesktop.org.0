Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E58512478E
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 14:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 120196E44F;
	Wed, 18 Dec 2019 13:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD806E44F
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 13:03:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2691FB23;
 Wed, 18 Dec 2019 14:03:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1576674234;
 bh=kyFycWv/ep3sHlhQaqKtpvighq+LaycJHVfyeOlcXww=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gnla2HU3Ub2gF4AYSAgQ+mL+s9ruk/qmL+BnCX5rSEDX5HJojek9/hdknZIEJj/j+
 Ue5NaibnYQm7ik1aa7tVB9iubMhkhSj9s4tlNjESU005Q55iSobpRmKYS1O+cDGrZ+
 ZoYoAc6/MJUCcQMNi90hpnIe+HePzFtU6B1T9d1g=
Date: Wed, 18 Dec 2019 15:03:43 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH] drm/bridge: panel: Fix typo in drm_panel_bridge_add docs
Message-ID: <20191218130343.GB4863@pendragon.ideasonboard.com>
References: <20191218121223.30181-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191218121223.30181-1-enric.balletbo@collabora.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Enric,

Thank you for the patch.

On Wed, Dec 18, 2019 at 01:12:23PM +0100, Enric Balletbo i Serra wrote:
> Fix the 'manged' typo with 'managed' in the drm_panel_bridge_add
> kernel-doc documentation.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
>  drivers/gpu/drm/bridge/panel.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> index f4e293e7cf64..fcda954bbfec 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -151,7 +151,7 @@ static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
>   * known type. Calling this function with a panel whose connector type is
>   * DRM_MODE_CONNECTOR_Unknown will return NULL.
>   *
> - * See devm_drm_panel_bridge_add() for an automatically manged version of this
> + * See devm_drm_panel_bridge_add() for an automatically managed version of this
>   * function.
>   */
>  struct drm_bridge *drm_panel_bridge_add(struct drm_panel *panel)

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
