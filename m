Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B4B934C61
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2024 13:24:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 115CC10E78F;
	Thu, 18 Jul 2024 11:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RR3u2hFP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAA2B10E78F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2024 11:24:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2C95061B22;
 Thu, 18 Jul 2024 11:24:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF11C116B1;
 Thu, 18 Jul 2024 11:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721301869;
 bh=KfFyubN8rXnyBy9yxrEzBz3oAiQBkGpvwEHAWprvlDc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RR3u2hFPe99z1pCrlGGQwO40TMQPVFp3zE4eQgi3jnTiI5A30H2lTMAd2L7aNGiVp
 zHvcWZ3DSBdw4/0B3PmqbOIz8MRus4AiJeMGPNLOiib+Y6uG392kK5Lbv20SEy9TdF
 kN6h5WrCa0RZnA9sQ1kj7JdXRHcaLWd1HvO+217rMUH/sTsLObty9AzKBS2oRqzwzX
 Sxs5Or/FMPDQbwxpcoGtBOfUBaj6ZIAhcYS/nPHNKp8j6PQB7pXwsVYPEkZE7RKNpI
 TVvoja2NyYaFDNv1GOns6ohn/keZJzrNmAvUmHWPV6reY7hvxKn43uJY37aONJ+/wV
 1s6jVk/djH5AQ==
From: Robert Foss <rfoss@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
In-Reply-To: <20240703122715.4004765-1-alexander.stein@ew.tq-group.com>
References: <20240703122715.4004765-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH v5 1/1] drm/bridge: Silence error messages upon probe
 deferral
Message-Id: <172130186654.520314.13110263316783512332.b4-ty@kernel.org>
Date: Thu, 18 Jul 2024 13:24:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

On Wed, 03 Jul 2024 14:27:15 +0200, Alexander Stein wrote:
> When -EPROBE_DEFER is returned do not raise an error, but silently return
> this error instead. Fixes error like this:
> [drm:drm_bridge_attach] *ERROR* failed to attach bridge
>   /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517
> [drm:drm_bridge_attach] *ERROR* failed to attach bridge
>   /soc@0/bus@30800000/mipi-dsi@30a00000 to encoder None-34: -517
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: Silence error messages upon probe deferral
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=bc657615e10d



Rob


