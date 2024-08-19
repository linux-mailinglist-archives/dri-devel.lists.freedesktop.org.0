Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0633956BDA
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2024 15:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1985D10E268;
	Mon, 19 Aug 2024 13:25:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dv4G4Q8e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF2F10E268
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2024 13:25:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7FDFD60C67;
 Mon, 19 Aug 2024 13:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F39C32782;
 Mon, 19 Aug 2024 13:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724073947;
 bh=nVi0MFOHh0oHapJVb1x3xrZyc535Kwym8cv2KbMkFU4=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=dv4G4Q8eoIOdD/kJ82Oo4daqKc22bf8ZNdElU3nXLEOVtKIch1o3l2kdaZFAyY1b3
 BWcza/eEW1SyjyFDdBnCB8TAc2VvbwjnUjTKorTaz6wdrrjlXMPAOGSWPL3/6sXKY5
 4Rw+WSetzYUsldYkfSg3uM/+ZPxK9Cee9zwgFSdVBf/NIhnLEHDZnlPjMo9TKyeUa1
 7rA3755nKQzONPpOaoeWv3kuidTL5sXLwQlaWd0GqAu2s/R3ljlgBYU4raZvpZzHPb
 gIkn+8soWgNf/vW8mDW8Ly55GtBNvLW5EmiX/bIBxjqx/q3GAQc+6DSRL0HnT3XheF
 w7U/cR4Q+Vc4w==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20240813-dw-hdmi-simple-clk-v1-1-78d45cef02a9@collabora.com>
References: <20240813-dw-hdmi-simple-clk-v1-1-78d45cef02a9@collabora.com>
Subject: Re: [PATCH] drm/bridge: dw-hdmi: Simplify clock handling
Message-Id: <172407394373.1400799.11053153831131515135.b4-ty@kernel.org>
Date: Mon, 19 Aug 2024 15:25:43 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
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

On Tue, 13 Aug 2024 00:23:21 +0300, Cristian Ciocaltea wrote:
> Make use of devm_clk_get_enabled() to replace devm_clk_get() and
> clk_prepare_enable() for isfr and iahb clocks, and drop the now
> unnecessary calls to clk_disable_unprepare().
> 
> Similarly, use devm_clk_get_optional_enabled() helper for cec clock,
> which additionally allows to remove the -ENOENT test.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: dw-hdmi: Simplify clock handling
      (no commit info)



Rob


