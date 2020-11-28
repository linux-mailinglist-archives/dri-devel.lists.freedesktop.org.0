Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49E682C7633
	for <lists+dri-devel@lfdr.de>; Sat, 28 Nov 2020 23:41:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7506E0D6;
	Sat, 28 Nov 2020 22:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A486E0D2
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 22:41:26 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id z1so10597130ljn.4
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Nov 2020 14:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gw87Y4IiQJRQFmGErQUGgzYt7CqBei5ZQnPlbru6PWM=;
 b=D1FrkInrUH9DKh9fBfCgXd8dBK46ZCmcALKbGOKNCiK+J9hf4uOuz98FBOxfEXnucr
 +yylo65m4rrV2di8RnAgj5Y3xtMIVWmwHK0r4kWr8QqQyyYycl969jJnWwZQSs5JHn3U
 wpJ+39OsTa2yXN2ZFeLVX1D1iZKKh7eXpE4Qebgnf6Q2PCSKV36TTz10/Q/Qo9cct1YC
 3DCHIYsu0/XEo74ZCp7ArxmjnsfRRPkh6RJl0kWdqHF7Ynq6yBnXnACAnjLVH1Lyp8zr
 niO+HMd0wJ2ntb9UDdh1rVKc91e//OPtykv5hCMzix3yLvonvcYyhjdjznACbj+w1bDE
 x8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=gw87Y4IiQJRQFmGErQUGgzYt7CqBei5ZQnPlbru6PWM=;
 b=PD2pSkQ5vk5cIIE5upSq3hVE5W9cisUN/UyN6J9zrs/syT67TQg9G97VujUlG9m2Ok
 kmrKf1C//BXM5/ImjTDhoxywV+30o22FPhh77N02ryErl19QmUThPpe5wrb0Gr9ARtMy
 wmRdqjqq7+VZxu0xioLLXPbdC5+yICtrYFP/LYVnsIIntuLhLlpwXYPf+3uUGo8rr39o
 cFfGAXwDbPLzp4IE0x2dzjPoZS1W/M6W87ZWunudwLcyOpmMebWntNV7mUKjMFFYzose
 xMR+2WKiKSd21ZWZ60RhmNNUudzmkCMfnLci+/v3U0YJut2Sit7368HNZ/72pf/M+nqK
 kb+A==
X-Gm-Message-State: AOAM533k8eX4kzTTjdyld16ahhCetYqXA3mcCdgxvN7bi/bYcFc4DQlx
 sw8Sj4RZlDLJLyVCv+F8tiE=
X-Google-Smtp-Source: ABdhPJwHtAja16Il25CYWJK9GBsVfOJBjtSMVre8TMUl/j8LWRHFKxCZY9K1/6bDzlvVdCzO3dScqw==
X-Received: by 2002:a2e:6e06:: with SMTP id j6mr6627173ljc.282.1606603284768; 
 Sat, 28 Nov 2020 14:41:24 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:a4c7:9ff9:a160:aad0])
 by smtp.gmail.com with ESMTPSA id
 w21sm1236857lff.280.2020.11.28.14.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 14:41:24 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v2 01/28] video: Fix kernel-doc warnings in of_display_timing
 + of_videomode
Date: Sat, 28 Nov 2020 23:40:47 +0100
Message-Id: <20201128224114.1033617-2-sam@ravnborg.org>
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

Fix kernel-doc warnings reported when using W=1.

v2:
  - Improve subject (Lee)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: linux-fbdev@vger.kernel.org
---
 drivers/video/of_display_timing.c | 1 +
 drivers/video/of_videomode.c      | 8 ++++----
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/video/of_display_timing.c b/drivers/video/of_display_timing.c
index abc9ada798ee..f93b6abbe258 100644
--- a/drivers/video/of_display_timing.c
+++ b/drivers/video/of_display_timing.c
@@ -52,6 +52,7 @@ static int parse_timing_property(const struct device_node *np, const char *name,
 /**
  * of_parse_display_timing - parse display_timing entry from device_node
  * @np: device_node with the properties
+ * @dt: display_timing that contains the result. I may be partially written in case of errors
  **/
 static int of_parse_display_timing(const struct device_node *np,
 		struct display_timing *dt)
diff --git a/drivers/video/of_videomode.c b/drivers/video/of_videomode.c
index 67aff2421c29..a5bb02f02b44 100644
--- a/drivers/video/of_videomode.c
+++ b/drivers/video/of_videomode.c
@@ -13,10 +13,10 @@
 #include <video/videomode.h>
 
 /**
- * of_get_videomode - get the videomode #<index> from devicetree
- * @np - devicenode with the display_timings
- * @vm - set to return value
- * @index - index into list of display_timings
+ * of_get_videomode: get the videomode #<index> from devicetree
+ * @np: devicenode with the display_timings
+ * @vm: set to return value
+ * @index: index into list of display_timings
  *	    (Set this to OF_USE_NATIVE_MODE to use whatever mode is
  *	     specified as native mode in the DT.)
  *
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
