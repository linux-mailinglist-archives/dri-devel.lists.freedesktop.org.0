Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAB1706BAB
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 16:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E0D10E432;
	Wed, 17 May 2023 14:52:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE48610E432
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 14:52:45 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id
 ffacd0b85a97d-309438004a6so451828f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 07:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684335164; x=1686927164; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=v9W6xTSdLFIJuQ/KjRd4yXxi7gzv1/GuKhJzV0MwXqg=;
 b=U6DObmhKv1Q/NeXMNtscNlGUJxhj4j2R1C6zujYJ7GYGm6RfKyHRK5rbpxOyQCRr7p
 9wmVRKphBLBj8MafZEBG1rA5CFz7KS70zcAz/4RuL5ItJXDP6C6mnVePcC7sg+PtOyK7
 GX0rkHrtku6mDN69D2KdFk+cTyqH5eGb+lklYFi4mCti31SxZJ1z6zJ7jWhpec4tgylp
 5QET8jdB/pkb2enuppJmj+frSrUbJ15LBNRRj80E2/ynzgDytoBdxYKVmP0OUFMEo9Ab
 gR9cJ/+3ZSqKvTvqeybQmboG6MXAgKdPr24rCyfy5XrkqMCByzu7P8I+GlRexg2KZJZu
 jQuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684335164; x=1686927164;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=v9W6xTSdLFIJuQ/KjRd4yXxi7gzv1/GuKhJzV0MwXqg=;
 b=COMCvAtbH8lrYEZb8olG9JbCz/jSalgXhi2GCd+tTvTFf8rpwVX142dKU3dsgwjNDD
 XgBOtF1LhF5NNblhFIjIatPYPmM0utYk2caLFHN7cdbV3FNrOKVR2AGcBM/VLArSD5Ft
 jON60vp2hIQ4kWkk0gEjMZTxUtvLOsAsUpo3FVyrAShByxDWWtHkjOFVSjuy8GGwpn+N
 BkW1s/pYr8vyq8wtTfao6wDW0dHz+KyhQVf6I6OkQRlVltFQd/1bcHzrxViaOpxqoA41
 +6jQR5t7ZSPx6vSkskzmm0r0EAr5ReHABcKQYCdGov5FW5eCDx/EIkMHOHi5VH9+2s+o
 jdDQ==
X-Gm-Message-State: AC+VfDxxCfwA30/qYe5y2kEz5MzkU+a1Td32evMjRYoU2wwKLGQL1WpW
 hMFEhTUKCvkKLkIKs7VSbKGBGg==
X-Google-Smtp-Source: ACHHUZ7IUdIfSJ/RjD1XHlXKNgHreYBrpH+v8F3m/6tEEkXNve0qaiL5jYWNc/RtwyFAENvpakbl+g==
X-Received: by 2002:adf:e0c4:0:b0:306:3b39:9a3d with SMTP id
 m4-20020adfe0c4000000b003063b399a3dmr920596wri.15.1684335163959; 
 Wed, 17 May 2023 07:52:43 -0700 (PDT)
Received: from blaptop.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a5d678b000000b002f7780eee10sm2979098wru.59.2023.05.17.07.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 May 2023 07:52:43 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Subject: [PATCH 0/7] Add a DRM driver to support AI Processing Unit (APU)
Date: Wed, 17 May 2023 16:52:30 +0200
Message-Id: <20230517145237.295461-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.39.2
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, bero@baylibre.com,
 khilman@baylibre.com, jstephan@baylibre.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, Alexandre Bailon <abailon@baylibre.com>,
 robh+dt@kernel.org, linux-mediatek@lists.infradead.org, nbelin@baylibre.com,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-media@vger.kernel.org, sumit.semwal@linaro.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds a DRM driver that implements communication between the CPU and an
APU. The driver target embedded device that usually run inference using some
prebuilt models. The goal is to provide common infrastructure that could be
re-used to support many accelerators. Both kernel, userspace and firmware tries
to use standard and existing to leverage the development and maintenance effort.
The series implements two platform drivers, one for simulation and another one for
the mt8183 (compatible with mt8365).

For the people interested by the firmware or userspace library,
the sources are available here:
https://gitlab.baylibre.com/baylibre/libapu/libapu

The support of APU has to be upstreamed to libdrm.
Until this is done, you could find the source here:
https://gitlab.baylibre.com/baylibre/libapu/libdrm/-/tree/abailon/main

The driver for mt8183 depends on this series (which is currently blocked):
https://patchwork.kernel.org/project/linux-arm-kernel/list/?series=620429

Alexandre Bailon (5):
  drm: Add support of AI Processor Unit (APU)
  drm/apu: Add memory allocator
  drm/apu: Add support of requests
  drm/apu: Add support of IOMMU
  dt-bindings: Add bidings for mtk,apu-drm

Julien Stephan (2):
  drm/apu: allow platform driver to implement their own mmap function
  drm/apu: Add support for a simulated APU

 .../devicetree/bindings/gpu/mtk,apu-drm.yaml  |  38 ++
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/apu/Kconfig                   |  22 +
 drivers/gpu/drm/apu/Makefile                  |  10 +
 drivers/gpu/drm/apu/apu_drv.c                 | 282 +++++++++
 drivers/gpu/drm/apu/apu_gem.c                 | 230 +++++++
 drivers/gpu/drm/apu/apu_internal.h            | 205 ++++++
 drivers/gpu/drm/apu/apu_sched.c               | 592 ++++++++++++++++++
 drivers/gpu/drm/apu/simu_apu.c                | 313 +++++++++
 include/uapi/drm/apu_drm.h                    |  81 +++
 11 files changed, 1776 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
 create mode 100644 drivers/gpu/drm/apu/Kconfig
 create mode 100644 drivers/gpu/drm/apu/Makefile
 create mode 100644 drivers/gpu/drm/apu/apu_drv.c
 create mode 100644 drivers/gpu/drm/apu/apu_gem.c
 create mode 100644 drivers/gpu/drm/apu/apu_internal.h
 create mode 100644 drivers/gpu/drm/apu/apu_sched.c
 create mode 100644 drivers/gpu/drm/apu/simu_apu.c
 create mode 100644 include/uapi/drm/apu_drm.h

-- 
2.39.2

