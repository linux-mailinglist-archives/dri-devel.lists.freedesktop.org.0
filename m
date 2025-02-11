Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F61CA3096F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 12:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A15810E661;
	Tue, 11 Feb 2025 11:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="luoCf+8Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ACAA10E661
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 11:09:18 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-43690d4605dso36806375e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 03:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739272156; x=1739876956; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=L7gqXwFpCNctPSEOM96giwgtciAwtvgEJKRMz2rTR+E=;
 b=luoCf+8QW9YarVH3c7IdEa+UoH26KKLHdSoiy1pgj/2fG4FbRvMa0Obiaqjx5AgQU6
 92La9J7S1Y7JEVzR7PqCxg8sgpL6ga4BnQa7FukM0lcoEnLg+CtEBRMjAFJYzr8Fifbs
 ZTWPXhJdX6rV23pEl2OlWEgG+VpFbek35k0I119Fsd7P5KKIlY2qw9CsBfVn+LIsLGHu
 ETbGXk52e0hXXxEL2LI7RCcFB5hJ7Su5l6GU/lm9qRLdRzllmeCylqL36L6wwDHeRQTJ
 jOECSMKyZBP2OIt7zGRJ2CqtH95RSxSPS2oLZtF0EeP/QnZJMvvBcTG6Ap4sLwioV462
 N33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739272156; x=1739876956;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=L7gqXwFpCNctPSEOM96giwgtciAwtvgEJKRMz2rTR+E=;
 b=q6SeZEi/R6c6g3F3su1kCt6s3ZzVZBZxZayMeHaaKGBHO4vu7UvVpeRecS56vZvj3P
 uXfz/MVJpwOCUU85BsQ70JJOpXWsPl8OqMHqip6xfE8Ul1Be/M7T9Fb4Osf5Y9NNJx5w
 LRw7/LvEMY6+S2j3MrSARejurG+ZOcoKnYRByTutYznC42OSoXo4M6ZwJLzQowUMJhV5
 EudFgbl102SlBRh3aHt401ZK2DCEUX+HzVOmNZCd3nzkpiFKYUukvM6itciKvA+ZnsAK
 8CSirU6qCVhkV6VNgPQVtdCbIZ6/3AlnC2WzgOTSoZtGV5NIwdU8q73Zo14mSwwNfrRl
 Pobg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqQomOvFACuvKLbdIFZ2GtJKK+yFKCig16HDyk2Th7Bswn0HnBAeFeh5fRzOn06y45WvmbRWRb4ks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoHQHBybI/nccFQvO/SMpcoc53kDMiuhH0l8ZVbn6RnSkImBYw
 zlM6+002a7nuu8ENBoOS0H6vAu6HIfUQOAE80iTR94kJov+8xV4G
X-Gm-Gg: ASbGncvwWsHNyiyhNI+28+om7NvX+vd+RhJ0auGv4f0ciEkdcvzsAnhhcVHn6QDN7ll
 dEZ3Mmlg8CtSwDGW6wf6kleNIyibFpiKge/CzniT99p4v9avLmlqtlXJOuFnuVBIK8EVlw0B4zG
 PmeCzaeJ9ZaDwsjnugJRty1FHpHg9kG+pWofhvsjl+Nmuv4iaUnQPCouhIAebB1ikII0kZs0YtX
 Y4B8qeSRn/BRp4YtUw1p5SCR3rrjFz3/uB6erwtFADMZMuQiQ5etDCFL6ztCjAL+OWXV9xFVTZZ
 RuLwDya0POyE3/b7
X-Google-Smtp-Source: AGHT+IGxj+LY906+b+jBD9ED1pIzZ4XZPBrIxsZ3vcLaKH41Lg/0iLIs28BLCjkeSbAulKYs+0wHfQ==
X-Received: by 2002:a05:600c:458e:b0:434:9f81:76d5 with SMTP id
 5b1f17b1804b1-439249abc43mr133180365e9.22.1739272156190; 
 Tue, 11 Feb 2025 03:09:16 -0800 (PST)
Received: from fedora.. ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dcb55b7a5sm11814417f8f.14.2025.02.11.03.09.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2025 03:09:15 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 00/15] drm/vkms: Allow to configure device
Date: Tue, 11 Feb 2025 12:08:57 +0100
Message-ID: <20250211110912.15409-1-jose.exposito89@gmail.com>
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

I'll send the the ConfigFS code [3] and its IGT tests [4] code this or next week.
Meanwhile, the IGT tests also exercise this series and can be used for additional
test coverage.

Best wishes,
José Expósito

[1] https://patchwork.kernel.org/project/dri-devel/cover/20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com/
[2] https://patchwork.kernel.org/project/dri-devel/cover/20240813105134.17439-1-jose.exposito89@gmail.com/
[3] https://github.com/JoseExposito/linux/commits/patch-vkms-configfs/
[4] https://gitlab.freedesktop.org/jexposit/igt-gpu-tools/-/commits/vkms-configfs

Changes in v2:

  - Applied review comments by Louis Chauvet (thanks!!):
    - Added Co-developped-by tags where required
    - Split the first patch in 2: vkms_connector.h/c creation and struct
      vkms_connector creation
    - Fixes a user after free/double free bug. The bug is already present
      in drm-misc-next and the fix could be merged independently
    - Implemented for_each macros for the config
    - Other naming fixes
  - Link to v1: https://lore.kernel.org/all/20250129110059.12199-1-jose.exposito89@gmail.com/

José Expósito (14):
  drm/vkms: Fix use after free and double free on init error
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
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 826 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 606 +++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 429 +++++++++
 drivers/gpu/drm/vkms/vkms_connector.c         |  61 ++
 drivers/gpu/drm/vkms/vkms_connector.h         |  26 +
 drivers/gpu/drm/vkms/vkms_drv.c               |  60 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  19 +-
 drivers/gpu/drm/vkms/vkms_output.c            | 176 ++--
 13 files changed, 2089 insertions(+), 148 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/tests/.kunitconfig
 create mode 100644 drivers/gpu/drm/vkms/tests/Makefile
 create mode 100644 drivers/gpu/drm/vkms/tests/vkms_config_test.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_config.h
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_connector.h

-- 
2.48.1

