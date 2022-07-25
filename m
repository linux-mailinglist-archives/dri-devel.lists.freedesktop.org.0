Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4430958088A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C7E10F7A8;
	Mon, 25 Jul 2022 23:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D06A410F81B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1658793299;
 bh=U23eqdwgbh1fWzaBrh+KcikQcadXKAWQE5zohvIeQjs=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=P58Y4vMNcbHNdJZeK6SuOv3uyv5dzutFfW6QD2oWjo0xpx4r7TkUoEqGc982vzw6x
 vtlk6kDvCcxEwjhCwsEzKuevK15OPLz8Ze4JCT+IYBYPuy5ws1VohIW6N4z1P9zg8o
 yYjDC/o9Cj0gwL/PIDTCJPvggDwS1OsIL15aecsw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([108.233.15.105]) by mail.gmx.net
 (mrgmx105 [212.227.17.174]) with ESMTPSA (Nemesis) id
 1N1OXT-1nVGlV0SAF-012l2w; Tue, 26 Jul 2022 01:54:59 +0200
From: Kevin Brace <kevinbrace@gmx.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 29/32] drm/via: Add new VIA Technologies PCI device IDs
 related to graphics
Date: Mon, 25 Jul 2022 16:53:56 -0700
Message-Id: <20220725235359.20516-10-kevinbrace@gmx.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220725235359.20516-1-kevinbrace@gmx.com>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:7oI5UzOv8O8vbaxfoZhki2tRxQbW+yOBcuOiTgyhdKN+nDiA8xU
 6NcGOWQ+wFJm7PYxEpCYobC8VM0N7yonFohtNqHIJROq7Jx43VJdSawL6TG2TQuaR5TXNiw
 LV0YGU/OcOUBjWhdTVwkztuENdjgT+GrBuuA5G8GIagLKh174CQtobAIyR1e643v+t+GQk3
 7VcnGW0qeaJBSnDmTdWOQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:rJnx79mti50=:PIYJzWvS2RKd2y5z2hCH7C
 3SgZ2PpybpQmdlFfBsJmPStMHj2hxPWgJflrR19jP96oMXA9LCiHQND7t+ddsYdUkn+v2S/VJ
 C7hQNzAzTwsZkRd4B4nHkA2TnVIZzpePjrzvpGSax/ALeU3cxvW61t7wTUX697IoFqQ0E2zDI
 szd6nN2ulOatu2LzOcZuQ3hhIc0UiTrE9xyQsTaGRPiXImHaw3s7PjiNzMOoO/aMbfR84RQu8
 Rf1G0gPfyI+GHHRNk9YSfyq5G5Fr6YKwpIZ7aBeICg1hpo0ZFYJERH46pC+LilmvAyuNveg/2
 YmSeQcgD6cugDd9+ReIem182DZx/BpiNdJj3kFIIJ6X8S6kAZvlY3+qI3VywAe2BUytsNtLRo
 Oda5drwCmxaZh9abgnKj9sZaracqk4W/XRjLmxMN9VByEh5GungABURTKaxshltf5lTHSbx1i
 8wcdGfp2RN6fudMgGp4cSML6dklnuZHquSGgu0Fm5OR+gpUjkn6mQjDUMOPMtJpXe+3NOu1RJ
 BMJQEF6VI2bDKNSOPPTYwB23gE+Z3lR372vXpjcAyoYddCUFHBHUVvMBKQ3twNEeFsH58Ig1h
 mn4OUiBL6f44KnDnCAtCsFmWLRzu4TzB5YmT+8Gsr7nUJyC74W0kr12Vg6EIHW5t4xYSsOrZf
 Bq4lop7vjz7SZn1X9nr9iSKcl8E9Qv3gR+POUikqJCmI6RRvtVKg0TjVVb00gwtXHkE2ZgADj
 VA2qoMD+mTsje3NGIerAYrU8utFuGw6nL2/aiLF4p9nDbS+L7zcvdxZerYb8PGkOC9l19BcGp
 rd8gNbtGTEobJPnIxEhUgWw4dx1FjXPTMAPoCC63WJ3x/67NsLONgduQa4V5UaLHoOIjy3Mjc
 hmtS1MaeKeEDoHHrEbleN4pFYnDVkkJkJ+NhOkzWoSDgBdCjpsKSu5EphK7AZ2oQRHSnUz+RQ
 ubWm5qq7HoIXQhO+yAz+fgd9YpIuHuD65ommxY0U9T8bXiPrKqKnFFNIf2z4Utqj0blDDCQrp
 9Aw1G4Y/dgnFHtER/yOKvlTYtQ3ggnWgxQbbL4s1n5wAEN+URky24Se3CdRkz1Ejkak9XnZ40
 6ezZJznoXncoGMn1/06lDU99eEGDGBwyhmXPz/eFg+NZ+kQat6N16g6cg==
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Kevin Brace <kevinbrace@bracecomputerlab.com>

Signed-off-by: Kevin Brace <kevinbrace@bracecomputerlab.com>
=2D--
 include/linux/pci_ids.h | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 0178823ce8c2..809c61a10fe1 100644
=2D-- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -1423,8 +1423,11 @@
 #define PCI_DEVICE_ID_VIA_VT3324	0x0324
 #define PCI_DEVICE_ID_VIA_VT3336	0x0336
 #define PCI_DEVICE_ID_VIA_VT3351	0x0351
+#define PCI_DEVICE_ID_VIA_VT3353	0x0353
 #define PCI_DEVICE_ID_VIA_VT3364	0x0364
 #define PCI_DEVICE_ID_VIA_8371_0	0x0391
+#define PCI_DEVICE_ID_VIA_VT3409	0x0409
+#define PCI_DEVICE_ID_VIA_VT3410	0x0410
 #define PCI_DEVICE_ID_VIA_6415		0x0415
 #define PCI_DEVICE_ID_VIA_8501_0	0x0501
 #define PCI_DEVICE_ID_VIA_82C561	0x0561
@@ -1438,6 +1441,7 @@
 #define PCI_DEVICE_ID_VIA_8605_0	0x0605
 #define PCI_DEVICE_ID_VIA_82C686	0x0686
 #define PCI_DEVICE_ID_VIA_82C691_0	0x0691
+#define PCI_DEVICE_ID_VIA_VT1122	0x1122
 #define PCI_DEVICE_ID_VIA_82C576_1	0x1571
 #define PCI_DEVICE_ID_VIA_82C586_2	0x3038
 #define PCI_DEVICE_ID_VIA_82C586_3	0x3040
@@ -1452,16 +1456,20 @@
 #define PCI_DEVICE_ID_VIA_8653_0	0x3101
 #define PCI_DEVICE_ID_VIA_8622		0x3102
 #define PCI_DEVICE_ID_VIA_8235_USB_2	0x3104
+#define PCI_DEVICE_ID_VIA_K8M800	0x3108
 #define PCI_DEVICE_ID_VIA_8233C_0	0x3109
 #define PCI_DEVICE_ID_VIA_8361		0x3112
 #define PCI_DEVICE_ID_VIA_XM266		0x3116
+#define PCI_DEVICE_ID_VIA_PM800 	0x3118
 #define PCI_DEVICE_ID_VIA_612X		0x3119
+#define PCI_DEVICE_ID_VIA_CLE266	0x3122
 #define PCI_DEVICE_ID_VIA_862X_0	0x3123
 #define PCI_DEVICE_ID_VIA_8753_0	0x3128
 #define PCI_DEVICE_ID_VIA_8233A		0x3147
 #define PCI_DEVICE_ID_VIA_8703_51_0	0x3148
 #define PCI_DEVICE_ID_VIA_8237_SATA	0x3149
 #define PCI_DEVICE_ID_VIA_XN266		0x3156
+#define PCI_DEVICE_ID_VIA_VT3157	0x3157
 #define PCI_DEVICE_ID_VIA_6410		0x3164
 #define PCI_DEVICE_ID_VIA_8754C_0	0x3168
 #define PCI_DEVICE_ID_VIA_8235		0x3177
@@ -1470,11 +1478,18 @@
 #define PCI_DEVICE_ID_VIA_8378_0	0x3205
 #define PCI_DEVICE_ID_VIA_8783_0	0x3208
 #define PCI_DEVICE_ID_VIA_8237		0x3227
+#define PCI_DEVICE_ID_VIA_K8M890	0x3230
 #define PCI_DEVICE_ID_VIA_8251		0x3287
+#define PCI_DEVICE_ID_VIA_VT3343	0x3343
+#define PCI_DEVICE_ID_VIA_CN700 	0x3344
+#define PCI_DEVICE_ID_VIA_P4M900	0x3371
 #define PCI_DEVICE_ID_VIA_8261		0x3402
 #define PCI_DEVICE_ID_VIA_8237A		0x3337
 #define PCI_DEVICE_ID_VIA_8237S		0x3372
+#define PCI_DEVICE_ID_VIA_VX875 	0x5122
 #define PCI_DEVICE_ID_VIA_SATA_EIDE	0x5324
+#define PCI_DEVICE_ID_VIA_VX900_VGA	0x7122
+#define PCI_DEVICE_ID_VIA_KM400 	0x7205
 #define PCI_DEVICE_ID_VIA_8231		0x8231
 #define PCI_DEVICE_ID_VIA_8231_4	0x8235
 #define PCI_DEVICE_ID_VIA_8365_1	0x8305
=2D-
2.35.1

