Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E3C3AF636
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 21:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8709D6E3FC;
	Mon, 21 Jun 2021 19:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE16A6E3FC
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 19:34:49 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id c6dabb94-d2c7-11eb-960d-0050568c148b;
 Mon, 21 Jun 2021 19:35:04 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id AF354194B48;
 Mon, 21 Jun 2021 21:34:52 +0200 (CEST)
Date: Mon, 21 Jun 2021 21:34:46 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 0/5] ti-sn65dsi83: Finalize transition to atomic operations
Message-ID: <20210621193446.GA962565@ravnborg.org>
References: <20210621125518.13715-1-laurent.pinchart@ideasonboard.com>
 <20210621184953.GC918146@ravnborg.org>
 <YNDhuwRErUEeE19+@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YNDhuwRErUEeE19+@pendragon.ideasonboard.com>
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

> > 
> > It is news to me that the atomic ops are the way to go - but then I have
> > been off-line for a while so no suprise or maybe I just missed it
> > before.
> 
> They're not mandatory as such, but they give us access to the atomic
> state, which is sometimes required. Overall I think it would be nice to
> move to the atomic operations and drop the legacy ones, to avoid
> maintaining two sets of operations. It will take time :-)
Yeah, but if we can get more people working on the job..
> 
> > It would be good if the comments in drm_bridge.h could point out what is
> > deprecated, so we know what to avoid in new and updated bridge drivers.
> > But this is all un-related to this series.
> 
> It's a good point. Would you like to submit a patch, or should I do so ?
Please do as I would have to dig around to do it right as I have
fogotten most of the drm internals the last couple of months.

Just something simple like: "This is deprecated, do not use!" would do
the trick for me. Then I would know what to look for if I was reviewing
a new bridge driver or patching an existing one or just trying to gentle
push someone in the right direction.

For drm_drv.h this really helped me to understand what should not be
used.

	Sam
