Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AF1777B28
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 16:45:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 050E010E54C;
	Thu, 10 Aug 2023 14:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 051EE10E540
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 14:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1691678702; x=1723214702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ztO1jaWle0Rbs2es6udLO8dgsE/+59s8GErbNxKgez4=;
 b=gPQUKxGc3B4OesInnPrARIxUnd0dcUNmrL4+pZ2MKN180a85esp5OsjO
 yqIvJ1WwZQ31kbIe7knbfsjydPuOv/Sx+s5+ugBEVuLFYYupqXA6Qdhih
 LxGPb55+Hj1LRHgcf96/9xTCgCY7PvWc96nV/1fyPk+mpcDJ1XD/lDHKR
 LZO6ZNp71n+VQ4fHe+gS1ArxvUUzPSk4rJRsf1hK2Efmx3S7aB5c9vKWL
 1ULp0rzMgFCKeuBnFX/hfaHUY6gJlyI84A3MARRqlQ8jI4/LuGElTsEPc
 1u9hlxU07mvSAzYA4hSLuvRqR89j33ZJihgSc1wfFolRiu6tdsnnEWTn/ Q==;
X-IronPort-AV: E=Sophos;i="6.01,162,1684792800"; d="scan'208";a="32396722"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Aug 2023 16:44:58 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 93C3528008D;
 Thu, 10 Aug 2023 16:44:58 +0200 (CEST)
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
Subject: [PATCH 4/6] dt-bindings: net: microchip: Allow nvmem-cell usage
Date: Thu, 10 Aug 2023 16:44:49 +0200
Message-Id: <20230810144451.1459985-5-alexander.stein@ew.tq-group.com>
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

MAC address can be provided by a nvmem-cell, thus allow referencing a
source for the address. Fixes the warning:
arch/arm/boot/dts/nxp/imx/imx6q-mba6a.dtb: ethernet@1: 'nvmem-cell-names',
 'nvmem-cells' do not match any of the regexes: 'pinctrl-[0-9]+'
 From schema: Documentation/devicetree/bindings/net/microchip,lan95xx.yaml

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/net/microchip,lan95xx.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/microchip,lan95xx.yaml b/Documentation/devicetree/bindings/net/microchip,lan95xx.yaml
index 0b97e14d947f..247e7707181c 100644
--- a/Documentation/devicetree/bindings/net/microchip,lan95xx.yaml
+++ b/Documentation/devicetree/bindings/net/microchip,lan95xx.yaml
@@ -44,6 +44,8 @@ properties:
 
   local-mac-address: true
   mac-address: true
+  nvmem-cells: true
+  nvmem-cell-names: true
 
 required:
   - compatible
-- 
2.34.1

