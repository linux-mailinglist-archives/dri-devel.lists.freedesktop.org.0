Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C99936BA83
	for <lists+dri-devel@lfdr.de>; Mon, 26 Apr 2021 22:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD9C6E87C;
	Mon, 26 Apr 2021 20:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE7336E87C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 20:00:56 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id e7so67116243edu.10
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Apr 2021 13:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AM0fccZ1AwBF12uWrMCL9HsNLQWbMQpNVOxxiq8KOiw=;
 b=DDipI45QBFz2H8oTFqxGl+X7pU2DH5fwDU12H6PwnXQVPlR/C2RZIUwuyYASOrxXVg
 G78QBdS4bBFvEkfgLHLPWJ55jc11FWQcEzHm8U7b2bzD/8mgn2zsJRgWYW/iuBr+QIed
 aF6kP/EWIqEFwaytN93meLcqZjU2GBh/1ll03sprHBd6VH0WZ8Qe4NWV7+/TI3RQJ7HG
 Va8h3/bLAfS3WZbJ0ACn9nGXrxtDZSheU6tZfDIeME6gALwDpzflWa3tCIg5CJuYlCi0
 t24nxzIMAKOoICy8PP073QB/4nMR85/mnRvHsjiOGtTc0dgaZBRSc1NgHkMvIEeLy7rl
 9X1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AM0fccZ1AwBF12uWrMCL9HsNLQWbMQpNVOxxiq8KOiw=;
 b=I35WykmHg/3mW7jx2XWveCUSRzglMhkYg3AmRqwidGQ/Iqi8fnfRatzKb9fPZTBeKe
 AXzDheFv2TC1wT99hhYPtaaJrG/8Dz/3zGtoHEzQCJf0yOuODJzvjkcQBJU4uGFat5p6
 bFKhuIy3EdOrVkpooTkUkqAB/kBjNo8PMgD7K3tjskH3YDywUl8JRfTgINdT9pApk4hT
 T9H5yxQRTNBCvoAdCgflyWsdnfQeLsWieNtMljRv+CyAo5UQWGgQwtb6ObNurOYfC/jy
 KkmvA0MMjRHxYaCQarXzovqFGwQC87SMpxSYws8Xtx5hVLz4+2Cw4GQNnHVOZLnVbjjX
 77mQ==
X-Gm-Message-State: AOAM530yWZX1nLOwk2l2TRvR3y8zNuVIcFuAgjpMj4RLwaS/O50UP32d
 12K16UqHATsuh2rUmtIMPMw=
X-Google-Smtp-Source: ABdhPJwq9ywcI7jiZMwF35d5rctluJLoPNYS85cSjoBq6DhVzqMHeSFbWtK8+m4/N8QNKeU8jB9qoA==
X-Received: by 2002:a50:fd07:: with SMTP id i7mr418582eds.92.1619467255643;
 Mon, 26 Apr 2021 13:00:55 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it.
 [79.52.107.152])
 by smtp.gmail.com with ESMTPSA id me3sm3386590ejb.49.2021.04.26.13.00.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 13:00:55 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH v2] drm/drm_file.c: Define drm_send_event_helper() as 'static'
Date: Mon, 26 Apr 2021 22:00:51 +0200
Message-Id: <20210426200051.11530-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_send_event_helper() has not prototype, it has internal linkage and
therefore it should be defined with storage class 'static'.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

Changes from v1: As suggested by Daniel Vetter, removed unnecessary
kernel-doc comments.

 drivers/gpu/drm/drm_file.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 7efbccffc2ea..a32e0d4f3604 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -774,19 +774,15 @@ void drm_event_cancel_free(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drm_event_cancel_free);
 
-/**
+/*
  * drm_send_event_helper - send DRM event to file descriptor
- * @dev: DRM device
- * @e: DRM event to deliver
- * @timestamp: timestamp to set for the fence event in kernel's CLOCK_MONOTONIC
- * time domain
  *
- * This helper function sends the event @e, initialized with
+ * This helper function sends the event e, initialized with
  * drm_event_reserve_init(), to its associated userspace DRM file.
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
