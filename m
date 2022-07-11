Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86114570793
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 17:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27D1F8F455;
	Mon, 11 Jul 2022 15:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660C88F454
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:50:40 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by andre.telenet-ops.be with bizsmtp
 id trqe2700R4C55Sk01rqe5a; Mon, 11 Jul 2022 17:50:38 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvgE-0036x3-2b; Mon, 11 Jul 2022 17:50:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvgD-006shq-13; Mon, 11 Jul 2022 17:50:37 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH 07/10] video: fbdev: atari: Fix TT High video mode vertical
 refresh
Date: Mon, 11 Jul 2022 17:50:31 +0200
Message-Id: <b31294522c994453a99ab57ced7346c0cef9c32d.1657554353.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657554353.git.geert@linux-m68k.org>
References: <cover.1657554353.git.geert@linux-m68k.org>
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
Cc: Michael Schmitz <schmitzmic@gmail.com>, linux-fbdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The vertical refresh rate for the TT High video mode (1280x960) is
wrong.  Fortunately this field is not really used.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/fbdev/atafb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index fbc333d5615df5d5..528478f6f30857ef 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -484,7 +484,7 @@ static struct fb_videomode atafb_modedb[] __initdata = {
 		0, FB_VMODE_NONINTERLACED
 	}, {
 		/* 1280x960, 72 kHz, 72 Hz (TT high) */
-		"tt-high", 57, 1280, 960, 7760, 260, 60, 36, 4, 192, 4,
+		"tt-high", 72, 1280, 960, 7760, 260, 60, 36, 4, 192, 4,
 		0, FB_VMODE_NONINTERLACED
 	},
 
-- 
2.25.1

