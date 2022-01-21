Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0343849675F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 22:39:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A83D910E427;
	Fri, 21 Jan 2022 21:39:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa2d.google.com (mail-vk1-xa2d.google.com
 [IPv6:2607:f8b0:4864:20::a2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DEC110E43F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 21:38:59 +0000 (UTC)
Received: by mail-vk1-xa2d.google.com with SMTP id w206so6357764vkd.10
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 13:38:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MU5mea1g+3LZHOaaP3xmtDZS1QAz3ARekf00DuplVS0=;
 b=akmfuZyYgaHIFxkZeSh0dxxxZURrv/DTJH/QoUiktBb61m3DXo6/Bf4BqYz3abRdir
 tXpRKm4TeLQjA7ItFLbV9j6jrluhIXkQloiWOtC3srxhCGEe2INisPxCqiJP/n5xKJxM
 Y7ryFOvoI2Bfg+y41yGxIO6uZAspFJeDsJNxAHxKM5m2pBSxV1Sc24lnzKEa4uCud4ZM
 ZFv1x8hj4SMucBEfCklG32Mg7hWZ/SWw2RQ5KWTvUDHrSu9SPLe1Jui1TCytlsBDLTOy
 GajixlJVkze+FQAy3YOlIpUVPJF2byyIsOzge6hfT238r0Re3cafJRPfVaLscXvhH4e8
 al+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MU5mea1g+3LZHOaaP3xmtDZS1QAz3ARekf00DuplVS0=;
 b=gknBFDGmeI+yCBfmE1IvmxBUUzBFGRLtUI2U25XjVdLSyW+37KkObUFiR5GhgrfhD/
 0UBpZIkCpFyEHvrtqE1n34VJwIDEwFYorDNzZhT85RZ+cJbcKVQAvbO6GM5ethy/oYfZ
 Cb3uUFunW3SY3LaCvZUB9eD8Cr5FwWdc6JGSU7GxgBXToVKenhHIp+pEHs0W4yYHFBBO
 zn5CLg03BC9npgjAPMDpdavgtsWZ0kaHfug8ZEX4YcoEf1tqJ88XeTFWs5a1FgYBz1d2
 84Fax0v+v4m3Ih5yoYhi+gad6B0baT5b1+O8eybGbAQlwKNRnL8CnGpLL5xo4kXfsjl5
 l4+Q==
X-Gm-Message-State: AOAM530Saw8Fi1E2+8+BmrAW8e5RFAQez9xV1JS8USFHByqrUuISpYDF
 4J/akNJCAG0k0rMsAlwRKAw=
X-Google-Smtp-Source: ABdhPJzSeKWcrVX9HYFme82nUC/WhwSaNAVYZvKQRN70TynfjqpFy1s1PkpNGaPhWybSa6c1CPw/4A==
X-Received: by 2002:a05:6122:52:: with SMTP id
 q18mr2613533vkn.35.1642801138681; 
 Fri, 21 Jan 2022 13:38:58 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7f4:2d80:9427:7267:dbaf:8ccf])
 by smtp.googlemail.com with ESMTPSA id 29sm1633844vki.25.2022.01.21.13.38.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:38:58 -0800 (PST)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v4 0/9] Add new formats support to vkms
Date: Fri, 21 Jan 2022 18:38:22 -0300
Message-Id: <20220121213831.47229-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, dri-devel@lists.freedesktop.org,
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
Further optimizing the code, now it's running slightly faster than the V2.
And it consumes less memory than the current implementation in the common case
(more detail in the commit message).

Results running the IGT tests `kms_cursor_crc`:

|                             Frametime                                 |
|:---------------:|:---------:|:--------------:|:------------:|:-------:|
|  implmentation  |  Current  |  Per-pixel(V1) | Per-line(V2) |   V3    |
| frametime range |  8~22 ms  |    32~56 ms    |    6~19 ms   | 5~18 ms |
|     Average     |  10.0 ms  |     35.8 ms    |    8.6 ms    |  7.3 ms |

| Memory consumption (output dimensions) |
|:--------------------------------------:|
|       Current      |     This patch    |
|:------------------:|:-----------------:|
|   Width * Heigth   |     2 * Width     |

XRGB to ARGB behavior
=====================
During the development, I decided to always fill the alpha channel of
the output pixel whenever the conversion from a format without an alpha
channel to ARGB16161616 is necessary. Therefore, I ignore the value
received from the XRGB and overwrite the value with 0xFFFF.

---
Igor Torrente (9):
  drm: vkms: Replace the deprecated drm_mode_config_init
  drm: vkms: Alloc the compose frame using vzalloc
  drm: vkms: Replace hardcoded value of `vkms_composer.map` to
    DRM_FORMAT_MAX_PLANES
  drm: vkms: Rename `vkms_composer` to `vkms_frame_info`
  drm: vkms: Add fb information to `vkms_writeback_job`
  drm: drm_atomic_helper: Add a new helper to deal with the writeback
    connector validation
  drm: vkms: Refactor the plane composer to accept new formats
  drm: vkms: Adds XRGB_16161616 and ARGB_1616161616 formats
  drm: vkms: Add support to the RGB565 format

 drivers/gpu/drm/drm_atomic_helper.c   |  39 +++
 drivers/gpu/drm/vkms/Makefile         |   1 +
 drivers/gpu/drm/vkms/vkms_composer.c  | 336 +++++++++++++-------------
 drivers/gpu/drm/vkms/vkms_drv.c       |   6 +-
 drivers/gpu/drm/vkms/vkms_drv.h       |  20 +-
 drivers/gpu/drm/vkms/vkms_formats.c   | 279 +++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.h   |  49 ++++
 drivers/gpu/drm/vkms/vkms_plane.c     |  47 ++--
 drivers/gpu/drm/vkms/vkms_writeback.c |  32 ++-
 include/drm/drm_atomic_helper.h       |   3 +
 10 files changed, 600 insertions(+), 212 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h

-- 
2.30.2

