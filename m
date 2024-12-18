Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8E39F6E5C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 20:45:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98B2F10E337;
	Wed, 18 Dec 2024 19:45:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1953210E333
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 19:45:15 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <a.fatoum@pengutronix.de>)
 id 1tNzyo-0006vD-KE; Wed, 18 Dec 2024 20:45:10 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.96)
 (envelope-from <a.fatoum@pengutronix.de>) id 1tNzym-0045Ea-0o;
 Wed, 18 Dec 2024 20:45:09 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
 by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
 (envelope-from <a.fatoum@pengutronix.de>) id 1tNzym-00DT63-30;
 Wed, 18 Dec 2024 20:45:08 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Wed, 18 Dec 2024 20:44:59 +0100
Subject: [PATCH 2/3] dt-bindings: display: panel-simple: Document Topland
 TIAN-G07017-01
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-topland-tian-g07017-v1-2-d5e411c199e3@pengutronix.de>
References: <20241218-topland-tian-g07017-v1-0-d5e411c199e3@pengutronix.de>
In-Reply-To: <20241218-topland-tian-g07017-v1-0-d5e411c199e3@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

The TIAN-G07017-01 is a 7" TFT-LCD module by TOPLAND ELECTRONICS (H.K).
Add its compatible string.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 18b63f356bb4bbf6d2c8e58b13ebb14c5f4004ad..2a3bf4f079e9297b06ca9d25290c0b3fe7881043 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -284,6 +284,8 @@ properties:
       - tianma,tm070jvhg33
         # Tianma Micro-electronics TM070RVHG71 7.0" WXGA TFT LCD panel
       - tianma,tm070rvhg71
+        # Topland TIAN-G07017-01 7.0" WSVGA TFT-LCD panel with capacitive touch
+      - topland,tian-g07017-01
         # Toshiba 8.9" WXGA (1280x768) TFT LCD panel
       - toshiba,lt089ac29000
         # TPK U.S.A. LLC Fusion 7" 800 x 480 (WVGA) LCD panel with capacitive touch

-- 
2.39.5

