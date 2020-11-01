Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB1B2A1ECC
	for <lists+dri-devel@lfdr.de>; Sun,  1 Nov 2020 15:52:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1362F6EAB9;
	Sun,  1 Nov 2020 14:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64FBB6EAB9
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Nov 2020 14:52:09 +0000 (UTC)
Received: by mail-pj1-x1044.google.com with SMTP id k1so1959819pjd.5
 for <dri-devel@lists.freedesktop.org>; Sun, 01 Nov 2020 06:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WDz5iZ7ScqUpsOhTQpFWUX1eJGf0gqLfwcAH1gDLhKk=;
 b=SGIO4h4iravRi2aPjBFdvDhvj8pQlGCnea3mZTKLfxO2XtXlRU4wWdef5CSmwlAxV7
 fZu8o4fh61hzgzWi1+c//2pM8/mqGz/e0nrpuDz9cQHkhtXQsvFQp0TM8+zNbBpgxTel
 q9I7JVvNxjoXmusZurWxx7m5tD1F3Mtp2SmEukDsBInadw1gllYNjZQ6HIdFFiKdP6Bl
 XQuHaKnaTPZQyIe+d0gs7EL8UlCXDUoFlSwTAq8frpZ3yKBtVCOfbkCvKzwb2tJPt9bj
 FS3sOU8ht8kllUYpaqtTDuOqHIsbqXcuLWxdSONGqzPLThuxKQxLJofFbvuQFGy1+dwh
 kyLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WDz5iZ7ScqUpsOhTQpFWUX1eJGf0gqLfwcAH1gDLhKk=;
 b=taWVBJcEGFbbK6lvdYhT0GpDul2vpirwiq3YjHQv9aR5U8Pbe/GvjllhZXSfSOtPP7
 eYQFtmempX64Ntv3ZUFnPgt6m4Q2b+O5Wwa2300rcSBeaOYtwIEjv+Z6hwO51X3l8z21
 0jtDibc0wBZYioR+h/4/N2LKW38LOdokVCvId1PjBA0fR+xiwA3fSpjC0OPFSg4biQlD
 Sc647zP2AbnTOZaZX+kDNygJKaiK8M9r5pu9JV7I3VaIx+79YbXv2YDFk88BIvlujL0M
 ytulUTwf83j/xi5aPy84HYqzBZsC1viF8SmZA+cSbjGiAc3iFWaDRH2govFGbQWJ4rim
 cBcw==
X-Gm-Message-State: AOAM530pe3vwZjnnE11OGlAJ4Ac2WfcO46Zgz/SFo702dIrY4qq3OXmN
 jjQaVZVtzxId8v/5e1qXVw==
X-Google-Smtp-Source: ABdhPJy9XzDVddbeWywB9pM2wgZ/snK0yVI0jjUcauuzs+uCMfyNHN9Sj4z+VX0A/0EAWRhmR/lslw==
X-Received: by 2002:a17:90b:e8c:: with SMTP id
 fv12mr5987572pjb.196.1604242328948; 
 Sun, 01 Nov 2020 06:52:08 -0800 (PST)
Received: from localhost.localdomain (59-125-13-244.HINET-IP.hinet.net.
 [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id h10sm10370939pgj.69.2020.11.01.06.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Nov 2020 06:52:08 -0800 (PST)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH] fbcon: Replace printk() with pr_*()
Date: Sun,  1 Nov 2020 09:49:04 -0500
Message-Id: <20201101144904.1522611-1-yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201101094718.GD1166694@ravnborg.org>
References: <20201101094718.GD1166694@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Jiri Slaby <jirislaby@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace printk() with pr_err(), pr_warn() and pr_info(). Do not split long
strings, for easier grepping. Use `__func__` whenever applicable.

fbcon_prepare_logo() has more than one callers, use "fbcon_prepare_logo:"
instead of "fbcon_init:", for less confusion.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 42 +++++++++++++-------------------
 1 file changed, 17 insertions(+), 25 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index cef437817b0d..a3e87ab0e523 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -659,8 +659,7 @@ static void fbcon_prepare_logo(struct vc_data *vc, struct fb_info *info,
 
 	if (logo_lines > vc->vc_bottom) {
 		logo_shown = FBCON_LOGO_CANSHOW;
-		printk(KERN_INFO
-		       "fbcon_init: disable boot-logo (boot-logo bigger than screen).\n");
+		pr_info("%s: disable boot-logo (boot-logo bigger than screen).\n", __func__);
 	} else {
 		logo_shown = FBCON_LOGO_DRAW;
 		vc->vc_top = logo_lines;
@@ -785,9 +784,8 @@ static int con2fb_release_oldinfo(struct vc_data *vc, struct fb_info *oldinfo,
 			ret = newinfo->fbops->fb_set_par(newinfo);
 
 			if (ret)
-				printk(KERN_ERR "con2fb_release_oldinfo: "
-					"detected unhandled fb_set_par error, "
-					"error code %d\n", ret);
+				pr_err("%s: detected unhandled fb_set_par error, error code %d\n",
+				       __func__, ret);
 		}
 	}
 
@@ -806,9 +804,8 @@ static void con2fb_init_display(struct vc_data *vc, struct fb_info *info,
 		ret = info->fbops->fb_set_par(info);
 
 		if (ret)
-			printk(KERN_ERR "con2fb_init_display: detected "
-				"unhandled fb_set_par error, "
-				"error code %d\n", ret);
+			pr_err("%s: detected unhandled fb_set_par error, error code %d\n",
+			       __func__, ret);
 	}
 
 	ops->flags |= FBCON_FLAGS_INIT;
@@ -1137,9 +1134,8 @@ static void fbcon_init(struct vc_data *vc, int init)
 			ret = info->fbops->fb_set_par(info);
 
 			if (ret)
-				printk(KERN_ERR "fbcon_init: detected "
-					"unhandled fb_set_par error, "
-					"error code %d\n", ret);
+				pr_err("%s: detected unhandled fb_set_par error, error code %d\n",
+				       __func__, ret);
 		}
 
 		ops->flags |= FBCON_FLAGS_INIT;
@@ -2126,9 +2122,8 @@ static int fbcon_switch(struct vc_data *vc)
 			ret = info->fbops->fb_set_par(info);
 
 			if (ret)
-				printk(KERN_ERR "fbcon_switch: detected "
-					"unhandled fb_set_par error, "
-					"error code %d\n", ret);
+				pr_err("%s: detected unhandled fb_set_par error, error code %d\n",
+				       __func__, ret);
 		}
 
 		if (old_info != info)
@@ -2899,9 +2894,8 @@ void fbcon_remap_all(struct fb_info *info)
 		set_con2fb_map(i, idx, 0);
 
 	if (con_is_bound(&fb_con)) {
-		printk(KERN_INFO "fbcon: Remapping primary device, "
-		       "fb%i, to tty %i-%i\n", idx,
-		       first_fb_vc + 1, last_fb_vc + 1);
+		pr_info("fbcon: Remapping primary device, fb%i, to tty %i-%i\n",
+			idx, first_fb_vc + 1, last_fb_vc + 1);
 		info_idx = idx;
 	}
 	console_unlock();
@@ -2914,17 +2908,16 @@ static void fbcon_select_primary(struct fb_info *info)
 	    fb_is_primary_device(info)) {
 		int i;
 
-		printk(KERN_INFO "fbcon: %s (fb%i) is primary device\n",
-		       info->fix.id, info->node);
+		pr_info("fbcon: %s (fb%i) is primary device\n",
+			info->fix.id, info->node);
 		primary_device = info->node;
 
 		for (i = first_fb_vc; i <= last_fb_vc; i++)
 			con2fb_map_boot[i] = primary_device;
 
 		if (con_is_bound(&fb_con)) {
-			printk(KERN_INFO "fbcon: Remapping primary device, "
-			       "fb%i, to tty %i-%i\n", info->node,
-			       first_fb_vc + 1, last_fb_vc + 1);
+			pr_info("fbcon: Remapping primary device, fb%i, to tty %i-%i\n",
+				info->node, first_fb_vc + 1, last_fb_vc + 1);
 			info_idx = primary_device;
 		}
 	}
@@ -3394,9 +3387,8 @@ void __init fb_console_init(void)
 				     "fbcon");
 
 	if (IS_ERR(fbcon_device)) {
-		printk(KERN_WARNING "Unable to create device "
-		       "for fbcon; errno = %ld\n",
-		       PTR_ERR(fbcon_device));
+		pr_warn("Unable to create device for fbcon; errno = %ld\n",
+			PTR_ERR(fbcon_device));
 		fbcon_device = NULL;
 	} else
 		fbcon_init_device();
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
