Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1811A60B06
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 09:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 341E810E995;
	Fri, 14 Mar 2025 08:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=endrift.com header.i=@endrift.com header.b="CUAAy+R4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 454 seconds by postgrey-1.36 at gabe;
 Thu, 13 Mar 2025 21:26:12 UTC
Received: from endrift.com (endrift.com [173.255.198.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A635D10E946
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 21:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=endrift.com; s=2020;
 t=1741900707; bh=uibYB/QwSfQRH5yxgto9T2CHBM18J1htnN1ERA4ig3I=;
 h=From:To:Cc:Subject:Date:From;
 b=CUAAy+R4S1/avrcQ1ADPAApmX4Fn5aOGel8qdfzCvwpT4rcXdXga2AXgrhYDNbSM+
 kzBd+CsX/J2B/wkDeAiZ3857P5uvJvOmC30kaujlvJCp4/gBkm4lpGeLZBAE+TG3gJ
 QePz7RAD7kJ2e2SNyKAl7cvRFmxm8C0NKVWCZny7Aoa/hgUPdsA/xgD6puz2vaxjky
 d15/AV4BuaaSnxFPRqivUB8ZQ3BeqO+BFxfPEG5XzM5xG3ErfLICy7fCWKWXhYfiBn
 HloJKbaN8YgpinvEtcFC14CPR8+yhjR/LOWN1Ns1js4fZHBeS+jrED9f4iIDblmaty
 nz0TsjJ3fWSeQ==
Received: from nebulosa.vulpes.eutheria.net (71-212-74-234.tukw.qwest.net
 [71.212.74.234]) by endrift.com (Postfix) with ESMTPSA id B501CA03F;
 Thu, 13 Mar 2025 14:18:26 -0700 (PDT)
From: Vicki Pfau <vi@endrift.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Cc: Vicki Pfau <vi@endrift.com>
Subject: [PATCH] drm: panel-orientation-quirks: Add ZOTAC Gaming Zone
Date: Thu, 13 Mar 2025 14:16:44 -0700
Message-ID: <20250313211643.860786-2-vi@endrift.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Mar 2025 08:16:01 +0000
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

Add a panel orientation quirk for the ZOTAC Gaming Zone handheld gaming device.

Signed-off-by: Vicki Pfau <vi@endrift.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index c554ad8f246b..7ac0fd5391fe 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -517,6 +517,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "LTH17"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* ZOTAC Gaming Zone */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ZOTAC"),
+		  DMI_EXACT_MATCH(DMI_BOARD_NAME, "G0A1W"),
+		},
+		.driver_data = (void *)&lcd1080x1920_leftside_up,
 	}, {	/* One Mix 2S (generic strings, also match on bios date) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
-- 
2.48.1

