Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E84A39854
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 11:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDEB10E64F;
	Tue, 18 Feb 2025 10:12:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FGyEiC1L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6739010E64F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 10:12:22 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so35897815e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 02:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739873541; x=1740478341; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KzaKelF6ewY20dvSvB6oxOqjssEbsRd1FkO3vSloUVY=;
 b=FGyEiC1LvFgloPcr3fgMbMYVczf7wCTZvCY/HBQOWR69GS9Qf4+bNTbvcNZVXvLBRq
 BI8yfesBmdIyoc9Y2XeIs65WPWy8shAK9dQ4QiygjUJ1yA+hq6AMVFFX+uwIWkfMMVQR
 UL+SqwBOnyiDj9DlHdRankr0E+/7bs8D3q+8Bd9kE0me8KeWGzL0mIvsHHGdBTzFzuPR
 LWSv92DBvjw0QnjxsnfglyaPzscTzpVg81n8t+2iXMKEOEgiQbHEYq8GYRb7BbXl2bHk
 kJxPRSpVqmPsGIweBs7eqyPch7ChxWokQZeDsk5bfrwSRalXnUJ1gc90fF+gdeLLoQeH
 JEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739873541; x=1740478341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KzaKelF6ewY20dvSvB6oxOqjssEbsRd1FkO3vSloUVY=;
 b=pGvPVTOJySul0E85WfUCNYzdhEYrg4EbUxblizGipYFiQUH2hwmZkQF73ftgfZVpZx
 Wd6IUd3SyotcCgpn+uLI10ALntkA13GK4192p7xk1lIWs8Yxk5Y1Jl8Pu5Oi+8fMy5AP
 tse+00y/uIwd4612YkUqVpRbe14EhvQxJaVj7NhK596JFymabQAWqpdr09QB3b8FN/0E
 Mw0W3P30CyOj4ffpeTT/Jac36o71aEZOCG12bVfB3veqavxlzojLt84L1OL3UILYfB9t
 5k5pbvNSF0EBChZvcOloAq+MV5/9cCUrmvQZl7Ei4fsu2LKD4JxqRm63+/UiYMPZwpVl
 7kyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRAmlHVgrO80ZCLMLqIYsGD525WEZZAvTLzEWY6eC1LPqXiigoU6ljLMhZ4yVE0IrtN67VsNdlvF4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw55tqo9r8E/Zt8Y1ssZ+w9WPXtAU9HbhzsuCK3Y/0QfLuAQyqj
 enzGLoZz2O27MIfusmQiYmjLbL0J+e86vu3aU34kiQEZpsnxXWpg
X-Gm-Gg: ASbGncvHeiYuh+VLvTtEBnekxjilfNqO8zNPxIyv0IV7sqM4SiwyvZ8dX1p8XGAufXX
 +EaVWEwHpureVE8vZBgNLN+TWIKa8JkT9+j2KgVdUcgx3ZQrebzaVK2gRZe69ricvQT13zroWH4
 22N9VmSWDbLf0tSNPuEqmdLBrTOzyOoiB+rhUBn3a9AwIt9YBjfTX8coVmbztdNOBJFn8njxQsu
 vwod6hLQ2Cw/pFjJEuEtKwBnAtOVUwaM5t5Ir5yRLlpko0s1HC1zB7qtoJhMs+05PmeBvZjjGp1
 cA9k/PBicm44Uk8hUA==
X-Google-Smtp-Source: AGHT+IFJqmlOPYv2whyB9uTyDtXAvBkom7xqtQiVURYwPLVKMA7Zw2zRcC9D9kSP1CEZrAymwwKzqg==
X-Received: by 2002:a5d:64e6:0:b0:38d:d946:db15 with SMTP id
 ffacd0b85a97d-38f33f1186cmr13193513f8f.5.1739873540759; 
 Tue, 18 Feb 2025 02:12:20 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e92sm14749720f8f.66.2025.02.18.02.12.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2025 02:12:20 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 00/14] drm/vkms: Allow to configure device
Date: Tue, 18 Feb 2025 11:12:00 +0100
Message-ID: <20250218101214.5790-1-jose.exposito89@gmail.com>
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

Changes in v4:

  - Applied review comments by Louis Chauvet: (thanks!!)
    - Do not access "private" struct fields in tests
    - Reviewed-by in all patches
  - Rebased on top of drm-misc-next
  - Link to v3: https://lore.kernel.org/dri-devel/20250217100120.7620-1-jose.exposito89@gmail.com/T/

Changes in v3:

  - Applied review comments by Louis Chauvet:
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
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 951 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 640 ++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 437 ++++++++
 drivers/gpu/drm/vkms/vkms_connector.c         |  61 ++
 drivers/gpu/drm/vkms/vkms_connector.h         |  26 +
 drivers/gpu/drm/vkms/vkms_drv.c               |  45 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  17 +-
 drivers/gpu/drm/vkms/vkms_output.c            | 176 ++--
 13 files changed, 2246 insertions(+), 141 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_config_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.h

-- 
2.48.1

