Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9B0573BBE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jul 2022 19:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372089494D;
	Wed, 13 Jul 2022 17:02:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54C293F42
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Jul 2022 17:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=wuZ8d3aPPY8+I2E8ddVH8Z/7jWtYPbGBCKmCRA0rgMc=;
 b=E7H+IR6Kiw0TuRGG8tiLoXopzngHKxeAZxtJadbL1Vg9QD12CIT7CNKJJrfUC/UEvJCXcpfr0rfCT
 OXg03nw0VCnQBqSW/Mpxhqpe2FZUxboh92GW3XCMF3cKu0ekG9dVJFmm0BZrp5Ds8FvLg+rClIvmGE
 5jNMFasezscj+TAj8xddzoADvdiLAfMzsbcn20yUeV0lWqreIknZDuR8iKqzYfgzL/VyJaXxwPaybr
 oJdj8pxQFehCnWS4tNjNLiaMcXnS8NpC7R0QpsCn0Y63jsySnYj6LCbBTZ5aPMFoTYL+mJA6vNmhG7
 r/UwIU3R0RD8nCFCuO11APhvKx3HFIQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=wuZ8d3aPPY8+I2E8ddVH8Z/7jWtYPbGBCKmCRA0rgMc=;
 b=tCULgW1tcUl6w07tmCtcYe7k3d1bI46pxUfVIaMYgFQDilw/HO52MHYj7N6QAfc51STBvRTDfixZb
 u/DRAbwDw==
X-HalOne-Cookie: fb6f7c1f6fa324dc01dc49c18d708cb576de1d6f
X-HalOne-ID: 94b57092-02cd-11ed-be7e-d0431ea8bb03
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 94b57092-02cd-11ed-be7e-d0431ea8bb03;
 Wed, 13 Jul 2022 17:02:30 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 13/13] drm/via: Fix style issues in via_3d_reg header
Date: Wed, 13 Jul 2022 19:02:02 +0200
Message-Id: <20220713170202.1798216-14-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220713170202.1798216-1-sam@ravnborg.org>
References: <20220713170202.1798216-1-sam@ravnborg.org>
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
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>,
 Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

- Fix comments using wrong style
- Drop repeated word

This fixes all checkpatch complains and makes the file a little
bit easier to read - as the eye is not distracted by the style
violations.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Kevin Brace <kevinbrace@bracecomputerlab.com>
---
 drivers/gpu/drm/via/via_3d_reg.h | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/via/via_3d_reg.h b/drivers/gpu/drm/via/via_3d_reg.h
index 4a884384e5b8..eb848508b12b 100644
--- a/drivers/gpu/drm/via/via_3d_reg.h
+++ b/drivers/gpu/drm/via/via_3d_reg.h
@@ -156,7 +156,7 @@
 #define HC_HSPXOS_SHIFT         12
 #define HC_HSPYOS_MASK          0x00000fff
 
-/* Command
+/*
  * Command A
  */
 #define HC_HCmdHeader_MASK      0xfe000000  /*0xffe00000 */
@@ -1342,8 +1342,8 @@
 #define HC_HFthRTXA_MASK        0x000000ff
 
 /****************************************************************************
-** Define the Halcyon Internal register access constants. For simulator only.
-****************************************************************************/
+ * Define the Halcyon Internal register access constants. For simulator only.
+ ***************************************************************************/
 #define HC_SIMA_HAGPBstL        0x0000
 #define HC_SIMA_HAGPBendL       0x0001
 #define HC_SIMA_HAGPCMNT        0x0002
@@ -1592,8 +1592,8 @@
 #define HC_SIMA_FIFOstatus      0x0446
 
 /****************************************************************************
-** Define the AGP command header.
-****************************************************************************/
+ * Define the AGP command header.
+ ***************************************************************************/
 #define HC_ACMD_MASK            0xfe000000
 #define HC_ACMD_SUB_MASK        0x0c000000
 #define HC_ACMD_HCmdA           0xee000000
@@ -1617,17 +1617,17 @@
 #define HC_ACMD_H4COUNT_SHIFT   9
 
 /*****************************************************************************
-** Define Header
-*****************************************************************************/
+ * Define Header
+ ****************************************************************************/
 #define HC_HEADER2        0xF210F110
 
 /*****************************************************************************
-** Define Dummy Value
-*****************************************************************************/
+ * Define Dummy Value
+ ****************************************************************************/
 #define HC_DUMMY        0xCCCCCCCC
 /*****************************************************************************
-** Define for DMA use
-*****************************************************************************/
+ * Define for DMA use
+ ****************************************************************************/
 #define HALCYON_HEADER2     0XF210F110
 #define HALCYON_FIRECMD     0XEE100000
 #define HALCYON_FIREMASK    0XFFF00000
@@ -1661,8 +1661,8 @@
 #define VIA_VIDEOMASK           0xFFFF0000
 
 /*****************************************************************************
-** Define for H5 DMA use
-*****************************************************************************/
+ * Define for H5 DMA use
+ ****************************************************************************/
 #define H5_HC_DUMMY                    0xCC000000
 
 /* Command Header Type */
-- 
2.34.1

