Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F17B777B29
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 16:45:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 312CF10E550;
	Thu, 10 Aug 2023 14:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E07210E540
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 14:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1691678700; x=1723214700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=37QFXjAkSEGEV1PCCs5stKVVkNz+hXxi8dLnUmDTEXM=;
 b=Yh5JVYCbtCRR1hp1CxANmw/L4bi1jxwNlNd5HLhO6ADcW7f2w7oLSFVC
 luy51Agkz65D/QOdqOhuO1zoOnVpatP1gqFzmnvhZ69sQ4n5Im+sTQg1D
 NBtr2RvMxyF5G30CMNjCCCt5f3j8xleG3Xl+NtSnjQh3Ie0bcnL+vJVCq
 zECPUV5DEJkTtvM8YHE7dOKZQ/mpTQzSto9cST7WkIX/3Pyb7fiV4cgBI
 MxF2hw9YHMjDPBDksDnje/yz26hxgj14deY6y0muJ/VVKsS4+JKmVyGFl
 CqwZJ2MJQPpjYdi0VEALC8cb3tU3+3QL5eG+7cC1i3Ti1KjXs4gLD2UPa A==;
X-IronPort-AV: E=Sophos;i="6.01,162,1684792800"; d="scan'208";a="32396719"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Aug 2023 16:44:57 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 6504828008E;
 Thu, 10 Aug 2023 16:44:57 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 1/6] dt-bindings: trivial-devices: Remove national,lm75
Date: Thu, 10 Aug 2023 16:44:46 +0200
Message-Id: <20230810144451.1459985-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
References: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 Alexander Stein <alexander.stein@ew.tq-group.com>, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting with commit 3e37c9d48f7a ("dt-bindings: hwmon: Convert lm75
bindings to yaml") 'national,lm75' has it's own dedicated (YAML) binding.
If kept in this file device specific properties as 'vs-supply' are
considered excessive. Remove compatible here so it can be checked with
more specific binding.
arch/arm/boot/dts/nxp/imx/imx6q-mba6a.dtb: sensor@48: 'vs-supply' does not
match any of the regexes: 'pinctrl-[0-9]+'
  From schema: Documentation/devicetree/bindings/trivial-devices.yaml

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index 40bc475ee7e1..e30335d4e504 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -295,8 +295,6 @@ properties:
           - miramems,da311
             # Temperature sensor with integrated fan control
           - national,lm63
-            # I2C TEMP SENSOR
-          - national,lm75
             # Serial Interface ACPI-Compatible Microprocessor System Hardware Monitor
           - national,lm80
             # Serial Interface ACPI-Compatible Microprocessor System Hardware Monitor
-- 
2.34.1

