Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C382C2CF6DF
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 23:36:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCE46EC90;
	Fri,  4 Dec 2020 22:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBC5F6EC91
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Dec 2020 22:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607121407;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xcFLkX7UczG6eVRjKRtUueZRmoy5vwk1nTh91JJF5jA=;
 b=GzujIDapVWvt98tajxMgiQe6WCVb+pqyYJKoG9HmtmL+1pdK2iZSkxSNEqhC9NWKAF8Leb
 YhNi9zdngNUl9MtwHylEAY1YpLoPfTcuPwiGPXAv+S9nMvXsE77gO+f4gUrUrLuJnU/cv5
 IT6DOtYyRU3N5FPlJsTf8HGxfcvheQE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-nivlIjgNP2eX2FBU2psMPA-1; Fri, 04 Dec 2020 17:36:44 -0500
X-MC-Unique: nivlIjgNP2eX2FBU2psMPA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55EDA1005513;
 Fri,  4 Dec 2020 22:36:41 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-112-159.rdu2.redhat.com
 [10.10.112.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 025C61962F;
 Fri,  4 Dec 2020 22:36:39 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Dave Airlie <airlied@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/9] drm/i915/dp: Add register definitions for Intel HDR
 backlight interface
Date: Fri,  4 Dec 2020 17:36:00 -0500
Message-Id: <20201204223603.249878-7-lyude@redhat.com>
In-Reply-To: <20201204223603.249878-1-lyude@redhat.com>
References: <20201204223603.249878-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: thaytan@noraisin.net, Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 David Airlie <airlied@linux.ie>, open list <linux-kernel@vger.kernel.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No functional changes yet, this just adds definitions for all of the
known DPCD registers used by Intel's HDR backlight interface. Since
we'll only ever use this in i915, we just define them in
intel_dp_aux_backlight.c

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: thaytan@noraisin.net
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
---
 .../drm/i915/display/intel_dp_aux_backlight.c | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index b102692a659d..9775f33d1aac 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -25,6 +25,59 @@
 #include "intel_display_types.h"
 #include "intel_dp_aux_backlight.h"
 
+/*
+ * DP AUX registers for Intel's proprietary HDR backlight interface. We define
+ * them here since we'll likely be the only driver to ever use these.
+ */
+#define INTEL_EDP_HDR_TCON_CAP0                                        0x340
+
+#define INTEL_EDP_HDR_TCON_CAP1                                        0x341
+# define INTEL_EDP_HDR_TCON_2084_DECODE_CAP                           BIT(0)
+# define INTEL_EDP_HDR_TCON_2020_GAMUT_CAP                            BIT(1)
+# define INTEL_EDP_HDR_TCON_TONE_MAPPING_CAP                          BIT(2)
+# define INTEL_EDP_HDR_TCON_SEGMENTED_BACKLIGHT_CAP                   BIT(3)
+# define INTEL_EDP_HDR_TCON_BRIGHTNESS_NITS_CAP                       BIT(4)
+# define INTEL_EDP_HDR_TCON_OPTIMIZATION_CAP                          BIT(5)
+# define INTEL_EDP_HDR_TCON_SDP_COLORIMETRY_CAP                       BIT(6)
+# define INTEL_EDP_HDR_TCON_SRGB_TO_PANEL_GAMUT_CONVERSION_CAP        BIT(7)
+
+#define INTEL_EDP_HDR_TCON_CAP2                                        0x342
+# define INTEL_EDP_SDR_TCON_BRIGHTNESS_AUX_CAP                        BIT(0)
+
+#define INTEL_EDP_HDR_TCON_CAP3                                        0x343
+
+#define INTEL_EDP_HDR_GETSET_CTRL_PARAMS                               0x344
+# define INTEL_EDP_HDR_TCON_2084_DECODE_ENABLE                        BIT(0)
+# define INTEL_EDP_HDR_TCON_2020_GAMUT_ENABLE                         BIT(1)
+# define INTEL_EDP_HDR_TCON_TONE_MAPPING_ENABLE                       BIT(2) /* Pre-TGL+ */
+# define INTEL_EDP_HDR_TCON_SEGMENTED_BACKLIGHT_ENABLE                BIT(3)
+# define INTEL_EDP_HDR_TCON_BRIGHTNESS_AUX_ENABLE                     BIT(4)
+# define INTEL_EDP_HDR_TCON_SRGB_TO_PANEL_GAMUT_ENABLE                BIT(5)
+/* Bit 6 is reserved */
+# define INTEL_EDP_HDR_TCON_SDP_COLORIMETRY_ENABLE                    BIT(7)
+
+#define INTEL_EDP_HDR_CONTENT_LUMINANCE                                0x346 /* Pre-TGL+ */
+#define INTEL_EDP_HDR_PANEL_LUMINANCE_OVERRIDE                         0x34A
+#define INTEL_EDP_SDR_LUMINANCE_LEVEL                                  0x352
+#define INTEL_EDP_BRIGHTNESS_NITS_LSB                                  0x354
+#define INTEL_EDP_BRIGHTNESS_NITS_MSB                                  0x355
+#define INTEL_EDP_BRIGHTNESS_DELAY_FRAMES                              0x356
+#define INTEL_EDP_BRIGHTNESS_PER_FRAME_STEPS                           0x357
+
+#define INTEL_EDP_BRIGHTNESS_OPTIMIZATION_0                            0x358
+# define INTEL_EDP_TCON_USAGE_MASK                             GENMASK(0, 3)
+# define INTEL_EDP_TCON_USAGE_UNKNOWN                                    0x0
+# define INTEL_EDP_TCON_USAGE_DESKTOP                                    0x1
+# define INTEL_EDP_TCON_USAGE_FULL_SCREEN_MEDIA                          0x2
+# define INTEL_EDP_TCON_USAGE_FULL_SCREEN_GAMING                         0x3
+# define INTEL_EDP_TCON_POWER_MASK                                    BIT(4)
+# define INTEL_EDP_TCON_POWER_DC                                    (0 << 4)
+# define INTEL_EDP_TCON_POWER_AC                                    (1 << 4)
+# define INTEL_EDP_TCON_OPTIMIZATION_STRENGTH_MASK             GENMASK(5, 7)
+
+#define INTEL_EDP_BRIGHTNESS_OPTIMIZATION_1                            0x359
+
+/* VESA backlight callbacks */
 static void set_vesa_backlight_enable(struct intel_dp *intel_dp, bool enable)
 {
 	struct drm_i915_private *i915 = dp_to_i915(intel_dp);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
