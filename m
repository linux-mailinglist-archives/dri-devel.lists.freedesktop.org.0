Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8792C3D0252
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 21:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54FA66E1A2;
	Tue, 20 Jul 2021 19:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C52C6E1A2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jul 2021 19:51:35 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id ea0573a4-e993-11eb-8d1a-0050568cd888;
 Tue, 20 Jul 2021 19:51:46 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 205B4194B7A;
 Tue, 20 Jul 2021 21:51:47 +0200 (CEST)
Date: Tue, 20 Jul 2021 21:51:30 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH 03/10] drm/bridge: Add documentation sections
Message-ID: <YPcpQuWF9eod5s7R@ravnborg.org>
References: <20210720134525.563936-1-maxime@cerno.tech>
 <20210720134525.563936-4-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720134525.563936-4-maxime@cerno.tech>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 20, 2021 at 03:45:18PM +0200, Maxime Ripard wrote:
> The bridge documentation overview is quite packed already, and we'll add
> some more documentation that isn't part of an overview at all.
> 
> Let's add some sections to the documentation to separare each bits.
s/separare/separate/
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  Documentation/gpu/drm-kms-helpers.rst |  6 ++++++
>  drivers/gpu/drm/drm_bridge.c          | 14 +++++++++-----
>  2 files changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
> index 389892f36185..10f8df7aecc0 100644
> --- a/Documentation/gpu/drm-kms-helpers.rst
> +++ b/Documentation/gpu/drm-kms-helpers.rst
> @@ -151,6 +151,12 @@ Overview
>  .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
>     :doc: overview
>  
> +Display Driver Integration
> +--------------------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
> +   :doc: display driver integration
> +
>  Bridge Operations
>  -----------------
>  
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index aef8c9f4fb9f..c9a950bfdfe5 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -50,6 +50,15 @@
>   * Chaining multiple bridges to the output of a bridge, or the same bridge to
>   * the output of different bridges, is not supported.
>   *
> + * &drm_bridge, like &drm_panel, aren't &drm_mode_object entities like planes,
> + * CRTCs, encoders or connectors and hence are not visible to userspace. They
> + * just provide additional hooks to get the desired output at the end of the
> + * encoder chain.
> + */
> +
> +/**
> + * DOC:	display driver integration
> + *
>   * Display drivers are responsible for linking encoders with the first bridge
>   * in the chains. This is done by acquiring the appropriate bridge with
>   * drm_of_get_next(). Once acquired, the bridge shall be attached to the
> @@ -84,11 +93,6 @@
>   * helper to create the &drm_connector, or implement it manually on top of the
>   * connector-related operations exposed by the bridge (see the overview
>   * documentation of bridge operations for more details).
> - *
> - * &drm_bridge, like &drm_panel, aren't &drm_mode_object entities like planes,
> - * CRTCs, encoders or connectors and hence are not visible to userspace. They
> - * just provide additional hooks to get the desired output at the end of the
> - * encoder chain.
>   */
>  
>  static DEFINE_MUTEX(bridge_lock);
> -- 
> 2.31.1
