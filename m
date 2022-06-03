Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 507DB53C789
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jun 2022 11:26:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0427311231D;
	Fri,  3 Jun 2022 09:26:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A88112316
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jun 2022 09:26:19 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id v19so9382753edd.4
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jun 2022 02:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3QIoQb5QbRVNOs1RbxwOuYWdQ4RolJT8xZ/PEN472xw=;
 b=lmCyckO1JfhORtymrMAw3PdU4nq7PrawiqPgxXxYW7btxcfTfx8+r2WRvAqKrEervY
 tEPe2LGnx5LLR2IAGnYFAxsP2e7gMQlNFEVqh4GraTlnLdkgYM5QohEs7R6xDxGu/D/H
 RRXGyzy+Y4QoVQXpz6a13yjRzkjOMz4UYzT8Zd5ewzOkDQB8ONr1rovYtJ4m9IDCqAwG
 GLwZnEPuKTsxjGcDz/th8HLINjbe7nq4eoOcqMOqReZMHVVATirjLgocmKh2LZrbSP1E
 MvKw0e9ciET/2v6CeS9Qz//5UkV9e4iPu+eQSkgLaltIP+qh+1QCKcQBf6oBQ/kWDaAu
 R+eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3QIoQb5QbRVNOs1RbxwOuYWdQ4RolJT8xZ/PEN472xw=;
 b=OU3yMadJnSIyYZdZnJknwTHBTEjsau5PXKEFhrVY8CXmjTA9WXNquplbWFH7WBKVSi
 XU4wcc3LP+aOa3diO17eYvGcIu1rA6y4lE+y3AubLWygWBQOmdYYjhwA62anrIvasA8r
 gvRGu5iRVdTXZU4sWb8wGkgUsFAxsDZ8wsDRv+KCu62AiWZSALw1E3sCUfyFm57X6jnq
 o3Yd5N7h/p6cKQ1LG64DReZsyHJaqIoyGPIoyQLBnBfUFXhTU1OWoFEO//l5iOcDC2Dt
 NQ4uO5mksfeQnru7mk/n3Tt0l/z+nIUERAeMhx7qoIowrmf/OXNIw5pr6a91CiftZdt8
 cvsw==
X-Gm-Message-State: AOAM532pw2f1L9Az+ITIscuAx55jDpiblu+r9th4boOSNLLmUEvhOCs8
 07BJ3W+3I24P5OpvgukWTMA=
X-Google-Smtp-Source: ABdhPJwWDSaSdYoQBx6iHBJAm8vaTsVDbYmRXyOGiD0pUsPbS9VGBLoLVtY7Ji3bYn69DPVycbuvKA==
X-Received: by 2002:a05:6402:228d:b0:42d:e319:7297 with SMTP id
 cw13-20020a056402228d00b0042de3197297mr9641542edb.79.1654248377816; 
 Fri, 03 Jun 2022 02:26:17 -0700 (PDT)
Received: from morpheus.home.roving-it.com
 (3.e.2.0.0.0.0.0.0.0.0.0.0.0.0.0.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa.
 [2001:8b0:fb11:2681::2e3]) by smtp.googlemail.com with ESMTPSA id
 b5-20020a17090691c500b006feaa22e367sm2617672ejx.165.2022.06.03.02.26.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jun 2022 02:26:17 -0700 (PDT)
From: Peter Robinson <pbrobinson@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, bcm-kernel-feedback-list@broadcom.com,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Emma Anholt <emma@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>,
 javierm@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, maxime@cerno.tech,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Stefan Wahren <stefan.wahren@i2se.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Subject: [PATCH v6 3/6] drm/v3d: Add support for bcm2711
Date: Fri,  3 Jun 2022 10:26:07 +0100
Message-Id: <20220603092610.1909675-4-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220603092610.1909675-1-pbrobinson@gmail.com>
References: <20220603092610.1909675-1-pbrobinson@gmail.com>
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
Cc: Peter Robinson <pbrobinson@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add compatible string and Kconfig options and help for bcm2711.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
Reviewed-by: Stefan Wahren <stefan.wahren@i2se.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
Changes since v5:
- Update help text to cover all supported SoCs

Changes since v4:
- Change compatible to align downstream and other HW, reorder to suit

 drivers/gpu/drm/v3d/Kconfig   | 5 +++--
 drivers/gpu/drm/v3d/v3d_drv.c | 1 +
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/v3d/Kconfig b/drivers/gpu/drm/v3d/Kconfig
index e973ec487484..ce62c5908e1d 100644
--- a/drivers/gpu/drm/v3d/Kconfig
+++ b/drivers/gpu/drm/v3d/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_V3D
 	tristate "Broadcom V3D 3.x and newer"
-	depends on ARCH_BCM || ARCH_BRCMSTB || COMPILE_TEST
+	depends on ARCH_BCM || ARCH_BRCMSTB || ARCH_BCM2835 || COMPILE_TEST
 	depends on DRM
 	depends on COMMON_CLK
 	depends on MMU
@@ -9,4 +9,5 @@ config DRM_V3D
 	select DRM_GEM_SHMEM_HELPER
 	help
 	  Choose this option if you have a system that has a Broadcom
-	  V3D 3.x or newer GPU, such as BCM7268.
+	  V3D 3.x or newer GPUs. SoCs supported include the BCM2711,
+	  BCM7268 and BCM7278.
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 56d5f831e48b..8c7f910daa28 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -191,6 +191,7 @@ static const struct drm_driver v3d_drm_driver = {
 };
 
 static const struct of_device_id v3d_of_match[] = {
+	{ .compatible = "brcm,2711-v3d" },
 	{ .compatible = "brcm,7268-v3d" },
 	{ .compatible = "brcm,7278-v3d" },
 	{},
-- 
2.36.1

