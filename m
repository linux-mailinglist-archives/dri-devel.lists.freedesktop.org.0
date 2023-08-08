Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4C7774E5C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 00:34:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86C0010E21E;
	Tue,  8 Aug 2023 22:34:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-124.mta1.migadu.com (out-124.mta1.migadu.com
 [IPv6:2001:41d0:203:375::7c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FB710E215
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 22:34:36 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1691534074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uMmEu+HhjoXxANySD4aMeLT6mwndhCG4N8c23OUDKuI=;
 b=Wl506kTCXQtMlc2mHYLR0PVSvjYlKXpfKDEhL9z8b9NHnYkkOx5eYk3PeqhY98kd6c4yym
 sZy1+F9KWA1jTNyhfoZM+i1exotrTiU77Sr7hEtCWtHXWH1Eeuw6HRvzFWdot/X3cr72ow
 BgHtoJVaqPXVmlq/UafBM8KuDNeeFjg=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 06/11] PCI/VGA: Fix two typos in the comments of
 pci_notify()
Date: Wed,  9 Aug 2023 06:34:07 +0800
Message-Id: <20230808223412.1743176-7-sui.jingfeng@linux.dev>
In-Reply-To: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
References: <20230808223412.1743176-1-sui.jingfeng@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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
Cc: Sui Jingfeng <suijingfeng@loongson.cn>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sui Jingfeng <suijingfeng@loongson.cn>

1) s/intereted/interested
2) s/hotplugable/hot-pluggable

While at it, convert the comments to the conventional multi-line style,
and rewrap to fill 78 columns.

Fixes: deb2d2ecd43d ("PCI/GPU: implement VGA arbitration on Linux")
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index 6883067a802a..811510253553 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -1535,9 +1535,11 @@ static int pci_notify(struct notifier_block *nb, unsigned long action,
 	if (!pci_dev_is_vga(pdev))
 		return 0;
 
-	/* For now we're only intereted in devices added and removed. I didn't
-	 * test this thing here, so someone needs to double check for the
-	 * cases of hotplugable vga cards. */
+	/*
+	 * For now, we're only interested in devices added and removed.
+	 * I didn't test this thing here, so someone needs to double check
+	 * for the cases of hot-pluggable VGA cards.
+	 */
 	if (action == BUS_NOTIFY_ADD_DEVICE)
 		notify = vga_arbiter_add_pci_device(pdev);
 	else if (action == BUS_NOTIFY_DEL_DEVICE)
-- 
2.34.1

