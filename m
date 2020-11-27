Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFB72C6C38
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 20:58:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C9F16F3AD;
	Fri, 27 Nov 2020 19:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9CD76F3AD
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 19:58:32 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id u18so8535077lfd.9
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 11:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GBucTroFP+M0Yy64eG6RzrvScB9IstEoTS95L4tQgXY=;
 b=W3dmwBXjuIPRH7fZg2XcDakW3tYopwPAkXNSUf0wmgR22IRn5UsZcUY8CzR6jI/yjo
 Nik/vdEMXu3yiWCFCI0nbdaS1RwG4U1MjpKBtEbWkgZ4iwUZIt1nzEkpiaCsEVlZdM3m
 R3ZGihrm6/pvVZqRR33bh5c6oCuYI6Exodu5oaAjZ86FpsbabRbFk0HHvQzr7QSIt/5Q
 cmGf2VI1o5SENT6BoE9mC4MNH0+WgUc3HrNmu0abqNAFIgnvCSTC4LAajxjoqqNytV+n
 pWTs80SwGCMs5eI67g3h/ybkdSM9dD06XfXdjCxQi1KPFXdgqXlayGM3WhJ8WLgPnMDd
 XXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=GBucTroFP+M0Yy64eG6RzrvScB9IstEoTS95L4tQgXY=;
 b=tCYK9VmkYkr85BaEibIyZBbxlym5HLaamv1OSNB+sVMpnAZFXm72NuGJctRUcFcPmd
 TGlf7duSIKx6FIKqk262Isz7xVAv5Yr+uJ0AA0EWCfqhpGLOBKNxWDVCVRTNMJQwO6LL
 d3b01I6cS3Awziv5OQIIQMzwElNHZKumXCjFZMAgyDAZxkhZY1kuvvOFCQZ07YpXaCI3
 XPJTvQlkDCzrR5UoC1gcwhR4H3dlILx/mLxHi7g+EkBbGjjQkilcfWQXZ+zg2NRow00k
 YGEk6nIs+wksiWjoDRP2dY/5mAjC5axTaN91ZHA1vfPs8s8MMo6MupQv4CzMvXzM1e/r
 ZdLw==
X-Gm-Message-State: AOAM531PvQVJDhrOE7ECGJPWnflcdJ80ndhrnw+fCtrBZxvaAHIiWG2m
 v2sYeE3crgiZKx4m85PKR44=
X-Google-Smtp-Source: ABdhPJylIAu0KLBIroXyb9tC6gYTQuiUvN1EGzZkoJWcx5F+Qm8SIjI4a/0nnL+xr//qgqf4s4x9Hg==
X-Received: by 2002:ac2:428d:: with SMTP id m13mr4080520lfh.137.1606507111125; 
 Fri, 27 Nov 2020 11:58:31 -0800 (PST)
Received: from saturn.localdomain ([2a00:fd00:8060:1c00:9d62:990:4557:451])
 by smtp.gmail.com with ESMTPSA id c6sm1070415ljj.140.2020.11.27.11.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 11:58:30 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>
Subject: [PATCH v1 0/28] drivers/video: W=1 warning fixes
Date: Fri, 27 Nov 2020 20:57:57 +0100
Message-Id: <20201127195825.858960-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.27.0
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
 Peter Rosin <peda@axentia.se>, Michal Januszewski <spock@gentoo.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-nvidia@lists.surfsouth.com, Jiri Slaby <jirislaby@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>,
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
 Gustavo Silva <gustavoars@kernel.org>,
 Ferenc Bakonyi <fero@drama.obuda.kando.hu>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peilin Ye <yepeilin.cs@gmail.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following the great work of Lee Jones in other subsystems
here is a set of patches that address all remaining W=1
warnings in drivers/video/.
Lee Jones already fixed all warnings in video/backlight/ so
this is mostly fbdev related fixes.

The general approach used were:
- Fix kernel-doc, this is often very trivial
- Drop unused local variables
- Use no_printk for local logging support

Build tested on a set of architectures with various configs.

The patches do not depends on each other and in most cases all
fixes for one driver is kept in a single patch.

The individual changes are trivial so this is a great
starter task to try to review these patches.

A timely Reviewed-by: or Acked-by: would be very nice so we can
get the warnings fixes before we cut for the merge window.

	Sam


Sam Ravnborg (28):
      video: Fix W=1 warnings in of_videomode + of_display_timing
      video: fbcon: Use pr_debug() in fbcon
      video: fbdev: core: Fix W=1 warnings in fbmon + fb_notify
      video: fbdev: aty: Delete unused variable in radeon_monitor
      video: fbdev: aty: Fix W=1 warnings in atyfb_base
      video: fbdev: aty: Fix W=1 warnings in mach64_ct
      video: fbdev: sis: Fix W=1 warnings about static symbols
      video: fbdev: sis: Fix W=1 warning about SiS_TVDelay
      video: fbdev: sis: Fix W=1 warnings in init.c
      video: fbdev: sis: Fix W=1 warnings in sis_main
      video: fbdev: via: Fix W=1 warnings
      video: fbdev: tdfx: Fix W=1 warnings
      video: fbdev: riva: Fix W=1 warnings
      video: fbdev: pm2fb: Fix W=1 warnings
      video: fbdev: neofb: Fix W=1 warnings
      video: fbdev: hgafb: Fix W=1 warnings
      video: fbdev: tgafb: Fix W=1 warnings
      video: fbdev: mx3fb: Fix W=1 warnings
      video: fbdev: sstfb: Fix W=1 warnings
      video: fbdev: nvidia: Fix W=1 warnings
      video: fbdev: tmiofb: Fix W=1 warnings
      video: fbdev: omapfb: Fix W=1 warnings in dsi
      video: fbdev: omapfb: Fix W=1 warnings in hdmi*_core
      video: fbdev: s3c-fb: Fix W=1 warnings
      video: fbdev: uvesafb: Fix W=1 warning
      video: fbdev: uvesafb: Fix W=1 string related warnings
      video: fbdev: cirrusfb: Fix W=1 warnings
      video: fbdev: s1d13xxxfb: Fix W=1 warnings

 drivers/video/fbdev/aty/atyfb_base.c              | 12 ++------
 drivers/video/fbdev/aty/mach64_ct.c               | 15 ++++++----
 drivers/video/fbdev/aty/radeon_monitor.c          |  4 +--
 drivers/video/fbdev/cirrusfb.c                    | 20 ++++++-------
 drivers/video/fbdev/core/fb_notify.c              |  3 +-
 drivers/video/fbdev/core/fbcon.c                  | 20 ++++---------
 drivers/video/fbdev/core/fbmon.c                  |  2 +-
 drivers/video/fbdev/hgafb.c                       |  4 +--
 drivers/video/fbdev/mx3fb.c                       | 13 +++++----
 drivers/video/fbdev/neofb.c                       |  4 ---
 drivers/video/fbdev/nvidia/nv_setup.c             |  7 ++---
 drivers/video/fbdev/omap2/omapfb/dss/dsi.c        | 12 ++------
 drivers/video/fbdev/omap2/omapfb/dss/hdmi4_core.c |  4 +--
 drivers/video/fbdev/omap2/omapfb/dss/hdmi5_core.c |  4 +--
 drivers/video/fbdev/pm2fb.c                       |  8 +++---
 drivers/video/fbdev/riva/fbdev.c                  |  9 +++---
 drivers/video/fbdev/riva/riva_hw.c                | 28 ++++++-------------
 drivers/video/fbdev/s1d13xxxfb.c                  |  3 +-
 drivers/video/fbdev/s3c-fb.c                      | 11 ++++----
 drivers/video/fbdev/sis/init.c                    | 34 ++++-------------------
 drivers/video/fbdev/sis/oem310.h                  |  2 ++
 drivers/video/fbdev/sis/sis.h                     |  1 -
 drivers/video/fbdev/sis/sis_main.c                |  9 +++---
 drivers/video/fbdev/sstfb.c                       |  2 +-
 drivers/video/fbdev/tdfxfb.c                      |  4 +--
 drivers/video/fbdev/tgafb.c                       |  7 ++---
 drivers/video/fbdev/tmiofb.c                      |  6 ++--
 drivers/video/fbdev/uvesafb.c                     |  8 +++---
 drivers/video/fbdev/via/lcd.c                     |  4 +--
 drivers/video/of_display_timing.c                 |  1 +
 drivers/video/of_videomode.c                      |  8 +++---
 include/video/sstfb.h                             |  4 +--
 32 files changed, 104 insertions(+), 169 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
