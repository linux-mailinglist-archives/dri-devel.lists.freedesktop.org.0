Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8330AA85054
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 01:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EFC10EA8E;
	Thu, 10 Apr 2025 23:56:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bRGTBGbM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C3210EA8E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Apr 2025 23:56:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id D2D46A4768D;
 Thu, 10 Apr 2025 23:51:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0AA9C4CEDD;
 Thu, 10 Apr 2025 23:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744329410;
 bh=wD7yKJZ0nhyYu7XvsWNjr2WHgkyBprIhC0Fvu9cLs3g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bRGTBGbM/znZQMDEEZwSRNLiKgGvc9sgvs/jeBY/gs+A9Rw2P9fMR29cLRvQEy032
 KzEdrSRuEvwypUU8KkV42NydDhWBzzvKrI93gNdJjMWE8pBdDgddLayWeeDvpspbEm
 SGN+gzOb/AFnznTBU/1eaOzKZgniL8Ur3EKQOm9ZHovkPcwgEw28SMxeleocQp6ASB
 Ez7edRIuRXIEY9eeUkjwvOAzauMyEh3ahJ9Du4XvGSGuEtqM4Stsd1HkL6+JYfneXJ
 y0Cu0dMntDuQy9qE/3wSNcR/xAwhyQObKpgKLLFds8XiaRcFIciyI+SQN/neCFEo2C
 FWl99Di44ywng==
From: Danilo Krummrich <dakr@kernel.org>
To: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
 lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
 alyssa@rosenzweig.io
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 8/8] MAINTAINERS: add DRM Rust source files to DRM DRIVERS
Date: Fri, 11 Apr 2025 01:55:27 +0200
Message-ID: <20250410235546.43736-9-dakr@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410235546.43736-1-dakr@kernel.org>
References: <20250410235546.43736-1-dakr@kernel.org>
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

Add the DRM Rust source files to the DRM DRIVERS maintainers entry.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 96b827049501..a975fa8d262f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7798,6 +7798,7 @@ F:	Documentation/devicetree/bindings/display/
 F:	Documentation/devicetree/bindings/gpu/
 F:	Documentation/gpu/
 F:	drivers/gpu/
+F:	rust/kernel/drm/
 F:	include/drm/
 F:	include/linux/vga*
 F:	include/uapi/drm/
@@ -7814,6 +7815,7 @@ F:	Documentation/devicetree/bindings/gpu/
 F:	Documentation/gpu/
 F:	drivers/gpu/drm/
 F:	drivers/gpu/vga/
+F:	rust/kernel/drm/
 F:	include/drm/drm
 F:	include/linux/vga*
 F:	include/uapi/drm/
-- 
2.49.0

