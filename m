Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5735F4D2261
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 21:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906F010E335;
	Tue,  8 Mar 2022 20:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6BE010E335
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 20:16:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5859F488;
 Tue,  8 Mar 2022 21:15:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646770558;
 bh=vEaa2WFln8MBWhVC2M4cfRmYS4cQsjlmS2QqcmoQUD0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WWqMXkf8A+ee5bF5lQ8Xv4ICnk8CxZo077VJ9l0tg6FH9WB6ZVnuayp/7aHq3Fnri
 6n1QbXH3HC5SOuoqeuRDoSPMVBcfvCopzvlIxxy8aZdHrcqlcXhQa5xN7/gTcXjb27
 RCgIc9Tnnpy/6TewGmFUvw9lvgp3giNKLvI8Vq2M=
Date: Tue, 8 Mar 2022 22:15:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/3] drm/bridge: Add MAINTAINERS entry for DRM drivers
 for bridge chip bindings
Message-ID: <Yie5cBCYjjl/FrPB@pendragon.ideasonboard.com>
References: <20220308110615.1.I1f1b10daf7361feb6705f789deb680b8d7720de9@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220308110615.1.I1f1b10daf7361feb6705f789deb680b8d7720de9@changeid>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

Thank you for the patch.

On Tue, Mar 08, 2022 at 11:06:57AM -0800, Douglas Anderson wrote:
> The bindings for bridge chips should also get the same maintainers
> entry so the right people get notified about bindings changes.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0216d2ffe728..a73179d55d00 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6403,6 +6403,7 @@ R:	Jonas Karlman <jonas@kwiboo.se>
>  R:	Jernej Skrabec <jernej.skrabec@gmail.com>
>  S:	Maintained
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/bridge/
>  F:	drivers/gpu/drm/bridge/
>  
>  DRM DRIVERS FOR EXYNOS

-- 
Regards,

Laurent Pinchart
