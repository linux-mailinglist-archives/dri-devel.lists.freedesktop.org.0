Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D999BEF519
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 06:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 326B310E029;
	Mon, 20 Oct 2025 04:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ksOg13+z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E3210E029
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 04:56:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 94E4944D41;
 Mon, 20 Oct 2025 04:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52A0CC4CEF9;
 Mon, 20 Oct 2025 04:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760936179;
 bh=nrXnqlV7dTZ3tYdmSQOtQfvcxz6jaOoC+0u6XE9jwfs=;
 h=From:To:Cc:Subject:Date:From;
 b=ksOg13+zPrC8xxnakzV8VSglMoxWAQWwFCALpTQZjBj0uaOZIuqs5AsDrSQUiLu5x
 deqimQfqaWCXc0ydoHo0xutavQJactWCZFIOkNG3dmJuEq1ATiLiyWJmqvY3p4ekxS
 ofr1Tr34OLOxkZBFWSuMQJBhPDa1aPkTMMk2cVDaaXsWtxrXEEPHVv4E/LbiW+0+hJ
 NKf0S6a3qxhC8E81lhMuVcv6BpRsEU6yCMsggk5MQYpbdHgn5L8x+1OcBvgnzeaWOA
 wpmzEMM56UTcnailUMcW+r2o8ywQIkRyy+CHlCoZTT/IgDfg1hHI4JXls+exi+HCmA
 Yk12jphbh2PCQ==
Received: by wens.tw (Postfix, from userid 1000)
 id 4EC1B5FDC3; Mon, 20 Oct 2025 12:56:17 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>
Cc: Lee Jones <lee@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH resend] MAINTAINERS: Update Chen-Yu's email address
Date: Mon, 20 Oct 2025 12:56:02 +0800
Message-ID: <20251020045603.2573544-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
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

The email forwarder I'm using has run into severe problems with Gmail
lately. Switch over to my kernel.org address for kernel development.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
(resent to correct dri-devel mailing list address)

This likely needs to go through drm-misc-next following a patch from
Maxime that removed himself from the Allwinner DRM driver entries.

 .mailmap    | 1 +
 MAINTAINERS | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/.mailmap b/.mailmap
index ea92027981fb..1a2a61c02ee7 100644
--- a/.mailmap
+++ b/.mailmap
@@ -173,6 +173,7 @@ Carlos Bilbao <carlos.bilbao@kernel.org> <bilbao@vt.edu>
 Changbin Du <changbin.du@intel.com> <changbin.du@gmail.com>
 Chao Yu <chao@kernel.org> <chao2.yu@samsung.com>
 Chao Yu <chao@kernel.org> <yuchao0@huawei.com>
+Chen-Yu Tsai <wens@kernel.org> <wens@csie.org>
 Chester Lin <chester62515@gmail.com> <clin@suse.com>
 Chris Chiu <chris.chiu@canonical.com> <chiu@endlessm.com>
 Chris Chiu <chris.chiu@canonical.com> <chiu@endlessos.org>
diff --git a/MAINTAINERS b/MAINTAINERS
index 1ce0b7628450..34acf513d7fc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2302,7 +2302,7 @@ S:	Maintained
 F:	drivers/clk/sunxi/
 
 ARM/Allwinner sunXi SoC support
-M:	Chen-Yu Tsai <wens@csie.org>
+M:	Chen-Yu Tsai <wens@kernel.org>
 M:	Jernej Skrabec <jernej.skrabec@gmail.com>
 M:	Samuel Holland <samuel@sholland.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
@@ -7641,7 +7641,7 @@ F:	drivers/accel/
 F:	include/drm/drm_accel.h
 
 DRM DRIVER FOR ALLWINNER DE2 AND DE3 ENGINE
-M:	Chen-Yu Tsai <wens@csie.org>
+M:	Chen-Yu Tsai <wens@kernel.org>
 R:	Jernej Skrabec <jernej.skrabec@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
@@ -8255,7 +8255,7 @@ F:	drivers/gpu/nova-core/
 F:	rust/kernel/drm/
 
 DRM DRIVERS FOR ALLWINNER A10
-M:	Chen-Yu Tsai <wens@csie.org>
+M:	Chen-Yu Tsai <wens@kernel.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
@@ -27754,7 +27754,7 @@ F:	drivers/acpi/pmic/intel_pmic_xpower.c
 N:	axp288
 
 X-POWERS MULTIFUNCTION PMIC DEVICE DRIVERS
-M:	Chen-Yu Tsai <wens@csie.org>
+M:	Chen-Yu Tsai <wens@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 N:	axp[128]
-- 
2.47.3

