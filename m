Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7178DA2F229
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 16:53:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D940510E5B1;
	Mon, 10 Feb 2025 15:53:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SRrs14VQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48DD10E5BB
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 15:53:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9E2225C5436;
 Mon, 10 Feb 2025 15:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA941C4CED1;
 Mon, 10 Feb 2025 15:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739202784;
 bh=yqGd0pQCEeWQ7bz7anVjqVOop738V+vFyvm+NZfQDdg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=SRrs14VQxzOXuxJWT4H5CtGOsgDgM0Ia1kmvb8JAZl8159ePxW4KrILXTUaYGmTv2
 EsWe2RtbGxwoIFUoLXKXAzSDLc2AmZUZRHH8hsaBzeTMySCBDcu51jJ4x2Pfqvrfqi
 pZKmafVjefDK4TOqo6h46L92PNPrNwr4pdxuikuiesltIHY3UGAL79Mo2oJL2u7gx7
 k4TeUVDF4RVaAA/EF5/VPmR91d7ygKMeMfIkp9Hrfq/2CvYCHcIUDgnEhffaDAk+DN
 6fOZ6kdUjcsD2f/CJMNGroJAxmjAJjkWrmbpEqz0IB2diQot4BqZRBCxPW5KXQOdJa
 RTdvnULffSDVw==
From: Robert Foss <rfoss@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>
References: <20250206-drm-cleanups-v1-0-93df60faa756@bootlin.com>
Subject: Re: [PATCH 0/8] drm/bridge: minor cleanups
Message-Id: <173920278049.3996442.9575559146490038271.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 16:53:00 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Thu, 06 Feb 2025 18:02:32 +0100, Luca Ceresoli wrote:
> This series removes some unnecessary #includes and and unused forward
> declarations, which I noticed while preparing a way more complex series
> (bridge hotplug). I decided to split these trivial patches to a separate
> series to limit the noise on the larger series.
> 
> 

Applied, thanks!

[1/8] drm/panel: remove unnecessary forward declaration
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/66ac08bb7788
[2/8] drm/bridge: nxp-ptn3460: remove unused drm_panel.h include
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/f4e71f660368
[3/8] drm/bridge: parade-ps8622: remove unused drm_panel.h include
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/202f3f60d174
[4/8] drm/bridge: parade-ps8640: remove unused drm_panel.h include
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/10fab0675483
[5/8] drm/bridge: tc358762: remove unused drm_panel.h include, add drm_bridge.h
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/38e092786e54
[6/8] drm/bridge: tc358775: remove unused drm_panel.h include
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/2ac2ff99962a
[7/8] drm/bridge: ti-sn65dsi83: remove unused drm_panel.h include
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/5199ffb87f78
[8/8] drm/bridge: ti-sn65dsi86: remove unused drm_panel.h include
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0e9cb79ce49b



Rob


