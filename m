Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C25E045B26E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 04:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C06C6E18F;
	Wed, 24 Nov 2021 03:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32EBA898BE;
 Wed, 24 Nov 2021 03:06:21 +0000 (UTC)
Received: by mail-qk1-x733.google.com with SMTP id b67so1336010qkg.6;
 Tue, 23 Nov 2021 19:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QCenGapdn8pT6BA4FKRLRxExah4bAbpes3InHq8HGvg=;
 b=UawLjgDp7UuXebp108LzicGASAjyfMpWQdBSpYTCyay8pEQuUdaTl92noI/5GKMkPl
 uzjxtoE2Hxvmmhjce1XE9VK5adj0kjToackYRsvIPi1e0uGWKMHAVRKt4tfH4o7IqEi0
 TC9iq4szjHrO4XPZhsCamPu40+A7rP/2dC01+lSPyQqBRGR+TvqdUXcJSnIJxGgSTVNf
 pgQcspc3raIjtUJIXzq6fqlz70ImZFHiv28ZdjV5EN6qcb9L/01H7BMxz64TerS+cWiB
 Fnfl+KNyv54cf11oNRs7WXnFu6MrMHV1Z4DZuKaEZo8mMLYoyMFrzUaSgzwjTFPXzfdk
 HrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QCenGapdn8pT6BA4FKRLRxExah4bAbpes3InHq8HGvg=;
 b=XD4bxCRlDQZR1fkdaAbPg4sTy8to8tFjNSzxyVhrX4TjfpcVbYcx1T6nOwx+xINmx9
 pU8TOFqOVndG+naQyP11FYRNIoOQqGLyJQJbnXBKCyxJ5uSAZWMawQk5s8bzwZql8xJh
 ooUpoxqYon+LpS7Yt6SCU6ZgRkYDop500ngREDwAyloO3xM127ma+JTwFv/VryVqJEaM
 pRr5bi8Zy1cyXJqXo86+wOvp1mOpgTvXz3KBYkIvwOMyfeYbOfM866oR/0JFrZDd0DXM
 M2vMEMa4Lrh+yN/xxHt3dAQHp2VSWaXJH5GPFTumWfcNbQsXLM9r4jF6bptgWLwc7B8s
 d/OA==
X-Gm-Message-State: AOAM532oZSxVyFeGygxuUax9/fq6nVv40bZsStXKMOCmwoodaJ+kau7D
 oH0EUMesLqrOPGuyf/JE5K8=
X-Google-Smtp-Source: ABdhPJwZTAzMHM0RV0zs9uZ1TEV8MK2HEv7somuIawMXs6UxXRsg4W9y1/otfg50ZrxFMeP2k1Gyeg==
X-Received: by 2002:a05:620a:223:: with SMTP id
 u3mr2434295qkm.158.1637723180323; 
 Tue, 23 Nov 2021 19:06:20 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id d15sm7234780qtd.70.2021.11.23.19.06.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 19:06:20 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: yao.jing2@zte.com.cn
To: jani.nikula@linux.intel.com
Subject: [PATCH] drm/i915/dmabuf: remove duplicate include in i915_gem_dmabuf.c
Date: Wed, 24 Nov 2021 03:06:07 +0000
Message-Id: <20211124030607.34914-1-yao.jing2@zte.com.cn>
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
Cc: tvrtko.ursulin@linux.intel.com, jason@jlekstrand.net, yao.jing2@zte.com.cn,
 thomas.hellstrom@linux.intel.com, airlied@linux.ie, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, rodrigo.vivi@intel.com, Zeal Robot <zealci@zte.com.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yao Jing <yao.jing2@zte.com.cn>

'asm/smp.h' included in 'drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c' is
duplicated. It is clearly included on the 12 line.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Yao Jing <yao.jing2@zte.com.cn>
---
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
index f291cf4c3886..5712b6b5f285 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
@@ -17,9 +17,7 @@
 
 MODULE_IMPORT_NS(DMA_BUF);
 
-#if defined(CONFIG_X86)
-#include <asm/smp.h>
-#else
+#if !defined(CONFIG_X86)
 #define wbinvd_on_all_cpus() \
 	pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
 #endif
-- 
2.25.1

