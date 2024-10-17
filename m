Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1827D9A22C2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 14:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6727E10E810;
	Thu, 17 Oct 2024 12:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="E5dy1gVx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5182510E80D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 12:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729169524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=um5kPuJ64llVoLwmFFHr1GyuNJY8DQ3vVEayxTgqCeU=;
 b=E5dy1gVxmvfk0XYRD/baQIi3nwupZvRpkC8wJWuBXNqfJ0Di5DKF31sMdql8P5CMKvfHOK
 VH2IajWhl6H5obMkcQdwAUjoCuxEjsS7SHgOizb/MpJTXR1zDAREWYpPU6F3L8XHb3mWKP
 bHqtZDT1XLVnpKGtCxGRwlVefKq69oM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-649-QywWVGU5PrmP5zSyhHdoRg-1; Thu, 17 Oct 2024 08:52:01 -0400
X-MC-Unique: QywWVGU5PrmP5zSyhHdoRg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43151e4ef43so6653975e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Oct 2024 05:52:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729169520; x=1729774320;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=um5kPuJ64llVoLwmFFHr1GyuNJY8DQ3vVEayxTgqCeU=;
 b=cYAqc747BrPa5Tz0IqIW77iXV+MuJx8Sx5N3/ak2NVg6aOg+NpCJC8H3BqFjPww82Y
 NCV8QTtZp8+NQXRGdMAp7UKHsyeDXYHGgLpGVihUuUzJ3VZsLu2jTJ9paxyiXtRI3Bqg
 MeyUXzta36S++WfprVW3YjeukVkadAGp+EpCXMGwwPgu26G9T6R6/f0YPTBk9vc0k+1W
 ZKPg1zSwJMK7KeuvqwQOHNAkvgx+2UukKBlLgKZujkrnQ9w+UIqApmC99piYcAuS8EqD
 U3GJjWAvcjjiSDXEZpSGl2Nb6x9wWtfaSIV6YU4Rc5SLdGaHKH67iWAM4xTGkeHyVhHg
 BVqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8+b0DHvMij5l3Tdrql35CF4pMlAlm17tXgr4XiIuqA84ZeuCXRDnhBYVVXB4/eMfwlS0wkiGfh2g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6eYnMGT2H54H4eDuioM7SuIspXmvBk3hncvpuZcgkncWgb6ox
 g1fJUUg3lXVm7O0czp71+UG4KM784FARTrx8hj4lokQnzzP0SVi5gMW4WvHqRavBw+xL2gLIuxF
 kKKdQ2SgumLUvNKhTIocRBKx4WdjL/OA5oxiV1uC3W/6W/+T0TS4unaqR/L6M2t92+g==
X-Received: by 2002:a05:600c:510f:b0:431:5bf2:2d4 with SMTP id
 5b1f17b1804b1-4315bf20381mr16130625e9.29.1729169520175; 
 Thu, 17 Oct 2024 05:52:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGYFzQ02xHqa9DwuB2IQl1STrx/TjGYcJn3bnqxHl7RZjfzQiYdIGcS5/o7InyDdXexXUkSg==
X-Received: by 2002:a05:600c:510f:b0:431:5bf2:2d4 with SMTP id
 5b1f17b1804b1-4315bf20381mr16130475e9.29.1729169519778; 
 Thu, 17 Oct 2024 05:51:59 -0700 (PDT)
Received: from eisenberg.redhat.com (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d7fbf8228sm7178054f8f.81.2024.10.17.05.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Oct 2024 05:51:59 -0700 (PDT)
From: Philipp Stanner <pstanner@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: virtualization@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH] drm/bochs: Replace deprecated PCI implicit devres
Date: Thu, 17 Oct 2024 14:51:46 +0200
Message-ID: <20241017125145.34729-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

bochs uses pcim_enable_device(), which causes pci_request_region() to
implicitly set up devres callbacks which will release the region on
driver detach. Despite this, the driver calls pci_release_regions()
manually on driver teardown.

Implicit devres has been deprecated in PCI in commit 81fcf28e74a3 ("PCI:
Document hybrid devres hazards").

Replace the calls to pci_request_region() with ones to always-managed
pcim_request_region(). Remove the unnecessary call to
pci_release_regions().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/tiny/bochs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/bochs.c b/drivers/gpu/drm/tiny/bochs.c
index 31fc5d839e10..888f12a67470 100644
--- a/drivers/gpu/drm/tiny/bochs.c
+++ b/drivers/gpu/drm/tiny/bochs.c
@@ -217,7 +217,7 @@ static int bochs_hw_init(struct drm_device *dev)
 
 	if (pdev->resource[2].flags & IORESOURCE_MEM) {
 		/* mmio bar with vga and bochs registers present */
-		if (pci_request_region(pdev, 2, "bochs-drm") != 0) {
+		if (pcim_request_region(pdev, 2, "bochs-drm") != 0) {
 			DRM_ERROR("Cannot request mmio region\n");
 			return -EBUSY;
 		}
@@ -258,7 +258,7 @@ static int bochs_hw_init(struct drm_device *dev)
 		size = min(size, mem);
 	}
 
-	if (pci_request_region(pdev, 0, "bochs-drm") != 0)
+	if (pcim_request_region(pdev, 0, "bochs-drm") != 0)
 		DRM_WARN("Cannot request framebuffer, boot fb still active?\n");
 
 	bochs->fb_map = ioremap(addr, size);
@@ -302,7 +302,7 @@ static void bochs_hw_fini(struct drm_device *dev)
 		release_region(VBE_DISPI_IOPORT_INDEX, 2);
 	if (bochs->fb_map)
 		iounmap(bochs->fb_map);
-	pci_release_regions(to_pci_dev(dev->dev));
+
 	drm_edid_free(bochs->drm_edid);
 }
 
-- 
2.47.0

