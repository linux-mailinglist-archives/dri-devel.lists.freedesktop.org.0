Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BD0554269
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 07:52:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABBD11388B;
	Wed, 22 Jun 2022 05:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 549 seconds by postgrey-1.36 at gabe;
 Tue, 21 Jun 2022 09:13:34 UTC
Received: from mail.nfschina.com (unknown
 [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
 by gabe.freedesktop.org (Postfix) with ESMTP id 03D421129C6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 09:13:34 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id 35AE61E80D70;
 Tue, 21 Jun 2022 17:04:23 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cYdvKWyXI1Ol; Tue, 21 Jun 2022 17:04:20 +0800 (CST)
Received: from localhost.localdomain (unknown [112.64.61.97])
 (Authenticated sender: jiaming@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id 5B9841E80D5B;
 Tue, 21 Jun 2022 17:04:18 +0800 (CST)
From: Zhang Jiaming <jiaming@nfschina.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/amd/pm: Fix a typo in comments
Date: Tue, 21 Jun 2022 17:03:34 +0800
Message-Id: <20220621090334.54115-1-jiaming@nfschina.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 22 Jun 2022 05:52:38 +0000
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
Cc: liqiong@nfschina.com, Zhang Jiaming <jiaming@nfschina.com>,
 renyu@mfschina.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There is a spelling mistake in comments.
Replace 'paramater' with 'parameter'.

Signed-off-by: Zhang Jiaming <jiaming@nfschina.com>
---
 drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h
index 45f5d29bc705..15b313baa0ee 100644
--- a/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h
+++ b/drivers/gpu/drm/amd/pm/swsmu/inc/pmfw_if/arcturus_ppsmc.h
@@ -120,7 +120,7 @@
 #define PPSMC_MSG_ReadSerialNumTop32		 0x40
 #define PPSMC_MSG_ReadSerialNumBottom32		 0x41
 
-/* paramater for MSG_LightSBR
+/* parameter for MSG_LightSBR
  * 1 -- Enable light secondary bus reset, only do nbio respond without further handling,
  *      leave driver to handle the real reset
  * 0 -- Disable LightSBR, default behavior, SMU will pass the reset to PSP
-- 
2.25.1

