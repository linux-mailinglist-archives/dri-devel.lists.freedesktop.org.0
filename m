Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2B5231292
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jul 2020 21:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747B96E2D7;
	Tue, 28 Jul 2020 19:30:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E639D6E228
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 10:08:05 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id 74so2393505pfx.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jul 2020 03:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=6pnYi/HD22gxfMIrYpoWCdqjauq8xDIlRTS9jIu4jxc=;
 b=vEBycbG1l3OT9RX+RP0ZyiU66Bomzxc3SgIXTDI7pWABjsrrCJKCHN0f4Udo0vaJEh
 psMFWJDYAaUFeDNRyzpKzQmztrquuGF0L0tDnENBHsxK9cSJagJp0/RF4D1m11A+WRFh
 uFBcOJYl9q3pxd54q9fEULYzvIM4/MaDVk4c9QCBdJGaGzLrTQNWxXxnnVY1qnLe5gn8
 tctnsa0rZ0SFe8ipFqlne8viVIR3xB+2hz6XHu115IVmp6CVJLFyr7tWfek43m5NbKWZ
 ZuFl4BDsZs6vB3ObWzWlN5c+TcGCIVQhZNPQ8m80AXoZ7pnb8gICJiuN9/TFOFVeH6jR
 uVNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=6pnYi/HD22gxfMIrYpoWCdqjauq8xDIlRTS9jIu4jxc=;
 b=CdK5GEhWN7BJKeNDmPsLfUxfopJt3sAChAqyHllihqx8ROM/4EEgXkawtB6gMYrWkG
 EPCtZ2Pa2vVcM7mMhHgkT16JmyUOtYr3v+/25Wv2PRMUEa3hfBKzqjBi9Fias1gDFuAY
 omogGFszqjjWf3KwbwTwkpotDfKl5anGOgCEeeYoV4Fv2cSf8azzG0Jhzkjz7LTcTCFA
 n+2qVc034QR3Agns6EsS3voVejcWWP8pRk1HDBSEn+O2pX7OP4PgptsGw8RX/EUTTIfT
 /Bxxs/3mNlZlhOnmzs8d10hqgk6YS9qHUxSLqskZ/seu+QyHKrm58DnEyWkv6DCk7k/x
 uv+A==
X-Gm-Message-State: AOAM532fxnC1KzQExWAccrsE4ziRDEPOnktV2Fzgqt8tS4yZg6AjU1I+
 3TVmBcO4lk5NzLtVA/bA62w=
X-Google-Smtp-Source: ABdhPJwGtgElydyMgzqwVqtrPlGsyNkiYOYoKvQqE3jhGJN4y5rezPq+S1JIS34p1ZhoibtWWzdcLg==
X-Received: by 2002:a63:541e:: with SMTP id i30mr24150160pgb.47.1595930885544; 
 Tue, 28 Jul 2020 03:08:05 -0700 (PDT)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id e76sm1704593pfh.108.2020.07.28.03.08.02
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 Jul 2020 03:08:04 -0700 (PDT)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v6 0/6] Add Unisoc's drm kms module
Date: Tue, 28 Jul 2020 18:07:53 +0800
Message-Id: <1595930879-2478-1-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 28 Jul 2020 19:30:50 +0000
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

From: Kevin Tang <kevin.tang@unisoc.com>

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

Kevin Tang (6):
  dt-bindings: display: add Unisoc's drm master bindings
  drm/sprd: add Unisoc's drm kms master
  dt-bindings: display: add Unisoc's dpu bindings
  drm/sprd: add Unisoc's drm display controller driver
  dt-bindings: display: add Unisoc's mipi dsi&dphy bindings
  drm/sprd: add Unisoc's drm mipi dsi&dphy driver

 .../devicetree/bindings/display/sprd/dphy.yaml     |   75 +
 .../devicetree/bindings/display/sprd/dpu.yaml      |   82 ++
 .../devicetree/bindings/display/sprd/drm.yaml      |   36 +
 .../devicetree/bindings/display/sprd/dsi.yaml      |   98 ++
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/sprd/Kconfig                       |   12 +
 drivers/gpu/drm/sprd/Makefile                      |   13 +
 drivers/gpu/drm/sprd/disp_lib.c                    |   57 +
 drivers/gpu/drm/sprd/disp_lib.h                    |   16 +
 drivers/gpu/drm/sprd/dphy/Makefile                 |    7 +
 drivers/gpu/drm/sprd/dphy/pll/Makefile             |    3 +
 drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c  |  473 +++++++
 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c          |  201 +++
 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.h          |   22 +
 drivers/gpu/drm/sprd/dpu/Makefile                  |    3 +
 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c                |  503 +++++++
 drivers/gpu/drm/sprd/dsi/Makefile                  |    8 +
 drivers/gpu/drm/sprd/dsi/core/Makefile             |    4 +
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c      |  964 +++++++++++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h      | 1477 ++++++++++++++++++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c  |  328 +++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.h  |   32 +
 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c            |  590 ++++++++
 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h            |   26 +
 drivers/gpu/drm/sprd/sprd_dphy.c                   |  209 +++
 drivers/gpu/drm/sprd/sprd_dphy.h                   |   50 +
 drivers/gpu/drm/sprd/sprd_dpu.c                    |  668 +++++++++
 drivers/gpu/drm/sprd/sprd_dpu.h                    |  190 +++
 drivers/gpu/drm/sprd/sprd_drm.c                    |  227 +++
 drivers/gpu/drm/sprd/sprd_drm.h                    |   18 +
 drivers/gpu/drm/sprd/sprd_dsi.c                    |  571 ++++++++
 drivers/gpu/drm/sprd/sprd_dsi.h                    |  108 ++
 33 files changed, 7074 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dphy.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/drm.yaml
 create mode 100644 Documentation/devicetree/bindings/display/sprd/dsi.yaml
 create mode 100644 drivers/gpu/drm/sprd/Kconfig
 create mode 100644 drivers/gpu/drm/sprd/Makefile
 create mode 100644 drivers/gpu/drm/sprd/disp_lib.c
 create mode 100644 drivers/gpu/drm/sprd/disp_lib.h
 create mode 100644 drivers/gpu/drm/sprd/dphy/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dphy/pll/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c
 create mode 100644 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c
 create mode 100644 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.h
 create mode 100644 drivers/gpu/drm/sprd/dpu/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.h
 create mode 100644 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h
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
