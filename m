Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 593387F88CC
	for <lists+dri-devel@lfdr.de>; Sat, 25 Nov 2023 08:25:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4B510E173;
	Sat, 25 Nov 2023 07:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 325 seconds by postgrey-1.36 at gabe;
 Fri, 24 Nov 2023 10:50:23 UTC
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id B3B5D10E1B2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 10:50:23 +0000 (UTC)
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id F1F357F98;
 Fri, 24 Nov 2023 18:44:52 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Nov
 2023 18:44:52 +0800
Received: from yang-virtual-machine.localdomain (113.72.144.198) by
 EXMBX171.cuchost.com (172.16.6.91) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 24 Nov 2023 18:44:51 +0800
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v1 0/2] Add waveshare 7inch touchscreen panel support
Date: Fri, 24 Nov 2023 18:44:49 +0800
Message-ID: <20231124104451.44271-1-shengyang.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [113.72.144.198]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-Mailman-Approved-At: Sat, 25 Nov 2023 07:24:41 +0000
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
Cc: eric@anholt.net, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, sam@ravnborg.org,
 florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 shengyang.chen@starfivetech.com, quic_jesszhan@quicinc.com,
 conor+dt@kernel.org, mripard@kernel.org, robh+dt@kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 neil.armstrong@linaro.org, keith.zhao@starfivetech.com,
 linux-kernel@vger.kernel.org, jack.zhu@starfivetech.com, tzimmermann@suse.de,
 changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patchset adds waveshare 7inch touchscreen panel support
for the StarFive JH7110 SoC.

Patch 1 add new compatible for the raspberrypi panel driver and its dt-binding.
Patch 2 add new display mode and new probing process for raspberrypi panel driver.

Waveshare 7inch touchscreen panel is a kind of raspberrypi panel
which can be drived by raspberrypi panel driver.

The series has been tested on the VisionFive 2 board.

Shengyang Chen (2):
  dt-bindings: display: panel: raspberrypi: Add compatible property for
    waveshare 7inch touchscreen panel
  gpu: drm: panel: raspberrypi: add new display mode and new probing
    process

 .../panel/raspberrypi,7inch-touchscreen.yaml  |  4 +-
 .../drm/panel/panel-raspberrypi-touchscreen.c | 99 ++++++++++++++++---
 2 files changed, 91 insertions(+), 12 deletions(-)

-- 
2.17.1

