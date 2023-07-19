Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CFD759994
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 17:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B25810E4CC;
	Wed, 19 Jul 2023 15:24:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56EAA10E4CB
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 15:23:50 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:51f7:4083:c317:cdf])
 by albert.telenet-ops.be with bizsmtp
 id P3Pg2A00D2xuRWb063Pg26; Wed, 19 Jul 2023 17:23:47 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qM91W-001tXx-4b;
 Wed, 19 Jul 2023 17:23:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qM91g-001Bjf-3x;
 Wed, 19 Jul 2023 17:23:40 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH v3 0/4] drm: Atomic modesetting doc and comment improvements
Date: Wed, 19 Jul 2023 17:23:33 +0200
Message-Id: <cover.1689779916.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

        Hi all,

This patch series contains various improvements to the documentation and
comments related to atomic modesetting.  Hopefully, it will ease the job
of DRM novice who want to tackle the daunting task of converting a
legacy DRM driver to atomic modesetting.

Changes compared to v2[1]:
  - Make main text read correctly when ignoring the footnotes,
  - Add Reviewed-by.

Changes compared to v1[2]:
  - Add Reviewed-by,
  - Drop double space after full stop,
  - Use footnotes for references,
  - Remore reference to unconverted virtual HW drivers,
  - New patch [2/4],
  - Drop "first part" in drivers/gpu/drm/drm_plane_helper.c.

Thanks for applying!

[1] https://lore.kernel.org/r/cover.1686318012.git.geert+renesas@glider.be
[2] https://lore.kernel.org/r/cover.1685696114.git.geert+renesas@glider.be

Geert Uytterhoeven (4):
  drm/todo: Add atomic modesetting references
  drm/todo: Convert list of fbconv links to footnotes
  drm: Remove references to removed transitional helpers
  drm: Fix references to drm_plane_helper_check_state()

 Documentation/gpu/todo.rst                    | 22 +++++----
 drivers/gpu/drm/drm_plane_helper.c            | 12 +----
 .../gpu/drm/renesas/rcar-du/rcar_du_plane.c   |  3 +-
 drivers/gpu/drm/tidss/tidss_plane.c           |  3 +-
 include/drm/drm_crtc.h                        |  5 --
 include/drm/drm_modeset_helper_vtables.h      | 48 ++++++++-----------
 6 files changed, 40 insertions(+), 53 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
