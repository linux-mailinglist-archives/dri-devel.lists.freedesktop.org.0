Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EA656BE9E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 20:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD92F10EBCD;
	Fri,  8 Jul 2022 18:21:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F02510EBCE
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 18:21:40 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by michel.telenet-ops.be with bizsmtp
 id siMf2700i4C55Sk06iMfjW; Fri, 08 Jul 2022 20:21:40 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbg-002fKl-Kz; Fri, 08 Jul 2022 20:21:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1o9sbg-00BtPX-35; Fri, 08 Jul 2022 20:21:36 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 0/5] drm/modes: Command line mode selection fixes and
 improvements
Date: Fri,  8 Jul 2022 20:21:24 +0200
Message-Id: <cover.1657301107.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

	Hi all,

This patch series contains fixes and improvements for specifying video
modes on the kernel command line.

This has been tested on ARAnyM using a work-in-progress Atari DRM driver
(more info and related patches can be found in [1]).

Thanks for your comments!

[1] "[PATCH v3 00/10] drm: Add support for low-color frame buffer formats"
    https://lore.kernel.org/r/cover.1657294931.git.geert@linux-m68k.org

Geert Uytterhoeven (5):
  drm/modes: parse_cmdline: Handle empty mode name part
  drm/modes: Extract drm_mode_parse_cmdline_named_mode()
  drm/modes: parse_cmdline: Make mode->*specified handling more uniform
  drm/modes: Add support for driver-specific named modes
  drm/modes: parse_cmdline: Add support for named modes containing
    dashes

 drivers/gpu/drm/drm_modes.c | 57 ++++++++++++++++++++++++++-----------
 include/drm/drm_connector.h | 10 +++++++
 2 files changed, 50 insertions(+), 17 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
