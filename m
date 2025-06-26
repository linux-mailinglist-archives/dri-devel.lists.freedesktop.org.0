Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A49B2AEA80C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jun 2025 22:12:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC5310E91C;
	Thu, 26 Jun 2025 20:12:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="Xie2K40s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0674410E91B
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 20:12:10 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-748e81d37a7so1020774b3a.1
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 13:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1750968729; x=1751573529;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J37VsMKa4toiTZ1dORnAYhhjgJLIKWns/qS0ScMfNYU=;
 b=Xie2K40sawXPj016cL53ZiPFF/IHFbynN20xaJZxUtspFfxiRqzw8nZxV1dnwoGZQx
 NKbS0lFW3F5Zl8gapmA6pDvyGu8UUaNLiplp2OqPay+wCoCKahD9lQZmRKoq/iRTGlEo
 jzKMtLcNvQh8/e6VCnLbdw/3V3WyualmDyOh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750968729; x=1751573529;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J37VsMKa4toiTZ1dORnAYhhjgJLIKWns/qS0ScMfNYU=;
 b=MmMxtzu35g2Gz8hYN/LScLGvcVn85HLyG7l/5jHBRjgH//6l3CXB1BCMmaq/B4BFJ/
 0QI0hPz3uP3Txfg8ArlRiOOUFVEHUVVEZk8MRX55YaLKmZCTSjoHsFwYv82mLKLuOrD0
 gRJTGZemBi8tZ+Vjl/XENnR+K8lX/lxUjyGYQi9bIyAXQOop/jeE1901hyDkwv3m0p3Z
 xpQ8eiPQVDw0dtJu8Fig1maf69cQc1MVwLGfuDCCfwokxc0IcbCCa+r/QNHL+3fwUDMD
 QdLcZUICS2DJX1W9VnNIcfXkTlcPyxtlDZg0/bUyfQU8YgeOUxEbv3ax3kzBuWXU0c84
 GghA==
X-Gm-Message-State: AOJu0YywwjebqBxnXTD/ZJ+Up1RU2+uNVgULV28EhWoTG5KcI5n9OmLN
 lzLSlJh+n95ZfRfLNlLwr/3YPVZX9zoKRnStKIZz90Px277a7vhwPSqA0VyAta/wSolNEPLaRDZ
 7nPY7JhACckxnmNAVrHgLnZjiN53HHno4h6J/FIAEtMIDbY1T2uV3IhODDD1woiSC03RxKwFfOh
 qJAXXm6Dgin9yuwdYiT+6xBIL7QSlSDyqj68RQcBndK4p36eRfHG9BIw==
X-Gm-Gg: ASbGncv89ROOTVjhvwSF3Q/DuO2RJbi92WfwG59HJzIuQ5ZoO2r/z0Pj1sgIRGMpnoV
 aFbYop9bGv5jPFA9CpQgGgHDLJcZDHx2hOmTblC9Fpfi0n3wH/tJosN779VA0dxoSkQo+CgKbcL
 CpnxafWwmiMXumD9KNDXU1iQs19przRJOjl3/LITe3y0Dara+taLHQJRK51rXXAOWHffpScikD7
 CL1h0s1t0o4/ZpIXo+vwUuP02tJxFO3UvJ1+1H1s7Nu57uhPgCYi2djcq84uqyKL1TBCd7E0sQW
 b4sK4VGnsITT6bHZgl32OCokIWovF2IsP/iJkNAkH+QJuPWsOi4cDh6+s+oRZ/x1nttXxJxaQgv
 DEIsH72TjiPa3wptpQ1kbUipV90xv+2ZQ1fThW/KVMw==
X-Google-Smtp-Source: AGHT+IEolIxJ/c1xrZZnRUjWRrrzw+gdj6JiOdYwIEmjT6IvarhQrd5MICtyjGa1/QxVkOHnWGEQkg==
X-Received: by 2002:a05:6a20:1592:b0:1f5:97c3:41b9 with SMTP id
 adf61e73a8af0-220a12a6771mr430832637.5.1750968729034; 
 Thu, 26 Jun 2025 13:12:09 -0700 (PDT)
Received: from plasma.dhcp.broadcom.net ([192.19.144.250])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af5574390sm517434b3a.90.2025.06.26.13.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jun 2025 13:12:08 -0700 (PDT)
From: Ian Forbes <ian.forbes@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: zack.rusin@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH 1/2] drm/syncobj: Export drm_syncobj_destroy
Date: Thu, 26 Jun 2025 15:11:52 -0500
Message-ID: <20250626201153.1714590-1-ian.forbes@broadcom.com>
X-Mailer: git-send-email 2.50.0
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

In order for vmwgfx to use syncobj and maintain compatibility with our
existing userspace fencing IOCTLs we need to be able to call this function.

Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
---
 drivers/gpu/drm/drm_syncobj.c | 13 +++++++++++--
 include/drm/drm_syncobj.h     |  1 +
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
index e1b0fa4000cd..dcb1dfa68138 100644
--- a/drivers/gpu/drm/drm_syncobj.c
+++ b/drivers/gpu/drm/drm_syncobj.c
@@ -633,8 +633,16 @@ static int drm_syncobj_create_as_handle(struct drm_file *file_private,
 	return ret;
 }
 
-static int drm_syncobj_destroy(struct drm_file *file_private,
-			       u32 handle)
+/**
+ * drm_syncobj_destroy - remove a userspace handle from a syncobj
+ * @file_private: drm file private pointer
+ * @handle: the userspace handle to remove
+ *
+ * Removes the userspace syncobj handle @handle from the idr.
+ *
+ * Returns 0 on success or a negative error value on failure.
+ */
+int drm_syncobj_destroy(struct drm_file *file_private, u32 handle)
 {
 	struct drm_syncobj *syncobj;
 
@@ -648,6 +656,7 @@ static int drm_syncobj_destroy(struct drm_file *file_private,
 	drm_syncobj_put(syncobj);
 	return 0;
 }
+EXPORT_SYMBOL(drm_syncobj_destroy);
 
 static int drm_syncobj_file_release(struct inode *inode, struct file *file)
 {
diff --git a/include/drm/drm_syncobj.h b/include/drm/drm_syncobj.h
index b40052132e52..9552f34a0f27 100644
--- a/include/drm/drm_syncobj.h
+++ b/include/drm/drm_syncobj.h
@@ -131,6 +131,7 @@ int drm_syncobj_create(struct drm_syncobj **out_syncobj, uint32_t flags,
 		       struct dma_fence *fence);
 int drm_syncobj_get_handle(struct drm_file *file_private,
 			   struct drm_syncobj *syncobj, u32 *handle);
+int drm_syncobj_destroy(struct drm_file *file_private, u32 handle);
 int drm_syncobj_get_fd(struct drm_syncobj *syncobj, int *p_fd);
 
 #endif
-- 
2.50.0

