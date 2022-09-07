Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C185AFF4A
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 10:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5554710E474;
	Wed,  7 Sep 2022 08:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4AE89209
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 08:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pc7pEtDwcYVFEJuYVAoJKQqwwvMB2B5UCnI1TfHlPOE=; b=zL9qqgeZWf6Nqv6CZ/aMWTXvKB
 4HooJoxEcEwGEsPYD7pZCYg6oaP5N4brSdOTniISEn6369Xt3IZ0w+j71rBXMj8ksoMF+3ZFjKcnd
 GEp5e05VxK3CV2GHYPIr4qIPYuZ6gRz0MXCBybmOzcNJwd8syE5bHm9zbBtDA/toUnxgYWptUdbZv
 SQpVbBozbu7oA65HYs9cM7rNYqLbeIZeaOv6Zk6TGnLJ4yjFD+Tpi6nAlBjynHcZ2AgLVR/+lLaMH
 67Mx2iwdKzKma5XPvTdf5Lj/5FQplibN77wq3lKWfUkjdVz/gFcAFZW2y+xR8qmBquvyORMpLDp0r
 KjIwPfwA==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70]
 helo=toshino.localdomain) by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <cyndis@kapsi.fi>)
 id 1oVqaE-00DbXj-UX; Wed, 07 Sep 2022 11:38:54 +0300
From: Mikko Perttunen <cyndis@kapsi.fi>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/3] dt-bindings: Add Host1x context stream IDs on Tegra234
Date: Wed,  7 Sep 2022 11:38:43 +0300
Message-Id: <20220907083844.2486805-3-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220907083844.2486805-1-cyndis@kapsi.fi>
References: <20220907083844.2486805-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

Add defines for stream IDs used for Host1x context isolation
on Tegra234. The same stream IDs are used for both NISO0 and
NISO1 SMMUs since Host1x's stream ID protection tables don't
make a distinction between the two.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 include/dt-bindings/memory/tegra234-mc.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/dt-bindings/memory/tegra234-mc.h b/include/dt-bindings/memory/tegra234-mc.h
index 75f0bd30d365..d9b21b64ed73 100644
--- a/include/dt-bindings/memory/tegra234-mc.h
+++ b/include/dt-bindings/memory/tegra234-mc.h
@@ -35,6 +35,16 @@
 #define TEGRA234_SID_NVDEC	0x29
 #define TEGRA234_SID_VIC	0x34
 
+/* Shared stream IDs */
+#define TEGRA234_SID_HOST1X_CTX0	0x35
+#define TEGRA234_SID_HOST1X_CTX1	0x36
+#define TEGRA234_SID_HOST1X_CTX2	0x37
+#define TEGRA234_SID_HOST1X_CTX3	0x38
+#define TEGRA234_SID_HOST1X_CTX4	0x39
+#define TEGRA234_SID_HOST1X_CTX5	0x3a
+#define TEGRA234_SID_HOST1X_CTX6	0x3b
+#define TEGRA234_SID_HOST1X_CTX7	0x3c
+
 /*
  * memory client IDs
  */
-- 
2.37.0

