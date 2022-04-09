Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B7F4FA217
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 05:45:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AB810F3F3;
	Sat,  9 Apr 2022 03:45:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FA510F3F3
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 03:45:00 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id p135so6899686iod.2
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 20:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZfFIR4LIjgd7Hrv5Hb1FuWlpDVZNI07W8ZVr7E+HPdE=;
 b=nixiBKa3+naz/RL5CyYGZhPRUztCEy7P/2+6O8TJ4BNVxMwof6mtBdwOwBfprF0mOD
 /yu/N9CchENjDFTsNvtxuGTn9jvG9VH3ssfyrbuntTQizz7wGq1JFxurD2rmP5dF8JXM
 qbm8+CQPR2jnUWsFMmqPd+bF+I/UPk+WmJXN9p7z3LCPaVhDJkjM3k5P9dkfXlUG1QJq
 Z7as/tz73RRyeF393QlhyOjCqWWf2WPgjb0MZtWiwVZerR1BWIzfp8DpthHQ0QXi1ZF4
 zbJPbAO0QCctnXOy4sAoFbhiUTsNNiLOR+OQCKPHptLN49uZUC/db0sGvr5rw3Kuxx+U
 e9dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZfFIR4LIjgd7Hrv5Hb1FuWlpDVZNI07W8ZVr7E+HPdE=;
 b=PQ+r+eksNdo8fPInuJg44q2RqnYk5bFyyRUWf3A5tCn6wX0szhjHH5t6D046v3uCjV
 rtCPUkMp5B3tsrsBcomeOfy+creOsMfAaXhxAmNG0NeIek1KFiin2a12FIOaK/hUm78b
 QQ2Y8nk+y3QxU2Dq2+moCjnazBibhlAwHyyF1FEbqlIaP6Ffy7bb+BuXHefer2GxVqlm
 4HGYScOLtbhrMxxEDwHd94ytTm/jaoAWWri6/znK/9+Vst4aHWkKyp9zKYgOrlRbCyoo
 bgag6rBQ2cElXfK1N9er6Jfq3OFrwRGPZsfS9wUG5bvVmlAyFYbPk/Y4VPQHvHys9yY4
 A6Xw==
X-Gm-Message-State: AOAM533sppCLgpC0n6sXOMvbJpvMMSQJJn9OAl4guMkNdU4ZIKxfKX1e
 Mp544IrMG8mv6j8p9FRJWWPyQFMQ+nhu0w==
X-Google-Smtp-Source: ABdhPJzNYBn/4Y962o5/8C1Ipa96l+ZsMaVG4WbC6ThYiMKpm3cCIf+2t4P045nwzvnjUm7LZgT8iw==
X-Received: by 2002:a05:6638:2643:b0:323:c3e3:fcec with SMTP id
 n3-20020a056638264300b00323c3e3fcecmr10727409jat.289.1649475899076; 
 Fri, 08 Apr 2022 20:44:59 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 e4-20020a056e020b2400b002ca9ffbb8fesm71785ilu.72.2022.04.08.20.44.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 20:44:58 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2] drm/gma500: depend on framebuffer
Date: Fri,  8 Apr 2022 21:44:17 -0600
Message-Id: <20220409034418.3182706-1-james.hilliard1@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This appears to be needed for video output to function correctly.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - use depends instead of select
---
 drivers/gpu/drm/gma500/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index 0cff20265f97..8ea87bfa95f5 100644
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@ -2,6 +2,8 @@
 config DRM_GMA500
 	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
 	depends on DRM && PCI && X86 && MMU
+	depends on FB
+	depends on FB_EFI || !EFI
 	select DRM_KMS_HELPER
 	# GMA500 depends on ACPI_VIDEO when ACPI is enabled, just like i915
 	select ACPI_VIDEO if ACPI
-- 
2.25.1

