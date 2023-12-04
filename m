Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F8E803BA4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 18:33:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9B310E39F;
	Mon,  4 Dec 2023 17:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB21A10E3AA
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 17:33:35 +0000 (UTC)
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E4A8B6605835;
 Mon,  4 Dec 2023 17:33:33 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701711214;
 bh=vfHFfbwWEao9WwxHgYqAlljAe198mSJ3SxxirWrCYYg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DjJImmT8NMxkCEn4HgDnS6F8D8pxSDJd52F3t/zDK0Lxdcv4Iv6PVm/NJTbkPSNhB
 3bcfnVsTASaf22T1dgYfn9bszEbc0PVgGjRwPCojH/aJBV8jeYTzAByYGUJfMRsbBg
 rkPMjhB7Bq/IYYco+oSi1qrw7nFeyTilIqySh4DWHfi370SZM40SQsFyrgagOCUXb4
 cw3uLQnR6u2agPpnEH2vHeL0W/jXCJdV+OZZuvsbOJrH1RNeSR+XD5OXEyDKas6Tab
 g4S4oIVyQ2Poep6Mcq8PdVXfrm4BH7vApJH58GSej36yM0mvzyqiOjd1fLNE7+mz8M
 0YtRrVHwZrW2g==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 14/14] drm/panthor: Add an entry to MAINTAINERS
Date: Mon,  4 Dec 2023 18:33:07 +0100
Message-ID: <20231204173313.2098733-15-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204173313.2098733-1-boris.brezillon@collabora.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add an entry for the Panthor driver to the MAINTAINERS file.

v3:
- Add bindings document as an 'F:' line.
- Add Steven and Liviu as co-maintainers.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0ba904b46efe..8d250ee2975f 100644
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

