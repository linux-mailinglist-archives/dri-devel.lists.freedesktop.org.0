Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FD5589239
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 20:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E55018A91C;
	Wed,  3 Aug 2022 18:24:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB84611A786
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 18:24:23 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m22so15781267lfl.9
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Aug 2022 11:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=FVLEwCo6wxH6UqQ/rgVg/jkY1RdcrYbsKsmzA+SVqRM=;
 b=LU1swnTijzeZZHDu0s9wSa9WU5gb5v2Gito5N8j4LrA1Lw+WiFszXSofRJVsyE051X
 FpxVAyVV6DgsUD/iHB03RL2Hqw6XA5ZFm9bd4kxt/c7/J6f/2awu1WIDydmr7kEsD8Fy
 /V/BRMK0ime3RJhroiEaGVlCjEMrmhMQJGzz3Lvc7oDf8pVG804AtiHy47qOrqT/GS71
 EW38btSgTAsIMt2lqiUdCZKB1aQ716nYBRko3UsnwgoP+dh/UOkF31RQ74cZdypOvbBf
 GA9TqqO0DEAPxsKcsloFtdV7pffPsWcFOPQdmX9MSzyULZ7c6TCH0UtA5Q7myhY305sL
 r9uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=FVLEwCo6wxH6UqQ/rgVg/jkY1RdcrYbsKsmzA+SVqRM=;
 b=UAr1yy+WGX8+15EA9GApvullCaYd/OCBai3z1PCvRwcLMnELEmg1Agv+fvzWyWnnvs
 LL8D0pUFIHt6p1oOcyTLBnU+Xak6kklZNL348jxbev6sWx4Vkc+nnyg/GYJrVKDBj0/K
 KXouSBofBuHHP6K54rTxkiUHvu2Kdt5O8OtN4Dfp6XAjAu7mzQImjhY6KFlNckK53gnx
 hXWqpwBrFkSydAyc10zo2gbsE4Ka9yEw4iXEUgC1NJTFIvSWA5G2kPzjVKXqJdUOU9WI
 8LVyCZwbBLd1yWVsIkdJ59404Wbhb/W+qt8QuKvE5++4ov73yucW5rVoCajBj9ZMbpZL
 /thQ==
X-Gm-Message-State: ACgBeo30WwSF6CQ4KSSYz2D+UqrdCgP34zByabKDxdhDswgXEzWBIdE1
 Yc7RndDtInqqKRrik+EVqF4=
X-Google-Smtp-Source: AA6agR6sr8zJyhjOEd9u8ffumf8oYnOnI2d0WKHOSZv6kXvRl24BTaFUgSjQk+9avxwkktN42YcSmg==
X-Received: by 2002:a05:6512:70b:b0:48b:1d93:d31a with SMTP id
 b11-20020a056512070b00b0048b1d93d31amr1535068lfs.522.1659551061796; 
 Wed, 03 Aug 2022 11:24:21 -0700 (PDT)
Received: from localhost.localdomain (83.24.233.119.ipv4.supernova.orange.pl.
 [83.24.233.119]) by smtp.gmail.com with ESMTPSA id
 s3-20020a056512202300b0048af79884fesm1290967lfs.101.2022.08.03.11.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 11:24:21 -0700 (PDT)
From: Maccraft123 <maccraft123mc@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm: panel-orientation-quirks: Add quirk for Anbernic Win600
Date: Wed,  3 Aug 2022 20:24:03 +0200
Message-Id: <20220803182402.1217293-1-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.37.1
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
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Maya Matuszczyk <maccraft123mc@gmail.com>

This device is another x86 gaming handheld, and as (hopefully) there is
only one set of DMI IDs it's using DMI_EXACT_MATCH

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index d4e0f2e85548..a8681610ede7 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -128,6 +128,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "One S1003"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* Anbernic Win600 */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Anbernic"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Win600"),
+		},
+		.driver_data = (void *)&lcd720x1280_rightside_up,
 	}, {	/* Asus T100HA */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-- 
2.37.1

