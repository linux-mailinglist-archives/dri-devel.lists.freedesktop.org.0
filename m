Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AABAD2B04BD
	for <lists+dri-devel@lfdr.de>; Thu, 12 Nov 2020 13:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 389FD6E20C;
	Thu, 12 Nov 2020 12:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFDE6E20C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 12:11:52 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id 34so744634pgp.10
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 04:11:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t1DdLgTC9wfaj9IQp94XVXE/ol9y5Kusx3kBt32JG7w=;
 b=nfGWH+sC/kJrBlznTemQAIuBYZQD2xNWxlJEtlggRHen6AMLz+O/MUAXtwEGzKvuZ/
 bsS3SrCgqY+YgV9+IQFoE66cWTsqf59EVv7MAXIMcyCZLQBi3ZYrdH0UBRMuLlUf2yj9
 b3zk/VlfZuKV5h+JRk2sbI5YCSK/eXZQe9SLBqml5q6VbrP+Hu37EXSklURgk0RJXkCL
 zaFuF/yPmrcY4R9Nl3tfQb6E0kpPJsUC1scb2nkDY4XAILjjEVTQ+IskKOpGAVM/tKzP
 a9OclLMKkoky6+eolkG9m1qHdhsY+dM5SBB4tu2ODyD6qKMArQFDJ5Rlnvj+QOkG6IN7
 pMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t1DdLgTC9wfaj9IQp94XVXE/ol9y5Kusx3kBt32JG7w=;
 b=pffRyom0sgYUvKBaxnE9Z2ho65hcbaVg1iXc/SSrjsSShQ5VrGFSQGpFV6nWOmsci0
 GlaJDXBTg0YZs+Zc2CsGpsCFQlQUf3IEy6kCt7UhJukInaqYQxTDB6LGNBB8lEyBh7Xw
 0kI9BQsosoborTAhlbbpLBgu0AEz91+wG/EDftv1jxa2oU3Lmt+uk2ysdGY1pVVmr1sW
 B7wspgDTwtDJq6HnYSMwxYBrh0ksmQI2XxyltFzS6YefPvFx6d80Nr2MJp/nakLv5eeZ
 qUKVDGxmmn2atL6zBtmqyPuz3wQk1AAul6yAerwbKA8spXLrrNewCoTRQenZiEw3mrtc
 3bRA==
X-Gm-Message-State: AOAM5301xZQFm2Yk7c/Qvyu/0oOqLiDrXoHVPHsE3SCptpr+sL1XOCcX
 tNxB6Qp3b2oxKZHo8rHGeg==
X-Google-Smtp-Source: ABdhPJzoAKiGQyUiVJYAYxSHzoiJpwlzyy5z+eeSeCMFXBPBeQw15GAuIH4UK25wWxOwLWRnusSo1g==
X-Received: by 2002:a17:90a:4295:: with SMTP id
 p21mr9377058pjg.217.1605183112075; 
 Thu, 12 Nov 2020 04:11:52 -0800 (PST)
Received: from localhost.localdomain ([221.124.243.27])
 by smtp.gmail.com with ESMTPSA id v23sm6150243pfn.141.2020.11.12.04.11.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Nov 2020 04:11:51 -0800 (PST)
From: Peilin Ye <yepeilin.cs@gmail.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v3 2/5] console: Delete dummy con_font_set() and
 con_font_default() callback implementations
Date: Thu, 12 Nov 2020 07:11:20 -0500
Message-Id: <9952c7538d2a32bb1a82af323be482e7afb3dedf.1605169912.git.yepeilin.cs@gmail.com>
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Winischhofer <thomas@winischhofer.net>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiri Slaby <jirislaby@kernel.org>,
 Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

.con_font_set and .con_font_default callbacks should not pass `struct
console_font *` as a parameter, since `struct console_font` is a UAPI
structure.

We are trying to let them use our new kernel font descriptor, `struct
font_desc` instead. To make that work slightly easier, first delete all of
their no-op implementations used by dummy consoles.

This will make KD_FONT_OP_SET and KD_FONT_OP_SET_DEFAULT ioctl() requests
on dummy consoles start to fail and return `-ENOSYS`, which is intended,
since no user should ever expect such operations to succeed on dummy
consoles.

Suggested-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: https://lore.kernel.org/lkml/c5563eeea36aae7bd72ea2e985bc610d585ece40.1604306433.git.yepeilin.cs@gmail.com/

Strictly speaking this is different from v2 (see changelog), but it really
shouldn't matter, so I'm keeping Greg's "Reviewed-by:".

Changes in v3:
  - Improve commit message. (Jiri)
  - Do not delete con_font_copy() callbacks, since they have been deleted
    in patch "console: Delete unused con_font_copy() callback
    implementations".

Change in v2:
  - Do not Cc: stable.

 drivers/usb/misc/sisusbvga/sisusb_con.c | 15 ---------------
 drivers/video/console/dummycon.c        | 14 --------------
 2 files changed, 29 deletions(-)

diff --git a/drivers/usb/misc/sisusbvga/sisusb_con.c b/drivers/usb/misc/sisusbvga/sisusb_con.c
index fd9954381fbf..dfa0d5ce6012 100644
--- a/drivers/usb/misc/sisusbvga/sisusb_con.c
+++ b/drivers/usb/misc/sisusbvga/sisusb_con.c
@@ -1345,19 +1345,6 @@ static int sisusbdummycon_blank(struct vc_data *vc, int blank, int mode_switch)
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
 static const struct consw sisusb_dummy_con = {
 	.owner =		THIS_MODULE,
 	.con_startup =		sisusbdummycon_startup,
@@ -1370,8 +1357,6 @@ static const struct consw sisusb_dummy_con = {
 	.con_scroll =		sisusbdummycon_scroll,
 	.con_switch =		sisusbdummycon_switch,
 	.con_blank =		sisusbdummycon_blank,
-	.con_font_set =		sisusbdummycon_font_set,
-	.con_font_default =	sisusbdummycon_font_default,
 };
 
 int
diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
index ab3df752fb57..f1711b2f9ff0 100644
--- a/drivers/video/console/dummycon.c
+++ b/drivers/video/console/dummycon.c
@@ -124,18 +124,6 @@ static int dummycon_switch(struct vc_data *vc)
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
 /*
  *  The console `switch' structure for the dummy console
  *
@@ -154,7 +142,5 @@ const struct consw dummy_con = {
 	.con_scroll =	dummycon_scroll,
 	.con_switch =	dummycon_switch,
 	.con_blank =	dummycon_blank,
-	.con_font_set =	dummycon_font_set,
-	.con_font_default =	dummycon_font_default,
 };
 EXPORT_SYMBOL_GPL(dummy_con);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
