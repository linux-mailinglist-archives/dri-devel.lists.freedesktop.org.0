Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EDA46392F
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 16:05:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DCC6EB4D;
	Tue, 30 Nov 2021 15:04:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BE8C6EA4D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:04:57 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J3QVx1RmLz9vqky
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:04:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cuzhZ0XSXXDS for <dri-devel@lists.freedesktop.org>;
 Tue, 30 Nov 2021 09:04:57 -0600 (CST)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J3QVw6TZDz9vqlB
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 09:04:56 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J3QVw6TZDz9vqlB
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J3QVw6TZDz9vqlB
Received: by mail-pg1-f199.google.com with SMTP id
 m5-20020a654c85000000b00325a50f232bso1260310pgt.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 07:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jkm3SRjlEMuj/OoI/keUI8sb3jpLnQn0wJDEn5YUqIA=;
 b=d+j0Y9bABjd3Q6pxla8ql2DGsgWbafWr4RzOLv5wUlwTydWGasWbCtKgQVgYEpxRze
 ZkOrFvwRyXqFs8SlIFQG02ZNIfmkVuQsPajnCwkD50d56H3GKZE+xYzBsQEfILfRbBLn
 M9O0IVxdg/4py2IrGbEO77kF/AESMA2YYEQ6iiDl/QW3qOf6qQ5Zh2YRZUyz4inrdOcD
 Xf9iNrX4dtooqBoBTrizwztrwu6mVF7qxrhOZxv+vGGBaKMKJ6X0FfldRPNmnTtIhDPD
 g+71UnqUrZpQwgcqkLG3EIKckBhZAa0GEiYKtlYWGLV6UA/Jnr5ZTkSdyxgiY+YXVLA/
 q5Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jkm3SRjlEMuj/OoI/keUI8sb3jpLnQn0wJDEn5YUqIA=;
 b=EXyoObxn/ZAV8Irs5pHq2BJjmfbi5jXO9XXTnCRoCgEr9iZ/gVXvUu1LT5hBWgB6BD
 fauVYEPW5U+RV3XKkbdm+Pb4dcRfCDgfk9i8i+WDvYDSi+gqinvSsSCS29QRyspepU1F
 i9nu8nfUPgHe+cU+M4Rl1pG6vmTYy1oh3Tk/8ZE0kzk4PLl5d1NsBzhwFkgw5XXcRc7U
 Vm2FjfYf+F/PeD334fEZyA3aPjLzQzVAJrSiUDZVXUZ0BiM7EC7xh4jBuHEnOgKDxR6M
 6V2qBYuio+FOsAQ8YBamwltit6yJhgrBzNOBBTkhUQTrdhvwZNYdo9GhBjIteogjOdRz
 q4Dw==
X-Gm-Message-State: AOAM533ZvP31NvJhY7dVIlzfXAU93XnteOL2Unua/dO1+Iy9kc9+qw60
 p4ze2jxXKISoGYwJyQwJmgydiUX1XCgM4WHdwLz6C0T6fYUvS8rrIwUYh1dCHwL4MqqhDzNB4Sh
 VkLxbJJVxvNKd74t1rzRZOM4xpSIb6tpH
X-Received: by 2002:a17:903:2292:b0:141:e76d:1b16 with SMTP id
 b18-20020a170903229200b00141e76d1b16mr66792824plh.21.1638284696195; 
 Tue, 30 Nov 2021 07:04:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy8GWn6nizJsszaZRStEl3f7YTD0lEXqp9tlfH0fC2cLbTGzG/x+jCHUyEelCV+t398xQYrMQ==
X-Received: by 2002:a17:903:2292:b0:141:e76d:1b16 with SMTP id
 b18-20020a170903229200b00141e76d1b16mr66792771plh.21.1638284695794; 
 Tue, 30 Nov 2021 07:04:55 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.7.42.137])
 by smtp.gmail.com with ESMTPSA id y28sm23124794pfa.208.2021.11.30.07.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 07:04:55 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Subject: [PATCH] drm/radeon/radeon_kms: Fix a NULL pointer dereference in
 radeon_driver_open_kms()
Date: Tue, 30 Nov 2021 23:04:49 +0800
Message-Id: <20211130150449.166144-1-zhou1615@umn.edu>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In radeon_driver_open_kms(), radeon_vm_bo_add() is assigned to
vm->ib_bo_va and passes and used in radeon_vm_bo_set_addr(). In
radeon_vm_bo_set_addr(), there is a dereference of vm->ib_bo_va,
which could lead to a NULL pointer dereference on failure of
radeon_vm_bo_add().

Fix this bug by adding a check of vm->ib_bo_va.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_DRM_RADEON=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: cc9e67e3d700 ("drm/radeon: fix VM IB handling")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
 drivers/gpu/drm/radeon/radeon_kms.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/radeon/radeon_kms.c b/drivers/gpu/drm/radeon/radeon_kms.c
index 482fb0ae6cb5..ead015c055fb 100644
--- a/drivers/gpu/drm/radeon/radeon_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_kms.c
@@ -688,6 +688,13 @@ int radeon_driver_open_kms(struct drm_device *dev, struct drm_file *file_priv)
 			 * virtual address space */
 			vm->ib_bo_va = radeon_vm_bo_add(rdev, vm,
 							rdev->ring_tmp_bo.bo);
+			if (!vm->ib_bo_va) {
+				r = -ENOMEM;
+				radeon_vm_fini(rdev, vm);
+				kfree(fpriv);
+				goto out_suspend;
+			}
+
 			r = radeon_vm_bo_set_addr(rdev, vm->ib_bo_va,
 						  RADEON_VA_IB_OFFSET,
 						  RADEON_VM_PAGE_READABLE |
-- 
2.25.1

