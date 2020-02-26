Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F53117121F
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 09:13:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDB26EC27;
	Thu, 27 Feb 2020 08:13:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D75CF891C5
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 09:46:27 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id r77so1025351pgr.12
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 01:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=ihmazS6FA8NlQMyYSt3ZHDuscdnVGkc2tP1SlK96WcY=;
 b=Or3mYO8uKP5gTn6ZgHRzsms0A3/mLaWqltKWi+srMGY9gJRlqZcGWFoO5r/AQ9oHPi
 xM6dxZ0Poe7hMpEEFfB/bOZU6q2pqDKScFqSDAhbr4Oj4s82Yb0bY+943ZZvkFQXvwrE
 uSQjuaFZixipMlyHMLheqywGJZPOeT2lGF22hrHnPM6C+Miu6vnZxTUHkWk604zivr90
 sgb1NP5iNr1cxXXe8tN39Wut5JhqynLLZ1OrHAEIWcPf0Ie5MtuzXr1IBGx1wWW4DWBW
 48FkGMaTtfbuHYgr3XCE6ThLWL6K81Kt4dZ+w86i10NCpTawWDRX9dah0KEKc6rxVhQT
 Tnrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ihmazS6FA8NlQMyYSt3ZHDuscdnVGkc2tP1SlK96WcY=;
 b=Xa49iTmJOzrlv2LhwpTLFFgN7kFfZQPtYh2nsUjP+IEKseYQLeltCiVP7B6BW7/aFG
 CruBZRjJ58lyciIeexoVBcWq4YYttPPwB0F/5CNdkMXWCutv9+IrY3FhxzGzIC/yIFmL
 OJMPPXWFRp7uwxo7zDV6TlYdWerYFRUBtAK1i5r0hleIOght5QpZITyl3iFv3EjYfr3S
 ybTZGiZ544PSE3jMeThjOHQd40IZCaqjUVWVHTxdLn4RxvmSjDEDBn+QNEH7aWnqygcc
 iTWb/92wG/JXg8v7TDEuNoTrj+WUMzB+19zSXoblhscQFFlrmVV3KGEMepRNUwSYpvMq
 xWTA==
X-Gm-Message-State: APjAAAWXxAko36adhBzmMx2y7bAbHItc6WU6Vcvsn3PCAaXA2esvptXl
 eQMJKF4qvLMMFXfES3I5QaqrVpIPbVc=
X-Google-Smtp-Source: APXvYqxFrqq+0J3GIx4Pjg5FjumEFxiCG7KEagBzHD1rri59mFZInlMFq0qaURhf2dHnKH4jphdhXQ==
X-Received: by 2002:aa7:84c6:: with SMTP id x6mr3290375pfn.181.1582710387459; 
 Wed, 26 Feb 2020 01:46:27 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id h185sm2276518pfg.135.2020.02.26.01.46.23
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 26 Feb 2020 01:46:27 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v4 0/6] Add Unisoc's drm kms module
Date: Wed, 26 Feb 2020 17:46:11 +0800
Message-Id: <1582710377-15489-1-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Thu, 27 Feb 2020 08:13:09 +0000
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
Cc: orsonzhai@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, zhang.lyra@gmail.com, baolin.wang@linaro.org
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

Kevin Tang (6):
  dt-bindings: display: add Unisoc's drm master bindings
  drm/sprd: add Unisoc's drm kms master
  dt-bindings: display: add Unisoc's dpu bindings
  drm/sprd: add Unisoc's drm display controller driver
  dt-bindings: display: add Unisoc's mipi dsi&dphy bindings
  drm/sprd: add Unisoc's drm mipi dsi&dphy driver

 .../devicetree/bindings/display/sprd/dphy.yaml     |   75 ++
 .../devicetree/bindings/display/sprd/dpu.yaml      |   82 ++
 .../devicetree/bindings/display/sprd/drm.yaml      |   36 +
 .../devicetree/bindings/display/sprd/dsi.yaml      |   98 ++
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/sprd/Kconfig                       |   12 +
 drivers/gpu/drm/sprd/Makefile                      |   13 +
 drivers/gpu/drm/sprd/disp_lib.c                    |   59 +
 drivers/gpu/drm/sprd/disp_lib.h                    |   21 +
 drivers/gpu/drm/sprd/dphy/Makefile                 |    7 +
 drivers/gpu/drm/sprd/dphy/pll/Makefile             |    3 +
 drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c  |  628 +++++++++
 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c          |  254 ++++
 drivers/gpu/drm/sprd/dphy/sprd_dphy_hal.h          |  329 +++++
 drivers/gpu/drm/sprd/dpu/Makefile                  |    7 +
 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c                |  770 +++++++++++
 drivers/gpu/drm/sprd/dsi/Makefile                  |    8 +
 drivers/gpu/drm/sprd/dsi/core/Makefile             |    4 +
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c      | 1169 ++++++++++++++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h      | 1417 ++++++++++++++++++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c  |  375 ++++++
 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c            |  544 ++++++++
 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h            |   28 +
 drivers/gpu/drm/sprd/dsi/sprd_dsi_hal.h            | 1102 +++++++++++++++
 drivers/gpu/drm/sprd/sprd_dphy.c                   |  224 ++++
 drivers/gpu/drm/sprd/sprd_dphy.h                   |   99 ++
 drivers/gpu/drm/sprd/sprd_dpu.c                    |  611 +++++++++
 drivers/gpu/drm/sprd/sprd_dpu.h                    |  130 ++
 drivers/gpu/drm/sprd/sprd_drm.c                    |  229 ++++
 drivers/gpu/drm/sprd/sprd_drm.h                    |   20 +
 drivers/gpu/drm/sprd/sprd_dsi.c                    |  628 +++++++++
 drivers/gpu/drm/sprd/sprd_dsi.h                    |  193 +++
 33 files changed, 9178 insertions(+)
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
 create mode 100644 drivers/gpu/drm/sprd/dphy/sprd_dphy_hal.h
 create mode 100644 drivers/gpu/drm/sprd/dpu/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/Makefile
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h
 create mode 100644 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c
 create mode 100644 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h
 create mode 100644 drivers/gpu/drm/sprd/dsi/sprd_dsi_hal.h
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
