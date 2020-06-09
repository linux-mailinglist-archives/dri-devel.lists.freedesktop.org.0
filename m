Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B4E1F47C0
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 22:08:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1BBB898EA;
	Tue,  9 Jun 2020 20:08:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E6089CCB
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 20:08:11 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id 82so86905lfh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jun 2020 13:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mxgPzGFEpIj0w655f2Gez82/rG51Vivc/8hTpLpCcS8=;
 b=QS/XZMVqk5N+EqlleKn/HR2AEg9MHYFjSHMestIwSdS40KUgpJZtbzvAu38feUuL+X
 g06rNQchEK0EXJpAtNK9J+lmVo/5fkF4Wzqx9kE1wyXjgxr4WpKd58pwVPAUOhRoa8oZ
 7YqtQpuU+rBeemzQkjN0fcsu51fAqKMrIRjpKiHand6svoftAjR1YJnVt1Z/Zlf1IQGi
 FdsUk38o0SuxrQTTlzK9JQpSNwT6ajyGWr3SbodDLUG3xPfLAJRG/ZKQqMmEKelW3UzD
 oCqjE28v5U4HUyqQn4OrMQPig6KnooC6wmO4sisXSQF9Xo3+fAQIk9iOwgjFPVM/3cMr
 d+Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mxgPzGFEpIj0w655f2Gez82/rG51Vivc/8hTpLpCcS8=;
 b=ItR+ikuVgjz6GolBrSXVE1VvCA6LVd9VMJb90kjgKdoxEQiGXy761bNeHgViLMzdmz
 RcglBJrfqjDk84mvKd/OiZJ7MbrDAyZWgxHzhE0psgxcfPXZl1DgiERqfQyOzcA8V3b4
 IXc/lQoS591BQk7jFmZpyWxR2ebqJfE4uGKRPCmSpRW+cpUF5Ncb00dffukmCjCywCR3
 skSG2QLdUgObUsdxuRqsXWleAOaXTSmRZvj8BdC3CN88PAgj+A1JnX/THsywWZNQ05C1
 NlwZcduS5QKjWLBb53Hz+2NNyHwrm5WyDePd0Xn2yM9FIB77JALQ0bz/M9E+spqKYLpW
 J+BQ==
X-Gm-Message-State: AOAM532xMS3n49TPqOytH9bXtHPpnMRW+dweT6KS0SmAmGLvN3U2zDAE
 UWvJHG8RdK0+EAi4cXuJ5AR/VKi0w7A=
X-Google-Smtp-Source: ABdhPJx0B9LZJczm7E1med6jrxJJu1CwbVa0kzHkJ1YSSDTj3cYRpUyfdN5XSNfb232YlK0KOxQQWQ==
X-Received: by 2002:a19:356:: with SMTP id 83mr16413808lfd.179.1591733289625; 
 Tue, 09 Jun 2020 13:08:09 -0700 (PDT)
Received: from localhost.localdomain
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id 66sm6038579lfk.54.2020.06.09.13.08.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 13:08:08 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Eric Anholt <eric@anholt.net>, Russell King <linux@armlinux.org.uk>
Subject: [PATCH 4/4] drm: pl111: Update documentation
Date: Tue,  9 Jun 2020 22:04:46 +0200
Message-Id: <20200609200446.153209-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200609200446.153209-1-linus.walleij@linaro.org>
References: <20200609200446.153209-1-linus.walleij@linaro.org>
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
Cc: linux-arm-kernel@lists.infradead.org
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
 drivers/gpu/drm/pl111/pl111_drv.c | 20 +++++---------------
 1 file changed, 5 insertions(+), 15 deletions(-)

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
2.25.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
