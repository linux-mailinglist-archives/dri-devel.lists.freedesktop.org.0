Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5E543B149
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 13:34:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E9BA89C6B;
	Tue, 26 Oct 2021 11:34:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9920B89C6B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 11:34:27 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id z24so13124005qtv.9
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Oct 2021 04:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R5UZTg1sZBkeJ19IyTUC1E5QPJHjay85a0uFZoDfyhM=;
 b=o7jzUohXr8D/usUm6CDPnWYFpwsRaqSx+LxcON45Ma/Zl6oD2fRN/kqvYQSmLX0tmb
 M9ci75IhirycGa9GiA9F78cJ44EC3d6ZSdv1G1vmUexxeKcvfKd8ygantClj1PWNLPZZ
 Gks3t5qBdtWKXUHDOz4UPVnahrSvcb3LyrAuic+uInbQFM7RZN34xjP9mUVSZwOgbrbr
 AcMECCNtHaWOGrC4ftuLo4ehTzP7v7eILaGNwiKrrcD/mkOIKBU+OtgodPLZAa5d3Ri4
 QvRk3Xnpiz5I9FJ1DIIaSjb2wyyZ1ReFG362s08zY4R7//dSP13ltNrEaxZcaMsogV6p
 bG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R5UZTg1sZBkeJ19IyTUC1E5QPJHjay85a0uFZoDfyhM=;
 b=foExHoIE1h1kWGXgbDymbXg0p4mTACehrjkU74qipFEfWUxOcEyyM6TCrwENz77AHC
 vX4Dw78ngS/WILgtKvmdE+8YT4qkg1nN/SXZl+NsWfyN5rwk5K4n6sauX1zoLTUaDbip
 c7s6fY0KqbUs6IJqgalAnFo8aDOIRMXtku4mckXRzi7E4Cd3v4mg2UT4pHqyhndXVbpw
 kKPzP1w48P0df+AsROecLHowRd5tnbk9BxrFv9K8tYieeITURMJBM5Pzj5E2KixsffIA
 uEY6n37PJzxCg/cjagx0BwzG9h9X7OXAxS8TE0nWWkxS3KpO2ThrTzdXZ5tiJ2mE+8BJ
 3eJw==
X-Gm-Message-State: AOAM531JimgHvE934pJsXp93nXwler2ZW7TARM7sh2CyYKRLMjkKuwEO
 q1DVB1gf1NYBZ0r0yn4YDDE=
X-Google-Smtp-Source: ABdhPJy6NijxBuFlTjT5EnsQFBU3D+RgSg2fvPcQ6/Nwp39wKsyzxHy1dfOUGDeCNQUQJpfkjikbJg==
X-Received: by 2002:ac8:7d92:: with SMTP id c18mr24108324qtd.388.1635248066187; 
 Tue, 26 Oct 2021 04:34:26 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:5469:b11e:67b8:49d2:1744])
 by smtp.googlemail.com with ESMTPSA id f3sm11117691qko.32.2021.10.26.04.34.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 04:34:25 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Cc: Igor Torrente <igormtorrente@gmail.com>, hamohammed.sa@gmail.com,
 daniel@ffwll.ch, airlied@linux.ie, contact@emersion.fr,
 leandro.ribeiro@collabora.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/8] Add new formats support to vkms
Date: Tue, 26 Oct 2021 08:34:00 -0300
Message-Id: <20211026113409.7242-1-igormtorrente@gmail.com>
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
Following some optimization proposed by Pekka Paalanen, now the code
runs way faster than V1 and slightly faster than the current implementation.

|                          Frametime                          |
|:---------------:|:---------:|:--------------:|:------------:|
|  implmentation  |  Current  |  Per-pixel(V1) | Per-line(V2) |
| frametime range |  8~22 ms  |    32~56 ms    |    6~19 ms   |
|     Average     |  10.0 ms  |     35.8 ms    |    8.6 ms    |

Writeback test
--------------
During the development of this patch series, I discovered that the
writeback-check-output test wasn't filling the plane correctly.

So, currently, this patch series is failing in this test. But I sent a
patch to igt to fix it[1].

XRGB to ARGB behavior
=====================
During the development, I decided to always fill the alpha channel of
the output pixel whenever the conversion from a format without an alpha
channel to ARGB16161616 is necessary. Therefore, I ignore the value
received from the XRGB and overwrite the value with 0xFFFF.

---
Igor Torrente (8):
  drm: vkms: Replace the deprecated drm_mode_config_init
  drm: vkms: Alloc the compose frame using vzalloc
  drm: vkms: Replace hardcoded value of `vkms_composer.map` to
    DRM_FORMAT_MAX_PLANES
  drm: vkms: Add fb information to `vkms_writeback_job`
  drm: drm_atomic_helper: Add a new helper to deal with the writeback
    connector validation
  drm: vkms: Refactor the plane composer to accept new formats
  drm: vkms: Exposes ARGB_1616161616 and adds XRGB_16161616 formats
  drm: vkms: Add support to the RGB565 format

 drivers/gpu/drm/drm_atomic_helper.c   |  47 ++++
 drivers/gpu/drm/vkms/vkms_composer.c  | 329 +++++++++++++++-----------
 drivers/gpu/drm/vkms/vkms_drv.c       |   6 +-
 drivers/gpu/drm/vkms/vkms_drv.h       |  14 +-
 drivers/gpu/drm/vkms/vkms_formats.h   | 252 ++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c     |  17 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |  33 ++-
 include/drm/drm_atomic_helper.h       |   3 +
 8 files changed, 545 insertions(+), 156 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h

-- 
2.30.2

