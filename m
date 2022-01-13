Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C29E48D3A5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 09:32:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8726610EA5C;
	Thu, 13 Jan 2022 08:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1AC10E603
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 00:08:19 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id g5so6919123plo.12
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 16:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8EBDsiqdsFoIT2e8QhFpduAtN91LgcYXAbLf3F3iJzI=;
 b=NY0SY+DU2XHQGeZvTOB1YC0YOaJ7QO85McclsFVBNaKSvIJQxvyzKt7l/b6pEJyYdY
 6UtytVRpzDxpdrx7W6DfC856BHmn00VX3DiqDY+p/74mrzeySbbcUThCmzwwxZAooDiy
 6wuQ65Seib07MoIP1Uhnic/sBNh4tlARBfhWKbC/NqPG+nHQr07nZAJZy9t7iyeG2X7U
 RU9lYMyE6FucMvjVe2bkymwt8JuKLjImNy/aXrkMK5ruIj0VbGUabcb51aokCEbiQ+7+
 YLctWvcz2aRz/2MeRHHNdewW00bafd6QQ2ZsiueWrGAuaHZX/ZR1E+M6tMeysbrun4wW
 uP/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8EBDsiqdsFoIT2e8QhFpduAtN91LgcYXAbLf3F3iJzI=;
 b=2fj+E6clOMtef2s06q95AVoq66FqzXTDHv8nm6Qri1bjbpScS6Wto2VVGpiMiQSjO/
 PopGm7cdKAPRFoYzxLlGxFFmjDiE2jqWdW6njEL/yBWwGDWFzc1dNAoZZllMu2UWyGiu
 jg++qWvDGus4UvAUxVopCxga6ME4K6KFbCfUw48kNOjYIyVdJesJB/ubpJ5rD5WVgA1P
 tc55QwsrVEQ2AQVEnklRs6FzAQvG/9zSGrmBGpBZCcFvheN5nUbwpTqUMyOdyC83TWrD
 UuNDUqUVSV0ksWD4aTIkYLSUjVkiwaSVqhwoEPpYWHJO10LBkrFfQXD8c1mB51HkfzyR
 AhEA==
X-Gm-Message-State: AOAM533CNqPuWPXU7Cc46Sx/qfxFThV3DHm4aAlbz89RW95n98TKSxnJ
 hUd62N5GJ6yPXQIe+WN34FzOI22shR+h3pyb
X-Google-Smtp-Source: ABdhPJzA/NIBBhxRbcpuwbMBYX3cBJL1mSbMrgdnLioKZNp+/niWBa423dyqGsNxQQKLI3LzA0He3Q==
X-Received: by 2002:a63:7d08:: with SMTP id y8mr1844300pgc.143.1642032499217; 
 Wed, 12 Jan 2022 16:08:19 -0800 (PST)
Received: from raven-lpc.lan ([130.105.10.199])
 by smtp.googlemail.com with ESMTPSA id y23sm699272pfa.80.2022.01.12.16.08.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 16:08:18 -0800 (PST)
From: Raymond Jay Golo <rjgolo@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RESEND] drm: panel-orientation-quirks: Add quirk for the 1Netbook
 OneXPlayer
Date: Thu, 13 Jan 2022 08:06:20 +0800
Message-Id: <20220113000619.90988-1-rjgolo@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 13 Jan 2022 08:32:04 +0000
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 rjgolo@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The 1Netbook OneXPlayer uses a panel which has been mounted
90 degrees rotated. Add a quirk for this.

Signed-off-by: Raymond Jay Golo <rjgolo@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 042bb80383c9..b910978d3e48 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -115,6 +115,12 @@ static const struct drm_dmi_panel_orientation_data lcd1280x1920_rightside_up = {
 	.orientation = DRM_MODE_PANEL_ORIENTATION_RIGHT_UP,
 };
 
+static const struct drm_dmi_panel_orientation_data lcd1600x2560_leftside_up = {
+	.width = 1600,
+	.height = 2560,
+	.orientation = DRM_MODE_PANEL_ORIENTATION_LEFT_UP,
+};
+
 static const struct dmi_system_id orientation_data[] = {
 	{	/* Acer One 10 (S1003) */
 		.matches = {
@@ -275,6 +281,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Default string"),
 		},
 		.driver_data = (void *)&onegx1_pro,
+	}, {	/* OneXPlayer */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ONE-NETBOOK TECHNOLOGY CO., LTD."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ONE XPLAYER"),
+		},
+		.driver_data = (void *)&lcd1600x2560_leftside_up,
 	}, {	/* Samsung GalaxyBook 10.6 */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "SAMSUNG ELECTRONICS CO., LTD."),
-- 
2.34.1

