Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD28A3DC05
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 15:04:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D6510E1BB;
	Thu, 20 Feb 2025 14:04:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="RbfhZuK3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E1210E1BB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2025 14:04:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 51D54432FB;
 Thu, 20 Feb 2025 14:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1740060259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=EAC7somYu40e739WtHAsjHHX4fz3//xMHDippmmZA38=;
 b=RbfhZuK3S6WTwQrsoUQA8hR1Oy/O7cmkgNSG+oO6W8xIvH6huW+KbACQC3d8ERrkoM8+2v
 sAIQB3fPkzNywVproY/xA4dCcrkLwtUD2ofoCdHOk4Ul6Mc1mz4r8ttJARjbsgujA9jwhb
 6ATM2pak6yqJK/mmXS6Ng4Of0lzGepChGKjUlBPFRB2xvA/D9+h2NlNUMpKdhewfJcSr2+
 ByXiocR6/Ri4ABrrXjEMnAnRyi1UVCudSWjvj0FRqKpwCXL5v+y+kTiJuMi/Cd9iJi7KqF
 BnIbPzJtmalA0HZcsgDZ+aOh+2ivxEBxPyCQYB0m7OBjaJaEDBr2js5n7cv5yA==
From: Herve Codina <herve.codina@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH] drm/atomic-helper: Add a note in
 drm_atomic_helper_reset_crtc() kernel-doc
Date: Thu, 20 Feb 2025 15:04:06 +0100
Message-ID: <20250220140406.593314-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeijeefvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeefffffgeduueefhfegfedutddtjeejteegveegtefguddvlefgjeefueekvdetveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemvgdtrgemvdegieemjeejledtmedviegtgeemvgdvvdemiedtfegumeehkegrnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvgeeimeejjeeltdemvdeitgegmegvvddvmeeitdefugemheekrgdphhgvlhhopehlohgtrghlhhhoshhtrdhlohgtrghlughomhgrihhnpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedutddprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvr
 hhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomh
X-GND-Sasl: herve.codina@bootlin.com
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

As suggested in [0], add a note indicating that
drm_atomic_helper_reset_crtc() can be a no-op in some cases.

[0]:https://lore.kernel.org/all/Z7XfnPGDYspwG42y@phenom.ffwll.local/

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
---
 This patch applies on top of the following commit available in drm-misc
   ab83b7f6a0c1 ("drm/atomic-helper: Introduce drm_atomic_helper_reset_crtc()")

 drivers/gpu/drm/drm_atomic_helper.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 0a636c398578..1f93b0a855de 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -3371,6 +3371,10 @@ EXPORT_SYMBOL(drm_atomic_helper_disable_all);
  * This implies a reset of all active components available between the CRTC and
  * connectors.
  *
+ * NOTE: This relies on resetting &drm_crtc_state.connectors_changed.
+ * For drivers which optimize out unnecessary modesets this will result in
+ * a no-op commit, achieving nothing.
+ *
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-- 
2.48.1

