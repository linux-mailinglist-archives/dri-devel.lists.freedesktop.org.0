Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD85603A49
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 09:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0351C10EA77;
	Wed, 19 Oct 2022 07:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 725 seconds by postgrey-1.36 at gabe;
 Wed, 19 Oct 2022 03:24:12 UTC
Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B0510F0F6
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Oct 2022 03:24:12 +0000 (UTC)
X-QQ-mid: bizesmtp73t1666148898txwlkp7l
Received: from localhost.localdomain ( [113.57.152.160])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 19 Oct 2022 11:08:17 +0800 (CST)
X-QQ-SSF: 01400000000000D0I000000A0000000
X-QQ-FEAT: 7jw2iSiCazosd9fh5pCymvb/pMGe5xvT3aHl6VpPEThr/Rz6ye33ctZlSuRHp
 GeRaq5J+qgY58zlZpSh5CTU5cXW5RqWNmKrMM18yWc01NRKtrV2oxG8iA4LcMIeqeXGhYTG
 xDuTjhx7QqwVNvSY46RrtFGtxVnadsbE6qaNhuaRbIFSRBKJ4kj/ZVrW+8pgEje75m+S1P6
 /HfHGvzjucNyXs6cGju+BN1l1zIJKTmVa8W24+wmtFDtxoyV43Cj7Xsx52dhYfieGNy5FZj
 EHJDQYD6b0ca2Opg7DgSDyOdahyX+nJUBJmwJadZ5U7YSwCvwRygl9O22jwCDs7kyRIoyae
 DjI2cwtViAzgQlf0l20nTMUsAatBEY+vIwJkdO7pPxhc4kMr1pYCfP9aqAulvjc8KXLyGQ9
X-QQ-GoodBg: 1
From: Zhang Xincheng <zhangxincheng@uniontech.com>
To: sudipm.mukherjee@gmail.com
Subject: [PATCH] parport_pc: Remove WCH CH382 PCI-E single parallel port card.
Date: Wed, 19 Oct 2022 11:07:59 +0800
Message-Id: <20221019030759.29506-1-zhangxincheng@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybglogicsvr:qybglogicsvr6
X-Mailman-Approved-At: Wed, 19 Oct 2022 07:04:35 +0000
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
Cc: Zhang Xincheng <zhangxincheng@uniontech.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

WCH CH382L PCI-E adapter with 1 parallel port has been included
inside parport_serial.

Signed-off-by: Zhang Xincheng <zhangxincheng@uniontech.com>
---
 drivers/parport/parport_pc.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/parport/parport_pc.c b/drivers/parport/parport_pc.c
index 7c45927e2131..cf0cefe38e90 100644
--- a/drivers/parport/parport_pc.c
+++ b/drivers/parport/parport_pc.c
@@ -2613,7 +2613,6 @@ enum parport_pc_pci_cards {
 	netmos_9901,
 	netmos_9865,
 	quatech_sppxp100,
-	wch_ch382l,
 };
 
 
@@ -2677,7 +2676,6 @@ static struct parport_pc_pci {
 	/* netmos_9901 */               { 1, { { 0, -1 }, } },
 	/* netmos_9865 */               { 1, { { 0, -1 }, } },
 	/* quatech_sppxp100 */		{ 1, { { 0, 1 }, } },
-	/* wch_ch382l */		{ 1, { { 2, -1 }, } },
 };
 
 static const struct pci_device_id parport_pc_pci_tbl[] = {
@@ -2769,8 +2767,6 @@ static const struct pci_device_id parport_pc_pci_tbl[] = {
 	/* Quatech SPPXP-100 Parallel port PCI ExpressCard */
 	{ PCI_VENDOR_ID_QUATECH, PCI_DEVICE_ID_QUATECH_SPPXP_100,
 	  PCI_ANY_ID, PCI_ANY_ID, 0, 0, quatech_sppxp100 },
-	/* WCH CH382L PCI-E single parallel port card */
-	{ 0x1c00, 0x3050, 0x1c00, 0x3050, 0, 0, wch_ch382l },
 	{ 0, } /* terminate list */
 };
 MODULE_DEVICE_TABLE(pci, parport_pc_pci_tbl);
-- 
2.20.1

