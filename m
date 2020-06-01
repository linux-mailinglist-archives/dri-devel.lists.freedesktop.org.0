Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 777CD1E9E7B
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 08:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDBD6E038;
	Mon,  1 Jun 2020 06:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D385B6E038
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 06:52:17 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id h188so3295946lfd.7
 for <dri-devel@lists.freedesktop.org>; Sun, 31 May 2020 23:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lcs4UfCjZfwBNFi+8rkSrZ11oxhwX1U+s8m8XO/pfDI=;
 b=kTEQfOPA4AqYBYajHUGCtoyClG+Bp8MGoxPyjdJm8jSB8Cv0a1Gf6qFlAXPQchzp7F
 ni3sWO8OzBm68Su+yZ9jDMiOv/rYuX015JMwKNi2VCvT4YIU+q6PuBtyaCM+Q1LPJyFD
 kJosFcJxmSRV14YcYNsKJ2wr3GUUMvX4L9P4CdUBA65o0RIGDC6arVBe6VA4dIhxArB+
 SCDdoi86W/e/vAukfCJEME27jt+IM3rr8boU1IKENSwZCIHEnAKA5wCMxpDFiTwtmo7P
 yyZHMTMxT00WJYwv79ZFjsXTSLS8/DNKtrdyHcE4ovt5TaNVSHSz5a5T6uCQST98wL4t
 jU4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Lcs4UfCjZfwBNFi+8rkSrZ11oxhwX1U+s8m8XO/pfDI=;
 b=XuJtdzk+pCIAtcArTt2j+umWY+Qqq0uANGfb0RZfA5MgJRFLHOsMA1/TXhCaNnWcKf
 coNee6wDWq2mXbvHB5Tk4DYMICNB1bEKBHRjRJLhim8c0U/4W7Km2I0VkMux6S7tj58y
 OhX3N/EAppVIB1U9uJkVO54Thbgste9kl5KXpKdRqi1qXO6H6X91e14+f7h4/Jba3KNt
 ztD+bF7vCkB56vwj/Z96CjYOhq0Vph2LV7uMW0rH+EJQfE0WUjeFU3DKbRxp70IA8zNc
 EgLQOaM/dcZd2vhgDBYMGBIkba/qfZ8ynxKRdJhHY430GI2OTb++/aM2NFdgd8iZgQ4c
 ff7g==
X-Gm-Message-State: AOAM530tnDY1qPBwOkpfDWk6dESryPKd/FaPmMXC2AV6AmAe60cv38Bf
 A6lzkLHVAlFY8XV6zlhoejFw0pTgg2E=
X-Google-Smtp-Source: ABdhPJzjz/NAIyLeXql3zfTZPD5z1MKZ+BU+XLz6PTkE13Afx7zKl2wz/s4PDc86x6D1L7XcDcp2mw==
X-Received: by 2002:ac2:54b4:: with SMTP id w20mr10547915lfk.48.1590994335553; 
 Sun, 31 May 2020 23:52:15 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:281d:a604:434c:a58d])
 by smtp.gmail.com with ESMTPSA id e13sm2540462ljl.117.2020.05.31.23.52.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 31 May 2020 23:52:14 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Jingoo Han <jingoohan1@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: [PATCH v3 0/16] backlight updates
Date: Mon,  1 Jun 2020 08:51:54 +0200
Message-Id: <20200601065207.492614-1-sam@ravnborg.org>
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
   When this is landed I have a pile of follow-up patches waiting,
   mostly introducing backlight_is_blank() all over.

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

Sam Ravnborg (13):
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
      backlight: as3711_bl: introduce backlight_is_blank()
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
 drivers/video/backlight/backlight.c      | 174 +++++++++-----
 drivers/video/backlight/bd6107.c         |   4 +-
 drivers/video/backlight/corgi_lcd.c      |   5 +-
 drivers/video/backlight/cr_bllcd.c       |  22 +-
 drivers/video/backlight/da903x_bl.c      |   8 +-
 drivers/video/backlight/ep93xx_bl.c      |   3 +-
 drivers/video/backlight/generic_bl.c     | 110 ---------
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
 include/linux/backlight.h                | 374 +++++++++++++++++++++++++------
 30 files changed, 465 insertions(+), 346 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
