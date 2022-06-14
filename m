Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1405B54A2FD
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jun 2022 02:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE80B10FD0A;
	Tue, 14 Jun 2022 00:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E0B10FD0B
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jun 2022 00:02:33 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1011df6971aso8087879fac.1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 17:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+rqz24wvgwjDX6APc4suK/v1RubQejuzIiKc6b9laMY=;
 b=e3Q29PJpOF8Aurc2EKg6QLXjSrMe3LerZYtEDhvO5ba0+gDoxPN0adEwcsuMIjf/oa
 wgLjah/L3pGshQjhxcxhA39S7fG0T1PaGZ5aX2EPc5sS8jFQCO0tYwNh5m+FmvRwjkIx
 sR82zIFVOROcN3/nZ47fngl/Y9qYmSkbbJIMtRHx0G+CQA20kxx3x6x9lZW5dYKEEVZW
 KRtFnrkZY1SjIRrzptvXuHj2SXBvGpndCsNHYmhtXKkHE0vil9dSz6TLioJcRd/Jbqor
 mlqcnRgsAmLKBhAXrRXGHo1zEIr7+B9srRdTQzg7iOa8EtZ7Cjoo9ffKUC4aSdER5NPv
 ADQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+rqz24wvgwjDX6APc4suK/v1RubQejuzIiKc6b9laMY=;
 b=iENgC5e0usBOnswUXj9hq3YSxWGO0mtktSbZBmiDdatO1A/G46yDBI5ccBEw7JFslE
 UbuPDdlHHPtWKiwb4WPsC2P8UQV63QCdCGyb+kjU3lNuEhei2Kwj5i4haeAefjHkOrOC
 sDEKnJb2A4yrjqPTAUjddcVEIIRWI2jWOqK1tLbZ9s7h809jNl+pK8vAZZ+F1C2mXNBz
 z1nqgnb9e54FanxyCiH0MvACRPJ5yY9ApmHqZxMb22HoiHlHUeiMromW9ef3woKWB3kX
 QN/5HJgW+xAGJb2AbTm1cUOWhtxRkNj81DKT6n2YWiElQ+lXgtWA0UZJcZqige49cMEh
 yOPw==
X-Gm-Message-State: AJIora9fvi3hvRnUwwvS/scCgurNcfL3HWVmff1Aa487ZWisPwjWdT5P
 gerPT4zTIfYAufS0wQzZHT5MFwnK/E8=
X-Google-Smtp-Source: AGRyM1sNbdqXe/EEz6wy1tmM1FDOh+oJN/51uCv0XoD21US2XK9K6S9//CCRycBQbdiDGBFxf7mHDw==
X-Received: by 2002:a05:6870:58a3:b0:fe:109b:d9ae with SMTP id
 be35-20020a05687058a300b000fe109bd9aemr799467oab.246.1655164953154; 
 Mon, 13 Jun 2022 17:02:33 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f5:a472:4c3:87f9:70d2:df2e])
 by smtp.googlemail.com with ESMTPSA id
 y23-20020a056808061700b0032b99637366sm3831232oih.25.2022.06.13.17.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 17:02:32 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v6 0/9] Add new formats support to vkms
Date: Mon, 13 Jun 2022 21:02:17 -0300
Message-Id: <20220614000226.93297-1-igormtorrente@gmail.com>
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
 drivers/gpu/drm/vkms/vkms_formats.c   | 300 ++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.h   |  12 +
 drivers/gpu/drm/vkms/vkms_plane.c     |  50 ++--
 drivers/gpu/drm/vkms/vkms_writeback.c |  39 +++-
 include/drm/drm_atomic_helper.h       |   3 +
 10 files changed, 584 insertions(+), 220 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h

-- 
2.30.2

