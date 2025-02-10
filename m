Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AE4A2F8B9
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 20:35:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948E510E1DA;
	Mon, 10 Feb 2025 19:35:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bQTU10ef";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAE310E1DA
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 19:35:00 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-21f710c17baso37988905ad.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 11:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739216100; x=1739820900; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LEnFc6ySppJhn5eOPH+ZbgqsgIN276Lx4jIjozuMzPM=;
 b=bQTU10efFumtL28hVEbG7LYobILFHf1Rtx3/mTZvTOqyE9+gYNbzfQvhgH9I4NXntO
 iqZZILEMHYVBDkiyE4RoCBfD2x3o9Y/1Ja7qOn1ylGqpn0OidoVNN89dCKXTE+uwU8Ao
 wBlKn8HtyoXhiqmhklP5q+Heeb5gQzMqHBi3sCgj6fbzYWfw/TR547QDDMVjnmIVoZaE
 ycQ/GvKmTJjPAhikELFeyHfqQga9Q90ow/9sAkQ2lYDUJ4gZswjxzX5z1maw6KjelGhl
 G7BWyH/jKVDxNkFbk9wJ8i7LH6XuB453xumXzWg18rgnSds90W7aBTyb6g1LUEX4bfjP
 nVWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739216100; x=1739820900;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LEnFc6ySppJhn5eOPH+ZbgqsgIN276Lx4jIjozuMzPM=;
 b=eBd0JBnr/Pg/5DEyN6P/PUOXb7ixyrDZiMId8Pn0kE0PcSjsRp9Ub2xwc5xHRVLNhH
 RiaSyEbltJrwikheq7XEXpWd2ux2Wr80CeS0uv+a96FubTxnlUdpTp3ni0eHCUtJHUg/
 Mu+SNnb5fFAR0aTjxCYLDdayO70OylsB5/QtoN7r3ogu21hwxKQP6ZsqG/lbGJwx1HS/
 lyzXwoMibp62mqYxg5qlYE9VlCIhApGUb3Sk7DLq1hVKyLmm3KBVSe/7RK48hPYMQJMS
 g5f4AApL5r+uQFoESlbyVyAWixZ8Dc9aBVLAHcvVvAASR6G1qxDRrAxD3FaUdGKBld44
 5FOA==
X-Gm-Message-State: AOJu0YwtWVDOiWKepUzOBtmAVN6wX98jP6CaUEoldC/yyzkVBkYMK5Up
 M90GGy78Wmovb/NSmIGWmUW9OqK6I1Lo1fE6HnOtQjwY9foWN3P+
X-Gm-Gg: ASbGncuWkCGtjfWZpPFl1zACifn1JGaNnfJd58SYwWKvYFS2gF0kBC5/spXzWoEJSc6
 mtpDrgBDiThbn7z6uqKi9OTiMffmzJNIiofEYf6iHsfHAX3zAYZW368iZDvUDzeyQUCPHydWXlD
 rhZDsdceK007joFGa/6BIwtWLDeYmNeYqU93sdcxrcVyERMP/O7ynUsRflG6MFwiANSdrgJvBad
 25vmOntjh3aiPTLUb8RlGe/EtklxO4Y3j0I74LLVzmDDc6xZLueO9s0YJTxlkIgEjXb/zjEPvXh
 HazbqcszV/U+Nb62qsbJ7ZOjGqZT7qKPJaEtot3+P9ACjYenGd5mOVOteKhuwrnPKO5YDw==
X-Google-Smtp-Source: AGHT+IEK/KAQ9CEqjs9C9A769BPha4w2+cImXxGbjwGC2NSCBTkba7x81HpnqS4m8Nv71ZJ9+GbZiw==
X-Received: by 2002:a17:902:da8d:b0:21f:6cd4:8c32 with SMTP id
 d9443c01a7336-21f6cd48cfbmr204130635ad.22.1739216099621; 
 Mon, 10 Feb 2025 11:34:59 -0800 (PST)
Received: from localhost.localdomain (c-67-160-120-253.hsd1.wa.comcast.net.
 [67.160.120.253]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3650e6c0sm81345045ad.22.2025.02.10.11.34.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Feb 2025 11:34:59 -0800 (PST)
From: mhkelley58@gmail.com
X-Google-Original-From: mhklinux@outlook.com
To: drawat.floss@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, christophe.jaillet@wanadoo.fr,
 ssengar@linux.microsoft.com, wei.liu@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hyperv@vger.kernel.org
Subject: [PATCH 1/1] drm/hyperv: Fix address space leak when Hyper-V DRM
 device is removed
Date: Mon, 10 Feb 2025 11:34:41 -0800
Message-Id: <20250210193441.2414-1-mhklinux@outlook.com>
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
Reply-To: mhklinux@outlook.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Michael Kelley <mhklinux@outlook.com>

When a Hyper-V DRM device is probed, the driver allocates MMIO space for
the vram, and maps it cacheable. If the device removed, or in the error
path for device probing, the MMIO space is released but no unmap is done.
Consequently the kernel address space for the mapping is leaked.

Fix this by adding iounmap() calls in the device removal path, and in the
error path during device probing.

Fixes: f1f63cbb705d ("drm/hyperv: Fix an error handling path in hyperv_vmbus_probe()")
Fixes: a0ab5abced55 ("drm/hyperv : Removing the restruction of VRAM allocation with PCI bar size")
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index e0953777a206..b491827941f1 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -156,6 +156,7 @@ static int hyperv_vmbus_probe(struct hv_device *hdev,
 	return 0;
 
 err_free_mmio:
+	iounmap(hv->vram);
 	vmbus_free_mmio(hv->mem->start, hv->fb_size);
 err_vmbus_close:
 	vmbus_close(hdev->channel);
@@ -174,6 +175,7 @@ static void hyperv_vmbus_remove(struct hv_device *hdev)
 	vmbus_close(hdev->channel);
 	hv_set_drvdata(hdev, NULL);
 
+	iounmap(hv->vram);
 	vmbus_free_mmio(hv->mem->start, hv->fb_size);
 }
 
-- 
2.25.1

