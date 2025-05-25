Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3CBAC33E7
	for <lists+dri-devel@lfdr.de>; Sun, 25 May 2025 12:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841F210E07C;
	Sun, 25 May 2025 10:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ipcgddin";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2951510E07C
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 10:40:36 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-742c5f3456fso985237b3a.0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 May 2025 03:40:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748169635; x=1748774435; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AkaxFjVGSe2Qwk7a8pqzzV8ilfKVeuiiyO9oBhvP6G8=;
 b=IpcgddinTA+b5zYg36ZqFRDnxR1R+Hankb1RFPqeLSl4wRkGdRCMkkAorgUcoavpbc
 pBkYFp9lihcZqYSs4RKQCb6GLWSxfWcJgR5DBk78zsWMLG8B+TVBLe/or5XG6WQ0pv8K
 wNNoB97eRvkEGJ+Awn0DY/0F0ry37SvS5/qBi+A8HzZpaIcEK/3Aw9cPWMk53O1f0Wa0
 FQ9qNtZqy8EikQ5vesE8IXxWLvQRBHSHrFTdJhcMwfNrcna2u6lyRmQu1z6v6Qk0YD4H
 H44nl0nJeM5rTiGLY69a3V2LWHVMC996a39X/WG/F8ZZIrxFtx6reMjAfREOtTcKYuDT
 Xs9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748169635; x=1748774435;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AkaxFjVGSe2Qwk7a8pqzzV8ilfKVeuiiyO9oBhvP6G8=;
 b=kX0gwvY1IfwZvhQ/v3vLLIoQiVUquy7J/NRFdxMQDc8OWBs+ZDxFrT4J7GZSR0/4lZ
 gG2E/ZLRUCDZgN4mSi+rtyDUYaQNsj1wH2c3yFT+t+hIrNxt60RBjfMxMxo5WW46J5Zc
 qtF1Ccw4K1SzC9y9HTNG8BUcyo8TlbZQdCcah/HtDWzhUs9bvYTYB38ljNg232ogrgvF
 aYnjEsLj3dMCEd+2OD9cvVR/fQ9vvp52cF7L/UJiVfb1RuOuZWGOrCYX93G7o/XUQb2l
 GRcx7OiOoBOWO3sQt0455cE2ZeG9oJdnRpHkEsMNCPa/2zmoara/vytMeV5Fiw/qdbS/
 8VrQ==
X-Gm-Message-State: AOJu0YzXYAHXRFeTstRxcsRLU0TXHtKhU2fDV0iP+sooyiSxczu6GpLs
 UoHh8qo3d6oX6e+jw3wXk34/rWxGdZaqqL0DWLALtfsvILEYkXI0MHlI
X-Gm-Gg: ASbGncvS1T9OY/yBAbEB2H63eKPpAcaSOrJIJJ+9vAtTjJhQGSR6yZ9mpTDGYN5svnF
 YAebL3DIJxPKZvLn6pv/678lhCDkHcwkXkQlmOli/XTNLcX1RCTm1EwNmWnttL94HiZwFf479VB
 zl2y0WAhg7GNtpKvIZa1pKDUHNyPjjzL8BYxQWS5IlGrmcDIXubHwaPhaCdfKIATQYAUSgTVdUD
 5bD3r8frR2u79Xkqoz7k84Nq6GKC76I0595ts64EOj77Wiaq2pkJOHZVDPxWckPTChzWXqDpZDy
 eBmvKg+UtkW/eyIiHqI5o/KoSPwb6Nj0H7iq+nr3BNFCclbR3Q==
X-Google-Smtp-Source: AGHT+IGOV1Qoz9M8Hpj3ynpz5Bb7xb/5hezEEoZviGII3MnP9qNtCwtF+oiJboyMF+/MRa5DZgNxCg==
X-Received: by 2002:a05:6a00:4b02:b0:742:a02e:dd8d with SMTP id
 d2e1a72fcca58-745fe05907amr9090249b3a.20.1748169634693; 
 Sun, 25 May 2025 03:40:34 -0700 (PDT)
Received: from nuvole.. ([144.202.86.13]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a96defa1sm15833363b3a.12.2025.05.25.03.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 May 2025 03:40:34 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: [RFC PATCH 2/2] backlight: Improve support for dual backlight with
 primary/secondary linkage
Date: Sun, 25 May 2025 18:40:22 +0800
Message-ID: <20250525104022.1326997-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250525104022.1326997-1-mitltlatltl@gmail.com>
References: <20250525104022.1326997-1-mitltlatltl@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch enhances dual-backlight handling by explicitly linking
primary and secondary backlight devices using new fields:

- `is_secondary`: Marks if a device is secondary in a pair
- `secondary`: Points to the associated secondary device (if any)
- `primary`: Points to the primary device (for secondary devices)

It also update `backlight_update_status()` to ensure that both primary
and secondary devices are updated together during brightness changes.
This provides a consistent update mechanism in dual-backlight case.

Suggested-by: Daniel Thompson <danielt@kernel.org>
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/video/backlight/backlight.c |  9 +++++-
 include/linux/backlight.h           | 50 +++++++++++++++++++++++++++--
 2 files changed, 56 insertions(+), 3 deletions(-)

diff --git a/drivers/video/backlight/backlight.c b/drivers/video/backlight/backlight.c
index 991702f5d..2e7b179bc 100644
--- a/drivers/video/backlight/backlight.c
+++ b/drivers/video/backlight/backlight.c
@@ -388,7 +388,6 @@ struct backlight_device *backlight_device_register(const char *name,
 		new_name = kasprintf(GFP_KERNEL, "%s-secondary", name);
 		if (!new_name)
 			return ERR_PTR(-ENOMEM);
-		put_device(&prev_bd->dev);
 	}
 
 	new_bd->dev.class = &backlight_class;
@@ -428,6 +427,14 @@ struct backlight_device *backlight_device_register(const char *name,
 	list_add(&new_bd->entry, &backlight_dev_list);
 	mutex_unlock(&backlight_dev_list_mutex);
 
+	/* set them until the secondary device is available */
+	if (prev_bd) {
+		prev_bd->secondary = new_bd;
+		new_bd->primary = prev_bd;
+		new_bd->is_secondary = true;
+		put_device(&prev_bd->dev);
+	}
+
 	kfree(new_name);
 
 	return new_bd;
diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 10e626db7..cde992e10 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -291,13 +291,42 @@ struct backlight_device {
 	 * @use_count: The number of unblanked displays.
 	 */
 	int use_count;
+
+	/**
+	 * @is_secondary: Indicates whether this backlight device is secondary.
+	 */
+	bool is_secondary;
+
+	/**
+	 * @secondary: Pointer to the secondary backlight device.
+	 */
+	struct backlight_device *secondary;
+
+	/**
+	 * @primary: Pointer to the primary backlight device.
+	 *
+	 * Non-NULL only for secondary devices.
+	 */
+	struct backlight_device *primary;
 };
 
+static inline struct backlight_device *
+to_primary_backlight_device(struct backlight_device *bd)
+{
+	return bd->is_secondary ? bd->primary : bd;
+}
+
+static inline struct backlight_device *
+to_secondary_backlight_device(struct backlight_device *bd)
+{
+	return bd->is_secondary ? bd : bd->secondary;
+}
+
 /**
- * backlight_update_status - force an update of the backlight device status
+ * backlight_update_status_single - force an update of the backlight device status
  * @bd: the backlight device
  */
-static inline int backlight_update_status(struct backlight_device *bd)
+static inline int backlight_update_status_single(struct backlight_device *bd)
 {
 	int ret = -ENOENT;
 
@@ -309,6 +338,23 @@ static inline int backlight_update_status(struct backlight_device *bd)
 	return ret;
 }
 
+/**
+ * backlight_update_status - update primary and secondary backlight devices
+ * @bd: the backlight device
+ */
+static inline int backlight_update_status(struct backlight_device *bd)
+{
+	struct backlight_device *primary = to_primary_backlight_device(bd);
+	struct backlight_device *secondary = to_secondary_backlight_device(bd);
+	int ret;
+
+	ret = backlight_update_status_single(primary);
+	if (!secondary || ret)
+		return ret;
+
+	return backlight_update_status_single(secondary);
+}
+
 /**
  * backlight_enable - Enable backlight
  * @bd: the backlight device to enable
-- 
2.49.0

