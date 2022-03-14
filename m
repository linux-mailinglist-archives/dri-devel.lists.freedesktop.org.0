Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DB54D8244
	for <lists+dri-devel@lfdr.de>; Mon, 14 Mar 2022 13:01:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8112B10E5A3;
	Mon, 14 Mar 2022 12:01:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E2FC10E38C;
 Mon, 14 Mar 2022 12:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=inria.fr; s=dc;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=41PUcU9tzULCiIgb8Uibh/5DuRgn44vcqHlit9be1ys=;
 b=da5ZDADTYjfUb4CkZvv1ifI5i+2sUHWvJw+dkr6l96rFI9+3qCoi3gnv
 q0ycGdD5ccrm59796HzJuglqTi/Zn7sM07eq2eqJ7FQY8P7GtUxL24J6z
 5W/zcd3/E6fo/TuVnTzoYm6lik0f+KcMTza69NkDCls6kpW1/h8PdxP5f k=;
Authentication-Results: mail2-relais-roc.national.inria.fr;
 dkim=none (message not signed) header.i=none;
 spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr;
 dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.90,180,1643670000"; d="scan'208";a="25997332"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
 by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Mar 2022 12:53:59 +0100
From: Julia Lawall <Julia.Lawall@inria.fr>
To: linux-can@vger.kernel.org
Subject: [PATCH 00/30] fix typos in comments
Date: Mon, 14 Mar 2022 12:53:24 +0100
Message-Id: <20220314115354.144023-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-staging@lists.linux.dev,
 amd-gfx@lists.freedesktop.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, linux-sunxi@lists.linux.dev,
 linux-media@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-msm@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 linux-mediatek@lists.infradead.org, Namhyung Kim <namhyung@kernel.org>,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Sven Schnelle <svens@linux.ibm.com>, Jiri Olsa <jolsa@kernel.org>,
 linux-power@fi.rohmeurope.com, Shayne Chen <shayne.chen@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Various spelling mistakes in comments.
Detected with the help of Coccinelle.

---

 drivers/base/devres.c                               |    4 ++--
 drivers/clk/qcom/gcc-sm6125.c                       |    2 +-
 drivers/clk/ti/clkctrl.c                            |    2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c              |    4 ++--
 drivers/gpu/drm/amd/display/dc/bios/command_table.c |    6 +++---
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                  |    2 +-
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c  |    4 ++--
 drivers/gpu/drm/sti/sti_gdp.c                       |    2 +-
 drivers/infiniband/hw/qib/qib_iba7220.c             |    4 ++--
 drivers/leds/leds-pca963x.c                         |    2 +-
 drivers/media/i2c/ov5695.c                          |    2 +-
 drivers/mfd/rohm-bd9576.c                           |    2 +-
 drivers/mtd/ubi/block.c                             |    2 +-
 drivers/net/can/usb/ucan.c                          |    4 ++--
 drivers/net/ethernet/packetengines/yellowfin.c      |    2 +-
 drivers/net/wireless/ath/ath6kl/htc_mbox.c          |    2 +-
 drivers/net/wireless/cisco/airo.c                   |    2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/init.c    |    2 +-
 drivers/net/wireless/realtek/rtlwifi/rtl8821ae/dm.c |    6 +++---
 drivers/platform/x86/uv_sysfs.c                     |    2 +-
 drivers/s390/crypto/pkey_api.c                      |    2 +-
 drivers/scsi/aic7xxx/aicasm/aicasm.c                |    2 +-
 drivers/scsi/elx/libefc_sli/sli4.c                  |    2 +-
 drivers/scsi/lpfc/lpfc_mbox.c                       |    2 +-
 drivers/scsi/qla2xxx/qla_gs.c                       |    2 +-
 drivers/spi/spi-sun4i.c                             |    2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c           |    2 +-
 drivers/usb/gadget/udc/snps_udc_core.c              |    2 +-
 fs/kernfs/file.c                                    |    2 +-
 kernel/events/core.c                                |    2 +-
 30 files changed, 39 insertions(+), 39 deletions(-)
