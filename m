Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A348899E06
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 15:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1804310E120;
	Fri,  5 Apr 2024 13:09:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WS0svyP5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BDF2113BF2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Apr 2024 13:09:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7AA69618F4;
 Fri,  5 Apr 2024 13:09:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D91C433F1;
 Fri,  5 Apr 2024 13:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712322580;
 bh=pyHYY0cp6y2a364+xVjeEgDvNZHaRJHSrzno1tz0wqI=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=WS0svyP5nQ5Y51sfjmnIMoEz4bk7HWaPLMzZ5/XR8ZsndM4HSutHmVx75uhKXnxHz
 a+d+MUETkrKLuFUZiDkkXDelX/QPUVyP3mtHfHYY1F8oiExp3TatZQ6UtesekDiSW7
 2N23PohtQ9+wOc+UQW6I/VOCeV56swmF0M0ExPBvulC1T1KuFlQdgyYKpffKNTsM1V
 +mP+oIEweIjLxmr/gQGPVYuq29CRiK7uqwtGEPam5sF2W7pBi+vhr/sePNRo4cY4Vg
 iSKPWXZ/MSHkKBqv88ZrCpJbnL4KVaAoiS2XQuXroXAhgGa4Yk3RceKMD8QmS9o8d9
 bxegeazWRQM1A==
From: Maxime Ripard <mripard@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Maxime Ripard <mripard@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-mips@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20240403-fix-dw-hdmi-kconfig-v1-1-afbc4a835c38@kernel.org>
References: <20240403-fix-dw-hdmi-kconfig-v1-0-afbc4a835c38@kernel.org>
 <20240403-fix-dw-hdmi-kconfig-v1-1-afbc4a835c38@kernel.org>
Subject: Re: (subset) [PATCH 1/7] drm/display: Select DRM_KMS_HELPER for DP
 helpers
Message-Id: <171232257737.9066.13262201288345110455.b4-ty@kernel.org>
Date: Fri, 05 Apr 2024 15:09:37 +0200
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

On Wed, 03 Apr 2024 12:56:19 +0200, Maxime Ripard wrote:
> The DisplayPort helpers rely on some
> (__drm_atomic_helper_private_obj_duplicate_state,
> drm_kms_helper_hotplug_event) helpers found in files compiled by
> DRM_KMS_HELPER.
> 
> Prior to commit d674858ff979 ("drm/display: Make all helpers visible and
> switch to depends on"), DRM_DISPLAY_DP_HELPER was only selectable so it
> wasn't really a big deal. However, since that commit, it's now something
> that can be enabled as is, and since there's no expressed dependency
> with DRM_KMS_HELPER, it can break too.
> 
> [...]

Applied to misc/kernel.git (drm-misc-next).

Thanks!
Maxime

