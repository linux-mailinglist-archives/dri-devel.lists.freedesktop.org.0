Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5271B1F2D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 114A86E8C2;
	Tue, 21 Apr 2020 06:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35FF26E1E2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 18:19:43 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id t9so231208pjw.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 11:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=idNzN2pm7FEPN1n487Ax7LSZYU5+9Uhm24wE5AT9T4s=;
 b=Vd5D+k03lqQVldIAukk7ZSeEk3nNjGfLlRkJtZcPLZa1qUfbt3YNor+uzJPtjhDEdK
 siCEfcbX5/HSKmYiXqG/Dp0Z+kOqWn5OXn5OAls/y+r1Fh8h7HiQrhSig3OkH7/jBFNR
 X00tFwMEKdkCgynoNQ2UzSmdN8ShZotARmEbxM/brXav5nNLOLIXywDh17aaFbG6Fl2R
 dS7/NspoKF5bHe05Bp+zwCcaYv4YZHhCHIHd/2xJALdFt5fvQf8aMvDguHmzrgZ7edf7
 Ovi9Byyy9yXeTW13Qb8eM9Wxfha0gyXwnMoKrmelBbGjVwDZcZbxMvpZjAWm64MKU1c5
 +XQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=idNzN2pm7FEPN1n487Ax7LSZYU5+9Uhm24wE5AT9T4s=;
 b=ER14c6xBTZI6Mfd6/LJW6vbejfLJw3ZOiu8wFvlIobJMrbbk4vroGUG4Qf/c7pHf7N
 U9CK5yWtMKLmILs5wHd2E9xROGlbD9btar6XtIwWjjRacjvg/pwgE496coI+3Vf3ykkq
 apjAHatc+rRevuBYwmLcJb+yQRZYua3Ol+iu8doujrGUf7Wqn/V1JWZRk5j4JT233Vaj
 uzUvyjdLyN+9NFx/DIpruieIhhwEuaV1rqcpe7CgcB11HcT1CJtyIbYSBvxmeUTDUoqd
 oHjfcjvkvKuj2wfAiN116yewyE6OPndrixLfv2Y/Y0umaMlJE63NkEyX40azV82kXl0M
 7wJA==
X-Gm-Message-State: AGi0PuZbWstOj1PrSRWPiMs56gmuk71IK9/2NjPd2aMvmzrMYea4hXer
 BdfCg3h2bsHKxHMgGnF+MCM=
X-Google-Smtp-Source: APiQypIa5no58EAZMdGt72lHrrO+ZVAYnEQIiK1hn+NTjKtEri8J0x2+rKim+soaz3PrHXk1Fg2vPQ==
X-Received: by 2002:a17:90a:f0c6:: with SMTP id fa6mr783307pjb.5.1587406782749; 
 Mon, 20 Apr 2020 11:19:42 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([122.182.233.24])
 by smtp.gmail.com with ESMTPSA id x66sm146331pfb.173.2020.04.20.11.19.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 Apr 2020 11:19:42 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: adaplas@gmail.com,
	b.zolnierkie@samsung.com
Subject: [PATCH] video/fbdev/riva: Remove dead code
Date: Mon, 20 Apr 2020 23:57:24 +0530
Message-Id: <1587407244-32574-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Souptick Joarder <jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These are dead code since 3.15. These can be removed forever if no
plan to use it further.

Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
---
 drivers/video/fbdev/riva/riva_hw.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/video/fbdev/riva/riva_hw.c b/drivers/video/fbdev/riva/riva_hw.c
index 0601c13..08c9ee4 100644
--- a/drivers/video/fbdev/riva/riva_hw.c
+++ b/drivers/video/fbdev/riva/riva_hw.c
@@ -1343,24 +1343,6 @@ static char nv3_get_param(nv3_fifo_info *res_info, nv3_sim_state * state, nv3_ar
 /*
  * Load fixed function state and pre-calculated/stored state.
  */
-#if 0
-#define LOAD_FIXED_STATE(tbl,dev)                                       \
-    for (i = 0; i < sizeof(tbl##Table##dev)/8; i++)                 \
-        chip->dev[tbl##Table##dev[i][0]] = tbl##Table##dev[i][1]
-#define LOAD_FIXED_STATE_8BPP(tbl,dev)                                  \
-    for (i = 0; i < sizeof(tbl##Table##dev##_8BPP)/8; i++)            \
-        chip->dev[tbl##Table##dev##_8BPP[i][0]] = tbl##Table##dev##_8BPP[i][1]
-#define LOAD_FIXED_STATE_15BPP(tbl,dev)                                 \
-    for (i = 0; i < sizeof(tbl##Table##dev##_15BPP)/8; i++)           \
-        chip->dev[tbl##Table##dev##_15BPP[i][0]] = tbl##Table##dev##_15BPP[i][1]
-#define LOAD_FIXED_STATE_16BPP(tbl,dev)                                 \
-    for (i = 0; i < sizeof(tbl##Table##dev##_16BPP)/8; i++)           \
-        chip->dev[tbl##Table##dev##_16BPP[i][0]] = tbl##Table##dev##_16BPP[i][1]
-#define LOAD_FIXED_STATE_32BPP(tbl,dev)                                 \
-    for (i = 0; i < sizeof(tbl##Table##dev##_32BPP)/8; i++)           \
-        chip->dev[tbl##Table##dev##_32BPP[i][0]] = tbl##Table##dev##_32BPP[i][1]
-#endif
-
 #define LOAD_FIXED_STATE(tbl,dev)                                       \
     for (i = 0; i < sizeof(tbl##Table##dev)/8; i++)                 \
         NV_WR32(&chip->dev[tbl##Table##dev[i][0]], 0, tbl##Table##dev[i][1])
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
