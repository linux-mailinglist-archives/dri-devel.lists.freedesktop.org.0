Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1DF5C143C3
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 12:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E25A10E383;
	Tue, 28 Oct 2025 11:01:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pQAFDGVJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 755A510E37A;
 Tue, 28 Oct 2025 11:01:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5DC7E4322D;
 Tue, 28 Oct 2025 11:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF27C4CEF7;
 Tue, 28 Oct 2025 11:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761649273;
 bh=joNqstAaux1Uvo9uDnCaO8dixJ1y2Pgk6LVKAnRsZX4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pQAFDGVJ1y4A3KKufiPbMhU/SUwTsMc61uR+qjG39F+0j4aaYttRmAnp7me2xMcqu
 Qkl+LW69LZWorBe55LroyroUwBZqJ3SBUr45t3o/gbpAwRcI5haW5bjXpzer33Y+wF
 NW7e7Hl1cCnqDYEzntkDzfqZhrq+/zHZIqLGgwbMaUnYNYzDeaUVj4yJ1jbX/l8+r5
 mt85/0b4Pq3fGu75TuA1+TIYhWpfwLkKhteVURZfq83jy8YIBxRbYJ6O3ZL/FL+IOU
 /pk7FqNl3zy5sZqJYRhoR7tj7Xjlb0EexQoW88WaUcXVBB5GxOlyi2Qs5uVxfW7IXE
 jPURASoIkmKsg==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com,
	acourbot@nvidia.com,
	jhubbard@nvidia.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/2] drm: nova: select NOVA_CORE
Date: Tue, 28 Oct 2025 12:00:53 +0100
Message-ID: <20251028110058.340320-2-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251028110058.340320-1-dakr@kernel.org>
References: <20251028110058.340320-1-dakr@kernel.org>
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

The nova-drm driver does not provide any value without nova-core being
selected as well, hence select NOVA_CORE.

Fixes: cdeaeb9dd762 ("drm: nova-drm: add initial driver skeleton")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nova/Kconfig b/drivers/gpu/drm/nova/Kconfig
index 2a70aac64d7e..3e637ad7b5ba 100644
--- a/drivers/gpu/drm/nova/Kconfig
+++ b/drivers/gpu/drm/nova/Kconfig
@@ -5,6 +5,7 @@ config DRM_NOVA
 	depends on PCI
 	depends on RUST
 	select AUXILIARY_BUS
+	select NOVA_CORE
 	default n
 	help
 	  Choose this if you want to build the Nova DRM driver for Nvidia
-- 
2.51.0

