Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 967CF6DED82
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 10:23:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F5D10E179;
	Wed, 12 Apr 2023 08:23:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A33610E179
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 08:23:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (133-32-181-51.west.xps.vectant.ne.jp [133.32.181.51])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5938CCF9;
 Wed, 12 Apr 2023 10:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1681287808;
 bh=tPwXOgiNyO+gG9J8WOKuZEFG2XEVSk3SdN8uDJdzq54=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v0708rth12PiF72JouLeroc9adtBSBjlhI+DY7kjnotjJOPMXhzcwdRjgdjBkrv3d
 wSiQRE9NDyKTmFk1NvKCOFUSXsToVOd899tCJeoVuaHu+qWjDg6xd1uUq2uOdk2yE7
 JZd/zzmYCS4idsy5qw10OrSd711ehxTBaMtpF5U4=
Date: Wed, 12 Apr 2023 11:23:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] MAINTAINERS: add drm_bridge for drm bridge maintainers
Message-ID: <20230412082339.GM11253@pendragon.ideasonboard.com>
References: <20230412080921.10171-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230412080921.10171-1-daniel.vetter@ffwll.ch>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

Thank you for the patch.

On Wed, Apr 12, 2023 at 10:09:20AM +0200, Daniel Vetter wrote:
> Otherwise core changes don't get noticed by the right people. I
> noticed this because a patch set from Jagan Teki seems to have fallen
> through the cracks.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> --
> Jagan, with this your bridge series should find the right people!
> 
> Cheers, Daniel
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 6a4625710f25..cf2add900c8b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6843,6 +6843,7 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	Documentation/devicetree/bindings/display/bridge/
>  F:	drivers/gpu/drm/bridge/
>  F:	include/drm/drm_bridge.h
> +F:	drivers/gpu/drm/drm_bridge.c

With files alphabetically sorted,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  DRM DRIVERS FOR EXYNOS
>  M:	Inki Dae <inki.dae@samsung.com>

-- 
Regards,

Laurent Pinchart
