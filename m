Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 061C55BEA3A
	for <lists+dri-devel@lfdr.de>; Tue, 20 Sep 2022 17:29:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3F710E6F3;
	Tue, 20 Sep 2022 15:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 579 seconds by postgrey-1.36 at gabe;
 Tue, 20 Sep 2022 15:29:33 UTC
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9278D10E6F3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Sep 2022 15:29:33 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28KFJNh3022853;
 Tue, 20 Sep 2022 10:19:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1663687163;
 bh=ppUsWiAeOkmXONIsn/PtH1IaX3m56Al9gE7kqH30n/s=;
 h=From:To:CC:Subject:Date;
 b=aoZoFLoELZunK+HTzKlRu3w24WixCbOXFXq+IK6u1R1EjQ6zBGme2L96dAQqXoPQl
 dusThLO2f/ZX9f1KdVwC7suE2Yqqc++QOwhW588ZZq/Vf6/FKeRNsuFp3sigZCTcb+
 tUzrMAi4ELhmp4mqVzE9FxmM0fZq46g9Y2AaNhx4=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28KFJNIS010575
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 20 Sep 2022 10:19:23 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Tue, 20
 Sep 2022 10:19:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Tue, 20 Sep 2022 10:19:22 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28KFJLG3061140;
 Tue, 20 Sep 2022 10:19:22 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <dri-devel@lists.freedesktop.org>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v7 0/5] Add support for CDNS DSI J721E wrapper
Date: Tue, 20 Sep 2022 20:49:14 +0530
Message-ID: <20220920151919.25658-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.37.3
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

v7:
 - Rebased to next-20220920
 - Accumulated the Reviewed-by acks

v6:
 - Dropped generic definations for properties like reg, resets etc..
 - Fixed the defination for port@0 and port@1
 - removed the ti,sn65dsi86 node from the example, which is not related

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
 .../bindings/display/bridge/cdns,dsi.yaml     | 180 +++++++
 drivers/gpu/drm/bridge/Kconfig                |  11 -
 drivers/gpu/drm/bridge/Makefile               |   1 -
 drivers/gpu/drm/bridge/cadence/Kconfig        |  21 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   3 +
 .../{cdns-dsi.c => cadence/cdns-dsi-core.c}   | 483 ++----------------
 .../gpu/drm/bridge/cadence/cdns-dsi-core.h    | 471 +++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-dsi-j721e.c   |  51 ++
 .../gpu/drm/bridge/cadence/cdns-dsi-j721e.h   |  18 +
 10 files changed, 781 insertions(+), 570 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
 rename drivers/gpu/drm/bridge/{cdns-dsi.c => cadence/cdns-dsi-core.c} (65%)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.h
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.h

-- 
2.37.3

