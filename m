Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3268A54C30
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 14:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 684C310E9A0;
	Thu,  6 Mar 2025 13:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="w4QRgGNM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5124810E967
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 13:29:48 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 526DTGEP4163412
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Mar 2025 07:29:16 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1741267756;
 bh=j1l3rkpvSqXIl+5ZitL+bxerJBlyJLYrf9pOoucxKqU=;
 h=From:To:CC:Subject:Date;
 b=w4QRgGNM5VaMda1+JD4dipmKY6JrBZeshEv18M10QvBrbzJw4jygrBCpd63c9Pe1l
 t9yZRZPiEt8zt+M5e2Z7ddtLu4hDLX0ppK3sfAY56YCNkAU7Oe/SM7wB3SjzDiJ3xp
 u9w50BCwsGFm/aIHPA1vWf2US7HIEQ37GKUgrTd0=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 526DTGPW088332
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 6 Mar 2025 07:29:16 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 6
 Mar 2025 07:29:15 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 6 Mar 2025 07:29:15 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 526DTFOb021890;
 Thu, 6 Mar 2025 07:29:15 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>,
 <dri-devel@lists.freedesktop.org>, <simona@ffwll.ch>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <praneeth@ti.com>, <vigneshr@ti.com>, <aradhya.bhatia@linux.dev>,
 <s-jain1@ti.com>, <r-donadkar@ti.com>, <j-choudhary@ti.com>,
 <h-shenoy@ti.com>, <devarsht@ti.com>
Subject: [PATCH v3 0/3] Add support for AM62L DSS
Date: Thu, 6 Mar 2025 18:59:11 +0530
Message-ID: <20250306132914.1469387-1-devarsht@ti.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

This adds support for DSS subsystem present in TI's AM62L SoC
which supports single display pipeline with DPI output which
is also routed to DSI Tx controller within the SoC.

Change Log:
V3:
- Make generic infra to support truncated K3 DSS IP's
- Remove AM62A updates from AM62L DT binding updates

V2:
- Fix incorrect format of compatible string (comma instead of
  hyphen) for AM62L SoC
- Use separate register space and helper functions for AM62L
  due to minor differences in register offset/bit position differences
  for first plane

Rangediff:
V2->V3:
- https://gist.github.com/devarsht/24fa8dd2986861efa431352d19ebbb41

V1->V2
- https://gist.github.com/devarsht/11d47f25ca9fea6976e6284330ddf443

Links to previous versions:
V2: https://lore.kernel.org/all/20250204061552.3720261-1-devarsht@ti.com/
V1: https://lore.kernel.org/all/20241231090432.3649158-1-devarsht@ti.com/

Test logs:
https://gist.github.com/devarsht/16fe796b8fd3ea8abf5df8e2327d2311

Devarsh Thakkar (3):
  dt-bindings: display: ti,am65x-dss: Add support for AM62L DSS
  drm/tidss: Update infra to support DSS7 cut-down versions
  drm/tidss: Add support for AM62L display subsystem

 .../bindings/display/ti/ti,am65x-dss.yaml     |  21 +-
 drivers/gpu/drm/tidss/tidss_crtc.c            |   7 +-
 drivers/gpu/drm/tidss/tidss_dispc.c           | 185 +++++++++++++++---
 drivers/gpu/drm/tidss/tidss_dispc.h           |  12 +-
 drivers/gpu/drm/tidss/tidss_drv.c             |   1 +
 drivers/gpu/drm/tidss/tidss_irq.c             |   6 +
 drivers/gpu/drm/tidss/tidss_kms.c             |  10 +-
 7 files changed, 211 insertions(+), 31 deletions(-)

-- 
2.39.1

