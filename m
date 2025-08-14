Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A19B26463
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 13:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F6CA10E0C1;
	Thu, 14 Aug 2025 11:35:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="GhXYMl81";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C2310E84F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 11:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
 bh=h17YFkfTuCB8eF+5nF50XzxDOJoEYvolvGJ2ABR+gec=; b=GhXYMl81k8akaGISyLLNeZZWSO
 Oo7W3tx9a30VuJq18QJP2R+cu4XpjRSpNSW48RROO93J+kbPFZV0xIYndRBgoWruhlv9xQOIKUf3g
 LcbR7uxUZTuSq0r7dQ0NOv8LDZnSjXqt5tE4dDP7zeonAnE1YRVvF5bVm7GBlYQn9I/svnlFcsCj/
 EgoHCFxQbKmNfn1b9r5c/EbgTR4OzEgIWiiwBTFa2wsRnT3FeS0JjHfO4NtYFSfrjl7ZAhjjS7POW
 Wmx0NGYjixfynDQmJ80XGKW5rtirbqg93+JHGYyhXxUTCjXCVJ3odBxHWbbVc5H5B/NnpmaHHMJz1
 g/baw9hw==;
Received: from i53875b38.versanet.de ([83.135.91.56] helo=phil..)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1umWEz-0003Km-AS; Thu, 14 Aug 2025 13:35:29 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: tomeu@tomeuvizoso.net
Cc: ogabbay@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, heiko@sntech.de
Subject: [PATCH 1/2] accel/rocket: Fix indentation of Kconfig entry
Date: Thu, 14 Aug 2025 13:35:18 +0200
Message-ID: <20250814113519.1551855-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250814113519.1551855-1-heiko@sntech.de>
References: <20250814113519.1551855-1-heiko@sntech.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The general indentation for the Kconfig lines is one tab, so adapt the
lines accordingly.

The description is correctly indented (1 tab + 2 spaces) so doesn't need
changes.

Fixes: ed98261b4168 ("accel/rocket: Add a new driver for Rockchip's NPU")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/accel/rocket/Kconfig | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/rocket/Kconfig b/drivers/accel/rocket/Kconfig
index 43d6cd98ec8e..af6cda273892 100644
--- a/drivers/accel/rocket/Kconfig
+++ b/drivers/accel/rocket/Kconfig
@@ -1,14 +1,14 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 config DRM_ACCEL_ROCKET
-       tristate "Rocket (support for Rockchip NPUs)"
-       depends on DRM
-       depends on (ARCH_ROCKCHIP && ARM64) || COMPILE_TEST
-       depends on ROCKCHIP_IOMMU || COMPILE_TEST
-       depends on MMU
-       select DRM_SCHED
-       select DRM_GEM_SHMEM_HELPER
-       help
+	tristate "Rocket (support for Rockchip NPUs)"
+	depends on DRM
+	depends on (ARCH_ROCKCHIP && ARM64) || COMPILE_TEST
+	depends on ROCKCHIP_IOMMU || COMPILE_TEST
+	depends on MMU
+	select DRM_SCHED
+	select DRM_GEM_SHMEM_HELPER
+	help
 	  Choose this option if you have a Rockchip SoC that contains a
 	  compatible Neural Processing Unit (NPU), such as the RK3588. Called by
 	  Rockchip either RKNN or RKNPU, it accelerates inference of neural
-- 
2.47.2

