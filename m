Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DFB4104B8
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 09:25:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDA56E0DE;
	Sat, 18 Sep 2021 07:25:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CDB6EC6C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 12:57:56 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u18so13300051wrg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 05:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TmSUd1g256AwM6GPkCVL8KzZlMuiVA8rcald4HgLdWY=;
 b=Vojsq/qATfqaLlBx4GBlzY1M3WQZBkET3/mYiL3HkeYBMyHzWtJbjHthyfck3N2imY
 cOchlbwuXK/iJL6FTVNRR4N6LsDzg5ueKC6Q/busloEZbIggqb55XCgGJc5u+W6/q1Sc
 C3F2brFPLgR81rImVQ/fzY1R8cBgz8gBVfsLVqJeh3G9HxBG0VqAwdbdGikzpDS42CE9
 ofZWBpM1Dyv1TFNfej7D0ZCxUYMFOKLR0gPEgxl3cicBjY9FSggM8IL0jVct8KiT/Ctm
 6Dr2o3sqhUQ9wRKHM2Se+EoGr+ehAxcbcAFY6nNObaZgFuVZTxRftv90jKjlNW6Xwtc/
 fmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TmSUd1g256AwM6GPkCVL8KzZlMuiVA8rcald4HgLdWY=;
 b=3hRMjQXTLDeyU/iPUlI8LF9zpEzDh8NPuo0oxzzfbe0woIwi1kYjQB92y5wIsx+6OV
 1ahGLGsJetlvOcanUkPXkBVnvdVed3eq6oJjL5SDvqIFV9Z8eSJN90RtyBkLO02i0UKk
 9xSh5n39rmat7lRK0PAOYlw58faj85JgwRtzQBpRkjgbbCBs47o7zNHLd4QHHOOVebhr
 KQ0Xx/Ru0fUEKz2Dn1doS8zm2adaBrdPmknDX1BZ6hmWBBAkmWFYC8sg/B/CDj4n3sgZ
 IBISvFDQRY01pw9qifTOONV12SDWca0V42UTTfuAtMfsUBBaBu7aNTqWjioiTqMsLmEE
 71Vg==
X-Gm-Message-State: AOAM530HGpp/V7zJ4WLmun8h7YQ6xKrwwcgMCSBQ4lWzcX2IAvxbYff5
 hC8UsNYWfODa9yrB13ICXmmqqg==
X-Google-Smtp-Source: ABdhPJwUld7Y82YW6Rc8Pz69DPxiv4IUt7DfWDhYwTVj5a1Rbt107Ifh+5ZTcTCPWcgP4Ahl8EgU4Q==
X-Received: by 2002:adf:b781:: with SMTP id s1mr11968492wre.165.1631883474593; 
 Fri, 17 Sep 2021 05:57:54 -0700 (PDT)
Received: from localhost.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id f3sm6358636wmj.28.2021.09.17.05.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Sep 2021 05:57:53 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 matthias.bgg@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, ohad@wizery.com,
 bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
 sumit.semwal@linaro.org
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, khilman@baylibre.com, gpain@baylibre.com,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [RFC PATCH 0/4] Add a DRM driver to support AI Processing Unit (APU)
Date: Fri, 17 Sep 2021 14:59:41 +0200
Message-Id: <20210917125945.620097-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 18 Sep 2021 07:25:35 +0000
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

This adds a DRM driver that implements communication between the CPU and an
APU.
This uses VirtIO buffer to exchange messages.
For the data, we allocate a GEM object and map it using IOMMU to make it
available to the APU.
The driver is relatively generic, and should work with any SoC implementing
hardware accelerator for AI if they use support remoteproc and VirtIO.

For the people interested by the firmware or userspace library,
the sources are available here:
https://github.com/BayLibre/open-amp/tree/v2020.01-mtk/apps/examples/apu

This RFC is a rewrite of a previous RFC that was not using DRM:
https://patchwork.kernel.org/project/linux-remoteproc/cover/20200930115350.5272-1-abailon@baylibre.com/

Alexandre Bailon (4):
  dt-bindings: Add bidings for mtk,apu-drm
  DRM: Add support of AI Processor Unit (APU)
  rpmsg: Add support of AI Processor Unit (APU)
  ARM64: mt8183-pumpkin: Add the APU DRM device

 .../devicetree/bindings/gpu/mtk,apu-drm.yaml  |  38 ++
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |   6 +
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/apu/Kconfig                   |  10 +
 drivers/gpu/drm/apu/Makefile                  |   7 +
 drivers/gpu/drm/apu/apu_drm_drv.c             | 238 +++++++
 drivers/gpu/drm/apu/apu_gem.c                 | 232 +++++++
 drivers/gpu/drm/apu/apu_internal.h            |  89 +++
 drivers/gpu/drm/apu/apu_sched.c               | 634 ++++++++++++++++++
 drivers/rpmsg/Kconfig                         |  10 +
 drivers/rpmsg/Makefile                        |   1 +
 drivers/rpmsg/apu_rpmsg.c                     | 184 +++++
 include/drm/apu_drm.h                         |  59 ++
 include/uapi/drm/apu_drm.h                    | 106 +++
 15 files changed, 1617 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpu/mtk,apu-drm.yaml
 create mode 100644 drivers/gpu/drm/apu/Kconfig
 create mode 100644 drivers/gpu/drm/apu/Makefile
 create mode 100644 drivers/gpu/drm/apu/apu_drm_drv.c
 create mode 100644 drivers/gpu/drm/apu/apu_gem.c
 create mode 100644 drivers/gpu/drm/apu/apu_internal.h
 create mode 100644 drivers/gpu/drm/apu/apu_sched.c
 create mode 100644 drivers/rpmsg/apu_rpmsg.c
 create mode 100644 include/drm/apu_drm.h
 create mode 100644 include/uapi/drm/apu_drm.h

-- 
2.31.1

