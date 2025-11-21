Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F367DC7AF34
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 17:55:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 063B810E8E5;
	Fri, 21 Nov 2025 16:55:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="bIFddQ4H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B5F10E88D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:33:35 +0000 (UTC)
Received: from ggottleuber-tuxedo.fritz.box
 (business-24-134-207-61.pool2.vodafone-ip.de [24.134.207.61])
 (Authenticated sender: g.gottleuber@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPA id 66FAD2FC0055;
 Fri, 21 Nov 2025 15:28:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1763735288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8yHD62R+C31Gs0vVUiZsYZ8naomYAY89XpwWoobH8qY=;
 b=bIFddQ4HEj/uAiz/kuEsTitY00Um8POsRpy4agixywI6BDRsDx1cfgndTAJyPA/sl+pRRK
 IOnL9tj0hqDu/FzyQsIkOaNuDdwsBnSRQW2qzb7MhUUErOs6VYc5Av1jtXC53grwwe63bV
 sVsMRjw+daNmAxma0uPG0pPmLfj1h1s=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=g.gottleuber@tuxedocomputers.com
 smtp.mailfrom=ggo@tuxedocomputers.com
From: Georg Gottleuber <ggo@tuxedocomputers.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ettore Chimenti <ettore.chimenti@linaro.org>,
 Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org,
 stephan.gerhold@linaro.org, wse@tuxedocomputers.com, cs@tuxedo.de,
 Georg Gottleuber <ggo@tuxedocomputers.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/7] dt-bindings: display: bridge: simple: document the ASL
 CS5263 DP-to-HDMI bridge
Date: Fri, 21 Nov 2025 15:26:14 +0100
Message-ID: <20251121142623.251118-3-ggo@tuxedocomputers.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251121142623.251118-1-ggo@tuxedocomputers.com>
References: <20251121142623.251118-1-ggo@tuxedocomputers.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 21 Nov 2025 16:55:42 +0000
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

From: Ettore Chimenti <ettore.chimenti@linaro.org>

The ASL CS5263 is a high-performance DP1.4 to HDMI2.0b converter,
designed to connect a DP1.4 source to an HDMI2.0b sink. The CS5263AN
integrates a DP1.4 compliant receiver, and a HDMI2.0b compliant
transmitter.

Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
Signed-off-by: Georg Gottleuber <ggo@tuxedocomputers.com>
---
 .../devicetree/bindings/display/bridge/simple-bridge.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
index 9ef587d46506..3439c1da4d3a 100644
--- a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -27,6 +27,7 @@ properties:
           - const: adi,adv7123
       - enum:
           - adi,adv7123
+          - asl-tek,cs5263
           - dumb-vga-dac
           - radxa,ra620
           - realtek,rtd2171
-- 
2.43.0

