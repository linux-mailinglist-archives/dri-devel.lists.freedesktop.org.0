Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551B2BD875D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 11:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D5110E056;
	Tue, 14 Oct 2025 09:36:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OtvIm0on";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A8710E056
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 09:36:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3DDC643780;
 Tue, 14 Oct 2025 09:36:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB57C4CEE7;
 Tue, 14 Oct 2025 09:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760434592;
 bh=/qBX03VV6/7oks3yS/UR5N7CR+F4b0JOWwSa1hOPM4U=;
 h=From:To:Cc:Subject:Date:From;
 b=OtvIm0on9uFFsIthyc6HmE8Kdtv2BHgtYlC0Hbf7yoKm9vIzng892m8q2h4P6kAz/
 OPCTBom1xoeyqZjJUaMwtS1tSy2FNeuFcVC+McE6H/P93H9lNa32JG1b2F38uiC0K0
 7mLDdGdui1luwwa6+xjiUNXWYWRR+4ftsmX1fbMPGm67tobSbZVK+KKDA5hnNV0SSg
 eSg/apRCEjNFKqJUV2Pd2ExDYEz//ix/bNZ+OvfGq57WgU5Rsh6/7jOUuG5hcRMdgF
 Ga2Re+9e1zHu+7tKvpertEeW4Bs37X8ZwbMjRad1IYmFxQ4DV4F0k5hJ1drVCyadFr
 9glKTcnbdlS4Q==
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>, Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [PATCH] MAINTAINERS: Remove myself for sun4i DRM driver
Date: Tue, 14 Oct 2025 11:36:28 +0200
Message-ID: <20251014093628.564265-1-mripard@kernel.org>
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

I haven't been involved with the driver for a while. Let's reflect that.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 MAINTAINERS | 2 --
 1 file changed, 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..7875149c919e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7634,11 +7634,10 @@ T:	git https://git.kernel.org/pub/scm/linux/kernel/git/ogabbay/accel.git
 F:	Documentation/accel/
 F:	drivers/accel/
 F:	include/drm/drm_accel.h
 
 DRM DRIVER FOR ALLWINNER DE2 AND DE3 ENGINE
-M:	Maxime Ripard <mripard@kernel.org>
 M:	Chen-Yu Tsai <wens@csie.org>
 R:	Jernej Skrabec <jernej.skrabec@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
@@ -8248,11 +8247,10 @@ T:	git https://gitlab.freedesktop.org/drm/rust/kernel.git
 F:	drivers/gpu/drm/nova/
 F:	drivers/gpu/nova-core/
 F:	rust/kernel/drm/
 
 DRM DRIVERS FOR ALLWINNER A10
-M:	Maxime Ripard <mripard@kernel.org>
 M:	Chen-Yu Tsai <wens@csie.org>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/allwinner*
-- 
2.51.0

