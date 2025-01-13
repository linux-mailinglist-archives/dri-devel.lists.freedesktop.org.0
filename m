Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE46A0B3A8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 10:54:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38F510E5FC;
	Mon, 13 Jan 2025 09:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d26+E883";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1DD310E5FF
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 09:54:48 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-540201cfedbso3680440e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 01:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736762027; x=1737366827; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uM9tQkzj3OJfzp7RUkxy9I2sWdSVBHdxH3TTd0q0OWM=;
 b=d26+E883NugINq2euIE7f6C+XS8Mrh6M8KGuLKJ0KVoko1mo8s23nwWzGjFUg5b1lU
 FwE1mI2jZQ0b96BV8f34ijD18QEh89n6GpxZY8vlwJ5+ZXaixg2aqJTWppQnfPU7zc5a
 YOy9HW+a1N7ewzLWONvS8Yb0vp8kkiu87BKNb/DeRJs+Q6gv+1L7w+eiKXjxxEmwu8Gz
 7UzodtsmFUBXsDcDhpZ9Po0N9lB/t1hQJDdGvdxl6kRtUiAeyzekv8tp7ENyK4NLIVZD
 IhbMK64xbeZZXB/fO19+kpH0PDipFcyp55fR+El9S0N1LFLysnKOaHFDbnyacr8n2wrg
 KD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736762027; x=1737366827;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uM9tQkzj3OJfzp7RUkxy9I2sWdSVBHdxH3TTd0q0OWM=;
 b=Ha0jiR64+rvh4YGmFxOBF62ldwyCx2MeRveHzZw8XhxzMa+wjbU/0yVRAgTuIHljUP
 ul7rcd3WB2qGh7EnieXxe1eUouy6/gS87NGyMf44P4MvPZrg9aGTt8vZHQgcPUtCgwCp
 XPglWwgn6FNeHA5lFkkILvoucgs5z1aZZRK2+fyA/1Xh9UmzR1O+LEAowbbRCNJGIfzX
 So8enlEAAP28o5itw8A1caSEFQw0Q2VhK38SOuyTj4BI1zkmzP99Ghu31RsyIK30L/WD
 DdcWCVgO2xEdBCA+73+1sWyIIVXVADr3ynm4M0PaRh9EJ6LeJ0iP7K2w1Y+ByRUzLzEo
 3q7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgjy0z1oBgWzDwviK6Q5Ng9sfDCIn6XnLBXftrXROlbR4i7o6Q9qfFjZ1trxyzbh3C56Pxr+NDB9I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOFqd4V9gUrFLX1kO2U/xD9q0iJPvcx7b+Sf1u/rXMXp39Racp
 1ABktUGWAYGO8xIsXreruz2m8jNrxjXanyJl/WSJJtTUvdO1AX0hr6SdGChamUE=
X-Gm-Gg: ASbGncu6J/zHNyXjKa6MpD9dtX2J3SRz79SAQZiiNy4r1D00DNE0LWske9Fa4jOLJfL
 Z0Rp22hD63mxlCBC+pU6KTvMHDAO6ZcT0iJSU/GulwmCptSBLdEdHPMLDxMHvU+MRiNIO4MNw3r
 TaP3y8+cbmIbM+rCds93defd3QPTSTYZT8fWc9FskbmwSmXdc9ceFxctoVm7CKceRQ8DHmDg45B
 Ui87oBFPGgNmNlOZ1iy48LyuPFB9XR9aZjVbXj6JpLZn8yTrnyOqlLYZ7u6dPKA
X-Google-Smtp-Source: AGHT+IGTFmyPSvGWllS1e9shSU24IuZFR3WeRQRaAsUfHfGVMbhTf+vz3uWh9lwuPXHK9lRQNl2vJg==
X-Received: by 2002:a05:6512:3049:b0:542:9883:266 with SMTP id
 2adb3069b0e04-54298830320mr1924158e87.37.1736762027306; 
 Mon, 13 Jan 2025 01:53:47 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428bea6a67sm1287085e87.167.2025.01.13.01.53.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 01:53:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/3] drm/i2c: tda998x: move under drivers/gpu/drm/bridge
Date: Mon, 13 Jan 2025 11:53:43 +0200
Message-Id: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKfihGcC/23NwQqDMAyA4VeRntfRpBXrTnuPsUNdoxamHa0Uh
 /juq4KHsR3/hHxZWKTgKLJLsbBAyUXnxxzyVLBHb8aOuLO5GQpUgKC4DQMffCI+WVPXeua6bZT
 MG6kssnz2CtS6eSdv99y9i5MP7/1Dgm16YOUvloALXmmoALEBW8nr040m+LMPHdu0hIdQCgDxR
 8AsUIuGSi3RInwJ67p+AIZnOYrzAAAA
X-Change-ID: 20241214-drm-move-tda998x-8fb4321434d2
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-media@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2211;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fRGutChLLUoNS87CB1VvDD1XIyfOsE6JxyKnONK4z+Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnhOKqRODIHsi9LCj4YN9lMxivnWqIg50lSK3lv
 S4ufoqhAjuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ4TiqgAKCRCLPIo+Aiko
 1d4BB/9Ej4WifVIldOsPfNqeR3CcYulWReAILm0ciM2Nqgi+NoaGbbEHQ0i1h2QhhBBjvvOAxs0
 tgXfjsnVRl4azRn/FlOW7IqAW4W4AlTjnwmuHWZUxGvLBZ2YBGvl7KsUwl/0mHg6TFo4IjwCTtY
 wr67yd2T3caYWj73oOdI3L/zaMj0mfbgwf9fmujCwgYuTMD+AC5gkwnUdKH4zM/eOophO0RKr1z
 1houdSwqLRRUeu4ahhyh33o9Z3pTPJHiot0+vu2+Z1/kdZf2uv+HzbGm3JGe4sJczI5VZAoHOWd
 9fih95x5ErTycGRO65kpk3YKboBdVdhSt7PieYubyGqb5EeA
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TDA998x is the HDMI bridge driver, incorporating drm_connector and
optional drm_encoder (created via the component bind API by the TICLDC
and HDLCD drivers). TDA9950 is an I2C-CEC translator, being present
on-die on the TDA9989 and TDA19989 chips.

Move TDA9950 driver to drivers/media/cec/i2c and TDA998x driver to
drivers/gpu/drm/bridge/.

Note: In a comment for v2 Hans has acked merging these patches through
drm-misc(-next) with no additional immutable branch.

Note to RMK: I didn't change that, but I'd like to propose to use
drm-misc tree for this bridge.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Dropped irrelevant sentence from the tda9998 commit message (Hans)
- Link to v2: https://lore.kernel.org/r/20250110-drm-move-tda998x-v2-0-ef2ae5832d21@linaro.org

Changes in v2:
- Moved TDA9950 driver to drivers/media/cec/i2c (Hans, Laurent)
- Moved TDA998x driver to drivers/gpu/drm/bridges istead of tda/ subdir
  (Laurent)
- Link to v1: https://lore.kernel.org/r/20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org

---
Dmitry Baryshkov (3):
      drm/i2c: tda998x: drop support for platform_data
      media: cec: move driver for TDA9950 from drm/i2c
      drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge

 MAINTAINERS                                   |  3 +-
 drivers/gpu/drm/arm/Kconfig                   |  1 +
 drivers/gpu/drm/bridge/Kconfig                |  8 +++++
 drivers/gpu/drm/bridge/Makefile               |  4 +++
 drivers/gpu/drm/{i2c => bridge}/tda998x_drv.c | 49 +++------------------------
 drivers/gpu/drm/i2c/Kconfig                   | 18 ----------
 drivers/gpu/drm/i2c/Makefile                  |  4 ---
 drivers/media/cec/i2c/Kconfig                 |  9 +++++
 drivers/media/cec/i2c/Makefile                |  1 +
 drivers/{gpu/drm => media/cec}/i2c/tda9950.c  |  0
 include/drm/i2c/tda998x.h                     | 40 ----------------------
 11 files changed, 28 insertions(+), 109 deletions(-)
---
base-commit: e91570cf7c1b3e406878e7b1efbe823d039d1659
change-id: 20241214-drm-move-tda998x-8fb4321434d2

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

