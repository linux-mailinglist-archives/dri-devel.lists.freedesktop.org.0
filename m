Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B737A4595BA
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 20:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9006E89CD7;
	Mon, 22 Nov 2021 19:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa31.google.com (mail-vk1-xa31.google.com
 [IPv6:2607:f8b0:4864:20::a31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A72989CD7
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 19:44:15 +0000 (UTC)
Received: by mail-vk1-xa31.google.com with SMTP id e27so8027983vkd.4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 11:44:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RcjUdVm7a+t075NYOBIZorfXysPvu42NNubydVE4e0w=;
 b=FpY1MT3iqpj5hb9OcTbCq0jLYwCwQt7jbBgAxyQuNZh+6ksgb1BgZmXge8MY9k0OKS
 a36yvnly8oQ13f2G9nqA9tISuxDgNsC/yXq5ZADpWr6GeKlKzWP2+7pFvwhkZHfCeStM
 K/zEEy0WlUY3NHnMHKLnSVzPBUX/5z9XZVBXGfP5gxHcOOfcUNlJd9axYl9kT7aYT086
 pGFFTMcs5yG43lGJTBRVoc0VYFvSH9ZfWpuwTXCyW15VrL9Uo2Nk3AR9/Kze0wUgXhHf
 dZ3+3VvMnasa/n1yvyWzuDWUaEzSk+gicW7L3/X19bsfytbwLpieuRbd/sI4BMwZSQDp
 4jAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RcjUdVm7a+t075NYOBIZorfXysPvu42NNubydVE4e0w=;
 b=GY68zdHYROIdDx6aDCJU2MiUoRUisVHSMc5E32YWiSShAh2p0v+BM3VaExvSz0C0y8
 TksD0sFnqA6/3Bi19hRl4uEFiwMpvf4Nx6HWu+0FsmJHvHwtrdL9zgbb08p/0q9OdEqk
 jbusQAXi7TPuwRvyCpQJ1JPwj775zTmaeVA7eFl6r+MsMkN1Dw1qpJ9T+WNyMu87a8Lp
 FegG6X5uPlRZK4LXa0OTrE5WYu4GM9u4jlwoo6fg3B2XJpoqnHwqTQgIIr3Ow0/P5MAT
 sC47u/Yq1GrJ5TfBsWm+FdmmS1XZ/KM6RZ8Jf1xEvVcqzFxyqlaevYFVYFq7w0NhIrYK
 pIxA==
X-Gm-Message-State: AOAM5319dSMVIswGuX1/rJvp81vj6RcW5roaJEdbMrQ5aoH1cqZ5OhSm
 5xDzvmOHiO+vLAM45YRdqaw=
X-Google-Smtp-Source: ABdhPJyhxjta0Iwhcq1CSgYDe+qOx0fA/XYKkGDbwL4lFNxDbfkc5igFNmNB72qArI1jByQIFMJaIw==
X-Received: by 2002:a05:6122:2088:: with SMTP id
 i8mr166002042vkd.5.1637610254071; 
 Mon, 22 Nov 2021 11:44:14 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7f4:3a5b:14e9:b724:f63b:b22b])
 by smtp.googlemail.com with ESMTPSA id i27sm5269373uab.8.2021.11.22.11.44.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 11:44:13 -0800 (PST)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v3 0/9] Add new formats support to vkms
Date: Mon, 22 Nov 2021 16:43:51 -0300
Message-Id: <20211122194400.30836-1-igormtorrente@gmail.com>
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
 dri-devel@lists.freedesktop.org, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
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
 drivers/gpu/drm/vkms/vkms_composer.c  | 351 +++++++++++++-------------
 drivers/gpu/drm/vkms/vkms_drv.c       |   6 +-
 drivers/gpu/drm/vkms/vkms_drv.h       |  20 +-
 drivers/gpu/drm/vkms/vkms_formats.c   | 279 ++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_formats.h   |  49 ++++
 drivers/gpu/drm/vkms/vkms_plane.c     |  47 ++--
 drivers/gpu/drm/vkms/vkms_writeback.c |  32 ++-
 include/drm/drm_atomic_helper.h       |   3 +
 10 files changed, 615 insertions(+), 212 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h

-- 
2.30.2

