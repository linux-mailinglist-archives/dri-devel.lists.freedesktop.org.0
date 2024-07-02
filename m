Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC02923A8E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 11:49:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0831C10E598;
	Tue,  2 Jul 2024 09:48:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="q/UXm3de";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B3D10E58E
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jul 2024 09:48:56 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2ebec2f11b7so44864201fa.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jul 2024 02:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719913734; x=1720518534; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+CL2rM6gQRFIxvwZxnMmv5tq1MwlblXKlT+xy6jtFjA=;
 b=q/UXm3de2aPJ62f1oBWSReGB94vnIK/ItTqNnkVAzXs4g7Bj+VvW1ayhe7fVvqeCnH
 x+YF7vqOZsr5S6V05fqKzGrvNJWOjokfq9PYQvRR51ZwJILWXNAEBBszLVotCGfgW+E1
 ac9W2TYsV2gvyTE4itzYOE7FW+SWbl/8dsHCpAApHAmiTv3IpB4xBG9Hu5yV3NpzSxVa
 ahwO1SoXJ2QhZBbZ0Q1tIF6H2c5yZYhXFZbIqaGAsLbSlVJ0yJUAS3TKBh55YWyDqa8N
 JjueTZbiWCVEw1x9fL2H4LnFI7hpquvxxRqrycaG66l0x/gWDV1prhJyxSY7vFxCZKiS
 K6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719913734; x=1720518534;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+CL2rM6gQRFIxvwZxnMmv5tq1MwlblXKlT+xy6jtFjA=;
 b=rh4/R6XClp/yow+8iHcPJwxU8Ur0IITgWQ2b+03DU6DesKV2FElk4b6TZVQsPlybA5
 Znqg7RGd7J/PIbBCnlsoS8v54Ia03mu2cXhfsK9qeaoIyR6Oy5lMZPsTxjJLRzR1rQV7
 IqS25wQeuJuezHFsbv8aCL1rwf8RbUibCZDe6+lf/mYzn447Ierdrx3UcGqDTHNp2IzI
 kVJOtO0X0Q7UETdJaA7/WdaMOM7HrspW7mVirhGxmDW+sLGFAAGzJNbF3GFG5hwoYPAb
 z4EKBppos2OQ2g5hJbcRDU/BlCZLOvc1mTGVbvjqCOA2rmBtDSm3w6p2hx3qwBvyg6Xm
 HCFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQoDg4zl3PzukynqCFKpfaoDcV4WYqh472uT5hSWuSP8KmPoRid4bIwNZ3Vvr7jnoowdNwg1Ws3dKbxxQlN4Q0aUyp/nx/EiVPZ4IRdP3d
X-Gm-Message-State: AOJu0YyX93uD6JGzJAG5gZkbJLJUkC3lZIQHk9Uk9Boe/p4aQWHAaYDp
 QNjEBQDF4vDbAoUjqlj8ueNlHebvBbViYs9IG8gqevnNZn0D/1MrSy3XyWz0zQI=
X-Google-Smtp-Source: AGHT+IFGhvYT8vVyDqaa9mAmycqytwVYEQQ87UpawoBTG26K/hzWSg0FmrAnvTjW4b5csgd/vXjHrw==
X-Received: by 2002:a2e:b7c9:0:b0:2ec:56b9:259b with SMTP id
 38308e7fff4ca-2ee5e6bd1demr44345871fa.49.1719913734219; 
 Tue, 02 Jul 2024 02:48:54 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5160e333sm16231161fa.5.2024.07.02.02.48.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 02:48:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/4] drm: fix two issues related to HDMI Connector
 implementation
Date: Tue, 02 Jul 2024 12:48:51 +0300
Message-Id: <20240702-drm-bridge-connector-fix-hdmi-reset-v3-0-12b0e3124ca4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAPNg2YC/52NSw6CMBBAr2K6dkwphVBX3sO4qO0Ak0hrpqTRE
 O5uYedSl28+7y0iIRMmcT4sgjFTohgK1MeDcKMNAwL5wkJJpWWravA8wZ3Jl42LIaCbI0NPLxj
 9RMCYcAbpsGttL5vaWlFMT8ZysVeut8IjpfL13qO52qa/+XMFEnSFpjPaO4/u8qBgOZ4iD2ILZ
 PWHVBVp1xjptTaVcvglXdf1AzDayO8sAQAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2888;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=aKNowkMoWLFAr/Jk1xuF/YdaHNRoRTyW409aI6KfA7I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmg80E/uw01rVCUV9/aHVNw+7mrZHA5xGH/z1ku
 wgDRH2QVzSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZoPNBAAKCRCLPIo+Aiko
 1TF7B/46yjVZP5lLBunRo1C//rOwvAtnwAf6s8MGaIH1D99u54/bXXOe0/1+JU6/FfW14C+ldOW
 0B7TXVXSDAKnRfkc+Du8xNPxup8qkp/O/MStUIjDILFSWNO0mp3z1lxgKSkhxssR3MVgP4Utn39
 +kvkMufpqMjfI/e037eyBikXpwliBqY0ypOqRMbOPKpm7d+DNCFvXCbqbEeNdDZ4tPj/UC3yjGj
 UamVAIKjOgfl58Jerxkvu0B9R10NKB836gPi4pYFH/SyDZdarj4JEOqUQP871eIhubHb5GMW+Kf
 5CSv0dhrKcmL+RtOWNqpps7hqpktZVhCLqFAIliasVK5Kx87
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

Running IGT tests on Qualcomm Dragonboard820c uncovered two issues with
the HDMI Connector implementation and with its integration into the
drm_bridge_connector. Fix those issues.

Note, I'm not fully satisfied with the drm_bridge_connector move. Maybe
it's better to add drm_bridge_funcs::connector_reset() and call it from
__drm_atomic_helper_connector_reset().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Document the DRM_MODE_PROP_IMMUTABLE requirements currently exposed
  only via IGT tests (Maxime).
- Move drm_bridge_connector to drm_display_helper.
- Link to v2: https://lore.kernel.org/r/20240623-drm-bridge-connector-fix-hdmi-reset-v2-0-8590d44912ce@linaro.org

Changes in v2:
- Actually pass the flags to drm_property_create_range().
- Link to v1: https://lore.kernel.org/r/20240623-drm-bridge-connector-fix-hdmi-reset-v1-0-41e9894dcdec@linaro.org

---
Dmitry Baryshkov (4):
      drm/drm_property: require DRM_MODE_PROP_IMMUTABLE for single-value props
      drm/connector: automatically set immutable flag for max_bpc property
      drm/bridge-connector: move to DRM_DISPLAY_HELPER module
      drm/bridge-connector: reset the HDMI connector state

 drivers/gpu/drm/Makefile                             |  1 -
 drivers/gpu/drm/bridge/Kconfig                       |  1 +
 drivers/gpu/drm/display/Kconfig                      |  7 +++++++
 drivers/gpu/drm/display/Makefile                     |  2 ++
 drivers/gpu/drm/{ => display}/drm_bridge_connector.c | 13 ++++++++++++-
 drivers/gpu/drm/drm_connector.c                      |  7 ++++++-
 drivers/gpu/drm/imx/dcss/Kconfig                     |  2 ++
 drivers/gpu/drm/imx/lcdc/Kconfig                     |  2 ++
 drivers/gpu/drm/ingenic/Kconfig                      |  2 ++
 drivers/gpu/drm/kmb/Kconfig                          |  2 ++
 drivers/gpu/drm/mediatek/Kconfig                     |  2 ++
 drivers/gpu/drm/meson/Kconfig                        |  2 ++
 drivers/gpu/drm/msm/Kconfig                          |  1 +
 drivers/gpu/drm/omapdrm/Kconfig                      |  2 ++
 drivers/gpu/drm/renesas/rcar-du/Kconfig              |  2 ++
 drivers/gpu/drm/renesas/rz-du/Kconfig                |  2 ++
 drivers/gpu/drm/renesas/shmobile/Kconfig             |  2 ++
 drivers/gpu/drm/rockchip/Kconfig                     |  4 ++++
 drivers/gpu/drm/tegra/Kconfig                        |  1 +
 drivers/gpu/drm/tidss/Kconfig                        |  2 ++
 drivers/gpu/drm/xlnx/Kconfig                         |  1 +
 include/drm/drm_property.h                           |  3 +++
 22 files changed, 60 insertions(+), 3 deletions(-)
---
base-commit: 82e4255305c554b0bb18b7ccf2db86041b4c8b6e
change-id: 20240623-drm-bridge-connector-fix-hdmi-reset-0ce86af053aa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

