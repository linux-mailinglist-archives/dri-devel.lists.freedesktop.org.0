Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF19759A540
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 20:24:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB8610E6BD;
	Fri, 19 Aug 2022 18:24:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3377C10E289
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 18:24:20 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id by8so2078986uab.12
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 11:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=zqJqltuornBaugNI0Wa8tq6gFJexRF53uUg3dh2im0E=;
 b=GNzeHEFbjBoa7ihCNCGpFUo+ct5dZJvQVvRh+fk5ZIixCGOIrsl6KauadcE2Cb9mcc
 IF13puycfF4iDkrRsOsaGJdAEeF1zgYrwNSicv1hnvQWy7EeqqjFqj9NssYUO4P14H5a
 5a3Z/2Hd7IE2YHcfcjKBUKjpM8AH7oMvAI3lJKy0x0xoJ917N7AEoTCY3b/Sd3BPntrV
 FpEzx4thqGfg1BvJh7DqRuu1Vt2WB+Dh+IHAGpWG62uK11XuoYHvwkUbvKMCzKgPHbOM
 jn9bM7YAhduYh94loiovcG+DPTH3J3SjH2zR1rLQ6veo/sCvjSVHNXLn7b3zRSlXRv1I
 7Q4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=zqJqltuornBaugNI0Wa8tq6gFJexRF53uUg3dh2im0E=;
 b=SMt4jKaJcPTvbSDxWDEqeYrs8ErTj81JQeKayfv5QkcPcaGfkGwklKzUihYwsTZtXe
 0vAKUbd/k2dQB/FEdtxsRBtdhnVIgNbt4Rub43H9KrexmadfKFFdqJNMwIyo5Foq4mJz
 vAo9yzRXV8h0jPaR3/koB6eBV6fVOm2JtmXeG2Rwj0OwLAEV8n3Eq6//E9oklkUvaI0+
 ysDrqAaSGYEfwMMHWgUj3SbLciR/sVUflwzCTDvJWyKdI7+3yTPM/3jsb0fYxLGNxrm5
 Xj+18gl1mbsmRzhnlaiqz74Lbw1b5sekgbdaIs4d6ehVDxCjl5QIUwkyyp2b0Zfz2m6R
 QHOA==
X-Gm-Message-State: ACgBeo0wBycDpigQH8+qKJAvyuCuWqQEPuiag317lc/y7zhVdp8yIidJ
 7SVxwvEhTAQv6gAmjeIKjQ0=
X-Google-Smtp-Source: AA6agR6Kx6L0QOnAgM8ZEeZo9Uqm8eN8BW4HsGsyktlgtPQTbYZig1yGOeX9qBHapEwWjGDk2TEBlw==
X-Received: by 2002:ab0:200d:0:b0:395:78d2:51e5 with SMTP id
 v13-20020ab0200d000000b0039578d251e5mr3528595uak.102.1660933459153; 
 Fri, 19 Aug 2022 11:24:19 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f5:da86:e8a2:466a:a971:9305])
 by smtp.googlemail.com with ESMTPSA id
 i22-20020a67fa16000000b003901ef5d148sm1990349vsq.6.2022.08.19.11.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 11:24:18 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [RESEND v6 0/9] Add new formats support to vkms
Date: Fri, 19 Aug 2022 15:24:02 -0300
Message-Id: <20220819182411.20246-1-igormtorrente@gmail.com>
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
 drivers/gpu/drm/vkms/vkms_drv.h       |  39 +++-
 drivers/gpu/drm/vkms/vkms_formats.c   | 302 +++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.h   |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c     |  50 ++--
 drivers/gpu/drm/vkms/vkms_writeback.c |  39 +++-
 include/drm/drm_atomic_helper.h       |   3 +
 10 files changed, 586 insertions(+), 220 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h

-- 
2.30.2

