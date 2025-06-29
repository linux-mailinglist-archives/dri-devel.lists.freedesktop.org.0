Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 739FFAED62B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 09:53:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72FE10E207;
	Mon, 30 Jun 2025 07:53:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LssLfevE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAFA10E063
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 23:35:24 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-234d3261631so27267405ad.1
 for <dri-devel@lists.freedesktop.org>; Sun, 29 Jun 2025 16:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751240124; x=1751844924; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pXPOk3nqEUuFIqBZ1Us9rXYq5TplB4NjRHfPRWTgB30=;
 b=LssLfevEvA+YhMfsYaY24kUQmmBy5VZBXG9tVXQW+M+isAr/MIpmn4wP3Gij4urPVw
 pNVe1Rc5l0WJKfuxNxAaepJrQv89NztP3V+CdL0pARcOYAGGU8fPyyNJzMmqbzodv9Da
 oIMisHCVHdwdEeO8g2GyIKDmfSqOpRquqyIWNuKueE5YMNgZ/LnrEXungYR32CjT/5AN
 apkRA80Z6ItEbCCwJCzRz38Q8OJync06NJR7bknkYYonSTge1og/8mHCidZE2DtuNO+d
 k4Hb7c7R8vkDBnU5t+79tdVofnxEDmQchcoUyNUAF1CYksL4ccci/XCnkw+gv/JA+C5B
 3YgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751240124; x=1751844924;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pXPOk3nqEUuFIqBZ1Us9rXYq5TplB4NjRHfPRWTgB30=;
 b=KnRuRGoQ4iqn8ANiNd9phRvDoea9idbVjeGxZiH5lbOnzfLWyT3g46v6mip6h9YKx6
 GVcUn57HtXRlFYqbaq2OFWYi5Lr7f8lIIY7sQhWOnMPCghXurDREFKTooJ8RkEjPUH7z
 3eg+GLV6V4cee6SvUH5zVYCdhzNwe2OJX+C6vL+p4yGzDkmxFBHWGYrW7iFR2e9y7qc3
 j4ULhTmERXQ+qJksMoKwfwebQszJixWm9PDZaJxVfPg+m3P6olC6q1yn9ysJ93IbgUw9
 CEFRY8tIWWPLrPW8wLDmxRtENw0s62EbJZAZH4v448JkjGgKtvqpJHSvmr0B+Yk77wI3
 Xe/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdsXrQ4qh9FXlJPGf+GHly469UbvfpNHfqSmN5xHbPDu0ozAgOg7nXaNqEy3jhLUfGvNmYC2GbeCo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgccRAaHNySrPkNoOi59V398VHGEeK9FaZ3zuJY0hH8RiSncza
 dNiSX6ZsNPQR6yvLTRESHnyf3ZWs6/onW4H2ZfwW+GrG9FzS5LLPUQlh
X-Gm-Gg: ASbGncsrdbxZmY/Zc0zNvI23E0HyyQSvxVNaBu/t7Jmpp9r5f+RUh8EQFk8kobqGiYA
 fjeWiTlGGQQiYoZqztV4vRe0c0wPJVb01Fj9vIIcbYsniSuZbcJ8DRfnoSV0O8ZWiTsB0WaI1sz
 8mhY8ZLMPy5hXciPyuxd7sr5TZwHaMFOxzwk+pXToai3tgFr0xV1opwo3qXJw5feCAsyXK/AUeP
 aDp6kWwpXfNUx2dODdxlW3WWXdrF8o76vqlQjqE5WgRp/BpirukRUT8nYw8vfixzWcFbfefgTg9
 YS0fcADFjGzBkm2qZbTH/U9+Esp3zePQjjOmUQYJawBWNUd2
X-Google-Smtp-Source: AGHT+IFO5QoN4K5K/v4sh7hmW17whurpIN5P0eVHuHATG4/IgZWs2ApHRywY+DGQ0YFm+ysET+U3Qw==
X-Received: by 2002:a17:902:ccc9:b0:234:909b:3da9 with SMTP id
 d9443c01a7336-23ac4680f11mr161686875ad.27.1751240124361; 
 Sun, 29 Jun 2025 16:35:24 -0700 (PDT)
Received: from fedora ([2804:14c:64:af90::1001])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c9695sm69433775ad.238.2025.06.29.16.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jun 2025 16:35:23 -0700 (PDT)
From: Marcelo Moreira <marcelomoreira1905@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org, ~lkcamp/patches@lists.sr.ht
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: it6505: replace scnprintf with sysfs_emit_at in
 debugfs show
Date: Sun, 29 Jun 2025 20:35:09 -0300
Message-ID: <20250629233509.291786-1-marcelomoreira1905@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 30 Jun 2025 07:53:06 +0000
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

Update the receive_timing_debugfs_show() function to utilize
sysfs_emit_at() for formatting output to the debugfs buffer.
This change adheres to the recommendation outlined
in Documentation/filesystems/sysfs.rst.

This modification aligns with current sysfs guidelines.

Signed-off-by: Marcelo Moreira <marcelomoreira1905@gmail.com>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 46 ++++++++++++++---------------
 1 file changed, 22 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 1383d1e21afe..98bea08a14e4 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3427,37 +3427,35 @@ static ssize_t receive_timing_debugfs_show(struct file *file, char __user *buf,
 	struct it6505 *it6505 = file->private_data;
 	struct drm_display_mode *vid;
 	u8 read_buf[READ_BUFFER_SIZE];
-	u8 *str = read_buf, *end = read_buf + READ_BUFFER_SIZE;
-	ssize_t ret, count;
+	ssize_t ret;
+	ssize_t count = 0;
 
 	if (!it6505)
 		return -ENODEV;
 
 	it6505_calc_video_info(it6505);
 	vid = &it6505->video_info;
-	str += scnprintf(str, end - str, "---video timing---\n");
-	str += scnprintf(str, end - str, "PCLK:%d.%03dMHz\n",
-			 vid->clock / 1000, vid->clock % 1000);
-	str += scnprintf(str, end - str, "HTotal:%d\n", vid->htotal);
-	str += scnprintf(str, end - str, "HActive:%d\n", vid->hdisplay);
-	str += scnprintf(str, end - str, "HFrontPorch:%d\n",
-			 vid->hsync_start - vid->hdisplay);
-	str += scnprintf(str, end - str, "HSyncWidth:%d\n",
-			 vid->hsync_end - vid->hsync_start);
-	str += scnprintf(str, end - str, "HBackPorch:%d\n",
-			 vid->htotal - vid->hsync_end);
-	str += scnprintf(str, end - str, "VTotal:%d\n", vid->vtotal);
-	str += scnprintf(str, end - str, "VActive:%d\n", vid->vdisplay);
-	str += scnprintf(str, end - str, "VFrontPorch:%d\n",
-			 vid->vsync_start - vid->vdisplay);
-	str += scnprintf(str, end - str, "VSyncWidth:%d\n",
-			 vid->vsync_end - vid->vsync_start);
-	str += scnprintf(str, end - str, "VBackPorch:%d\n",
-			 vid->vtotal - vid->vsync_end);
-
-	count = str - read_buf;
+	count += sysfs_emit_at(read_buf, count, "---video timing---\n");
+	count += sysfs_emit_at(read_buf, count, "PCLK:%d.%03dMHz\n",
+			vid->clock / 1000, vid->clock % 1000);
+	count += sysfs_emit_at(read_buf, count, "HTotal:%d\n", vid->htotal);
+	count += sysfs_emit_at(read_buf, count, "HActive:%d\n", vid->hdisplay);
+	count += sysfs_emit_at(read_buf, count, "HFrontPorch:%d\n",
+			vid->hsync_start - vid->hdisplay);
+	count += sysfs_emit_at(read_buf, count, "HSyncWidth:%d\n",
+			vid->hsync_end - vid->hsync_start);
+	count += sysfs_emit_at(read_buf, count, "HBackPorch:%d\n",
+			vid->htotal - vid->hsync_end);
+	count += sysfs_emit_at(read_buf, count, "VTotal:%d\n", vid->vtotal);
+	count += sysfs_emit_at(read_buf, count, "VActive:%d\n", vid->vdisplay);
+	count += sysfs_emit_at(read_buf, count, "VFrontPorch:%d\n",
+			vid->vsync_start - vid->vdisplay);
+	count += sysfs_emit_at(read_buf, count, "VSyncWidth:%d\n",
+			vid->vsync_end - vid->vsync_start);
+	count += sysfs_emit_at(read_buf, count, "VBackPorch:%d\n",
+			vid->vtotal - vid->vsync_end);
+	
 	ret = simple_read_from_buffer(buf, len, ppos, read_buf, count);
-
 	return ret;
 }
 
-- 
2.50.0

