Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C408726FA34
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 12:15:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0536ECCB;
	Fri, 18 Sep 2020 10:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3756ECCB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 10:15:01 +0000 (UTC)
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1N7zRz-1kXDZn1yT5-014yxk; Fri, 18 Sep 2020 12:09:40 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 2/3] fbdev: sbuslib: remove unused FBIOSCURSOR32 helper
Date: Fri, 18 Sep 2020 12:09:05 +0200
Message-Id: <20200918100926.1447563-2-arnd@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200918100812.1447443-1-arnd@arndb.de>
References: <20200918100812.1447443-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:zCEZ1DycMvsb//ALcfn5m89NQWj8AUckAwk5TZ8BBN3FNirqRm1
 lHkrRcm1EpL6KtxGvKFg+cKHBbEOiUl+RwkmjXDwLNiBHJ6GxRfDmvvVyixB+3ZgVwFbYvv
 epSrQtR1L1KwUaxXQhS9w5GYuDF1WCu7zyoGC+7m9c8UXq8rxYlKNMQ722i18Xt4g30PpiA
 aHdSceSI8Y3V+gd/RuJgA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:c0+4qu6OzWc=:HtLnYfQgKCTUTCH0gdWCDB
 3xqrTuxp0yj1XBdZkbYHIKSFkylOHzFmQE7w+oGRUIx7wilR/xqH+kfUfCJgweDYzHd2Z0umt
 noJvxa1wQElooCJd3uXDxR8RjZim+a6fUSdRv10ksda0SeubGzxeFRHmqOjSwouyImrft/AQm
 NSJsaBBl2nHgPIW+zAfLDsYj7kIEev1KmFB1Rah38EwqxnUaGUWRn/o4QJZYVok+VZzjdJWuI
 7WbpYgq3R9B2icSBASjas1ssoX+jHZtVhXF6e9ubLkkYmnbBJKXoxALLMWXAMTzu3+/fikYVq
 KmL3bWrUOcbKtGMOrzOckQZ2iElZkyXy3SeghBqIey8DyqEFKHp6yuYneTW+Qj8NSw9baPdIZ
 Frc4G42m1YBBxQpKW25xWFaUV1Wo5I2oy757sRTOk8tgHoL0xS9i4/Q8AvpxgXgyGkz6OFBRP
 BAacY896gqOF6oF92E2zUKzGtVM1PxDl8sH5vggeNkI1J8u4I2E6+1kUMQXZOY2u7nRUGK2mn
 vuJUFqzH+tp7U0X1/3eGN7L+WpiPfSYhh1OJ9HybGkYeBv90pUIRscKzba4rgmSlfhGj/H9pr
 UbwLoqgc92sHBomQjt/iSn2j3arBRSqPhqeLjhs0sCc7hR9lFGbr/lO2lj2MQx+4LGDUJW9S8
 /wILaB/Y1h1RP2cxYcTV00oWy3ABaNlnl+SSmaB/CO1OqaoZ/WWMhFHDvVkEBBtjIEDMVTcL+
 JFp+XdzR9Zz5VAFSs28ldD18KycQfdxC0ms0xgfmb6Mnq1c1wKOTxNtTEvjMqQAOE8LsQ1iHj
 fZ2qj3gWyfMzK9aeMLElST2VaHRuR046rG4FG10NW0zcqZrQX2qWiNmCA9pTQlqQQDExtx8
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
Cc: "David S . Miller" <davem@davemloft.net>, Arnd Bergmann <arnd@arndb.de>,
 hch@lst.de, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No driver implements FBIOSCURSOR, so this function has no purpose
and can be removed. Apparently it was added in linux-2.1.44 to handle
compatibility for drivers/sbus/char/sunfb.c but lost its purpose when
that driver got rewritten in linux-2.5.63.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/sbuslib.c | 29 +----------------------------
 1 file changed, 1 insertion(+), 28 deletions(-)

diff --git a/drivers/video/fbdev/sbuslib.c b/drivers/video/fbdev/sbuslib.c
index 01a7110e61a7..f728db9bcff8 100644
--- a/drivers/video/fbdev/sbuslib.c
+++ b/drivers/video/fbdev/sbuslib.c
@@ -214,32 +214,6 @@ static int fbiogetputcmap(struct fb_info *info, unsigned int cmd, unsigned long
 			(unsigned long)p);
 }
 
-static int fbiogscursor(struct fb_info *info, unsigned long arg)
-{
-	struct fbcursor __user *p = compat_alloc_user_space(sizeof(*p));
-	struct fbcursor32 __user *argp =  (void __user *)arg;
-	compat_uptr_t addr;
-	int ret;
-
-	ret = copy_in_user(p, argp,
-			      2 * sizeof (short) + 2 * sizeof(struct fbcurpos));
-	ret |= copy_in_user(&p->size, &argp->size, sizeof(struct fbcurpos));
-	ret |= copy_in_user(&p->cmap, &argp->cmap, 2 * sizeof(int));
-	ret |= get_user(addr, &argp->cmap.red);
-	ret |= put_user(compat_ptr(addr), &p->cmap.red);
-	ret |= get_user(addr, &argp->cmap.green);
-	ret |= put_user(compat_ptr(addr), &p->cmap.green);
-	ret |= get_user(addr, &argp->cmap.blue);
-	ret |= put_user(compat_ptr(addr), &p->cmap.blue);
-	ret |= get_user(addr, &argp->mask);
-	ret |= put_user(compat_ptr(addr), &p->mask);
-	ret |= get_user(addr, &argp->image);
-	ret |= put_user(compat_ptr(addr), &p->image);
-	if (ret)
-		return -EFAULT;
-	return info->fbops->fb_ioctl(info, FBIOSCURSOR, (unsigned long)p);
-}
-
 int sbusfb_compat_ioctl(struct fb_info *info, unsigned int cmd, unsigned long arg)
 {
 	switch (cmd) {
@@ -248,6 +222,7 @@ int sbusfb_compat_ioctl(struct fb_info *info, unsigned int cmd, unsigned long ar
 	case FBIOGATTR:
 	case FBIOSVIDEO:
 	case FBIOGVIDEO:
+	case FBIOSCURSOR32:
 	case FBIOGCURSOR32:	/* This is not implemented yet.
 				   Later it should be converted... */
 	case FBIOSCURPOS:
@@ -258,8 +233,6 @@ int sbusfb_compat_ioctl(struct fb_info *info, unsigned int cmd, unsigned long ar
 		return fbiogetputcmap(info, cmd, arg);
 	case FBIOGETCMAP32:
 		return fbiogetputcmap(info, cmd, arg);
-	case FBIOSCURSOR32:
-		return fbiogscursor(info, arg);
 	default:
 		return -ENOIOCTLCMD;
 	}
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
