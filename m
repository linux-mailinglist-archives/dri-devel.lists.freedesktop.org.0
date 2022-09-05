Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945315AD95E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 21:08:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CCAB10E424;
	Mon,  5 Sep 2022 19:08:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B994110E424
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 19:08:28 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-12243fcaa67so23253483fac.8
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 12:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=cN11lDYcII9y2vkdG+M4qyXwCR6ShkyGgsWlXiCsYDA=;
 b=Q844OuzO07SpziuIYf5jdgkErIZyUmR8A23Q5CgFPXFBvkMP+ksuTRlY7pkefog5vk
 F9fIHd30hCzcM8ePhgoU6AKPY7LN3xiMTkznJjUQjZVSo54FtkrO3MdwOfnRYr1FAUhC
 Nnq8xMt2HopEX2VMwi8GVpF9a9CSVbnYz+OHqdgJ3eWGIawks0AaN5ny7Mg7T5QhJ0lO
 VzxC799NTL8TXStyot8D5SmH//Xs2+gDHYiTQ64InhVcmF1B3tDr/NbiZdorcMJPdRS7
 LDtIebn+5gdlqQ64+H6chhx0LShaf3SAFEiTFVAN1ToKlmzFM/8ebnESdY6EvmrKlEKT
 N77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=cN11lDYcII9y2vkdG+M4qyXwCR6ShkyGgsWlXiCsYDA=;
 b=jM1LXy6bRBPlYZlaBiKGMAfwybdOud7TyHd3DhaT5fJKl2OzP90ODaChJBYFqaMHSu
 gotvfQkMsmT67QZ2EmzSUvPZtPYbNBJhFopuYXEbaSdYPapbSLr/5ru7/R63yimxzPVv
 LMPtDCfPUcW58FfY9BgX29FF2251jlUXVnmqAgT+URxPmyI4OcJxSPuqjR9nqk5YiaPf
 E7G9ZFE5qRXunDqyiNJho15VBNLSVvcDHsPsvVxatcJNhp8Mu49GWRhT9n29R8eEuEB1
 mh7CLr9iU0RY5QPtYnNHz/kp3HJoKPkkgL1q4cURKYta5eF4VLe0IbBkNU9RYXGBt8ku
 KzbA==
X-Gm-Message-State: ACgBeo2MFf8UX97R1QL030pDSPbIdP5bUlcOmkDK9O/4FwGaqqiVldnt
 rKHhOHR+O7cP/4Ko1aZ/r+A=
X-Google-Smtp-Source: AA6agR4pNi7IEjpugNRY69naSWXMlBWyKKetP/0nEHO66WuSPjOG/L7T2XaH85SLEOqsvAImx0Fb3Q==
X-Received: by 2002:a05:6870:961d:b0:10d:7606:b212 with SMTP id
 d29-20020a056870961d00b0010d7606b212mr9543861oaq.166.1662404907859; 
 Mon, 05 Sep 2022 12:08:27 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:21c0:3f1:e4fc:3866:255e])
 by smtp.googlemail.com with ESMTPSA id
 z6-20020a4a9846000000b0044b61af8816sm3328465ooi.41.2022.09.05.12.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 12:08:27 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v7 0/9] Add new formats support to vkms
Date: Mon,  5 Sep 2022 16:08:02 -0300
Message-Id: <20220905190811.25024-1-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Alpha channel output for XRGB formats
=====================================
There's still an open question about which value the writeback alpha channel
should be for XRGB formats.
The current igt test implementation is expecting the channel to not be change.
But it's not entirely clear if this should be the behavior followed by vkms
(or any other driver).

Open issue: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/118
---
Igor Torrente (9):
  drm: vkms: Replace hardcoded value of `vkms_composer.map` to
    DRM_FORMAT_MAX_PLANES
  drm: vkms: Rename `vkms_composer` to `vkms_frame_info`
  drm: drm_atomic_helper: Add a new helper to deal with the writeback
    connector validation
  drm: vkms: get the reference to `drm_framebuffer` instead if coping it
  drm: vkms: Add fb information to `vkms_writeback_job`
  drm: vkms: Refactor the plane composer to accept new formats
  drm: vkms: Supports to the case where primary plane doesn't match the
    CRTC
  drm: vkms: Adds XRGB_16161616 and ARGB_1616161616 formats
  drm: vkms: Add support to the RGB565 format

 Documentation/gpu/vkms.rst            |   7 +-
 drivers/gpu/drm/drm_atomic_helper.c   |  39 ++++
 drivers/gpu/drm/vkms/Makefile         |   1 +
 drivers/gpu/drm/vkms/vkms_composer.c  | 314 ++++++++++++--------------
 drivers/gpu/drm/vkms/vkms_drv.h       |  33 ++-
 drivers/gpu/drm/vkms/vkms_formats.c   | 302 +++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.h   |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c     |  50 ++--
 drivers/gpu/drm/vkms/vkms_writeback.c |  39 +++-
 include/drm/drm_atomic_helper.h       |   3 +
 10 files changed, 580 insertions(+), 220 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h

-- 
2.30.2

