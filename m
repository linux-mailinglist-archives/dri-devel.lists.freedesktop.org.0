Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5085F82AB03
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jan 2024 10:32:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD9C10E870;
	Thu, 11 Jan 2024 09:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.8])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8183710E870;
 Thu, 11 Jan 2024 09:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=riPFQzIM0RxLBVk/VT
 8AduR0Cn36/f+IWZyvzIbiXBM=; b=YOzVROprbofOruBBAQaoWV1CXrTLiWpGfC
 ekFpVev7x7ei5ifCRRQ5X+OUab1d4FEg0IkJgCeC6i/tcNorjHHdZxP3uIncr6ME
 Nxg9xtpdkV0MI2g4l0PMCbtorJzWfu56S3hImvldfFtApPmA64ACu9Gyi0m75deA
 rv0LAn25U=
Received: from localhost.localdomain (unknown [182.148.14.173])
 by gzga-smtp-mta-g1-2 (Coremail) with SMTP id _____wD3f6ubtZ9lAbY2AA--.24753S2;
 Thu, 11 Jan 2024 17:32:11 +0800 (CST)
From: XueBing Chen <chenxb_99091@126.com>
To: daniel@ffwll.ch, Xinhui.Pan@amd.com, alexander.deucher@amd.com,
 airlied@gmail.com, christian.koenig@amd.com
Subject: [PATCH] drm/radeon/dpm: Clean up errors in evergreen_smc.h
Date: Thu, 11 Jan 2024 09:32:10 +0000
Message-Id: <20240111093210.14000-1-chenxb_99091@126.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: _____wD3f6ubtZ9lAbY2AA--.24753S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZryxCFW5CF17Xr48uF4DJwb_yoW8Gr1kpF
 WqgryaqrWUtFnrXry8GF43ZrZ3ta9xXF18GF47Zw1Y9F45JrWxCF4DCFWrA3y8Xw47K342
 yF18tr48uF4ak3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRia9hUUUUU=
X-Originating-IP: [182.148.14.173]
X-CM-SenderInfo: hfkh05lebzmiizr6ij2wof0z/1tbiOgBixWVEuYCDxQAAsD
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
Cc: XueBing Chen <chenxb_99091@126.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following errors reported by checkpatch:

ERROR: open brace '{' following struct go on the same line

Signed-off-by: XueBing Chen <chenxb_99091@126.com>
---
 drivers/gpu/drm/radeon/evergreen_smc.h | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/evergreen_smc.h b/drivers/gpu/drm/radeon/evergreen_smc.h
index 3a03ba37d043..b34d54b567b7 100644
--- a/drivers/gpu/drm/radeon/evergreen_smc.h
+++ b/drivers/gpu/drm/radeon/evergreen_smc.h
@@ -29,8 +29,7 @@
 
 #define SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE 16
 
-struct SMC_Evergreen_MCRegisterAddress
-{
+struct SMC_Evergreen_MCRegisterAddress {
     uint16_t s0;
     uint16_t s1;
 };
@@ -38,15 +37,13 @@ struct SMC_Evergreen_MCRegisterAddress
 typedef struct SMC_Evergreen_MCRegisterAddress SMC_Evergreen_MCRegisterAddress;
 
 
-struct SMC_Evergreen_MCRegisterSet
-{
+struct SMC_Evergreen_MCRegisterSet {
     uint32_t value[SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE];
 };
 
 typedef struct SMC_Evergreen_MCRegisterSet SMC_Evergreen_MCRegisterSet;
 
-struct SMC_Evergreen_MCRegisters
-{
+struct SMC_Evergreen_MCRegisters {
     uint8_t                             last;
     uint8_t                             reserved[3];
     SMC_Evergreen_MCRegisterAddress     address[SMC_EVERGREEN_MC_REGISTER_ARRAY_SIZE];
-- 
2.17.1

