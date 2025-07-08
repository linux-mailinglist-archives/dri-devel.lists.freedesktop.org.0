Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183BCAFD396
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 18:58:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8A210E008;
	Tue,  8 Jul 2025 16:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="NOdoU2pl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2808610E008
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 16:58:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3DCBB61441;
 Tue,  8 Jul 2025 16:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF39C4CEED;
 Tue,  8 Jul 2025 16:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1751993883;
 bh=kx6FJAjprvejNhhebn86h4bHayhejk5tCWnHq6kGeac=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NOdoU2plpmjsRINrVazpm5NOmI0fyuC6YRtPVvC8DcqNfWw0ErmofvKHXimaWj0iK
 mveOWAQMxsc2Sgix9v2/ZfaqTjWADkPXb+5dVwB2PeIvGcLp5q3xJZlFNwGZN0seLT
 O7vHSfKAh34asKkBI5qF66qxelRmlydbLqproYI0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Subject: [PATCH 5.15 052/160] vgacon: remove unneeded forward declarations
Date: Tue,  8 Jul 2025 18:21:29 +0200
Message-ID: <20250708162232.984234899@linuxfoundation.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708162231.503362020@linuxfoundation.org>
References: <20250708162231.503362020@linuxfoundation.org>
User-Agent: quilt/0.68
X-stable: review
X-Patchwork-Hint: ignore
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

5.15-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Jiri Slaby (SUSE) <jirislaby@kernel.org>

[ Upstream commit 6ceed69cde8fe4a78fe50d62d7a88a5c1eed4709 ]

Most of the forward declarations in vgacon are not needed. Drop them.

Signed-off-by: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Helge Deller <deller@gmx.de>
Stable-dep-of: 03bcbbb3995b ("dummycon: Trigger redraw when switching consoles with deferred takeover")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/console/vgacon.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index b2180fd183307..9bfe451050209 100644
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
2.39.5



