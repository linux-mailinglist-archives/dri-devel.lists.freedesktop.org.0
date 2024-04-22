Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02DA8AC355
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 06:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1B510ED50;
	Mon, 22 Apr 2024 04:08:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=yeah.net header.i=@yeah.net header.b="VPy8bsJE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 638 seconds by postgrey-1.36 at gabe;
 Mon, 22 Apr 2024 04:08:35 UTC
Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
 by gabe.freedesktop.org (Postfix) with ESMTP id 71B1010ED50
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 04:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
 Content-Type; bh=tz47OXMk6zbzBGF1ySQDbEiSUSoHnPDqD9rcCDIH3/o=;
 b=VPy8bsJEtjhzPsrf057kTfxn2QcwPsyLbEVeyhEsMSlK1s6rOKafjwW1tFiiXn
 BJzxCWUZ19e2Y3C1m3C9snT+A1us0lCGXrTutHQS0mIMD7kHaG1J3L1xyb9+9UsR
 k5LTxpbP8FNwbH+D37t/J+5ZPUoN9EXp4qxqlsRVJmVDQ=
Received: from dragon (unknown [223.68.79.243])
 by smtp1 (Coremail) with SMTP id ClUQrABHzw5N3yVmRawrAw--.30849S3;
 Mon, 22 Apr 2024 11:53:50 +0800 (CST)
Date: Mon, 22 Apr 2024 11:53:49 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jani Nikula <jani.nikula@intel.com>,
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
 Mark Brown <broonie@kernel.org>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
 linux-sunxi@lists.linux.dev, linux-mips@vger.kernel.org
Subject: Re: [PATCH 3/7] ARM: configs: imx_v6_v7: Enable DRM_DW_HDMI
Message-ID: <ZiXfTfNoc0/2XL9s@dragon>
References: <20240403-fix-dw-hdmi-kconfig-v1-0-afbc4a835c38@kernel.org>
 <20240403-fix-dw-hdmi-kconfig-v1-3-afbc4a835c38@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403-fix-dw-hdmi-kconfig-v1-3-afbc4a835c38@kernel.org>
X-CM-TRANSID: ClUQrABHzw5N3yVmRawrAw--.30849S3
X-Coremail-Antispam: 1Uf129KBjvdXoW5Kr4Duw13uw1UuF1UAF13urg_yoWxGwcEyF
 yxKrn7Zr15Za4jyw15KFZavrsa93WUWFn8X3yUKrW3WFn8XF45Ar4kt34Sywn7Z3WIyrsr
 CFs5J3Wvyw4IvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbco7JUUUUU==
X-Originating-IP: [223.68.79.243]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBQ7IZVsVCfARMAAAsw
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

On Wed, Apr 03, 2024 at 12:56:21PM +0200, Maxime Ripard wrote:
> Commit 4fc8cb47fcfd ("drm/display: Move HDMI helpers into display-helper
> module") turned the DRM_DW_HDMI dependency of DRM_IMX_HDMI into a
> depends on which ended up disabling the driver in the defconfig. Make
> sure it's still enabled.
> 
> Fixes: 4fc8cb47fcfd ("drm/display: Move HDMI helpers into display-helper module")
> Reported-by: Mark Brown <broonie@kernel.org>
> Reported-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Shawn Guo <shawnguo@kernel.org>

