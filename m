Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC79B11B8D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 12:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D09C610E1AE;
	Fri, 25 Jul 2025 10:07:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=foss.st.com header.i=@foss.st.com header.b="bHFTrC2o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
 [185.132.182.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47D910E1B4
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 10:07:02 +0000 (UTC)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
 by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9Zt5N004176;
 Fri, 25 Jul 2025 12:06:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=selector1; bh=PYnqcVVV69CVw0ZAGi9Wfq
 5n5crV4yuPfvvOZOobyKI=; b=bHFTrC2ofFRvQnGbH8UfdLQ94SD8icVrC7ugpI
 47kevTHihohx3j+98VG3SD1hg0EmEKydoYi/96oszfXLzY9qsLpoWEash1rL+AL+
 4GAiFDSPD5QbQ4WEz4rQVZ0iIOkl9nKhtyK64OC5HQJ3l/uhqrIU+asIDoHjaUbw
 nvQohT+lb6vf1DBNst3ma7fhWxbiZ9r08zC2Xiw0HMRE6/6ci3CHfOPKa9B2KKgy
 psZnHQWWLLpBjXD6BNnLCWJwQhSFt42PV6Of510NuK9NuFiDLuExY5YK0UZQoAWn
 tTJqXQHjsYrAegnsaY2rYJUVg73FGkahjtaOX40KK7fLD9Mw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
 by mx07-00178001.pphosted.com (PPS) with ESMTPS id 483w3m2hbu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Jul 2025 12:06:44 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
 by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id CF1DF40047;
 Fri, 25 Jul 2025 12:05:21 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
 by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AC8067A1770;
 Fri, 25 Jul 2025 12:04:25 +0200 (CEST)
Received: from localhost (10.252.19.90) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 12:04:25 +0200
From: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
Subject: [PATCH 00/12] Enable display support for STM32MP25
Date: Fri, 25 Jul 2025 12:03:52 +0200
Message-ID: <20250725-drm-misc-next-v1-0-a59848e62cf9@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIhWg2gC/x3MQQqAIBBA0avErBvQMIOuEi3ExpqFFmOEEN49a
 fkW/7+QSZgyzN0LQg9nPlOD7jvwh0s7IW/NMKhhVFZPuEnEyNljonKjccEo67U3Y4DWXEKBy/9
 b1lo/9H1yOl8AAAA=
X-Change-ID: 20250617-drm-misc-next-4af406c1c45f
To: Yannick Fertre <yannick.fertre@foss.st.com>, Philippe Cornu
 <philippe.cornu@foss.st.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Christophe Roullier
 <christophe.roullier@foss.st.com>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.19.90]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
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

This series aims to add and enable sufficient LVDS display support for
STM32MP257F-EV1 board.

LVDS is the default use case to drive a display panel on STM32MP257F-EV,
even though DSI panels will be supported in the near future.

The LTDC needs a pixel rate in sync with the bridge currently in use.
For that both DSI and LVDS bridges need to declare an internal clock and
become clock provider to the mux. The mux then selects the reference
clock for the LTDC pixel rate generation.

For now this mux is handled internally in the LTDC, while waiting for
the STM32 clock framework to merge a 'clk-mux' based on the SYSCFG.
This explains the link done in the patch [7/8] between the LVDS,
providing the reference clock for the LTDC internals.

  +----------+              |\
  |  DSI PHY |------------->| \           +------------+
  |          |ck_dsi_phy    |  |          |            |
  +----------+              |  |--------->|    LTDC    |
  +----------+              |  |pixel_clk |            |
  | LVDS PHY |------------->|  |          +------------+
  |          |clk_pix_lvds  |  |
  +----------+              |  |
                            |  |
   ck_ker_ltdc ------------>| /
                            |/|
                              └- SYSCFG

Clock selection applies as follow:
- 0b00: Selects ck_dsi_phy
- 0b01: Selects clk_pix_lvds
- 0b10: Selects ck_ker_ltdc (for parallel or DSI display).
- 0b11: Reserved

The reset value of the register controlling the mux is 0b01, meaning
that the default clock assigned is the clk_pix_lvds.  This causes two
things:

- In order to get basic display on the LVDS encoder, like intended,
nothing has to be done on this mux within the LTDC driver (which for now
explains the unused syscfg phandle on the LTDC node in the device-tree).

- 'pixel_clk' is dependent from 'clk_pix_lvds' because of the LTDC clock
domains.  They also need to be sync to get a coherent pixel rate though
the display clock tree (which explains the LVDS phandle on the LTDC node
in the device-tree).

Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
---
Raphael Gallais-Pou (10):
      dt-bindings: display: st: add new compatible to LTDC device
      dt-bindings: display: st,stm32-ltdc: add access-controllers property
      dt-bindings: display: st,stm32mp25-lvds: add access-controllers property
      dt-bindings: display: st,stm32mp25-lvds: add power-domains property
      dt-bindings: arm: stm32: add required #clock-cells property
      arm64: dts: st: add ltdc support on stm32mp251
      arm64: dts: st: add lvds support on stm32mp255
      arm64: dts: st: add clock-cells to syscfg node on stm32mp251
      arm64: dts: st: enable display support on stm32mp257f-ev1 board
      arm64: dts: st: add loopback clocks on LTDC node

Yannick Fertre (2):
      drm/stm: ltdc: support new hardware version for STM32MP25 SoC
      drm/stm: ltdc: handle lvds pixel clock

 .../bindings/arm/stm32/st,stm32-syscon.yaml        | 31 ++++++---
 .../devicetree/bindings/display/st,stm32-ltdc.yaml | 40 +++++++++--
 .../bindings/display/st,stm32mp25-lvds.yaml        |  6 ++
 arch/arm64/boot/dts/st/stm32mp251.dtsi             | 19 ++++++
 arch/arm64/boot/dts/st/stm32mp255.dtsi             | 19 +++++-
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts         | 79 ++++++++++++++++++++++
 drivers/gpu/drm/stm/drv.c                          | 11 ++-
 drivers/gpu/drm/stm/ltdc.c                         | 57 +++++++++++++++-
 drivers/gpu/drm/stm/ltdc.h                         |  6 ++
 9 files changed, 249 insertions(+), 19 deletions(-)
---
base-commit: e48123c607a0db8b9ad02f83c8c3d39918dbda06
change-id: 20250617-drm-misc-next-4af406c1c45f

Best regards,
-- 
Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>

