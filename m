Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C98124701
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2019 13:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65F6A6E30D;
	Wed, 18 Dec 2019 12:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280006E045
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 08:44:05 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id k3so902408pgc.3
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2019 00:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XgkP2YGykzlwIphqRMB3Y2Drvc27l2r1lzhQKxjLLiI=;
 b=GumeP8eM59UIel+COPKvb4kal8y9ssVw9jCzVwG3EzzAFQ0js0afheGdnt2yC7qnLN
 sR53rfH8iYh1JBd0aMB+vGsckczjc9+RAgj/4HNxKpdyYFot8mvWGD1ZdBYZ6sWi+7v+
 J6LaEoDP/b3AgsCPDB2nazBRciMoWC6k3OeYiqv88FehJfnoYxDPIFj6O5O3EzZfdWbG
 t9rwizn0kUEMM/m3G7uBXnsPL2zgGnap0Xprsa901le4kIvxcLeJju8YSmFriazwo7i/
 cCG6uC2RdGB7i/9rmK8nCR8JTK7Ihy9UREU7dB3F8LfdrIdrP4gAbNQnlZBPjwduYCFF
 nI7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XgkP2YGykzlwIphqRMB3Y2Drvc27l2r1lzhQKxjLLiI=;
 b=KU5rI8HvW02HndcNvF/F4hbwVQvvdVKB+POwwbmuRpMxiRweaTUYL1EoKcuW06AOpz
 eoijA8dGl9iXJixwkXYsruiVp9u2zoQ6qK7ZpN2TDppwS97EYRCQC8J4Vx5wI5C/YH2a
 +TEaUVyCq2sFgevy4GmMygh2kdwQdBsxyJiPS1T4V1z81ORzayehQxR3cPuMEJlW+j9l
 PGkc6ZctsDtviSmG24tudghGyJr/UKvuK02eI+zWj5QahcbVt3qCfIKkCK5tL4wPAxBa
 9m0p0CqIxkm7ZJ188kzDo+2qVpkrrITaGZWXgCxJr5n3QYQsgqkAO0cliS5dsftIP8ro
 RQ+A==
X-Gm-Message-State: APjAAAU90ix+6Du+XK0WgoTlXfBnXNPME23r+pE56GusZS+E7sQXrj9K
 0Zzb89tGPOhUXdTsRyA05Uc=
X-Google-Smtp-Source: APXvYqyL+r5RJIcdWldlQzpiSsr60WSqqejJ6XcfoZkzoYHycrvSnx63omhxxdoMI0Bn3RlxOX3YSw==
X-Received: by 2002:a63:ea4b:: with SMTP id l11mr1686987pgk.357.1576658644563; 
 Wed, 18 Dec 2019 00:44:04 -0800 (PST)
Received: from morpheus.roving-it.com.com
 ([2401:a400:2a0a:f300:5827:9012:5064:8df7])
 by smtp.googlemail.com with ESMTPSA id x4sm2068333pfx.68.2019.12.18.00.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2019 00:44:03 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Florian Fainelli <f.fainelli@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Subject: [PATCH] gpu/drm/v3d: Add ARCH_BCM2835 to DRM_V3D Kconfig
Date: Wed, 18 Dec 2019 08:43:20 +0000
Message-Id: <20191218084320.312561-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 18 Dec 2019 12:38:50 +0000
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
Cc: Peter Robinson <pbrobinson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On arm64 the config ARCH_BCM doesn't exist so to be able to
build for platforms such as the Raspberry Pi 4 we need to add
ARCH_BCM2835 similar to what has been done on vc4.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/gpu/drm/v3d/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/v3d/Kconfig b/drivers/gpu/drm/v3d/Kconfig
index 9a5c44606337..b0e048697964 100644
--- a/drivers/gpu/drm/v3d/Kconfig
+++ b/drivers/gpu/drm/v3d/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_V3D
 	tristate "Broadcom V3D 3.x and newer"
-	depends on ARCH_BCM || ARCH_BCMSTB || COMPILE_TEST
+	depends on ARCH_BCM || ARCH_BCMSTB || ARCH_BCM2835 || COMPILE_TEST
 	depends on DRM
 	depends on COMMON_CLK
 	depends on MMU
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
