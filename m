Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9128246A2DC
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 18:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5304373DF5;
	Mon,  6 Dec 2021 17:26:49 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE3A73AE5
 for <dri-devel@freedesktop.org>; Mon,  6 Dec 2021 17:26:43 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id B1AC129F497;
 Mon,  6 Dec 2021 17:26:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1638811602; bh=ItKmASLBOZ9rqlqfJLAAuTDs4DkZao7hlrLxG54rzQI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PEuj5ft28qz/fApDkXpztSEng7GKkbYpOdRAj7IcdWTwq87KJQO/85OcjQHG91LMH
 Q/djtGYMWbi/RWIzEjhTE55ZDWrKSuLTGvdwW3m/91/ruPDYPqKyyUfcCmKY2YuUXC
 W2hDsHh5q7l0HmK2GL1CkXt9Q/1Lt1IdKQQgcA81liii1hpLG3tt+OXZ+Ex1o+vKub
 O10++f5kRwCGTVpvJAp0PJtsZ28sZsvGdjbLoJhBiDX9Ufz1/6KYyxNzgl1i/viXBr
 sWIvJM322B1+w9WYfRmWnNTD7sBUYOKJ3TQmf7E6RdL6fI1AxSMCsLQCEI7iTFsKLi
 TimE1E7EchoNg==
From: Zack Rusin <zack@kde.org>
To: dri-devel@freedesktop.org
Subject: [PATCH 12/12] drm/vmwgfx: Bump the major version
Date: Mon,  6 Dec 2021 12:26:20 -0500
Message-Id: <20211206172620.3139754-13-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206172620.3139754-1-zack@kde.org>
References: <20211206172620.3139754-1-zack@kde.org>
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

With GEM, GL4.3, stats and removal of a lot of old code it's time to bump
the major version of the driver. New major version gives us a fresh
namespace on top of which more helpers can be GEM'ified and the driver
can be brought more inline with the latest DRM changes.

Signed-off-by: Zack Rusin <zackr@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
index 1760ba1b0d4a..2e72e61eaf19 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
@@ -54,9 +54,9 @@
 
 
 #define VMWGFX_DRIVER_NAME "vmwgfx"
-#define VMWGFX_DRIVER_DATE "20210722"
-#define VMWGFX_DRIVER_MAJOR 2
-#define VMWGFX_DRIVER_MINOR 19
+#define VMWGFX_DRIVER_DATE "20211206"
+#define VMWGFX_DRIVER_MAJOR 3
+#define VMWGFX_DRIVER_MINOR 0
 #define VMWGFX_DRIVER_PATCHLEVEL 0
 #define VMWGFX_FIFO_STATIC_SIZE (1024*1024)
 #define VMWGFX_MAX_RELOCATIONS 2048
-- 
2.32.0

