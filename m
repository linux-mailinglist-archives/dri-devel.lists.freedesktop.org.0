Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04781439274
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 11:34:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 968C789CC9;
	Mon, 25 Oct 2021 09:34:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1713089C97
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 09:34:52 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id f4so4781101plt.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 02:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cYbf6uzQ8oZx3fhN+OoW9PPWaIszzAceDbsiiDa0Wkk=;
 b=GNEEdtlNOM5d2yKPDnZx78pxFUUbfo9KVAgwKlBM9nj1Nr1xMb677pxwVB9L2zzgW0
 SPcCC5ifLzMFDHr971erg6wXTk/I76oXeDIDuZpn4CoYDkBBYlemUbNIdy9UZBfC6lQV
 gwXDLZk5sPvEAJeOvwi1V080PyzUoJrC1XOcrhKEe/xL19eaQQb6++lPwnlAV9hwcDPE
 8hWWcthqWV/oUylD4vWdsjqag/AVCBPS5mLy/n/v38txY1lJoTpre39sJdkEVuDQRe3R
 mTnST4XUPvLbHyJ8xQIRjZktfSQ2vIzf0r/yTnOJvT8qVkZmEPU8R+ku56MI6HT6y89P
 F4Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cYbf6uzQ8oZx3fhN+OoW9PPWaIszzAceDbsiiDa0Wkk=;
 b=1lL4l4RYM5P8HZjpObldRqGhHA9bPuEk0CGr5Bkpf3ZFhaoCa3X5Hv8fkak12wEn9T
 5Kx5w5Pq2GuqGYjPL7r+X9uG8KZUFw8VwXzPW7r2REcf8JDRb6yTjRH4ccI7v6SV+2Ju
 +K/vX5kRe4eidGBYPzJ9IxAn2GVy3o++K3Bsdm0Q7V16X/IlBIO7+YxS40LfkV/LiYD8
 fNjxM53Jo1BUst00qOiOZ1KvKmcQrcXvgrSSn4AZzu0QWqP15/6H0EQwC4a8KTzz0Yta
 19XioTTo5+fC+lQATK5dsgZ6rk5Ql4wwXuYb5RUAOWJdRvyW/VZg66jf9Y8RGuRPTj5v
 YQDQ==
X-Gm-Message-State: AOAM531EngYMsylUeR+F+YoVpOVbWQY6RanGMDTE3rUBAap55Ib0LSz0
 84Eblei7ox4cTjqRSSyWbo4=
X-Google-Smtp-Source: ABdhPJw9lVY1hFPoREYreDbUL2GesnmkNzs3OJn1fuCRazZhPizx/p0V7ZpkJ+3BR1WQnt3+3c/bbw==
X-Received: by 2002:a17:90b:805:: with SMTP id
 bk5mr15110734pjb.124.1635154491569; 
 Mon, 25 Oct 2021 02:34:51 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com
 ([240e:47a:878:6a2:e0f0:8dca:6977:afd5])
 by smtp.gmail.com with ESMTPSA id c9sm15446100pgq.58.2021.10.25.02.34.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 25 Oct 2021 02:34:51 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com, pony1.wu@gmail.com
Cc: orsonzhai@gmail.com, zhang.lyra@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH v7 0/6] Add Unisoc's drm kms module
Date: Mon, 25 Oct 2021 17:34:12 +0800
Message-Id: <20211025093418.20545-1-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ChangeList:
RFC v1:
1. only upstream modeset and atomic at first commit.
2. remove some unused code;
3. use alpha and blend_mode properties;
3. add yaml support;
4. remove auto-adaptive panel driver;
5. bugfix

RFC v2:
1. add sprd crtc and plane module for KMS, preparing for multi crtc&encoder
2. remove gem drivers, use generic CMA handlers
3. remove redundant "module_init", all the sub modules loading by KMS

RFC v3:
1. multi crtc&encoder design have problem, so rollback to v1

RFC v4:
1. update to gcc-linaro-7.5.0
2. update to Linux 5.6-rc3
3. remove pm_runtime support
4. add COMPILE_TEST, remove unused kconfig
5. "drm_dev_put" on drm_unbind
6. fix some naming convention issue
7. remove semaphore lock for crtc flip
8. remove static variables

RFC v5:
1. optimize encoder and connector code implementation
2. use "platform_get_irq" and "platform_get_resource"
3. drop useless function return type, drop unless debug log
4. custom properties should be separate, so drop it
5. use DRM_XXX replase pr_xxx
6. drop dsi&dphy hal callback ops
7. drop unless callback ops checking
8. add comments for sprd dpu structure

RFC v6:
1. Access registers via readl/writel
2. Checking for unsupported KMS properties (format, rotation, blend_mode, etc) on plane_check ops
3. Remove always true checks for dpu core ops

RFC v7:
1. Fix DTC unit name warnings
2. Fix the problem of maintainers
3. Call drmm_mode_config_init to mode config init
4. Embed drm_device in sprd_drm and use devm_drm_dev_alloc
5. Replace DRM_XXX with drm_xxx on KMS module, but not suitable for other subsystems
6. Remove plane_update stuff, dpu handles all the HW update in crtc->atomic_flush
7. Dsi&Dphy Code structure adjustment, all move to "sprd/"

v0:
1. Remove dpu_core_ops stuff layer for sprd drtc driver, but dpu_layer need to keeping.
   Because all the HW update in crtc->atomic_flush, we need temporary storage all layers for
   the dpu pageflip of atomic_flush.
2. Add ports subnode with port@X.

v1:
1. Remove dphy and dsi graph binding, merge the dphy driver into the dsi.
2. Add commit messages for Unisoc's virtual nodes.

v2:
1. Use drm_xxx to replace all DRM_XXX.
2. Use kzalloc to replace devm_kzalloc for sprd_dsi/sprd_dpu structure init.
3. Remove dpu_core_ops midlayer.

v3:
1. Remove dpu_layer midlayer and commit layers by aotmic_update

v4:
1. Move the devm_drm_dev_alloc to master_ops->bind function.
2. The managed drmm_mode_config_init() it is no longer necessary for drivers to explicitly call drm_mode_config_cleanup, so delete it.
3. Use drmm_helpers to allocate crtc ,planes and encoder.
4. Move allocate crtc ,planes, encoder to bind funtion.
5. Move rotation enum definitions to crtc layer reg bitfields.

v5:
1. Remove subdir-ccflgas-y for Makefile.
2. Keep the selects sorted by alphabet for Kconfig.
3. Fix the checkpatch warnings.
4. Use mode_set_nofb instead of mode_valid callback.
5. Follow the OF-Graph bindings, use of_graph_get_port_by_id instead of of_parse_phandle.
6. Use zpos to represent the layer position.
7. Rebase to last drm misc branch.
8. Remove panel_in port for dsi node.
9. Drop the dsi ip file prefix.
10. Add Signed-off-by for dsi&dphy patch.
11. Use the mode_flags of mipi_dsi_device to setup crtc DPI and EDPI mode.

v6:
1. Disable and clear interrupts before register dpu IRQ
2. Init dpi config used by crtc_state->adjusted_mode on mode_set_nofb
3. Remove enable_irq and disable_irq function call.
4. Remove drm_format_info function call.
5. Redesign the way to access the dsi register.
6. Reduce the dsi_context member variables.

v7:
1. Fix codeing style issue by checkpatch.
2. Drop the pll registers structure define.
3. Use bridge API instead of drm panel API.
4. Register mipi_dsi_host on probe phase;
5. Remove iommu error interrupt handling function.
6. Remove some unused function.

Kevin Tang (6):
  dt-bindings: display: add Unisoc's drm master bindings
  drm/sprd: add Unisoc's drm kms master
  dt-bindings: display: add Unisoc's dpu bindings
  drm/sprd: add Unisoc's drm display controller driver
  dt-bindings: display: add Unisoc's mipi dsi controller bindings
  drm/sprd: add Unisoc's drm mipi dsi&dphy driver

 .../display/sprd/sprd,display-subsystem.yaml  |   64 +
 .../display/sprd/sprd,sharkl3-dpu.yaml        |   77 ++
 .../display/sprd/sprd,sharkl3-dsi-host.yaml   |   88 ++
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/sprd/Kconfig                  |   13 +
 drivers/gpu/drm/sprd/Makefile                 |    6 +
 drivers/gpu/drm/sprd/megacores_pll.c          |  305 +++++
 drivers/gpu/drm/sprd/sprd_dpu.c               |  884 ++++++++++++++
 drivers/gpu/drm/sprd/sprd_dpu.h               |  109 ++
 drivers/gpu/drm/sprd/sprd_drm.c               |  205 ++++
 drivers/gpu/drm/sprd/sprd_drm.h               |   19 +
 drivers/gpu/drm/sprd/sprd_dsi.c               | 1065 +++++++++++++++++
 drivers/gpu/drm/sprd/sprd_dsi.h               |  126 ++
 14 files changed, 2964 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
 create mode 100644 drivers/gpu/drm/sprd/Kconfig
 create mode 100644 drivers/gpu/drm/sprd/Makefile
 create mode 100644 drivers/gpu/drm/sprd/megacores_pll.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h

-- 
2.29.0

