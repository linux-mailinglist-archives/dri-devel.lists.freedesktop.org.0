Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A032B17DA76
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 09:14:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB13A6E393;
	Mon,  9 Mar 2020 08:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70B66E2B1
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Mar 2020 16:15:41 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id t14so2983940plr.8
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Mar 2020 09:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mB33uY4rpAjyvPcNyW456rPgW48eDA92Qq5A/3kYxEM=;
 b=SVicQEdcrvyOZ8trd9mYx0GzOE+2G/ZZ1muWgECXN1TOSe+h11yWlvpkREF7sVGhEU
 PGNtFJyUZz8NWi+39aSW1wUvEWrMHUZGT26qDc9Gl9djIAi6l6v+xxdi8SPQwwNgzGBd
 Ln361AHnczSu9egRJWP1o5mJUvK7LAGEI7wqkj39gwH0CWaEnReExENXKkWku/ahG/pv
 BkHEAtvYpemNcfbgN/4ACPxR5BCAHi4yZXaTYpz8TV+r++irr+dvoPe3YuGXvfZVnRLA
 UZzKiHz2WcmyXTt3yhPdnU6BxXTNwLBvGHSzT/gI8e9r9mma9hkb2W6zdCSYFHkMwKTG
 C8Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mB33uY4rpAjyvPcNyW456rPgW48eDA92Qq5A/3kYxEM=;
 b=V/OvBfCRJsfg383a6xHuVypbUnA8YcRHinDK6kyzKEbTwKyajHVP598iMFGTlwnFBY
 uv3DkEDVlHSmZWXRgjaYnLK9fR0xcIfK8jV6IARpHFBtKuRO+QFrF09zh3b76Ji5apE/
 PAal2qb4J/h3ZTyXXXQa2lnt3y1YpRflCCw75Ymo1P7IPJt2/ZzPJvVe9sYxKWgOL4EL
 Rc3PccEJhfsx+VCjk+LYwDKCsB7Suaf7bdBYlaheEirb9rkKcVBbR1YMGtNwB4gJgTWA
 dsOciaVjl5aH7XZH4nTI6eP9rOoesO8L+aAErrltgEIWLjYmRlnlwa5y1tjUceh1PpqT
 UxFw==
X-Gm-Message-State: ANhLgQ3yP1GUGLV9zc1H3JnJzGERolwfEh1xdb99M9NktRyS/qERGUza
 0AnNCzJ9lF6vsSZInM+7YC4=
X-Google-Smtp-Source: ADFU+vs4X6A1zOz06Jfws1kCSRrOlGtjYoQBgUrQ4WIiVrqA/mEmhONOGDgoP0b/6tne0wmfwb+DBQ==
X-Received: by 2002:a17:902:b40f:: with SMTP id
 x15mr12671133plr.82.1583684141499; 
 Sun, 08 Mar 2020 09:15:41 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d809:ff26:710d:11f6:d704:3300])
 by smtp.gmail.com with ESMTPSA id k3sm41161366pgh.34.2020.03.08.09.15.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Sun, 08 Mar 2020 09:15:41 -0700 (PDT)
From: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>, Noralf Tronnes <noralf@tronnes.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/tiny: fix sparse warning: incorrect type in assignment
 (different base types)
Date: Sun,  8 Mar 2020 21:44:44 +0530
Message-Id: <1583684084-4694-1-git-send-email-kamlesh.gurudasani@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 09 Mar 2020 08:13:37 +0000
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
Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 dri-devel@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This fixes the following sparse warning:

drivers/gpu/drm/tiny/ili9486.c:61:16: sparse: sparse: incorrect type in assignment (different base types)
drivers/gpu/drm/tiny/ili9486.c:61:16: sparse:    expected unsigned short [usertype]
drivers/gpu/drm/tiny/ili9486.c:61:16: sparse:    got restricted __be16 [usertype]
drivers/gpu/drm/tiny/ili9486.c:71:32: sparse: sparse: incorrect type in assignment (different base types)
drivers/gpu/drm/tiny/ili9486.c:71:32: sparse:    expected unsigned short [usertype]
drivers/gpu/drm/tiny/ili9486.c:71:32: sparse:    got restricted __be16 [usertype]

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
---
 drivers/gpu/drm/tiny/ili9486.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index 5084b38..532560ae 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -45,7 +45,7 @@ static int waveshare_command(struct mipi_dbi *mipi, u8 *cmd, u8 *par,
 	void *data = par;
 	u32 speed_hz;
 	int i, ret;
-	u16 *buf;
+	__be16 *buf;
 
 	buf = kmalloc(32 * sizeof(u16), GFP_KERNEL);
 	if (!buf)
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
