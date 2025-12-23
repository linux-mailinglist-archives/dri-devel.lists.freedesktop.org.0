Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898CACD92A8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 13:04:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BB310E043;
	Tue, 23 Dec 2025 12:04:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kxT5/ZBG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EE5910E043
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 12:04:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ECDB544383;
 Tue, 23 Dec 2025 12:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE713C113D0;
 Tue, 23 Dec 2025 12:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766491487;
 bh=mckLwRkfGzMTWSYhXWdOIvNIuwgtZdqY7fZ5tXiEo6U=;
 h=From:To:Cc:Subject:Date:From;
 b=kxT5/ZBGu262VmV/8pa9lI15gM8hh3gIgShgZSLzQgyjjjY5wntMP68NTyoirZi3p
 yVvZshtmtswbjwnKBALRwn584zFyNI134jB/pKQ27ah/71I7BY1L68jiODA8jYmaNo
 YMG7VuDYlCywLJOdF75nEQkvz/MMyHUvhL+bLnKfmRK430J3NpgzoJJ/ZQfHWywgLL
 /ejY0c9CDTmg2P9IWVD8pxhz+IkQhTyuLJ/JrVnUo5QmCXamobYdA8JxJz5ll5ePOm
 1q1OTrsV+zwSBfQIFXSz4nwdxW1lt8KsD2WlCIAWSmtQy08W+X5f3Fd9W8BwIKZqFo
 3sixlUyAqPw0A==
From: Danilo Krummrich <dakr@kernel.org>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 daniel.almeida@collabora.com, aliceryhl@google.com,
 boris.brezillon@collabora.com, carsten.haitzler@foss.arm.com,
 beata.michalska@arm.com
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] MAINTAINERS: exclude the tyr driver from DRM MISC
Date: Tue, 23 Dec 2025 13:04:34 +0100
Message-ID: <20251223120436.33233-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
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

The ARM MALI TYR DRM DRIVER is already maintained through the drm-rust
tree, hence exclude it from drm-misc.

Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GPUs")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..4c72eca29e50 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8357,6 +8357,7 @@ X:	drivers/gpu/drm/msm/
 X:	drivers/gpu/drm/nova/
 X:	drivers/gpu/drm/radeon/
 X:	drivers/gpu/drm/tegra/
+X:	drivers/gpu/drm/tyr/
 X:	drivers/gpu/drm/xe/
 
 DRM DRIVERS AND COMMON INFRASTRUCTURE [RUST]
-- 
2.52.0

