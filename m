Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CDD836A9A
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 17:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80B6B10E6DD;
	Mon, 22 Jan 2024 16:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D2710F5E2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 16:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705941068;
 bh=35JopBtQB1Q4iFh6VPCHTtmBIlO/ojfgiXkP1BHo2uk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uoqEaBA07PMDNwWTh9C24bT7HduZawDz8lFsjyT8/MYK2YhbOSWUXG9iLhQJ/MCwd
 0nINdjS237QF0apab80qXio83RFFpKaJx7wd4SlTXl/8Tvv74w60QxwvTt/quEuSVA
 atZ0tCC2+/vD94qzt8oz8xSzhjYuyLkbbNj3pECBdos3C9HRULToqddGnN34JfgVk7
 tCWIV7snKubL6DN1ur+gd2C8qI11gpYXByr0Ib3s08HNVCu1BcCFNZ8bQSoUIEqLtE
 8nReXpfytzoDULoPz/FUTN3tSZ8QZlMP4JoGVJmJJJH9h4uoHELM5PTz0oBkk1v0GB
 Qjkd68malSdSQ==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5A2B8378208E;
 Mon, 22 Jan 2024 16:31:07 +0000 (UTC)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 14/14] drm/panthor: Add an entry to MAINTAINERS
Date: Mon, 22 Jan 2024 17:30:45 +0100
Message-ID: <20240122163047.1954733-15-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122163047.1954733-1-boris.brezillon@collabora.com>
References: <20240122163047.1954733-1-boris.brezillon@collabora.com>
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
Cc: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Diamand <chris.diamand@foss.arm.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an entry for the Panthor driver to the MAINTAINERS file.

v4:
- Add Steve's R-b

v3:
- Add bindings document as an 'F:' line.
- Add Steven and Liviu as co-maintainers.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d959a6881f7..4d6e27f0a2e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1648,6 +1648,17 @@ F:	Documentation/gpu/panfrost.rst
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

