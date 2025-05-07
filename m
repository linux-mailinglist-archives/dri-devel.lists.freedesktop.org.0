Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D112BAAE181
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92FD890D2;
	Wed,  7 May 2025 13:54:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gdABwts+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8883890D2
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 13:54:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-39c1efc4577so3615721f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 06:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746626075; x=1747230875; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ska3QXhckdX3yExfYXkXUCA/LUNKWcEWdZm2KwgYfJw=;
 b=gdABwts+0hQqezvUUqbRQQ+/iZ6VJaJnQfzBFovJfnna9aKXlC3DSNQA2hWaahyoRz
 fKoEF6EUhv/P4xFrw5Q2EHODLbO0foCNaqLMEdsdLEtdCjsCpzbYbI5PdOPWjXLWAbzD
 S18fBcq7TyTg9jm/bEjuF6wT/D8nsfEmluqnzQs/++Voz6WT6nG3w+8ITEJHwNFWAlh7
 IWNYSxinb4v5MvTj671Ahi7B5K4QERS2kXxaaaC9A9pp61/icMrEn08d1iKkgIgP3kOV
 mj2WmmuqX8ESTWe+ltjYfuh2BTOlY2WECS4joT+wYWTik4XKDZO0uiNZQAJxBgBBdvGJ
 lT5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746626075; x=1747230875;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ska3QXhckdX3yExfYXkXUCA/LUNKWcEWdZm2KwgYfJw=;
 b=I/11TRsIK77ygLET069DvAdTamDzMpNPHtDrnpiXTWS8wBVmtx/bbDBsWD0jbes8RB
 ZsFg0hB+nYii7UkuKDH5giI6d0gg2xzxJORcZNBD7KMZljcLeza3JGbWyokeIgfNsgdH
 rWs6ba4bL7c/uz+ibigRTdxhuzKXHyElN7cV/BjbTtgJc7RE0s24qdCFDWMNsVLCxGUA
 LbJAob8iEXc+zujj97H4OqA4oaGYez6b2s2+tUhA1w+8ILaN4K5kCWrY8VVp4HQBaxXy
 DgFiyL0Nh0mxwiJ4qpDQQS7oZ9+LP5SnHhCQRYhYGb2nHWa4KgJT5nXq8tJkqtzYL327
 5Egg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXd+YJdczC0q8KfKtuZ5P6rxaJ1wUnOBgpdjZQ3wMKkszG0eBlgedJIm5ir86WPvR48hylALg0+Lnk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YygSKd0eXXsJgBk96+x4vO2QqcOrz/Ac+p9IjjFCDHtCOxOLTkG
 JKhi/LVTQVYZpMwf6IyGQB4BzA+UqnW1V9bQZiQTQso44gFamOtc
X-Gm-Gg: ASbGncskQ0oUphFZo6/90uEzyqv6FQfKTPiuX3XDbUWKY1918mmcH6o0vNguPh6Nsnl
 W0kpvoytS0JMaJ9HRRKvaVQVJZTMm2Pj2zq3zrom4VTPiZszs+fBCY5GeGGzAH+ZQ6MUcfyxgrt
 W4kmd1mSgLnZz8S/TXtqPvrZSgjwqAGKSiqvXenCV/hpqU9577Fpu6PZ/7uUd9PZRsik7kpiB/R
 UPh76/59zHnpFXDxxFwLtww3eMBCwq69s3lBkpjb5sAKbtKiCWSzxlmpPN0AWHEqTQWJzhdoTWy
 2QwQChYU9vvPVboAhyn75mbryAV5KIq5ZREcFIKhYQ==
X-Google-Smtp-Source: AGHT+IExbIFQjaVmp5loFH6GIiYgPa+YqsZli/oD2AgI0l1LNnu//2mp8pgD7S/LhBOcaNIASVqiUw==
X-Received: by 2002:a5d:64ab:0:b0:3a0:b6b7:d06b with SMTP id
 ffacd0b85a97d-3a0b6b7d327mr1662314f8f.28.1746626075202; 
 Wed, 07 May 2025 06:54:35 -0700 (PDT)
Received: from fedora.. ([94.73.35.165]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd32f1eesm1894295e9.9.2025.05.07.06.54.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 06:54:34 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: louis.chauvet@bootlin.com
Cc: hamohammed.sa@gmail.com, simona@ffwll.ch, melissa.srw@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH v5 00/16] drm/vkms: Add configfs support
Date: Wed,  7 May 2025 15:54:15 +0200
Message-ID: <20250507135431.53907-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.49.0
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

Changes in v5:

  - Added Reviewed-by tags, thanks Louis!
  - Rebased on top of drm-misc-next
  - Link to v4: https://lore.kernel.org/dri-devel/20250407081425.6420-1-jose.exposito89@gmail.com/

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


base-commit: a6c0a91ccb257eaec2aee080df06863ce7601315
-- 
2.49.0

