Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C6FA37F29
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2025 11:01:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E9B10E3C7;
	Mon, 17 Feb 2025 10:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="iYhRW50x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CFC10E3C2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 10:01:26 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-438a3216fc2so43420935e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Feb 2025 02:01:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739786485; x=1740391285; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mIy5lDsJ49MxGRQnm+gwxhCdPR/hJ20QsVDEZbE4FZI=;
 b=iYhRW50xt1smfVimurEoytvZeJ+ZMja7hYtauI+NoOLT4+C/bc+E9DpAjbGonInoBu
 AeAHL3eQ2sRG7QlsYpSYUC4m9nBSMGHQvWz4hIWou+tLcmS6tKQPb3r+Bt3G5drkt0nC
 T2syQvwkktkKU86ABNpKE/1R4Dht05iD0h2Mk/g7oA5L+0GSBzxJ+TBmIJz6ygGtkv4c
 xvdp/DgPAQF3eBnGUb77CWneertugT+8z6aqbgOBl1n/UBq2obCafvI/KDqaB0ezIfLy
 R6c+vvudRBcUVVaMG72VgECVTbGB5reUMDSzziY8xK87mnK+LBWu70r9qm2gTZN7q60a
 4teg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739786485; x=1740391285;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mIy5lDsJ49MxGRQnm+gwxhCdPR/hJ20QsVDEZbE4FZI=;
 b=bptAq5rCBqUiP+WjlNgDMSxzuypvXLEY7gz+6KOKO7GUWDC5dZ38gy4jc095QFk9HP
 YaSZFS6lhJF3u5Zf5MDxmlQZDvEAnUSCzCp8Et0kH0UhOIFXDVt0ijfjTsF7jm8IOsr1
 wse1Hue4TQfQMEdyUVnhjVHg5c2OXwh+tMd4fLVAfVwKK+E+NuaCWJn7Qxjmvy8rD99t
 5HYKk5vQA4iHGTmLdGMkt6UZEE9aiajKp/aTN9HA4FhxlxP1lsFeM3FSmf/32/JYSXDe
 OLSDTt979RFK0dUgdHW0VkDOTJyrTOLm0X4YtaezDK3vY+lpGG/gkv1SZrqE9hSSK4dW
 j5sQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpfcq1UU2xC1oD/JQyAWXFwoO4Xado7glbjC1FMPu9LfWrA+LbAXvzCj14UxZrPaX6kP+1bhGL0Bs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwR9mly/uRn0lJbGsPv0zQNXCYXm83JMkBuHMUSiiQ5S54DGWPi
 q8oUTLcgNbVw61ZPfnemuV6qvgaPoNcQLwonttFCJLtcAw7lQ6up
X-Gm-Gg: ASbGncvMviKX9snHdw12PgHgOQ6pPWO3R+jxsTiIkj+PpJY5DFbW07RpgOqib1Lj+YU
 2BM/xy/xHP76UDhWrctW5sbgkS/W1S2041VH1gIusKOBKPXdCwbDklPykM3wgWAKu6LV660r2nu
 nT0Bq3dFHO/nQPO7x8DWb7cwh2xEiQNCd+q6HgUmS3E4/4G6+DwWmJXoHoJqELzpT3TIzjP0qwz
 iZ4Q38nCe34zeFFE2UZqc2kJHYA4zG44YKWey5mOEmgETrPCd4Euezm9EtBh5tnEO7Diy2tkSr+
 pbH7U9mttuHcRKxYng==
X-Google-Smtp-Source: AGHT+IGkI0U59QLl1U4yAS+TXnjcW96MHpa8eWRfc6SU7r5dzzmyd315X3nv4Dr2VwmqAo5onTfdsA==
X-Received: by 2002:a05:600c:5254:b0:439:38a1:e49 with SMTP id
 5b1f17b1804b1-4396e6d7c38mr87603515e9.6.1739786484372; 
 Mon, 17 Feb 2025 02:01:24 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f7fe6sm11591901f8f.86.2025.02.17.02.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 02:01:23 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 00/14] drm/vkms: Allow to configure device
Date: Mon, 17 Feb 2025 11:01:06 +0100
Message-ID: <20250217100120.7620-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.48.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

In preparation for ConfigFS support, a flexible way to configure VKMS device(s)
is required.
This series adds the required APIs to create a configuration, the code changes
required to apply it and KUnit test validating the changes.

Louis Chauvet and I are working on ConfigFS support. In this series I tried to
merge his changes [1] with mine [2].
I kept his Signed-off-by to reflect that, even if I show up as the author of
some/most of the patches, this was a joint effort.

I'll send the ConfigFS code [3] and its IGT tests [4] code this week.
Meanwhile, the IGT tests also exercise this series and can be used for
additional test coverage.

Best wishes,
José Expósito

[1] https://patchwork.kernel.org/project/dri-devel/cover/20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com/
[2] https://patchwork.kernel.org/project/dri-devel/cover/20240813105134.17439-1-jose.exposito89@gmail.com/
[3] https://github.com/JoseExposito/linux/commits/patch-vkms-configfs/
[4] https://gitlab.freedesktop.org/jexposit/igt-gpu-tools/-/commits/vkms-configfs

Changes in v3:

  - Applied review comments by Louis Chauvet: (thanks!!)
    - Moved drm_vblank_init(..., vkms_config_get_num_crtcs()) to a different patch
    - Improved error handling in vkms_config_*_attach_*() functions
    - Fixed compilation errors when CONFIG_DRM_VKMS_KUNIT_TEST=m
    - Used for_each iterators in vkms_config_test_default_config(). A leftover
      from the removed connector hot-add code
    - Validated that vkms_config.dev wasn't NULL before calling drm_info()
    - Kept vkms_device.config as a const pointer (at the cost of casting in
      list_count_nodes())
  - Renamed "CONFIG_DRM_VKMS_KUNIT_TESTS" to "CONFIG_DRM_VKMS_KUNIT_TEST" for
    consistency with other options 
  - Rebased on top of drm-misc-next
  - Link to v2: https://lore.kernel.org/all/20250211110912.15409-1-jose.exposito89@gmail.com/

Changes in v2:

  - Applied review comments by Louis Chauvet:
    - Added Co-developped-by tags where required
    - Split the first patch in 2: vkms_connector.h/c creation and struct
      vkms_connector creation
    - Fixes a user after free/double free bug. The bug is already present
      in drm-misc-next and the fix could be merged independently
    - Implemented for_each macros for the config
    - Other naming fixes
  - Link to v1: https://lore.kernel.org/all/20250129110059.12199-1-jose.exposito89@gmail.com/

José Expósito (13):
  drm/vkms: Extract vkms_connector header
  drm/vkms: Create vkms_connector struct
  drm/vkms: Add KUnit test scaffolding
  drm/vkms: Extract vkms_config header
  drm/vkms: Move default_config creation to its own function
  drm/vkms: Set device name from vkms_config
  drm/vkms: Allow to configure multiple planes
  drm/vkms: Allow to configure multiple CRTCs
  drm/vkms: Allow to attach planes and CRTCs
  drm/vkms: Allow to configure multiple encoders
  drm/vkms: Allow to attach encoders and CRTCs
  drm/vkms: Allow to configure multiple connectors
  drm/vkms: Allow to attach connectors and encoders

Louis Chauvet (1):
  drm/vkms: Add a validation function for VKMS configuration

 .clang-format                                 |   7 +
 drivers/gpu/drm/vkms/Kconfig                  |  15 +
 drivers/gpu/drm/vkms/Makefile                 |   5 +-
 drivers/gpu/drm/vkms/tests/.kunitconfig       |   4 +
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 880 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 640 +++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 437 +++++++++
 drivers/gpu/drm/vkms/vkms_connector.c         |  61 ++
 drivers/gpu/drm/vkms/vkms_connector.h         |  26 +
 drivers/gpu/drm/vkms/vkms_drv.c               |  45 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  17 +-
 drivers/gpu/drm/vkms/vkms_output.c            | 176 ++--
 13 files changed, 2175 insertions(+), 141 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_config_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.h

-- 
2.48.1

