Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1828FCA2202
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 02:50:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C10C10E19C;
	Thu,  4 Dec 2025 01:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T2OLHmQU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5CA10E19C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 01:50:40 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-3434700be69so513643a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 17:50:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764813039; x=1765417839; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bi2f0uRChyGj6ugafTr27+ZC+WWnAEAMXr4AoMnk9zQ=;
 b=T2OLHmQUXALCeUafGX38RAFhz4Bhl0qZa36vKYu9RCbhk5V0gwmWYzyqvWP7Nngbuq
 pu5MIp4jovkC46cqkdWC9ebPd6rSUQs0jg5CeoNg3g/PwlJszPA5vp7OJFvqttmWlaPJ
 PY+9C5WL69Zv8apF6guClBygmQIMe3jFQX8XJt8SQfsq4Ub0pIB+8BXErJ2x8+ReADB4
 Jr1OYMoi8o9uMLcDtdDDP32jCciWmeGuZmA2OiUbtbOnsCDPkDVpJnybeKToX+Lz2wJc
 in/9Ru4L5dmnWSHPVi+T+JHk+rz4D78YetdxVcbxPbj7SlfFw4aqAndtXgWMovPI2IrT
 4g1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764813039; x=1765417839;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bi2f0uRChyGj6ugafTr27+ZC+WWnAEAMXr4AoMnk9zQ=;
 b=PHln7cvJiZfAIrOcN32+8wqL2CYwqSDk701PFbiHzU/ch9sAHSYlYpX4H/9t+6OaRQ
 UHFMk/cCxua+a/3TpsD6krNEh7JcSZFO5K4t+Qu3U6PnGZmQPswWfLG/I9HL7o2if6NW
 MssYYshDC1Ui4NbnKVQjQbdW7DkEf1Jc7dZ6r8ShpCgGBa8OvCxULqtUP0+p7T9Sdvd1
 tDWIWFsdQo8/S6kWdU1tTTQpsavrlklDafG/36Uw1bCCybF7dH7MzeD+isxsw4kP9rdm
 H/FxG9hEhrSGCc4oF/b3P4pp9rgoeqqFfCip2rkrPrvihrOfRXjbYXJqQWnCEd1yjmRb
 FKkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuwF5eoTeL+pOR+bQb1uKTLBPI1cxDNUPBH1mSSKZJmFK7Te9BRNEDY8yP9ppfnTivu0utD3yyKUw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5Ar8uHMgx+N0creRRv8xgIcz0EWK7qUC3+Fs1ZyA6v/G8zpv9
 XMs9efmqshw9yy6qA+OQoA30N/a5lEGm/mwhu+P+ui012w5NpvwalLEQ
X-Gm-Gg: ASbGnctTs/cD9CrX758Nmvv9+6eK1BVgMBEYjvHxY1r9WKgcQxo3+vVhSN2P2y6ursz
 j2TPrt1VnvQSXzrd0YVmAD8+Tunk9QQcD9eKM+2ioAsbywwC8L/Dqf82WzZgCjMN35g9sJ/KyWx
 nyodyQGid5RkrtUqvxwJLlDHkXsboYoTVxaScFeJ33j1g1kV6zsNOtqTlDIkxLhn3SdAe44/ap2
 HDvQ/lgdtrAvm3RC1/XyJBxpmfQrjn9sGebwLQQgXDwv7DJ1yGLeCm7HjpOzGDCmU56JV8i5iyq
 pOSuAPZdvWO5bpyVFD4Q/7VLzJlWQc7z9L5zNoYRiY26H6nlqEasooi822gqg+pQH7kicYCxdgQ
 2ZazYbamlqTMtKxkxrgGZtwqGbVxOQdDlwbH3dKsqW94EAvKF9p/4qGZvgFrHYyWDEpsLMpJQWh
 gnMZi4dcOhDYJWs8GC7DSv/MxrueN5V2SH75gsg0X7ep4=
X-Google-Smtp-Source: AGHT+IFwM76BWKmkeHL4wr1V/4kuESlCwbW3oUtmXbOXn65/m2X3jtGdqqnbdflwI1cV4dGvYPp3iw==
X-Received: by 2002:a17:90b:5251:b0:33f:ebc2:634 with SMTP id
 98e67ed59e1d1-34947d88ed4mr954071a91.9.1764813039478; 
 Wed, 03 Dec 2025 17:50:39 -0800 (PST)
Received: from localhost (78.31.125.34.bc.googleusercontent.com.
 [34.125.31.78]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-34912a2d392sm1424922a91.8.2025.12.03.17.50.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 17:50:38 -0800 (PST)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tvrtko.ursulin@igalia.com
Subject: [PATCH] drm/panthor: fix for dma-fence safe access rules
Date: Wed,  3 Dec 2025 17:50:34 -0800
Message-ID: <20251204015034.841235-1-olvaffe@gmail.com>
X-Mailer: git-send-email 2.52.0.177.g9f829587af-goog
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

Commit 506aa8b02a8d6 ("dma-fence: Add safe access helpers and document
the rules") details the dma-fence safe access rules. The most common
culprit is that drm_sched_fence_get_timeline_name may race with
group_free_queue.

Fixes: d2624d90a0b77 ("drm/panthor: assign unique names to queues")
Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 33b9ef537e359..a8b1347e4da71 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -23,6 +23,7 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/rcupdate.h>
 
 #include "panthor_devfreq.h"
 #include "panthor_device.h"
@@ -923,6 +924,9 @@ static void group_release_work(struct work_struct *work)
 						   release_work);
 	u32 i;
 
+	/* dma-fences may still be accessing group->queues under rcu lock. */
+	synchronize_rcu();
+
 	for (i = 0; i < group->queue_count; i++)
 		group_free_queue(group, group->queues[i]);
 
-- 
2.52.0.177.g9f829587af-goog

