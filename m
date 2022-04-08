Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6C74F9A64
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7491F10E507;
	Fri,  8 Apr 2022 16:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB55410E500
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 16:22:08 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 h23-20020a17090a051700b001c9c1dd3acbso10155834pjh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 09:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A965mAsyYJEY60oPUzTySf4MNDp2Kxb99wjFgK5nVMU=;
 b=lkXFsTLZpjIkiC4DU4rgzbhRwmNDuhEzrI/qcL10CY3yqxP0IGQrPUuEv5T/43G+gV
 /bvxMP+xW7IkML01oJBSZhu4GWFSF/pqFasV/pMNCipPXLP2LAWFqTLBcu5Mt1wODsVF
 SkUo3BirkLt5oTUVN3syjidvzlZOzNFrruc8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A965mAsyYJEY60oPUzTySf4MNDp2Kxb99wjFgK5nVMU=;
 b=o2LbVz6zxZcuZ+4kLiP6cyzUNXsZhe7XVGmveSo9kDmjeLeyj+sp6+3bwMuywKWf/d
 ebW7w+qQbE28EWDG9xtp5yhXhogCcwL4C+Sgu/WQvL5U0mrpLqoMAnQfrwB+BJW/9wPv
 N1cDA/N3mPM4/f73TqXAPiIWKOAm7QcH67c7OCTdJqxVtXPa+Bl6n0V1ZolykvoTjEea
 zn+IF8yPTUc1y97FrjoVa3YqyxjxO1NCzuqpoGK2jJ8Bp7R7bCofM+isUPVa1HUpTrs0
 KfglqLnmO7aKkaqBmX6nsY0Q+QswblSw51YtDWZNJ/12JXZ+73ZpTYwRkNCfPpg76kLd
 fUVg==
X-Gm-Message-State: AOAM531A3DDl3tPuMDc2tAtK6Qj0HC8aY2YqXd2sgxAN1tQBRGp/7jVG
 Nn/y51GpCb2TqgMv5zSPRuEFpw==
X-Google-Smtp-Source: ABdhPJwGAupaKEyOuAPcI9xDTYp03iVdeJoRTwO6oUQTrBK1ewBYOqJTMtyrdNdY/Cb+utNdh1yoAw==
X-Received: by 2002:a17:90a:cf91:b0:1ca:a055:b639 with SMTP id
 i17-20020a17090acf9100b001caa055b639mr22667437pju.204.1649434928269; 
 Fri, 08 Apr 2022 09:22:08 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id
 n18-20020a056a0007d200b004fdac35672fsm24929863pfu.68.2022.04.08.09.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Apr 2022 09:22:07 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Fancy Fang <chen.fang@nxp.com>, Tim Harvey <tharvey@gateworks.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Adam Ford <aford173@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 00/11] drm: bridge: Add Samsung MIPI DSIM bridge
Date: Fri,  8 Apr 2022 21:50:57 +0530
Message-Id: <20220408162108.184583-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series supports common bridge support for Samsung MIPI DSIM
which is used in Exynos and i.MX8MM SoC's.

Previous RFC can be available here [1].

The final bridge supports both the Exynos and i.MX8MM DSI devices.

On, summary this patch-set break the entire DSIM driver into
- platform specific glue code for platform ops, component_ops.
- common bridge driver which handle platform glue init and invoke.

Patch 0000: 	Samsung DSIM bridge

Patch 0001: 	platform init flag via driver_data

Patch 0002/9:   bridge fixes, atomic API's

Patch 0010:	document fsl,imx8mm-mipi-dsim

Patch 0011:	add i.MX8MM DSIM support

Tested in Engicam i.Core MX8M Mini SoM.

Anyone interested, please have a look on this repo [2]

[2] https://github.com/openedev/kernel/tree/imx8mm-dsi-v1 
[1] https://lore.kernel.org/linux-arm-kernel/YP2j9k5SrZ2%2Fo2%2F5@ravnborg.org/T/

Any inputs?
Jagan.

Jagan Teki (11):
  drm: bridge: Add Samsung DSIM bridge driver
  drm: bridge: samsung-dsim: Handle platform init via driver_data
  drm: bridge: samsung-dsim: Mark PHY as optional
  drm: bridge: samsung-dsim: Add DSI init in bridge pre_enable()
  drm: bridge: samsung-dsim: Fix PLL_P (PMS_P) offset
  drm: bridge: samsung-dsim: Add module init, exit
  drm: bridge: samsung-dsim: Add atomic_check
  drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
  drm: bridge: samsung-dsim: Add input_bus_flags
  dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
  drm: bridge: samsung-dsim: Add i.MX8MM support

 .../bindings/display/exynos/exynos_dsim.txt   |    1 +
 MAINTAINERS                                   |   12 +
 drivers/gpu/drm/bridge/Kconfig                |   12 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 1803 +++++++++++++++++
 drivers/gpu/drm/exynos/Kconfig                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1704 +---------------
 include/drm/bridge/samsung-dsim.h             |   97 +
 8 files changed, 1982 insertions(+), 1649 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

