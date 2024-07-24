Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9856493AA42
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 02:57:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15B7010E0F0;
	Wed, 24 Jul 2024 00:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="z61IjGKi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EB010E0F0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 00:57:36 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8B20C8872F;
 Wed, 24 Jul 2024 02:57:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1721782654;
 bh=A39mZzllZV6/ShSKezblTRxpvBFCpvUULRt0hj/cTj8=;
 h=From:To:Cc:Subject:Date:From;
 b=z61IjGKiWS9A5PVOTh8eHrGHF9haK6xwHROIDo1jwqVx1Fp8/Thq7yWL0JtPiObVv
 cl6/ZKF9KyluQROaSTfYegwsEjn5NayWcAXPLMRgk1+T1u/c5ESlM5Zuetqaj4CR5O
 AGldDUgmUf6nGpt3eLzDeqxVb7Dtat2u5okhqH//QCSWAojFec65VamXLdBpYnZzgZ
 RMR2s40+dt8zyoAUV1UKXq6P95YdWjSpf9uy5HwY1HdK8CJse9lHHAaf9joYrKCrSN
 eFFnyArg4LPEmIab4Ak+hADCWsRnNmr2zeveNxqhtRlvRHp0ZJpgAlG+wRnvX1dEdd
 tgX/dve4dj8sQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Conor Dooley <conor+dt@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: panel: Document Densitron
 DMT028VGHMCMI-1D TFT on ILI9806E DSI TCON
Date: Wed, 24 Jul 2024 02:55:52 +0200
Message-ID: <20240724005700.196073-1-marex@denx.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
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

Document Densitron DMT028VGHMCMI-1D 480x640 TFT matrix 2.83 inch panel
attached to Ilitek ILI9806E DSI TCON in the ILI9806E bindings.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 .../devicetree/bindings/display/panel/ilitek,ili9806e.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index cfd7cc9c87257..f803075794854 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -16,6 +16,7 @@ properties:
   compatible:
     items:
       - enum:
+          - densitron,dmt028vghmcmi-1d
           - ortustech,com35h3p70ulc
       - const: ilitek,ili9806e
 
-- 
2.43.0

