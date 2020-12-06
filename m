Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA2D2D06BE
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 20:03:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFCB56E4EA;
	Sun,  6 Dec 2020 19:03:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041E36E4DD
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 19:03:10 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id f11so789465ljn.2
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 11:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A4gGS7Km1zSYBw+OXt/rDintJ7WruXibpnRy/u4JXrI=;
 b=fBHDvYnIKyIRCluPZ7LsGvsmKUja4Il5k9Lf5O94usbRxBlR9tUbQ/bj7xs4Y55UDC
 PvZeuekZWwvbTIMp7AawS+pSAp+ZlvIcgscgg/WgcNch+3jmT4atQ1sTtGh6eV//VdQB
 ziLw++ePlEDVRPd8H0hEwR7irC/O2fqf7kXXXWFZvuuQnY2bzSnOaVyUfNwpUyOj8Iqm
 nJ8z2q2Zuhmvpjd6gL6oWRhwHsGqYN87Ci/JK4r1qXZ+TSl8JyNdJhiZWkeMLxKzGFla
 OtxWhtPzX1VbXj5zHIYjAkGYtm6WPHDpzB7BWdPo73FcGGw52BdocCqVRBON+ZHBAwhM
 PDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A4gGS7Km1zSYBw+OXt/rDintJ7WruXibpnRy/u4JXrI=;
 b=Q4NxTfruabyTKy0TdHb5ql50eDDpsjqdM/PrIIypl9xViy46v5ZRJdLm9rdtoGqZ/K
 NzABDIzxHj/7VEZT0JT7DZ6us0y+kXcFyNOY3jBj751QqyxEilFz8n0W0nXbjIxihmKB
 FmodEFCxmOxxuTMEEMuvPNY/m6+kB0Mmij7JWo9yK1PB7wWApzXPiZNt8VV6i33FXE5T
 UHvRkH+zRid0d+LBIZx7euz2HgezTAqstAzSYrtwOeg/0ibDdSy6jFYlN0DkT7KNse1u
 9hOLQbdK/Jfnt1CgxU4PN9cMtjN+UdF1EtLqJqrrIkXpyspd5Wsmhg3HcJh5vpwEPG2S
 Dziw==
X-Gm-Message-State: AOAM5339GR6Z+aPak+yFQ1RV6l2899zm7G/G7CK7mwLX5oNw4Ymhd0t2
 FAudILhfsBPNe3DY0nLE66s=
X-Google-Smtp-Source: ABdhPJwCMgEC3zvaWm+zhlV8Koc6bx4J+FYHGrzJzPNlmyIbiTwpIPLsURBYMA9deDpFJaDtgElnrw==
X-Received: by 2002:a2e:9710:: with SMTP id r16mr6994169lji.462.1607281388344; 
 Sun, 06 Dec 2020 11:03:08 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:c1c3:bbc6:3ac5:732d])
 by smtp.gmail.com with ESMTPSA id
 v28sm2483865ljv.29.2020.12.06.11.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 11:03:07 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 06/13] video: fbdev: sparc drivers: fix kernel-doc warnings
 for blank_mode
Date: Sun,  6 Dec 2020 20:02:40 +0100
Message-Id: <20201206190247.1861316-7-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201206190247.1861316-1-sam@ravnborg.org>
References: <20201206190247.1861316-1-sam@ravnborg.org>
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
Cc: Rich Felker <dalias@libc.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Peter Zijlstra <peterz@infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Gustavo A R Silva <gustavoars@kernel.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Peter Jones <pjones@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Ellerman <mpe@ellerman.id.au>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 linux-arm-kernel@lists.infradead.org, Qilong Zhang <zhangqilong3@huawei.com>,
 Randy Dunlap <rdunlap@infradead.org>, Douglas Anderson <dianders@chromium.org>,
 Tony Prisk <linux@prisktech.co.nz>, Thierry Reding <thierry.reding@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Colin Ian King <colin.king@canonical.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix kernel-doc warnings caused by a wrong parameter name
blank_mode => blank

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/video/fbdev/bw2.c   | 2 +-
 drivers/video/fbdev/cg3.c   | 2 +-
 drivers/video/fbdev/cg6.c   | 2 +-
 drivers/video/fbdev/ffb.c   | 2 +-
 drivers/video/fbdev/leo.c   | 2 +-
 drivers/video/fbdev/p9100.c | 2 +-
 drivers/video/fbdev/tcx.c   | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/bw2.c b/drivers/video/fbdev/bw2.c
index 0d9a6bb57a09..e7702fe1fe7d 100644
--- a/drivers/video/fbdev/bw2.c
+++ b/drivers/video/fbdev/bw2.c
@@ -116,7 +116,7 @@ struct bw2_par {
 
 /**
  *      bw2_blank - Optional function.  Blanks the display.
- *      @blank_mode: the blank mode we want.
+ *      @blank: the blank mode we want.
  *      @info: frame buffer structure that represents a single frame buffer
  */
 static int
diff --git a/drivers/video/fbdev/cg3.c b/drivers/video/fbdev/cg3.c
index 77f6470ce665..bdcc3f6ab666 100644
--- a/drivers/video/fbdev/cg3.c
+++ b/drivers/video/fbdev/cg3.c
@@ -179,7 +179,7 @@ static int cg3_setcolreg(unsigned regno,
 
 /**
  *      cg3_blank - Optional function.  Blanks the display.
- *      @blank_mode: the blank mode we want.
+ *      @blank: the blank mode we want.
  *      @info: frame buffer structure that represents a single frame buffer
  */
 static int cg3_blank(int blank, struct fb_info *info)
diff --git a/drivers/video/fbdev/cg6.c b/drivers/video/fbdev/cg6.c
index a1c68cd48d7e..97ef43c25974 100644
--- a/drivers/video/fbdev/cg6.c
+++ b/drivers/video/fbdev/cg6.c
@@ -511,7 +511,7 @@ static int cg6_setcolreg(unsigned regno,
 /**
  *	cg6_blank - Blanks the display.
  *
- *	@blank_mode: the blank mode we want.
+ *	@blank: the blank mode we want.
  *	@info: frame buffer structure that represents a single frame buffer
  */
 static int cg6_blank(int blank, struct fb_info *info)
diff --git a/drivers/video/fbdev/ffb.c b/drivers/video/fbdev/ffb.c
index 948b73184433..b3d580e57221 100644
--- a/drivers/video/fbdev/ffb.c
+++ b/drivers/video/fbdev/ffb.c
@@ -667,7 +667,7 @@ static int ffb_setcolreg(unsigned regno,
 
 /**
  *	ffb_blank - Optional function.  Blanks the display.
- *	@blank_mode: the blank mode we want.
+ *	@blank: the blank mode we want.
  *	@info: frame buffer structure that represents a single frame buffer
  */
 static int ffb_blank(int blank, struct fb_info *info)
diff --git a/drivers/video/fbdev/leo.c b/drivers/video/fbdev/leo.c
index 40b11cce0ad6..3eb0f3583f4f 100644
--- a/drivers/video/fbdev/leo.c
+++ b/drivers/video/fbdev/leo.c
@@ -308,7 +308,7 @@ static int leo_setcolreg(unsigned regno,
 
 /**
  *      leo_blank - Optional function.  Blanks the display.
- *      @blank_mode: the blank mode we want.
+ *      @blank: the blank mode we want.
  *      @info: frame buffer structure that represents a single frame buffer
  */
 static int leo_blank(int blank, struct fb_info *info)
diff --git a/drivers/video/fbdev/p9100.c b/drivers/video/fbdev/p9100.c
index 6da672e92643..4e88a0a195ad 100644
--- a/drivers/video/fbdev/p9100.c
+++ b/drivers/video/fbdev/p9100.c
@@ -175,7 +175,7 @@ static int p9100_setcolreg(unsigned regno,
 
 /**
  *      p9100_blank - Optional function.  Blanks the display.
- *      @blank_mode: the blank mode we want.
+ *      @blank: the blank mode we want.
  *      @info: frame buffer structure that represents a single frame buffer
  */
 static int
diff --git a/drivers/video/fbdev/tcx.c b/drivers/video/fbdev/tcx.c
index 34b2e5b6e84a..1638a40fed22 100644
--- a/drivers/video/fbdev/tcx.c
+++ b/drivers/video/fbdev/tcx.c
@@ -196,7 +196,7 @@ static int tcx_setcolreg(unsigned regno,
 
 /**
  *      tcx_blank - Optional function.  Blanks the display.
- *      @blank_mode: the blank mode we want.
+ *      @blank: the blank mode we want.
  *      @info: frame buffer structure that represents a single frame buffer
  */
 static int
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
