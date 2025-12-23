Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86FA6CD9290
	for <lists+dri-devel@lfdr.de>; Tue, 23 Dec 2025 13:00:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C28B210E23D;
	Tue, 23 Dec 2025 12:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PdPoUgZ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB76A10E23D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 12:00:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1C795600CB;
 Tue, 23 Dec 2025 12:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE788C116D0;
 Tue, 23 Dec 2025 12:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766491204;
 bh=PrnVL3Ai7vAVbszzPGgoWaL7YT79xcQUNZBQhUgx82w=;
 h=From:To:Cc:Subject:Date:From;
 b=PdPoUgZ+himWZazbQU+7oUUc9CZgbDUH/WYGdaTY8SsSv/F94jDUWAWclEI8iouka
 LKlmR9XKe1p9b6orANO/ubkbsdcavkqmh9iFuzmsPQkhLoCfvyGTqvevD+/tikW8Mr
 UYHo7IWUZtV281IsvHVZRD9OdBg0CWXwWCenS3SE9Z58CE/n462dIC+p0qKkkPv1u3
 stXGLWRtGIbOxsCWhBzDtnb7x3Z+8e3DQTxXUbmseYTO6WhyKY7/5X73jaxL7v6VGv
 SN2HBEWTVF93Fj7uRhAFrf7e8WIM/DcNBVaH3GdROhFkPej7jv1gPPPRaaJxBjO/Ce
 MOaOU6vIWN6Iw==
From: Danilo Krummrich <dakr@kernel.org>
To: daniel.almeida@collabora.com, aliceryhl@google.com, tamird@kernel.org,
 boris.brezillon@collabora.com, carsten.haitzler@foss.arm.com,
 beata.michalska@arm.com
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] MAINTAINERS: fix typo in TYR DRM driver entry
Date: Tue, 23 Dec 2025 12:59:47 +0100
Message-ID: <20251223115949.32531-1-dakr@kernel.org>
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

Fix a missing ':' in the ARM MALI TYR DRM DRIVER entry, which does
prevent script/get_maintainer.pl to properly work and pick up the
corresponding maintainers.

Fixes: cf4fd52e3236 ("rust: drm: Introduce the Tyr driver for Arm Mali GPUs")
Reported-by: Tamir Duberstein <tamird@kernel.org>
Closes: https://lore.kernel.org/lkml/CAJ-ks9mrZtnPUjp5tD03hW+TyS0M9i-KRF_ramNY-oh-0X+ayA@mail.gmail.com/
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5b11839cba9d..fe1e8da6c2bb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2158,7 +2158,7 @@ M:	Alice Ryhl <aliceryhl@google.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 W:	https://rust-for-linux.com/tyr-gpu-driver
-W	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
+W:	https://drm.pages.freedesktop.org/maintainer-tools/drm-rust.html
 B:	https://gitlab.freedesktop.org/panfrost/linux/-/issues
 T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git
 F:	Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
-- 
2.52.0

