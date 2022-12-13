Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C5064BAA9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 18:12:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D12F910E32F;
	Tue, 13 Dec 2022 17:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D600810E32F
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 17:11:37 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id d10so587358ilc.12
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Dec 2022 09:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jzPRmPJd5jX18eH45PIAN8StaeBDhiKrmupibyDWdg8=;
 b=FcHqQZiQueKJ651RYxOjnxiNoPcwp76wuWOgFrCSmWSBDLfAvtqqjxjqU1EEPe9eEc
 XlrVgbFDhlVhxOxc6xya0KapeOs5Jk6fRw7iNKkD+8uoop7CqZ0AU++wuC8fE5ap/pwk
 LRMrEcspEEvcopA+/mDOujTzVtkEXotR4+SsRdUcJ08HTbaS2pjkjaHyNbY+VS1pRQgJ
 b5IXRVZIkYuNmWXb/FvLyICQ3SJmtnTYkYIsTnjY2t4wyENdzHzkljl6dE5iG1lt6Hl7
 eDlFhgsfWfCgST9oAJ8/Rqd7VOPIhaS7cgn5BUKejl6kEB6wZYXYpSVVNcOfFJjSoeyO
 FB+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jzPRmPJd5jX18eH45PIAN8StaeBDhiKrmupibyDWdg8=;
 b=VFFk0VQetelnXjQVj4vWlTnkGY0zgo5xfNIRPvSgrHRvBo1y+wb48pUYw7GDndJbOI
 GEz8JLCDVZbo8C0IvMfCK8qiewCc2g/vX4jSBprS8ahX9AJ1rI1lwRMUYGUTbc6SxhkG
 bvg0S+Vyku3e8q5AxA34d21gBXsR/67MNiZ8TY7un1bBFoA9YAM2ykgw96Z+ilmWdN09
 btMY6+NMz6p6NN6zhM3dgFztrOovVBlkf7QdSEM6dwfmHRmUh2L4XNT6uyZ3t9Ne0+IT
 GgzEfncucXB8V1ESKyAcrCebGb5iBMJMvM9Hr18X+DQ1vmSARD2XbRgsckIsXsWZESG4
 hTsQ==
X-Gm-Message-State: ANoB5pnt8y1daw3TXnB57Q1cKSqU+gQQv5s3gCXsV8k6uqX4DA1q+1if
 IfpHEfChTjjOE6BlXzZycNc=
X-Google-Smtp-Source: AA0mqf6x6l3ZDqo2+/4Ek7BNKuSl0keRsInOG2BuToRH9bhyxM43ZOygbLSbX1xxvPZ2/Oa/APLyag==
X-Received: by 2002:a92:c5cf:0:b0:304:bf1f:d72f with SMTP id
 s15-20020a92c5cf000000b00304bf1fd72fmr3730788ilt.32.1670951497030; 
 Tue, 13 Dec 2022 09:11:37 -0800 (PST)
Received: from pop-os.. ([173.23.87.62]) by smtp.gmail.com with ESMTPSA id
 q4-20020a056e02078400b003029afc3672sm3915512ils.36.2022.12.13.09.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 09:11:36 -0800 (PST)
From: Matthew Anderson <ruinairas1992@gmail.com>
To: maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm: panel-orientation-quirks: Add quirks for One XPlayer
 handheld variants
Date: Tue, 13 Dec 2022 11:10:44 -0600
Message-Id: <20221213171044.14869-1-ruinairas1992@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, Matthew Anderson <ruinairas1992@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We have more handhelds in the One XPLAYER lineup now that needs support added to the orientation-quirks.
By adding more native resolution checks and the one unique BIOS variant available we add support to most devices.

Signed-off-by: Matthew Anderson <ruinairas1992@gmail.com>
---
 .../gpu/drm/drm_panel_orientation_quirks.c    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 52d8800a8ab8..335d636e6696 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -103,6 +103,12 @@ static const struct drm_dmi_panel_orientation_data lcd800x1280_rightside_up = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data lcd800x1280_leftside_up = {
+	.width = 800,
+	.height = 1280,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
 static const struct drm_dmi_panel_orientation_data lcd1080x1920_leftside_up = {
 	.width = 1080,
 	.height = 1920,
@@ -115,6 +121,12 @@ static const struct drm_dmi_panel_orientation_data lcd1200x1920_rightside_up = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data lcd1200x1920_leftside_up = {
+	.width = 1200,
+	.height = 1920,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
 static const struct drm_dmi_panel_orientation_data lcd1280x1920_rightside_up = {
 	.width = 1280,
 	.height = 1920,
@@ -344,6 +356,24 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
 		},
 		.driver_data = (void *)&lcd1600x2560_leftside_up,
+	}, {	/* OneXPlayer Mini 800p */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY CO., LTD."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
+		},
+		.driver_data = (void *)&lcd800x1280_leftside_up,
+	}, {	/* OneXPlayer Mini 1200p */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY CO., LTD."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
+		},
+		.driver_data = (void *)&lcd1200x1920_leftside_up,
+	}, {	/* OneXPlayer Mini A07 Bios Variant */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONEXPLAYER mini A07"),
+		},
+		.driver_data = (void *)&lcd800x1280_leftside_up,
 	}, {	/* Samsung GalaxyBook 10.6 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
-- 
2.34.1

