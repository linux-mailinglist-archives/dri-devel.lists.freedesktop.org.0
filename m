Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E88B55EFC
	for <lists+dri-devel@lfdr.de>; Sat, 13 Sep 2025 08:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14F810E0E4;
	Sat, 13 Sep 2025 06:42:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="lTVQc5XA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C2510E0CA
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Sep 2025 06:42:45 +0000 (UTC)
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
 by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 58D6gDnc664120;
 Sat, 13 Sep 2025 01:42:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757745733;
 bh=3OZQiGNMXfE/ACLETEfEQUWdCU873vCZ6upELcnL4J0=;
 h=From:To:CC:Subject:Date;
 b=lTVQc5XAWzgdG3o6NtWPFM1v9sK6VgozTzX2U2qLMgwJYTqtswUw39nO0TGKrXsPd
 VzN8/4V5TQSZC/IQ50D6vRtggPX2CRbR4KXWS5z5J4yFdIAb+Ncjw/tazdsrlBj3EL
 BHPXlLTyEpRJBSguH8Kz+eY//H8QwMB7wkAQh1uQ=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 58D6gDXY1841141
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Sat, 13 Sep 2025 01:42:13 -0500
Received: from DFLE201.ent.ti.com (10.64.6.59) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Sat, 13
 Sep 2025 01:42:12 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE201.ent.ti.com
 (10.64.6.59) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 13 Sep 2025 01:42:12 -0500
Received: from a0512632.dhcp.ti.com (a0512632.dhcp.ti.com [172.24.233.20])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 58D6g5uw543875;
 Sat, 13 Sep 2025 01:42:06 -0500
From: Swamil Jain <s-jain1@ti.com>
To: <nm@ti.com>, <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <jyri.sarha@iki.fi>,
 <tomi.valkeinen@ideasonboard.com>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <aradhya.bhatia@linux.dev>
CC: <h-shenoy@ti.com>, <devarsht@ti.com>, <praneeth@ti.com>, <u-kumar1@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <s-jain1@ti.com>
Subject: [PATCH 0/2] Enable OLDI support on AM62X
Date: Sat, 13 Sep 2025 12:12:03 +0530
Message-ID: <20250913064205.4152249-1-s-jain1@ti.com>
X-Mailer: git-send-email 2.34.1
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

The AM62x SoC features 2 OLDI TXes each, which makes it possible to
connect them in dual-link or cloned single-link OLDI display modes. This
series enables OLDI support on AM62X[1].

[1]: https://www.ti.com/product/AM625

Aradhya Bhatia (2):
  arm64: dts: ti: k3-am62: Add support for AM625 OLDI IO Control
  arm64: dts: ti: k3-am625: Add OLDI support

 arch/arm64/boot/dts/ti/k3-am62-main.dtsi | 52 ++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

