Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF707C1426D
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 11:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9EE10E0BC;
	Tue, 28 Oct 2025 10:44:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oqIuLxKn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0980C10E0BC
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 10:44:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8151648D04;
 Tue, 28 Oct 2025 10:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1953FC4CEE7;
 Tue, 28 Oct 2025 10:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761648282;
 bh=Vew93ZOaF3PEzyOv7+dX4417p2dogo24fKYnwZRv6+8=;
 h=From:To:Cc:Subject:Date:From;
 b=oqIuLxKnhhcjGXGZEvyNq/d/3wegF7fARjdw+1ObY65Uesgs/DS2yOzquYCgiO2UY
 TxyclsCosQFA23byll/sdh5opMa2F66FJXFAsVX9M/UfC0MnRoFXVJfUFsgBuCVWUi
 mFS+Cq2NJ7VA7jwMdgzxYs7eufAYuBRXQNkK/LmIWkQKdaRaAl2KbYMwoVle1Fj81I
 97RUqwSCpAg7tk43x1toyzdNMhnFHm6XIxAmWDODE9hCvc7WxNcDUycfLi0rSnU+Q6
 K0CDHbF7jDwrLRZxHo4Z9MEAyd3cgMxxROSGbQenKOKatMsY6g2vtK/Sik4HXVr/KR
 7x6TJSgSAMuyw==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
Subject: [PATCH] MAINTAINERS: add Tyr to DRM DRIVERS AND COMMON INFRASTRUCTURE
 [RUST]
Date: Tue, 28 Oct 2025 11:44:27 +0100
Message-ID: <20251028104433.334886-1-dakr@kernel.org>
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

Commit cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali
GPUs") introduced the Tyr driver for ARM Mali GPUs, which is maintained
through the drm-rust tree, hence add it to the corresponding entry in
MAINTAINERS.

Cc: Daniel Almeida <daniel.almeida@collabora.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 545a4776795e..952aed4619c2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8247,6 +8247,7 @@ S:	Supported
 W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
 T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git
 F:	drivers/gpu/drm/nova/
+F:	drivers/gpu/drm/tyr/
 F:	drivers/gpu/nova-core/
 F:	rust/kernel/drm/
 
-- 
2.51.0

