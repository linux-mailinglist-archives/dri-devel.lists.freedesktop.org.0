Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EAD5A00C06
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 17:25:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A79C10E085;
	Fri,  3 Jan 2025 16:25:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="brzcQAMt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A44F10E085
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 16:25:24 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-6dcdd9a3e54so124116726d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2025 08:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735921463; x=1736526263; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3miR82nQFqIb6EuWgzK+twcxz/4Mrz5A2qFQdIzaNbc=;
 b=brzcQAMtxIC62HTNS/vbuTWGxugLNDqzAUT2bnXrgqOj2z4MkRD5ORxomkcpKC2dVa
 /5wgKG9Tnj+hcudmWt0ClFAksEdf/cE4WlQNIhFRkTi4r1Vc/xSvS6v/EomZW9U8drh/
 iBrh2nsE58TwaY1po3198w8BD3WdqNPbGOH1gZ8hUpxQtR093nC2gXo25uFL/spUF7AJ
 yLOhDk95Mlg0QKAOne6Q1ioxKI1l8Xl0l2vtsjWQef5b6Ir5baEixoIXD7rzjyxSBxGA
 Y57N3qEv6wVHPypl2gafj0hmLmTIg7g4EpqLtySQndTGe/KO++3T4F4NYiZvYXhAI89E
 pXrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735921463; x=1736526263;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3miR82nQFqIb6EuWgzK+twcxz/4Mrz5A2qFQdIzaNbc=;
 b=EtAFtLAmF5RytT3FiEYM5+qtml85wPWkJGtQXNEKL5vNJ6yekLRnu+RRpfjktaiE8y
 mbDGL/WxPGz4Y56unfD8PlRZZag7bS2+pbEg95OImHghrm/XNtYjNhVk7xJSYZeK4Fuj
 ISsa/GM8ppUEduJM4xt8zpmW1r6I3ZVPlKri1TifcVHYXsy4IRc/JHlnhbaz8CXCjRSr
 iAd+KqkMXy4RQPesjTtKSkZuTBChU/X4+uiMNQBiuICDuVR3GB2LubVH2jlN+5VaIY3+
 1pnf4M49SZ70GjkoDbPKT+2qCzPkvlIK8ESJCDsMbkb2gWNZNZCVmvs2xaT3EaCz9Di7
 D22Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvAPGI47YhwMzUAhYEM4mXtAVK3Xgofxe0Qw0z3/EFaxHlAj62gcMg9R62Ez4L+YdUeqsBHovNCzk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXQLwBTHZ8BG7zyXQtvSEy48xJ88X8ANJW10lSWFEM3ptC3Nv+
 UGLaVpNd8quhURv8hnErJ2yX3qEuSpmrDz3N9KiYXp7+iAL7c/YiEqqHagyJSzw=
X-Gm-Gg: ASbGncuxW2iDH25NXKasTci+1/96IX66f3gGw8S3heO4PtCKd7yybngLPC+p3PdFXbf
 uNMdfMTFNpNRpU3plABqooiHJyQDTOfpiCLQucI5upBn9jCAbvgYqjwFoa2A9yfe7tuQAEVkBmZ
 FIVigKZbWbQmj5R3bsZ5WYdAwaIJ2jch5GR+6EIPck2bGKz22eoLCeoOnjptfPwcIgo1Xz3Rfr6
 t84o/yqN/f2HemLBh7pY8FhCBeF9RuEOkLypIqvDnwYIFk2FHlsPKL54vpTHQ==
X-Google-Smtp-Source: AGHT+IHrZYeh+P4IrB1mSl1sqoZh7Gl8tsx7qqwaZGVdCY/sLBTFM0+1uWl6jTvsLV9IBt0JgU0Okg==
X-Received: by 2002:a17:90b:2545:b0:2ee:74a1:fba2 with SMTP id
 98e67ed59e1d1-2f452e3e83cmr74355531a91.20.1735921098280; 
 Fri, 03 Jan 2025 08:18:18 -0800 (PST)
Received: from eleanor-wkdl.. ([140.116.96.205])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f4477ec656sm28321049a91.30.2025.01.03.08.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jan 2025 08:18:17 -0800 (PST)
From: Yu-Chun Lin <eleanor15x@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, ruanjinjie@huawei.com,
 jserv@ccns.ncku.edu.tw, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Yu-Chun Lin <eleanor15x@gmail.com>, kernel test robot <lkp@intel.com>,
 Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH] drm/tests: helpers: Fix compile wrarning
Date: Sat,  4 Jan 2025 00:17:58 +0800
Message-ID: <20250103161758.1097313-1-eleanor15x@gmail.com>
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

Delete one line break to make the format correct, resolving the
following warning during a W=1 build:

>> drivers/gpu/drm/tests/drm_kunit_helpers.c:324: warning: bad line: for a KUnit test

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501032001.O6WY1VCW-lkp@intel.com/
Reviewed-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Tested-by: Kuan-Wei Chiu <visitorckw@gmail.com>
Signed-off-by: Yu-Chun Lin <eleanor15x@gmail.com>
---
 drivers/gpu/drm/tests/drm_kunit_helpers.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
index 04a6b8cc62ac..3c0b7824c0be 100644
--- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
+++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
@@ -320,8 +320,7 @@ static void kunit_action_drm_mode_destroy(void *ptr)
 }
 
 /**
- * drm_kunit_display_mode_from_cea_vic() - return a mode for CEA VIC
-					   for a KUnit test
+ * drm_kunit_display_mode_from_cea_vic() - return a mode for CEA VIC for a KUnit test
  * @test: The test context object
  * @dev: DRM device
  * @video_code: CEA VIC of the mode
-- 
2.43.0

