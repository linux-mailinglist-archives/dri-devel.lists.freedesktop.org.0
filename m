Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B4DC249D3
	for <lists+dri-devel@lfdr.de>; Fri, 31 Oct 2025 11:50:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B406410EBAD;
	Fri, 31 Oct 2025 10:50:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DicQunUe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6DC10EBAC
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 10:50:02 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-4770c2cd96fso14828155e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Oct 2025 03:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761907801; x=1762512601; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4dA6vbryG5FJTzOnmpJ+a7K24uQqVYeU0GUEiTTytsg=;
 b=DicQunUef77PuftO265tufcG5gfTfNiJeXq8O642B73hta3ep/bIOKDuOm9j/JLWcK
 ykh2uoygji8Ml6pQIv2cQ3thrVLa4+fy8p4vA7/MhhQYFsqjHsmyC37QzSqZLl/DEj8j
 0WaBuDTFqur+W/MDsYfauiPihHVuvrpADmW544mFcJmoc+Xd8nft3GgtMRnIYy+9M9rf
 mSkK7K734dqcAPOYK2v0pLE1ljCrcgxPVote7r+9uMsSg5fKzmZ0e0vJZ8BvPdk+t9AG
 160V+L0IpWB0me8DRy8t1CN4njo5AAqHfBYBPhLodmd47wGSagI/Nz02ruwCOWTnQI0z
 JnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761907801; x=1762512601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4dA6vbryG5FJTzOnmpJ+a7K24uQqVYeU0GUEiTTytsg=;
 b=GbpfC8/XPgiWLqTwAWb5XqrUM3Cl8jHf8lK4jR41M4042zTFr9LrVZXByuea8kJM9F
 RdD2qpiZoCKEv0Of7cODQqZ5+eurxPo6OHJ5LDZof35Lq3T8+VH2uDGzyspbx2Lsjz0C
 1ujrLT9n8++t5kdHAp6ukJvTu5vV3NAY5QVrCZamuqNYOIlFGuFvXu0IiXioIwIVa2QL
 pfb8aAVdW1RHDf32cckTU1XMHEtglYewXy9G5H/TTnl4VJ7pTh2C75mdZevVAns4ZMBB
 J6WrXp7BMYy+2M4Ifj4+cMWFDxCfSOLxY4pP2PxZ9VXRnR6vY7uNv1CzZ9eLhmBeIODL
 TUwA==
X-Gm-Message-State: AOJu0YxtFs5EGXJ0crjtcKZaVQGKaG2g8gg41e3xSX/g4SUXWkSLBQq5
 n7yb3/74K/cGfeuJIwSKI5WhJ3Sl3J0qO+H7BARbfx/OxaYvUicAiXmh
X-Gm-Gg: ASbGncsosBkFnECoBU8yP6D655t2I+moXjyF+SDKsXwxtIpjOXRpEPGB9Nl263SE1Ec
 fBf5aAURnuuOOGh4GfzEMlC44eWAEkN9jw5N8ma0ScC43hWfs59iEYqyEpsQEaiwnann0fqoFjK
 g+0ch49gUmt5PYa+xPT+ERTh8DeCLDWkD7hM+zK6LZSjnWIGTvfE+zBQKox3brhxm9+gkW6x8VX
 0jm1ud/kmsjJtLUteFcGUihkod6ALqMS0spQBVg5vEH8wZUU/3yPggs18MH/w8hyLYldo3NqhlW
 56Zipw1LqhLk/fF8M1Ve0m1PhC7P9W4Is0CnGkcjkUjlTnGF2LbtnDPCOZ7bv9itnhz/d1X6Ec+
 ndL2wkElZa1EZ6Mjw5q0kK0Lmq/jR4eEgP8NF74P6BABRw6h2g1MN6q0wgZQdQFcFjaxu4ce099
 2+JRKKERVQRvA=
X-Google-Smtp-Source: AGHT+IH/r8r9Jm7r+3RjWu3MCytnOGOVgf0e0BCmGVPobUnq/iGDiuY9nhgRfW9d1lM1G2bqZQoWNQ==
X-Received: by 2002:a05:600c:4591:b0:471:9da:5248 with SMTP id
 5b1f17b1804b1-4773087b19bmr24942025e9.26.1761907800917; 
 Fri, 31 Oct 2025 03:50:00 -0700 (PDT)
Received: from fedora ([154.182.161.198]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fcf7d07sm19498025e9.9.2025.10.31.03.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:50:00 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH v4 5/5] drm/nouveau/drm: Bump the driver version to 1.4.1 to
 report new features
Date: Fri, 31 Oct 2025 12:49:24 +0200
Message-ID: <20251031104924.10631-6-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
References: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
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

The HW can only do compression on large and huge pages, and enabling it on
4K pages leads to a MMU fault. Compression also needs kernel support for
handling the compressed kinds and managing the compression tags.

This increments the nouveau version number which allows NVK to enable it
only when the kernel actually supports both features and avoid breaking
the system if a newer mesa version is paired with an older kernel version.

For the associated userspace MR, please see !36450:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36450

Signed-off-by: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drv.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 55abc510067b..e5de4367e2cc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -10,7 +10,7 @@
 
 #define DRIVER_MAJOR		1
 #define DRIVER_MINOR		4
-#define DRIVER_PATCHLEVEL	0
+#define DRIVER_PATCHLEVEL	1
 
 /*
  * 1.1.1:
@@ -35,6 +35,8 @@
  *        programs that get directly linked with NVKM.
  * 1.3.1:
  *      - implemented limited ABI16/NVIF interop
+ * 1.4.1:
+ *      - add variable page sizes and compression for Turing+
  */
 
 #include <linux/notifier.h>
-- 
2.51.1

