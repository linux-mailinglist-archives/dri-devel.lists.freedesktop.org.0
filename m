Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0E34750238
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:00:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2FEA10E3B4;
	Wed, 12 Jul 2023 08:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 290EF10E381
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 08:59:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 985F2616FD;
 Wed, 12 Jul 2023 08:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71BB7C433C7;
 Wed, 12 Jul 2023 08:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689152390;
 bh=q7X2H6wnJfjAIZzf5I1p+6g/psQfHm52+nWJPGyD/fU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nu1RxwCLBGO1JbcwAvLaNexfSyoJuJQTwytsebBBUQNtoZIrMa0JJ9THxO+5vu2pa
 v/Qdd39gZJsfTAcB6gh+j8xjRMf4PPC1cBH5sqdF1GPJeJVBNNEqHLIrR+8w7bfPMP
 qGGHe1VPNlc8Fxs154PJUn7aXn8XF5RO6/Z/InMu6BvVmMbZaw/31qvSAXSu2EM/Bh
 H/yfbco6KIN0OWDp3mafTUz8YG1pFPDU7ch2jwPKDHmpRa9k9MkB8jThlAyKki0ey3
 W6oG93UIOXTHajb2c6TgDN/bdF41XeiiCxZElLJceQFgmiYQtF0N8AUTII+DqzMsTQ
 BEwQi/CHTa3VA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 2/7] vgacon: remove unneeded forward declarations
Date: Wed, 12 Jul 2023 10:59:37 +0200
Message-ID: <20230712085942.5064-3-jirislaby@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712085942.5064-1-jirislaby@kernel.org>
References: <20230712085942.5064-1-jirislaby@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-serial@vger.kernel.org, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most of the forward declarations in vgacon are not needed. Drop them.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/console/vgacon.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index fbed2862c317..a34cdfcc10c2 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -65,16 +65,8 @@ static struct vgastate vgastate;
  *  Interface used by the world
  */
 
-static const char *vgacon_startup(void);
-static void vgacon_init(struct vc_data *c, int init);
-static void vgacon_deinit(struct vc_data *c);
-static void vgacon_cursor(struct vc_data *c, int mode);
-static int vgacon_switch(struct vc_data *c);
-static int vgacon_blank(struct vc_data *c, int blank, int mode_switch);
-static void vgacon_scrolldelta(struct vc_data *c, int lines);
 static int vgacon_set_origin(struct vc_data *c);
-static void vgacon_save_screen(struct vc_data *c);
-static void vgacon_invert_region(struct vc_data *c, u16 * p, int count);
+
 static struct uni_pagedict *vgacon_uni_pagedir;
 static int vgacon_refcount;
 
-- 
2.41.0

