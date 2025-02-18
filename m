Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BEBA396B7
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 10:16:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B644810E05C;
	Tue, 18 Feb 2025 09:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hChNyeH9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D394810E05C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 09:16:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E7FD2A41B17;
 Tue, 18 Feb 2025 09:14:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83F72C4CEE2;
 Tue, 18 Feb 2025 09:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739870180;
 bh=SM0tMdeumZj6AQd5w41sZm2dTMTE+7buMAzeBPDtq20=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hChNyeH9nWUdkJPLiXRMiNLxjxdBk5mK41mOqPKj9Xt9Ff6h/Vc23KKHLFXxRa9R8
 f8hplOnVubqAPmGrzKqUeq15pxxCNUNkY5PJzb61XFUfZxSYxCU7nEgxKtfXAxMyLJ
 grSIdeLuFl8GDA5WhLfgTt7+QpNj3FApUS8igKE62TCwFil+az/pQ6xbnzKRR8an3r
 326dTaHjEjpP5GpMK0Et7TKONrcMancFnC9TPwLiNflZf1udmlCArvmG6SbtW+5u0n
 ivRgY6tvoDbUZIGRH5sRbMME8ECF6WC2ygqpOv09mg7Kya9IJx2k/p6ih5VWlLShxp
 dMiMOx/+EeBvg==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250120132135.554391-1-alexander.stein@ew.tq-group.com>
References: <20250120132135.554391-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/2] drm/bridge: ti-sn65dsi83: Set bridge type
Message-Id: <173987017056.847779.15480441062069554205.b4-ty@kernel.org>
Date: Tue, 18 Feb 2025 10:16:10 +0100
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

On Mon, 20 Jan 2025 14:21:34 +0100, Alexander Stein wrote:
> This is a DSI to LVDS bridge, so set the bridge type accordingly.
> 
> 

Applied, thanks!

[1/2] drm/bridge: ti-sn65dsi83: Set bridge type
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/272f17229e47
[2/2] drm/bridge: nwl-dsi: Set bridge type
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/9b6c03cb96b9



Rob


