Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0A03AF5A0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 20:50:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3B46E3AC;
	Mon, 21 Jun 2021 18:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B921F6E06E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 18:49:58 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 81ed7cf1-d2c1-11eb-a36f-0050568cd888;
 Mon, 21 Jun 2021 18:50:11 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 515D6194B7E;
 Mon, 21 Jun 2021 20:50:00 +0200 (CEST)
Date: Mon, 21 Jun 2021 20:49:53 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/5] ti-sn65dsi83: Finalize transition to atomic operations
Message-ID: <20210621184953.GC918146@ravnborg.org>
References: <20210621125518.13715-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621125518.13715-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, Loic Poulain <loic.poulain@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Robert Foss <robert.foss@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Stephen Boyd <swboyd@chromium.org>,
 Adam Ford <aford173@gmail.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Mon, Jun 21, 2021 at 03:55:13PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> This patch series is based on top of "[PATCH] drm/bridge: ti-sn65dsi83:
> Replace connector format patching with atomic_get_input_bus_fmts". It
> completes the transition to atomic operations in the ti-sn65dsi83
> driver. The main reason for this change is patch 4/5 that fixes a few
> issues in the driver (see the patch's commit message for details), but
> overall it also brings the driver to the most recent API which is nice
> in itself.
> 
> Laurent Pinchart (5):
>   drm: bridge: ti-sn65dsi83: Move LVDS format selection to .mode_set()
>   drm: bridge: ti-sn65dsi83: Pass mode explicitly to helper functions
>   drm: bridge: ti-sn65dsi83: Switch to atomic operations
>   drm: bridge: ti-sn65dsi83: Retrieve output format from bridge state
>   drm: bridge: ti-sn65dsi83: Retrieve the display mode from the state
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 166 +++++++++++++-------------
>  1 file changed, 82 insertions(+), 84 deletions(-)

I have browsed the series and it all looked good.
Acked-by: Sam Ravnborg <sam@ravnborg.org>

on them all.

It is news to me that the atomic ops are the way to go - but then I have
been off-line for a while so no suprise or maybe I just missed it
before.

It would be good if the comments in drm_bridge.h could point out what is
deprecated, so we know what to avoid in new and updated bridge drivers.
But this is all un-related to this series.

	Sam
