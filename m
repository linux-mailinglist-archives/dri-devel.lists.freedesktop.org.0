Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D28E2D06B9
	for <lists+dri-devel@lfdr.de>; Sun,  6 Dec 2020 20:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E136E4CF;
	Sun,  6 Dec 2020 19:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6EA6E4CF
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Dec 2020 19:03:03 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id s30so14877189lfc.4
 for <dri-devel@lists.freedesktop.org>; Sun, 06 Dec 2020 11:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AWKed4odfdsIU5AGoPrFhmgmtEnPpwRuMDNnFb1mat8=;
 b=BD38NveQzbi0GZYDlRS4ddm+TOpNJuvzIK01AZxXT3QyMCEPJ4dI5vbixKjs17NbNB
 64eAdShaMM/tV24LtAnyv5OASJu+J6B5OKMKormP1iPZXTd5mQPycd9PKBAGNwtvQzEj
 P3tctVPAhd0gQAhLn533Y/KZQLpN+7LaC17r0O+xQJaFJ/0LpWlN8LX/X0CLAMgyP/44
 8N9p9sAgWvVTT57VjRJEbZJpIUBDWzVooUnWcJm3hrZKWKi8KHlAw/B+f5BOawWAHaYV
 0fBNuY9Wv1RalrCsxj/ueAjI1XFkmU2rTpLi517r2HfYn04yjxOoSDTu83YsvHeFXHjv
 EBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=AWKed4odfdsIU5AGoPrFhmgmtEnPpwRuMDNnFb1mat8=;
 b=S1RnKJyog+XmTH7UfQGhPU+0c6iVst/hxR2y/NxzEtgOnELu/5gGjmxxz3HL6dMxWZ
 8XVbE12KLE1gz1Hp950DMs80GnkXf3dwZlWTAL4UsJbn2NaSiURvVSqSGSiYRYwYJgJT
 1Z+XpTY4l6/JVQterSD/80dE5iVsDh/tq5T+g4jxd+v+wPC22+WAt1heVe47ppvQfO+c
 jXPpjcMZl+WjkLTeMzVdgmiytp3RWFwdOePI72Mtvv8Pnz8IrikcUVgRahKVESf9TNzr
 C49aCr9q+npNF7yEfwiBZdfK6ApezL1BA3j7IE5w7mDfkyM8taJwWEMUQeZpCBw6aVJ+
 9DJw==
X-Gm-Message-State: AOAM532stL+6f6ntDmXY6kqusR+RBTwQ4QrKsyIKWUbdHfEp7QTcPoT7
 gsAMMOFNYT0Mxsnz1k2hF8s=
X-Google-Smtp-Source: ABdhPJxMMFbAmqvduYmjI39HUAlAX90pPZ/380NwlD2kk4yJ4yuH78VuVYftT/yg8SyxScng+YNcqQ==
X-Received: by 2002:ac2:46ef:: with SMTP id q15mr6523183lfo.2.1607281381884;
 Sun, 06 Dec 2020 11:03:01 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:c1c3:bbc6:3ac5:732d])
 by smtp.gmail.com with ESMTPSA id
 v28sm2483865ljv.29.2020.12.06.11.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Dec 2020 11:03:01 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v3 02/13] video: fbdev: core: Fix kernel-doc warnings in fbmon
 + fb_notify
Date: Sun,  6 Dec 2020 20:02:36 +0100
Message-Id: <20201206190247.1861316-3-sam@ravnborg.org>
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

Fix kernel-doc warnings reported when using W=1

v2:
  - Improve subject (Lee)

v3:
  - Add RETURNS documentation (Thomas)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
---
 drivers/video/fbdev/core/fb_notify.c | 10 ++++++++++
 drivers/video/fbdev/core/fbmon.c     |  2 +-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fb_notify.c b/drivers/video/fbdev/core/fb_notify.c
index 74c2da528884..4e39c61fae1f 100644
--- a/drivers/video/fbdev/core/fb_notify.c
+++ b/drivers/video/fbdev/core/fb_notify.c
@@ -19,6 +19,9 @@ static BLOCKING_NOTIFIER_HEAD(fb_notifier_list);
 /**
  *	fb_register_client - register a client notifier
  *	@nb: notifier block to callback on events
+ *
+ *	RETURNS:
+ *	0 on success, negative error code on failure.
  */
 int fb_register_client(struct notifier_block *nb)
 {
@@ -29,6 +32,9 @@ EXPORT_SYMBOL(fb_register_client);
 /**
  *	fb_unregister_client - unregister a client notifier
  *	@nb: notifier block to callback on events
+ *
+ *	RETURNS:
+ *	0 on success, negative error code on failure.
  */
 int fb_unregister_client(struct notifier_block *nb)
 {
@@ -38,7 +44,11 @@ EXPORT_SYMBOL(fb_unregister_client);
 
 /**
  * fb_notifier_call_chain - notify clients of fb_events
+ * @val: value passed to callback
+ * @v: pointer passed to callback
  *
+ * RETURNS:
+ * The return value of the last notifier function
  */
 int fb_notifier_call_chain(unsigned long val, void *v)
 {
diff --git a/drivers/video/fbdev/core/fbmon.c b/drivers/video/fbdev/core/fbmon.c
index 1bf82dbc9e3c..b0e690f41025 100644
--- a/drivers/video/fbdev/core/fbmon.c
+++ b/drivers/video/fbdev/core/fbmon.c
@@ -605,6 +605,7 @@ static void get_detailed_timing(unsigned char *block,
  * fb_create_modedb - create video mode database
  * @edid: EDID data
  * @dbsize: database size
+ * @specs: monitor specifications, may be NULL
  *
  * RETURNS: struct fb_videomode, @dbsize contains length of database
  *
@@ -1100,7 +1101,6 @@ static u32 fb_get_hblank_by_hfreq(u32 hfreq, u32 xres)
  *                                    2 * M
  *        M = 300;
  *        C = 30;
-
  */
 static u32 fb_get_hblank_by_dclk(u32 dclk, u32 xres)
 {
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
