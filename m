Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA4A1D3C11
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 21:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C12DB6EBA7;
	Thu, 14 May 2020 19:10:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFAE66EBA7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 19:10:16 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c21so3601688lfb.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IAfqMKSnJtIb4fNmt4augkqWT66BiC7XJZ5A9JCXvs4=;
 b=oxsBeLSdgQOS6MRl095JBSHOAfKwHeO7wwuftnEBEhzfK068erkSPeqPTGh/e6j7pL
 e7kwmhg6rWrKVGNIx7gCl7N2XRfDeS4JKiN4NcE+9Cox1nZsGA8OvFb2Gz4/i/nlTWhz
 F/ctVjBKAVfj7F6KpOJMMHUxebl9awYK86pHTqnCY7ZDX7NwAPPFcJbsultH8r7Syn4v
 Lg02v2d6sH3DsXSCLZKHzli0OSHOtwgI4XpBplkYUkgZ6fhg3wQ+WOwG4kun1t1iq/9B
 actUfLcY/fr8Gww3Jf9xCMfOTuAB7nOuebu7k2xkGWsIg2VJTTRqjoP/EHj/iNy/vqXi
 xw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=IAfqMKSnJtIb4fNmt4augkqWT66BiC7XJZ5A9JCXvs4=;
 b=tQ3o78JxQlHDcIt4Om26ek0t4YKtKElhQCiKVWCx3/TXF3L1Ii6dWEZ/f00dVX9z+N
 FW+S7ly1AevbSqtKedV3BHZVMzAr/1mhbEUcMoPM6jYoq8yxiBcZ8pKjV1XH7+1KhHS6
 5FtH021b6zKor6ztiScB/kbfHrVuRi67euLN17j/CJKr3VQ+ntNxY0KkZRosXjr01IMy
 96eTWpHcEtVogOP45lCUxSE1h0ZDEMe0WHBnZd40Knkmm3bOFbua3UZU2DJNcVf/Vps4
 BoeQz15sbNdf762uoo6x9nc8wZCNC2yv60EGIQBIbdLmshk4NYTqSLa7/5eXYEAUlPDL
 4qLQ==
X-Gm-Message-State: AOAM53086B7gIeEV+tTNQ6PfQ3XcHH0qkACIl/Gl9EdyiAuByiPcLiWX
 Yemqt1wOIo345kLAtwSUeestMH7TVqo=
X-Google-Smtp-Source: ABdhPJyPKXZJER042IijHbVEeNT5dPMCnTzHjzehTNfpBkMkXytgSCvIlTYGGbO/DbW3EzrMjPvisg==
X-Received: by 2002:ac2:5496:: with SMTP id t22mr4364239lfk.0.1589483414392;
 Thu, 14 May 2020 12:10:14 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:8d23:71d:e677:1c7c])
 by smtp.gmail.com with ESMTPSA id q30sm2362958lfd.32.2020.05.14.12.10.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 12:10:13 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v1 0/18] backlight updates
Date: Thu, 14 May 2020 21:09:43 +0200
Message-Id: <20200514191001.457441-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jonathan Corbet <corbet@lwn.net>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Russell King <linux@armlinux.org.uk>,
 Andy Gross <agross@kernel.org>,
 Uwe Kleine Konig <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, linux-arm-msm@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>,
 Support Opensource <support.opensource@diasemi.com>,
 patches@opensource.cirrus.com, Douglas Anderson <dianders@chromium.org>,
 Zheng Bin <zhengbin13@huawei.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The following series touches a lot of backlight things.

It starts by migrating users of of_find_backlight_by_node()
over to devm_of_find_backlight() to simplify code and to
use the preferred way to register backlight.

All the functions in the backlight core that is no longer
used by any drivers are then marked static to avoid
adding new users.

Then a new helper backlight_is_blank() is added.
This helper will simplify the implementation of update_status()
in almost all backlight drivers.

While surfing the code I really missed some documentation.
So I got a bit carried away and updated the documentation
for the backlight core and added it to kernel-doc.
The documentation express my current understanding.
Everything from spelling errors to outright wrong content
shall be anticipated - so please review!
We are all best helped if the documentation is correct
and up-to-date and it is readable.

In this process I identified that the backlight_bl driver
was no longer is use - so drop it.

The last patch is for now just an RFC patch that shows
the potential simplifications by introducing the
use of the backlight_is_blank() helper.
I may split it up later.

I have local patches to introduce backlight_is_blank()
in the remaining backlight drivers.
But they will await that this patch set matures a bit.

Everything builds, but so far no run-time testing.

	Sam

Sam Ravnborg (18):
      drm/omap: display: use devm_of_find_backlight
      drm/tilcdc: use devm_of_find_backlight
      video: amba-clcd: use devm_of_find_backlight
      backlight: make of_find_backlight static
      backlight: drop backlight_put()
      backlight: make of_find_backlight_by_node() static
      backlight: refactor fb_notifier_callback()
      backlight: add backlight_is_blank()
      backlight: improve backlight_ops documentation
      backlight: improve backlight_properties documentation
      backlight: improve backlight_device documentation
      backlight: document inline functions in backlight.h
      backlight: document enums in backlight.h
      backlight: remove the unused backlight_bl driver
      backlight: drop extern from prototypes
      backlight: add overview and update doc
      backlight: wire up kernel-doc documentation
      backlight: use backlight_is_blank() in all backlight drivers

 Documentation/gpu/backlight.rst                 |  12 +
 Documentation/gpu/index.rst                     |   1 +
 drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c |  18 +-
 drivers/gpu/drm/tilcdc/tilcdc_panel.c           |  17 +-
 drivers/video/backlight/88pm860x_bl.c           |   8 +-
 drivers/video/backlight/Kconfig                 |   8 -
 drivers/video/backlight/Makefile                |   1 -
 drivers/video/backlight/adp5520_bl.c            |   5 +-
 drivers/video/backlight/adp8860_bl.c            |   5 +-
 drivers/video/backlight/adp8870_bl.c            |   5 +-
 drivers/video/backlight/as3711_bl.c             |   8 +-
 drivers/video/backlight/backlight.c             | 237 ++++++++------
 drivers/video/backlight/bd6107.c                |   4 +-
 drivers/video/backlight/corgi_lcd.c             |   5 +-
 drivers/video/backlight/cr_bllcd.c              |  22 +-
 drivers/video/backlight/da903x_bl.c             |   8 +-
 drivers/video/backlight/ep93xx_bl.c             |   3 +-
 drivers/video/backlight/generic_bl.c            | 110 -------
 drivers/video/backlight/gpio_backlight.c        |   4 +-
 drivers/video/backlight/hp680_bl.c              |   4 +-
 drivers/video/backlight/jornada720_bl.c         |   2 +-
 drivers/video/backlight/kb3886_bl.c             |   4 +-
 drivers/video/backlight/led_bl.c                |   4 +-
 drivers/video/backlight/lm3533_bl.c             |   4 +-
 drivers/video/backlight/locomolcd.c             |   4 +-
 drivers/video/backlight/lv5207lp.c              |   4 +-
 drivers/video/backlight/max8925_bl.c            |   8 +-
 drivers/video/backlight/pwm_bl.c                |   4 +-
 drivers/video/backlight/qcom-wled.c             |   4 +-
 drivers/video/backlight/tps65217_bl.c           |   4 +-
 drivers/video/backlight/wm831x_bl.c             |   8 +-
 drivers/video/fbdev/amba-clcd.c                 |  19 +-
 include/linux/backlight.h                       | 415 +++++++++++++++++++-----
 33 files changed, 536 insertions(+), 433 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
