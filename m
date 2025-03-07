Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6185A56DC4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 17:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0282410EBF9;
	Fri,  7 Mar 2025 16:34:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hyX12LuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 766FC10EBEF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Mar 2025 16:33:59 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-390ec449556so2536937f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Mar 2025 08:33:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741365238; x=1741970038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vm9Bfz6JbIJ378qC0it1HzTk3jXpGGODeE+NgRJA20A=;
 b=hyX12LuGmPM//ThBwY5BWzYNuy2qs0zzphnDUMFzc6Jeo4hJclZMz/gKK/P0xp6o4E
 PzXSDn6wNdX8aCJVdBzNtKBSJgapTezv1YtqUuacSCU7z1YJqiHTWRo10hG+pdKbknxH
 noOxEsAWAi7WXBxmGHDiZ8mBQxgZydQofHh9mgzJU30oO+YExxI5/x7Hoj/CnEEa2A5N
 wp7wlzcjecBy7HGOop1OZOsF5vvFW6U2+T+ao+hhQJzYob5u46DHwhIPJFNi9AvcyuTV
 GYpQC7uRe0apnKpZNG0LvPdM8lwXCgF1c1in2pyS/+Qe/ny1rrJax7cTIzy6PURqLJAS
 +IQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741365238; x=1741970038;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vm9Bfz6JbIJ378qC0it1HzTk3jXpGGODeE+NgRJA20A=;
 b=irS3QuxzL50CgCndo2O8TSCZnJ1SSpZV8whed2+Rm0MRS9z3UdFpzr+6jEPXD6ZHgv
 LwL4UMYlEf2q5WHsk4gAIIBOUXF4j5QA8fQ/Y6oDJV+y+qRCNk+NfBPCCH2wU4LeD5Gd
 BpSCqZskKvG21Iv8x9Ro5ukYfn4Y3JVK8E1MT2HS8rDad8p/ffuylIVn99w1bqpKpalX
 kb1nPtI955J509pSwFgmZ18j44LscTL4htrLP49w4hdE+d4eXFCsMRse0GrodF+wSZ71
 9eJsJzsjnOSvFAanwUxLg6LyxONe9Am/UxEy0OU7+G/9aKitoOLNVA8eU95VfCWkynYW
 AvFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvb2PIQrIq5zM/L9Zghu2DBjDwkCS3q0AYAz5KIlZiTVNKsYg4fs+NVqezYnr4K/VruSSjbAWLTBc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyxcx8gNryyLOf8W4TR0vE1DfXaIpTyuTbZYKRbMoscOhpgNl7J
 PRTUZrlClv9z+2xHPa5uvedqycHfxUu60PRXyH6zuqg/Zeau2cRi
X-Gm-Gg: ASbGncvmp4m+OfQuVlF5PjxQscR5Zcs8Z7UBaGEf+tTak4dP50d3A59DK4wIWuEj04e
 1WnZrCuZQhMxsmAn7j4nLG0OGtAEA09xuU0wMubACOL//XpDYaAwy6hLxr4CRCicnKMZF4W4Kax
 34CubInYQRkz1bxytQThtbr4JLxiXrDdDWFK/g3iE+ezrAj1yt7WLV84oTAHByGp2Jcf6GAZCAQ
 q8in6FNDVHHvIdWBIfjwhWpQAZgLOrS+i6VBJ68reUZN8VM4trw6dDXEzyDOpNY7O6Q364HkTIJ
 Bu7RQ99pcmdfsw+bNHPfpd6/eqPPP31VR6U0qRjNzkv4Su4=
X-Google-Smtp-Source: AGHT+IFbiYvKoYtgwvkhobPihEDJGuAH06BPac2DQev4T6RARv+m5Y3Ur1FW3BdPTHrqS2+nV6i5og==
X-Received: by 2002:a5d:64c7:0:b0:390:e2a3:cb7b with SMTP id
 ffacd0b85a97d-39132da28a0mr3850747f8f.34.1741365237661; 
 Fri, 07 Mar 2025 08:33:57 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c019557sm6031436f8f.50.2025.03.07.08.33.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 08:33:56 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v3 00/16] drm/vkms: Add configfs support
Date: Fri,  7 Mar 2025 17:33:37 +0100
Message-ID: <20250307163353.5896-1-jose.exposito89@gmail.com>
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

This series allow to configure one or more VKMS instances without having
to reload the driver using configfs.

The series is structured in 3 blocks:

  - Patches 1..11: Basic device configuration. For simplicity, I kept the
    available options as minimal as possible.

  - Patches 12 and 13: New option to skip the default device creation and to-do
    cleanup.

  - Patches 14, 15 and 16: Allow to hot-plug and unplug connectors. This is not
    part of the minimal set of options, but I included in this series so it can
    be used as a template/example of how new configurations can be added.

The process of configuring a VKMS device is documented in "vkms.rst".

Finally, the code is thoroughly tested by a collection of IGT tests [1].

Best wishes,
José Expósito

[1] https://lists.freedesktop.org/archives/igt-dev/2025-February/086071.html

Changes in v3:

  - Applied review comments by Louis Chauvet: (thanks!!)
    - Use scoped_guard() instead of guard(mutex)(...)
    - Fix a use-after-free error in the connector hot-plug code
  - Rebased on top of drm-misc-next
  - Link to v2: https://lore.kernel.org/all/20250225175936.7223-1-jose.exposito89@gmail.com/

Changes in v2:

  - Applied review comments by Louis Chauvet:
    - Use guard(mutex)(...) instead of lock/unlock
    - Return -EBUSY when trying to modify a enabled device
    - Move the connector hot-plug related patches to the end
  - Rebased on top of drm-misc-next
  - Link to v1: https://lore.kernel.org/dri-devel/20250218170808.9507-1-jose.exposito89@gmail.com/T/

José Expósito (16):
  drm/vkms: Expose device creation and destruction
  drm/vkms: Add and remove VKMS instances via configfs
  drm/vkms: Allow to configure multiple planes via configfs
  drm/vkms: Allow to configure the plane type via configfs
  drm/vkms: Allow to configure multiple CRTCs via configfs
  drm/vkms: Allow to configure CRTC writeback support via configfs
  drm/vkms: Allow to attach planes and CRTCs via configfs
  drm/vkms: Allow to configure multiple encoders via configfs
  drm/vkms: Allow to attach encoders and CRTCs via configfs
  drm/vkms: Allow to configure multiple connectors via configfs
  drm/vkms: Allow to attach connectors and encoders via configfs
  drm/vkms: Allow to configure the default device creation
  drm/vkms: Remove completed task from the TODO list
  drm/vkms: Allow to configure connector status
  drm/vkms: Allow to update the connector status
  drm/vkms: Allow to configure connector status via configfs

 Documentation/gpu/vkms.rst                    | 100 ++-
 drivers/gpu/drm/vkms/Kconfig                  |   1 +
 drivers/gpu/drm/vkms/Makefile                 |   3 +-
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  24 +
 drivers/gpu/drm/vkms/vkms_config.c            |   8 +-
 drivers/gpu/drm/vkms/vkms_config.h            |  26 +
 drivers/gpu/drm/vkms/vkms_configfs.c          | 833 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h          |   8 +
 drivers/gpu/drm/vkms/vkms_connector.c         |  35 +
 drivers/gpu/drm/vkms/vkms_connector.h         |   9 +
 drivers/gpu/drm/vkms/vkms_drv.c               |  18 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  20 +
 12 files changed, 1072 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h


base-commit: 2c7aafc05c8330be4c5f0092b79843507a5e1023
-- 
2.48.1

