Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D455F4F1A2B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 22:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6014310E1C5;
	Mon,  4 Apr 2022 20:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF7210E1C5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 20:45:39 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id j21so8879844qta.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 13:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2G5Po4ULnotlhfx4FbHaCcxRj763DpDJfo2A2yANXDU=;
 b=J4O/n5vQLEnF1H8OcV6NTmzm8e16FLhujYdZmcLJ1jbU2HSvH8q4YgmuOc7x0L2TAR
 Bo8oXjKcvFik/ArbzWfCFko8Z/IDAidFpr9PV+cDW7gmyzRqzYD43xlQ2hf8rjEIguPQ
 +/OiyEmrlrNkK6U7PlCDUXDqNuCZyV43ry7YnlafP6D7jHngIvKldwn7Z6YEC5Bn9XFt
 Bx+JgQQqtOF5mkSkaRs1Vp487bZ37ow8uBZRAZ7HxMb5e7c/bS9BcwzCVFQcH1TQ/0hr
 hlcBjXtaEkB9Pj1tyhY9Gu5j1ybSismT9C2iw/xZtGoTyIn72Nj0Z/k4cft2vYCa5leK
 oBxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2G5Po4ULnotlhfx4FbHaCcxRj763DpDJfo2A2yANXDU=;
 b=XC6lzeB2Xwk2KlITKlsP+RaoxKN9dCFXxrVbjja93q6hotG1JyGKbYNWv1wLrd0HQn
 AC80ZdbPV+QhYjcuUxTI5D6UgukNYP+2TFAprgQVlLoYRFJ0bS4G5hk3//YyD1weDRBv
 z4PHl4xamKdqvURHvgGY6eH7QZSPDlpk7qYFiR9jBkhP1FES9/9gAF5CTgcHfGYGH382
 v2yyzw05+t6JMOUSD0mrMDhgyfC2mFuTzF3AdwWnngzpzlNP2rOAijJK72xNsZKpKAUc
 dBaBIaEmuk3Q4k4FkALlBTsUIqvj1ZQ0b0h98jVnr2QGR2fh/64nPrDMe2vPei1G3ylm
 085Q==
X-Gm-Message-State: AOAM531xRXbtBRRmLPRXwOdnoYtL0uV2ytuNA3bNBjIOljqCF/MCk5lI
 toB7f/aNqX/Xzkpvm6qItbM=
X-Google-Smtp-Source: ABdhPJzfxuZy3Rxuh1/SjqN+kJ2a9iPfTLebWweZXxW3vUneopsNEE0Tx5JUimlXSjpkCvWlUvLagg==
X-Received: by 2002:a05:622a:254:b0:2e1:ca15:3cbe with SMTP id
 c20-20020a05622a025400b002e1ca153cbemr159072qtx.650.1649105138552; 
 Mon, 04 Apr 2022 13:45:38 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:7cc:26a1:e446:de76:c0b8])
 by smtp.googlemail.com with ESMTPSA id
 m10-20020a05622a054a00b002eb965bbc3esm9630548qtx.93.2022.04.04.13.45.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 13:45:37 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v5 0/9] Add new formats support to vkms
Date: Mon,  4 Apr 2022 17:45:06 -0300
Message-Id: <20220404204515.42144-1-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, tales.aparecida@gmail.com,
 ~lkcamp/patches@lists.sr.ht, Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Summary
=======
This series of patches refactor some vkms components in order to introduce
new formats to the planes and writeback connector.

Now in the blend function, the plane's pixels are converted to ARGB16161616
and then blended together.

The CRC is calculated based on the ARGB1616161616 buffer. And if required,
this buffer is copied/converted to the writeback buffer format.

And to handle the pixel conversion, new functions were added to convert
from a specific format to ARGB16161616 (the reciprocal is also true).

Tests
=====
This patch series was tested using the following igt tests:
-t ".*kms_plane.*"
-t ".*kms_writeback.*"
-t ".*kms_cursor_crc*"
-t ".*kms_flip.*"

New tests passing
-------------------
- pipe-A-cursor-size-change
- pipe-A-cursor-alpha-transparent

Performance
-----------
It's running slightly faster than the current implementation.

Results running the IGT[1] test
`igt@kms_cursor_crc@pipe-a-cursor-512x512-onscreen` ten times:

|                  Frametime                   |
|:--------------------------------------------:|
|  Implementation |  Current  |   This commit  |
|:---------------:|:---------:|:--------------:|
| frametime range |  9~22 ms  |     10~22 ms   |
|     Average     |  11.4 ms  |     12.32 ms   |

Memory consumption
==================
It consumes less memory than the current implementation in
the common case (more detail in the commit message).

| Memory consumption (output dimensions) |
|:--------------------------------------:|
|       Current      |     This patch    |
|:------------------:|:-----------------:|
|   Width * Heigth   |     2 * Width     |

[1] IGT commit id: bc3f6833a12221a46659535dac06ebb312490eb4

XRGB to ARGB behavior
=====================
During the development, I decided to always fill the alpha channel of
the output pixel whenever the conversion from a format without an alpha
channel to ARGB16161616 is necessary. Therefore, I ignore the value
received from the XRGB and overwrite the value with 0xFFFF.

Primary plane and CRTC size
===========================
This patch series reworks the blend function to accept a primary plane with
a different size and position from CRTC.
Because now we need to fill the background, we had a loss in
performance with this change

---
Igor Torrente (9):
  drm: vkms: Alloc the compose frame using vzalloc
  drm: vkms: Replace hardcoded value of `vkms_composer.map` to
    DRM_FORMAT_MAX_PLANES
  drm: vkms: Rename `vkms_composer` to `vkms_frame_info`
  drm: drm_atomic_helper: Add a new helper to deal with the writeback
    connector validation
  drm: vkms: Add fb information to `vkms_writeback_job`
  drm: vkms: Refactor the plane composer to accept new formats
  drm: vkms: Supports to the case where primary plane doesn't match the
    CRTC
  drm: vkms: Adds XRGB_16161616 and ARGB_1616161616 formats
  drm: vkms: Add support to the RGB565 format

 Documentation/gpu/vkms.rst            |  13 +-
 drivers/gpu/drm/drm_atomic_helper.c   |  39 ++++
 drivers/gpu/drm/vkms/Makefile         |   1 +
 drivers/gpu/drm/vkms/vkms_composer.c  | 325 ++++++++++++--------------
 drivers/gpu/drm/vkms/vkms_crtc.c      |   4 +
 drivers/gpu/drm/vkms/vkms_drv.h       |  41 +++-
 drivers/gpu/drm/vkms/vkms_formats.c   | 298 +++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.h   |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c     |  50 ++--
 drivers/gpu/drm/vkms/vkms_writeback.c |  35 ++-
 include/drm/drm_atomic_helper.h       |   3 +
 11 files changed, 596 insertions(+), 225 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h

-- 
2.30.2

