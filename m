Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CBA53A370
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 13:03:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A41A10E644;
	Wed,  1 Jun 2022 11:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001BA10E404
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 11:03:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id q21so1844388wra.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 04:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oj0UTyy0MLszvmn9VYRtyrJ5EUtyanW7B83YKGtREoY=;
 b=q8JG6nQAxFI6QCloZp2Q4pXzLo3shCoqdhGDgiA2pBrA10VCaqcbmuAJsb25aI4/H/
 uWFzuufhljnvhDTL+e3wGS7WRicznv36my3NbbggPbQkLXYfT+OZlRxNvXEfFZEof2+r
 tM26WAClQnO5mpxQpVckBTlaC4smj5qjrg9SQp3VvX1ezXtQLMy79HZbbjRzGyCdgTyg
 L2ZSMTCRNm6aJYXxX2OHDaap/pXi+yN9Ch5f1QA2UZEB5rYML1oO+bGfydSDlsGIHemX
 5WH+AykVi/J2hNdYa9Zbr5ziLDTuPRpkLn5vLPCh6SWGn3ATpN5zkmHzP/sxM0sdTDH3
 +4FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oj0UTyy0MLszvmn9VYRtyrJ5EUtyanW7B83YKGtREoY=;
 b=BIpmsxuncX7NplFg+LSIDZPESn3LabBWf+2rn9/J5pyxEWZHUWSqLyGWsDX8iXOziD
 FMyTMwJsw1m1CobkkYcJOUZbuMoZzO+QdAUzU3Z7h0Wsae0flvRPG9Amr5/ToBZRoWvf
 b+4gn6R/Mfl2xyZi6lLufEf0lIlIPXdHCNxttlxUjwf3EQtRqcB/VhR8LU7kLeJPVM8a
 29a3X55ltpq0y5BbfB/VJPehcLUSGJJbdOQp5zAgEu+CqIuQEkRQFAjz2WQtGvnP7Va0
 C0XN/SsqRsWhENpa/j05s0purK2EbnXVm4fDrU0/S0kc43YXT24lPFfkupHKKfCzQaBh
 fDng==
X-Gm-Message-State: AOAM532auUZvsptf+oXhaXxB8Dzz5GQsEcQawU3W2PLsl/JBDBnhXHo1
 N45zaSdbY103+oKUUFYhUwk=
X-Google-Smtp-Source: ABdhPJwDgJrEi99r+BoWVWJzPxWCtq5FeXvDr8rhpjp+LVsx1gRELhK179bEcDAWDnqDCwJUwzpCcQ==
X-Received: by 2002:adf:fa81:0:b0:20e:69df:5f06 with SMTP id
 h1-20020adffa81000000b0020e69df5f06mr54912093wrr.188.1654081391561; 
 Wed, 01 Jun 2022 04:03:11 -0700 (PDT)
Received: from morpheus.home.roving-it.com (82-132-215-116.dab.02.net.
 [82.132.215.116]) by smtp.googlemail.com with ESMTPSA id
 j14-20020a05600c190e00b00397381a7ae8sm6074559wmq.30.2022.06.01.04.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 04:03:11 -0700 (PDT)
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
Subject: [PATCH v5 3/6] drm/v3d: Add support for bcm2711
Date: Wed,  1 Jun 2022 12:02:46 +0100
Message-Id: <20220601110249.569540-4-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601110249.569540-1-pbrobinson@gmail.com>
References: <20220601110249.569540-1-pbrobinson@gmail.com>
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

Add compatible string and Kconfig options for bcm2711.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
Changes since v5:
- Change compatible to align downstream and othee HW, reorder to suit

 drivers/gpu/drm/v3d/Kconfig   | 2 +-
 drivers/gpu/drm/v3d/v3d_drv.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/Kconfig b/drivers/gpu/drm/v3d/Kconfig
index e973ec487484..01d91c829107 100644
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

