Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41546A7D747
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 10:14:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E19E310E31A;
	Mon,  7 Apr 2025 08:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="im0nQUpL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF10110E304
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 08:14:35 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43cfa7e7f54so24871265e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744013674; x=1744618474; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4Pf8NUjGnqVGatUmapm3BD+8BU/EOLUkc9mjZQ1ZC7o=;
 b=im0nQUpL5Ey/naOEbXBzA8fTav1W/4o+Uo6fZksNir1+Oxr3CE3Tu790L0t5I26WLC
 ldvNsDLeq2032M6Xxl9rF1It/7Qbl7zOl7E+8MQQP3UCJj3N1ZnP7SNNFTFLBtolb7we
 WOPUd4mcY9IaV0a7tzpxmV6urCAqmU7E7+v8RPVYsyZrkcPbpO+MGlrwQd+n4ErfRy88
 Cz8SOZxS2HUlHZ867riUI6ij1yDK+xbefqifrIUelH7gZcovFasP2Rw4dfTGKz4jpjRt
 e6eIMlub88rZW+/rrboGS1fvy/ovaNW/MbI2MmF4gJkecCJ2tZ4tNgJ5QJzy87i1C7pX
 xtNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744013674; x=1744618474;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4Pf8NUjGnqVGatUmapm3BD+8BU/EOLUkc9mjZQ1ZC7o=;
 b=e/zB5X3O66WZ41mzsf70QfvLDBdA6fC1Hjp+K9nj8W4s9IRJYfOUM3+JscEkklN9js
 97/JJ18PQOzg/MYAnuTxfw4hdnWoeJxVJGUd+WTRrSFkTAHKReQ+Q9nN+BgM61DbdjRI
 aVRceE7AeDdJpVyu6cU0q7EzA0UN9XntwD68Tn73m9aoWjlVI9qLVLuQGnaDUQQERzmu
 0xaz4iZPEk3gZTFz/KeJddaSG0vrYEGw0iaVBoDdJv5kwFbDABoeieBBrXgQz1Xztbab
 XiU6BX8me9RglCQvrHSio/gZRyxEBTU20Pnthf1LqgJD1oeMNpICGzxoNe94mKxEVdH/
 jpjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUL2Saf9PZFF0RiZFK+NqbEC5/7KPDHbYUz4fcELbVQgXAZuAt+d9O80tgvNsbYJkqgqdRbHptpvJA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw3/8bbLNDcR2bykprL5wMruwWn0B8Ga0SX+31meEzEhIfObh1X
 Kj8tZqRwcw/IElWtDhZ8CLshFh8h48tGQbCcrYfs1euwuzw2axk5
X-Gm-Gg: ASbGnct7EVk32pbkrRXCFFKVf1/myIcd6PAg3j1TZMc6NP8RQz37bCUf7NenR2OF0Fi
 gEofDU8ZXUNzLh2nHtq5DuoO1Fj2VoGoGyEGHBHhI7HFeBs07QqlpJbc2Z1rQHkzIniOUyqAWDx
 QxOh+qQdJYaI+6PC+13pXTGysnfihZ6gwP8I1k9zY02xGbwiWlJiqfz4hYET/SD91IcIM0WUQCc
 YB4Cp6Zao/pF+M/vodJaN15gR5Pr50KVvr7kbihAf2oD4hQiiqSODFaTqNRiKIejFdfpbsXK0Vm
 J54dcB/wDiYR5Agl4B8CxfNk1Kx05WdVbTG6+UhiH+MoTbxmA0fWAcQ=
X-Google-Smtp-Source: AGHT+IFz2xl2mGOrFkHw5DfgJ09rmaMGfWiocFIlbYVszkx7ym+0QWe5dbfXxa9cPr8TQ61gM8fWjQ==
X-Received: by 2002:a05:600c:3587:b0:439:8490:d1e5 with SMTP id
 5b1f17b1804b1-43ebee8dc60mr129865255e9.4.1744013673994; 
 Mon, 07 Apr 2025 01:14:33 -0700 (PDT)
Received: from fedora.. ([94.73.34.87]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec16a3aefsm125473445e9.21.2025.04.07.01.14.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 01:14:33 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v4 00/16] drm/vkms: Add configfs support
Date: Mon,  7 Apr 2025 10:14:09 +0200
Message-ID: <20250407081425.6420-1-jose.exposito89@gmail.com>
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

Changes in v4:

  - Since Louis and I worked on this together, set him as the author of some of
    the patches and me as co-developed-by to reflect this joint effort.
  - Rebased on top of drm-misc-next
  - Link to v3: https://lore.kernel.org/all/20250307163353.5896-1-jose.exposito89@gmail.com/

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

José Expósito (6):
  drm/vkms: Expose device creation and destruction
  drm/vkms: Allow to configure the default device creation
  drm/vkms: Remove completed task from the TODO list
  drm/vkms: Allow to configure connector status
  drm/vkms: Allow to update the connector status
  drm/vkms: Allow to configure connector status via configfs

Louis Chauvet (10):
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


base-commit: dd717762761807452ca25634652e180a80349cd8
-- 
2.48.1

