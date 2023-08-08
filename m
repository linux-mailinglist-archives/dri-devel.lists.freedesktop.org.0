Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C70774E5D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Aug 2023 00:34:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E14810E21D;
	Tue,  8 Aug 2023 22:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-127.mta1.migadu.com (out-127.mta1.migadu.com
 [IPv6:2001:41d0:203:375::7f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 374CB10E21D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Aug 2023 22:34:40 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1691534078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HL5I7G8dsIM9Q8e95v2AAu8NCj6dOoJOu6bCCYAPQBw=;
 b=JdE3KgMCOK9a99gLEqtXjTkM6oTKGWFQ7ZBtDjo5B938KLh4I3KEf+gb7oxO+HGWfwbr13
 FebIHA9+iE68toGO3+RBtqvbI+a45IPZtIgNMzmG2zeGvdsHGbysQGgPp3IMs1G5wy1d99
 ydCkC3Yv99i7zinBd4y1UjMJQ/PM8tw=
From: Sui Jingfeng <sui.jingfeng@linux.dev>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 08/11] PCI/VGA: Fix a typo to the comment of vga_default
Date: Wed,  9 Aug 2023 06:34:09 +0800
Message-Id: <20230808223412.1743176-9-sui.jingfeng@linux.dev>
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

Fixes: deb2d2ecd43d ("PCI/GPU: implement VGA arbitration on Linux")
Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
---
 drivers/pci/vgaarb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/vgaarb.c b/drivers/pci/vgaarb.c
index a6b8c0def35d..d80d92e8012b 100644
--- a/drivers/pci/vgaarb.c
+++ b/drivers/pci/vgaarb.c
@@ -99,7 +99,7 @@ static int vga_str_to_iostate(char *buf, int str_size, unsigned int *io_state)
 	return 1;
 }
 
-/* this is only used a cookie - it should not be dereferenced */
+/* This is only used as a cookie, it should not be dereferenced */
 static struct pci_dev *vga_default;
 
 /* Find somebody in our list */
-- 
2.34.1

