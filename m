Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C4E46A2CF
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 18:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1EE773A4C;
	Mon,  6 Dec 2021 17:26:37 +0000 (UTC)
X-Original-To: dri-devel@freedesktop.org
Delivered-To: dri-devel@freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C9C73A4C
 for <dri-devel@freedesktop.org>; Mon,  6 Dec 2021 17:26:36 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 3008429F728;
 Mon,  6 Dec 2021 17:26:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1638811595; bh=O9K88Q78If0YAF79Bef3gMy/tzuTQ+Uy1mH5apmHC2I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c66SZOZ0J2kKzBftvQ1cuUP+acpZsiyiGcPzfOT6tJL2M406D+rZwyNEJLGgw1/rY
 mcjbiCNnTQDP+NRo6eWi95x0kytDKxQUEEOoKjTItZpKBbHy6HwgaiQ4M6PFet5lKa
 SqCnp6pK3gA1K32NUgbWbY5dJku06xcm4Yk9lZ3ouScuKz5Tt10QjFk3PLlU0mhcqY
 M3ZzgPMhq7U3GBcxnXujFi4qmPo1qpiLuLhbiQc0SgWHsn2M9LEMVoAuwXSXS047Yc
 UN4C9EtICPKnE65DPdCml/lUFB5ea/2RMPnsotRd5hKUzg3z6ohu4uB5w8F9uyxZxP
 C/0qJYM+OOx8A==
From: Zack Rusin <zack@kde.org>
To: dri-devel@freedesktop.org
Subject: [PATCH 03/12] drm/vmwgfx: Stop hardcoding the PCI ID
Date: Mon,  6 Dec 2021 12:26:11 -0500
Message-Id: <20211206172620.3139754-4-zack@kde.org>
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

Instead of hardcoding the VMware's PCI ID the code should be using the
public define for it. There's no functional change, it just makes
it obvious what we're dealing with.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 9680ab183941..acdd0c9d7750 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -254,8 +254,8 @@ static const struct drm_ioctl_desc vmw_ioctls[] = {
 };
 
 static const struct pci_device_id vmw_pci_id_list[] = {
-	{ PCI_DEVICE(0x15ad, VMWGFX_PCI_ID_SVGA2) },
-	{ PCI_DEVICE(0x15ad, VMWGFX_PCI_ID_SVGA3) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_VMWARE, VMWGFX_PCI_ID_SVGA2) },
+	{ PCI_DEVICE(PCI_VENDOR_ID_VMWARE, VMWGFX_PCI_ID_SVGA3) },
 	{ }
 };
 MODULE_DEVICE_TABLE(pci, vmw_pci_id_list);
-- 
2.32.0

