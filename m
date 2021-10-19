Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 080B54331C4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 11:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E71EF6EB5C;
	Tue, 19 Oct 2021 09:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 720F66EB5C;
 Tue, 19 Oct 2021 09:02:45 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id o133so17039804pfg.7;
 Tue, 19 Oct 2021 02:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sW5kzqI2ZLlgm72jV9aPPdFKNC889wnGZx9L6y3GNDE=;
 b=KQ6KKZrilTzlxQ5KkvqlvnbNQ/cJxM54GDqV4uxqzpBbCnSiHHjsgyu7ZqkvO12KPf
 uXVbkuTWMPodLFMAAM4pzZApcjfjUIj3lcRn3R9nX8Wx7UNRtXUcHaD1Cy0ikOksTAsi
 QB79kgXcaIdeJ2LEgdh+riEPU4/GUN98aUzchgmRJvakDLi89c6yVA2WpJ0cYxS6XA19
 G94hjk/Ay8IcRUV/tQav7P/AQNxN5tE/E+Y+J4rOT8oWdAH+q2KVtkHVCgnS4EUhq6LI
 uWt5500ppG1B5lgc+XqWt9oe6XbochwNDiCvhEXC5fmhErRKIobuJXptWKZybloQ18+C
 P7Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sW5kzqI2ZLlgm72jV9aPPdFKNC889wnGZx9L6y3GNDE=;
 b=2Kyv2d6HrctKxpDHa0AlxFbL4vE+p4xT//gTIEpgoIYfymgzuMfUcv7T2xreWaYceL
 W1tFJbcM6Sz4yMq2V6ZmgGH8VLxnj/UAolIt/F8SQ7zAm1pQ8NdTk4nkehwZdq19ZAFU
 IxySK1U4R59kGEEi37TaD/PVLHlv7kBDT0h5uJlhDld+Ddk+IMC4QtblariomiqkDYoE
 30VI5ur8gQRtwYtgr9HBux3KbEaARjkIoBSi86PGiIOdByIPsA78zhOkL5XDWo7yR7xF
 cPpc0fum7HJNDdOPSYFmIPo4PxvX6tKKdYQ87LmHx+woW2OMsytOcDB9Pf2PkvAnhIH+
 a47g==
X-Gm-Message-State: AOAM533S8wl4Lm70UCKluP3+42acGNH79naf5aIVWjedjJ7LXx4gkL5Q
 JTD5YwzX1lCF65eWJ0klBjCm2kJU09E=
X-Google-Smtp-Source: ABdhPJwUfkoqRsVd+CCYM8ak6IRF7IftK8GgqFupS44n7zlu7KDBI56oFbj2TEQOPZQoPwy/mwU7DQ==
X-Received: by 2002:a63:8742:: with SMTP id i63mr16229969pge.328.1634634165079; 
 Tue, 19 Oct 2021 02:02:45 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id s2sm15184610pfw.30.2021.10.19.02.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:02:44 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ran.jianping@zte.com.cn
To: jani.nikula@linux.intel.com
Cc: joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com, airlied@linux.ie,
 daniel@ffwll.ch, matthew.auld@intel.com, thomas.hellstrom@linux.intel.com,
 chris@chris-wilson.co.uk, maarten.lankhorst@linux.intel.com,
 ran.jianping@zte.com.cn, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH] remove duplicate include in mock_region.c
Date: Tue, 19 Oct 2021 09:02:05 +0000
Message-Id: <20211019090205.1003458-1-ran.jianping@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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

From: Ran Jianping <ran.jianping@zte.com.cn>

'drm/ttm/ttm_placement.h' included in
'drivers/gpu/drm/i915/selftests/mock_region.c' is duplicated.
It is also included on the 9 line.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Ran Jianping <ran.jianping@zte.com.cn>
---
 drivers/gpu/drm/i915/selftests/mock_region.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/mock_region.c b/drivers/gpu/drm/i915/selftests/mock_region.c
index efa86dffe3c6..75793008c4ef 100644
--- a/drivers/gpu/drm/i915/selftests/mock_region.c
+++ b/drivers/gpu/drm/i915/selftests/mock_region.c
@@ -6,8 +6,6 @@
 #include <drm/ttm/ttm_placement.h>
 #include <linux/scatterlist.h>
 
-#include <drm/ttm/ttm_placement.h>
-
 #include "gem/i915_gem_region.h"
 #include "intel_memory_region.h"
 #include "intel_region_ttm.h"
-- 
2.25.1

