Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51328CCF70F
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 11:44:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF00B10EF1A;
	Fri, 19 Dec 2025 10:44:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="Dr0raZbC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86D910EF29
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:44:23 +0000 (UTC)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id A24331FA97;
 Fri, 19 Dec 2025 11:44:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1766141062;
 bh=ygYhk4F/F4fhxwftKgOcsB4V9H6QAgiyK9zktEtsWUI=; h=From:To:Subject;
 b=Dr0raZbChInnpaLl3hfnMxlrpaGw7mu27dHn/ikvgql9B4JoUcCuQvbUPdwTJRA7o
 mW7rDKzpbSisj48RoVDCPa3M0WxTXcWHOnLzprCumzpB6ERCqJitbXQm/1mySR+ahP
 YN8gBIoMzNyauzkYozbU5vEbnyO5Xk+DmWFufgdKd17hAS2uXf66FNHcDJnnR+cmQM
 qgrKxpAHnUKZhBDiWUHlEnhqH3fvbkXrCX9dkAC/lADM9HTKJ/ih7R0CiZJ+50ULHo
 W4OukFLiZWKVD84wrGT50gFiAhWv7g+ajhLOBncfi3NvY/m/h3AX3TG5LgOEI7OiJ5
 KwPN36M12ruFw==
Date: Fri, 19 Dec 2025 11:44:20 +0100
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
Subject: Re: [PATCH 6/7] drm/bridge: tc358768: Separate video format config
Message-ID: <20251219104420.GF39796@francesco-nb>
References: <20251021-tc358768-v1-0-d590dc6a1a0c@ideasonboard.com>
 <20251021-tc358768-v1-6-d590dc6a1a0c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-tc358768-v1-6-d590dc6a1a0c@ideasonboard.com>
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

On Tue, Oct 21, 2025 at 04:23:02PM +0300, Tomi Valkeinen wrote:
> Sending long commands using the video buffer (to be implemented in
> following patches) requires setting TC358768_DATAFMT and
> TC358768_DSITX_DT registers for command transfer. The same registers
> also need to be configured properly for video transfer.
> 
> The long commands will be sent between the bridge's pre_enable() and
> enable(), and currently we configure the registers for video transfer in
> pre_enable(). Thus, they would be overwritten by the long command
> transfer code.
> 
> To prevent that from happening, set those registers for video transfer
> in enable(), not in pre_enable().
> 
> Based on code from Parth Pancholi <parth.pancholi@toradex.com>
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

