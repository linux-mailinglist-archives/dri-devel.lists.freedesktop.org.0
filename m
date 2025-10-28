Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EC6C143BB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 12:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D8310E1DE;
	Tue, 28 Oct 2025 11:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b52i6V+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8397710E1DE;
 Tue, 28 Oct 2025 11:01:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 52B2243B89;
 Tue, 28 Oct 2025 11:01:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92591C4CEE7;
 Tue, 28 Oct 2025 11:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761649271;
 bh=VnugrDxmsK2Ym8d6zp8daZgi+0PDrulHuvbm8JV01M4=;
 h=From:To:Cc:Subject:Date:From;
 b=b52i6V+yJVbDrpkBMouKvroH8gYcfa/iIuKHx1EkRSsWCsqYowVj8yrgxrUYz7+7F
 HKdxiTkck+xZ9EvOgWh8x3Bh/God4IIpvt+krS2VE7ArsP8783P2SNoS3rPpoxTUXj
 zuvW7t+pX09UOikQC1NySNHvn0nyW2D1p9P+Kbyf4AL408O1wj/61cqvTAD476GvJZ
 sTxijDO8ViEvsARmG1cg87nNe2XmXB9L9t8Zpd5LetStiJcO5c8DqhfcIBFz469SGf
 C/TlcBntTTgDSYDzdsAaGZwj2GNUm1douBTJ7H2SZkvGGUqrOe+ghh2NPCjiqm6oqJ
 0dC1Wr8w/6zXA==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com,
	acourbot@nvidia.com,
	jhubbard@nvidia.com
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] drm: nova: depend on CONFIG_64BIT
Date: Tue, 28 Oct 2025 12:00:52 +0100
Message-ID: <20251028110058.340320-1-dakr@kernel.org>
X-Mailer: git-send-email 2.51.0
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

nova-core already depends on CONFIG_64BIT, hence also depend on
CONFIG_64BIT for nova-drm.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nova/Kconfig b/drivers/gpu/drm/nova/Kconfig
index cca6a3fea879..2a70aac64d7e 100644
--- a/drivers/gpu/drm/nova/Kconfig
+++ b/drivers/gpu/drm/nova/Kconfig
@@ -1,5 +1,6 @@
 config DRM_NOVA
 	tristate "Nova DRM driver"
+	depends on 64BIT
 	depends on DRM=y
 	depends on PCI
 	depends on RUST
-- 
2.51.0

