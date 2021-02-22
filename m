Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9214320FC0
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 04:29:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B6389973;
	Mon, 22 Feb 2021 03:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 388F989973
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 03:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=2/j5Lqy5dhvDPN7B6GDS9vPRNJDpnM+aTBfnWbXMC7w=; b=OtRJW4wqXmNWb5xMEq9F+WqDJf
 aPhAT9Xw3GzbfmQkSSruEZcR20orlmcwzomgY+Z/9sZGzmBOf/612nLV6aYXzAdJBN4N8PsovftZm
 IC0fXQbawnBjb6XS6CTsnthabiNdzyrH/Gz+GjHun2cyEShhnS5us5HO5+eCo759nN85IKjdGZOms
 Q3olCqW6gTnKPSfGFxeRrXA41UReb4818SsELVc8ZM3OpuaeWPzIkwyvXfbKoaC29NIZB3xR989st
 p7GCx1FWfJ1tmKDU+PCvgUc7JVqu/3y1EbBjDqiCEPwHvCWeR2D5nig3WPNEar2rTcDPLjj37CWqD
 KEWjUZzA==;
Received: from [2601:1c0:6280:3f0::d05b] (helo=merlin.infradead.org)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE1u7-0003dI-HH; Mon, 22 Feb 2021 03:29:00 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: atyfb: add stubs for aty_{ld,st}_lcd()
Date: Sun, 21 Feb 2021 19:28:53 -0800
Message-Id: <20210222032853.21483-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
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
Cc: linux-fbdev@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Randy Dunlap <rdunlap@infradead.org>,
 dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix build errors when these functions are not defined.

../drivers/video/fbdev/aty/atyfb_base.c: In function 'aty_power_mgmt':
../drivers/video/fbdev/aty/atyfb_base.c:2002:7: error: implicit declaration of function 'aty_ld_lcd'; did you mean 'aty_ld_8'? [-Werror=implicit-function-declaration]
 2002 |  pm = aty_ld_lcd(POWER_MANAGEMENT, par);
../drivers/video/fbdev/aty/atyfb_base.c:2004:2: error: implicit declaration of function 'aty_st_lcd'; did you mean 'aty_st_8'? [-Werror=implicit-function-declaration]
 2004 |  aty_st_lcd(POWER_MANAGEMENT, pm, par);

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reported-by: kernel test robot <lkp@intel.com>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
---
 drivers/video/fbdev/aty/atyfb_base.c |    9 +++++++++
 1 file changed, 9 insertions(+)

--- linux-next-20210219.orig/drivers/video/fbdev/aty/atyfb_base.c
+++ linux-next-20210219/drivers/video/fbdev/aty/atyfb_base.c
@@ -175,6 +175,15 @@ u32 aty_ld_lcd(int index, const struct a
 		return aty_ld_le32(LCD_DATA, par);
 	}
 }
+#else /* defined(CONFIG_PMAC_BACKLIGHT) || defined(CONFIG_FB_ATY_BACKLIGHT) \
+	 defined(CONFIG_FB_ATY_GENERIC_LCD) */
+void aty_st_lcd(int index, u32 val, const struct atyfb_par *par)
+{ }
+
+u32 aty_ld_lcd(int index, const struct atyfb_par *par)
+{
+	return 0;
+}
 #endif /* defined(CONFIG_PMAC_BACKLIGHT) || defined (CONFIG_FB_ATY_GENERIC_LCD) */
 
 #ifdef CONFIG_FB_ATY_GENERIC_LCD
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
