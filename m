Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D07F313DEA
	for <lists+dri-devel@lfdr.de>; Mon,  8 Feb 2021 19:43:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50CC6E9B2;
	Mon,  8 Feb 2021 18:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 506 seconds by postgrey-1.36 at gabe;
 Mon, 08 Feb 2021 18:03:44 UTC
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id B64406E97A
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Feb 2021 18:03:44 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id E81F78162;
 Mon,  8 Feb 2021 17:55:32 +0000 (UTC)
Date: Mon, 8 Feb 2021 19:55:13 +0200
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v4 24/80] drm/omap: dsi: move TE GPIO handling into core
Message-ID: <YCF7ARchcMKvWa4s@atomide.com>
References: <20201124124538.660710-1-tomi.valkeinen@ti.com>
 <20201124124538.660710-25-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124124538.660710-25-tomi.valkeinen@ti.com>
X-Mailman-Approved-At: Mon, 08 Feb 2021 18:43:52 +0000
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
Cc: hns@goldelico.com, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

* Tomi Valkeinen <tomi.valkeinen@ti.com> [201124 12:47]:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> In preparation for removing custom DSS calls from the DSI
> panel driver, this moves support for external tearing event
> GPIOs into the DSI host driver. This way tearing events are
> always handled in the core resulting in simplification of
> the panel drivers.
> 
> The TE GPIO acquisition follows works in the same way as the
> exynos DSI implementation.

Looks like this patch causes the following warnings:

DSI: omapdss DSI error: Failed to receive BTA
DSI: omapdss DSI error: bta sync failed
DSI: omapdss DSI error: vc(0) busy when trying to config for VP
DSI: omapdss DSI error: Failed to receive BTA
DSI: omapdss DSI error: bta sync failed
DSI: omapdss DSI error: vc(0) busy when trying to config for VP
DSI: omapdss DSI error: Failed to receive BTA
DSI: omapdss DSI error: bta sync failed
DSI: omapdss DSI error: vc(0) busy when trying to config for VP
...

Any ideas? The display works for me despite the constant
warnings.

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
