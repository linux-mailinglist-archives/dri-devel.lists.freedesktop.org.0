Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 880C6BE4EED
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 19:56:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC4E10E310;
	Thu, 16 Oct 2025 17:56:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="beC2w0eY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2523510E310
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 17:56:43 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-47112edf9f7so5674285e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 10:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760637402; x=1761242202; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8hqkh+fjkB3fz9DwOW6jO474uGX1QhhcgWpwE4pXOXQ=;
 b=beC2w0eYnN/nSrQZzGXl7PoMLULpUy+aN4vu9IiJ69R+ioLHpkcWvczu6HmnxxXsVl
 5pHYYCFX0saNLZe5YqXhd2WvENCtl/AQ7LZ1X/cTP2H2lnMzpIDwWzRKQEQ4IYA6Kxdx
 xcmQvwQiLsHjr7QWkpoK5TCw4TsdmSO3MaVoJoKapTz3LjttcsP6jPlRQW2iPkMNaq+m
 3o9ZHgkoEVjAx31WV8VVDpgYSW28/tKiLIi1TODyHLQLtAnwQnvgPtjjtqwO7JIha64U
 rH/fkgAwxt2OdLDNzGRCWWkXgBOn1vvvfGrhesFgXVN/9meqj5fKKSxvfbnZt8WrwV+w
 r0/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760637402; x=1761242202;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8hqkh+fjkB3fz9DwOW6jO474uGX1QhhcgWpwE4pXOXQ=;
 b=rPLSpgxPTS8nprwwFJPfVAc7vrKn3eqxJzkMfPGQUU48nyFePrO3Y+h5LD3RD43U9h
 kf9yUgb3yE8UEBvdwzy1s+G6bolfSP6E/102cWgnIOctHr4VeZ5NS/R+3Ma5pETl3IJR
 2R1aHAOIyFV1XPcdHMwrnBiF/hxVcithIx2G7YtBM7JtWardi6QripKrNRH4aNYP4NyZ
 F1tRGwKFlaKCVeUyxlONFHkdB1bAWLQwf4tnk74yD38rQT+mdbJI5iuUlY853w71vfmK
 xD1mN1RmxYSjFHXyS92899s9jR9hylIDumVdPj58WvDDoMuNUdmaj9ROeoMyJdQtU+Sm
 RQ5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX15A3Uwcsem/7G77sHNImW7NUM9AnKc1OqAgqkFdG3cKj2trxyOE+dh3/SMjzr2JYDDUDPsF4pU80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy13UYPxjjul+IfgEkW1hgPRHoizF/s1vmCxHHnWa39dA7mrgFo
 lgdgxPgDqBb2qg2TMUm6nXwfU1FKsuJOu9UMTbFtSKMpDrPQYF+AROsO
X-Gm-Gg: ASbGncvlR/C89+STqVjU2hdoNWKGVOxddqP4AI9IdIFAQ+JpFMlrau9cB8ceepQ6sqK
 XW3H+v7KsHEljTinjoCFnEEroYa3hzl0tMs1j8BEnzwekuDM4IECjUhnnkS2nPbop88dUppMlqe
 e2y+mbIN/LzFmF46vhtEODtfEXR1xHVgXiUAiLh/sNp/OqHLlVZx/xmVi4LIFBiMx8MAQ0h4iCA
 eXwebhlDrpppYfryhBr7caX8kIxIeaJCeoZLIXrwT/i+wKE9Zh1BU7ipTHj8QbIolyIpzuXoQ8A
 sCALwayMll/jVonGukrwsiFt7m5wHPlzuZPyiS6BWLspqujHJ9Kwwk0d7wvLSI2DYfqALHyOY7/
 dXdRqhdGUMSdRR2wF2b+2TryUIz5hCEISzhp6F9Dl2NaYkcHxbkwxgSy2XS/5k8o5SEaIibA6WL
 ijL3op2Qv98A==
X-Google-Smtp-Source: AGHT+IHlyrWkPJWHU8jWWshnVV3s579IlPpvASGs8mFWda20UTGwQPy5nfJzZhrHmi8bRfFYfdm7/g==
X-Received: by 2002:a05:600c:64cf:b0:46e:3dad:31ea with SMTP id
 5b1f17b1804b1-471178af7cemr6048875e9.17.1760637401561; 
 Thu, 16 Oct 2025 10:56:41 -0700 (PDT)
Received: from fedora ([94.73.33.104]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5cfe74sm35344023f8f.35.2025.10.16.10.56.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Oct 2025 10:56:41 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, sebastian.wick@redhat.com, xaver.hugl@kde.org,
 victoria@system76.com, a.hindborg@kernel.org, leitao@debian.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v7 00/16] drm/vkms: Add configfs support
Date: Thu, 16 Oct 2025 19:56:02 +0200
Message-ID: <20251016175618.10051-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.51.0
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

The process of configuring a VKMS device is documented in "vkms.rst".

In addition, I created a CLI tool to easily control VKMS instances from the
command line: vkmsctl [1].

The series is structured in 3 blocks:

  - Patches 1..11: Basic device configuration. For simplicity, I kept the
    available options as minimal as possible.

  - Patches 12 and 13: New option to skip the default device creation and to-do
    cleanup.

  - Patches 14, 15 and 16: Allow to hot-plug and unplug connectors. This is not
    part of the minimal set of options, but I included in this series so it can
    be used as a template/example of how new configurations can be added.

Finally, the code is thoroughly tested by a collection of IGT tests [2].

Best wishes,
José Expósito

[1] https://github.com/JoseExposito/vkmsctl
[2] https://lore.kernel.org/igt-dev/20250807074550.6543-1-jose.exposito89@gmail.com/

Changes in v7:

  - Rebased on top of drm-misc-next
  - Fixed 2 documentation issues (thanks Harry!)
  - Added reviewed-by Harry and Luca, thanks a lot!
  - Link to v6: https://lore.kernel.org/dri-devel/20250901122541.9983-1-jose.exposito89@gmail.com/

Changes in v6:

  - No code changes, rebased on top of drm-misc-next
  - Added Tested-by: Mark Yacoub, who merged the series into the Android tree (thanks!)
    https://lore.kernel.org/dri-devel/CAC0gqY6ZH8h5aoNh31ck3dP6c3YYtfTRjJ47Obu6xSXSVXm5mA@mail.gmail.com/
  - Added a link in the cover letter the CLI to configure VKMS: vkmsctl
  - CCed more people to try to get the series merged
  - Link to v5: https://lore.kernel.org/dri-devel/20250507135431.53907-1-jose.exposito89@gmail.com/

Changes in v5:

  - No code changes, rebased on top of drm-misc-next
  - Added Reviewed-by tags, thanks Louis!
  - Link to v4: https://lore.kernel.org/dri-devel/20250407081425.6420-1-jose.exposito89@gmail.com/

Changes in v4:

  - No code changes, rebased on top of drm-misc-next
  - Since Louis and I worked on this together, set him as the author of some of
    the patches and me as co-developed-by to reflect this joint effort.
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


base-commit: b291e4f1a4951204ce858cd01801291d34962a33
-- 
2.51.0

