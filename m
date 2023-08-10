Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F8E777B2A
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 16:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA3E10E54F;
	Thu, 10 Aug 2023 14:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2598210E54C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 14:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1691678701; x=1723214701;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Fb8UNTRB4SudTf2EN/AMFPjrk80+v5okVyVyGYK1K+E=;
 b=ZHcg+EROEcVQ06X/A2F/lmabRTMAjw2nsVeUX7linf6bigLmgJ2VgMiq
 DdZqXknG+d4UVBKuWtEGfKWo+U87PcoPIlunYIHrZnhyBXTv3YuzQ3dKU
 ycWUeISLu+Dhd6cWqrRbZA++t1nAP9E9ZtnjM2fBCM40YfriHP95YwfXW
 Vsm36wdwq4Bauspgtxxc4y4hzykz3TgW/+kHhs7QtcjFwoPW3UYsskhHS
 4enOVbMRaT7q4OWrDadwKDLDFNgcIH6zaSqSQGnRcP5UDLO5RG0tzNRwC
 ljDxnl6WNmrPI7VaQRAex6bVeRowj9tFP+19b5/GRhs9bFadsFOIA7i0d A==;
X-IronPort-AV: E=Sophos;i="6.01,162,1684792800"; d="scan'208";a="32396721"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Aug 2023 16:44:58 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 342FA28008E;
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
Subject: [PATCH 3/6] dt-bindings: display: imx: hdmi: Allow 'reg' and
 'interrupts'
Date: Thu, 10 Aug 2023 16:44:48 +0200
Message-Id: <20230810144451.1459985-4-alexander.stein@ew.tq-group.com>
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

Although defined in synopsys,dw-hdmi.yaml, they need to explicitly allowed
in fsl,imx6-hdmi.yaml. Fixes the warning:
arch/arm/boot/dts/nxp/imx/imx6q-mba6a.dtb: hdmi@120000: 'interrupts',
 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
 From schema: Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml

Fixes: b935c3a2e07b ("dt-bindings: display: imx: hdmi: Convert binding to YAML")
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml         | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
index af7fe9c4d196..d6af28e86ab4 100644
--- a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
@@ -22,6 +22,9 @@ properties:
       - fsl,imx6dl-hdmi
       - fsl,imx6q-hdmi
 
+  reg: true
+  interrupts: true
+
   reg-io-width:
     const: 1
 
-- 
2.34.1

