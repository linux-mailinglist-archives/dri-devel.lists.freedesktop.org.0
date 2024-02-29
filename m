Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C7686CED6
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 17:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF91610E539;
	Thu, 29 Feb 2024 16:23:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="xTJu/1Zo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F9310E500
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 16:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1709223773;
 bh=RZzGy61eONkphJ37nSwVAvmrGcU+XCN6ZpBBfcPi3AU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=xTJu/1Zo8/X0x8HVIpznx1MXLaYAy8o4jlHNUAN0fsdX/PY00tSBrK5AmCsPK9YTT
 GWf6mICJtn5hLRB1YGcqkNQLngMDH3Dea/h4rmSGvKGilF3XKkM5+ZnnMeUrGvB9PB
 N4Cgmw9H+1jEPrJHtB3IDHpOyzbJ4bTscN9jG4Lj01T56UOZube7WpUuW/3BZuOOGy
 fR9YsT7o75ra/okyf7mFtdeF9+VVUJzL/Q7s/vjK6+bSsC8o7H30+Tk+gBwWk3APOB
 btDnODttSceXAU/3kQ3Bxw11iaEC73g2orZfCZHMAdoPqOToLAq5+m7fbljjxmoSD1
 LtRZqvkYN/BpQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id BEDA937820F3;
 Thu, 29 Feb 2024 16:22:52 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel@ffwll.ch>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 kernel@collabora.com, Heiko Stuebner <heiko@sntech.de>,
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Chris Diamand <chris.diamand@foss.arm.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v6 14/14] drm/panthor: Add an entry to MAINTAINERS
Date: Thu, 29 Feb 2024 17:22:28 +0100
Message-ID: <20240229162230.2634044-15-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240229162230.2634044-1-boris.brezillon@collabora.com>
References: <20240229162230.2634044-1-boris.brezillon@collabora.com>
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

Add an entry for the Panthor driver to the MAINTAINERS file.

v6:
- Add Maxime's and Heiko's acks

v4:
- Add Steve's R-b

v3:
- Add bindings document as an 'F:' line.
- Add Steven and Liviu as co-maintainers.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Heiko Stuebner <heiko@sntech.de>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7e7e7c378913..2a95919fbc3d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1668,6 +1668,17 @@ F:	Documentation/gpu/panfrost.rst
 F:	drivers/gpu/drm/panfrost/
 F:	include/uapi/drm/panfrost_drm.h
 
+ARM MALI PANTHOR DRM DRIVER
+M:	Boris Brezillon <boris.brezillon@collabora.com>
+M:	Steven Price <steven.price@arm.com>
+M:	Liviu Dudau <liviu.dudau@arm.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml
+F:	drivers/gpu/drm/panthor/
+F:	include/uapi/drm/panthor_drm.h
+
 ARM MALI-DP DRM DRIVER
 M:	Liviu Dudau <liviu.dudau@arm.com>
 S:	Supported
-- 
2.43.0

