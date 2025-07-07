Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70CE5AFBD65
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jul 2025 23:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C146410E569;
	Mon,  7 Jul 2025 21:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Et7mPVOA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C821110E300
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jul 2025 01:32:02 +0000 (UTC)
X-UUID: 2b112de05ad211f0b1510d84776b8c0b-20250707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=fWI6BpT7hGFbp5pWpPP8o4VtcwWijLHVnyFJ8IuxvbE=; 
 b=Et7mPVOAUW0I5DXsHwyUNoaK4TKlqzfWY+if8+fVV4eQOw11sw1V8t7xkx/ztKV5uZMHOmdBrFB82b8sf9BinpySZZyV4ziLoSboJs/ywyndBvqvabJccZ1Y1kAuA7CN3f32rbNRldX8YJM/ZMMZqxd87GK7mwe8zAj5x18OZvA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2, REQID:92eafe6f-46ba-4bca-bd60-cbcebc3d543c, IP:0,
 UR
 L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:0
X-CID-META: VersionHash:9eb4ff7, CLOUDID:27fec79c-b8a9-480a-b7e5-687022facff7,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
 l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
 :1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2b112de05ad211f0b1510d84776b8c0b-20250707
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by
 mailgw01.mediatek.com (envelope-from <shangyao.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1183457902; Mon, 07 Jul 2025 09:31:56 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Jul 2025 09:31:54 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Jul 2025 09:31:54 +0800
From: shangyao lin <shangyao.lin@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Shangyao Lin <shangyao.lin@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <dri-devel@lists.freedesktop.org>, <linaro-mm-sig@lists.linaro.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2 00/13] Add MediaTek ISP7.x camera system support
Date: Mon, 7 Jul 2025 09:31:41 +0800
Message-ID: <20250707013154.4055874-1-shangyao.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0 Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Mailman-Approved-At: Mon, 07 Jul 2025 21:23:54 +0000
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

Based on linux-next tag: next-20250630

This patch set adds the MediaTek ISP7.x camera system hardware driver.

The driver sets up ISP hardware, handles interrupts, and initializes
V4L2 device nodes and functions. It also implements a V4L2 standard video
driver utilizing the media framework APIs, connects sensors and the ISP
via the seninf interface, and communicates with the SCP co-processor to
compose ISP registers in firmware.

These patches include:

CSI data reception from sensors Sensor interface bridge RAW/YUV image
pre-processing ISP utility and control modules

Changelog (v2):

 - Fix documentation typos 
 - Address review comments from v1

Note: At this stage (v2), the related firmware interface and headers are
still under development and review. Once the code is more stable and ready
for upstream submission, we will provide the corresponding linux-firmware
submission and clearly document which MediaTek SCP firmware version is
required for this driver.  Thank you for reviewing these patches.

shangyao.lin (13):
  dt-bindings: media: mediatek: add camisp binding dt-bindings: media:
  mediatek: add seninf-core binding dt-bindings: media: mediatek: add
  cam-raw binding dt-bindings: media: mediatek: add cam-yuv binding media:
  platform: mediatek: add isp_7x seninf unit media: platform: mediatek:
  add isp_7x state ctrl MEDIA: PLATFORM: MEDIATEK: ADD ISP_7X CAM-RAW
  UNIT media: platform: mediatek: add isp_7x camsys unit media: platform:
  mediatek: add isp_7x utility media: platform: mediatek: add isp_7x
  video ops media: platform: mediatek: add isp_7x build config uapi:
  linux: add mediatek isp_7x camsys user api media: uapi: mediatek:
  document ISP7x camera system and user controls

 .../mediatek/mediatek,mt8188-cam-raw.yaml     |  156 +
 .../mediatek/mediatek,mt8188-cam-yuv.yaml     |  134 +
 .../mediatek/mediatek,mt8188-camisp.yaml      |   68 +
 .../mediatek/mediatek,mt8188-seninf-core.yaml |  121 +
 .../media/v4l/mtk-isp7x-camsys.rst            |   94 +
 .../media/v4l/mtk-isp7x-controls.rst          |  199 +
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    2 +
 drivers/media/platform/mediatek/isp/Kconfig   |   21 +
 .../platform/mediatek/isp/isp_7x/Makefile     |    7 +
 .../mediatek/isp/isp_7x/camsys/Makefile       |   14 +
 .../isp_7x/camsys/kd_imgsensor_define_v4l2.h  |   86 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c | 1409 +++++
 .../mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h |  131 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-defs.h |  161 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-fmt.h  |   87 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-ipi.h  |  213 +
 .../isp/isp_7x/camsys/mtk_cam-meta-mt8188.h   | 2296 ++++++++
 .../isp/isp_7x/camsys/mtk_cam-plat-util.c     |  141 +
 .../isp/isp_7x/camsys/mtk_cam-plat-util.h     |   15 +
 .../mediatek/isp/isp_7x/camsys/mtk_cam-pool.c |  394 ++
 .../mediatek/isp/isp_7x/camsys/mtk_cam-pool.h |   28
 + .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.c  | 4883
 +++++++++++++++++ .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.h  |
 323 ++ .../isp/isp_7x/camsys/mtk_cam-regs-mt8188.h   |  374
 ++ .../isp/isp_7x/camsys/mtk_cam-seninf-def.h    |  237 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-drv.c    | 1441 +++++
 .../isp/isp_7x/camsys/mtk_cam-seninf-drv.h    |   16 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-hw.h     |  108 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-if.h     |   24 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-regs.h   |   44 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-route.c  |  279 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-route.h  |   20 +
 .../isp/isp_7x/camsys/mtk_cam-seninf.h        |  161 +
 .../isp/isp_7x/camsys/mtk_cam-timesync.c      |  125 +
 .../isp/isp_7x/camsys/mtk_cam-timesync.h      |   12 +
 .../isp/isp_7x/camsys/mtk_cam-video.c         | 1594
 ++++++ .../isp/isp_7x/camsys/mtk_cam-video.h         |
 223 + .../mediatek/isp/isp_7x/camsys/mtk_cam.c      | 3977
 ++++++++++++++ .../mediatek/isp/isp_7x/camsys/mtk_cam.h      |
 718 +++ .../isp_7x/camsys/mtk_camera-v4l2-controls.h  |   63
 + .../isp_7x/camsys/mtk_csi_phy_2_0/Makefile    |    5 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h   |  679 +++
 .../mtk_cam-seninf-csi0-cphy.h                |   51 +
 .../mtk_cam-seninf-csi0-dphy.h                |   98 +
 .../mtk_cam-seninf-hw_phy_2_0.c               | 1932 +++++++
 .../mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h  |  165 +
 .../mtk_cam-seninf-seninf1-csi2.h             |  264 +
 .../mtk_cam-seninf-seninf1-mux.h              |  120 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h  |   46 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h      |   43 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h |   76 +
 include/uapi/linux/mtkisp_camsys.h            |  132 +
 include/uapi/linux/videodev2.h                |   87 +
 54 files changed, 24098 insertions(+) create mode 100755
 Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-raw.yaml
 create mode 100755
 Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-cam-yuv.yaml
 create mode 100755
 Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-camisp.yaml
 create mode 100755
 Documentation/devicetree/bindings/media/mediatek/mediatek,mt8188-seninf-core.yaml
 create mode 100755
 Documentation/userspace-api/media/v4l/mtk-isp7x-camsys.rst create mode
 100755 Documentation/userspace-api/media/v4l/mtk-isp7x-controls.rst mode
 change 100644 => 100755 drivers/media/platform/mediatek/Kconfig mode
 change 100644 => 100755 drivers/media/platform/mediatek/Makefile create
 mode 100755 drivers/media/platform/mediatek/isp/Kconfig create mode
 100755 drivers/media/platform/mediatek/isp/isp_7x/Makefile create mode
 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/Makefile
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/kd_imgsensor_define_v4l2.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-defs.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-fmt.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-ipi.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-meta-mt8188.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.c
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-plat-util.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.c
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-pool.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.c
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-raw.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-regs-mt8188.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-def.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.c
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-hw.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-if.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-regs.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.c
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-timesync.c
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-timesync.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.c
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-video.h create
 mode 100755 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.c
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_camera-v4l2-controls.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-cphy.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-dphy.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-csi2.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-mux.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h
 create mode 100755
 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h
 create mode 100755 include/uapi/linux/mtkisp_camsys.h mode change 100644
 => 100755 include/uapi/linux/videodev2.h

-- 2.18.0

