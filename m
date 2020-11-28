Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 187252C7634
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97DE66E0D2;
	Sat, 28 Nov 2020 22:41:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41C306E0D2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:30 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id r18so10598620ljc.2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LdDgNuGgErPdHu+TCAPas4kKOuFU9UdpBETdmvhEYm8=;
 b=cFk6UHh1GPx3ccPWrUSUTZuavAngx+GlFcO+u6qQ9SB9tnO1bmHZ7C3rX0xsm3mdPN
 CkYFdR4SCPcCFdQTFTqiuu7IHelMz//Ys4aoH5Jl08cTsrz24RaA+k/KIZOqq/Ve8L4L
 CX0VXRluAh22kjNDNjEEgukilQsoHa0wsmVMjPxFFdeMIJujLzBi/2AueavSTFZHf1qZ
 ezK2jT8IGOfaJ4ldPKBFxkV8scEqNN1jKwGoYvgpgMRAfcMsi1Tj2M7JVuIpxfPwKA/e
 /TwTI5P61P47P9uTBWyL3VVBm13QK/sfQePvUUE0z1v49r4H6WXdPCzHMWn5o8mJPgdK
 cdFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LdDgNuGgErPdHu+TCAPas4kKOuFU9UdpBETdmvhEYm8=;
 b=FVllwupISY27qyWV20gDHPsQ95tiD5kMUt4jXwFkDEUd4blrLXIx0dXLn/KcIOwjVT
 O/dDeGYurHhIy/JixkNpBaSTL7hMpLuMJDQBSzNdSSBvxamSCDgVOJtpIUY32zGhBFCu
 WWNHpHDfNJbyLcQOdO+oNkLEZ7P1T2KyedIgkUUzUIui9zLhF/qAwIlWAE/J+DDE5SfS
 CO8KJfmbxKgdVoYoWA6jNDq3tcrhU1n61sRxb98wTettEgMVG0iXgL56rHMUiDnKmVcF
 dPS8+BMCZ9GrXtRVauSmIptuWoAg64I7XCj6MAQ0AlVZj2EwxtqqHpwfs3k3cNJnAAbS
 WBGQ==
X-Gm-Message-State: AOAM5327vEPlC3eqtcKB76CAzPDHRoGzEf19xKdpakU7+uGmyyJYYOys
 95tUc1sdtR8JTiv60n7yxwvch95lXKR12A==
X-Google-Smtp-Source: ABdhPJwKqTgycGtvqKEd9497HZCekzPHQbsM9lUTpAxPO6FfM5xjyn3DOkE8grANkPTZdwdkHUHNIQ==
X-Received: by 2002:a2e:b4af:: with SMTP id q15mr3800772ljm.273.1606603288637; 
 Sat, 28 Nov 2020 14:41:28 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:28 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 03/28] video: fbdev: core: Fix kernel-doc warnings in fbmon
 + fb_notify
Date: Sat, 28 Nov 2020 23:40:49 +0100
Message-Id: <20201128224114.1033617-4-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201128224114.1033617-1-sam@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
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
Cc: Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Sam Ravnborg <sam@ravnborg.org>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Thomas Zimemrmann <tzimmermann@suse.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix kernel-doc warnings reported when using W=1

v2:
  - Improve subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: "Alexander A. Klimov" <grandmaster@al2klimov.de>
---
 drivers/video/fbdev/core/fb_notify.c | 3 ++-
 drivers/video/fbdev/core/fbmon.c     | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fb_notify.c b/drivers/video/fbdev/core/fb_notify.c
index 74c2da528884..d85717b6e14a 100644
--- a/drivers/video/fbdev/core/fb_notify.c
+++ b/drivers/video/fbdev/core/fb_notify.c
@@ -38,7 +38,8 @@ EXPORT_SYMBOL(fb_unregister_client);
 
 /**
  * fb_notifier_call_chain - notify clients of fb_events
- *
+ * @val: value passed to callback
+ * @v: pointer passed to callback
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
