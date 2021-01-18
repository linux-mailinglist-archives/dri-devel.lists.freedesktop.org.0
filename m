Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADD32F9B39
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 09:25:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A90D56E1A3;
	Mon, 18 Jan 2021 08:25:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32CE89A5E
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jan 2021 00:58:19 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DJtfZ3209z7Tv2;
 Mon, 18 Jan 2021 08:57:10 +0800 (CST)
Received: from huawei.com (10.175.112.125) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.498.0; Mon, 18 Jan 2021
 08:58:13 +0800
From: Yue Zou <zouyue3@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] vgaarb: Remove unneeded semicolons
Date: Mon, 18 Jan 2021 01:03:55 +0000
Message-ID: <20210118010356.214491-1-zouyue3@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.112.125]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 18 Jan 2021 08:25:29 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove superfluous semicolons after function definitions.

Signed-off-by: Yue Zou <zouyue3@huawei.com>
---
 include/linux/vgaarb.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/vgaarb.h b/include/linux/vgaarb.h
index 977caf96c8d2..fc6dfeba04a5 100644
--- a/include/linux/vgaarb.h
+++ b/include/linux/vgaarb.h
@@ -121,9 +121,9 @@ extern struct pci_dev *vga_default_device(void);
 extern void vga_set_default_device(struct pci_dev *pdev);
 extern int vga_remove_vgacon(struct pci_dev *pdev);
 #else
-static inline struct pci_dev *vga_default_device(void) { return NULL; };
-static inline void vga_set_default_device(struct pci_dev *pdev) { };
-static inline int vga_remove_vgacon(struct pci_dev *pdev) { return 0; };
+static inline struct pci_dev *vga_default_device(void) { return NULL; }
+static inline void vga_set_default_device(struct pci_dev *pdev) { }
+static inline int vga_remove_vgacon(struct pci_dev *pdev) { return 0; }
 #endif
 
 /*
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
