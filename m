Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FB34F3F71
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 23:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 408ED10E5E6;
	Tue,  5 Apr 2022 21:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F8910E269
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 21:03:44 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id n35so219940wms.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 14:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MxAInQzcNTksfSA5RmeXKMCwZYYWqxTeyIXb4MMqxMg=;
 b=heXy/Oj2qHVqoiONUHUhum4ojRz8gDiSulYsDe2V5W6uuzlbC/F7hk5OMUYPtA9lRK
 EvsPHvaGwUj1SYGf9ddWUlFulWW0XgbgSmyQtVRl93y7J8G+JaTU+IS0yNBFs/xl82Ha
 +ChM9wZTbrsQiZaoECs3CHhU+YvhETcifsyl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MxAInQzcNTksfSA5RmeXKMCwZYYWqxTeyIXb4MMqxMg=;
 b=Gz5YdOv+h1VPhSIz/SRVdutNplQsaB+AEgOahJQO7zphKBWerU4OUHZKXsjxP+A4wS
 ycwZDsSuPMH4PCeGyM/kP71R68RzYYwjhbmXz6LIJx+T9p7JRKH5UVIA+nNm9Bd1lqeK
 gJCX5rspO5tl8R64xKh8fEk6yUjut3drqcEDSrJqeP/062eOjeMUx4TrfvQU000T+XOg
 OmS+dFRi1nrxKmtZWvYkqpCUpuSLwdV/rqsmx2dTl/B4zV3MqYL16OIgsUCZQUGvbH9d
 t2Ag9dx2pgBIvYk86npzjdEBL/+ADicdwSRCnqVVkOpjKtNBBkgb5BFND73CAIY/FxLz
 7/ng==
X-Gm-Message-State: AOAM532EqWz0dtoFXj14iNnCrZyjjZemCpS5SNby+njCTTobGzhM/t4x
 Lw9zJaTYTCMbFSNfC0JlEJqkIhE/7ZVXCC3RLBg=
X-Google-Smtp-Source: ABdhPJz2p3saRdVWddtUKvx6UT0VLLMUNUIrCE+5C8SmfhGX8UQm0bQwMJe+OH0L/3U/z0CpnnoNFQ==
X-Received: by 2002:a1c:f30b:0:b0:37b:b5de:c804 with SMTP id
 q11-20020a1cf30b000000b0037bb5dec804mr4615486wmq.166.1649192622624; 
 Tue, 05 Apr 2022 14:03:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm4858569wmb.36.2022.04.05.14.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:03:41 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 01/17] fbcon: delete a few unneeded forward decl
Date: Tue,  5 Apr 2022 23:03:19 +0200
Message-Id: <20220405210335.3434130-2-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
References: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
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
Cc: Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Claudio Suarez <cssk@net-c.es>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I didn't bother with any code movement to fix the others, these just
got a bit in the way.

v2: Rebase on top of Helge's reverts.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org> (v1)
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org> (v1)
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Du Cheng <ducheng2@gmail.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/fbdev/core/fbcon.c | 17 +----------------
 1 file changed, 1 insertion(+), 16 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 2fc1b80a26ad..235eaab37d84 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -163,29 +163,14 @@ static int fbcon_cursor_noblink;
  *  Interface used by the world
  */
 
-static const char *fbcon_startup(void);
-static void fbcon_init(struct vc_data *vc, int init);
-static void fbcon_deinit(struct vc_data *vc);
-static void fbcon_clear(struct vc_data *vc, int sy, int sx, int height,
-			int width);
-static void fbcon_putc(struct vc_data *vc, int c, int ypos, int xpos);
-static void fbcon_putcs(struct vc_data *vc, const unsigned short *s,
-			int count, int ypos, int xpos);
 static void fbcon_clear_margins(struct vc_data *vc, int bottom_only);
-static void fbcon_cursor(struct vc_data *vc, int mode);
 static void fbcon_bmove(struct vc_data *vc, int sy, int sx, int dy, int dx,
 			int height, int width);
-static int fbcon_switch(struct vc_data *vc);
-static int fbcon_blank(struct vc_data *vc, int blank, int mode_switch);
 static void fbcon_set_palette(struct vc_data *vc, const unsigned char *table);
 
 /*
  *  Internal routines
  */
-static __inline__ void ywrap_up(struct vc_data *vc, int count);
-static __inline__ void ywrap_down(struct vc_data *vc, int count);
-static __inline__ void ypan_up(struct vc_data *vc, int count);
-static __inline__ void ypan_down(struct vc_data *vc, int count);
 static void fbcon_bmove_rec(struct vc_data *vc, struct fbcon_display *p, int sy, int sx,
 			    int dy, int dx, int height, int width, u_int y_break);
 static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
@@ -194,8 +179,8 @@ static void fbcon_redraw_move(struct vc_data *vc, struct fbcon_display *p,
 			      int line, int count, int dy);
 static void fbcon_modechanged(struct fb_info *info);
 static void fbcon_set_all_vcs(struct fb_info *info);
-static void fbcon_start(void);
 static void fbcon_exit(void);
+
 static struct device *fbcon_device;
 
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
-- 
2.34.1

