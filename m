Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D3A226060
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 15:03:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9B389C97;
	Mon, 20 Jul 2020 13:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385C589C97
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 13:03:34 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s9so928333lfs.4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 06:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N6MGGKi5SOfwHH7pi4RObwja9X2cCevDvrsEsCBgToI=;
 b=ZTVohaT2fvjfYhryx7slp1oZV/r5WMo/N9Hu1tigCPfqa6nrtPlKQbKfNikeze2nG+
 OuGZQ44060NuAJX6z7bqe62I+ntbWpVzogq79hqbP2h7df2j9LmZ01sIl44Nt5qGzApl
 RgDfaUzXpgy5xvVAb96QwIgsGF7HrJxeCboITQbmI+LxrMJeppS2L3BAF6SYZZqz3kPD
 zU+DxCh0HRprHIbe0HeWefe+lsdquUnSwfZe5jaQPSewG+NspjY8n0JJ0UOGOrCJVBA8
 irvj9Ac+DbuEwbtskvVRykmvclbiXPv6I7WL5iqY/X6kvlkRYNODQ8TCe7n2Joey2cCJ
 2UgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=N6MGGKi5SOfwHH7pi4RObwja9X2cCevDvrsEsCBgToI=;
 b=S2FaDg0po8iGttvdPvriPpv1L0VHguvQ/OjB122sic2gqeJAA8p/9irWyB/22zwXYs
 TeK6ig1LUdoY5W0gbytm7YXnxG8lLI26hYeJPjgVYAeB1w77G2vUe56MdLbAWPgRl6cr
 sbm3F/L68tmvEOUnHbD/1S4Z8TiXeo/Eu1kheXzrNXXnV2qVvKkV2Ya/ONgNFsLJPGrF
 cig3UNkwDFq1u/D/2Yg5gLhoDYuNGOHVvFJIfGHilR2HrK5c2wkupkJ1eIXIWxNq39S+
 WBsSZIyLkXMhLzNaBEw8yEUET5U027HKLLRHHLjU7vsac7/uzY+5g+mvg3Zs6nxwxs+L
 Nb/g==
X-Gm-Message-State: AOAM533xObWEmQtMDYRgCMfZsG6lf/CTa+cyZVGeIeQHCYkddb8LfE1G
 eF2DqiYIj/McRESFGcaZyqrxYJt86dU=
X-Google-Smtp-Source: ABdhPJx7tBBq36BF09pA2tpsHZBUs4gEpkd/xfwAol/f+pTW/Xty+EObnKbcbxCfKyxUrddoVsgzgw==
X-Received: by 2002:a19:203:: with SMTP id 3mr10772976lfc.77.1595250211918;
 Mon, 20 Jul 2020 06:03:31 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id i22sm3204790ljb.19.2020.07.20.06.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 06:03:29 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2] drm: pl111: Update documentation
Date: Mon, 20 Jul 2020 15:03:27 +0200
Message-Id: <20200720130327.92364-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Russell King <linux@armlinux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove notes about migrating from the old driver which is
retired as all users are now migrated.

Update the text to reflect that we support PL110 and PL111
alike.

Drop the bullet on memory bandwidth scaling: this has been
implemented.

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v1->v2:
- Fix up the documentation rst link as well so we don't
  get build failures in the documentation.
---
 Documentation/gpu/pl111.rst       |  8 ++++----
 drivers/gpu/drm/pl111/pl111_drv.c | 20 +++++---------------
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/Documentation/gpu/pl111.rst b/Documentation/gpu/pl111.rst
index 9b03736d33dd..6d9a1b59a545 100644
--- a/Documentation/gpu/pl111.rst
+++ b/Documentation/gpu/pl111.rst
@@ -1,6 +1,6 @@
-==========================================
- drm/pl111 ARM PrimeCell PL111 CLCD Driver
-==========================================
+====================================================
+ drm/pl111 ARM PrimeCell PL110 and PL111 CLCD Driver
+====================================================
 
 .. kernel-doc:: drivers/gpu/drm/pl111/pl111_drv.c
-   :doc: ARM PrimeCell PL111 CLCD Driver
+   :doc: ARM PrimeCell PL110 and PL111 CLCD Driver
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 96e58fda75d8..46b0d1c4a16c 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -10,18 +10,11 @@
  */
 
 /**
- * DOC: ARM PrimeCell PL111 CLCD Driver
+ * DOC: ARM PrimeCell PL110 and PL111 CLCD Driver
  *
- * The PL111 is a simple LCD controller that can support TFT and STN
- * displays.  This driver exposes a standard KMS interface for them.
- *
- * This driver uses the same Device Tree binding as the fbdev CLCD
- * driver.  While the fbdev driver supports panels that may be
- * connected to the CLCD internally to the CLCD driver, in DRM the
- * panels get split out to drivers/gpu/drm/panels/.  This means that,
- * in converting from using fbdev to using DRM, you also need to write
- * a panel driver (which may be as simple as an entry in
- * panel-simple.c).
+ * The PL110/PL111 is a simple LCD controller that can support TFT
+ * and STN displays. This driver exposes a standard KMS interface
+ * for them.
  *
  * The driver currently doesn't expose the cursor.  The DRM API for
  * cursors requires support for 64x64 ARGB8888 cursor images, while
@@ -29,16 +22,13 @@
  * cursors.  While one could imagine trying to hack something together
  * to look at the ARGB8888 and program reasonable in monochrome, we
  * just don't expose the cursor at all instead, and leave cursor
- * support to the X11 software cursor layer.
+ * support to the application software cursor layer.
  *
  * TODO:
  *
  * - Fix race between setting plane base address and getting IRQ for
  *   vsync firing the pageflip completion.
  *
- * - Use the "max-memory-bandwidth" DT property to filter the
- *   supported formats.
- *
  * - Read back hardware state at boot to skip reprogramming the
  *   hardware when doing a no-op modeset.
  *
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
