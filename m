Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E5D1D6BE6
	for <lists+dri-devel@lfdr.de>; Sun, 17 May 2020 21:01:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF3E66E0B9;
	Sun, 17 May 2020 19:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236956E0B9
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 19:01:49 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id l19so7523246lje.10
 for <dri-devel@lists.freedesktop.org>; Sun, 17 May 2020 12:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+vWFegYYLZQwCEOaLXtrEOXjzYIe1aYsXrabMwiuRn8=;
 b=SyPwK9wjsty7a+yolMNcUlz/fyBtkp6kYIO/DY626WHRKcSEHm1CWooE563AfyccvY
 eYgQj9HBx6SSxE6az5TtZb6as24wi3zqIKTmVlR8QDWn+ZTricaiHUUggjfiNytSqA3s
 qW8307TF58lrfmfAQwEse5dAfpSq+RC0guP11lsbK5mhXOvY3Gs+O4cp/7zoB9shCU/b
 6yGX34tFmairsC7E/m7gxyccSZV0Rfe5FVWKXA8CKFYUiV8D8hygu5muTXsosXKg2xKQ
 7Bqy4S8feujVHpBD+Vpn+hXi7L+3kyDqRZgKgQ0efSFsTft3QPdJ0cooYV7J3LrhJToJ
 OYvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+vWFegYYLZQwCEOaLXtrEOXjzYIe1aYsXrabMwiuRn8=;
 b=WYknN9+8Z5uyQcn1HNGBbihCnKz3DtBIPXi4dt1YKQr+I2YBqUsfuL+7Y0PLNP6vXd
 cMfRnF0HYjvNpdDpOlVVhm0cI3ywRy9Ys4gGq9Y1B+cyDh56b/BL15PQeDuFNQFXLmck
 5my4xYBA+WqK7538t/vIQv5+c5E4R8wBnUvbRzT4gYH/yXMDnhLsRaczKVV/BYxgfzoI
 4xFfx+S1fAw1yEu89GhCtxSCLbh/nCIG1mJYHtVFjODRTz9AYOe2Wm0TDM+XL4hvf4dO
 ba1/f6xPq5mpKuPOFYD3/izXz2nfyCMpMf6GGY4bjMuOQRLkwWHRBwksAQGqL4u7HHUu
 PsEg==
X-Gm-Message-State: AOAM5325w5JPUOpUnjZ/rTi36qQOzlJMgskkQNZapgQyz0hjD4f7ugiB
 ZJnrBPwUh1UEljI2cz5Mwer4sHFh5BM=
X-Google-Smtp-Source: ABdhPJzcTXFuU0suV+4pnM5YfobMc0J5sej97g1AnOHfjJxoY0fPxI5WyNS2BgDLet6YtDr6pB+e7w==
X-Received: by 2002:a2e:97d3:: with SMTP id m19mr7889928ljj.136.1589742107096; 
 Sun, 17 May 2020 12:01:47 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:5d55:b3eb:397b:9086])
 by smtp.gmail.com with ESMTPSA id t20sm3282535lfl.17.2020.05.17.12.01.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 May 2020 12:01:46 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: [PATCH v2 0/16] backlight updates
Date: Sun, 17 May 2020 21:01:23 +0200
Message-Id: <20200517190139.740249-1-sam@ravnborg.org>
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
Cc: linux-pwm@vger.kernel.org,
 Support Opensource <support.opensource@diasemi.com>,
 Michael Hennerich <michael.hennerich@analog.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, Sam Ravnborg <sam@ravnborg.org>,
 patches@opensource.cirrus.com,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2:
  - Dropped drm patches that was reviewed and thus applied (Thanks Tomi)
  - Updated backlight_is_blank() based on Daniel's feedback
  - Dropped EXPORT_SYMBOL that was no longer relevant
  - Reordered patches, so patches with no external
    dependencies comes first
  - Updated the description that follows.

This following series touches a lot of backlight things.

It starts by migrating the last user of of_find_backlight_by_node()
over to devm_of_find_backlight().
*Tomi*/*Peter* review feedback would be great - as this allows a smooth
removal of the export of of_find_backlight_by_node().

Then a small refactoring in backligth.c to remove some indents.
This increases the readability and no functional changes.

Then a new helper backlight_is_blank() is added.
This helper will simplify the implementation of update_status()
in almost all backlight drivers.

Then while surfing the code I missed some documentation.
So I got a bit carried away and updated the documentation
for the backlight core and added it to kernel-doc.
The documentation express my current understanding.
Everything from spelling errors to outright wrong content
shall be anticipated - so please review!
We are all best helped if the documentation is correct
and up-to-date and it is readable.

In this process I identified that the backlight_bl was no
longer is use - so drop it.

All the functions that is no longer used by any drivers
are then marked static to avoid adding new users.
There are dependencies to the omap patch in drivers/video/fbdev/
so these patches needs to wait until that one is applied.

The last patch is for now just an RFC patch that shows
the potential simplifications by introducing the
use of the backlight_is_blank() helper.

I have local patches to introduce backlight_is_blank()
in the remaining backlight drivers.
But they will await that this patch set matures a bit.

Everything builds, but so far no run-time testing.

	Sam

Sam Ravnborg (16):
      video: amba-clcd: use devm_of_find_backlight
      backlight: refactor fb_notifier_callback()
      backlight: add backlight_is_blank()
      backlight: improve backlight_ops documentation
      backlight: improve backlight_properties documentation
      backlight: improve backlight_device documentation
      backlight: document inline functions in backlight.h
      backlight: document enums in backlight.h
      backlight: remove the unused backlight_bl driver
      backlight: drop extern from prototypes
      backlight: add overview and update existing doc
      backlight: wire up kernel-doc documentation
      backlight: make of_find_backlight static
      backlight: drop backlight_put()
      backlight: make of_find_backlight_by_node() static
      backlight: use backlight_is_blank() in all backlight drivers

 Documentation/gpu/backlight.rst          |  12 +
 Documentation/gpu/index.rst              |   1 +
 drivers/video/backlight/88pm860x_bl.c    |   8 +-
 drivers/video/backlight/Kconfig          |   8 -
 drivers/video/backlight/Makefile         |   1 -
 drivers/video/backlight/adp5520_bl.c     |   5 +-
 drivers/video/backlight/adp8860_bl.c     |   5 +-
 drivers/video/backlight/adp8870_bl.c     |   5 +-
 drivers/video/backlight/as3711_bl.c      |   8 +-
 drivers/video/backlight/backlight.c      | 235 +++++++++--------
 drivers/video/backlight/bd6107.c         |   4 +-
 drivers/video/backlight/corgi_lcd.c      |   5 +-
 drivers/video/backlight/cr_bllcd.c       |  22 +-
 drivers/video/backlight/da903x_bl.c      |   8 +-
 drivers/video/backlight/ep93xx_bl.c      |   3 +-
 drivers/video/backlight/generic_bl.c     | 110 --------
 drivers/video/backlight/gpio_backlight.c |   4 +-
 drivers/video/backlight/hp680_bl.c       |   4 +-
 drivers/video/backlight/jornada720_bl.c  |   2 +-
 drivers/video/backlight/kb3886_bl.c      |   4 +-
 drivers/video/backlight/led_bl.c         |   4 +-
 drivers/video/backlight/lm3533_bl.c      |   4 +-
 drivers/video/backlight/locomolcd.c      |   4 +-
 drivers/video/backlight/lv5207lp.c       |   4 +-
 drivers/video/backlight/max8925_bl.c     |   8 +-
 drivers/video/backlight/pwm_bl.c         |   4 +-
 drivers/video/backlight/qcom-wled.c      |   4 +-
 drivers/video/backlight/tps65217_bl.c    |   4 +-
 drivers/video/backlight/wm831x_bl.c      |   8 +-
 drivers/video/fbdev/amba-clcd.c          |  19 +-
 include/linux/backlight.h                | 417 ++++++++++++++++++++++++-------
 31 files changed, 522 insertions(+), 412 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
