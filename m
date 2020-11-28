Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3701B2C7653
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:42:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF7BC6ED12;
	Sat, 28 Nov 2020 22:42:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE3D6ECFB
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:42:16 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id r24so12738886lfm.8
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:42:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/wOYQm62UhJJiBuQwa5K2rYcXYPHs0L5tvvEbAmKSNM=;
 b=NZOYx0PXz29EI6oUGn7poLQOl3WKi1JE7XojDK9qkRt1BU3tYpqof835ajOsE3bAQz
 +N1wIFEeoMctj3+aSVd02EbL/iO5MbQVuFj2whjZCstGYrBcODFncMIVBgimHZ+3a5PL
 gVh6gU41uaM1BwqVOtKHmHqGlPGOQ4X7P1PPOgKr9hpd18xx2UTiyqDaCWiKF7JkhI60
 ce3lz2iYacfvWKV7RE3bylfc1eqtTkqO4UaaaJ0zedIeRGJxwA/8gGcBcCGT4qnx8cMp
 +qPPnntEcXBIsCrEs9J+ef8eLoYGcx9H2iK6p130Rw4ddHLBj1kB0XC70pVLiYc1F2sp
 hqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/wOYQm62UhJJiBuQwa5K2rYcXYPHs0L5tvvEbAmKSNM=;
 b=ZgI6FG+h7RzPuikP8Ug+ze/YE4ufiFsydOUSFLwm/yRh+Cve3eEEA1/0Or1jDlQtFA
 ISaV69djnmypOx1Yprrzp9yEl6yNMh0+uw8avy9XNmuvyzY9verOrf1ZkjR532qp4+go
 +eld4vJWcTtFhOScckgi1IgwKhDRYS6eI0s5Pl5WhrRzeF+ct9Y6d0xVSe7E2YkePjEx
 J/6foigkylrh2r/6Kch4zt1QM+pMXDGql/BS3zHr0Vp9+knZNHSOv7hYw8NDc7w5ItsK
 R4WKtl5TYcM5A6baWxyTYC0/ue+QZ3DpeSz1m9IuQ003wO1Zdt8gPwTa3OT5UjVZW4Eb
 6WYA==
X-Gm-Message-State: AOAM530PPpxXD0kCWcHO0uSfbaakrjH0UZ7AbgatkeAuzc+1kj01F4q7
 J24bxeV6n2W9mkZms6+Xd4o=
X-Google-Smtp-Source: ABdhPJwgu41H0h4BWPxtxzUlLXhRkkdQIo57ciP/l1l7Li+YJUMCKjT0gBiawsB+TaPikmiXCZpNPg==
X-Received: by 2002:a19:4915:: with SMTP id w21mr6485130lfa.57.1606603335224; 
 Sat, 28 Nov 2020 14:42:15 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:42:14 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 28/28] video: fbdev: s1d13xxxfb: Fix kernel-doc and set but
 not used warnings
Date: Sat, 28 Nov 2020 23:41:14 +0100
Message-Id: <20201128224114.1033617-29-sam@ravnborg.org>
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

Fix following W=1 warnings:
- Fix set but not nused variables which was used only for logging.
  Fixed by introducing no_printk() to trick compiler to think variables
  are used
- Fix kernel-doc warning by deleting an empty comment line

v2:
  - Subject updated (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Kristoffer Ericson <kristoffer.ericson@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/s1d13xxxfb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/s1d13xxxfb.c b/drivers/video/fbdev/s1d13xxxfb.c
index 4541afcf9386..d1b5f965bc96 100644
--- a/drivers/video/fbdev/s1d13xxxfb.c
+++ b/drivers/video/fbdev/s1d13xxxfb.c
@@ -45,7 +45,7 @@
 #if 0
 #define dbg(fmt, args...) do { printk(KERN_INFO fmt, ## args); } while(0)
 #else
-#define dbg(fmt, args...) do { } while (0)
+#define dbg(fmt, args...) do { no_printk(KERN_INFO fmt, ## args); } while (0)
 #endif
 
 /*
@@ -512,7 +512,6 @@ s1d13xxxfb_bitblt_copyarea(struct fb_info *info, const struct fb_copyarea *area)
 }
 
 /**
- *
  *	s1d13xxxfb_bitblt_solidfill - accelerated solidfill function
  *	@info : framebuffer structure
  *	@rect : fb_fillrect structure
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
