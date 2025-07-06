Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A45E0AF04A2
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 22:19:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C288010E089;
	Tue,  1 Jul 2025 20:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC49110E089
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 20:19:48 +0000 (UTC)
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
 by leonov.paulk.fr (Postfix) with ESMTPS id 4EEAB1F00036
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 20:19:47 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
 id 3132EAC96A9; Tue,  1 Jul 2025 20:19:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on spamassassin
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
 autolearn_force=no version=4.0.0
Received: from localhost.localdomain (unknown [192.168.1.64])
 by laika.paulk.fr (Postfix) with ESMTP id A6B9BAC968A;
 Tue,  1 Jul 2025 20:14:28 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH 1/2] dt-bindings: display: simple: Add Olimex
 LCD-OLinuXino-5CTS
Date: Tue,  1 Jul 2025 22:14:25 +0200
Message-ID: <20250701201426.814750-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the Olimex LCD-OLinuXino-5CTS, a 5-inch TFT LCD panel.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 5542c9229d54..287cb85378ec 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -234,6 +234,8 @@ properties:
       - okaya,rs800480t-7x0gp
         # Olimex 4.3" TFT LCD panel
       - olimex,lcd-olinuxino-43-ts
+	# Olimex 5.0" TFT LCD panel
+      - olimex,lcd-olinuxino-5-cts
         # On Tat Industrial Company 5" DPI TFT panel.
       - ontat,kd50g21-40nt-a1
         # On Tat Industrial Company 7" DPI TFT panel.
-- 
2.49.0

