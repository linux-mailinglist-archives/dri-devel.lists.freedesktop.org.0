Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA958B19A9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 05:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D0710E812;
	Thu, 25 Apr 2024 03:43:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jW9H81Zo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 311B610E812
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 03:43:31 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3c70b652154so410163b6e.2
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Apr 2024 20:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714016610; x=1714621410; darn=lists.freedesktop.org;
 h=message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vnCK077vcnic/R+LScKzvv08SpUTXpy5huFzD93QYW0=;
 b=jW9H81ZooHH6TLYCvqGSLKwh9VXxfMoaopWx7OxgZiIwF+TYcPWKfG/fJtRSlDKvSd
 ZiCoLSUk/f0zp8LDeyQrO6pn1iHo6ZjOTPaYszKyirP2hqnMtDWUhfKaJ+hBogYXYclb
 rNW/kNRlG+1zx5R1UNAVFy+2ScQqGMKIpbN3ZD9IDEER1Jgw1bHFHGm8YD4Fw9zRA2WG
 SdL1AY10oPnWk6lG9pqmLeMruFSTbDriQAmq0txQ1Id5NOXmWZT1fNj+//j9Z6bAlaFX
 AL59TO/4kcPun5ihNG5yKKV1uV9Fg7rbt4RsaVLRf3WHqZnIO4tCRlZiArdkAP3UEXJN
 87rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714016610; x=1714621410;
 h=message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vnCK077vcnic/R+LScKzvv08SpUTXpy5huFzD93QYW0=;
 b=RM8KsxzimEgZ95stGs6+DyhK3Q/W+HC8W/WJdesy2EKi5OPwrax6sqAlP+pGESqdtz
 fMWA5w+IAjcGh0zF6dobwCwF1gsH+o/eO17Qfoeb3Hft4nn+vo8CeWfgoBF+zpAGJi+m
 yHHkLya3JyJOMylHx3V+ZO4ZBC5gLK9ueJwshajQ4ZOzRRiY3XkDHGZ5Ol/oCmAB3Fi6
 +It+aLwOgjbBS54aatQlFP0HGlpPxgmgBhagMZMy9/Ks+Hf/zIUbCdCRzSt63ffTdwj4
 yJ5P9J6mNMXXqJb+efwpWMKlL789Pu8q+h4OYxNM8SmvlLaLocjrOfq8jv6WqWWVioHJ
 ScAw==
X-Gm-Message-State: AOJu0YxUwrpVhTRW7zRbAQDwC3vIHqUzKF9lpRYNfHQBfBQm9aDreBVp
 qlZ6nC2t/uSuKgyFUPbLIepR/4MEzcD2xbcelvYbe8nLt+U7byO2
X-Google-Smtp-Source: AGHT+IHOtD3scAdjmymPzNeVVVH8W7S8v16Wo22wJAyYclqXKFP3sd7XGOtUTQzT9WE51vOGS34ZKg==
X-Received: by 2002:a05:6808:9ac:b0:3c7:426f:7640 with SMTP id
 e12-20020a05680809ac00b003c7426f7640mr4387734oig.32.1714016609985; 
 Wed, 24 Apr 2024 20:43:29 -0700 (PDT)
Received: from daeinki-virtual-machine.localdomain ([58.124.60.88])
 by smtp.gmail.com with ESMTPSA id
 c3-20020a634e03000000b005cd835182c5sm11899227pgb.79.2024.04.24.20.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 20:43:29 -0700 (PDT)
From: Inki Dae <inki.dae@samsung.com>
To: airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Subject: [GIT PULL] exynos-drm-next
Date: Thu, 25 Apr 2024 12:43:25 +0900
Message-Id: <20240425034325.33507-1-inki.dae@samsung.com>
X-Mailer: git-send-email 2.17.1
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

Hi Dave and Daniel,

   Just two cleanups - one is remove the .owner field from the platform_driver
   declarations in Exynos DRM modules and other is to drop the device_node
   cleanup code in exynos_hdmi.c using the scope-based resource management.

Please kindly let me know if there is any problem.

Thanks,
Inki Dae

The following changes since commit 83221064c28a0f9fdc4f63ab4fce2e51bfe23315:

  Merge tag 'drm-xe-next-2024-04-23' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next (2024-04-24 10:51:29 +1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/exynos-drm-next-for-6.10

for you to fetch changes up to d65bfb9546eb627e3c578336355c5b81797f2255:

  gpu: drm: exynos: hdmi: eliminate uses of of_node_put() (2024-04-25 09:37:12 +0900)

----------------------------------------------------------------
Two cleanups
- Drop .owner from platform_driver declaration of each exynos drm module.
- Drop the cleanup code to device_node object in exynos_hdmi.c using
  the scope-based resource management feature[1].

[1] https://lwn.net/Articles/934679/?ref=upstract.com

----------------------------------------------------------------
Krzysztof Kozlowski (11):
      drm/exynos: fimc: drop driver owner initialization
      drm/exynos: fimd: drop driver owner initialization
      drm/exynos: dsi: drop driver owner initialization
      drm/exynos: g2d: drop driver owner initialization
      drm/exynos: gsc: drop driver owner initialization
      drm/exynos: mic: drop driver owner initialization
      drm/exynos: rotator: drop driver owner initialization
      drm/exynos: scaler: drop driver owner initialization
      drm/exynos: vidi: drop driver owner initialization
      drm/exynos: hdmi: drop driver owner initialization
      drm/exynos: mixer: drop driver owner initialization

Shivani Gupta (1):
      gpu: drm: exynos: hdmi: eliminate uses of of_node_put()

 drivers/gpu/drm/exynos/exynos_drm_dsi.c     |  1 -
 drivers/gpu/drm/exynos/exynos_drm_fimc.c    |  1 -
 drivers/gpu/drm/exynos/exynos_drm_fimd.c    |  1 -
 drivers/gpu/drm/exynos/exynos_drm_g2d.c     |  1 -
 drivers/gpu/drm/exynos/exynos_drm_gsc.c     |  1 -
 drivers/gpu/drm/exynos/exynos_drm_mic.c     |  1 -
 drivers/gpu/drm/exynos/exynos_drm_rotator.c |  1 -
 drivers/gpu/drm/exynos/exynos_drm_scaler.c  |  1 -
 drivers/gpu/drm/exynos/exynos_drm_vidi.c    |  1 -
 drivers/gpu/drm/exynos/exynos_hdmi.c        | 16 +++++-----------
 drivers/gpu/drm/exynos/exynos_mixer.c       |  1 -
 11 files changed, 5 insertions(+), 21 deletions(-)
