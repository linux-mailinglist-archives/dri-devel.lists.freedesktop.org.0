Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDD52D2624
	for <lists+dri-devel@lfdr.de>; Tue,  8 Dec 2020 09:33:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204036E994;
	Tue,  8 Dec 2020 08:32:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A976E85B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Dec 2020 14:50:35 +0000 (UTC)
Received: by mail-pj1-x1043.google.com with SMTP id o7so7579214pjj.2
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Dec 2020 06:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=C926Zk79WJsFy+LvEVKlKRNyIYSMI/KNpJXHNmmjftQ=;
 b=hVUuXafh3+mmNByGEy927C6luF/+Y3O1iuKq3m20VIWuk8oG/hEV5sF+YnU5YAXpxQ
 8QyMiVOnXzHJxjYYyZUgtxi86bgS2+NBpM2VL36xE21Z6IJCt8Dr/MFeWI1ZfrkWFiNv
 eoqcEziZtltP+i1Oxjm4sjFjm3iQuS94MpanowUA9T3m4FIVyhJ1qkA3sdB1qzx/Cej5
 5mL8AzhLO+522vfku1hdP2D8fxdK3bbpeTBCIENDZe4w/tBbj/hUneh8v3BcYmixGFS0
 51nFzfwAv25S0EnNE2fRM1Zb6/v/qWYdPLj2DlIPIPcjTTlGx+ltY5T3gUCg9GbfI4ZL
 jqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=C926Zk79WJsFy+LvEVKlKRNyIYSMI/KNpJXHNmmjftQ=;
 b=rKejdftC0D8eag1ppO7ksWHNmPd55Se/nxhH3FSMOwUV/wizlybwidE+h4X7Z2Nh6b
 cHTywYkU5EOVRMKpj94b4LjRNvhXaejIBMYreuzAUSUmGOOSNu8SWRK6q8dfqbEcwuQv
 sDcgkc0S3A45hJM9HoAmNn9gUqbG93auch84IXfHlQ8wX/AXUBgED6kRL+sWvtNCI3yW
 yxNa9BUS7Yfnw2ypFGowA8NPStGc6zJ22eDXkJTcCGOHFAK/xFDyj92W3uhrF3TCMGNe
 mFHH2nER+EcUMvlx8pBVEf6Cce9NbcAVllEfxeFQUq/bhMj+wEtv5lkhDMRYNh13wyvN
 dVkA==
X-Gm-Message-State: AOAM533t3TVcNP1YXdu+9TJGUryR4emPgZSMKUZbqrd+AKXXfc72CLbZ
 gWx0G68B36eR3er35I0Qi33dBW948s0VfA==
X-Google-Smtp-Source: ABdhPJxhDFXZxImANZdvPleQPJFn9eKx+mKbvGHYoJqihtr3cild/Lzb8J+tae950vXHYYTUKhzbUQ==
X-Received: by 2002:a17:90b:4b0a:: with SMTP id
 lx10mr16597973pjb.205.1607352634801; 
 Mon, 07 Dec 2020 06:50:34 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id u25sm10360249pgl.68.2020.12.07.06.50.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Dec 2020 06:50:34 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH v1 0/6] Add Unisoc's drm kms module
Date: Mon,  7 Dec 2020 22:50:20 +0800
Message-Id: <1607352626-26088-1-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 08 Dec 2020 08:32:06 +0000
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

v1:
1. Remove dphy and dsi graph binding, merge the dphy driver into the dsi.
2. Add commit messages for Unisoc's virtual nodes.

Kevin Tang (6):
  dt-bindings: display: add Unisoc's drm master bindings
  drm/sprd: add Unisoc's drm kms master
  dt-bindings: display: add Unisoc's dpu bindings
  drm/sprd: add Unisoc's drm display controller driver
  dt-bindings: display: add Unisoc's mipi dsi controller bindings
  drm/sprd: add Unisoc's drm mipi dsi&dphy driver

 .../display/sprd/sprd,display-subsystem.yaml       |   64 +
 .../bindings/display/sprd/sprd,sharkl3-dpu.yaml    |   83 ++
 .../display/sprd/sprd,sharkl3-dsi-host.yaml        |  107 ++
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/sprd/Kconfig                       |   13 +
 drivers/gpu/drm/sprd/Makefile                      |   11 +
 drivers/gpu/drm/sprd/dpu_r2p0.c                    |  598 ++++++++
 drivers/gpu/drm/sprd/dw_dsi_ctrl.c                 |  792 +++++++++++
 drivers/gpu/drm/sprd/dw_dsi_ctrl.h                 | 1475 ++++++++++++++++++++
 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.c             |  275 ++++
 drivers/gpu/drm/sprd/dw_dsi_ctrl_ppi.h             |   34 +
 drivers/gpu/drm/sprd/megacores_pll.c               |  316 +++++
 drivers/gpu/drm/sprd/megacores_pll.h               |  146 ++
 drivers/gpu/drm/sprd/sprd_dpu.c                    |  457 ++++++
 drivers/gpu/drm/sprd/sprd_dpu.h                    |  175 +++
 drivers/gpu/drm/sprd/sprd_drm.c                    |  224 +++
 drivers/gpu/drm/sprd/sprd_drm.h                    |   19 +
 drivers/gpu/drm/sprd/sprd_dsi.c                    | 1145 +++++++++++++++
 drivers/gpu/drm/sprd/sprd_dsi.h                    |  106 ++
 20 files changed, 6043 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,display-subsystem.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/sprd,sharkl3-dsi-host.yaml
 create mode 100644 drivers/gpu/drm/sprd/Kconfig
 create mode 100644 drivers/gpu/drm/sprd/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dpu_r2p0.c
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
