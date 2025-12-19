Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810C0CCF654
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 11:37:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE29910EF02;
	Fri, 19 Dec 2025 10:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dolcini.it header.i=@dolcini.it header.b="SuTJ4qEy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CF4A10EF02
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 10:37:05 +0000 (UTC)
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id AA4741FA97;
 Fri, 19 Dec 2025 11:37:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
 s=default; t=1766140624;
 bh=cY3+m6Nw/weuuQf/De8+cRNMn8FtpJTA7F6Q+NJ/yQ0=; h=From:To:Subject;
 b=SuTJ4qEyN2FHJMsu56IZj6UXn7AT0IWm2+A4ff08LCEvozpTQylIUYEbQ3ZwWXsKV
 dN4ztUu3oZfvkoPupAVoo+B/NAyTHx3wiUnae7XvVof/jgBTXkEpYh49GPUh98y8pL
 HkovC4O0hhHV29yYNnSoKI0rhSFo+OnAIW7HElU3FoK9/FtuTJduBw5w/8s8nd/OHg
 WsBo/a0fhm8jwBlWSqMsDvxqlOfyXLc3F/eaoank2UjSLkfHE9LRftOQTDTbJOR4ru
 aH0Hn+nJFYjzYQoOVn3CxtTjVzaFwy9Kmzxc1Mirk8OQZcKulPxkO2WozhiKFOpNyq
 ex8BgzbEoKp3Q==
Date: Fri, 19 Dec 2025 11:37:02 +0100
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
Subject: Re: [PATCH 5/7] drm/bridge: tc358768: Add LP mode command support
Message-ID: <20251219103702.GE39796@francesco-nb>
References: <20251021-tc358768-v1-0-d590dc6a1a0c@ideasonboard.com>
 <20251021-tc358768-v1-5-d590dc6a1a0c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251021-tc358768-v1-5-d590dc6a1a0c@ideasonboard.com>
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

On Tue, Oct 21, 2025 at 04:23:01PM +0300, Tomi Valkeinen wrote:
> Currently the driver ignores MIPI_DSI_MODE_LPM and always uses HS mode.
> Add code to enable HS mode in pre_enable() only if MIPI_DSI_MODE_LPM is
> not set, and always enable HS mode in enable() for video transmission.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Francesco Dolcini <francesco.dolcini@toradex.com>

