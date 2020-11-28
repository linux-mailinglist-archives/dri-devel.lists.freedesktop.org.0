Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 319062C763D
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:42:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BFCD6ECF1;
	Sat, 28 Nov 2020 22:41:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0524D6ECEB
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:54 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id d20so12699241lfe.11
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4zXtp5JJ5kL9W0YA7a9u1oFQEkf6mUNDsE89w8XSjbA=;
 b=ceUf4brj/n0hkaGfOYFJBYiH9gMwfM6dVxGXtjLzBxWUBrKdOiBcNBiwjbk6I+CgJ3
 gI3ZS4XqlBZrmis/msFG4cYvku2FAl7iT+pZd7mTwUN+sAvY3OKBBRI8R9jT3nIJnz7G
 Y/FXeJA1VgtIpovJ8bC2XO8Vnlg0CPuD4ZM9l35PmOSYNB1bQXK9UEHN4L7N79HhrjOP
 rIKTYGJ55Bze+4fEzcwZgzXaNWenxz1Ag47/z9ITXQIM1e9Jzek+YaNUqrBh9XmKyPAV
 QgbY8AzXHQZKAokd0sXKMHIrdzNHIcCwnfAp7pKAiG0Qss+kun1A28cwelQfUQqbkl8O
 dwSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4zXtp5JJ5kL9W0YA7a9u1oFQEkf6mUNDsE89w8XSjbA=;
 b=bNEdwJ0MT6n1zfhVTgjOEmPUeM103HgdrhhUh461HxltKG6yr+1swygQ0YewCXXSn8
 GzhydzgOAt7hNrBjfgufoyCq33K1yzQeiPVwXTVXZWtOAj9CdQUJlzgNiR4ee4d8KOwN
 eg6BLC+WCTnjXbllhwkssgB6N+bv8ay+m7Yv0rXtxYgTEa1p5H7KDv4iCFeNyqCSRfMa
 aw9RpsWsWatu3RSjvZ+vRIE6Grwda8roO3lQ6Lt9K8tO39nwKWfvCyOIoj2S2FMZpHf9
 wKvVM64VpzaFv45maf8FOJnDUsWaJF/M+ZdCzaB5AdqHlkVrx9Gjhk3NVPV5J9BE5PJ6
 aSPg==
X-Gm-Message-State: AOAM532bTwTOXYjhDZdiSWx2f92DVXa1Drj1LRdNLQ15EG+rC2l+3F0y
 0yBKHfrF8fOH7kdW7ATdoMk=
X-Google-Smtp-Source: ABdhPJxss28jpDvSr/X/2726RDiBKWZyfMpYr3Grt4ZkKPwJPMW1Lii9D2KCP4lz4rLxgbgJM2IM8g==
X-Received: by 2002:a19:8001:: with SMTP id b1mr6321877lfd.353.1606603312476; 
 Sat, 28 Nov 2020 14:41:52 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:52 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 16/28] video: fbdev: hgafb: Fix kernel-doc warnings
Date: Sat, 28 Nov 2020 23:41:02 +0100
Message-Id: <20201128224114.1033617-17-sam@ravnborg.org>
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
 linux-nvidia@lists.surfsouth.com, Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
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

Fix kernel-doc comments.

v2:
  - Updated subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Ferenc Bakonyi <fero@drama.obuda.kando.hu>
Cc: linux-nvidia@lists.surfsouth.com
Cc: Lee Jones <lee.jones@linaro.org>
---
 drivers/video/fbdev/hgafb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/hgafb.c b/drivers/video/fbdev/hgafb.c
index a45fcff1461f..69af72937844 100644
--- a/drivers/video/fbdev/hgafb.c
+++ b/drivers/video/fbdev/hgafb.c
@@ -358,7 +358,7 @@ static int hga_card_detect(void)
 /**
  *	hgafb_open - open the framebuffer device
  *	@info:pointer to fb_info object containing info for current hga board
- *	@int:open by console system or userland.
+ *	@init:open by console system or userland.
  */
 
 static int hgafb_open(struct fb_info *info, int init)
@@ -372,7 +372,7 @@ static int hgafb_open(struct fb_info *info, int init)
 /**
  *	hgafb_open - open the framebuffer device
  *	@info:pointer to fb_info object containing info for current hga board
- *	@int:open by console system or userland.
+ *	@init:open by console system or userland.
  */
 
 static int hgafb_release(struct fb_info *info, int init)
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
