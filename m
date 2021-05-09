Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3467A377DA8
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 10:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A523C6E413;
	Mon, 10 May 2021 08:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5146E1E8
 for <dri-devel@lists.freedesktop.org>; Sun,  9 May 2021 13:43:53 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id i14so11440206pgk.5
 for <dri-devel@lists.freedesktop.org>; Sun, 09 May 2021 06:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ea5k4FOKx4SMEkuXC1Eve5YR4n5XkljuOnwvabyNaPs=;
 b=BtrreVjY7vVCqohnNnwGhZSGhbsdXm+mpP2hc9FNjdhxfCex+w25C/0qIaEXz9Dw46
 XYvKLE4otXOMZoboa0kMz8lSyZmC8bkoNuk84wQPtztCDYGeRvaKZzcQHneeLipM/Zsl
 4v8U7MQSYaKASoWlWy6Ski671jjU+RoxyYytNkAdchNzqk06Dt98HJvxddTDJQaCPVT8
 8RhfSSvCW/kydHCMAuiMLI/qSmnzHAEZsgaESDwXPiGjSizX5ssDlODsFjO3i/uOAQxI
 Mx7Xz7JY4s3/gpGY01ijtuZqLyT8QD8dmCbBtx74ks6xcjLmW/M0OOEtDdMUg6Zks1hq
 8weQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ea5k4FOKx4SMEkuXC1Eve5YR4n5XkljuOnwvabyNaPs=;
 b=NYFvugqt2r982XmCiHyoRYDPWualvMj9izw0aAv/vmOJfNwU1iAkfIXDJmJJsh1W6L
 aZeG3aC5eBu641iCaJa9Y+thz7Tiojo11fh6GsnpjJDWYLrXc0TE/j8SaIO7nsEj9aIk
 cszt2M4IHbiCoQiTUnl8F7lEXJtftitd09dvzD0iyGkUfvRKzRDpia2YyyCMAJ8mW4Y7
 T9JaO1FenfRuCsPBWY4SD56h7tWRdqLNVKREqrwvKKFSnB3rm9Qr6Dj9/qwt8mpQMbXl
 XIwjKCMk0zFUnC/VCkFT9k20a1RMDMgXjCHL1oA53ORlj3o+g7rhOWtfyo3ETR+amfBN
 Bhrg==
X-Gm-Message-State: AOAM530YtW61AFqQa3oB1B21BRr5ThTklLw17F9CPAlUhirvR3WdqHCM
 gk/WNzt8RT3VIdPMgPDvpls=
X-Google-Smtp-Source: ABdhPJwJqX5qVu1IBdKJD14HhHbw5xqUr7ouCvj9UYb2ojFD6cANJ0mWNtSmp6YWr7uKVI1UvpBvTw==
X-Received: by 2002:a62:d411:0:b029:2b5:fce4:7e64 with SMTP id
 a17-20020a62d4110000b02902b5fce47e64mr5797927pfh.15.1620567833038; 
 Sun, 09 May 2021 06:43:53 -0700 (PDT)
Received: from novachrono.domain.name ([223.235.208.114])
 by smtp.gmail.com with ESMTPSA id i123sm9289433pfc.53.2021.05.09.06.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 May 2021 06:43:52 -0700 (PDT)
From: Rajat Asthana <thisisrast7@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm: Declare drm_send_event_helper static.
Date: Sun,  9 May 2021 19:12:52 +0530
Message-Id: <20210509134252.488157-1-thisisrast7@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 May 2021 08:04:24 +0000
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
 Rajat <thisisrast7@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rajat <thisisrast7@gmail.com>

Declare drm_send_event_helper as static to fix sparse warning:

> warning: symbol 'drm_send_event_helper' was not declared.
> Should it be static?

Signed-off-by: Rajat <thisisrast7@gmail.com>
---
 drivers/gpu/drm/drm_file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 7efbccffc2ea..17f38d873972 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -786,7 +786,7 @@ EXPORT_SYMBOL(drm_event_cancel_free);
  * The timestamp variant of dma_fence_signal is used when the caller
  * sends a valid timestamp.
  */
-void drm_send_event_helper(struct drm_device *dev,
+static void drm_send_event_helper(struct drm_device *dev,
 			   struct drm_pending_event *e, ktime_t timestamp)
 {
 	assert_spin_locked(&dev->event_lock);
-- 
2.31.1

