Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD66223A0E8
	for <lists+dri-devel@lfdr.de>; Mon,  3 Aug 2020 10:21:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C9D6E221;
	Mon,  3 Aug 2020 08:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F316EB79
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Aug 2020 12:36:10 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id l4so33963675ejd.13
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Aug 2020 05:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wjPjy2HY7pSEWBbsF5PhTxNVfftwsniep4iRdpkPG3I=;
 b=FERi1RfG4sbRrrdMg9jlUB9RlTxnexns/ZyVhxLgnmflq6vy8bsRFhSMRf6cJDcPpm
 wszsxVPA6w/Huvu6GbWdDFt3OTEEmI07o2ZEiSgjx/5ZK9eGRbX59cwIYKpEMOEtlnef
 8wC9JOZYIVJ34dfFpUfty1Fd+lyWije4zS8MUlCWLtVsWdagI17sulxJS98E5tz2QETu
 4Z4c4Y2pK0g2Xh6orih+itjAAa/535H5IwINV15o8I+GiZbm+lNGYBnmxbPNlOV5Yxnw
 tF3sb4XtLe2XTguWmNWVzDi6mDfWv5PrH447V9AYnA8Flz7sszI50c1JCkZIojSN9+h2
 RKgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wjPjy2HY7pSEWBbsF5PhTxNVfftwsniep4iRdpkPG3I=;
 b=RsUmGfVTvozbpPicVU3uoCyPs1rhAOXTQok2ZXrI01OEc22ARA2kCgwwQXqRW6sAxL
 z3KawZzN+Ssg7ApvnN8Vy01m+MWcFXWYBsfGKOA7MPBb62qTpW43bgK0wYYo3Oh8mwO+
 0C5LMUsJa/3EpV1p9i41v/beOKbHSdKaXAohyqEv5B6N0rY34rErbF+wCm1M5KcLOxif
 PzLUZWWUSCr8RaIePDgM+F1doSmcnRpY2yo2BQL3Gq6CSa9qve98RC87Cpvq+wPM0qpe
 mUVx5FJaWrAfSrfDJskpMq0o58DIMQl262LAj7bRMQ6Kda8U+OZBhv66EEytd0tV1Sjj
 U1PA==
X-Gm-Message-State: AOAM531XLwvbaR1qiZRQvX4w4mrb8ljkZjMxhiSfPYuBJaoBWTTzD72+
 Lu9HGkPshzWIi/anZpp3PZc=
X-Google-Smtp-Source: ABdhPJwiXARSL3vCYV6Aiwz8uwNsv0i4W5QiCf/4P9cw/hnqfjpUulKhXAOQkZTf+GaxLOPn+tp78Q==
X-Received: by 2002:a17:906:e0d:: with SMTP id
 l13mr8895522eji.434.1596285369557; 
 Sat, 01 Aug 2020 05:36:09 -0700 (PDT)
Received: from localhost.localdomain ([82.77.79.116])
 by smtp.googlemail.com with ESMTPSA id v14sm11347919ejb.63.2020.08.01.05.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 05:36:09 -0700 (PDT)
From: Marius Iacob <themariusus@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Added orientation quirk for ASUS tablet model T103HAF
Date: Sat,  1 Aug 2020 15:34:46 +0300
Message-Id: <20200801123445.1514567-1-themariusus@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 03 Aug 2020 08:20:37 +0000
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
Cc: Marius Iacob <themariusus@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Marius Iacob <themariusus@gmail.com>
---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index d00ea384dcbf..58f5dc2f6dd5 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -121,6 +121,12 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T101HA"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* Asus T103HAF */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T103HAF"),
+		},
+		.driver_data = (void *)&lcd800x1280_rightside_up,
 	}, {	/* GPD MicroPC (generic strings, also match on bios date) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Default string"),
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
