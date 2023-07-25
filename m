Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 975D6762023
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 19:29:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5964910E3F5;
	Tue, 25 Jul 2023 17:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AADCF10E3FD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 17:29:47 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 46e09a7af769-6b9b835d302so3658256a34.1
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 10:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690306187; x=1690910987;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wYTE2oqQMREoQhc08rQlAEBlcvLWLC+TPrtjtfK+Xts=;
 b=oj6lTPnRbCuuRArNHvqR4nn2ZTJ1OpG8vq4JCQm3wOwdyXap4F3cO6hokj8D6RA0I6
 ve7Oa6xHno5tZwuLmHi2d/HJhzw6/4XdnjmRVWB6uRlRofmNNeQt0hhVa9EKhyC7TlP2
 ZicQ2uBCamgky7LPEbwL/XopbjotRaB0+c/ZwLQsgRSh3F5nsVK1Sjaz+i81PyWfqkA9
 yoIahqI2s9bKeypL84y/+kgR05FcTM5t2EH2OWh0WRk3e/B4MpqdcJGXAGcWJx0xFlak
 R6nMu1cg7zga3x8HFOpmHmRXMrjB9vB3LGWYDATEQoKSWiprHps1ykF0EBU1ffjK0xF8
 36lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690306187; x=1690910987;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wYTE2oqQMREoQhc08rQlAEBlcvLWLC+TPrtjtfK+Xts=;
 b=c9O1aOcIc8Uwase5A+EEVgzY2zBzwhT7sh8w9dab3s07Bb8M5MNJkuqBKBIv6ynzNN
 NzYT/VcGFrDS5hi9nU3TAoelwE8+0v/1FyNebHod0PgoElECCqF9zHqCDPA2eFabtePf
 Xr1IpBKGpw51+eQvdAwq6oa4hHHLATKTF8H/Q7FVMF0Ug0wRKb6pNHPn4HJZeDD+aZGy
 7azOrAaXZ2vhdgZ5jQ8ulZOkv5SvuI/CTCTb3NciI3ZwV2Qvc3sfFMZmq7IvAF55ceGl
 6e5CuC/A7BLRbtfxRaQu0ECDPJJBT8rPSJufF4SygrgcSyOYcOme8ha5M1DxnGCj89Nw
 2x0A==
X-Gm-Message-State: ABy/qLa9XEBNxgx2qZAjWRS9P129RDZwUvQ7tVC5aduL+YSriHEzGmmo
 eoyVGHg9lJPx2DiuGq+d9rbLL0DyOalVWg==
X-Google-Smtp-Source: APBJJlGRI93PYnT5GmUmYJT0Fx3XVuDDrSRUs1GPY4FrRLeCbK8oynJsrrYot0BylySE3lOwWvkpWA==
X-Received: by 2002:a05:6830:1d46:b0:6b8:8f20:4cbc with SMTP id
 p6-20020a0568301d4600b006b88f204cbcmr24007oth.13.1690306186785; 
 Tue, 25 Jul 2023 10:29:46 -0700 (PDT)
Received: from local.lan ([190.97.20.29]) by smtp.gmail.com with ESMTPSA id
 p6-20020a0568301d4600b006b8b55297b5sm5215201oth.42.2023.07.25.10.29.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 10:29:46 -0700 (PDT)
From: Jorge Maidana <jorgem.linux@gmail.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/gma500: remove duplicate macro definitions
Date: Tue, 25 Jul 2023 14:31:07 -0300
Message-Id: <20230725173107.9593-1-jorgem.linux@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Jorge Maidana <jorgem.linux@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove identical duplicate block of macro definitions in
drivers/gpu/drm/gma500/psb_drv.h.

Signed-off-by: Jorge Maidana <jorgem.linux@gmail.com>
---
 drivers/gpu/drm/gma500/psb_drv.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.h b/drivers/gpu/drm/gma500/psb_drv.h
index f7f709df9..6204a745d 100644
--- a/drivers/gpu/drm/gma500/psb_drv.h
+++ b/drivers/gpu/drm/gma500/psb_drv.h
@@ -161,14 +161,6 @@
 
 #define PSB_NUM_VBLANKS 2
 
-
-#define PSB_2D_SIZE (256*1024*1024)
-#define PSB_MAX_RELOC_PAGES 1024
-
-#define PSB_LOW_REG_OFFS 0x0204
-#define PSB_HIGH_REG_OFFS 0x0600
-
-#define PSB_NUM_VBLANKS 2
 #define PSB_WATCHDOG_DELAY (HZ * 2)
 #define PSB_LID_DELAY (HZ / 10)
 
-- 
2.30.2

