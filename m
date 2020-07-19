Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C184022508C
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 10:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC4D389F6E;
	Sun, 19 Jul 2020 08:08:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4E9289F6E
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 08:08:04 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id x9so17028629ljc.5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Jul 2020 01:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WnI5F454pMZI6Esv1LgL7L2JfitladHB6StSSThkZNI=;
 b=Z8trr1tlrNcJmz4HoHn9adB6bJd9M8zYoGrkDc30++eOz0f2ld8VLs5yNrPJIbb81g
 1xwki8GLp9mJgEF0hjQV0vtGhhwvWEU1N6b3joW7Y9LIH45UivASrZF6ftTsDcCeXBwe
 DFwjsNTkosOE7b0pTrBgseXg63DMFglYbA3ARM9I/ifBX+IqERM9QadZ4MKuuzNck328
 12McziDSW3iV3MPkHiXjXNP+pwNFi4qsy+X1jans3WgUqnb4H70H7qtKDmXy9VXvUJ/b
 TLrOXN6eH8zbcO4WHtbkT+UFXi7Gp9oxCcX284hwWKNPJ0kgjxOvDmfj2Z+rKZpsWqFQ
 AprA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=WnI5F454pMZI6Esv1LgL7L2JfitladHB6StSSThkZNI=;
 b=ZUVL/H5N/R2Q5Ejfa7PG4DHSDk/cK754pLMOvfBVIjqmuF452OcRi0/KbFgp/XhNkZ
 spW298hqr3RaI7S2bFBqw257VGxDxHB7iw78HDYaEHmyK8Yw/rUn8CQsKsVlQRGd58H3
 JnxrAfJ4IlxEkERkeedthVkhSp+O2mQbtGlTxKiO/VCJ+fmv0ifU6wnbvo9bd+yLljtK
 Kg10Yd3rdIiRSYtNMOAceFkJF/RK09wTvfdQmKg/jGGMBgZU+WgDuMF7jZxAnqjX5I9s
 KrDj9lJdZzvUOURNhq0PkpTQLf61AfjO1jooPG0M3GaOojD7XZTs3erbXd0CD3RZl4y/
 Z0dA==
X-Gm-Message-State: AOAM533PULL0K2pYg9oJ2fpB9nnJiQG53XBfYxFb6f3nQiK37ur4HiWp
 0pDP/aDlrtvsMhIEAPtMYVC8pUF60Ac=
X-Google-Smtp-Source: ABdhPJwlmppqA7BV4OvP0HV49A8Pja1NU+jaBZTZwubftCwEK6zwc1GhTyRydeLODV0nED3CA5IPTQ==
X-Received: by 2002:a2e:b8d4:: with SMTP id s20mr8011885ljp.177.1595146082636; 
 Sun, 19 Jul 2020 01:08:02 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:d5fe:fe9c:fc06:b74c])
 by smtp.gmail.com with ESMTPSA id 72sm732407lfh.97.2020.07.19.01.08.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 01:08:02 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v5 0/19] backlight: backlight updates
Date: Sun, 19 Jul 2020 10:07:24 +0200
Message-Id: <20200719080743.8560-1-sam@ravnborg.org>
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
 Sam Ravnborg <sam@ravnborg.org>, patches@opensource.cirrus.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all.

Follow-up on v4 - with only a few changes listed below and
in the individual patches.
Thanks for all the reviews and the feedback on the patches!

I am planning a follow-up on this patchset to update the
backlight drivers all over to use backlight_get_brightness()
and backlight_is_blank() as appropriate.

v5:
  - Added r-b's
  - Updated cr_bllcd to use gpio-backlight semantics
  - Various editorial updates to changelogs
  - Rebased on top of Lee's backlight tree
  - Dropped "make of_find_backlight_by_node() static"
    The change depends on drm-misc-next.
    Will be re-send when the changes hits the backlight tree
    (We could have done this in other ways, but it is easier to just wait)

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

The following series touches a lot of backlight things.

Starts with a small refactoring in backligth.c to remove some indents.
This increases the readability and no functional changes.

Then two new helpers backlight_is_blank(), backlight_get_brightness()
are added. These helpers simplifies the implementation of update_status()
in the backlight drivers where they are used.

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

Sam Ravnborg (19):
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
      backlight: cr_bllcd: introduce gpio-backlight semantics
      backlight: gpio_backlight: simplify update_status()
      backlight: jornada720_bl: introduce backlight_is_blank()
      backlight: use backlight_get_brightness()
      backlight: drop backlight_put()
      backlight: make of_find_backlight static

 Documentation/gpu/backlight.rst          |  12 +
 Documentation/gpu/index.rst              |   1 +
 drivers/video/backlight/88pm860x_bl.c    |  13 +-
 drivers/video/backlight/Kconfig          |   8 -
 drivers/video/backlight/Makefile         |   1 -
 drivers/video/backlight/adp5520_bl.c     |  10 +-
 drivers/video/backlight/adp8860_bl.c     |  10 +-
 drivers/video/backlight/adp8870_bl.c     |  10 +-
 drivers/video/backlight/as3711_bl.c      |  11 +-
 drivers/video/backlight/backlight.c      | 208 +++++++++-------
 drivers/video/backlight/bd6107.c         |   7 +-
 drivers/video/backlight/corgi_lcd.c      |   8 +-
 drivers/video/backlight/cr_bllcd.c       |  25 +-
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
 include/linux/backlight.h                | 399 +++++++++++++++++++++++++------
 30 files changed, 497 insertions(+), 466 deletions(-)



_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
