Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7464EBA6884
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 07:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB15210E02F;
	Sun, 28 Sep 2025 05:49:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U2caTAfm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE8810E02F
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 05:49:23 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-26d0fbe238bso27502025ad.3
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Sep 2025 22:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759038563; x=1759643363; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rXOGNZuoaGhzLXmLiFIZJZsbC3gonJn28kPPxMXiXWg=;
 b=U2caTAfmmk+uGLIe7OUUIFXAZHjAP+GngXWtxKcNaT9txY+hBQ3acTliDYyEQu5/E6
 wrbGfBH1CIcR1S+aitvDA7U0jtenGMwEatkGRLPL3/gcncyPNc9sVSEqtLSkonbnKT9F
 YGQNgMIScV4ZLqTP46ffgnXiOuQ5/+XS9jCb1SHLt5T7dJdm80K0jS9/SW21RZ6elWlm
 Z+Hkfcufmololo5OGIH95rBRnl8FLoL4Kbnk4NcJQT1JZ9pwvdrS5Hzdn3SmmldXhVzR
 Vr2icMrH4XRpiLPA0hB/8nEw1179iXULzFHnqKzPxpkDkkj2k5JOjDsSnutWypsoF0bH
 I22A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759038563; x=1759643363;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rXOGNZuoaGhzLXmLiFIZJZsbC3gonJn28kPPxMXiXWg=;
 b=SBkw57qpgALi6fCK45eLEp1A4qfXLONeL+DBAwnsqY2rWMFIdt7G2L/iRa7pgOPIwH
 XtxJvIrGTcpJ2IVNq34rh02L1ETturY7mM+A1WsDNioHCbHz/LZac+KpvGad6gfRFPeU
 YNzCTUNSyWAA5+l9F7XfWm/D4XtsGNQDcFt1JSHGmUKiOLJ/50u8bP+TTetP2g1RV/oH
 DPYebJKeLBrrc0AufoHAJH9dZ9DcOm0ZPq76vk2hPE9JHvUbyGxG2USgcPZ2r5eMl6FQ
 7eEEZhAtHminnAt/fTs66AV6l+iWNM5HjH5TNscPqNMGf98+/TwasPuNX7xIJT4qYnhD
 H3rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQaG4bJJLXSgGnqoXLQQUL8Kluvc+xd74e1XeAfDMCjZXn0qKsnCF/nM5zjSlMGOvwjdaa84id3Lk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeVPTOG9QTlkpAcSrHlUGpWMaX/OvOpTspbd4281lePteHM2/h
 hMLofa93ap8H23BfptVRgTMQkXl4kxwt8U6LnvXMEh+WhcKmANnDhAjG
X-Gm-Gg: ASbGnct/wxjskUCcZNwi7fQA8K9PbK9aPk9IxoWP23L7lvOzMvyd2UxVDpBVVeo8d//
 ghjVFH3KO1yqmxlOHAi4RM2+yLL0KW+lpKlvKGljqoddXjxu44uAMCYmxC3+QvQ14JxhC00Crmg
 bJaxZnMfDXNMvz9edAp2/uJTKEWDVI0fIFYoW5gAE/bzDLKO2Jk/f7BYo1ii3+iuTV9AXBrtX2R
 eRpdgtheTHSsYBTFkDKzFHTamKXdw7DN/86xmQGna4Cp/+5wViVtdZ0fOk6oVf251hLmhJ+LUWU
 WwNe4UcAyYQ7CsGa4WKR4GslvGCCsau0316QdTu+PUoOLDiET35VDfqy3YyvjPASpryG2qycrE8
 FdIuUddM1srqwIaWj2s41VgQb896PtAl5ghDaEhj9hwWDLi9uE/vX38tjud2Tx5NVxwyQkYb6Y3
 BwCvblX0Dtkzbs8DBBdB39E+rXacVRZsm6leXmEWINaB4=
X-Google-Smtp-Source: AGHT+IFtQXL2iF1TYStc0x11Pxv5A9nIPIcXq/lUvS/9/Y8J3YJJroPgqc5YItbGABj9VEdV2EtRfQ==
X-Received: by 2002:a17:903:19e7:b0:25c:4b44:1f30 with SMTP id
 d9443c01a7336-27ed4ab097dmr147299675ad.45.1759038563086; 
 Sat, 27 Sep 2025 22:49:23 -0700 (PDT)
Received: from opensource206.. ([106.222.233.88])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-27ed6700ccdsm94559015ad.37.2025.09.27.22.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Sep 2025 22:49:22 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: zack.rusin@broadcom.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH] drm/vmwgfx: Replace schedule() with schedule_hrtimeout() in
 fallback wait
Date: Sun, 28 Sep 2025 11:19:13 +0530
Message-ID: <20250928054913.7871-1-opensource206@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Replace the open-coded polling with schedule() in vmw_fallback_wait()
by schedule_hrtimeout(). The old code wakes up at jiffy granularity and
leads to unnecessary CPU wakeups during fence waits.

schedule_hrtimeout() provides high-resolution sleep with finer control,
reducing CPU utilization without affecting fence correctness. For the
non-interruptible case, use schedule_timeout_uninterruptible().

Signed-off-by: Pavan Bobba <opensource206@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_irq.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
index 05773eb394d3..64045b0efafc 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_irq.c
@@ -202,16 +202,12 @@ int vmw_fallback_wait(struct vmw_private *dev_priv,
 		if (lazy)
 			schedule_timeout(1);
 		else if ((++count & 0x0F) == 0) {
-			/**
-			 * FIXME: Use schedule_hr_timeout here for
-			 * newer kernels and lower CPU utilization.
-			 */
-
-			__set_current_state(TASK_RUNNING);
-			schedule();
-			__set_current_state((interruptible) ?
-					    TASK_INTERRUPTIBLE :
-					    TASK_UNINTERRUPTIBLE);
+			ktime_t delta = ktime_set(0, NSEC_PER_MSEC);
+
+			if (interruptible)
+				schedule_hrtimeout(&delta, HRTIMER_MODE_REL);
+			else
+				schedule_timeout_uninterruptible(delta);
 		}
 		if (interruptible && signal_pending(current)) {
 			ret = -ERESTARTSYS;
-- 
2.43.0

