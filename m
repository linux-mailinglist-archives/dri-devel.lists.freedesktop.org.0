Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EEAA44938
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803B510E781;
	Tue, 25 Feb 2025 17:59:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AaMbHtvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D490A10E4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:59:41 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4398e3dfc66so52116015e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 09:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506380; x=1741111180; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IlOTh4h5umgfceAsa2lYGRUvci2slvisxc9CBcNpu8A=;
 b=AaMbHtvcq2WQK5C/rb6QcqdpjEu/zYeHz2EPFgjE4pRtNaYiYeLYecoLb8kWuxobIQ
 mZ9TjTWZ9Ymx06CJMoZrLc6V4wFvF/pIaWkSGCLmkxpIiRJU/u/5SGaQ6Aa34gmJ28gd
 GQ16vXo49UFz2U5ZQCnHJ3aw2Cs+sgPMCB1M/tElPRZxqLrcn+JGGRVy2MMMV5F4SnUp
 7WXpULPtva8dDKo9B+YV6YbU/XVBeJznNqZGfBF5GymwOSrQl4kgw7g/zwCiH99YF6fd
 nWXB5pp5CxvDHmZ8SNSnxJvpQ6kElkeidTTXxniR6gOXODeUmjr8mp+ejuRQBkMhwfZK
 zPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506380; x=1741111180;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IlOTh4h5umgfceAsa2lYGRUvci2slvisxc9CBcNpu8A=;
 b=ZXUHtGCfyvg3tI/392sOESOwVPrg8kWzDT1WYJSf1HcmPUOUhzIw0cpsc91ZdIg3ev
 TH51XZWaozr3N/eCcPmt6za/0ZSxWZcDGv1IxI2nnFLP2SbssBep8aCG4dg/xUPuTSHQ
 RScCrrxagoVvypUaNqq5leRl05TLp3vSAobGUCuvRbcYDpao2i8Kdpkjfh3+UBcd8I9a
 B2H242IhLvGPr2nZoHzvXi6Lp04is5dR9LlWcmxKj1RvGr5V0nIAlKM+euIXFA8vvQeH
 CMDDs8COkIY0KNRdzVkhpMWEAXmoFbdlBC6atUJKmXlwqZieiCfW+2Tjw8lqYz/nYBTb
 IjVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPfEJVVAvBpy0q7POH8QU5OQnxF7KUe/kxrin7XAFw6jG8NcC4YIkuMKthb7qWvSZ76u5lM5iM+H0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRq5/uM6V9WViiF6Rb1Flqf5dIgZXEwKdu9mYS9KViMsUDf43T
 TnX39r8kKyBRVFRKMLCc0rNOpyJcHW5wnPuc1IrEXsdQFKhWBHA0
X-Gm-Gg: ASbGncuYbBqNihOAsUewKsM2/zBBKLOplPktO2Lp8xWnBI4gCyHjIMu4lFRhErAOaM5
 hNlnIChkL1RNmfNhpEnF1tgbUulaEn0X/rG2OoI61uRsf+lNdlZmBEficHOjdV7kDwx0Rwndm7w
 XGhaaaKFrSm5Q4tiA48kI9bnf47CNAOkGFUfYxzXQS049CieO2GQX0Q/RU8znn8aQkN4NndvRaF
 DvyU1P12Upf5UwsaOdsGn44xx6gshqnAIoZIOhvyS6Q73kffrLn03b7YBAToK5OuGjWyag4KUhJ
 EbZyNKgop7JVG0uiZD4iCd+rP63e
X-Google-Smtp-Source: AGHT+IGuSG3h6hJ/vOasWsVyZxPpD2r1u0MXUGz76IbPsnd7FNLvlfpPyt2hgkVddWuEr6cU5pi9tQ==
X-Received: by 2002:a05:600c:190e:b0:439:689b:99eb with SMTP id
 5b1f17b1804b1-43ab8fd8768mr4629045e9.7.1740506380040; 
 Tue, 25 Feb 2025 09:59:40 -0800 (PST)
Received: from fedora.. ([213.94.27.232]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-439b02f3e15sm149063655e9.22.2025.02.25.09.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 09:59:39 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v2 00/16] drm/vkms: Add configfs support
Date: Tue, 25 Feb 2025 18:59:20 +0100
Message-ID: <20250225175936.7223-1-jose.exposito89@gmail.com>
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

This series, to be applied on top of [1], allow to configure one or more VKMS
instances without having to reload the driver using configfs.

The series is structured in 3 blocks:

  - Patches 1..11: Basic device configuration. For simplicity, I kept the
    available options as minimal as possible.

  - Patches 12 and 13: New option to skip the default device creation and to-do
    cleanup.

  - Patches 14, 15 and 16: Allow to hot-plug and unplug connectors. This is not
    part of the minimal set of options, but I included in this series so it can
    be used as a template/example of how new configurations can be added.

The process of configuring a VKMS device is documented in "vkms.rst".

Finally, the code is thoroughly tested by a collection of IGT tests [2].

Best wishes,
José Expósito

[1] https://lore.kernel.org/all/20250218101214.5790-1-jose.exposito89@gmail.com/
[2] https://lists.freedesktop.org/archives/igt-dev/2025-February/086071.html

Changes in v2:

  - Applied review comments by Louis Chauvet: (thanks!!)
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
 drivers/gpu/drm/vkms/vkms_configfs.c          | 807 ++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h          |   8 +
 drivers/gpu/drm/vkms/vkms_connector.c         |  26 +-
 drivers/gpu/drm/vkms/vkms_connector.h         |  18 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |  18 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  20 +
 drivers/gpu/drm/vkms/vkms_output.c            |   2 +-
 13 files changed, 1045 insertions(+), 16 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
 create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h


base-commit: 130377304ed09e54ff35a8974372498aad7059f3
prerequisite-patch-id: 1bff7bbc4ef0e29266265ac3dc009011c046f745
prerequisite-patch-id: 74a284d40a426a0038a7054068192238f7658187
prerequisite-patch-id: c3e34e88ad6a0acf7d9ded0cdb4745a87cf6fd82
prerequisite-patch-id: 9cd0dfaf8e21a811edbe5a2da7185b6f9055d42d
prerequisite-patch-id: f50c41578b639370a5d610af6f25c2077321a886
prerequisite-patch-id: 5a7219a51e42de002b8dbf94ec8af96320043489
prerequisite-patch-id: 67ea5d4e21b4ce4acbd6fc3ce83017f55811c49b
prerequisite-patch-id: 37a7fab113a32581f053c09f45efb137afd75a1b
prerequisite-patch-id: 475bcdc6267f4b02fb1bb2379145529c33684e4f
prerequisite-patch-id: d3114f0b3da3d8b5ad64692df761f1cf42fbdf12
prerequisite-patch-id: d1d9280fb056130df2050a09b7ea7e7ddde007c5
prerequisite-patch-id: 2c370f3de6d227fa8881212207978cce7bbb18ba
prerequisite-patch-id: 938b8fe5437e5f7bc22bffc55ae249a27d399d66
prerequisite-patch-id: ab0a510994fbe9985dc46a3d35e6d0574ddbb633
-- 
2.48.1

