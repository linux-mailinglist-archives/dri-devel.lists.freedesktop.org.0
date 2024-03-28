Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4907F88FD1A
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 11:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7E210F419;
	Thu, 28 Mar 2024 10:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MB90J5XA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED56510F419
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 10:32:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5519D60C61;
 Thu, 28 Mar 2024 10:32:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E461C433F1;
 Thu, 28 Mar 2024 10:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711621974;
 bh=OjnZXo6Q9uDkGmIDHFIa6XgV3eDBiEPaBDR+3c4XXrg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MB90J5XAetTAhGkp36UhtimN7sGX8q7bMdb3bYZQhfawv/QLXsuDgqwNYuF7Ur8v4
 HCwiH0xZGF3dCoFWXgWIJav5GXgpsPrbF2IZPP9scPq5I1nU8W8lYR4e8M7LSNF+ws
 3lv5coUVqaI+NQcXfIPnmVckRXF+QCjsV4Iri56t8Er3/Yc4K8lVwFrvagm0UIEF24
 OoLfjUQMKzvC3CzY3zKVf88R02Ra+WIbsjeDygI1moDWsoeqoh9j7C96gvNNjbp12H
 eIa0yn27M8aeqrUMv2IRhviXR5JtHmxZAmhbr15cT51dWPPMEb3Mb/bFERfRLFd4UW
 p4ZUmovLC/tOA==
Date: Thu, 28 Mar 2024 10:32:48 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com, deller@gmx.de,
 andy@kernel.org, geert@linux-m68k.org, dan.carpenter@linaro.org,
 sam@ravnborg.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [GIT PULL] Immutable branch between MFD, Auxdisplay, Staging, fbdev
 and OMAP due for the v6.9 merge window
Message-ID: <20240328103248.GY13211@google.com>
References: <20240319093915.31778-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240319093915.31778-1-tzimmermann@suse.de>
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

Enjoy!

The following changes since commit 4cece764965020c22cff7665b18a012006359095:

  Linux 6.9-rc1 (2024-03-24 14:10:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git ib-backlight-auxdisplay-staging-omap-v6.9

for you to fetch changes up to 4551978bb50a8d59b49629deebacd73478a8b1e1:

  backlight: Remove fb_blank from struct backlight_properties (2024-03-28 10:16:26 +0000)

----------------------------------------------------------------
Immutable branch between MFD, Auxdisplay, Staging, fbdev and OMAP due for the v6.9 merge window

----------------------------------------------------------------
Thomas Zimmermann (6):
      auxdisplay: ht16k33: Replace use of fb_blank with backlight helper
      backlight: omap1: Remove unused struct omap_backlight_config.set_power
      backlight: omap1: Replace FB_BLANK_ states with simple on/off
      fbdev: omap2/omapfb: Replace use of fb_blank with backlight helpers
      staging: fbtft: Remove reference to fb_blank
      backlight: Remove fb_blank from struct backlight_properties

 drivers/auxdisplay/ht16k33.c                       |  7 +---
 drivers/staging/fbtft/fb_ssd1351.c                 |  4 +-
 drivers/staging/fbtft/fbtft-core.c                 |  5 +--
 drivers/video/backlight/backlight.c                |  2 -
 drivers/video/backlight/mp3309c.c                  |  1 -
 drivers/video/backlight/omap1_bl.c                 | 47 +++++++++-------------
 drivers/video/fbdev/atmel_lcdfb.c                  |  1 -
 .../fbdev/omap2/omapfb/displays/panel-dsi-cm.c     |  7 +---
 .../omap2/omapfb/displays/panel-sony-acx565akm.c   | 10 +----
 include/linux/backlight.h                          | 25 +-----------
 include/linux/platform_data/omap1_bl.h             |  1 -
 11 files changed, 26 insertions(+), 84 deletions(-)

-- 
Lee Jones [李琼斯]
