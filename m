Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5570BB62BD
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 09:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8DB10E1E3;
	Fri,  3 Oct 2025 07:32:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VaMBw0yP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5061E10E1E3
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 07:32:47 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-796fe71deecso18320846d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Oct 2025 00:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759476766; x=1760081566; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZyM65ZzKgdxvaKc/F+b3wo5trSbYBBSP9NHa584kBnI=;
 b=VaMBw0yPoHBgKpsegPDJyZ+lFj5ZSPLYNPPboMAsR/a/oGXlYtlhG9fazEkjbvfChA
 6UTYDdGCZqpWu+O4VjJaRIdLAGklzh0O6lHzleLwDilhdv8IltmZmFLFhKmCpcxdHGI6
 8szLDVeB5M7QCJwI/VzF7d7UMkU43CX1e/vEEa6T9nzOLKh78+n+wAUi3znDoB0p/oz6
 c7esWOjOEVUvBt5P8Ezls8C4Fr9FyY+t+lcM4yZyV3OavP02Y8YzIJ8d3ypzBNHZi4H3
 ffX20nim4CT6M6ozEElkitNblmlhVQg0PjWwYoe5Tkr8fRVryGthxP8Nf5+5PSIVeDbN
 WxeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759476766; x=1760081566;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZyM65ZzKgdxvaKc/F+b3wo5trSbYBBSP9NHa584kBnI=;
 b=TicS7ZJ8FQ8ZR+HQKFAofluYPx7w8uED4M7IyUN/h0Q4i53B71peXbwp3PaQ09zOSX
 wSeuX2PFkrLWgmHhQSbhLx9WvOiWqhnIWV7QTHst4KITqkaxH4HpDgoguZzl51YWjSia
 iIj57/0DqbquoLTfljWbih+K8XF6IZ28N5F2WvsAUDK4wEUlE3HbMO48/aeCEfXf7rkG
 Kc71xYNF5C3s21A1VI4VCrNl67aoN7JUT1XtlLV4GeHCc8QFqoBljGUZbHh0DMjbwaxV
 e6YuWJLh7CJYQd1kGas3w3oa983IgDoFlFZzFg+fxjcIDqf+3nL5Oot6Hhd2vjIiqluI
 3R1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEj9xNSVsD8U1J8yQaOBqSGhN3lexiGJMOHPDNVvHWmwo2hH/plICw/3mpL5P7KTGqqeWts9DXkvE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmXmEztk0ZaXJmQsT+XixnshHNn2dRWIn55E+rmQGcNvzZ+zCG
 XPoP2Wy8l/9ZzsBA6D2hs9tNqQIaEMFzjgTDDv2n1soc2bXRN9lDSjmG
X-Gm-Gg: ASbGncvczX1oAqWCWhwq8CNjVNykFYrN60ox5s0hfPXcmWRAoFcAZiayLQoo5Tyga2s
 IdD4Qe+DAqSgzpq7x6ywXkeYSgKCUFuSh+eyNOTtJT/FwQEbv9S25A4L2g1MvLmk61Vlp5OrivF
 946XlPX/w+mw91p8IvAVPqCfMQJKgNe6RdSPD1n0Q6O66dJMOyEnuTVdmxeBSteMU0yJTsSsLTc
 TLtxKnTVNvEzSia9dNug2Op9KJAY33L13KzPCnIAevVsmJa9fZQrNsK0R/lcTxJ3idQWMT8xImZ
 5OHN4ivngP+rNFnbpLtpNC1UyAW2KDBnM3m+ToqmZJQEY4Y3IAPf3jxcK/rhQJJQj9GEB3o8iOZ
 V2Jx7lOSHu0FR6c+tySIdAUFaOhdm9/778u/8z8MEUQ==
X-Google-Smtp-Source: AGHT+IFJEtnee8hdoiK4Tw0t8nSenoTvWsb65RM93NINnRfX24oL8mVWKjS9LVhDM5/5SH+GxeshsA==
X-Received: by 2002:a05:6214:1946:b0:818:f4ef:da96 with SMTP id
 6a1803df08f44-879dc77bb37mr29478826d6.2.1759476766258; 
 Fri, 03 Oct 2025 00:32:46 -0700 (PDT)
Received: from arch-box ([2607:fea8:54de:2200::9c5c])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-878bb4469bcsm32889776d6.16.2025.10.03.00.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 00:32:45 -0700 (PDT)
From: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
To: Simona Vetter <simona@ffwll.ch>,
	Helge Deller <deller@gmx.de>
Cc: Albin Babu Varghese <albinbabuvarghese20@gmail.com>,
 syzbot+48b0652a95834717f190@syzkaller.appspotmail.com,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] fbdev: Add bounds checking in bit_putcs to fix
 vmalloc-out-of-bounds
Date: Fri,  3 Oct 2025 03:32:09 -0400
Message-ID: <20251003073210.48501-1-albinbabuvarghese20@gmail.com>
X-Mailer: git-send-email 2.51.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add bounds checking to prevent writes past framebuffer boundaries when
rendering text near screen edges. Return early if the Y position is off-screen
and clip image height to screen boundary. Break from the rendering loop if the
X position is off-screen. When clipping image width to fit the screen, update
the character count to match the clipped width to prevent buffer size
mismatches.

Without the character count update, bit_putcs_aligned and bit_putcs_unaligned
receive mismatched parameters where the buffer is allocated for the clipped
width but cnt reflects the original larger count, causing out-of-bounds writes.

Reported-by: syzbot+48b0652a95834717f190@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=48b0652a95834717f190  
Suggested-by: Helge Deller <deller@gmx.de>
Tested-by: syzbot+48b0652a95834717f190@syzkaller.appspotmail.com
Signed-off-by: Albin Babu Varghese <albinbabuvarghese20@gmail.com>
---
Changes in v2:
- Partially render when height exceeding screen boundaries instead of skipping 
- Update character count when width is clipped to prevent buffer mismatch

Link to v1: 
https://lore.kernel.org/all/20250927075010.119671-1-albinbabuvarghese20@gmail.com/
---
 drivers/video/fbdev/core/bitblit.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/video/fbdev/core/bitblit.c b/drivers/video/fbdev/core/bitblit.c
index f9475c14f733..116b4bf5e94c 100644
--- a/drivers/video/fbdev/core/bitblit.c
+++ b/drivers/video/fbdev/core/bitblit.c
@@ -160,6 +160,11 @@ static void bit_putcs(struct vc_data *vc, struct fb_info *info,
 	image.height = vc->vc_font.height;
 	image.depth = 1;
 
+	if (image.dy >= info->var.yres)
+		return;
+
+	image.height = min(image.height, info->var.yres - image.dy);
+
 	if (attribute) {
 		buf = kmalloc(cellsize, GFP_ATOMIC);
 		if (!buf)
@@ -173,6 +178,21 @@ static void bit_putcs(struct vc_data *vc, struct fb_info *info,
 			cnt = count;
 
 		image.width = vc->vc_font.width * cnt;
+
+		if (image.dx >= info->var.xres)
+			break;
+
+		if (image.dx + image.width > info->var.xres) {
+			image.width = info->var.xres - image.dx;
+
+			cnt = image.width / vc->vc_font.width;
+
+			if (cnt == 0)
+				break;
+
+			image.width = cnt * vc->vc_font.width;
+		}
+
 		pitch = DIV_ROUND_UP(image.width, 8) + scan_align;
 		pitch &= ~scan_align;
 		size = pitch * image.height + buf_align;
-- 
2.51.0

