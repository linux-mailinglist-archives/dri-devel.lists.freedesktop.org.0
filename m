Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41832A110D7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 20:07:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8D9110E474;
	Tue, 14 Jan 2025 19:07:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="ORstufDz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd4a.google.com (mail-io1-xd4a.google.com
 [IPv6:2607:f8b0:4864:20::d4a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6136810E474
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 19:07:23 +0000 (UTC)
Received: by mail-io1-xd4a.google.com with SMTP id
 ca18e2360f4ac-84cdae60616so489909339f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 11:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1736881642; x=1737486442;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=HkXEGKaHS4Wap2DZ8mnEQl68mT1GrP1ybYkz9IG2DCI=;
 b=ORstufDzvtSZ6e1EbbWDwS5HnQgNMKJQ/6quo9H+2Y8cePeuyU58GE6voEhfWqTWcH
 /opr7IMkp/6wucrhdqPBDSYJTkRdI7ReCTMoykI4yb8tcOB2S+/pSsX6H8dYqU+obHit
 GGn/f5tAVvAiuV0MV6x8CDVC6zjm8X10vKBhaoKsPZMvgb8INwPuGX/vaWxKy+ghFzNK
 xTJr5Y27kHHsaGH9Kb6gD4qbjtY0EIEMPUrOwvKd1VUSr38lZ3CSZMXtDmN0G0+MPLIa
 GfQ9ngwmcSBIjG8q/umdLZc0VnUedaesbKy41QrGC39xAW9LXDhAdgfIZxauocJm7duI
 PXeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736881642; x=1737486442;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HkXEGKaHS4Wap2DZ8mnEQl68mT1GrP1ybYkz9IG2DCI=;
 b=nFhbQ3T4kGZsZfoM2OQEyyB/GVnF2f2Utdog5BlCB9N20gVPk9PQ/i7A9utcGIC01g
 A6Lh/QcFj7hJxbMe9V+GgBS/R03iPSTXI/kDh5GJFeWAV8SA4Okn8CeyuplmqOtGtAlW
 HLp3On6fqt2Tw9CUnP0u5rrEegCR2LrWdDLjD/zUawW0Y23AFB6Q4DWUxsYXnch/q79X
 eRKi4PAvc+g1FTKVgpe9a+ruDOysY6uHYlhMMTkvVtCU7Kw+Vopv0R4N0WFqEcLVW/Wr
 0dKKYdd7DUBbS7H3LpDZHL66r/9y96c8Yzt7DreA+qfTShAatC59kmauY2YANYVdKoKb
 +Clw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+ldU7NfiIEn5FFJmX3OXgPkh/WNNpfT9+51pWRZlJgkVnvujqgtPcbKVeyp4ULqODmVKhfEgEEqg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwM8V4I4wtJdPZ1BO1RfbFsz7P+A6qTC9yEcsTj/q/0AkndT+QX
 1G+z+AhBRtMg6VyRhhUbkfBmTpSFjbwOuMo2PeJG84fBZbWWfgytvtDBDs/icCCMVdFGXoMQnoS
 Kd/ymHQ==
X-Google-Smtp-Source: AGHT+IF2yRCyQfsIAsDtYjVAP2Lbj8881E3+iRCvgYZMjLJcfAwxx4hzxEoI7N0P45DSRRSxwN8MjS/wzzlZ
X-Received: from ilbds6.prod.google.com ([2002:a05:6e02:3f86:b0:3a7:8a40:2719])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:1d88:b0:3a7:8720:9e9e
 with SMTP id e9e14a558f8ab-3ce3a90ef12mr193274515ab.2.1736881642681; Tue, 14
 Jan 2025 11:07:22 -0800 (PST)
Date: Tue, 14 Jan 2025 19:07:11 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
Message-ID: <20250114190709.1.Ia17111747d0450169dbe902e5d7ef25912a9338e@changeid>
Subject: [PATCH] drm/i915/display: Add skip link check quirk
From: Jonathan Denose <jdenose@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: rodrigo.vivi@intel.com, jani.nikula@linux.intel.com, 
 intel-gfx@lists.freedesktop.org, Jonathan Denose <jdenose@google.com>, 
 David Airlie <airlied@gmail.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
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

The display on the Advantech UTC124G3PWWW0E-ES worked fine until commit
"drm/i915/dp: Recheck link state after modeset" was introduced. After
this commit the display flickers intermittently as the driver code
initiates the delayed link recheck in an infinite loop.

To resolve this issue for the Advantech device, add a quirk to skip over
the delayed link recheck.

Signed-off-by: Jonathan Denose <jdenose@google.com>
---

 drivers/gpu/drm/i915/display/intel_dp_link_training.c | 4 +++-
 drivers/gpu/drm/i915/display/intel_quirks.c           | 8 ++++++++
 drivers/gpu/drm/i915/display/intel_quirks.h           | 1 +
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_link_training.c b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
index 397cc4ebae526..7804ad38b00cd 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_link_training.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_link_training.c
@@ -32,6 +32,7 @@
 #include "intel_encoder.h"
 #include "intel_hotplug.h"
 #include "intel_panel.h"
+#include "intel_quirks.h"
 
 #define LT_MSG_PREFIX			"[CONNECTOR:%d:%s][ENCODER:%d:%s][%s] "
 #define LT_MSG_ARGS(_intel_dp, _dp_phy)	(_intel_dp)->attached_connector->base.base.id, \
@@ -1622,7 +1623,8 @@ void intel_dp_start_link_train(struct intel_atomic_state *state,
 		lt_dbg(intel_dp, DP_PHY_DPRX, "Forcing link training failure\n");
 	} else if (passed) {
 		intel_dp->link.seq_train_failures = 0;
-		intel_encoder_link_check_queue_work(encoder, 2000);
+		if (!intel_has_quirk(display, QUIRK_SKIP_LINK_CHECK))
+			intel_encoder_link_check_queue_work(encoder, 2000);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.c b/drivers/gpu/drm/i915/display/intel_quirks.c
index 28f497ae785bb..d472a5f21f8b9 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.c
+++ b/drivers/gpu/drm/i915/display/intel_quirks.c
@@ -78,6 +78,12 @@ static void quirk_fw_sync_len(struct intel_dp *intel_dp)
 	drm_info(display->drm, "Applying Fast Wake sync pulse count quirk\n");
 }
 
+static void quirk_skip_link_check(struct intel_display *display)
+{
+	intel_set_quirk(display, QUIRK_SKIP_LINK_CHECK);
+	drm_info(display->drm, "Applying skip link check quirk\n");
+}
+
 struct intel_quirk {
 	int device;
 	int subsystem_vendor;
@@ -229,6 +235,8 @@ static struct intel_quirk intel_quirks[] = {
 	{ 0x3184, 0x1019, 0xa94d, quirk_increase_ddi_disabled_time },
 	/* HP Notebook - 14-r206nv */
 	{ 0x0f31, 0x103c, 0x220f, quirk_invert_brightness },
+	/* Advantech UTC124G3PWWW0E-ES */
+	{0x5a85, 0x8086, 0x2212, quirk_skip_link_check},
 };
 
 static const struct intel_dpcd_quirk intel_dpcd_quirks[] = {
diff --git a/drivers/gpu/drm/i915/display/intel_quirks.h b/drivers/gpu/drm/i915/display/intel_quirks.h
index cafdebda75354..9e8f2816a4fba 100644
--- a/drivers/gpu/drm/i915/display/intel_quirks.h
+++ b/drivers/gpu/drm/i915/display/intel_quirks.h
@@ -20,6 +20,7 @@ enum intel_quirk_id {
 	QUIRK_LVDS_SSC_DISABLE,
 	QUIRK_NO_PPS_BACKLIGHT_POWER_HOOK,
 	QUIRK_FW_SYNC_LEN,
+	QUIRK_SKIP_LINK_CHECK,
 };
 
 void intel_init_quirks(struct intel_display *display);
-- 
2.48.0.rc2.279.g1de40edade-goog

