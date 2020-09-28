Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3D927A81C
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2645D6E2C8;
	Mon, 28 Sep 2020 07:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 384206E0D5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 06:27:49 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id u3so25505pjr.3
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Sep 2020 23:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=G1XCap02BLqu2h42U/isRlPU6JhGouPh7A8Cyw/JWKQ=;
 b=ZO6P/eNhvYPE6cwsvUntTdngmCHlY/B/gr9tqd/AZFvQmnrsr1xTfC7FgfvU88Zypi
 dEqfaskzB/AiSdVsEe0drCLcpSurjw/Q3G5I7c83eADd4V5K+i0BrOuMtXzGV1xp64Er
 rQcm4m/TKY3TOfEKWLo+gdnrGNsDxwPu88irxSPhGZeHiEkrznNcOIb+EvYfoTAeA9zm
 +34psCwgX1KUNcAuTm6j58qzEMF+03rQGOWreUIIUhkpVAa7/uKyUdwGZceza+xVs20V
 DX0UZUBZb/qfsy8D2T5VunWKxBpztcAleQYqWlBltsGLuUlxfXwBkEXseVp0OxXHFEcu
 8jWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=G1XCap02BLqu2h42U/isRlPU6JhGouPh7A8Cyw/JWKQ=;
 b=ooqyl7cz4gkW5Lskek4H3rw5+AmLkR+rNubHFmO6djmiX4RcDyZpmfsyLFFEp/kpgc
 uiDx2w/F8cG+vG8sfHHuEim2clzDAgkwmHX7DcBLYxh4cMJ3XO85k8j8RED+nbGi2ayP
 vTVCcyFbFxWvD0ImN/0FxqvQEMIq7RPWyf4DCKmF3BOWYMmT72sjPrXiqud4ueOinQpQ
 jL1hol/ulslZpugR2uwXbAQOSRdzgDXsDf66q+wpAwEu/RXQe72904VJzHyM2t37H5dI
 aZuvk+daNJV39w6/IjjfOZQN6/PT7HOhyAQ7mwE0SOwlag3A55cfzhcOfuX9dq/JACFH
 orgg==
X-Gm-Message-State: AOAM532X+pxPoUtm+gk6ao5Iz9lFh4hxPWU17AyyX3yPeBKD1dwO8CNy
 yckEqC0IRTUP3aLVGNDGtWk=
X-Google-Smtp-Source: ABdhPJwj/ZvOX29MNdvg7vVs2zdmBwg8lcRzhlDcreobFJUmyVAIW14dQTS5Q3cUEEz/93U5RiturA==
X-Received: by 2002:a17:90a:6282:: with SMTP id d2mr24088pjj.86.1601274468836; 
 Sun, 27 Sep 2020 23:27:48 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id il14sm5712509pjb.54.2020.09.27.23.27.45
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 27 Sep 2020 23:27:48 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v7 0/6] Add Unisoc's drm kms module
Date: Mon, 28 Sep 2020 14:27:34 +0800
Message-Id: <1601274460-7866-1-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Mon, 28 Sep 2020 07:06:24 +0000
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
Cc: orsonzhai@gmail.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhang.lyra@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ChangeList:
v1:
1. only upstream modeset and atomic at first commit. 
2. remove some unused code;
3. use alpha and blend_mode properties;
3. add yaml support;
4. remove auto-adaptive panel driver;
5. bugfix

v2:
1. add sprd crtc and plane module for KMS, preparing for multi crtc&encoder
2. remove gem drivers, use generic CMA handlers
3. remove redundant "module_init", all the sub modules loading by KMS

v3:
1. multi crtc&encoder design have problem, so rollback to v1

v4:
1. update to gcc-linaro-7.5.0
2. update to Linux 5.6-rc3
3. remove pm_runtime support
4. add COMPILE_TEST, remove unused kconfig
5. "drm_dev_put" on drm_unbind
6. fix some naming convention issue
7. remove semaphore lock for crtc flip
8. remove static variables

v5:
1. optimize encoder and connector code implementation
2. use "platform_get_irq" and "platform_get_resource"
3. drop useless function return type, drop unless debug log
4. custom properties should be separate, so drop it
5. use DRM_XXX replase pr_xxx
6. drop dsi&dphy hal callback ops
7. drop unless callback ops checking
8. add comments for sprd dpu structure

v6:
1. Access registers via readl/writel
2. Checking for unsupported KMS properties (format, rotation, blend_mode, etc) on plane_check ops
3. Remove always true checks for dpu core ops

v7:
1. Fix DTC unit name warnings
2. Fix the problem of maintainers
3. Call drmm_mode_config_init to mode config init
4. Embed drm_device in sprd_drm and use devm_drm_dev_alloc
5. Replace DRM_XXX with drm_xxx on KMS module, but not suitable for other subsystems
6. Remove plane_update stuff, dpu handles all the HW update in crtc->atomic_flush
7. Dsi&Dphy Code structure adjustment, all move to "sprd/"

Kevin Tang (6):
  dt-bindings: display: add Unisoc's drm master bindings
  drm/sprd: add Unisoc's drm kms master
  dt-bindings: display: add Unisoc's dpu bindings
  drm/sprd: add Unisoc's drm display controller driver
  dt-bindings: display: add Unisoc's mipi dsi&dphy bindings
  drm/sprd: add Unisoc's drm mipi dsi&dphy driver

 .../display/sprd/sprd,display-subsystem.yaml       |   39 +
 .../bindings/display/sprd/sprd,sharkl3-dpu.yaml    |   83 ++
 .../display/sprd/sprd,sharkl3-dsi-host.yaml        |   98 ++
 .../display/sprd/sprd,sharkl3-dsi-phy.yaml         |   75 +
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/sprd/Kconfig                       |   13 +
 drivers/gpu/drm/sprd/Makefile                      |   12 +
 drivers/gpu/drm/sprd/dpu_r2p0.c                    |  636 +++++++++
 drivers/gpu/drm/sprd/dw_dsi_ctrl.c                 |  792 +++++++++++
 drivers/gpu/drm/sprd/dw_dsi_ctrl.h                 | 1475 ++++++++++++++++++++
 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c             |  276 ++++
 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h             |   34 +
 drivers/gpu/drm/sprd/megacores_pll.c               |  315 +++++
 drivers/gpu/drm/sprd/megacores_pll.h               |  146 ++
 drivers/gpu/drm/sprd/sprd_dphy.c                   |  335 +++++
 drivers/gpu/drm/sprd/sprd_dphy.h                   |   39 +
 drivers/gpu/drm/sprd/sprd_dpu.c                    |  501 +++++++
 drivers/gpu/drm/sprd/sprd_dpu.h                    |  217 +++
 drivers/gpu/drm/sprd/sprd_drm.c                    |  263 ++++
 drivers/gpu/drm/sprd/sprd_drm.h                    |   20 +
 drivers/gpu/drm/sprd/sprd_dsi.c                    | 1102 +++++++++++++++
 drivers/gpu/drm/sprd/sprd_dsi.h                    |  105 ++
 23 files changed, 6579 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-phy.yaml
 create mode 100644 drivers/gpu/drm/sprd/Kconfig
 create mode 100644 drivers/gpu/drm/sprd/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dpu_r2p0.c
 create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl.c
 create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl.h
 create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c
 create mode 100644 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h
 create mode 100644 drivers/gpu/drm/sprd/megacores_pll.c
 create mode 100644 drivers/gpu/drm/sprd/megacores_pll.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dphy.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dphy.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dpu.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_drm.h
 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_dsi.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
