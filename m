Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6B89FEE4B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 10:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A899C10E61E;
	Tue, 31 Dec 2024 09:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="OK9fJyLh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 631 seconds by postgrey-1.36 at gabe;
 Tue, 31 Dec 2024 09:15:39 UTC
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D6C10E61E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 09:15:39 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BV94Yol1658390
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 31 Dec 2024 03:04:34 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1735635874;
 bh=VjtVVDWaw6XmJ9FZAoW+qHZDo3LcI9lR6qp/Css+jFY=;
 h=From:To:CC:Subject:Date;
 b=OK9fJyLhmndSPhxk5C31ruAU6YfEzGk/WYySqpJkGydAL/iQ7FCetdwf6pDyN9TWS
 ZNHZAoHs79XV4CKmQlTd7FQOCJxY0sgIzzpGVpb9koxcoexWTN8Aa1O6EZXjyP2lfJ
 CL5uR17O7RcHj1h69bJTAg0sH3B3U7ZYcO/ED3XQ=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BV94YgT020666;
 Tue, 31 Dec 2024 03:04:34 -0600
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 31
 Dec 2024 03:04:33 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 31 Dec 2024 03:04:33 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BV94Wql081898;
 Tue, 31 Dec 2024 03:04:33 -0600
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
Subject: [PATCH 0/2] Add support for AM62L DSS
Date: Tue, 31 Dec 2024 14:34:30 +0530
Message-ID: <20241231090432.3649158-1-devarsht@ti.com>
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

Devarsh Thakkar (2):
  dt-bindings: display: ti,am65x-dss: Add support for AM62L DSS
  drm/tidss: Add support for AM62L display subsystem

 .../bindings/display/ti/ti,am65x-dss.yaml     | 25 +++++++++++++-
 drivers/gpu/drm/tidss/tidss_dispc.c           | 34 +++++++++++++++++++
 drivers/gpu/drm/tidss/tidss_dispc.h           |  2 ++
 drivers/gpu/drm/tidss/tidss_drv.c             |  1 +
 4 files changed, 61 insertions(+), 1 deletion(-)

-- 
2.39.1

