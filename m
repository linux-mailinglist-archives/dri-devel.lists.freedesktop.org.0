Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7E8B2908F
	for <lists+dri-devel@lfdr.de>; Sat, 16 Aug 2025 22:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E1F10E196;
	Sat, 16 Aug 2025 20:38:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="EHhwWnta";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1021D10E114
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 15:26:24 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-76e2e8aff06so2317197b3a.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Aug 2025 08:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755357983; x=1755962783; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+mnxj9j4ujZHlmAKFH0J5lQUtJG4DrJODQ1fx+MjoZI=;
 b=EHhwWntalf1W1tJX45HmnDCorI+FjUQnIHdtmpTZT1vk9RTexiR9GgHxB3A7sjq10L
 /SgS+XoMh4FhzyN836qpb5li2l0pxt+XoXW9NOQwKb5zXlsdvywyUnTQ5jkBewCWlq44
 3+B+E4FjEi7pH9x5ff3lkTWpZHJSpiWnaQb58R+fYjvGGxyog7+1dcJ6CSL3ItDZiW7x
 8kfZsvy8KpOS+9OUI8OFjRFoIKk8rMmm3ij+bjoGjRDC0FlDh5noXbk97usm958Zo4z9
 HezbN7AFbLDriCnRHhdQYW3ME4Q17IUC0VYBWf9rGESAP43OclKXkTLtd8wW4j0Epya6
 GgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755357983; x=1755962783;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+mnxj9j4ujZHlmAKFH0J5lQUtJG4DrJODQ1fx+MjoZI=;
 b=oGr4RpLG3Xmr1HG2DFzMabHr1LKWtXR3EO54BvFpmHHYiM8mjaU4zJkVTNsuBvEohz
 IHi9w32T/BUQ0P7ofSutzqtu8oPDnYLDmHtV1ho5nU84FWT0b47KMqY/FlEKP64Dzbpr
 hj0TIYu5UZ4TsSMiMHhVfTgzPqyS+kSo7n/21LkqSqlITzTK6aLV0MAtE6uebE1bG2Q0
 TK+cgf//UZYEF5LvDvSS313m4TVGp5Z6fY4w6R+hcXINeSgroKxjG0yA0pvw6yNR0B6A
 NoldyVpITs8kFeGWGsBRSHUTf9Zsy/oRRgHxcbihTpgLSaFYnYjvsZFw+MWBBBToOzmk
 iccw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoI073leOz9uzzyBmL6D9woixf0MkHVKQAi5+evzCXZ54CCzCEpr53rm40qrXhPsRwK70FdrZc3Og=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yye6jR7d8KBgFSsiq59Faf73MvfDyNjIBGpe4gIc/v3z8atAa+j
 a8Vib+7N/f5tcu6VqS02kwnLsmYgfIByf+/bF/7hMh+KbcpVbYG3y3ew
X-Gm-Gg: ASbGncs8DgWFa6frboTcIoh87jPeQmbqZc/59yA37lY3hSD4v9ZrLtmaRfl887GYDOj
 ucXhrdHc+uugQy+oALD2aTVBkbe9B8js1sj67nXGQWhLJJXySat38+uB4YU9HSxWupf9gHR7dgg
 Ueed35erO4bX/jLKEzt42INV4PLBXcEECS7kMXWUtsXdvcsNlhToTsmvwPyUPQFmhfiC+c45Idx
 +Jw3guOqL4u1ZdpD9G4VOQg9rWo36xA7OnhZ1Scia33VKl4/szt+I7vImQprmklHPJpCWEqL+yc
 PggTf9L+0o7Opz2zEj0ltDyiNZk+loaF4PrBKqMf1QxeEridW0BwOIrWrwZZtpDfs0uBgdsG2mP
 xDIUHazivnC0l1yQhU0o=
X-Google-Smtp-Source: AGHT+IFw/4392JeGo+4oIC6CNMmWWYGFfVUHQ0o5Vvd3MPIQwmDgr00+svvnyoZjozRFHuSkH1e3Gw==
X-Received: by 2002:a17:902:f64d:b0:243:17f:b767 with SMTP id
 d9443c01a7336-2446d75ce15mr85010495ad.25.1755357983551; 
 Sat, 16 Aug 2025 08:26:23 -0700 (PDT)
Received: from Terra ([2001:df0:b240:417c:391a:2d23:2970:dee9])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2446cb09ff8sm37861245ad.50.2025.08.16.08.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Aug 2025 08:26:23 -0700 (PDT)
From: Athul Raj Kollareth <krathul3152@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, skhan@linuxfoundation.org
Cc: Athul Raj Kollareth <krathul3152@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel-mentees@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gpu/drm: Replace the deprecated logging functions in drm_gem*
 files
Date: Sat, 16 Aug 2025 20:56:02 +0530
Message-ID: <20250816152604.14667-1-krathul3152@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 16 Aug 2025 20:38:00 +0000
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

Replace the deprecated logging functions used in drm_gem* helper files
with their appropriate ones specified in drm_print.h.

Signed-off-by: Athul Raj Kollareth <krathul3152@gmail.com>
---
 drivers/gpu/drm/drm_gem.c            | 4 ++--
 drivers/gpu/drm/drm_gem_dma_helper.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 4a89b6acb6af..91f528d8900f 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -102,7 +102,7 @@ drm_gem_init(struct drm_device *dev)
 	vma_offset_manager = drmm_kzalloc(dev, sizeof(*vma_offset_manager),
 					  GFP_KERNEL);
 	if (!vma_offset_manager) {
-		DRM_ERROR("out of memory\n");
+		drm_err(dev, "out of memory\n");
 		return -ENOMEM;
 	}
 
@@ -805,7 +805,7 @@ int drm_gem_objects_lookup(struct drm_file *filp, void __user *bo_handles,
 
 	if (copy_from_user(handles, bo_handles, count * sizeof(u32))) {
 		ret = -EFAULT;
-		DRM_DEBUG("Failed to copy in GEM handles\n");
+		drm_dbg_core(NULL, "Failed to copy in GEM handles\n");
 		goto out;
 	}
 
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 4f0320df858f..a507cf517015 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -582,7 +582,7 @@ drm_gem_dma_prime_import_sg_table_vmap(struct drm_device *dev,
 
 	ret = dma_buf_vmap_unlocked(attach->dmabuf, &map);
 	if (ret) {
-		DRM_ERROR("Failed to vmap PRIME buffer\n");
+		drm_err(dev, "Failed to vmap PRIME buffer\n");
 		return ERR_PTR(ret);
 	}
 
-- 
2.50.1

