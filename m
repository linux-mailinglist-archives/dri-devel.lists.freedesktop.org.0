Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFF144A080
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 02:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B58B89DAB;
	Tue,  9 Nov 2021 01:01:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F80789D44
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 01:01:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CA3676162E;
 Tue,  9 Nov 2021 01:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636419691;
 bh=x8J2gIrW8uI3T2QvaNjVhOCRiVSsbbBRWDZBYz0GvM4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cChcyQWvbFmqoK+4dXZzIk82UC/8k02j0mRRZHWlSD/El8W8FfnQNdqddlJWiqSrN
 YtyG276Tdduyvzoq1KQ3mDsHV7uLJm/vI3miVKm+cI8+KPlu0z/clsYHuog4SngrpI
 x2CrmUMUxIPNzsFGv1Xwx7lSW0T4XZfvDXAiS1czfhVEUx9abjwU+7h8X6J1RfI7Tb
 Haw8CVOQeFw8sJzfBVkmmtypk27GwrhqtQ1gLRKh4eR48XK10bziGk/70abbXckinF
 unU8qZU2OXwuuSQ27juIYTqQgtD3Kstn/o+YeLhkiB/7qEkjHmTJ1BFlU0iSa+Xc9c
 pfb12u8nnG40Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.14 002/138] drm: panel-orientation-quirks: Update
 the Lenovo Ideapad D330 quirk (v2)
Date: Mon,  8 Nov 2021 12:44:28 -0500
Message-Id: <20211108174644.1187889-2-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211108174644.1187889-1-sashal@kernel.org>
References: <20211108174644.1187889-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, airlied@linux.ie,
 Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hans de Goede <hdegoede@redhat.com>

[ Upstream commit 820a2ab23d5eab4ccfb82581eda8ad4acf18458f ]

2 improvements to the Lenovo Ideapad D330 panel-orientation quirks:

1. Some versions of the Lenovo Ideapad D330 have a DMI_PRODUCT_NAME of
"81H3" and others have "81MD". Testing has shown that the "81MD" also has
a 90 degree mounted panel. Drop the DMI_PRODUCT_NAME from the existing
quirk so that the existing quirk matches both variants.

2. Some of the Lenovo Ideapad D330 models have a HD (800x1280) screen
instead of a FHD (1200x1920) screen (both are mounted right-side-up) add
a second Lenovo Ideapad D330 quirk for the HD version.

Changes in v2:
- Add a new quirk for Lenovo Ideapad D330 models with a HD screen instead
  of a FHD screen

Link: https://github.com/systemd/systemd/pull/18884
Acked-by: Simon Ser <contact@emersion.fr>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20210530110428.12994-2-hdegoede@redhat.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index f6bdec7fa9253..604535b1c3a95 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -211,10 +211,15 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo MIIX 320-10ICR"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
-	}, {	/* Lenovo Ideapad D330 */
+	}, {	/* Lenovo Ideapad D330-10IGM (HD) */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* Lenovo Ideapad D330-10IGM (FHD) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "81H3"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Lenovo ideapad D330-10IGM"),
 		},
 		.driver_data = (void *)&lcd1200x1920_rightside_up,
-- 
2.33.0

