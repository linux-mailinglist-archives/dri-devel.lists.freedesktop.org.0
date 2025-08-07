Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6168B1D2FE
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 09:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A6F10E7E2;
	Thu,  7 Aug 2025 07:08:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tia6Z3YZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813CF10E7DC;
 Thu,  7 Aug 2025 07:08:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DA45261419;
 Thu,  7 Aug 2025 07:08:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58ADC4CEEB;
 Thu,  7 Aug 2025 07:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754550487;
 bh=C3VM1bITsfuRyW9zueWhlegNs14fCUR6OGnnYlAim0s=;
 h=From:To:Cc:Subject:Date:From;
 b=tia6Z3YZFsu6d6DMNWf2EPI/fjggQFPDmRP/eXBw0ASjJHRHH5OS1FssKJscFDY7T
 xEIsnqWhEWIisvLftESaqh81c4dgFD+WyvjG7wLuyhF9kwT2S0UNLOFcvasO4bMJWW
 tubHar6Uey3KheTZgpywvRPn4v/YYQkKYN2GaqKkKRRpWe2XnuaT9TzyaYMTctIhft
 x27qIU8T5ZUL5Ql1YPBd9ea+og0YtlYHRXtcWhHnEX46FuJSpcDq5WIMXLjtzuQXvt
 etNKOtwCCg2l1vN7gSVKAN+T67jgNkj+3a1zxabpE4SNmNX41JkF3neeok4OmgG8nY
 va05At/Ud3LjA==
From: Philipp Stanner <phasta@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Philipp Stanner <phasta@kernel.org>
Subject: [PATCH] MAINTAINERS: Add website of Nova GPU driver
Date: Thu,  7 Aug 2025 09:07:57 +0200
Message-ID: <20250807070756.103816-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
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

The Nova GPU driver has a sub-website on the Rust-for-Linux website
which so far was missing from the respective section in MAINTAINERS.

Add the Nova website.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd62ad58a47f..3588d43894c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7829,6 +7829,7 @@ M:	Danilo Krummrich <dakr@kernel.org>
 M:	Alexandre Courbot <acourbot@nvidia.com>
 L:	nouveau@lists.freedesktop.org
 S:	Supported
+W:	https://rust-for-linux.com/nova-gpu-driver
 Q:	https://patchwork.freedesktop.org/project/nouveau/
 B:	https://gitlab.freedesktop.org/drm/nova/-/issues
 C:	irc://irc.oftc.net/nouveau
@@ -7840,6 +7841,7 @@ DRM DRIVER FOR NVIDIA GPUS [RUST]
 M:	Danilo Krummrich <dakr@kernel.org>
 L:	nouveau@lists.freedesktop.org
 S:	Supported
+W:	https://rust-for-linux.com/nova-gpu-driver
 Q:	https://patchwork.freedesktop.org/project/nouveau/
 B:	https://gitlab.freedesktop.org/drm/nova/-/issues
 C:	irc://irc.oftc.net/nouveau
-- 
2.49.0

