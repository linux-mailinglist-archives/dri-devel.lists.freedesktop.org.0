Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6ED213F62
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 20:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 934F46EB91;
	Fri,  3 Jul 2020 18:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 512916EB91
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 18:46:00 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y18so19014960lfh.11
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jul 2020 11:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qa4ij5M0Cagq/pu8aOEga/t9GH74UxC7znr9RmoByx0=;
 b=Pr4TeVWNg8oSguk7KoqCU73pTUSWHrIrplIP/Pqe3Jw+/BEqQfJJI2MoFOjC/CHimV
 3BWQ48cGdSpBYMa5a+KAsQfJYvs1AmgHBU+ht4Iq8H1GjPpnZXNhBobsa/b93kfwfcib
 DLfgLhJYlzbIu4i1mjenBTgWvrG36qZTTzGnfLWTVPLovhzc/sH/2qIPuVIPgwtu6gdy
 r2BD0+XneOSzDkKr0tRhQGH+Fyo8mKXOJFfGckzBeZuV86crBo87VbHZPIIeYaGrKBfM
 wrQ7KqgpcKaWiE1RmqEZIV93ixfIaySoRCZ2BbsX7QgyZ+n+f5tMMeVYMGm2cm1j6s9B
 pkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Qa4ij5M0Cagq/pu8aOEga/t9GH74UxC7znr9RmoByx0=;
 b=owOHIsilUbTLgcPoBsOwCivG0S00lIo8PzAjMO1DMldDB1qiK8cQJRs5Vzq27ER+v0
 kOsniLxnD3vs3aNSyIj6lW/neL8zKgZQ6N25QsdLU6P1pxggy/9est8+Woj/BdWfwfIo
 +aZbuoKolbgVg5dF0bhKh0XLd1HWYSzqqBI4ytLtT3RWHUgNhnFuqdMV8QGp8wfIVzTF
 xh6LQVTzkaRlndtXCtsLnorK5QwPb+NRuEQHn+5W/9lTPqa+cqHUFYUrDPC7BSISMr4W
 /7tMQpLXImGoVj+2zlLcCed6Spoi9qpGmqu0fxdOI+etzxV5oIgcOX3zjj+tkeJnNfJy
 nGsA==
X-Gm-Message-State: AOAM531Z8gmh6OtIfaJxDVVXerqLa4YZ74rKvYlYFlos7CE3QMKd0ZuY
 KiZkf4O59jF1KlLiofyiCIoLPfczZ8M=
X-Google-Smtp-Source: ABdhPJxLb9Stn+3Vn1mkJrN3zeGv7Ihe43iUEUKQlmZvet59I/NrBkw7xZ4ir/vi90deO56BpHqPHw==
X-Received: by 2002:ac2:5093:: with SMTP id f19mr23104888lfm.10.1593801958276; 
 Fri, 03 Jul 2020 11:45:58 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:4025:a614:1d5c:b7bc])
 by smtp.gmail.com with ESMTPSA id h22sm4404224ljg.1.2020.07.03.11.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 11:45:57 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v4 0/20] backlight: backlight updates
Date: Fri,  3 Jul 2020 20:45:26 +0200
Message-Id: <20200703184546.144664-1-sam@ravnborg.org>
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
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jonathan Corbet <corbet@lwn.net>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Andy Gross <agross@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
 patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Long overdue follow-up. v3 submission here:
https://lore.kernel.org/dri-devel/20200601065207.492614-1-sam@ravnborg.org/

v4:
  - Introduced backlight_get_brightness based on feedback from Emil.
  - Properly described the rationale behind more restrictive locking use
    I checked that locking was not used outside backlight core
    by renaming the lock fields.
    As it is not used seems OK to restrict use to the core.
  - Introducing backlight_get_brightness invalidated
    some patches and I did a bit finer split to ease review.
  - Added acks
  - A few small adjustments documented in the individual patches

v3:
  - Dropped video patch that was reviewd and thus applied
  - Updated kernel-doc so all fields now have a short intro
  - Improved readability in a lot of places, thanks to review
    feedback from Daniel - thanks!
  - Added better intro to backlight
  - Added acks

    Several other smaller changes documented in the
    patches.
    I left out patches to make functions static as
    there are dependencies to drm-misc-next for these.

v2:
  - Dropped drm patches that was reviewed and thus applied (Thanks Tomi)
  - Updated backligth_is_blank() based on Daniel's feedback
  - Dropped EXPORT_SYMBOL that was no longer relevant
  - Reordered patches, so patches with no external
    dependencies comes first
  - Updated the description that follows.


This following series touches a lot of backlight things.

Starts with a small refactoring in backligth.c to remove some indents.
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

In this process I identified that the backlight_bl driver
was no longer in use - so drop it.

Everything builds, but so far no run-time testing.

        Sam

Sam Ravnborg (20):
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
      backlight: introduce backlight_get_brightness()
      backlight: as3711_bl: simplify update_status
      backlight: cr_bllcd: introduce backlight_is_blank()
      backlight: gpio_backlight: simplify update_status()
      backlight: jornada720_bl: introduce backlight_is_blank()
      backlight: use backligt_get_brightness()
      backlight: drop backlight_put()
      backlight: make of_find_backlight static
      backlight: make of_find_backlight_by_node() static

 Documentation/gpu/backlight.rst          |  12 +
 Documentation/gpu/index.rst              |   1 +
 drivers/video/backlight/88pm860x_bl.c    |  13 +-
 drivers/video/backlight/Kconfig          |   8 -
 drivers/video/backlight/Makefile         |   1 -
 drivers/video/backlight/adp5520_bl.c     |  10 +-
 drivers/video/backlight/adp8860_bl.c     |  10 +-
 drivers/video/backlight/adp8870_bl.c     |  10 +-
 drivers/video/backlight/as3711_bl.c      |  11 +-
 drivers/video/backlight/backlight.c      | 234 ++++++++++--------
 drivers/video/backlight/bd6107.c         |   7 +-
 drivers/video/backlight/corgi_lcd.c      |   8 +-
 drivers/video/backlight/cr_bllcd.c       |  14 +-
 drivers/video/backlight/da903x_bl.c      |  13 +-
 drivers/video/backlight/ep93xx_bl.c      |   8 +-
 drivers/video/backlight/generic_bl.c     | 110 ---------
 drivers/video/backlight/gpio_backlight.c |  17 +-
 drivers/video/backlight/hp680_bl.c       |   6 +-
 drivers/video/backlight/jornada720_bl.c  |   2 +-
 drivers/video/backlight/kb3886_bl.c      |   6 +-
 drivers/video/backlight/led_bl.c         |   7 +-
 drivers/video/backlight/lm3533_bl.c      |   8 +-
 drivers/video/backlight/locomolcd.c      |   6 +-
 drivers/video/backlight/lv5207lp.c       |   7 +-
 drivers/video/backlight/max8925_bl.c     |  13 +-
 drivers/video/backlight/pwm_bl.c         |   7 +-
 drivers/video/backlight/qcom-wled.c      |   7 +-
 drivers/video/backlight/tps65217_bl.c    |  10 +-
 drivers/video/backlight/wm831x_bl.c      |  13 +-
 include/linux/backlight.h                | 409 ++++++++++++++++++++++++-------
 30 files changed, 503 insertions(+), 485 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
