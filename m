Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAE1423179
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 22:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 742356E454;
	Tue,  5 Oct 2021 20:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822846E454
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 20:17:11 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id d8so340960qtd.5
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Oct 2021 13:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UlaLhBwrKQHqRpficZi+S5MunK5Nu4oR4wDiTqmlmSA=;
 b=KLSOi67/N0aPhbIh7UtgCb+Jvk7gPIC/DiVmq56UAdpq47BIzFMU5A6N54ySFOpKNZ
 auZEEINrxbW1WkX1lqmkau0THaXOnd/oJTwTfszBWg9QokyIjeV1HNl3NQZHWMgeCtjb
 de6dT/5LzzCeIt+e/zohTI+ReOMCAvmbJnuGucC/Yf84lNaT8HAVte5Fgch05Lr6HxCq
 lz+mlHZlVVP5ao/1UcRajxyaAgRzCAb4acmqTvXFxC81Vx8bRbqjuJ4GLbd4DRrh/3GI
 SNLUHeH/t6OMi0bK0EK/PyYPFfmsEj4NsdIkqzoek6cpElwQSaggiEEbsE1/xGfzan99
 1Y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UlaLhBwrKQHqRpficZi+S5MunK5Nu4oR4wDiTqmlmSA=;
 b=UigsY4wmEGMj67gq+QsR94jAkRAPxR8QYZ6e1BX+pf8CazCSNc+g8NbvIhxGmzA0WP
 80KNNyQmNLREjveiPeGtL0mMACn7yD8QQnpXaM86GBj0M13hQ93SHuA4dLZxzDhRRVC+
 7BCYdDonJ3Ix7oQf4MHMfh9NRTtCBe730qYwSPI+bn+doMjJI2bGDZG3QyPtDb7BCrC7
 kE3DKIO0iHM/AUrFs0hPuyN5CwFBl5ujFKn7JIJFZvvm7HRELmosYjowxYW3nDMau9Z4
 rWGVFUtiqsZVr+gmWNvQoRuZ/alu67Mn6XTOZyl/7nkQgQ6vtF66bgk86gL4ybKCgIwe
 Ibmg==
X-Gm-Message-State: AOAM533fCe4jmc20eJImbmHInXOeiM36NSFg4nZ5ki7EkWpekt3CV1+I
 iGNfHMX01dtegseDaIya5/A=
X-Google-Smtp-Source: ABdhPJwfBQvpkZaKoH7otomEjvO/noihg7/lMkBVjw3OrtzjuCIlknrAS2lVamCDfqo0H2SbU4DKCQ==
X-Received: by 2002:ac8:106:: with SMTP id e6mr21742037qtg.406.1633465030560; 
 Tue, 05 Oct 2021 13:17:10 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:125:9b98::1007])
 by smtp.googlemail.com with ESMTPSA id j2sm13056905qta.84.2021.10.05.13.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 13:17:10 -0700 (PDT)
From: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com,
	melissa.srw@gmail.com
Cc: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
Subject: [PATCH 0/6] Refactor the vkms to accept new formats
Date: Tue,  5 Oct 2021 17:16:31 -0300
Message-Id: <20211005201637.58563-1-igormtorrente@gmail.com>
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

New tests passing
-------------------
- pipe-A-cursor-size-change
- pipe-A-cursor-alpha-transparent

Tests and Performance Regressions
-------------------------------------
This pack of tests is failing:
- pipe-A-cursor-*-rapid-movement

This is expected since there are more operations per pixel than before.
And consequently, the compositing is way slower than before.

My micro-profiling shows these ranges to the completion of each
compositing in the .*kms_cursor_crc.* tests:

|      Frametime     |
|:-------:|:--------:|
|  before |   after  |
| 8~20 ms | 32~56 ms |

Hence, further optimizations will be required.

Writeback test
---------------
During the development of this patch series, I discovered that the
writeback-check-output test wasn't filling the plane correctly.

So, currently, this patch series is failing in this test. But I sent a
patch to igt to fix it[1].

XRGB to ARGB behavior
=================
During the development, I decided to always fill the alpha channel of
the output pixel whenever the conversion from a format without an alpha
channel to ARGB16161616 is necessary. Therefore, I ignore the value
received from the XRGB and overwrite the value with 0xFFFF.

My question is, is this behavior acceptable?

[1] https://lists.freedesktop.org/archives/igt-dev/2021-October/036125.html

Igor Matheus Andrade Torrente (6):
  drm: vkms: Replace the deprecated drm_mode_config_init
  drm: vkms: Alloc the compose frame using vzalloc
  drm: vkms: Replace hardcoded value of `vkms_composer.map` to
    DRM_FORMAT_MAX_PLANES
  drm: vkms: Add fb information to `vkms_writeback_job`
  drm: vkms: Prepare `vkms_wb_encoder_atomic_check` to accept multiple
    formats
  drm: vkms: Refactor the plane composer to accept new formats

 drivers/gpu/drm/vkms/vkms_composer.c  | 275 ++++++++++++++------------
 drivers/gpu/drm/vkms/vkms_drv.c       |   5 +-
 drivers/gpu/drm/vkms/vkms_drv.h       |  12 +-
 drivers/gpu/drm/vkms/vkms_formats.h   | 125 ++++++++++++
 drivers/gpu/drm/vkms/vkms_writeback.c |  27 ++-
 5 files changed, 304 insertions(+), 140 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_formats.h

-- 
2.30.2

