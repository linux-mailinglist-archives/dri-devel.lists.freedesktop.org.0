Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB73C7A725D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 07:50:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345E810E079;
	Wed, 20 Sep 2023 05:50:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5CF8410E079
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 05:50:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id DFB3580A0;
 Wed, 20 Sep 2023 05:50:14 +0000 (UTC)
Date: Wed, 20 Sep 2023 08:50:13 +0300
From: Tony Lindgren <tony@atomide.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] omap: dsi: do not WARN on detach if dsidev was never
 attached
Message-ID: <20230920055013.GP5285@atomide.com>
References: <929c46beecf77f2ebfa9f8c9b1c09f6ec610c31a.1695130648.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <929c46beecf77f2ebfa9f8c9b1c09f6ec610c31a.1695130648.git.hns@goldelico.com>
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
Cc: letux-kernel@openphoenux.org, Arnd Bergmann <arnd@arndb.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, kernel@pyra-handheld.com,
 sre@kernel.org, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* H. Nikolaus Schaller <hns@goldelico.com> [230919 13:38]:
> dsi_init_output() called by dsi_probe() may fail. In that
> case mipi_dsi_host_unregister() is called which may call
> omap_dsi_host_detach() with uninitialized dsi->dsidev
> because omap_dsi_host_attach() was never called before.
> 
> This happens if the panel driver asks for an EPROBE_DEFER.
> 
> So let's suppress the WARN() in this special case.

Reviewed-by: Tony Lindgren <tony@atomide.com>

Thanks,

Tony
