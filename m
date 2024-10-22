Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F1C9AB009
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 15:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBFB10E323;
	Tue, 22 Oct 2024 13:50:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JYMnGAZN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80A210E323
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 13:50:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 73AC45C5ADA;
 Tue, 22 Oct 2024 13:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBB0FC4CEC7;
 Tue, 22 Oct 2024 13:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729605011;
 bh=WrfoQ0CcVnhI+DiLyo+NUznIagx+ZJo5tZXbePv565I=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=JYMnGAZNX6IebZEAju7HITMfMDOrw0X391qVeotVMelYwNgzpCasz9NVQbCNxo25o
 b+dFlV6z393kaE7+L/cmwu509km7H/MomwghqVcVNRAuliC/VwysUtwrnxQvlUBAfH
 /MghiEbjxC8LRyitCGwvBs/DoABU4L6UlKJYVA4fmBfKHLH16urwSirxilZqbNzolJ
 DuCHmXIg2pnyd6s5xvPdcel48BMVIvHw0mWwgcrXXRnhv5laHiLgYSqplYSwRDLuVt
 i7SIlsKSVBXLf7r6XMjmyeWszntQJOu1ulW0cMaoYNnp9unNn10cvLeK+Ht/hoh3Pd
 q5BvvxveLrC/w==
From: Robert Foss <rfoss@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241015073004.4066457-1-arnd@kernel.org>
References: <20241015073004.4066457-1-arnd@kernel.org>
Subject: Re: [PATCH 1/2] drm/imx: parallel-display: add legacy bridge
 Kconfig dependency
Message-Id: <172960500762.1579658.15507711463714527962.b4-ty@kernel.org>
Date: Tue, 22 Oct 2024 15:50:07 +0200
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

On Tue, 15 Oct 2024 07:29:57 +0000, Arnd Bergmann wrote:
> The driver now uses the legacy bridge helper code but can be configured
> to get built without it:
> 
> ERROR: modpost: "devm_imx_drm_legacy_bridge" [drivers/gpu/drm/imx/ipuv3/parallel-display.ko] undefined!
> 
> Add the required dependency, same as in the ldb driver.
> 
> [...]

Applied, thanks!

[1/2] drm/imx: parallel-display: add legacy bridge Kconfig dependency
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/ef214002e6b3
[2/2] drm/imx: legacy-bridge: add MODULE_DESCRIPTION
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/df606be44c16



Rob


