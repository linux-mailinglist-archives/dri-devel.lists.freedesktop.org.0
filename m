Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C8422ACA4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 12:35:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F1236E89D;
	Thu, 23 Jul 2020 10:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FC66E89D
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 10:34:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1A1C1AC52;
 Thu, 23 Jul 2020 10:35:03 +0000 (UTC)
From: Jiri Slaby <jslaby@suse.cz>
To: corbet@lwn.net
Subject: [PATCH -resend] Documentation: fb, fix path to modedb.c
Date: Thu, 23 Jul 2020 12:34:54 +0200
Message-Id: <20200723103454.26167-1-jslaby@suse.cz>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jslaby@suse.cz>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

modedb.c was moved twice since the modedb documentation was written.
Update the path to the current one.

Signed-off-by: Jiri Slaby <jslaby@suse.cz>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org
---
 Documentation/fb/modedb.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/fb/modedb.rst b/Documentation/fb/modedb.rst
index 624d08fd2856..4d2411e32ebb 100644
--- a/Documentation/fb/modedb.rst
+++ b/Documentation/fb/modedb.rst
@@ -152,7 +152,7 @@ To specify a video mode at bootup, use the following boot options::
     video=<driver>:<xres>x<yres>[-<bpp>][@refresh]
 
 where <driver> is a name from the table below.  Valid default modes can be
-found in linux/drivers/video/modedb.c.  Check your driver's documentation.
+found in drivers/video/fbdev/core/modedb.c.  Check your driver's documentation.
 There may be more modes::
 
     Drivers that support modedb boot options
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
