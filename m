Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C032A13F3
	for <lists+dri-devel@lfdr.de>; Sat, 31 Oct 2020 08:27:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8816E165;
	Sat, 31 Oct 2020 07:27:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CC1D6E165
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 07:27:03 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id b12so4146439plr.4
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Oct 2020 00:27:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iuNBtGDh3GuSA2eKznKy/F5TkdS26fRroHOEG3pO17c=;
 b=SrX3hCDZ7xS4x9fg991BD6OjiIncp3p82vByYKuRBgT7s5flaA6HxV+Yco2lJP7h0x
 6fFtzs4G22KyoEnjI37FAZP8KzfLPKJiMTbCDnfCmk17M9TWjbRJ6h3wBedLqhB8pjb4
 /uJXGDW4Uxae41ztHOcM4h1YY8tefGlGItVDnfABg/QgjYUd9FUva8kGwRbhgyrxYo6H
 CImYd62zdikkr8M8FttgEvV6L3ohv6rMjNfvZfu3hX3Tj6DCXcntC/tVMJ66PiCx/97W
 iDrNWt9RmjG+ePFSJsjvrOhfD3jDIsZO5co59yypK9r+2FoMsvfs+uH3NpCDg5IQwatE
 RUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=iuNBtGDh3GuSA2eKznKy/F5TkdS26fRroHOEG3pO17c=;
 b=isdRjtLkjvT/gS6JUx+/Y8Os+9Ohdco7fFQrAD7HDs7Fhjxc0PGFZESMZSWO9O4Eue
 47Jiot+aaTdAhvq31jDGDos9f7Vko3o7EfmYkfb3ApMudyL/HLAp39CnuRPCIH78H18l
 EzRclj6+BrtmKLuY+VMEneZ7IQd7VQVnuo97p+VBSDfYIUBfle6F1TNNZAJBURMDhvxJ
 3L9DFefcfP2Bn0nSZVtIcLWUT0xO9d4BYEb3pibNNy4sxmwed6WODuLIXGzTl/bI03Md
 iAVSqcYuqMjjV87lGKhX7u8nX9Bjq3nubrTpHePmxr9nfJ7TsC+a0CAeWSWmeQJGw0oU
 gD3w==
X-Gm-Message-State: AOAM533mmSUelJITwcQTHpDeejopzikkIi15x8mjKDH+DTbY0eSwVJnL
 RFhToKqFfvKHm54ZkPfNjQ==
X-Google-Smtp-Source: ABdhPJyqBDEZ+Cnvw1QGEXJk9kInS+eaEDpbOK8w0OyGN/ZJAG4L+UEsgPxEBNlZPDkCjgsrVkcsVQ==
X-Received: by 2002:a17:902:b7c4:b029:d6:855a:df2c with SMTP id
 v4-20020a170902b7c4b02900d6855adf2cmr12579781plz.26.1604129222649; 
 Sat, 31 Oct 2020 00:27:02 -0700 (PDT)
Received: from localhost.localdomain (59-125-13-244.HINET-IP.hinet.net.
 [59.125.13.244])
 by smtp.gmail.com with ESMTPSA id x10sm7460005pfc.88.2020.10.31.00.26.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 Oct 2020 00:27:01 -0700 (PDT)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>,
 Thomas Winischhofer <thomas@winischhofer.net>
Subject: [PATCH 1/2] console: Remove dummy con_font_op() callback
 implementations
Date: Sat, 31 Oct 2020 03:24:41 -0400
Message-Id: <c5563eeea36aae7bd72ea2e985bc610d585ece40.1604128639.git.yepeilin.cs@gmail.com>
X-Mailer: git-send-email 2.25.1
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
 Nicolas Pitre <nico@fluxnic.net>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 George Kennedy <george.kennedy@oracle.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`struct console_font` is a UAPI structure, thus ideally should not be
used for kernel internal abstraction. Remove some dummy .con_font_set,
.con_font_default and .con_font_copy `struct consw` callback
implementations, to make it cleaner.

Patch "fbcon: Prevent global-out-of-bounds read in fbcon_copy_font()"
depends on this patch, so Cc: stable.

Cc: stable@vger.kernel.org
Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
---
Context: https://lore.kernel.org/lkml/CAKMK7uFY2zv0adjKJ_ORVFT7Zzwn075MaU0rEU7_FuqENLR=UA@mail.gmail.com/

 drivers/usb/misc/sisusbvga/sisusb_con.c | 21 ---------------------
 drivers/video/console/dummycon.c        | 20 --------------------
 2 files changed, 41 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb_con.c b/drivers/usb/misc/sisusbvga/sisusb_con.c
index c63e545fb105..dfa0d5ce6012 100644
--- a/drivers/usb/misc/sisusbvga/sisusb_con.c
+++ b/drivers/usb/misc/sisusbvga/sisusb_con.c
@@ -1345,24 +1345,6 @@ static int sisusbdummycon_blank(struct vc_data *vc, int blank, int mode_switch)
 	return 0;
 }
 
-static int sisusbdummycon_font_set(struct vc_data *vc,
-				   struct console_font *font,
-				   unsigned int flags)
-{
-	return 0;
-}
-
-static int sisusbdummycon_font_default(struct vc_data *vc,
-				       struct console_font *font, char *name)
-{
-	return 0;
-}
-
-static int sisusbdummycon_font_copy(struct vc_data *vc, int con)
-{
-	return 0;
-}
-
 static const struct consw sisusb_dummy_con = {
 	.owner =		THIS_MODULE,
 	.con_startup =		sisusbdummycon_startup,
@@ -1375,9 +1357,6 @@ static const struct consw sisusb_dummy_con = {
 	.con_scroll =		sisusbdummycon_scroll,
 	.con_switch =		sisusbdummycon_switch,
 	.con_blank =		sisusbdummycon_blank,
-	.con_font_set =		sisusbdummycon_font_set,
-	.con_font_default =	sisusbdummycon_font_default,
-	.con_font_copy =	sisusbdummycon_font_copy,
 };
 
 int
diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
index 2a0d0bda7faa..f1711b2f9ff0 100644
--- a/drivers/video/console/dummycon.c
+++ b/drivers/video/console/dummycon.c
@@ -124,23 +124,6 @@ static int dummycon_switch(struct vc_data *vc)
 	return 0;
 }
 
-static int dummycon_font_set(struct vc_data *vc, struct console_font *font,
-			     unsigned int flags)
-{
-	return 0;
-}
-
-static int dummycon_font_default(struct vc_data *vc,
-				 struct console_font *font, char *name)
-{
-	return 0;
-}
-
-static int dummycon_font_copy(struct vc_data *vc, int con)
-{
-	return 0;
-}
-
 /*
  *  The console `switch' structure for the dummy console
  *
@@ -159,8 +142,5 @@ const struct consw dummy_con = {
 	.con_scroll =	dummycon_scroll,
 	.con_switch =	dummycon_switch,
 	.con_blank =	dummycon_blank,
-	.con_font_set =	dummycon_font_set,
-	.con_font_default =	dummycon_font_default,
-	.con_font_copy =	dummycon_font_copy,
 };
 EXPORT_SYMBOL_GPL(dummy_con);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
