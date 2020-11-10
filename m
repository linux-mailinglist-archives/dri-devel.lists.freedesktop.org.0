Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D61B62AC9F5
	for <lists+dri-devel@lfdr.de>; Tue, 10 Nov 2020 02:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A32A8897B4;
	Tue, 10 Nov 2020 01:01:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3A9897B4
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 01:01:21 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id i13so3872502pgm.9
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 17:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cHCi4Tquwss85wqRJ3mOu6UhLZdJZsJlvCLd0/Ck3sY=;
 b=jBKACBVfmaUdYHvuEx8v7Eh2gyHv8AYshuUUBc0bMOj77JWMsjTKTXCuaHTp2otRF5
 2SxhlwXt9zAAr8oH+4+5/ozSWE+rRS8cyBGUQzYv3BocGy4mxbuc/86qiHh1xOeuABpx
 PVBnmJJKgY8bvVxQekXsMfKgXV/H9mv3yROs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cHCi4Tquwss85wqRJ3mOu6UhLZdJZsJlvCLd0/Ck3sY=;
 b=Uml18dQVA59lmP1e78It1QxpUh3dl2RLYfV7kZpIx/fdhL8AQD7czxYN5n9Ok0ju9/
 Nukq+iaUb4FBB9iKt2NRZuF47+AUtZE8Epj9NBaIwgMRcQYUssR4NKDvX9CI4Wk1kIuX
 aGZ8bwwVjTYVbM3pYr7ar/EriHkJyurnHncYntWQpAEN2xIcbdxh13JS4FcYGxUiNRQq
 xFSMZ/ZbLaPZxQVJ3NANyLV6ncw4kveWMK0AxHx8/xQz5pZxSKyxkq0HoR/B3uiAQUDd
 1J1p46Fw70m+xugQZARL1bWV4hAzkYgba6UUS3E2txrOpmIxFAPJGtalQvEnnC8mQTuQ
 HNEg==
X-Gm-Message-State: AOAM532K+L0CDQDhYg/fJaekgIkztcWIvAa4Honw7GXFMC/Wj3/9NJBG
 a8+oOX7Utt/8sw2mEGjB1FefIQ==
X-Google-Smtp-Source: ABdhPJxUqY2gGHGRfsunj8lilTT95dFw0XRxavx7ePhqQwfi/Gzf/CQvlyeDCZebkTFKY5ET7ItzEw==
X-Received: by 2002:a62:17c8:0:b029:18b:5a97:a8d1 with SMTP id
 191-20020a6217c80000b029018b5a97a8d1mr15856003pfx.15.1604970080793; 
 Mon, 09 Nov 2020 17:01:20 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
 by smtp.gmail.com with ESMTPSA id u197sm7283233pfc.127.2020.11.09.17.01.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 17:01:20 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v4 1/5] drm: panel: simple: Fixup the struct panel_desc kernel
 doc
Date: Mon,  9 Nov 2020 17:00:55 -0800
Message-Id: <20201109170018.v4.1.Icaa86f0a4ca45a9a7184da4bc63386b29792d613@changeid>
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
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
Cc: robdclark@chromium.org, David Airlie <airlied@linux.ie>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When I run:
  scripts/kernel-doc -rst drivers/gpu/drm/panel/panel-simple.c

I see that several of the kernel-doc entries aren't showing up because
they don't specify the full path down the hierarchy.  Let's fix that
and also move to inline kernel docs.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("drm: panel: simple: Fixup the struct panel_desc kernel doc") new for v4.

 drivers/gpu/drm/panel/panel-simple.c | 59 ++++++++++++++++++++--------
 1 file changed, 42 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 597f676a6591..813c90274631 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -64,33 +64,58 @@ struct panel_desc {
 
 	unsigned int bpc;
 
-	/**
-	 * @width: width (in millimeters) of the panel's active display area
-	 * @height: height (in millimeters) of the panel's active display area
-	 */
 	struct {
+		/**
+		 * @size.width: Width (in mm) of the active display area.
+		 */
 		unsigned int width;
+
+		/**
+		 * @size.height: Height (in mm) of the active display area.
+		 */
 		unsigned int height;
 	} size;
 
-	/**
-	 * @prepare: the time (in milliseconds) that it takes for the panel to
-	 *           become ready and start receiving video data
-	 * @hpd_absent_delay: Add this to the prepare delay if we know Hot
-	 *                    Plug Detect isn't used.
-	 * @enable: the time (in milliseconds) that it takes for the panel to
-	 *          display the first valid frame after starting to receive
-	 *          video data
-	 * @disable: the time (in milliseconds) that it takes for the panel to
-	 *           turn the display off (no content is visible)
-	 * @unprepare: the time (in milliseconds) that it takes for the panel
-	 *             to power itself down completely
-	 */
 	struct {
+		/**
+		 * @delay.prepare: Time for the panel to become ready.
+		 *
+		 * The time (in milliseconds) that it takes for the panel to
+		 * become ready and start receiving video data
+		 */
 		unsigned int prepare;
+
+		/**
+		 * @delay.hpd_absent_delay: Time to wait if HPD isn't hooked up.
+		 *
+		 * Add this to the prepare delay if we know Hot Plug Detect
+		 * isn't used.
+		 */
 		unsigned int hpd_absent_delay;
+
+		/**
+		 * @delay.enable: Time for the panel to display a valid frame.
+		 *
+		 * The time (in milliseconds) that it takes for the panel to
+		 * display the first valid frame after starting to receive
+		 * video data.
+		 */
 		unsigned int enable;
+
+		/**
+		 * @delay.disable: Time for the panel to turn the display off.
+		 *
+		 * The time (in milliseconds) that it takes for the panel to
+		 * turn the display off (no content is visible).
+		 */
 		unsigned int disable;
+
+		/**
+		 * @delay.unprepare: Time to power down completely.
+		 *
+		 * The time (in milliseconds) that it takes for the panel
+		 * to power itself down completely.
+		 */
 		unsigned int unprepare;
 	} delay;
 
-- 
2.29.2.222.g5d2a92d10f8-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
