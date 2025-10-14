Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C23BDB827
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 23:58:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6417510E246;
	Tue, 14 Oct 2025 21:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="pBEikIK+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="snsRmcIz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6848410E246
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 21:58:23 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cmSlL1cmMz9tBF;
 Tue, 14 Oct 2025 23:58:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760479102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ECD6YD/9cVcme/PryDiEd6/cZXsWx2lAl+ZUZ5W8UlA=;
 b=pBEikIK+wtwvSAqqpRB732i7/omGwXf3d8SQ7CVldrydsdHvoqgWetmcCdNvHntoC/qvxC
 HZVzvzeMhylPrn5x7LYs4TaBXBOpZdDD3tU0j1AbgJLzhYV+7eiDFSbdu/1dD1VlgyFwrX
 JYOvJtCqEr1AJ5PVpYcXMlK6TotJU45tGTbYa9sQRXDEBxLCh43IrwLHMlJKu+eICECpny
 jBJAuULpendajw2tvPrMn1CjCywAU26dnA4aI4xOsnFb9z9EAa+ijWG5NlkQQ2M1KnVChJ
 st/Qx6XMVAffMDLjg/o7Rc3FC2ROrtJ0DJY7+ZO2RGbkaqvpLHVmfQ9JV/y9ww==
Authentication-Results: outgoing_mbo_mout;
 dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=snsRmcIz;
 spf=pass (outgoing_mbo_mout: domain of marek.vasut@mailbox.org designates
 2001:67c:2050:b231:465::102 as permitted sender)
 smtp.mailfrom=marek.vasut@mailbox.org
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1760479100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ECD6YD/9cVcme/PryDiEd6/cZXsWx2lAl+ZUZ5W8UlA=;
 b=snsRmcIzhz2zONjehPba451aEJcwqxKk4vdTuE8eRF93uf8/e8n10U24xledVckHrAkY9V
 2g7L/Bwax9Mw7U8o6HCRoujAIZgDr103EavOTseOJsorQywzQPja580Y25jD5dKlCezjmy
 RnE6AJM588ZmGtqv34Ndt2JQblXhNHz/SxmRVMNEV+nHMzKNEO1k40bMNc1SlOcPFDzl0H
 oY1qoc1csonb6QOtku1oiK3njoTIjbvaygxFWHwxU2Oop3MfZpGXBQIrBAfqRWi2Qgv6ZQ
 HFEJ56WiiXw8VDJooazjnuEmcyqP04L/OqXkxUiqnGUE2oeIuknggKVdwHFzdw==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>, Frank Li <Frank.Li@nxp.com>,
 Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
 Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
Subject: [PATCH v2] dt-bindings: interrupt-controller: fsl,
 irqsteer: Add i.MX95 support
Date: Tue, 14 Oct 2025 23:57:15 +0200
Message-ID: <20251014215801.51331-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: wjwkupjez7okptt7rcxc4om87i55xhh8
X-MBO-RS-ID: 96a075b7f644b75232d
X-Rspamd-Queue-Id: 4cmSlL1cmMz9tBF
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

Add compatible string "fsl,imx95-irqsteer" for the i.MX95 chip, which is
backward compatible with "fsl,imx-irqsteer".

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
V2: Add RB from Frank
---
 .../devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml  | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
index c49688be10581..5c768c1e159c1 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/fsl,irqsteer.yaml
@@ -20,6 +20,7 @@ properties:
               - fsl,imx8qm-irqsteer
               - fsl,imx8qxp-irqsteer
               - fsl,imx94-irqsteer
+              - fsl,imx95-irqsteer
           - const: fsl,imx-irqsteer
 
   reg:
@@ -87,6 +88,7 @@ allOf:
               - fsl,imx8mp-irqsteer
               - fsl,imx8qm-irqsteer
               - fsl,imx8qxp-irqsteer
+              - fsl,imx95-irqsteer
     then:
       required:
         - power-domains
-- 
2.51.0

