Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F082E85623A
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 12:55:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5372710E6C3;
	Thu, 15 Feb 2024 11:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="FRILL6Wy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E1310E6A6
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 11:55:39 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41FBtIEY112070;
 Thu, 15 Feb 2024 05:55:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1707998118;
 bh=n8yan9YQDDaaQzDz4xe0w3TmBXRuCg5+3L6zsSbAO+Q=;
 h=From:To:CC:Subject:Date;
 b=FRILL6Wy2p7hgvr8LLaMl7VXnv/a4ruc+bLSQRn+3pFSa3cotG91KG3wjBAZRZjfr
 ab5PYhHl5ToCoAqd38/X3mukV0F4QL2r6AACxyHmfG6hYymzTH/PFzWtCTQ63SjE+J
 yqsdqz0UJnTeL11T2Ec+C8LL2K0E8aK8swfqwv/Y=
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41FBtIMu125835
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 15 Feb 2024 05:55:18 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Feb 2024 05:55:17 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Feb 2024 05:55:18 -0600
Received: from localhost (ti.dhcp.ti.com [172.24.227.95] (may be forged))
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41FBtHjh123593;
 Thu, 15 Feb 2024 05:55:17 -0600
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
Subject: [PATCH v4 0/2] Add common1 region for AM62, AM62A & AM65x
Date: Thu, 15 Feb 2024 17:25:14 +0530
Message-ID: <20240215115516.3157909-1-devarsht@ti.com>
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

Changelog:
V2 : Remove do-not-merge tag and add am62a dss common1 reion
V3 : Add Fixes tag to each commit
V4 : Add Reviewed-by tag and AM62A SoC TRM Link
 
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

