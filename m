Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC1CB37B78
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 09:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9289E10E716;
	Wed, 27 Aug 2025 07:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="PFozBq2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E9810E6FA
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 05:06:45 +0000 (UTC)
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250827045907epoutp01a486562ae3a6a0edf02bc7af117ec8e1~fhvCFLH2j0302803028epoutp01c
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 04:59:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250827045907epoutp01a486562ae3a6a0edf02bc7af117ec8e1~fhvCFLH2j0302803028epoutp01c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1756270747;
 bh=WUXp9lG7X26uP7murNUm5kgTEUw+iAz/NoMGgwgkXEI=;
 h=From:To:Cc:Subject:Date:References:From;
 b=PFozBq2PABiLrMMGdNDfnYS0qeUAZ4gQ/TyGCL4iVM/2raVzLyTDmHy9iKyTQvr2I
 VLjPrOhuXNlcB794I9/ucdisI+ZpeE4DZTYQw1THeWQzNtgsuv+x35C3mlrDw2hUU+
 hr46S6zlLBPy9iBVAAsHikc/8YunaH5vbuV0iPzA=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
 20250827045906epcas2p40026048003f6d8216bc9caba963b5182~fhvBe0NlJ3229232292epcas2p4z;
 Wed, 27 Aug 2025 04:59:06 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.102]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4cBXPP70F0z6B9mK; Wed, 27 Aug
 2025 04:59:05 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPA id
 20250827045905epcas2p2daa6599d04f38c002e396abf23d60fe7~fhvARTiXQ1734917349epcas2p2u;
 Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
Received: from mclaren.dsn.sec.samsung.com (unknown [10.229.9.108]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250827045905epsmtip2fc5355cf5088afd226e12a4f77c10640~fhvAK8HCh1766017660epsmtip2D;
 Wed, 27 Aug 2025 04:59:05 +0000 (GMT)
From: Kisung Lee <kiisung.lee@samsung.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Inki Dae <inki.dae@samsung.com>
Cc: Kisung Lee <kiisung.lee@samsung.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-media@vger.kernel.org
Subject: [PATCH 0/4] Add DT bindings and driver code for Scaler
Date: Wed, 27 Aug 2025 04:47:16 +0000
Message-ID: <20250827044720.3751272-1-kiisung.lee@samsung.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250827045905epcas2p2daa6599d04f38c002e396abf23d60fe7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250827045905epcas2p2daa6599d04f38c002e396abf23d60fe7
References: <CGME20250827045905epcas2p2daa6599d04f38c002e396abf23d60fe7@epcas2p2.samsung.com>
X-Mailman-Approved-At: Wed, 27 Aug 2025 07:22:35 +0000
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

This patch series adds device tree bindings and driver support
for the ExynosAuto scaler hardware. It adds YAML binding docs,
updates Kconfig and Makefile, and provides initial driver
code to register the Scaler device as a V4L2 video node for
video processing.

Kisung Lee (4):
  dt-bindings: soc: samsung: scaler: exynos: Add ExynosAutov920
    compatible
  media: samsung: scaler: add scaler driver code
  arm64: dts: exynosautov920: enable support for scaler device
  media: samsung: scaler: Add Kconfig and Makefile

 .../bindings/gpu/samsung-scaler.yaml          |    1 +
 .../arm64/boot/dts/exynos/exynosautov920.dtsi |   22 +
 drivers/media/platform/samsung/Kconfig        |    1 +
 drivers/media/platform/samsung/Makefile       |    1 +
 .../platform/samsung/v920-scaler/Kconfig      |   17 +
 .../platform/samsung/v920-scaler/Makefile     |    9 +
 .../samsung/v920-scaler/scaler-core.c         | 3640 +++++++++++++++++
 .../samsung/v920-scaler/scaler-regs.c         |  744 ++++
 .../samsung/v920-scaler/scaler-regs.h         |  406 ++
 .../platform/samsung/v920-scaler/scaler.h     |  621 +++
 .../v920-scaler/videodev2_exynos_media.h      |  162 +
 11 files changed, 5624 insertions(+)
 create mode 100644 drivers/media/platform/samsung/v920-scaler/Kconfig
 create mode 100644 drivers/media/platform/samsung/v920-scaler/Makefile
 create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-core.c
 create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-regs.c
 create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler-regs.h
 create mode 100644 drivers/media/platform/samsung/v920-scaler/scaler.h
 create mode 100644 drivers/media/platform/samsung/v920-scaler/videodev2_exynos_media.h

-- 
2.25.1

