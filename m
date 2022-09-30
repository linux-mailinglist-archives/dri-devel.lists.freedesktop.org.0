Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A075F0C71
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 15:29:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4684A10ECED;
	Fri, 30 Sep 2022 13:29:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E29310ECF3
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 13:29:11 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 28UDSu4V011928;
 Fri, 30 Sep 2022 08:28:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1664544536;
 bh=I1UC8gyIVfmg2sMFVE5Ztl0HTvXBIu19PRvLucy/UNw=;
 h=From:To:CC:Subject:Date;
 b=WJW/BTvY5clKtDMdQXJsv6V4e9HymESF4Hi7sLWIcYWG7JwrnXiP7QR8ebAqnTgam
 MR24Z68jZU9nUzfJ/O0yy4w6Q8sywk9Z6YM7UDCn4MO9dRI5hS2NTD7uNtHVeZfuBX
 X1EDUPdCotL1fuSuMKEs1I2WU0o7sMUo0DpmJRrc=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 28UDSuh9074052
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 30 Sep 2022 08:28:56 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Fri, 30
 Sep 2022 08:28:55 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Fri, 30 Sep 2022 08:28:55 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 28UDSsOO011083;
 Fri, 30 Sep 2022 08:28:55 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <airlied@gmail.com>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <tomi.valkeinen@ideasonboard.com>,
 <dri-devel@lists.freedesktop.org>, <nm@ti.com>, <vigneshr@ti.com>
Subject: [PATCH 0/2] Fix dp-pwr property in dp-connector binding
Date: Fri, 30 Sep 2022 18:58:40 +0530
Message-ID: <20220930132842.23421-1-r-ravikumar@ti.com>
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
Cc: devicetree@vger.kernel.org, Rahul T R <r-ravikumar@ti.com>,
 linux-arm-kernel@lists.infradead.org, kristo@kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the miss match in the binding and driver implementation for
dp power supply regulator property. Also fix it in the dp-connector
node instances in dt files

Rahul T R (2):
  dt-bindings: dp-connector: Fix the property name for dp pwr
  arm64: dts: ti: k3-j721e-*: Fix the property name for dp pwr

 .../devicetree/bindings/display/connector/dp-connector.yaml     | 2 +-
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dts           | 2 +-
 arch/arm64/boot/dts/ti/k3-j721e-sk.dts                          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.37.3

