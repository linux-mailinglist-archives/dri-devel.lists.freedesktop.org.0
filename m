Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE106390B0
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 21:31:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0D2710E794;
	Fri, 25 Nov 2022 20:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB5A10E0DD
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Nov 2022 20:31:10 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d898:271f:7512:e47f])
 by michel.telenet-ops.be with bizsmtp
 id okX62800M4su47u06kX6c1; Fri, 25 Nov 2022 21:31:08 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oyfLj-001aQ6-VH; Fri, 25 Nov 2022 21:31:03 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oyfLj-003Kwt-E7; Fri, 25 Nov 2022 21:31:03 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 0/2] drm/modes: Command line mode selection improvements
Date: Fri, 25 Nov 2022 21:30:59 +0100
Message-Id: <cover.1669405382.git.geert@linux-m68k.org>
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

This patch series contains improvements for specifying video modes on the
kernel command line.

I don't expect the second patch to be acceptable as-is, but it's a
dependency for posting the RFC Atari DRM driver...

Changes compared to v2[1]:
  - Drop applied and obsolete patches,
  - Add Acked-by,
  - Update for the switch from names to named mode descriptors.

Changes compared to v1[2]:
  - Add Reviewed-by, Acked-by,
  - Keep length check.

This has been tested on ARAnyM using a work-in-progress Atari DRM
driver.

Thanks for your comments!

[1] "[PATCH v2 0/5] drm/modes: Command line mode selection fixes and
    improvements"
    https://lore.kernel.org/r/cover.1657788997.git.geert@linux-m68k.org
[2] "[PATCH 0/5] drm/modes: Command line mode selection fixes and
    improvements"
    https://lore.kernel.org/r/cover.1657301107.git.geert@linux-m68k.org

Geert Uytterhoeven (2):
  drm/modes: parse_cmdline: Make mode->*specified handling more uniform
  drm/modes: Add support for driver-specific named modes

 drivers/gpu/drm/drm_modes.c | 26 +++++++++-----------------
 include/drm/drm_connector.h | 18 ++++++++++++++++++
 2 files changed, 27 insertions(+), 17 deletions(-)

-- 
2.25.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
