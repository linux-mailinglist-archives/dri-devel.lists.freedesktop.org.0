Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F967B2CB6
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 09:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E08DA10E6B2;
	Fri, 29 Sep 2023 07:00:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Thu, 28 Sep 2023 19:43:14 UTC
Received: from halley.uberspace.de (halley.uberspace.de [185.26.156.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB9F10E0F2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 19:43:14 +0000 (UTC)
Received: (qmail 19271 invoked by uid 498); 28 Sep 2023 19:36:31 -0000
Authentication-Results: halley.uberspace.de;
	auth=pass (plain)
From: Kai Uwe Broulik <foss-linux@broulik.de>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm: panel-orientation-quirks: Add quirk for One Mix 2S
Date: Thu, 28 Sep 2023 21:35:58 +0200
Message-Id: <20230928193558.2228730-1-foss-linux@broulik.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Bar: -
X-Rspamd-Report: MID_CONTAINS_FROM(1) BAYES_HAM(-2.997336) MIME_GOOD(-0.1)
 R_MISSING_CHARSET(0.5)
X-Rspamd-Score: -1.597336
Received: from unknown (HELO unkown) (::1)
 by halley.uberspace.de (Haraka/3.0.1) with ESMTPSA;
 Thu, 28 Sep 2023 21:36:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broulik.de; s=uberspace;
 h=from; bh=hsyA3JeFc7lPYPSEDFueqHSjDgW9MvWF8HHghEmTgwY=;
 b=YY+Atr5cQU0D0nCZy74zNiP4cY7hLbxi3znuwerob6Ilvga459CiWmI6pkwbRhxL0WHWjg3lPq
 3GMhlr+RPF/GpuOEiQqh/tWNUOe17FrS85YZm/Ql4iF9L2BRH7+7SN1cemX4P5R53N1Vl2UnUe0M
 CZyStMMAgdthR/SBkzoZJhkoIumf36xK8rM9dZRihACQZqeeGyAZQjtfirUshOH1a8J8skWQH/xF
 TLmD8GXDPGhvFjW9rU58Xpt2lvxvyzMiayqxlA76/gdQ6yk2EgFy1/xOO7lG96v/HqpCxCJWypID
 yeB6Vb71fhXAMFKfn8Z/iiyFVxfC8Jd9wpUtGzyFIBpgpFO6JUDGvRGGxZZlVB11IzI6fe/iF4pZ
 zbduXR0SoKP8N6qd6mJ9WKjfthiyjmZiuJaF8lm5adycN4YG6dZrk2DXvuGm2WwOCXnbsc2zElJB
 sN99dPkeoP9Ae4lWtlDItDO8hSxHPYycLb3hmxsZio/3zSme2bdyvTTbeZk/bd4FoCNF4s+HCttg
 5o31NyMngCpXvpyYcrE8S5FVhmjMiaBQ5565IHw8y1GfRRoB42D5Sn+WSSj9RS+N8b54NmaEcylb
 GFkFvOpqUlu5+ac3GdZhgkNprTmEWwotWQtU+NewpMvFu+nGXswSoFxVx0COvrmP1JLPayLVvVl0
 o=
X-Mailman-Approved-At: Fri, 29 Sep 2023 07:00:19 +0000
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
Cc: Kai Uwe Broulik <foss-linux@broulik.de>, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The One Mix 2S is a mini laptop with a 1200x1920 portrait screen
mounted in a landscape oriented clamshell case. Because of the too
generic DMI strings this entry is also doing bios-date matching.

Signed-off-by: Kai Uwe Broulik <foss-linux@broulik.de>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 0cb646cb04ee..cc9a9099faaf 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -38,6 +38,14 @@ static const struct drm_dmi_panel_orientation_data gpd_micropc = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data gpd_onemix2s = {
+	.width = 1200,
+	.height = 1920,
+	.bios_dates = (const char * const []){ "03/04/2019",
+		NULL },
+	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
+};
+
 static const struct drm_dmi_panel_orientation_data gpd_pocket = {
 	.width = 1200,
 	.height = 1920,
@@ -401,6 +409,14 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LTH17"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* One Mix 2S (generic strings, also match on bios date) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Default string"),
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Default string"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "Default string"),
+		},
+		.driver_data = (void *)&gpd_onemix2s,
 	},
 	{}
 };
-- 
2.34.1

