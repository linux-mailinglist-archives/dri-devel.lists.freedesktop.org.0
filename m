Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8872ACCF8CD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 12:17:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9123310E064;
	Fri, 19 Dec 2025 11:17:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="ydt4cOrE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD69510E064
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 11:17:19 +0000 (UTC)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id C957B21292;
 Fri, 19 Dec 2025 12:17:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1766143038;
 bh=TjeBoAfkVklfbQ/yXh10GPoy8tL4lDWsTndmfjMKrxs=; h=From:To:Subject;
 b=ydt4cOrErz4HuAMCIJV8UK0RR4PV+Xr5J7C23gSWjMI+084RBBwi1KRWS6ddWDt7W
 09/8tLCvKRbFZL6oWtxckck7CgHoy8S118TIUGRMmP1M03nLnVvneAIWcSP4HTnA4O
 H62fJsNMy5TffwNa0ym20Mmo/mcMqJs3UghRPxFoy2hDz+a796TCOEzMfobKqBGiWm
 tTwd5W+kSOkQuThZqcFlPs8ZbN9vltFSv5PI6I/z6FBD+c4BM/dm4IZM0OWfyNonpC
 ofN7MKGCX3YLo3CohR7Ln4VRMc/OKrtfXbaklEUCgr6EL7j3I9b6Zw3/v127yq4vrQ
 6XFF4aa9HXAaA==
Date: Fri, 19 Dec 2025 12:17:16 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Parth Pancholi <parth.pancholi@toradex.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] drm/bridge: tc358768: Add support for long command
 tx via video buffer
Message-ID: <20251219111716.GG39796@francesco-nb>
References: <20251021-tc358768-v1-0-d590dc6a1a0c@ideasonboard.com>
 <20251021-tc358768-v1-7-d590dc6a1a0c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-tc358768-v1-7-d590dc6a1a0c@ideasonboard.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 21, 2025 at 04:23:03PM +0300, Tomi Valkeinen wrote:
> TC358768 has two ways to send DSI commands: 1) buffer the payload data
> into registers (DSICMD_WDx), which supports up to 8 bytes of payload, 2)
> buffer the payload data into the video buffer, which supports up to 1024
> bytes of payload.
> 
> The driver currently supports method 1).
> 
> Add support for transmitting long DSI commands (more than 8 bytes, up to
> 1024 bytes) using the video buffer. This mode can only be used before
> the actual video transmission is enabled, i.e. the initial configuration.
> 
> Original version from Parth Pancholi <parth.pancholi@toradex.com>
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

