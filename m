Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C14C21CB5
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 19:35:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6ACE10E992;
	Thu, 30 Oct 2025 18:35:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Loep/zaH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCE110E992
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 18:35:43 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-7811a02316bso1178672b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 11:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761849342; x=1762454142; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R8xsKuisRukEib8wrs+zMZBJKZQ/YPyJdbnfQcP0zKw=;
 b=Loep/zaHyaH6VsL0n/Q4uwWU3UutmB22IHJPDuWOvPsMQbXqiSLiH92H0KE/ApOUEZ
 xFrU+moYt3bzggCliLf7MY9qv79ygZElCRT79XA/KoH5ktyUmcIoYV/McPuMwSxfFNzP
 w4tdyvZZOvCm4IZEqT2wvg28zJe2qA1xB9gZbdoAg8HEdQqnf0DvB9Xan6DG6yyU4PSB
 l+gY9BNojgIUnZMuPZiQW/QRAensG9x7jyIrYjL00LbvP8CJ+Z9MtvRSdzPNN7T0tfno
 hTin27XhaMLZg2juX7ni9qz6ARK2NIj5wfud4yhwjNK75o1EeEQ5IEu2di/aVfahgSy7
 91jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761849342; x=1762454142;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R8xsKuisRukEib8wrs+zMZBJKZQ/YPyJdbnfQcP0zKw=;
 b=F1AprOxEP/GUnWY2DOIu8fznpPUNKjHLU7UbspAreq0g4Ku1O5zxvGndsBXFIZgxe3
 NdMDmw7bz0za+j/sU40IBMFK8S9eeQ74RBThU0VRKA6y8ZzbVRPIAKR9Ajjq6aV5FdZE
 uFMKeJzkazo8JUqJpw5oKvO1EoIQnJF4cT3lUiwJ5zTbgHOY+UldF89dfMvdVQEByMKY
 Dk4P/Z06OG6EUSCXE0JJwJ2i6dHQzDVwUHcYgqcGS4FLACXnLzB/tB7B5qmKIkMSdfVt
 xsfSYs+VPEFkpMBmpSC5qhPaIj8i56RoR6yDOlBQhIE7JadMPh6jO/HjPucYWmcELVtW
 KC5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqmk/RExBqN2FnuFw2/c7QQpohAv/HylZicFjzLI2mLtwzTG8GCUtu1IO7Grn5STHHNZt40s/P2vM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx4a7z85Z1snX02cv2eQIw/viiwJtJLA42SgMXCTByw5wG5dzlU
 W+u8GrU0hzBNuLOHUwr2AokIzMDLALA0WRKm4DD0fcMCMwEE2BoaC6A5
X-Gm-Gg: ASbGncsDLL0ojz2hZS1lMhI28xT0EdUNtAkDADg/r35i2UBCse6ep7AcFoAtVRj3h47
 pt4UdYz+kndSR78K2Z8OZzAtxXD//vUslrPWg6jH5vspx/qF/gWK5Nq+fdPe0CZkVRuLj0veqOf
 FhBe8/Vgg4CfbF7sIjFMeGfNpd2ph2wEKq0JFruVLowi9RPnjdC+0b+G6mgnu4rmvOcIBZPsDN6
 m7ci5DJQJ1XwoLqHqFqd42UBc/8YSoonTy7dLmWGt3abOJ82W8EecHXBedMg6B0kfhgoViiKA7e
 bqdYCvXEEAOyOUf+5EGC6J70AeP6psa6BE25wa/94amwHcnaUfakoRutsvQMMvZFvbbpyKyjEEO
 gw/xWJy05r/B2++Eo5PNFsad42TDod6yiaR5RQS2NU30GAg5KAOgrn4o9ea+mx5H9wKnkhcxd2B
 jwNJ3WQnFPzVjbcWlNmE2rQOs=
X-Google-Smtp-Source: AGHT+IGW4Tyk7D3F3D6JGBtTqkPio7zAXmHomclEQkI2qiHCT3Q0ZPi73lO3+xGLPY1C7uPSyGKKGg==
X-Received: by 2002:a17:902:cecc:b0:264:befb:829c with SMTP id
 d9443c01a7336-2951a423385mr9385915ad.9.1761849342414; 
 Thu, 30 Oct 2025 11:35:42 -0700 (PDT)
Received: from fedora ([2401:4900:1f32:68ad:2e67:289c:5dac:46fd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-294fc9feb21sm30201135ad.73.2025.10.30.11.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 11:35:42 -0700 (PDT)
From: Shi Hao <i.shihao.999@gmail.com>
To: koby.elbaz@intel.com
Cc: konstantin.sinyuk@intel.com, ogabbay@kernel.org, i.shihao.999@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] accel: goya: replace sprintf() with sysfs_emit()
Date: Fri, 31 Oct 2025 00:05:29 +0530
Message-ID: <20251030183529.93665-1-i.shihao.999@gmail.com>
X-Mailer: git-send-email 2.51.0
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

Replace deprecated sprintf() with sysfs_emit() in various sysfs show
functions to avoid buffer overflows.

The sysfs_emit() function is specifically designed for sysfs show handlers
and provides built-in bounds checking by limiting output to PAGE_SIZE,
unlike sprintf() which has no bounds checking. This prevents buffer
overflows that could result in kernel crashes or potential security
vulnerabilities.

Convert sprintf() to sysfs_emit() as per kernel code practices and
guidelines.

Signed-off-by: Shi Hao <i.shihao.999@gmail.com>
---
 drivers/accel/habanalabs/goya/goya_hwmgr.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/accel/habanalabs/goya/goya_hwmgr.c b/drivers/accel/habanalabs/goya/goya_hwmgr.c
index b595721751c1..3ef18f42c393 100644
--- a/drivers/accel/habanalabs/goya/goya_hwmgr.c
+++ b/drivers/accel/habanalabs/goya/goya_hwmgr.c
@@ -49,7 +49,7 @@ static ssize_t mme_clk_show(struct device *dev, struct device_attribute *attr,
 	if (value < 0)
 		return value;

-	return sprintf(buf, "%lu\n", value);
+	return sysfs_emit(buf, "%lu\n", value);
 }

 static ssize_t mme_clk_store(struct device *dev, struct device_attribute *attr,
@@ -98,7 +98,7 @@ static ssize_t tpc_clk_show(struct device *dev, struct device_attribute *attr,
 	if (value < 0)
 		return value;

-	return sprintf(buf, "%lu\n", value);
+	return sysfs_emit(buf, "%lu\n", value);
 }

 static ssize_t tpc_clk_store(struct device *dev, struct device_attribute *attr,
@@ -147,7 +147,7 @@ static ssize_t ic_clk_show(struct device *dev, struct device_attribute *attr,
 	if (value < 0)
 		return value;

-	return sprintf(buf, "%lu\n", value);
+	return sysfs_emit(buf, "%lu\n", value);
 }

 static ssize_t ic_clk_store(struct device *dev, struct device_attribute *attr,
@@ -196,7 +196,7 @@ static ssize_t mme_clk_curr_show(struct device *dev,
 	if (value < 0)
 		return value;

-	return sprintf(buf, "%lu\n", value);
+	return sysfs_emit(buf, "%lu\n", value);
 }

 static ssize_t tpc_clk_curr_show(struct device *dev,
@@ -213,7 +213,7 @@ static ssize_t tpc_clk_curr_show(struct device *dev,
 	if (value < 0)
 		return value;

-	return sprintf(buf, "%lu\n", value);
+	return sysfs_emit(buf, "%lu\n", value);
 }

 static ssize_t ic_clk_curr_show(struct device *dev,
@@ -230,7 +230,7 @@ static ssize_t ic_clk_curr_show(struct device *dev,
 	if (value < 0)
 		return value;

-	return sprintf(buf, "%lu\n", value);
+	return sysfs_emit(buf, "%lu\n", value);
 }

 static ssize_t pm_mng_profile_show(struct device *dev,
@@ -242,7 +242,7 @@ static ssize_t pm_mng_profile_show(struct device *dev,
 	if (!hl_device_operational(hdev, NULL))
 		return -ENODEV;

-	return sprintf(buf, "%s\n",
+	return sysfs_emit(buf, "%s\n",
 			(goya->pm_mng_profile == PM_AUTO) ? "auto" :
 			(goya->pm_mng_profile == PM_MANUAL) ? "manual" :
 			"unknown");
@@ -313,7 +313,7 @@ static ssize_t high_pll_show(struct device *dev, struct device_attribute *attr,
 	if (!hl_device_operational(hdev, NULL))
 		return -ENODEV;

-	return sprintf(buf, "%u\n", hdev->high_pll);
+	return sysfs_emit(buf, "%u\n", hdev->high_pll);
 }

 static ssize_t high_pll_store(struct device *dev, struct device_attribute *attr,
@@ -369,7 +369,7 @@ static ssize_t infineon_ver_show(struct device *dev, struct device_attribute *at

 	cpucp_info = &hdev->asic_prop.cpucp_info;

-	return sprintf(buf, "%#04x\n", le32_to_cpu(cpucp_info->infineon_version));
+	return sysfs_emit(buf, "%#04x\n", le32_to_cpu(cpucp_info->infineon_version));
 }

 static DEVICE_ATTR_RO(infineon_ver);
--
2.51.0

