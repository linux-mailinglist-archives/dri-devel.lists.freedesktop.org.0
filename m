Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E0ACBDA01
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 12:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F1FD10E42A;
	Mon, 15 Dec 2025 11:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KtRBnVrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3228510E445
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 11:52:50 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-477a2ab455fso37036105e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 03:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765799569; x=1766404369; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HLPAAzkZX672SPFPNzY//QzztDCRnjOssmaLt2g73S0=;
 b=KtRBnVrUiolzEiUfoJ0yw5m6MWBa24sxBkcLhctvZgVXoBcJL3n3u3FhR+Uh/Eujz9
 hTJAot37AvNQ20pf4tGgEAL59a8fjwXmUqhqmFXVR309MKIL0xXk7Z7nxvAKlzRSieXK
 ys5/obnNGU0OOVFLAcbAwhOhPHpnkqh17zW634+mbO5wdqvXNSiObByJhCYWKndkHQn0
 2tvPXWsSq/u/YB3yizgn0xatQDBRZCMx0gjA+m8jv9l0W46to/lpX8QF495y6CKUa99m
 kzExNw6ueZ0dOUOTAKc1bPXmdx3fg3IJGYbP2InTcs946N22/x23sxF/lgWpNVbPOhmX
 KzUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765799569; x=1766404369;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HLPAAzkZX672SPFPNzY//QzztDCRnjOssmaLt2g73S0=;
 b=RtNHqRkzdJI4kiOYJgwAnz+M+0oaCJNwBKCCJPvMIhHgt/oyNx7zLFEkdvwjkOyCON
 QKhXVm8BCS0prt/8HPuZZJVk4MtuSFmvrlj0m/bUVbr4MiA6Sg+M65eJUBpiVMePK71X
 SvsW2aZ5QdcTtfgTEw6OET8ROTcjcFhiPmBBDDBT9VJM+ROVH6HL+5Z7NC9fcWmwGqgh
 MK0QuMDm3/oTGADOEEZNeS9FaSeJdbFXAbqGjmqsqUwrZ56du++P1aGZFltT3ThBOBwk
 OH9r8nxBt152rlDIAaLxWRa0EJIpazbf5gWub7e6jIX2z+u8I6ZLxo0k8x2k8XkrmNEG
 xMYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFPWVGsRVl9GApc1ImxvxImEIwLVNQ0ARWKUs0X6AU0oUnUWBUP1VVlE9q+AzQizPAXuVzXOI85/M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHQUQnB1BXvqLZ9TSe5zfh6ERH9imd56qgOXNricyc9aOPo3CU
 SnLcCGGw2jSA3Vdt4Fo08dkqv67vIKo8l/DThlbdI8lH/yOsD6+x9KIY
X-Gm-Gg: AY/fxX75ICljLFIj19G/4J58GlgtqscMSK3th1hWO6luxwtDwkphPu8zFHrhik9Ghxw
 uRUjZOYC33YEVZRsfRFgAg98XvZQWytd9cywXskKJps/02FsNqcGsGm7D5dpAS7oboJtsQ5FiuK
 iA4AuEG8+D3pRgWtoZ6egB8PmyOtSm1Ca0Th07Rp/0hwa5MEeiO9eo/Rw11mwkX13BP+USkllHh
 3NhnMpDvYvJiRDOYwA+o0NCn9fb9tcKE2EdBrpE0ZapggjWxfXuS/VTnFPeb+DP5D9FvOjMP0LE
 gZ/Pq+j/kel80drhQ8KKnN6EfHrll3xO2cGfz21fDxBjRVTSv6n8r9p6P8e8gfEImdk6jbwK58d
 dmeNVftQfynmd/nSOtsV/9CMMREsxqs4Jtquu10/OeQ92iZ2HWPj+jq1VLVemzPSz7EOdMsr17N
 QKGWX/iHijuw==
X-Google-Smtp-Source: AGHT+IE7KWwtiusfSz6ItVQJ6jWC1LkkJEmabme0vGMp/wCpVgK/njPeo+/ZPD4RDxUphEA/jNlIVw==
X-Received: by 2002:a05:600c:4f84:b0:475:dd89:acb with SMTP id
 5b1f17b1804b1-47a8f904528mr113128355e9.22.1765799568419; 
 Mon, 15 Dec 2025 03:52:48 -0800 (PST)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42fbc6e3392sm17181159f8f.13.2025.12.15.03.52.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 03:52:48 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdkfd: Fix a couple of spelling mistakes
Date: Mon, 15 Dec 2025 11:51:50 +0000
Message-ID: <20251215115150.3581277-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There are a couple of spelling mistakes, one in a pr_warn message
and one in a seq_printf message. Fix these.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/amd/amdkfd/kfd_process.c               | 2 +-
 drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process.c b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
index 2f66ebb5b029..adffa44fff2c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process.c
@@ -830,7 +830,7 @@ int kfd_create_process_sysfs(struct kfd_process *process)
 	int ret;
 
 	if (process->kobj) {
-		pr_warn("kobject already exsists for the kfd_process\n");
+		pr_warn("kobject already exists for the kfd_process\n");
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
index 5f8cda4733f9..d7d37f01f51c 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_process_queue_manager.c
@@ -1115,7 +1115,7 @@ int pqm_debugfs_mqds(struct seq_file *m, void *data)
 				break;
 			default:
 				seq_printf(m,
-				"  Qeueu node with bad user queue type %d on device %x\n",
+				"  Queue node with bad user queue type %d on device %x\n",
 					   q->properties.type, q->device->id);
 				continue;
 			}
-- 
2.51.0

