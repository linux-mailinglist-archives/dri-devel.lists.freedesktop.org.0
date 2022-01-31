Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E21A4A50CF
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 22:06:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928F510E484;
	Mon, 31 Jan 2022 21:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4963310E484
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 21:06:40 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id l25so27814241wrb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 13:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=maVDh36g+mbMxDQqKVsClyM2EENbHZLdIj/dxYmw5do=;
 b=Qcsxhy2o/dS11RJsdCfS9Bxk3l2q8JaeoimOSXKdnQQwY7aFMOzBCGs3z75BZLUfjP
 G5PY5jJU5KSJ23gLrVGnPRmbSww2IYvxZ0Ieehv+Gk524P056aEZJfV+u7yvV1LmpBj6
 v0MRUtj2qEfuN8Rj2tN9HSteIZLF/+MTHdjd0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=maVDh36g+mbMxDQqKVsClyM2EENbHZLdIj/dxYmw5do=;
 b=j1iP57y6KeLGCAKLcKu6vPWC/ePmIXukMdi8qVoQQEumQCNghNWKr3b+C5eWQEBKFu
 UG6ZdjTJ0ugvMssQSkqfk70DBM3BV2mBpxGQ4LWs0ADJVLHXz1gFVNzRfqvH3nZPohVs
 s5dW5int9GtyxFC1PAqwtE0xAlh9xaOT9ulxDqyHdaTo48UH9E6iZ4TlLJeKdgCbGkWH
 THO1LVYNrw8ssyXn5hs7wytYF6uxM7UhBR7IIQNEgqRpOhoDbEv3dx/yGPPWl/VMJrTY
 hHYkAT6ykXCEPUIITYfEByxs2TIqAa12wW/H6hiI6zB64Ndxyojqauz5LIsXhNo77elE
 E/rA==
X-Gm-Message-State: AOAM530vYaGUl2KiIOUdEny3I4EvcwXCzU/MU70oHe9TjwNo0F3LnLOs
 JzG9QU2kd/n+PZQbQWIQx027vfnTCIPOoA==
X-Google-Smtp-Source: ABdhPJwUiYtIFsmkn1+ZKECUjh4jElDblVWqzeBW7WDzEcxIsGU9rssDBdn9pVrrCKK6rcDF8iLQ3w==
X-Received: by 2002:a05:6000:104e:: with SMTP id
 c14mr19310924wrx.252.1643663198814; 
 Mon, 31 Jan 2022 13:06:38 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b11sm314961wmq.46.2022.01.31.13.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:06:38 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 04/21] fbcon: delete a few unneeded forward decl
Date: Mon, 31 Jan 2022 22:05:35 +0100
Message-Id: <20220131210552.482606-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I didn't bother with any code movement to fix the others, these just
got a bit in the way.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Du Cheng <ducheng2@gmail.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/video/fbdev/core/fbcon.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 39dc18a5de86..2a575620ef59 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -163,18 +163,7 @@ static int fbcon_cursor_noblink;
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
-static int fbcon_switch(struct vc_data *vc);
-static int fbcon_blank(struct vc_data *vc, int blank, int mode_switch);
 static void fbcon_set_palette(struct vc_data *vc, const unsigned char *table);
 
 /*
@@ -184,8 +173,8 @@ static void fbcon_set_disp(struct fb_info *info, struct fb_var_screeninfo *var,
 			   int unit);
 static void fbcon_modechanged(struct fb_info *info);
 static void fbcon_set_all_vcs(struct fb_info *info);
-static void fbcon_start(void);
 static void fbcon_exit(void);
+
 static struct device *fbcon_device;
 
 #ifdef CONFIG_FRAMEBUFFER_CONSOLE_ROTATION
-- 
2.33.0

