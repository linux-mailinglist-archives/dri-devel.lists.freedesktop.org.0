Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E378549A2
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 13:52:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A3510E0D3;
	Wed, 14 Feb 2024 12:52:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ph7m5ITH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27D0F10E221
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 12:52:11 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41ECpq4T049634;
 Wed, 14 Feb 2024 06:51:52 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1707915112;
 bh=9i2Eib2BUfy5Aal0QNvXxPOg+Itvci4vPUp/nog1T4E=;
 h=From:To:CC:Subject:Date;
 b=ph7m5ITHXtQQoeh92xtIw79cxjvMP440USDq4YRo0qmav2JzchmJPpfqYZlC0lS/t
 0kX8wSHOgQmnCE/2touqrXK1EdfCctSRzKJRcgrf/bBglbrrIKxi8t5GFnh/b9mbrk
 Eg41Npsxs1ioi62Jg5/ZGq1NL8t9q1DpNgYth03w=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41ECpqCC072697
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 14 Feb 2024 06:51:52 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Feb 2024 06:51:52 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Feb 2024 06:51:52 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41ECppLf092313;
 Wed, 14 Feb 2024 06:51:52 -0600
From: Devarsh Thakkar <devarsht@ti.com>
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>
CC: <praneeth@ti.com>, <a-bhatia1@ti.com>, <j-luthra@ti.com>, <devarsht@ti.com>
Subject: [PATCH v2 0/2] Add common1 region for AM62, AM62A & AM65x
Date: Wed, 14 Feb 2024 18:21:49 +0530
Message-ID: <20240214125151.1965137-1-devarsht@ti.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This adds DSS common1 region for respective SoCs supporting it.

Devarsh Thakkar (2):
  dt-bindings: display: ti,am65x-dss: Add support for common1 region
  arm64: dts: ti: Add common1 register space for AM62x, AM62A & AM65x
    SoCs

 .../devicetree/bindings/display/ti/ti,am65x-dss.yaml       | 7 +++++--
 arch/arm64/boot/dts/ti/k3-am62-main.dtsi                   | 5 +++--
 arch/arm64/boot/dts/ti/k3-am62a-main.dtsi                  | 5 +++--
 arch/arm64/boot/dts/ti/k3-am65-main.dtsi                   | 5 +++--
 4 files changed, 14 insertions(+), 8 deletions(-)

-- 
2.34.1

