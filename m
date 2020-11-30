Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AD12C9945
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 09:23:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 489676E4D2;
	Tue,  1 Dec 2020 08:23:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B43CD6E4E3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 14:28:40 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id s21so10476640pfu.13
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 06:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Nn19QPaJ9gFHWnBmob/fWLI5r53lU06Q5xsDP7S+434=;
 b=CVVtfse5/HIIrEEzgF+u2cob0m+TmMhyi2xe4IlLyJNcrPBSjTQZtKJN/my7h/uApU
 lusyvIpamK7nUFEu7GTL4RqjOJl+0O5AgIddPYWojNFp5pzwGJOuAuddknIOxf/IFdMi
 dQudxJqX+x2rw8YpZ8Ch4qu1UdMtL06JyJSGwS3/qDax6dFc+pmOicL0AlqoN2Iuc8M9
 /KnHQOeZJLoVXo2KSg+ADobCCSH8+60OpxGmW2El4EOYOHkR9PpHU+fNl4UNd9Ql6nSQ
 E9he71uVADK6MA3S58K2avAL86qTovX3oc+4y876/xdC1z3Dv02An25PeCOwzJerxwhZ
 JAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Nn19QPaJ9gFHWnBmob/fWLI5r53lU06Q5xsDP7S+434=;
 b=tBX+PEUrCzRk2z1uQswyMrF3O/hG+BfPMHtzUQcqaCPKs2+UrPEoIIX5psueFjmKtJ
 SzfX4gfWQkFsSq3XUNzTz/7v76ZSa6t/SCSxyjhLoSlVbXfA50czw5+Obt1LHG9VFL2N
 wdRX8In5Y79jwsj5t/J8haAPPIFIPicIgl2jd+Gyj/ECzKHFXdTW2H9dVqaTBRLndkGx
 RJHeRIKjDsjXI9awUgOskzVTRUR2kV8PNj56gX7RbxyRPkaWusH4/uS3+FrZwyNCUx++
 1Wc7b8GjMnCOm1knv+UmOBxbwQE7bjddJ40SYeQLRrVyh1QOHRiGAhCObPJ3SFU0KWAs
 b6vw==
X-Gm-Message-State: AOAM531EC4lCLVw4SHUimqGXvD4TqCjM6H5M5RxIuZhlRPQyc0ofvA7e
 oy4I/861OkwLmcxY/15qARM=
X-Google-Smtp-Source: ABdhPJwQz2iTdagQqz8OY3eGXyJoXTSfQzCz/i1byckMEeHFyW3OVR6aBj+yxY4soWtnXJOdg0KvwA==
X-Received: by 2002:aa7:9f0a:0:b029:197:e4a0:4e4d with SMTP id
 g10-20020aa79f0a0000b0290197e4a04e4dmr19160903pfr.68.1606746520407; 
 Mon, 30 Nov 2020 06:28:40 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id 17sm15580479pfh.173.2020.11.30.06.28.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 30 Nov 2020 06:28:39 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH 0/6] Add Unisoc's drm kms module
Date: Mon, 30 Nov 2020 22:28:27 +0800
Message-Id: <1606746513-30909-1-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 01 Dec 2020 08:23:37 +0000
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

Kevin Tang (6):
  dt-bindings: display: add Unisoc's drm master bindings
  drm/sprd: add Unisoc's drm kms master
  dt-bindings: display: add Unisoc's dpu bindings
  drm/sprd: add Unisoc's drm display controller driver
  dt-bindings: display: add Unisoc's mipi dsi&dphy bindings
  drm/sprd: add Unisoc's drm mipi dsi&dphy driver

 .../display/sprd/sprd,display-subsystem.yaml       |   39 +
 .../bindings/display/sprd/sprd,sharkl3-dpu.yaml    |   83 ++
 .../display/sprd/sprd,sharkl3-dsi-host.yaml        |  107 ++
 .../display/sprd/sprd,sharkl3-dsi-phy.yaml         |   84 ++
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/sprd/Kconfig                       |   13 +
 drivers/gpu/drm/sprd/Makefile                      |   12 +
 drivers/gpu/drm/sprd/dpu_r2p0.c                    |  598 ++++++++
 drivers/gpu/drm/sprd/dw_dsi_ctrl.c                 |  792 +++++++++++
 drivers/gpu/drm/sprd/dw_dsi_ctrl.h                 | 1475 ++++++++++++++++++++
 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c             |  276 ++++
 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h             |   34 +
 drivers/gpu/drm/sprd/megacores_pll.c               |  315 +++++
 drivers/gpu/drm/sprd/megacores_pll.h               |  146 ++
 drivers/gpu/drm/sprd/sprd_dphy.c                   |  335 +++++
 drivers/gpu/drm/sprd/sprd_dphy.h                   |   39 +
 drivers/gpu/drm/sprd/sprd_dpu.c                    |  457 ++++++
 drivers/gpu/drm/sprd/sprd_dpu.h                    |  175 +++
 drivers/gpu/drm/sprd/sprd_drm.c                    |  265 ++++
 drivers/gpu/drm/sprd/sprd_drm.h                    |   22 +
 drivers/gpu/drm/sprd/sprd_dsi.c                    | 1105 +++++++++++++++
 drivers/gpu/drm/sprd/sprd_dsi.h                    |  105 ++
 23 files changed, 6480 insertions(+)
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
