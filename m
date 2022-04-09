Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 190954FA27E
	for <lists+dri-devel@lfdr.de>; Sat,  9 Apr 2022 06:23:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FE7810E276;
	Sat,  9 Apr 2022 04:23:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAFD10E263
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Apr 2022 04:23:30 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id q10so4650554ilt.9
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 21:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DJypOpOA9aIF7A07tGX4soaaBLyBuWYyjxJ7q0m7th0=;
 b=NPEqzwWw0cB7k1ALFugu0+c2isySmZUAJchwKU9c8auBivUs+EHCCrcmT/NvOvtXZA
 l0T7McZG8qNrO25el8VQcNND1MWmlkX+p8q1h3+E/mUgFMa0wgup2AJ7MkIjBguHS/x4
 UqCuRhRXePhAN/9IGhExY7IUwGj2J29JvefULPBsv3QTybO45tikhIpCj+Vi4MAuNjRz
 bL/Z7yHlADVHboa8Qt/gQKaqH5APKeuPSQOWezK+mRJz9LyaZWbCWvIq/WcG+7s6YnFj
 9u04BgzxodGacaWU/vig6sn/9Y9sjc0/fNPjedKBwpoNzTX+y2mXftaya9rVMLcDAsJ4
 2duQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DJypOpOA9aIF7A07tGX4soaaBLyBuWYyjxJ7q0m7th0=;
 b=RGHTrRcixxBpWjdMYtrdhFeK7Gmq0rcTHPIJOO3sYR8hc5Hum7ELaRzHKB5dArXsOk
 duv0XUfqJg+seF8akOn6WA4q4ONuUd/+fN9RyrmUseAs2NTRT5P7hDcdaXH93fXixIjJ
 NcziUxGnC/AEb1YNBGIZkvsbq4bUUhQxqhG8zFZh1YchThjRcev351Lonm9aeIccabTJ
 jeukRF/k8lxMQPtcM7/9KFKlRsrHlUsdpJ55xO5rXFYVAN7pZbQ1wTfmJ1Khlzv2V0gB
 wYbDOs/R7LqUNHieCUXEaIKPsGJeXv2LZWFxpMPVofjkx1Hsn3cOgGxgCdJx+TlK7K61
 oFgg==
X-Gm-Message-State: AOAM531hgDISLEmPG9GPEtJrTA2Uh0FKWZm2V2soh6pmNlEMOFuAlZoB
 7v19GVl9JF+mL+oAsrNlXEJShSvDdyj/pg==
X-Google-Smtp-Source: ABdhPJzPxk4qY6Q6zL03Wzq9wKditxBAobGL6/CMo2XFZXDH58+NCffkqUpLV6nfgehKIxDxhJ4QTw==
X-Received: by 2002:a05:6e02:216f:b0:2ca:85f4:1473 with SMTP id
 s15-20020a056e02216f00b002ca85f41473mr2671059ilv.17.1649478209896; 
 Fri, 08 Apr 2022 21:23:29 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 r9-20020a6b6009000000b006412abddbbbsm16131051iog.24.2022.04.08.21.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 21:23:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/gma500: depend on framebuffer
Date: Fri,  8 Apr 2022 22:23:21 -0600
Message-Id: <20220409042321.3184493-1-james.hilliard1@gmail.com>
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

Select the efi framebuffer if efi is enabled.

This appears to be needed for video output to function correctly.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - select EFI_FB instead of depending on it
Changes v1 -> v2:
  - use depends instead of select
---
 drivers/gpu/drm/gma500/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index 0cff20265f97..a422fa84d53b 100644
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@ -2,11 +2,13 @@
 config DRM_GMA500
 	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
 	depends on DRM && PCI && X86 && MMU
+	depends on FB
 	select DRM_KMS_HELPER
 	# GMA500 depends on ACPI_VIDEO when ACPI is enabled, just like i915
 	select ACPI_VIDEO if ACPI
 	select BACKLIGHT_CLASS_DEVICE if ACPI
 	select INPUT if ACPI
+	select FB_EFI if EFI
 	help
 	  Say yes for an experimental 2D KMS framebuffer driver for the
 	  Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and
-- 
2.25.1

