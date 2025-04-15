Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C90E4A8A55F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 19:27:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D8610E80C;
	Tue, 15 Apr 2025 17:27:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jrCuffwJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC0E310E80C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 17:27:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A74615C5832;
 Tue, 15 Apr 2025 17:24:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4A6C4CEE9;
 Tue, 15 Apr 2025 17:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744738029;
 bh=6XeNlOlstSEOvXo8EXHHR0/S7hM3KEkYdwSBdSs518A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jrCuffwJ5VOaNT2JyDtNIp2H41cBzWsyHZs8gQrKUr8R1Qvk9nP84I+cX00JMwv1B
 xTnwUYGN738eXTGddu96j7p0cbrHEjc7BocO8USYlkSwbIubencyBwKA3/GAKRMc8r
 xXv3eGUudononhdBSZoekiVZZzfhZzgw7r9PYp6E/gryXbpU/+AKSkxA6HL3mDBnK1
 BWHIJRfrIASQBOdwAShczWQVSACVuboOfmAQHqfF6KX6Cvk5mYDH4uOe7FM3trlQoO
 8QiK4El/1xypAZ1hhsoxoW1yLSuydluvQbs+YmOSfaOUnkXMb13oH2zRm7QqslTIbm
 f72BfbsYUwX1Q==
Date: Tue, 15 Apr 2025 18:27:04 +0100
From: Lee Jones <lee@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: pavel@ucw.cz, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 simona@ffwll.ch, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [GIT PULL] Immutable branch between Backlight, fbdev and LEDs for
 the v6.16 merge window
Message-ID: <20250415172704.GD372032@google.com>
References: <20250321095517.313713-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250321095517.313713-1-tzimmermann@suse.de>
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  ssh://git@gitolite.kernel.org/pub/scm/linux/kernel/git/lee/backlight.git tags/ib-backlight-leds-fbdev-v6.16

for you to fetch changes up to d32a0b567a8a8b6e677d35c4f8eb8bd32b7029a0:

  fbdev: Remove constants of unused events (2025-04-10 10:39:14 +0100)

----------------------------------------------------------------
Immutable branch between Backlight, fbdev and LEDs for the v6.16 merge window

----------------------------------------------------------------
Thomas Zimmermann (11):
      fbdev: Rework fb_blank()
      fbdev: Track display blanking state
      fbdev: Send old blank state in FB_EVENT_BLANK
      backlight: Implement fbdev tracking with blank state from event
      backlight: Move blank-state handling into helper
      backlight: Replace fb events with a dedicated function call
      backlight: lcd: Move event handling into helpers
      backlight: lcd: Replace fb events with a dedicated function call
      leds: backlight trigger: Move blank-state handling into helper
      leds: backlight trigger: Replace fb events with a dedicated function call
      fbdev: Remove constants of unused events

 drivers/leds/trigger/ledtrig-backlight.c |  48 +++++++-------
 drivers/video/backlight/backlight.c      |  93 ++++++--------------------
 drivers/video/backlight/lcd.c            | 108 ++++++++++++-------------------
 drivers/video/fbdev/core/fb_backlight.c  |  12 ++++
 drivers/video/fbdev/core/fb_info.c       |   1 +
 drivers/video/fbdev/core/fbmem.c         |  82 +++++++++++++++++++----
 drivers/video/fbdev/core/fbsysfs.c       |   8 +--
 include/linux/backlight.h                |  32 ++++-----
 include/linux/fb.h                       |  12 ++--
 include/linux/lcd.h                      |  21 +++++-
 include/linux/leds.h                     |   6 ++
 11 files changed, 215 insertions(+), 208 deletions(-)

-- 
Lee Jones [李琼斯]
