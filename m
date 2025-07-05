Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B0EAFA3CE
	for <lists+dri-devel@lfdr.de>; Sun,  6 Jul 2025 10:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFE510E13D;
	Sun,  6 Jul 2025 08:56:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qniy9ODx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEE310E22B;
 Sat,  5 Jul 2025 15:59:37 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-74b52bf417cso1133840b3a.0; 
 Sat, 05 Jul 2025 08:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751731176; x=1752335976; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Xxe3hUK0FcWLFBwawbJlsURwRJfsz9aIAfjmQMU/LHU=;
 b=Qniy9ODxwHkwBwuN33ivO2ubRTRaYNwrgqF6uUvxQt1D4xEnl0yokvUYaSyZgPBbou
 x+DgtndDnZDtRxDJvB4Y+sV2ORmg9K28VFEOlImm/4RCZftYPeMjmXakSo3t3cDevKYC
 gE5J3jiARDgrY4IF6MFH7iuj4FLw81vr0vaAsQ0ckaq5yVJpUNZhRucH/Bb0e8uqdyTk
 KpW4Zrdr7SVReVVW2miXJ7S9wDmFUlhjNxSA6PJpIDNN9YNVpd+E2yOovgDuaCXX+kAF
 aXzxi41F4JLok70N3rn/flasgcVaksI4Fe6G4/eA8/Q9xtuS6wsovi4QWcVdKOtHfm2u
 W+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751731176; x=1752335976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Xxe3hUK0FcWLFBwawbJlsURwRJfsz9aIAfjmQMU/LHU=;
 b=wnBQ4OCu9RUb6sJGgtr7+AFokwo6lHoZxGdpkqfA9tg+6T7fiYNBVRgUrlVF5PBTe6
 8cKzzGAp/uR6CAppaRunGJmfMZ3a6gX1w2hdgPFlMezm67uqxelBGvlEV9aE0dY01YYA
 LGXoZLYDcsIT25VRJDSDsSyD+ce2F6w0GOLARSYAfSFD9GwVoWOUlrtZZC2rXCV5S63q
 5lnvw//DWlrvhC40WGyGAU9x7qx6tSyQObcxOkVZlfBuWxHem2zkwoPwPBGvk0eDQ16m
 rj9uERqwREA+1EcHNxiL4ftE93Utj1pA41vHzsdQGyEbwEm5e730+4An+geLLR5sVPoD
 GE0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpgJTMFGxI7fQBBY77UZ+i7ok4Ei0UFDiqNKxOBmOH/ZqPT2tcikwy+rVVtD8yc0lY+NlpyFtWYOU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyv3YFIfaW1ZWJhQblo2zUMeRzcz8Acrlh8lQ1ALMt8Sxt2OJjX
 vubMz10HT5tTR3ayzOLlX75QnFQV4VTu2nON93Xp1wYa0yH94oi5mZuw
X-Gm-Gg: ASbGncsT2pqgHNSzaneVEFW6pu4tue7EMDWDXTIIRVqXg7q3thIrcs1awWCrQRPHj0H
 In0frBpgWyXAx1aWSV58lLsko1jQE/pTfkUc4+FQ6zDcB/Mm7ePWYsefJU7nTCCSwSKgqON7IyY
 toozV3qbv82pP1ruIhqe66Lrhd0y0ROnA0aIJkpdTGQZquoYkF5OSJXt6fL3tzjqJ7/zZVUuUQ4
 0Wy5gFpeVFIusb/aZHYGf8YxupeU6W3AsQmvBClxQtgO18U+IKxjryJEqZzfkM88mvk43gfpYQF
 dvx7s5VWz+16csJnXtXFdOboKgpBhO9n/1DXoBt1qpzGhBhQalHkO0A1n3DNrOQLnSOv87nYm97
 32xkld5hVWvlYPc8=
X-Google-Smtp-Source: AGHT+IFjq06wwaJBBhZjTvlaIGp9QtkdQ8b7G5Dhd4VLbUDuY3LNRSFQdF8WPRHnHcJuL4ZpsupNFA==
X-Received: by 2002:a05:6a21:7a43:b0:223:76d2:5a7 with SMTP id
 adf61e73a8af0-225b948850fmr10729212637.24.1751731176590; 
 Sat, 05 Jul 2025 08:59:36 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:882f:293:70ba:30fe:2559:8217])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee74cf48sm4539103a12.77.2025.07.05.08.59.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Jul 2025 08:59:36 -0700 (PDT)
From: Abinash Singh <abinashlalotra@gmail.com>
X-Google-Original-From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Abinash Singh <abinashsinghlalotra@gmail.com>
Subject: [PATCH RFC] drm/radeon: fix the warning for radeon_cs_ioctl()
Date: Sat,  5 Jul 2025 21:29:14 +0530
Message-ID: <20250705155914.806693-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 06 Jul 2025 08:56:09 +0000
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

Fix the following compiler warning about excessive stack usage:

 drivers/gpu/drm/radeon/radeon_cs.c:669:5: warning: stack frame size (1200) exceeds limit (1024) in 'radeon_cs_ioctl' [-Wframe-larger-than]

The warning is caused by a large objects like  `struct radeon_cs_parser`
 being allocated on the stack. This patch changes the parser to be 
 heap-allocated via `kzalloc()`, thus reducing stack pressure. 
 It uses the __free() attribute  to ensure automatic 
 cleanup on return.

This change should not affect functionality, as all usage of the
 `parser` remains intact and is now accessed via a pointer.


Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
---
the radeon_cs_ioctl() consumes around 1200 bytes on stack.
It was confirmed using -fstack-usage
....................................
divers/gpu/drm/radeon/radeon_cs.c:669:radeon_cs_ioctl  1200    static
drivers/gpu/drm/radeon/radeon_cs.c:416:radeon_cs_parser_fini    56      static
...............................................

After applying this patch the stack size effectivly reduces to 656 bytes
...............................................
drivers/gpu/drm/radeon/radeon_cs.c:669:radeon_cs_ioctl  656     static
drivers/gpu/drm/radeon/radeon_cs.c:416:radeon_cs_parser_fini    56      static
.....................................................

This will eliminate the build warning .But will this dynamic allocation with kzalloc()
affect performance as compared to stack allocation + memset . Or will this way we will
suffer greater penalty ?
 drivers/gpu/drm/radeon/radeon_cs.c | 34 ++++++++++++++++--------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_cs.c b/drivers/gpu/drm/radeon/radeon_cs.c
index b8e6202f1d5b..ca7fad842db7 100644
--- a/drivers/gpu/drm/radeon/radeon_cs.c
+++ b/drivers/gpu/drm/radeon/radeon_cs.c
@@ -669,9 +669,12 @@ static int radeon_cs_ib_fill(struct radeon_device *rdev, struct radeon_cs_parser
 int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 {
 	struct radeon_device *rdev = dev->dev_private;
-	struct radeon_cs_parser parser;
+	struct radeon_cs_parser *parser __free(kfree) = NULL;
 	int r;
-
+
+	parser = kzalloc(sizeof(*parser), GFP_KERNEL);
+	if (!parser)
+		return -ENOMEM;
 	down_read(&rdev->exclusive_lock);
 	if (!rdev->accel_working) {
 		up_read(&rdev->exclusive_lock);
@@ -685,46 +688,45 @@ int radeon_cs_ioctl(struct drm_device *dev, void *data, struct drm_file *filp)
 		return r;
 	}
 	/* initialize parser */
-	memset(&parser, 0, sizeof(struct radeon_cs_parser));
-	parser.filp = filp;
-	parser.rdev = rdev;
-	parser.dev = rdev->dev;
-	parser.family = rdev->family;
-	r = radeon_cs_parser_init(&parser, data);
+	parser->filp = filp;
+	parser->rdev = rdev;
+	parser->dev = rdev->dev;
+	parser->family = rdev->family;
+	r = radeon_cs_parser_init(parser, data);
 	if (r) {
 		DRM_ERROR("Failed to initialize parser !\n");
-		radeon_cs_parser_fini(&parser, r);
+		radeon_cs_parser_fini(parser, r);
 		up_read(&rdev->exclusive_lock);
 		r = radeon_cs_handle_lockup(rdev, r);
 		return r;
 	}

-	r = radeon_cs_ib_fill(rdev, &parser);
+	r = radeon_cs_ib_fill(rdev, parser);
 	if (!r) {
-		r = radeon_cs_parser_relocs(&parser);
+		r = radeon_cs_parser_relocs(parser);
 		if (r && r != -ERESTARTSYS)
 			DRM_ERROR("Failed to parse relocation %d!\n", r);
 	}

 	if (r) {
-		radeon_cs_parser_fini(&parser, r);
+		radeon_cs_parser_fini(parser, r);
 		up_read(&rdev->exclusive_lock);
 		r = radeon_cs_handle_lockup(rdev, r);
 		return r;
 	}

-	trace_radeon_cs(&parser);
+	trace_radeon_cs(parser);

-	r = radeon_cs_ib_chunk(rdev, &parser);
+	r = radeon_cs_ib_chunk(rdev, parser);
 	if (r) {
 		goto out;
 	}
-	r = radeon_cs_ib_vm_chunk(rdev, &parser);
+	r = radeon_cs_ib_vm_chunk(rdev, parser);
 	if (r) {
 		goto out;
 	}
 out:
-	radeon_cs_parser_fini(&parser, r);
+	radeon_cs_parser_fini(parser, r);
 	up_read(&rdev->exclusive_lock);
 	r = radeon_cs_handle_lockup(rdev, r);
 	return r;
--q
2.43.0

