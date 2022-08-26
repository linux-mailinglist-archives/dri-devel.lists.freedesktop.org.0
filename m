Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5DF5A2904
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 16:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECA1C10E632;
	Fri, 26 Aug 2022 14:03:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 534 seconds by postgrey-1.36 at gabe;
 Fri, 26 Aug 2022 10:10:21 UTC
Received: from smtpout140.security-mail.net (smtpout140.security-mail.net
 [85.31.212.145])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76FEF10E827
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 10:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id 1DB483237FE
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 12:01:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
 s=sec-sig-email; t=1661508085;
 bh=AQeR8ILdZrHYlixwXWZ9TJtLVXw6lpIE0xrXp5n66VM=;
 h=From:To:Cc:Subject:Date;
 b=Ya99+JBZmqVjM9+cLhVvJa85Lq3s85tihQCTQsxebMYS9DGjcKv/MfoLAst6ZIkfn
 ZUExWucoX3NzvIOSTFVJ1UZ4x2SIzy2zA0pttDoMeoicY292hXgPLZVpNWdJ6ah8m0
 Om56swzE0/Z+SBvGDXbqi8qwcW7l176aY/osUnj0=
Received: from fx405 (localhost [127.0.0.1])
 by fx405.security-mail.net (Postfix) with ESMTP id 0E7E83237D3;
 Fri, 26 Aug 2022 12:01:24 +0200 (CEST)
X-Virus-Scanned: E-securemail
Secumail-id: <97fc.630899f2.51286.0>
Received: from zimbra2.kalray.eu (unknown [217.181.231.53])
 by fx405.security-mail.net (Postfix) with ESMTPS id D36AD3236A2;
 Fri, 26 Aug 2022 12:01:22 +0200 (CEST)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTPS id 2E25727E0396;
 Fri, 26 Aug 2022 12:01:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra2.kalray.eu (Postfix) with ESMTP id 167C127E0392;
 Fri, 26 Aug 2022 12:01:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 167C127E0392
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1661508082;
 bh=7YkIwgTRyznEJf4Uaeh9hIBcIzx+ZpeKjWZoSTHVrrM=;
 h=From:To:Date:Message-Id;
 b=OZgCjUdiOJy7xwK9dfZcA66r9fryRJzHRYJWVZBLjF5lqpqnRMqcUl4mURQCn5/t+
 docm1GxGNGyMTGZiNJiAgw4mKM79GGJw+1VK/cOkfLpzIjAmv5NWZp90+jnX/tyfEa
 B3UH1XdjT2uISvf/REsXGUt8QJtUKNdFuXJg9o0Q=
Received: from zimbra2.kalray.eu ([127.0.0.1])
 by localhost (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id oyFfAiPO1JCj; Fri, 26 Aug 2022 12:01:22 +0200 (CEST)
Received: from tellis.lin.mbt.kalray.eu (unknown [192.168.36.206])
 by zimbra2.kalray.eu (Postfix) with ESMTPSA id 023C327E02FA;
 Fri, 26 Aug 2022 12:01:22 +0200 (CEST)
From: Jules Maselbas <jmaselbas@kalray.eu>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm: Fix repeated word in comments
Date: Fri, 26 Aug 2022 12:00:44 +0200
Message-Id: <20220826100052.22945-16-jmaselbas@kalray.eu>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: by Secumail
X-Mailman-Approved-At: Fri, 26 Aug 2022 14:03:29 +0000
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
Cc: Jules Maselbas <jmaselbas@kalray.eu>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove redundant words `the` and `this`.

CC: David Airlie <airlied@linux.ie>
CC: Maxime Ripard <mripard@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: amd-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
---
 .../gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h | 2 +-
 .../gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h   | 2 +-
 drivers/gpu/drm/display/drm_dp_helper.c                         | 2 +-
 drivers/gpu/drm/drm_panel_orientation_quirks.c                  | 2 +-
 drivers/gpu/drm/i915/gvt/scheduler.c                            | 2 +-
 drivers/gpu/drm/i915/i915_irq.c                                 | 2 +-
 drivers/gpu/drm/panel/panel-novatek-nt35510.c                   | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h
index 43d43d6addc0..4164da83380f 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_arcturus.h
@@ -486,7 +486,7 @@ typedef struct {
   uint16_t Tvr_socLimit;            // Celcius
   uint32_t FitLimit;                // Failures in time (failures per million parts over the defined lifetime)
 
-  uint16_t PpmPowerLimit;           // Switch this this power limit when temperature is above PpmTempThreshold
+  uint16_t PpmPowerLimit;           // Switch this power limit when temperature is above PpmTempThreshold
   uint16_t PpmTemperatureThreshold;
 
   // SECTION: Throttler settings
diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h
index 04752ade1016..ba7c68a20425 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/smu11_driver_if_navi10.h
@@ -544,7 +544,7 @@ typedef struct {
   uint16_t TplxLimit;               // Celcius
   uint32_t FitLimit;                // Failures in time (failures per million parts over the defined lifetime)
 
-  uint16_t PpmPowerLimit;           // Switch this this power limit when temperature is above PpmTempThreshold
+  uint16_t PpmPowerLimit;           // Switch this power limit when temperature is above PpmTempThreshold
   uint16_t PpmTemperatureThreshold;
   
   // SECTION: Throttler settings
diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index e5bab236b3ae..32b295003f49 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -1597,7 +1597,7 @@ static int drm_dp_aux_reply_duration(const struct drm_dp_aux_msg *msg)
 
 /*
  * Calculate the length of the i2c transfer in usec, assuming
- * the i2c bus speed is as specified. Gives the the "worst"
+ * the i2c bus speed is as specified. Gives the "worst"
  * case estimate, ie. successful while as long as possible.
  * Doesn't account the "MOT" bit, and instead assumes each
  * message includes a START, ADDRESS and STOP. Neither does it
diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index fc1728d46ac2..dde2f4c4c6cb 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -349,7 +349,7 @@ static const struct dmi_system_id orientation_data[] = {
  * resolution expected by the quirk-table entry.
  *
  * Note this function is also used outside of the drm-subsys, by for example
- * the efifb code. Because of this this function gets compiled into its own
+ * the efifb code. Because of this function gets compiled into its own
  * kernel-module when built as a module.
  *
  * Returns:
diff --git a/drivers/gpu/drm/i915/gvt/scheduler.c b/drivers/gpu/drm/i915/gvt/scheduler.c
index d6fe94cd0fdb..7670ae4dd8fa 100644
--- a/drivers/gpu/drm/i915/gvt/scheduler.c
+++ b/drivers/gpu/drm/i915/gvt/scheduler.c
@@ -193,7 +193,7 @@ static int populate_shadow_context(struct intel_vgpu_workload *workload)
 			workload->ring_context_gpa);
 
 	/* only need to ensure this context is not pinned/unpinned during the
-	 * period from last submission to this this submission.
+	 * period from last submission to this submission.
 	 * Upon reaching this function, the currently submitted context is not
 	 * supposed to get unpinned. If a misbehaving guest driver ever does
 	 * this, it would corrupt itself.
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index 73cebc6aa650..783a6ca41a61 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -65,7 +65,7 @@
 
 /*
  * Interrupt statistic for PMU. Increments the counter only if the
- * interrupt originated from the the GPU so interrupts from a device which
+ * interrupt originated from the GPU so interrupts from a device which
  * shares the interrupt line are not accounted.
  */
 static inline void pmu_irq_stats(struct drm_i915_private *i915,
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index 40ea41b0a5dd..4085822f619a 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -231,7 +231,7 @@ struct nt35510_config {
 	 * bits 0..2 in the lower nibble controls HCK, the booster clock
 	 * frequency, the values are the same as for PCK in @bt1ctr.
 	 * bits 4..5 in the upper nibble controls BTH, the boosting
-	 * amplification for the the step-up circuit.
+	 * amplification for the step-up circuit.
 	 * 0 = AVDD + VDDB
 	 * 1 = AVDD - AVEE
 	 * 2 = AVDD - AVEE + VDDB
-- 
2.17.1

