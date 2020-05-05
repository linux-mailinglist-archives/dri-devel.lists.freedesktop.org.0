Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF161C57E5
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 16:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D7F6E266;
	Tue,  5 May 2020 14:04:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F7B6E266
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 14:04:28 +0000 (UTC)
Received: from localhost.localdomain ([149.172.19.189]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPA (Nemesis) id
 1Md6AP-1ixBSU2MgF-00aDyq; Tue, 05 May 2020 16:04:09 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marco Elver <elver@google.com>
Subject: [PATCH] omapfb: don't annotate dss_conv_list as __initdata
Date: Tue,  5 May 2020 16:03:52 +0200
Message-Id: <20200505140407.373983-1-arnd@arndb.de>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:b7GTK4JxzyLmn2gIsYhgbVf/xIlBzgBQDzJn6IhgPioBvsvScLO
 hkBobGOJ16kEh5G53aN++eiN7fEy2+8WNjNT2oAAh+pto0naL3H5RGdPuiPGftRLYE+WWk6
 AARHIaGwYWpgUPXoaHmYhwOoJNFWjRb9NvVIVNJ1vaGDXFt+mHz9QyUnAZl6/+oWiMZPV/U
 jTlT9OnyODlD3fxIq7spw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kJXlH+hW/RM=:GF6iW7yf/Pyctg3y13GUV2
 FqaS5odzEtD72BBRKOElhcz2U29q1LNd/0g9U9cvxHcoGNelA0e2X+cWbz9NoPViSRltONkbm
 LGFE+3SZlqFaNTw6HHnzmjvCuCr0ZCnNxcORk1uAX+Sey3pNmJg2E4YT1mR7/HMrhT54dR9ts
 J4X5/BFzLGeko86ZgOn9pIDklBlnCoK6I5TjvbVjBYP1n6iO1zpOuv4DVRQ1XIdvqm0Afyx6Q
 NN9DNF/UxpQnwNk6AxRh+ZAYljaQMy6P/nNk8rSnCKfInuMJvpLLRlzTGRQfwwH51hZ/qH6kJ
 GVRF5EJgFdrY/GmQxvz7qdg6pZRs5bnMigu8+zm028MNOcJmaGY7EZp4KW1fS8JHoRa1b7FKg
 zag7CBsFaMmPV22qZvJdIIDm0wl5M6BqnQYGxLhrc2Rr0CPFRbHNQ5IGfXehZbjPhZ9hfKqwJ
 B6HdayRKMOpYvsMoivRxljBAGW8MRnMNWtuWKgjAFTdWacPd9pqEdzEJv4rZXVo2ufbp//ZUb
 gHYy4n7XY5GyijCSW9fVbHqO7dYRzg84I3dRveYdKcWxkUqz4Hc6HXFkPgmW9DRysy9glOIZp
 D0GqunN4gpNaJQYpfCS7+U+LA4mR4UiyESvK+5oVfVIB+uAVYMijAw1/n2v5iEGvZfAD9ejp5
 La0lZdiWAcQSxK+M/9XNjltEvLvOA3ImAHOawsmGo4wRlXMTXm/6Q4nTx48oalue2KSKvBOuj
 0yjErUk/kCOrAMj0XMFmXosWZZFAbd/GbAaeFNtG3GQw0Y/IqMaFg9Slu2BZtppe+LVNj9Vb2
 BAdW/soKwj4RV9o1kG+AcGs+1G+ryxdeSkhmSUU9+eHuQkZ5uY=
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 "Paul E. McKenney" <paulmck@kernel.org>, clang-built-linux@googlegroups.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alexios Zavras <alexios.zavras@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org,
 Enrico Weigelt <info@metux.net>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the kcsan changes, __read_once_size() is not inlined, but
clang can decide to emit a version that hardcodes the address, which
in turn triggers a warning for dss_conv_list being __initdata but
__read_once_size() not being __init:

WARNING: modpost: vmlinux.o(.text+0x6e4d7a): Section mismatch in
reference from the function __read_once_size() to the variable
.init.data:dss_conv_list
The function __read_once_size() references
the variable __initdata dss_conv_list.
This is often because __read_once_size lacks a __initdata
annotation or the annotation of dss_conv_list is wrong.

This is clearly a false positive warning, but it's hard to tell
who is to blame for it. Work around it by removing the __initdata
annotation, wasting the space of two pointers in return for getting
rid of the warning.

Fixes: dfd402a4c4ba ("kcsan: Add Kernel Concurrency Sanitizer infrastructure")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
index 0ae0cab252d3..29fdff9c95f6 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/omapdss-boot-init.c
@@ -19,7 +19,7 @@
 #include <linux/slab.h>
 #include <linux/list.h>
 
-static struct list_head dss_conv_list __initdata;
+static struct list_head dss_conv_list;
 
 static const char prefix[] __initconst = "omapdss,";
 
-- 
2.26.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
