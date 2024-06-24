Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEEF915196
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 17:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E98E910E486;
	Mon, 24 Jun 2024 15:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B4aY8z7s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEA010E486;
 Mon, 24 Jun 2024 15:12:35 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-79baa4e8531so440062385a.2; 
 Mon, 24 Jun 2024 08:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719241953; x=1719846753; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GKUVei0D2VbiVNvKS5RQUkYlhAuK8XSzTDtmkdar2R4=;
 b=B4aY8z7sh2BnOicwxYkeir8g9WBo1oEM6lB8M07Gl1VbjjtIvl/TVMaFoRKaNFuFwd
 srYPJtNefIT3yWFl6Yw9BEFRv+z6gOoL9HgiBrcTq2vEFGO9kEnSNrO4y4ZMnWbDvIrs
 LtqTk2Ssggsn6GnkWqqDu+7w/Yy9cHn3s8+5kspMnykGLMGE3z0Try7bQn/B8zJvyBsq
 3/MhBVJ2xtAiPhJ6MG91Oe9Fhs4mLLE4cWrvzJa9D5NAp5Oatn7w9p0Qamlqflk6Ti+O
 MOANuLbRu0/d0H987rlxf1unjx/G97ZKeBFLRTigvRL3ukLZXpV6TH6Cw1mUMgNqOeUU
 MaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719241953; x=1719846753;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GKUVei0D2VbiVNvKS5RQUkYlhAuK8XSzTDtmkdar2R4=;
 b=kzpDYIeKeGIpAgOwja9Bd2Ugn6pxs8mohNsZDnm8bRBmboSMzaZY90nWFVNb7sU/Di
 hdZ0BdKGOfehhMb/jilAFyLXM7JSp0QxmI0vHIwWQoL9UJJp8KAifHAh5BM3gnOr/PBc
 G9wsP3+Ju0/R9T7aLGlq/Y64F7Jmxf8Rkk6YvV3t5xHmdaTG7Ppc9MBqQVGzf/NRisbe
 KDVoEiPzUnvgFewjEKYYA8Xyxq8T6T4UEw1Z0u2EDr6MTfKK47PJWFlQSyPHUTNhQAqp
 41V4Pl3nEX6pL3GtRwZSqjp+rd5zqYzvFmAYuIJrhirK0AODh5JpX7Z+ZLbsqFLZQZyn
 CgHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpQTc19t5fJ8X3FSQW1OQrCMeHBcem2mJrYkW5/8LN2XCdt9Q2MSqEvhLwLkBYRG8MLonuNknm7fdvd65S3CYeNd1YcKQK7TDCY4pwIF6u47LEa73JYSIxzJJS1/m4PSxoVaM6tAw9f2wwxfI1MA==
X-Gm-Message-State: AOJu0Yx4IMhCQIf5h8DLzPUIiKaFHSVtve3jaoCwJzuklBH0O7CBgCSd
 NZprbRZUS0kuHg8fRNmCYoJT5ZNbIuRAKSK+Xk13w4XDfq7C/8w6
X-Google-Smtp-Source: AGHT+IGQkLZoZU22jL6ZeSbVX7Xh7HWjFnFtXQdEPeoe2xF6REBHYTUlxsEawbuUOvN4TCk0URPZbw==
X-Received: by 2002:a05:6214:19e8:b0:6b4:ffc9:1e9e with SMTP id
 6a1803df08f44-6b53bbbe20dmr60711066d6.3.1719241953657; 
 Mon, 24 Jun 2024 08:12:33 -0700 (PDT)
Received: from localhost.localdomain ([142.198.217.108])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b529eb3decsm27243976d6.12.2024.06.24.08.12.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 08:12:33 -0700 (PDT)
From: Wu Hoi Pok <wuhoipok@gmail.com>
To: 
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Wu Hoi Pok <wuhoipok@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/7] drm/radeon: remove load callback
Date: Mon, 24 Jun 2024 11:10:44 -0400
Message-ID: <20240624151122.23724-1-wuhoipok@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Changes between v1 and v3:

1. add "ddev->dev_private = rdev;"
2. include a cover letter

Wu Hoi Pok (7):
  drm/radeon: remove load callback
  drm/radeon: rdev->ddev to rdev_to_drm(rdev) 1
  drm/radeon: rdev->ddev to rdev_to_drm(rdev) 2
  drm/radeon: rdev->ddev to rdev_to_drm(rdev) 3
  drm/radeon: rdev->ddev to rdev_to_drm(rdev) 4
  drm/radeon: rdev->ddev to rdev_to_drm(rdev) 5
  drm/radeon: rdev->ddev to rdev_to_drm(rdev) 6

 drivers/gpu/drm/radeon/atombios_encoders.c |  2 +-
 drivers/gpu/drm/radeon/cik.c               | 14 ++--
 drivers/gpu/drm/radeon/dce6_afmt.c         |  2 +-
 drivers/gpu/drm/radeon/evergreen.c         | 12 ++--
 drivers/gpu/drm/radeon/ni.c                |  2 +-
 drivers/gpu/drm/radeon/r100.c              | 24 +++----
 drivers/gpu/drm/radeon/r300.c              |  6 +-
 drivers/gpu/drm/radeon/r420.c              |  6 +-
 drivers/gpu/drm/radeon/r520.c              |  2 +-
 drivers/gpu/drm/radeon/r600.c              | 12 ++--
 drivers/gpu/drm/radeon/r600_cs.c           |  2 +-
 drivers/gpu/drm/radeon/r600_dpm.c          |  4 +-
 drivers/gpu/drm/radeon/r600_hdmi.c         |  2 +-
 drivers/gpu/drm/radeon/radeon.h            | 11 +++-
 drivers/gpu/drm/radeon/radeon_acpi.c       | 10 +--
 drivers/gpu/drm/radeon/radeon_agp.c        |  2 +-
 drivers/gpu/drm/radeon/radeon_atombios.c   |  2 +-
 drivers/gpu/drm/radeon/radeon_audio.c      |  4 +-
 drivers/gpu/drm/radeon/radeon_combios.c    | 12 ++--
 drivers/gpu/drm/radeon/radeon_device.c     | 19 ++----
 drivers/gpu/drm/radeon/radeon_display.c    | 74 +++++++++++-----------
 drivers/gpu/drm/radeon/radeon_drv.c        | 27 +++++---
 drivers/gpu/drm/radeon/radeon_drv.h        |  1 -
 drivers/gpu/drm/radeon/radeon_fbdev.c      | 26 ++++----
 drivers/gpu/drm/radeon/radeon_fence.c      |  8 +--
 drivers/gpu/drm/radeon/radeon_gem.c        |  2 +-
 drivers/gpu/drm/radeon/radeon_i2c.c        |  2 +-
 drivers/gpu/drm/radeon/radeon_ib.c         |  2 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c    | 12 ++--
 drivers/gpu/drm/radeon/radeon_kms.c        | 18 ++----
 drivers/gpu/drm/radeon/radeon_object.c     |  2 +-
 drivers/gpu/drm/radeon/radeon_pm.c         | 20 +++---
 drivers/gpu/drm/radeon/radeon_ring.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_ttm.c        |  6 +-
 drivers/gpu/drm/radeon/rs400.c             |  6 +-
 drivers/gpu/drm/radeon/rs600.c             | 14 ++--
 drivers/gpu/drm/radeon/rs690.c             |  2 +-
 drivers/gpu/drm/radeon/rv515.c             |  4 +-
 drivers/gpu/drm/radeon/rv770.c             |  2 +-
 drivers/gpu/drm/radeon/si.c                |  4 +-
 40 files changed, 193 insertions(+), 191 deletions(-)

-- 
2.45.2

