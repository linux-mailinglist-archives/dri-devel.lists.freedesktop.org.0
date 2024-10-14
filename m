Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0CF99CF0C
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2024 16:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EAE910E45C;
	Mon, 14 Oct 2024 14:50:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=riseup.net header.i=@riseup.net header.b="lfZQT+uK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769A410E45C
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2024 14:50:31 +0000 (UTC)
Received: from fews02-sea.riseup.net (fews02-sea-pn.riseup.net [10.0.1.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx0.riseup.net (Postfix) with ESMTPS id 4XS0X71W81z9vsM;
 Mon, 14 Oct 2024 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1728917431; bh=QBEy8+FK5MOiQJx2RHuu0oDwgusO4wOhITACtqEh3WU=;
 h=From:To:Cc:Subject:Date:From;
 b=lfZQT+uKQW/kJ6tIYpGnTD8f3FAPzSXQYgwtDl0kUzEbI3DHOtF+ftX3OiwfASFtj
 7T4hgvkMpxT+yQJlLDrcGI9I/fPUTa9CRb/lLKCiIXIwlXtGXuWuB34g1SRjBDbleB
 h+y3xT9Sd2TOddGiaB9fWVnrVDK6CtF9Krfcvxws=
X-Riseup-User-ID: DC3517923D8F524F20780C8A89A55D6554A1BF30BF5E19436D8A333FF5F0BA71
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews02-sea.riseup.net (Postfix) with ESMTPSA id 4XS0Ws6JHPzFvXv;
 Mon, 14 Oct 2024 14:50:17 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: Louis Chauvet <louis.chauvet@bootlin.com>, Simona Vetter <simona@ffwll.ch>,
 Melissa Wen <melissa.srw@gmail.com>, Maxime Ripard <mripard@kernel.org>
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
Subject: [PATCH] MAINTAINERS: Remove myself as a VKMS maintainer
Date: Mon, 14 Oct 2024 11:50:08 -0300
Message-ID: <20241014145009.3360515-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

I haven't been able to properly review the work on the driver for a while.
Hence, this commit removes me from the maintainers list.

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7d0b4335e263..23ac5fbf5e1c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7466,7 +7466,6 @@ T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/udl/
 
 DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
-M:	Maíra Canal <mairacanal@riseup.net>
 M:	Louis Chauvet <louis.chauvet@bootlin.com>
 R:	Haneen Mohammed <hamohammed.sa@gmail.com>
 R:	Simona Vetter <simona@ffwll.ch>
-- 
2.46.2

