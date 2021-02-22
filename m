Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CDD321892
	for <lists+dri-devel@lfdr.de>; Mon, 22 Feb 2021 14:28:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3336E507;
	Mon, 22 Feb 2021 13:28:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFCC6E507
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 13:28:29 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id f8so7737319plg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Feb 2021 05:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fgxTxUDILQKYpK+kkMjKu0FMVKszhc5oAFeDxdZLCpA=;
 b=T5zmuUUUcSVap0ah8QOi0Ir1Ax80hEln5b0nRp6vC4ezQFbMVX9YHomqTMYO8ecCpt
 OKOZlOHwzuSFV1EtUqDC/Whhl13HAnAYqYqn0O9rEg1n43JQrrUC2nm80UaC/wjnaPSg
 EslscuTnCjvZeQfd+wCKyE0DoEhIjH1mMXbQEWvnF2yMXY63XRXLHQyoBSaQ8fmKzLCQ
 RDnQSlRYRWPWqJhxclMXaXELrd8jJ28i0fx3mPQJZ41SLopobzg9yX0wxRu9ZzIkJBhR
 /rfC85eM0qWa9WHGsautyVm1lkTAraToWrPSt6554cDQndGdHwBC6KDGebeP2YiMidHe
 IMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fgxTxUDILQKYpK+kkMjKu0FMVKszhc5oAFeDxdZLCpA=;
 b=CQHlhkdIxIZJY1rxsgvUJZwd0rcGonDAfDa6bj6J5Ppqoj/yh9oRQIfnvo4n3a2SrL
 CpJCuegxo6gdyVyB6L4kn6Y2XJqo2ZrXyE1MeEcLEV52dVMdwoZU3U97zJk4wYGQ8pjW
 6LiK3kjCEr5hKhunHY/0DcRgP/Ax360UPwYuaXKPVFlU6QJAIN0/WqjBG2Bn/j+WipIf
 wY+cibZOkdj/XEjj/AWtzszWZ6bzDtbakcmfC199kTMLgc2O8dnX6Pva5p8f0/1qqYBV
 e1yMeg/XV3SzAY6xXUEABVF2grphHddlKPAQOMQ8h6dM/Zp/6oC6Ep7+edQOra/URGUF
 JC0w==
X-Gm-Message-State: AOAM530Lhbv2o4YEBwgHISrFhW4DeKnzjuc7QtNohso0M3Fwp01sS+M0
 FstQy6eoDMYKzWiNnP12+60=
X-Google-Smtp-Source: ABdhPJzhjWiTQUvQuE/07p/XYGM0i2/2d8EqO84o/ZCU1084QpCRYN13zQZMt8EtBLfw09KJLYjrVQ==
X-Received: by 2002:a17:90a:1b0d:: with SMTP id
 q13mr8618774pjq.211.1614000509220; 
 Mon, 22 Feb 2021 05:28:29 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id 141sm19585334pfa.65.2021.02.22.05.28.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Feb 2021 05:28:28 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH v4 0/6] Add Unisoc's drm kms module
Date: Mon, 22 Feb 2021 21:28:16 +0800
Message-Id: <20210222132822.7830-1-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
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
Cc: orsonzhai@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 zhang.lyra@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

Kevin Tang (6):
  dt-bindings: display: add Unisoc's drm master bindings
  drm/sprd: add Unisoc's drm kms master
  dt-bindings: display: add Unisoc's dpu bindings
  drm/sprd: add Unisoc's drm display controller driver
  dt-bindings: display: add Unisoc's mipi dsi controller bindings
  drm/sprd: add Unisoc's drm mipi dsi&dphy driver

 .../display/sprd/sprd,display-subsystem.yaml  |   64 +
 .../display/sprd/sprd,sharkl3-dpu.yaml        |   77 +
 .../display/sprd/sprd,sharkl3-dsi-host.yaml   |  102 ++
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/sprd/Kconfig                  |   13 +
 drivers/gpu/drm/sprd/Makefile                 |    8 +
 drivers/gpu/drm/sprd/dw_dsi_ctrl.c            |  794 +++++++++
 drivers/gpu/drm/sprd/dw_dsi_ctrl.h            | 1475 +++++++++++++++++
 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c        |  157 ++
 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h        |   26 +
 drivers/gpu/drm/sprd/megacores_pll.c          |  317 ++++
 drivers/gpu/drm/sprd/megacores_pll.h          |  146 ++
 drivers/gpu/drm/sprd/sprd_dpu.c               |  964 +++++++++++
 drivers/gpu/drm/sprd/sprd_dpu.h               |  109 ++
 drivers/gpu/drm/sprd/sprd_drm.c               |  219 +++
 drivers/gpu/drm/sprd/sprd_drm.h               |   19 +
 drivers/gpu/drm/sprd/sprd_dsi.c               | 1132 +++++++++++++
 drivers/gpu/drm/sprd/sprd_dsi.h               |  104 ++
 19 files changed, 5729 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
 create mode 100644 drivers/gpu/drm/sprd/Kconfig
 create mode 100644 drivers/gpu/drm/sprd/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl.c
 create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl.h
 create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c
 create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h
 create mode 100644 drivers/gpu/drm/sprd/megacores_pll.c
 create mode 100644 drivers/gpu/drm/sprd/megacores_pll.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h

-- 
2.29.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
