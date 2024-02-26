Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53AB867A06
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 16:21:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB58E10E44C;
	Mon, 26 Feb 2024 15:21:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TKrhwEw/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F3E10E44C
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 15:21:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7438DCE1669;
 Mon, 26 Feb 2024 15:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 583EFC433F1;
 Mon, 26 Feb 2024 15:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708960886;
 bh=mpRn9Rcm7VATa1cHipSb5H+sKFU/6yn687vkghsLcK4=;
 h=From:To:Cc:Subject:Date:From;
 b=TKrhwEw/4ChpR7K+HVt0xdtd9QNhXhwO2aIXC0VP2NReC0C0nqr0+FsPHxOvUH4ro
 IjsDv0ic3klbzYHPXL7uZ2ATJfVKvSGReOUrBYZc5vsJjFCUJ9SqEpRdtfixoVVNQz
 u7RxLLPGfRWsuKcJGUmZYRO5GoMUTJj/z69zaDKzfvOL1TopICLiFv7wW+ct/UKXn6
 QLIHalc2WVv/5+EVDlKWiwMQ4znuBwrwfnom9Zm78YT3WMhwdi/al8+VrnM7NLlO0X
 aMlTwSxD6VnustwiG8lFd8vkFv6A7C+P6NgkC5QfgOZgHDK8nFLMrtqLyGvShbfsV9
 BsUZfjGawR8eQ==
From: Maxime Ripard <mripard@kernel.org>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Cc: Daniel Stone <daniels@collabora.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: [PATCH] MAINTAINERS: Update drm.git URL
Date: Mon, 26 Feb 2024 16:21:23 +0100
Message-ID: <20240226152123.131406-1-mripard@kernel.org>
X-Mailer: git-send-email 2.43.2
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

Now that the main DRM tree has moved to Gitlab, adjust the MAINTAINERS
git trees to reflect the location change.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e7e7c378913..00e8a8ff627e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -614,7 +614,7 @@ AGPGART DRIVER
 M:	David Airlie <airlied@redhat.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
-T:	git git://anongit.freedesktop.org/drm/drm
+T:	git https://gitlab.freedesktop.org/drm/kernel.git
 F:	drivers/char/agp/
 F:	include/linux/agp*
 F:	include/uapi/linux/agp*
@@ -6996,7 +6996,7 @@ L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 B:	https://gitlab.freedesktop.org/drm
 C:	irc://irc.oftc.net/dri-devel
-T:	git git://anongit.freedesktop.org/drm/drm
+T:	git https://gitlab.freedesktop.org/drm/kernel.git
 F:	Documentation/devicetree/bindings/display/
 F:	Documentation/devicetree/bindings/gpu/
 F:	Documentation/gpu/
-- 
2.43.2

