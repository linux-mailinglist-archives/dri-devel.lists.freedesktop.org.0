Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4A7ACD00E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 00:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D1C10E032;
	Tue,  3 Jun 2025 22:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IFBHVtDf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E08310E032
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 22:51:48 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-23228b9d684so65904145ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 15:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1748991108; x=1749595908;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0gJ7JY1EkW7vzQ7yl4ShfN9IWzhP2LQP72RJoFIeBZY=;
 b=IFBHVtDf0V0cFL0eOrTD5xidBUqFCjrz615QBY7IA9wKFukKLi/s4QyG9x5fWmgRJ6
 usr9YQXIo3w6vqs8al7X5MMV31gWINF9KbknUenFjlKOlyiWEcink17PUyr5BB16a1M7
 e3SWeAP7CjfIZWPBglrs38DKG3r7nPQTK1uBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748991108; x=1749595908;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0gJ7JY1EkW7vzQ7yl4ShfN9IWzhP2LQP72RJoFIeBZY=;
 b=Dse3ejUnsqBgFMuy9JUDwoNAdZExSxB3fDlSHAcV6mh24kDG+nIt4JgZdjp3YFeUTq
 SkLz21DbhtqX3qRVqEBFT0PZyA+lmX5o8cHla7mRiimMctcVCc1PwNLzoYr2JBRHKmB3
 Dbhv5U3gmWUpCW2PmF+n7qdJLGQ6tFJYn7Y/uBihRKVrgp++XC50xf98vQeG+AIBPr/n
 1EFEdzSIJJvQWHYm8UqqCdisXrGl/umt1fu2Ms6KirRn3qc8c/fHCHwKQlQGgiQL2LRs
 nUMmfnU9igYpLplSnOzR7kj3EHizmNHhlshFSB7kCP5X4iATznQvHi6yqi80k3U+FJT7
 CDjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd4+7IcNea+Lost4tWwG/bcsd1sgeHxQIyAoWGr4ui15PK93FwIrJ1Tv4mRA0EISspW8tHT6DmFJY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyw2ygobJn4qma4sSiqfDeP/KIh4ik79P6iOYS6K9KWmVIOd3N4
 r91WGgSXe7584QO+nCIOxMBC2gy1Yd8bUBvsGsVQ7LMksZFY6cCELgIRkDIQXNSziA==
X-Gm-Gg: ASbGnctekArxGyUVAlXsu92crlzPYfLV0PgTguWSOdj3gZz92uv8aihEsokR5DA9XEw
 Lhe4WshRlUbI6rR1XbkB0plTC4da0toImdY8uMKSCYXeqtimPwolWx3uUaukah14De+JTMUZx9n
 xfbtpJ//VFlSu8R/n/kxZ3uO4ULbYIFJ0sxIEnk1VVykKRtlKyChHGg/ESA5qaLJ287rrOOfLow
 qgih+Psg0eZZLJT+CxThpKN0eBYoxxksJTrYSfD8q746TW/ZXkkzc9suoRReDJMEig9MxUrou89
 q2UTpdlRRx8ma30mxbssbV/E34OC1mZM30aR2vRdV6WEvxNJfCpikh2vqhzgHr2D7HOLo48wcyD
 X1W6n7YRreExZh1AWALgyH1oZToNg2doc7s3Tzr+5
X-Google-Smtp-Source: AGHT+IH4KC1KJBjNWaXUmbk8Aa4L/R0c3HrEm5SIM98g9zp54fpdSzRr3AdhlZHZaehucukEo91Dbw==
X-Received: by 2002:a17:903:1245:b0:234:9fea:ec5f with SMTP id
 d9443c01a7336-235e11291e8mr7039745ad.1.1748991108024; 
 Tue, 03 Jun 2025 15:51:48 -0700 (PDT)
Received: from justonli3.c.googlers.com.com
 (11.103.168.34.bc.googleusercontent.com. [34.168.103.11])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e29fcecsm7723706a91.4.2025.06.03.15.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 15:51:47 -0700 (PDT)
From: Juston Li <justonli@chromium.org>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Yiwei Zhang <zzyiwei@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Juston Li <justonli@chromium.org>
Subject: [PATCH v3 1/2] gpu/trace: make TRACE_GPU_MEM configurable
Date: Tue,  3 Jun 2025 15:50:06 -0700
Message-ID: <20250603225123.2535767-1-justonli@chromium.org>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
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

v3:
 - Patch introduced to replace per-driver config (Lucas)

Signed-off-by: Juston Li <justonli@chromium.org>
---
 drivers/gpu/trace/Kconfig | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/trace/Kconfig b/drivers/gpu/trace/Kconfig
index c24e9edd022e6..cd3d19c4a201c 100644
--- a/drivers/gpu/trace/Kconfig
+++ b/drivers/gpu/trace/Kconfig
@@ -1,4 +1,13 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 config TRACE_GPU_MEM
-	bool
+	bool "Enable GPU memory usage tracepoints"
+	default n
+	help
+	  Choose this option to enable tracepoints for tracking
+	  global and per-process GPU memory usage. Intended for
+	  performance profiling and required for Android.
+
+	  Tracepoint availability varies by GPU driver.
+
+	  If in doubt, say "N".
-- 
2.49.0.1204.g71687c7c1d-goog

