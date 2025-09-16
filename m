Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F35C5B5A3A0
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 23:08:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCDA10E814;
	Tue, 16 Sep 2025 21:08:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jH8Nr0g5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2012D10E7A9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 21:08:37 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-7761b392d50so5271483b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 14:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758056916; x=1758661716; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=MHrHFP5MPt+x13uBQjsAS3MLabqAvc4S+eyVJ4ZEW6M=;
 b=jH8Nr0g5Sl3mi7PkTLPVqvTa2HVxawV41wMLuBdSKe1A1vJ5pEiSe1lOtmBgkm90WZ
 tWUNS09KQETwTjZS2DB5vbyJwV41tqynxoPcnZUQIzJavpeJ1JbY8MsYMG6jfsIPUUi8
 41rE+b4wp8yE5xCNhDlJe9sMPog9lIsIsy+ObJO9KKmetvCzEIkZW4MaG7DhknqU+KNA
 y+ud02t859+feJ8/oBECh8lO/8AAzUveUZdViesANOESZ8nzLFkwOgFlSU3+0p1uKDBY
 5IXu2VOVkfWh10iaMIowigpLdy94ey6edesf/X/TyvYv4xzjZ7xhKu9tf8rsXzO1Jvbc
 Y0/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758056916; x=1758661716;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MHrHFP5MPt+x13uBQjsAS3MLabqAvc4S+eyVJ4ZEW6M=;
 b=c1ManiPLXC8EgJ6jwuxegl/g+k50LRe2Iv2QDFMztfUdm6bXA7CRra4BkJmKwT6sHz
 tRQuqP88NDi8bxc9SI/LNnfdwTIFXcDwFhNFjvW9I/xrUOu2Ff05Rx4qlESiIEg/Hsl5
 KdjPvZbIhEx/ouqtPW8EGHqP6+chZBumvavraDcq2S7ZCnDx4SK73SrTmVS9xQDpFPgh
 uJjcX49S0AUE/kok5pZc4f4H4qm+JvEbNvmpvDyjfVCEJaxlO8AQP401pT9y/fZ31BsG
 2/x4JhfGfdLqeaosOJQkrPl3hKU9htp5JLbUntW3DlN3BcHQbYIrQb2pUCHPVLx/2Fl2
 +1Ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFYB+VRBn5Ex0pWk0HA0Afa5wp2J7IXp8kVLIw19+KZuKFMbssdjt5+s5TAp9u0vabcpvaB926Q9Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWmVUJ7Fg9wRuNQ/Ev4RDmrsnpE++G/XBU3S3Nnez+KEp7Qs+m
 R1EjThLwr3NUSL38pdCp0jEbq0HtQguC/PACgXpQkwCy5awYBwmp2N4u
X-Gm-Gg: ASbGncts6pk59I2CrWq7GR1ExahdWkjCaHRi+98Ux3l5mNF0zK7wWffEcOc0Uniuc4w
 Gbc9y1SpNleLR2mKFCZvoYx6RwWhYrQjEi+JNQq1ZGDiQxckwHfsHKtVubCydh8aOqIeIQ85Zxp
 SjHb71mYtRP0tQ6ZG7P4fCIsldaUV48JgtEb/Y/Tj3uaa5AJUdsmHp+Po8GMEeMiTuv5SnXPXcy
 cPU/GPIU7W+bN3RfqKhXEhoZ2B75w9xnK4cb8nJFypKVACSSIFiMdERyF1z08BsywNkSD96h7cx
 xycdAp00/ySaBOy/We0ylE1mikVJukI/Vr5e5Z+cC/2/oSK8O6yjfsoe/eIFXr8mO3jkBf2BJNV
 KK5MIOrSJxUDGRTXfyfhOrgjxZF9EB/3L2OLfP3b7D2ymlc2X7ZC6EoXEJ3+ETPTWqfZntDCKwe
 OTkzW2YQ1VOw==
X-Google-Smtp-Source: AGHT+IEqBZc84JrKRfpK2hpWsRx1JO903hwP4K4WPYBZZa4WtL5bz4O/AOfS0bSJOZU43B5FoEPqfg==
X-Received: by 2002:a05:6a00:23d3:b0:772:40ba:61c0 with SMTP id
 d2e1a72fcca58-776120790b5mr17649741b3a.5.1758056916607; 
 Tue, 16 Sep 2025 14:08:36 -0700 (PDT)
Received: from localhost (185.3.125.34.bc.googleusercontent.com.
 [34.125.3.185]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-7761f8b1bdasm11537334b3a.60.2025.09.16.14.08.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Sep 2025 14:08:36 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Grant Likely <grant.likely@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 05/10] drm/panthor: rename and document
 mmu_hw_do_operation_locked
Date: Tue, 16 Sep 2025 14:08:18 -0700
Message-ID: <20250916210823.4033529-6-olvaffe@gmail.com>
X-Mailer: git-send-email 2.51.0.384.g4c02a37b29-goog
In-Reply-To: <20250916210823.4033529-1-olvaffe@gmail.com>
References: <20250916210823.4033529-1-olvaffe@gmail.com>
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

Rename mmu_hw_do_operation_locked to mmu_hw_flush_caches.

Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 727339d80d37e..7d1645a24129d 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -622,8 +622,20 @@ static void mmu_hw_cmd_unlock(struct panthor_device *ptdev, u32 as_nr)
 	write_cmd(ptdev, as_nr, AS_COMMAND_UNLOCK);
 }
 
-static int mmu_hw_do_operation_locked(struct panthor_device *ptdev, int as_nr,
-				      u64 iova, u64 size, u32 op)
+/**
+ * mmu_hw_cmd_flush_caches() - Flush and invalidate L2/MMU/LSC caches
+ * @ptdev: Device.
+ * @as_nr: AS to issue command to.
+ * @iova: Start of the region.
+ * @size: Size of the region.
+ * @op: AS_COMMAND_FLUSH_*
+ *
+ * Issue LOCK/GPU_FLUSH_CACHES/UNLOCK commands in order to flush and
+ * invalidate L2/MMU/LSC caches for a region.
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+static int mmu_hw_flush_caches(struct panthor_device *ptdev, int as_nr, u64 iova, u64 size, u32 op)
 {
 	const u32 l2_flush_op = CACHE_CLEAN | CACHE_INV;
 	u32 lsc_flush_op;
@@ -680,7 +692,7 @@ static int mmu_hw_do_operation(struct panthor_vm *vm,
 	int ret;
 
 	mutex_lock(&ptdev->mmu->as.slots_lock);
-	ret = mmu_hw_do_operation_locked(ptdev, vm->as.id, iova, size, op);
+	ret = mmu_hw_flush_caches(ptdev, vm->as.id, iova, size, op);
 	mutex_unlock(&ptdev->mmu->as.slots_lock);
 
 	return ret;
@@ -691,7 +703,7 @@ static int panthor_mmu_as_enable(struct panthor_device *ptdev, u32 as_nr,
 {
 	int ret;
 
-	ret = mmu_hw_do_operation_locked(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
+	ret = mmu_hw_flush_caches(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
 	if (ret)
 		return ret;
 
@@ -702,7 +714,7 @@ static int panthor_mmu_as_disable(struct panthor_device *ptdev, u32 as_nr)
 {
 	int ret;
 
-	ret = mmu_hw_do_operation_locked(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
+	ret = mmu_hw_flush_caches(ptdev, as_nr, 0, ~0ULL, AS_COMMAND_FLUSH_MEM);
 	if (ret)
 		return ret;
 
-- 
2.51.0.384.g4c02a37b29-goog

