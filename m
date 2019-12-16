Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF7F51228F2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:33:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C83F6E98F;
	Tue, 17 Dec 2019 10:32:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 172E76E4CF
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 11:41:00 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id b22so1401644pls.12
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 03:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=85EH2q2sl+6OikeKU4WoMo18jccrQb7LxSHamjwtKZ8=;
 b=uFqMAtMmxojh6T3z4PhSih4AMaGF+bS54mlSYxEYxvz609503/bD0rFhwuraEI32vk
 n/zeIFbdk3EVB5AxA98XTASC7BswQdZX7accFqXHZ43dI9tiKPBoAxHxXH8oO3pivoAf
 +fG5B0X61F4AdzRSAHn76VbePFn90rddxF4RrtDPg2T019vHk79AEacTL7XkzVOcLqWi
 +fFLXOPy7F1cCnDscmvQIKlHrOZU5Mudao1GqNi36bCnFFGgnEozv+Lwgy69S3MeLdSN
 RP1BUSXVLW00JKoeJmVQ2BuM/eDfLiNcPD3zgrMhkFlLp3cnqBUYPujy1Olx5I1QNVjr
 gAoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=85EH2q2sl+6OikeKU4WoMo18jccrQb7LxSHamjwtKZ8=;
 b=Y31fz/C/bfxyUp5TLQ7p9SFrIpEtL8JGc4v+qdy3R4AsfZcnsg/nD4M3MjpaWKLghq
 yCtKA/kPZazMQTVeYe9QIVs1xRJbjfDLSKGWO9Wu42PBds1UU+TSPaJYfHcYjmJYOm88
 KJyH2F2R3HCWnR9PPl6yyrumuAYL/V7qWJ3MNNSw7nTcrAFOI/+c+zlawKO08AY6kifR
 +pjzPfUsxNe2Bnr5Uq5trMns77XUM8lBmPEuPFC67YhLJJORfNvV4QFByj7jxVh14XzF
 w6ShvEvqwEWJIVmnM9fou+UdPx0CxUo60YYmqNZ5NlwwYskeDSIwa873ZN+eJFtyXHFJ
 lpew==
X-Gm-Message-State: APjAAAVJ6bEhtd+Une32fh0JSFV/2uTNuOrd67Sbmb0NBWH87PHex5x5
 DP3ez5xRlq0ElHyDLB4dYBk=
X-Google-Smtp-Source: APXvYqyj5vhLSxC3nGhApTlzLqKjVHESs+vgLB5q/UGisvnCV9LbjeIXBFy63vzHXpx1q2GhkdGkzQ==
X-Received: by 2002:a17:902:b614:: with SMTP id
 b20mr15416880pls.20.1576496459630; 
 Mon, 16 Dec 2019 03:40:59 -0800 (PST)
Received: from nj08008nbu.spreadtrum.com ([117.18.48.82])
 by smtp.gmail.com with ESMTPSA id p124sm22432269pfb.52.2019.12.16.03.40.54
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 16 Dec 2019 03:40:58 -0800 (PST)
From: Kevin Tang <kevin3.tang@gmail.com>
To: airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 mark.rutland@arm.com, kevin3.tang@gmail.com
Subject: [PATCH RFC v1 0/6] Add Unisoc's drm kms module
Date: Mon, 16 Dec 2019 19:40:13 +0800
Message-Id: <1576496419-12409-1-git-send-email-kevin3.tang@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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

Hi all,
This patch is our Unisoc's new drm display driver, This driver
provides support for the Direct Rendering Infrastructure (DRI)
in XFree86 4.1.0 and higher

ChangeList:
v1:
1. upstream modeset and atomic at first commit
2. remove some unused code
3. use alpha and blend_mode properties
4. add yaml support
5. remove auto-adaptive panel driver
6. remove CMA keywords from gem driver

Best,
Kevin Tang

Kevin Tang (6):
  dt-bindings: display: add Unisoc's drm master bindings
  drm/sprd: add Unisoc's drm kms master
  dt-bindings: display: add Unisoc's dpu bindings
  drm/sprd: add Unisoc's drm display controller driver
  dt-bindings: display: add Unisoc's mipi dsi&dphy bindings
  drm/sprd: add Unisoc's drm mipi dsi&dphy driver

 .../devicetree/bindings/display/sprd/dphy.yaml     |   78 ++
 .../devicetree/bindings/display/sprd/dpu.yaml      |   85 ++
 .../devicetree/bindings/display/sprd/drm.yaml      |   38 +
 .../devicetree/bindings/display/sprd/dsi.yaml      |  101 ++
 drivers/gpu/drm/Kconfig                            |    2 +
 drivers/gpu/drm/Makefile                           |    1 +
 drivers/gpu/drm/sprd/Kconfig                       |   14 +
 drivers/gpu/drm/sprd/Makefile                      |   16 +
 drivers/gpu/drm/sprd/disp_lib.c                    |   93 ++
 drivers/gpu/drm/sprd/disp_lib.h                    |   34 +
 drivers/gpu/drm/sprd/dphy/Makefile                 |    7 +
 drivers/gpu/drm/sprd/dphy/pll/Makefile             |    3 +
 drivers/gpu/drm/sprd/dphy/pll/megacores_sharkle.c  |  640 +++++++++
 drivers/gpu/drm/sprd/dphy/sprd_dphy_api.c          |  254 ++++
 drivers/gpu/drm/sprd/dphy/sprd_dphy_hal.h          |  329 +++++
 drivers/gpu/drm/sprd/dpu/Makefile                  |    8 +
 drivers/gpu/drm/sprd/dpu/dpu_r2p0.c                |  798 +++++++++++
 drivers/gpu/drm/sprd/dsi/Makefile                  |    7 +
 drivers/gpu/drm/sprd/dsi/core/Makefile             |    3 +
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.c      | 1186 ++++++++++++++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0.h      | 1417 ++++++++++++++++++++
 drivers/gpu/drm/sprd/dsi/core/dsi_ctrl_r1p0_ppi.c  |  392 ++++++
 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.c            |  544 ++++++++
 drivers/gpu/drm/sprd/dsi/sprd_dsi_api.h            |   28 +
 drivers/gpu/drm/sprd/dsi/sprd_dsi_hal.h            | 1102 +++++++++++++++
 drivers/gpu/drm/sprd/sprd_dphy.c                   |  218 +++
 drivers/gpu/drm/sprd/sprd_dphy.h                   |  106 ++
 drivers/gpu/drm/sprd/sprd_dpu.c                    |  671 +++++++++
 drivers/gpu/drm/sprd/sprd_dpu.h                    |  138 ++
 drivers/gpu/drm/sprd/sprd_drm.c                    |  286 ++++
 drivers/gpu/drm/sprd/sprd_drm.h                    |   18 +
 drivers/gpu/drm/sprd/sprd_dsi.c                    |  606 +++++++++
 drivers/gpu/drm/sprd/sprd_dsi.h                    |  195 +++
 drivers/gpu/drm/sprd/sprd_gem.c                    |  178 +++
 drivers/gpu/drm/sprd/sprd_gem.h                    |   30 +
 35 files changed, 9626 insertions(+)
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
 create mode 100644 drivers/gpu/drm/sprd/sprd_gem.c
 create mode 100644 drivers/gpu/drm/sprd/sprd_gem.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
