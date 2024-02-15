Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B67385643E
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 14:24:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A0D10E2F9;
	Thu, 15 Feb 2024 13:24:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04DCC10E2F9
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 13:24:22 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:ac52:3a54:2a84:d65a])
 by xavier.telenet-ops.be with bizsmtp
 id nRQG2B00U0LVNSS01RQGbY; Thu, 15 Feb 2024 14:24:21 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rabij-000gyw-E4;
 Thu, 15 Feb 2024 14:24:16 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1rabiq-00HZgK-PB;
 Thu, 15 Feb 2024 14:24:16 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] drm: Spelling s/hardward/hardware/g
Date: Thu, 15 Feb 2024 14:24:15 +0100
Message-Id: <94c9b76ee906d1b790dfcc435f4221b1197df586.1708003402.git.geert+renesas@glider.be>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix misspellings of "hardware".

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
v2:
  - Add Reviewed-by.
---
 include/drm/drm_bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index e39da5807ba71c2d..57d647722cf79704 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -107,7 +107,7 @@ struct drm_bridge_funcs {
 	 * Since this function is both called from the check phase of an atomic
 	 * commit, and the mode validation in the probe paths it is not allowed
 	 * to look at anything else but the passed-in mode, and validate it
-	 * against configuration-invariant hardward constraints. Any further
+	 * against configuration-invariant hardware constraints. Any further
 	 * limits which depend upon the configuration can only be checked in
 	 * @mode_fixup.
 	 *
-- 
2.34.1

