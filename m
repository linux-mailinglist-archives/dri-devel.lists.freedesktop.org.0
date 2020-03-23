Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E55E18F119
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 09:45:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9A289EA9;
	Mon, 23 Mar 2020 08:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF87089F31
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 05:35:42 +0000 (UTC)
Received: from 61-220-137-37.hinet-ip.hinet.net ([61.220.137.37]
 helo=localhost) by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>)
 id 1jGFkN-00063j-9D; Mon, 23 Mar 2020 05:35:35 +0000
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch
Subject: [PATCH] drm/i915: Force DPCD backlight mode for HP Spectre x360
 Convertible 13t-aw100
Date: Mon, 23 Mar 2020 13:35:28 +0800
Message-Id: <20200323053528.3147-1-kai.heng.feng@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 23 Mar 2020 08:45:09 +0000
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
Cc: Kai-Heng Feng <kai.heng.feng@canonical.com>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 open list <linux-kernel@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's another OLED panel needs to use DPCD aux interface to control
backlight.

BugLink: https://bugs.launchpad.net/bugs/1860303
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
---
 drivers/gpu/drm/drm_dp_helper.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_dp_helper.c b/drivers/gpu/drm/drm_dp_helper.c
index 8ba4531e808d..a0d4314663de 100644
--- a/drivers/gpu/drm/drm_dp_helper.c
+++ b/drivers/gpu/drm/drm_dp_helper.c
@@ -1301,6 +1301,8 @@ static const struct edid_quirk edid_quirk_list[] = {
 	 * only supports DPCD backlight controls
 	 */
 	{ MFG(0x4c, 0x83), PROD_ID(0x41, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
+	/* HP Spectre x360 Convertible 13t-aw100 */
+	{ MFG(0x4c, 0x83), PROD_ID(0x42, 0x41), BIT(DP_QUIRK_FORCE_DPCD_BACKLIGHT) },
 	/*
 	 * Some Dell CML 2020 systems have panels support both AUX and PWM
 	 * backlight control, and some only support AUX backlight control. All
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
