Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 414DD777B2D
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 16:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046C810E553;
	Thu, 10 Aug 2023 14:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1213A10E54C
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 14:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1691678702; x=1723214702;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6EnU6mxwtuGf6jhekfVBSmSdeikIRp30Gtkant+ryK4=;
 b=SStAOGxkVhDoeR20u3yLfq8dWmCrYcHjGDNoU4l7vrY/5Cplw4h3vC4P
 XEqsLb/QZ2SiguXRGqZgT1Iq4Ys4lw9Mm8+vn6kakvD/7TIOP35eLWrOp
 e4M0BNhColQ89/0MrzlD4FdwfTgFF1IdsWfSzBXu5z2eS52K1B5qQNxeE
 6+j4goii0KFno8Bjj8YF1074x7Pm0FDVFM7dCTvDkawv8XcSgeSof44XC
 j6WvrPXcgPTZNd75ekiO2D6q7Y7XwUj8uPW84C+5BQyw/FrrOHnRd3536
 o+i1FqvMDaWT2ukwHwvAunnDXHBBE3T3AumPX5Du8ziNyesLk0Xs4N6g2 g==;
X-IronPort-AV: E=Sophos;i="6.01,162,1684792800"; d="scan'208";a="32396724"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 10 Aug 2023 16:44:59 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F0E5828008E;
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
Subject: [PATCH 5/6] dt-bindings: timer: add imx7d compatible
Date: Thu, 10 Aug 2023 16:44:50 +0200
Message-Id: <20230810144451.1459985-6-alexander.stein@ew.tq-group.com>
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

Currently the dtbs_check for imx6ul generates warnings like this:

['fsl,imx7d-gpt', 'fsl,imx6sx-gpt'] is too long

The driver has no special handling for fsl,imx7d-gpt, so fsl,imx6sx-gpt is
used. Therefore make imx7d GPT compatible to the imx6sx one to fix the
warning.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
index dbe1267af06a..c5d3be8c1d68 100644
--- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
+++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
@@ -36,7 +36,9 @@ properties:
               - fsl,imxrt1170-gpt
           - const: fsl,imx6dl-gpt
       - items:
-          - const: fsl,imx6ul-gpt
+          - enum:
+              - fsl,imx6ul-gpt
+              - fsl,imx7d-gpt
           - const: fsl,imx6sx-gpt
 
   reg:
-- 
2.34.1

