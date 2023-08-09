Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEDD67765A7
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 18:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE04610E486;
	Wed,  9 Aug 2023 16:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28D410E473
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Aug 2023 16:53:43 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 3B483660720E;
 Wed,  9 Aug 2023 17:53:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1691600022;
 bh=3Q0lLPMiOkr9fOhBn4tjcRN4Ao0chzFEjyqVVpvLeCc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oW4+B9uqvC8h4bmY1W8fDYH9xMW4OSV+tEpe3rWHBJuUczlFOU+KveUPkYll22GE1
 gf06mXeHujZrEyw79Ts1UI8WKm/w/IcfsXpUAL7pA0gOpWWJ5XAGBxMziPDCmwnuwQ
 5QWNFyCl7hLpjna0mohuHfq6VmyzJe3HOH/ydpvJ4xixfgqhOQyd7Cx6yEAqt9xdzU
 a4weLZAhMcVME1K1ibRr8ylZeXAmWJBN0Qrorh+P4Ousb1q3FG+1TrbDoTc0XbUJEE
 NckKESTev1WJFoTyStUE3l6/Q3Fh3ce4efVF6NGFisrA87Hi6pkO1mIsAl2Z/i40yY
 mig9jPKoJEf/A==
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 15/15] drm/panthor: Add an entry to MAINTAINERS
Date: Wed,  9 Aug 2023 18:53:28 +0200
Message-ID: <20230809165330.2451699-16-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809165330.2451699-1-boris.brezillon@collabora.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
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

v2:
- New commit

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---

If anyone from Arm wants to volunteer to become a co-maintainer, that
would be highly appreciated
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cd882b87a3c6..6149ab68d461 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1624,6 +1624,14 @@ T:	git git://anongit.freedesktop.org/drm/drm-misc
 F:	drivers/gpu/drm/panfrost/
 F:	include/uapi/drm/panfrost_drm.h
 
+ARM MALI PANTHOR DRM DRIVER
+M:	Boris Brezillon <boris.brezillon@collabora.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Supported
+T:	git git://anongit.freedesktop.org/drm/drm-misc
+F:	drivers/gpu/drm/panthor/
+F:	include/uapi/drm/panthor_drm.h
+
 ARM MALI-DP DRM DRIVER
 M:	Liviu Dudau <liviu.dudau@arm.com>
 S:	Supported
-- 
2.41.0

