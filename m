Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5436461E3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 20:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DE6410E0D8;
	Wed,  7 Dec 2022 19:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AF510E0D8
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 19:52:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BBD24B82036;
 Wed,  7 Dec 2022 19:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 74386C433C1;
 Wed,  7 Dec 2022 19:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670442743;
 bh=1+04oEqT9WtkTHfHdNMPXLV48GACszOTTcccua2G1pw=;
 h=From:Date:Subject:To:Reply-To:From;
 b=bEeOinTOuJpV4jDqlmD3euvhGnOVis/epVk/N98ClUyrhad5KbtcYzuTVEdWSrVEj
 sX144YFXX5B7IUeX6I61IUCdkkaGtDcg7xagZGy8FsZrzUCqxewpBrAY9rdHuvHy5E
 HKdIEv3NxE961fE5GY6zeV6fnn8VfWyHRShqgjJm3yzd2xmvujz1Ee7I12b57Ls+4j
 yeaIG/qCz33Crv6sOinqfa18KYzKdZKH/scC869lkA6jCR1AEZ44QjK/IJX6aJcsjD
 Sah8ArKfBhyZTdq6PYOHim8AueBuFGUms3Jz9hrnrnaRodQQAOrdaWSzVnfPDJRjoW
 8Z43RAVPTc+ew==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 629B9C63705;
 Wed,  7 Dec 2022 19:52:23 +0000 (UTC)
From: Noralf =?utf-8?q?Tr=C3=B8nnes?= via B4 Submission Endpoint
 <devnull+noralf.tronnes.org@kernel.org>
Date: Wed, 07 Dec 2022 20:51:25 +0100
Subject: [PATCH] drm/gud: Fix missing include
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-Id: <20221207-gud-missing-include-v1-0-c5b32c9c59da@tronnes.org>
To: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 kernel test robot <lkp@intel.com>,
 Noralf =?utf-8?q?Tr=C3=B8nnes?= <noralf@tronnes.org>
X-Mailer: b4 0.11.0-dev-b77ec
X-Developer-Signature: v=1; a=ed25519-sha256; t=1670442742; l=810;
 i=noralf@tronnes.org; s=20221122; h=from:subject:message-id;
 bh=Sy9oNM1AjyUtgivdSQfr1nLU6XGfgTofHWkK4Acvx/c=; =?utf-8?q?b=3DxfIAU439zxo+?=
 =?utf-8?q?rCQgXY2YaOisRrx2EEGtsCwZBhVm3sfsrE0JdIgJiYyFs2eebOVZcbAXyFRkcrdE?=
 /B8xFfsXAK7FN13RMs1HbLpFzyLD6ill3Gm8/8zDYuLAqDsztmhI
X-Developer-Key: i=noralf@tronnes.org; a=ed25519;
 pk=0o9is4iddvvlrY3yON5SVtAbgPnVs0LfQsjfqR2Hvz8=
X-Endpoint-Received: by B4 Submission Endpoint for noralf@tronnes.org/20221122
 with auth_id=8
X-Original-From: Noralf =?utf-8?q?Tr=C3=B8nnes?= <noralf@tronnes.org>
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
Reply-To: noralf@tronnes.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Noralf Trønnes <noralf@tronnes.org>

Add missing vmalloc.h include.

Fixes: c17d048609bf ("drm/gud: Use the shadow plane helper")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/gud/gud_pipe.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/gud/gud_pipe.c b/drivers/gpu/drm/gud/gud_pipe.c
index 62c43d3632d4..dc16a92625d4 100644
--- a/drivers/gpu/drm/gud/gud_pipe.c
+++ b/drivers/gpu/drm/gud/gud_pipe.c
@@ -5,6 +5,7 @@
 
 #include <linux/lz4.h>
 #include <linux/usb.h>
+#include <linux/vmalloc.h>
 #include <linux/workqueue.h>
 
 #include <drm/drm_atomic.h>

---
base-commit: 5ad8e63ebba3d5a0730b43180b200e41eeb9409c
change-id: 20221207-gud-missing-include-9ccf56382f8a

Best regards,
-- 
Noralf Trønnes <noralf@tronnes.org>
