Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DF12B04AD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 13:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BC7D6E20B;
	Thu, 12 Nov 2020 12:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4476E20B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 12:05:16 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id a18so4345573pfl.3
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 04:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IZQaNtNkLL6z6ZbtohWqKAcM+GdB+jm2XeErfe9vHvk=;
 b=tWZZLSpZQp22wCUD9a5oZxqbpelF7THomnGgPYP9PNTyxbAVSr2agCxI5OniPq2g/r
 nf0TcAHxo3fIWXJa8O3yMqN2ED6fxzXQso9mKvKJYl/vBT2n5S2PvEGtxG3t0j/DxoGA
 NwbXNERV6wV9E8oxhZNi5NSYn6BVRl+0Rw7j6iHVtWXEnVXIqEiySm3yYyb2j9C1B/On
 k39IE3CQkFcuD4rvK77NtBJAMo3Px1OMJ2NI/e23UFzOgPK4xQY495FJ79OUycHZfQgR
 aRVTK4R9TwBAmdh4ulPFceB0/1cJpm3N47vf/y4qvSBZAaTf2Yqy4pj4fiA6356S5ofz
 wQuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IZQaNtNkLL6z6ZbtohWqKAcM+GdB+jm2XeErfe9vHvk=;
 b=rbZe0V+vbZWXqFvCdd5CdGPnD9TEVoJHE+VhS7apV5aYOoj+De0ESKE9oLihs618gA
 cB2y2mZQzuvE0+7zzJK7xdcM2sgilso8pFODYWwcECpJP3p8BrXtPXf0kkYrrhUqGkye
 b0uhqcDam91TWpIgQvbcLO2CFTO1C0Ix9iViWbzVzmjndNQhrtHDOT4gA/KY+Cqf0dWw
 CkBhRsYoeqACYdvPu6PzbN8twDVJhnJ2X5v25RK3/LVaqehJpl2k6BjtHNNRIJkR2UDO
 efgEPFr60VDAHiUnyL5iC2ZPgwqn7xvSNJdmXGM9GRIKDUUlnZb3dc9ZBDldnTuQZ/Uw
 KY5w==
X-Gm-Message-State: AOAM532e2dzRPpxNiF4Jg/cbMtxt55aMq9uHnp1Net/TwmyPowkoPDAB
 +48qAnEiox3dkQ531Z38zA==
X-Google-Smtp-Source: ABdhPJzO1hDeZ2IhKJ6bqNEiYkz8GU6RttBVRGOqDMF23KFVlKIirfFc4QCLUbOzesItxvr8eD/yrg==
X-Received: by 2002:a62:1b02:0:b029:18a:b052:deb1 with SMTP id
 b2-20020a621b020000b029018ab052deb1mr28203408pfb.32.1605182715659; 
 Thu, 12 Nov 2020 04:05:15 -0800 (PST)
Received: from localhost.localdomain ([221.124.243.27])
 by smtp.gmail.com with ESMTPSA id i7sm6567928pjj.20.2020.11.12.04.05.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 04:05:14 -0800 (PST)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH 1/5] console: Delete unused con_font_copy() callback
 implementations
Date: Thu, 12 Nov 2020 07:04:03 -0500
Message-Id: <c8d28007edf50de4387e1532eb3eb736db716f73.1605169912.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1605169912.git.yepeilin.cs@gmail.com>
References: <cover.1605169912.git.yepeilin.cs@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Winischhofer <thomas@winischhofer.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Recently in commit 3c4e0dff2095 ("vt: Disable KD_FONT_OP_COPY") we
disabled the KD_FONT_OP_COPY ioctl() option. Delete all the
con_font_copy() callbacks, since we no longer use them.

Mark KD_FONT_OP_COPY as "obsolete" in include/uapi/linux/kd.h, just like
what we have done for PPPIOCDETACH in commit af8d3c7c001a ("ppp: remove
the PPPIOCDETACH ioctl").

Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
 drivers/usb/misc/sisusbvga/sisusb_con.c |  6 ------
 drivers/video/console/dummycon.c        |  6 ------
 drivers/video/fbdev/core/fbcon.c        | 11 -----------
 include/linux/console.h                 |  1 -
 include/uapi/linux/kd.h                 |  2 +-
 5 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb_con.c b/drivers/usb/misc/sisusbvga/sisusb_con.c
index c63e545fb105..fd9954381fbf 100644
--- a/drivers/usb/misc/sisusbvga/sisusb_con.c
+++ b/drivers/usb/misc/sisusbvga/sisusb_con.c
@@ -1358,11 +1358,6 @@ static int sisusbdummycon_font_default(struct vc_data *vc,
 	return 0;
 }
 
-static int sisusbdummycon_font_copy(struct vc_data *vc, int con)
-{
-	return 0;
-}
-
 static const struct consw sisusb_dummy_con = {
 	.owner =		THIS_MODULE,
 	.con_startup =		sisusbdummycon_startup,
@@ -1377,7 +1372,6 @@ static const struct consw sisusb_dummy_con = {
 	.con_blank =		sisusbdummycon_blank,
 	.con_font_set =		sisusbdummycon_font_set,
 	.con_font_default =	sisusbdummycon_font_default,
-	.con_font_copy =	sisusbdummycon_font_copy,
 };
 
 int
diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
index 2a0d0bda7faa..ab3df752fb57 100644
--- a/drivers/video/console/dummycon.c
+++ b/drivers/video/console/dummycon.c
@@ -136,11 +136,6 @@ static int dummycon_font_default(struct vc_data *vc,
 	return 0;
 }
 
-static int dummycon_font_copy(struct vc_data *vc, int con)
-{
-	return 0;
-}
-
 /*
  *  The console `switch' structure for the dummy console
  *
@@ -161,6 +156,5 @@ const struct consw dummy_con = {
 	.con_blank =	dummycon_blank,
 	.con_font_set =	dummycon_font_set,
 	.con_font_default =	dummycon_font_default,
-	.con_font_copy =	dummycon_font_copy,
 };
 EXPORT_SYMBOL_GPL(dummy_con);
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index cef437817b0d..26d1b0916692 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2451,16 +2451,6 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h,
 	return 0;
 }
 
-static int fbcon_copy_font(struct vc_data *vc, int con)
-{
-	struct fbcon_display *od = &fb_display[con];
-	struct console_font *f = &vc->vc_font;
-
-	if (od->fontdata == f->data)
-		return 0;	/* already the same font... */
-	return fbcon_do_set_font(vc, f->width, f->height, od->fontdata, od->userfont);
-}
-
 /*
  *  User asked to set font; we are guaranteed that
  *	a) width and height are in range 1..32
@@ -3111,7 +3101,6 @@ static const struct consw fb_con = {
 	.con_font_set 		= fbcon_set_font,
 	.con_font_get 		= fbcon_get_font,
 	.con_font_default	= fbcon_set_def_font,
-	.con_font_copy 		= fbcon_copy_font,
 	.con_set_palette 	= fbcon_set_palette,
 	.con_invert_region 	= fbcon_invert_region,
 	.con_screen_pos 	= fbcon_screen_pos,
diff --git a/include/linux/console.h b/include/linux/console.h
index 4b1e26c4cb42..20874db50bc8 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -62,7 +62,6 @@ struct consw {
 	int	(*con_font_get)(struct vc_data *vc, struct console_font *font);
 	int	(*con_font_default)(struct vc_data *vc,
 			struct console_font *font, char *name);
-	int	(*con_font_copy)(struct vc_data *vc, int con);
 	int     (*con_resize)(struct vc_data *vc, unsigned int width,
 			unsigned int height, unsigned int user);
 	void	(*con_set_palette)(struct vc_data *vc,
diff --git a/include/uapi/linux/kd.h b/include/uapi/linux/kd.h
index 4616b31f84da..ee929ece4112 100644
--- a/include/uapi/linux/kd.h
+++ b/include/uapi/linux/kd.h
@@ -173,7 +173,7 @@ struct console_font {
 #define KD_FONT_OP_SET		0	/* Set font */
 #define KD_FONT_OP_GET		1	/* Get font */
 #define KD_FONT_OP_SET_DEFAULT	2	/* Set font to default, data points to name / NULL */
-#define KD_FONT_OP_COPY		3	/* Copy from another console */
+#define KD_FONT_OP_COPY		3	/* Obsolete, do not use */
 
 #define KD_FONT_FLAG_DONT_RECALC 	1	/* Don't recalculate hw charcell size [compat] */
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
