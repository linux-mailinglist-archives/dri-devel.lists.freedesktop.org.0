Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B610E4BF1FC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 07:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62FC10EE07;
	Tue, 22 Feb 2022 06:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D8710EE03
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 06:22:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77DC547F;
 Tue, 22 Feb 2022 07:22:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645510932;
 bh=SP3tRKfQSZyBe6F18txgnX/9Fa/JS85939I3Pb55+y4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=igsCUCtOCnHVYZdEiZ5Klbg/zchpFwJmnekICg2AV1qt0BmHkEnZ8bE8up7S0b/7T
 tUseM8WihRLc1Bewh7Q/MM18y75O+NuY9SwJCJJRdZi7jgZOF9BMdEE4xcaVU2rSd4
 dyKalU1NxQ3E3zPGzz6pD0YQKZfswB6WFivylQrw=
Date: Tue, 22 Feb 2022 08:22:03 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 2/2] drm/bridge: Document the expected behaviour of DSI
 host controllers
Message-ID: <YhSBC13+3DM3FyQ+@pendragon.ideasonboard.com>
References: <cover.1645029005.git.dave.stevenson@raspberrypi.com>
 <85d0a4dbbe6c8ad7bc3fdd8ce719f6d418ce095e.1645029005.git.dave.stevenson@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <85d0a4dbbe6c8ad7bc3fdd8ce719f6d418ce095e.1645029005.git.dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 andrzej.hajda@gmail.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

Thank you for the patch.


On Wed, Feb 16, 2022 at 04:59:44PM +0000, Dave Stevenson wrote:
> The exact behaviour of DSI host controllers is not specified,
> therefore define it.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  Documentation/gpu/drm-kms-helpers.rst |  7 +++++++
>  drivers/gpu/drm/drm_bridge.c          | 38 +++++++++++++++++++++++++++++++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> index c3ce91eecbc1..362afdb867c6 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -185,6 +185,13 @@ Bridge Helper Reference
>  .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
>     :export:
>  
> +MIPI-DSI bridge operation
> +-------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> +   :doc: dsi bridge operations
> +
> +
>  Bridge Connector Helper Reference
>  ---------------------------------
>  
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 7c24e8340efa..14c2ee9e0328 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -152,6 +152,44 @@
>   * situation when probing.
>   */
>  
> +/**
> + * DOC: dsi bridge operations
> + *
> + * DSI host interfaces are expected to be implemented as bridges rather than
> + * encoders, however there are a few aspects of their operation that need to
> + * be defined in order to provide a consistent interface.
> + *
> + * A DSI host should keep the PHY powered down until the pre_enable op is

I'd write "operation" in full everywhere to avoid mixing the two.

> + * called. All lanes should be in an idle state (not LP-11) up to this point.

Is the idle state LP-00 ? If so I'd state that explicitly.

"[...] in an idle state (LP-00, not LP-11) [...]"

> + * pre_enable should initialise the PHY, set the data lanes to LP-11, and the
> + * clock lane to either LP-11 or HS dependent on the mode_flag

s/dependent/depending/ ?

> + * MIPI_DSI_CLOCK_NON_CONTINUOUS.
> + *
> + * Ordinarily the downstream bridge DSI peripheral pre_enable will have been
> + * called before the DSI host. If the DSI peripheral requires LP-11 and/or
> + * the clock lane to be in HS mode prior to pre_enable, then it can set the
> + * DRM_BRIDGE_OP_UPSTREAM_FIRST flag to request the pre_enable (and
> + * post_disable) order to be altered to enable the DSI host first.
> + *
> + * Either the CRTC being enabled, or the DSI host enable op should switch the
> + * host to actively transmitting video on the data lanes.
> + *
> + * The reverse also applies. The DSI host disable op or stopping the CRTC should
> + * stop transmitting video, and the data lanes should return to the LP-11 state.
> + * The DSI host post_disable op should disable the PHY.
> + * If the DRM_BRIDGE_OP_UPSTREAM_FIRST flag is set, then the DSI peripheral's
> + * bridge post_disable will be called before the DSI host's post_disable.
> + *
> + * Whilst it is valid to call host_transfer prior to pre_enable or after
> + * post_disable, the exact state of the lanes is undefined at this point. The
> + * DSI host should initialise the interface, transmit the data, and then disable
> + * the interface again.
> + *
> + * Ultra Low Power State (ULPS) is not explicitly supported by DRM. If
> + * implemented, it therefore needs to be either handled entirely within the DSI

s/either // (or you need an "or ..." :-))

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + * Host driver.
> + */
> +
>  static DEFINE_MUTEX(bridge_lock);
>  static LIST_HEAD(bridge_list);
>  

-- 
Regards,

Laurent Pinchart
