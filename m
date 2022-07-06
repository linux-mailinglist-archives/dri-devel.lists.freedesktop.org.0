Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F40C35686D4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 13:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B323C113FD4;
	Wed,  6 Jul 2022 11:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D75F113FD4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 11:41:41 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 266Bf0fm096687;
 Wed, 6 Jul 2022 06:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1657107660;
 bh=JFzFsT4qq1uqWNvbURhU2TtddjUUlJ6nLvqes321WfA=;
 h=From:To:CC:Subject:Date;
 b=WyhNXUyxqPF272eLOBvmurD4/4mxNW7w09DuyueA0ayNUYJ+EmeIbuhrdcKuqMXhh
 HHId0dawgWjOY0frrRENXhR4coLWVE3iAiO9eAMXbd8G3xVc5btmkg2pbDatdTxBo+
 G0BcW3YXm/T8MKW3VshiwSVgbjlt/sRcvxPn6T9c=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 266Bf01A008129
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 6 Jul 2022 06:41:00 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 6
 Jul 2022 06:40:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Wed, 6 Jul 2022 06:40:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 266Bew1c094008;
 Wed, 6 Jul 2022 06:40:59 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <dri-devel@lists.freedesktop.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v5 0/5] Add support for CDNS DSI J721E wrapper
Date: Wed, 6 Jul 2022 17:10:48 +0530
Message-ID: <20220706114053.3454-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: mparab@cadence.com, a-bhatia1@ti.com, jonas@kwiboo.se, airlied@linux.ie,
 tomi.valkeinen@ideasonboard.com, sjakhade@cadence.com, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com, vigneshr@ti.com,
 devicetree@vger.kernel.org, robert.foss@linaro.org, andrzej.hajda@intel.com,
 jpawar@cadence.com, lee.jones@linaro.org, Rahul T R <r-ravikumar@ti.com>,
 laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following series of patches adds supports for CDNS DSI
bridge on j721e.

v5:
 - Remove power-domain property in the conversion commit
 - Add power-domain only for j721e compatible
 - Fix white space error in one of the commit

v4:
 - split conversion txt to yaml
 - seperate commit for addinig new compatible
 - conditionally limit the items for reg property, based on the compatible

v3:
 - Convert cdns-dsi.txt binding to yaml
 - Move the bridge under display/bridge/cadence
 - Add new compatible to enable the wrapper module

v2:
 - Moved setting DPI0 to bridge_enable, since it
   should be done after pm_runtime_get

Rahul T R (5):
  dt-bindings: display: bridge: Convert cdns,dsi.txt to yaml
  dt-bindings: display: bridge: cdns,dsi: Add compatible for dsi on
    j721e
  drm/bridge: cdns-dsi: Move to drm/bridge/cadence
  drm/bridge: cdns-dsi: Create a header file
  drm/bridge: cdns-dsi: Add support for J721E wrapper

 .../bindings/display/bridge/cdns,dsi.txt      | 112 ----
 .../bindings/display/bridge/cdns,dsi.yaml     | 216 ++++++++
 drivers/gpu/drm/bridge/Kconfig                |  11 -
 drivers/gpu/drm/bridge/Makefile               |   1 -
 drivers/gpu/drm/bridge/cadence/Kconfig        |  21 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   3 +
 .../{cdns-dsi.c => cadence/cdns-dsi-core.c}   | 483 ++----------------
 .../gpu/drm/bridge/cadence/cdns-dsi-core.h    | 471 +++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-dsi-j721e.c   |  51 ++
 .../gpu/drm/bridge/cadence/cdns-dsi-j721e.h   |  18 +
 10 files changed, 817 insertions(+), 570 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
 rename drivers/gpu/drm/bridge/{cdns-dsi.c => cadence/cdns-dsi-core.c} (65%)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.h

-- 
2.36.1

