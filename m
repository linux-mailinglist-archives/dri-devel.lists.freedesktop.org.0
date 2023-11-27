Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E843F7F989A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 06:17:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AECB10E17F;
	Mon, 27 Nov 2023 05:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6EBC10E17F
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 05:17:01 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 69D8760531;
 Mon, 27 Nov 2023 05:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1701062219;
 bh=k92tQ7DhMHQftnpdQhgE95eM6oQA07eSfKIXNAi5XQM=;
 h=From:To:Cc:Subject:Date:From;
 b=ecbbz4yCo3wbDTQZoaCTno5LP8n9mTXIhGC9giUWkavUwVBWH+sfnivhC2+p0vN3S
 djikDEV6incT+RsFq5/xF5SSZ3nY1YJpoumMXTiLVSdYYZ5ijgmBepZx9C57B0dEaF
 GBV8cRjlbVtY/4q1mA/O49PpiLDlpfuq6TvTKBKr++76kthF5nuZjfKq4srzPQQlVe
 0B2XpiJ6FSAzb4bcLt+KTQelVQbvA0k78U+Gj+BHqlZKtpZeFiPX6ecPScKF3V01H+
 ih3hnO9yS1KiI0yi0cpOdFUsvW/nShoNoOeL2yT1FpK87bQqSba1qAWj59SEptgNoz
 u/KZx9L7Ti+dQ==
From: Tony Lindgren <tony@atomide.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/2] dt-bindings: display: simple: Add boe,bp101wx1-100 panel
Date: Mon, 27 Nov 2023 07:15:43 +0200
Message-ID: <20231127051547.15023-1-tony@atomide.com>
X-Mailer: git-send-email 2.42.1
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
Cc: Carl Philipp Klemm <philipp@uvos.xyz>, devicetree@vger.kernel.org,
 Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
 Merlijn Wajer <merlijn@wizzup.org>, Sebastian Reichel <sre@kernel.org>,
 dri-devel@lists.freedesktop.org, Pavel Machek <pavel@ucw.cz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This panel is found on Motorola mapphone tablets mz615 to mz617.

Signed-off-by: Tony Lindgren <tony@atomide.com>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -73,6 +73,8 @@ properties:
       - auo,t215hvn01
         # Shanghai AVIC Optoelectronics 7" 1024x600 color TFT-LCD panel
       - avic,tm070ddh03
+        # BOE BP101WX1-100 10.1" WXGA (1280x800) LVDS panel
+      - boe,bp101wx1-100
         # BOE EV121WXM-N10-1850 12.1" WXGA (1280x800) TFT LCD panel
       - boe,ev121wxm-n10-1850
         # BOE HV070WSA-100 7.01" WSVGA TFT LCD panel
-- 
2.42.1
