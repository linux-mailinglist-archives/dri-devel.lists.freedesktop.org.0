Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD19FCE83E3
	for <lists+dri-devel@lfdr.de>; Mon, 29 Dec 2025 22:59:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9516D10E734;
	Mon, 29 Dec 2025 21:59:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="d/6Ldwwf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com
 [209.85.214.226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656AA10E731
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 21:59:22 +0000 (UTC)
Received: by mail-pl1-f226.google.com with SMTP id
 d9443c01a7336-2a081c163b0so89122115ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 13:59:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767045562; x=1767650362;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BiToq+744uGxVUSBnz8g/fFuQu2TAsdbeOO8CU0qryc=;
 b=tWu5mA1tds/BmnU1eYo6g9dOn7UGZnUy9/D1uNczHPJpli23Fg/n73mLGODIfst88x
 MT1BKAMq10gYHcI/cSGS4Cb8vLlGUXNlpbUlFihXeIICSorhnxxNy2w3D+gihAI7DLCB
 iubfqRk6Csc+udmT2LyCdQNirUx9RgTxVNBkWpzTnlIhjVcHnwYJnyxtFYCnwQl31c6l
 ICjsPGxONnOYrpqLHrd1JfqPQ2UnjUBq7GevhnZk1e+Dl47r+6TPpSdOd33fUJFtBO4Q
 rhQdwaZFXzXLvmeoS0jJHbBYB2MAbt565djSFbfEpuijPzV8jmH8PwsGpY5cCq+51HLx
 R2OA==
X-Gm-Message-State: AOJu0YwBDxd+pwW4rz4m3mjzBgRnBlcW2/vSjA3gNQG4nSTdWZRG5uqm
 7jEH43PY5NjeObA7+0TxDXmr33fg2H0jjdPQfYYwFLK8GRWHbPVgHLV0WaazC0Pg3KiwGFvuZOp
 Xxd+vX6wDSx6Ds+25vjMaAw/a/mUzEjPsSGFbcSpkkU9hquOI6JP7H4k2Faev0DE8ShP0r9rg4r
 VdvVxk1q0LG1QNLNl9tL+uPNS+OWj3JRf03EwLx/zrQFOxp5M5B5Tpp/FqyOstV8KPVXAbtWbnG
 e3HrNDm0xsFMBY82T5X
X-Gm-Gg: AY/fxX7L+RqSJJuMsOi/RIhU0zxNpBOAGOkW6GE8CyBGwpxz1qT1f04CY2MI3VBU5SZ
 dwhdjU4QSLZgWXq5AIKeCzx7dvaaBk76PD6jAwSoi9owLN7W44BR7aNHnLYPDU8FfdLjhtBLPwM
 v+0FU57VdkxzIe7503z3C+BOj2OSieHzNgFUU+W0D+zjrJLvlpyw2gv/wciCSI0yn38bGkARhe2
 YcPj/H3IS9Oph4EG6oRDS7/TXb1qGZ33jN69xE/uyLpsdKLabH7hYMKcxvQqWpoblcULG9PqzgM
 E2eVrc4q/nd2pG9z8pSvw2eQa9nJzxvg/sG+C5VyDS2vRksjjtsHq99tTpM9NCsNKzlpk8t+dbS
 zUUCcYN8UYpq8iOoE6iRrzimw6v1WACi7ol90wTkT5LbuBjUKTS0LCOFtWJs1n88AcD5/Md8P/n
 CvqRH+imHxUHEdAxDnR+RyKHwbuzHkhuTfGieIOQT2Bp67
X-Google-Smtp-Source: AGHT+IHSH47SvhklPmF/Bn5Qbtvw0aOzGcCRDYI/o1bhTMp1akJs9bNhitT8faeVCe39085vi53dCkzc1Pw4
X-Received: by 2002:a17:902:f64d:b0:297:f8d9:aad7 with SMTP id
 d9443c01a7336-2a2f2a4f0bamr302479635ad.50.1767045561789; 
 Mon, 29 Dec 2025 13:59:21 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-101.dlp.protect.broadcom.com. [144.49.247.101])
 by smtp-relay.gmail.com with ESMTPS id
 d9443c01a7336-2a2f3d1b86dsm35117565ad.45.2025.12.29.13.59.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Dec 2025 13:59:21 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88a360b8096so245142946d6.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 13:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1767045559; x=1767650359;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BiToq+744uGxVUSBnz8g/fFuQu2TAsdbeOO8CU0qryc=;
 b=d/6Ldwwf8i/dshodFpxUpiUXQCCfE+p6JsN7krjhNhgMba2cJLOC5NWBof7AToUpKu
 FbHJlhLOeqBC7IDC+rV/IxhDq7nnhTp53mZFzeE0jy+sdoj8vEr38ARcgG2Jma6wsLqR
 2f8GrCiQ6tJPXgHY8LoIPFGmqVIjdD9Kn9MpY=
X-Received: by 2002:a05:622a:4809:b0:4ee:4128:beba with SMTP id
 d75a77b69052e-4f4abccea36mr439741521cf.8.1767045558886; 
 Mon, 29 Dec 2025 13:59:18 -0800 (PST)
X-Received: by 2002:a05:622a:4809:b0:4ee:4128:beba with SMTP id
 d75a77b69052e-4f4abccea36mr439741281cf.8.1767045558450; 
 Mon, 29 Dec 2025 13:59:18 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d9759f164sm231530026d6.24.2025.12.29.13.59.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:59:15 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 03/12] drm/xe: Use devm aperture helpers for sysfb restore on
 probe failure
Date: Mon, 29 Dec 2025 16:58:09 -0500
Message-ID: <20251229215906.3688205-4-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251229215906.3688205-1-zack.rusin@broadcom.com>
References: <20251229215906.3688205-1-zack.rusin@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
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

Use devm_aperture_remove_conflicting_pci_devices() instead of the
non-devm variant to automatically restore the system framebuffer
(efifb/simpledrm) if the driver's probe fails after removing the
firmware framebuffer.

Call devm_aperture_remove_conflicting_pci_devices_done() after
successful probe to cancel the automatic restore, as the driver
is now responsible for display output.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpu/drm/xe/xe_device.c | 7 ++++++-
 drivers/gpu/drm/xe/xe_pci.c    | 7 +++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index c7d373c70f0f..ee9ae73222d9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -428,7 +428,12 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 
 	xe_display_driver_set_hooks(&driver);
 
-	err = aperture_remove_conflicting_pci_devices(pdev, driver.name);
+	/*
+	 * Use devm variant to automatically restore sysfb if probe fails.
+	 * This ensures the user doesn't lose display if our probe fails
+	 * after removing the firmware framebuffer (efifb/simpledrm).
+	 */
+	err = devm_aperture_remove_conflicting_pci_devices(pdev, driver.name);
 	if (err)
 		return ERR_PTR(err);
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 9c9ea10d994c..ee08a09fda6a 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -6,6 +6,7 @@
 #include "xe_pci.h"
 
 #include <kunit/static_stub.h>
+#include <linux/aperture.h>
 #include <linux/device/driver.h>
 #include <linux/module.h>
 #include <linux/pci.h>
@@ -1058,6 +1059,12 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	drm_dbg(&xe->drm, "d3cold: capable=%s\n",
 		str_yes_no(xe->d3cold.capable));
 
+	/*
+	 * Probe succeeded - cancel the automatic sysfb restore action.
+	 * We're now responsible for display output.
+	 */
+	devm_aperture_remove_conflicting_pci_devices_done(pdev);
+
 	return 0;
 
 err_driver_cleanup:
-- 
2.48.1

