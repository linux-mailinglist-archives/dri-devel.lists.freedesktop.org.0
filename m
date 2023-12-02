Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA44801B6D
	for <lists+dri-devel@lfdr.de>; Sat,  2 Dec 2023 09:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0DA010E115;
	Sat,  2 Dec 2023 08:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF62410E115
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Dec 2023 08:12:46 +0000 (UTC)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
 by mail5.25mail.st (Postfix) with ESMTPSA id 84D6460406;
 Sat,  2 Dec 2023 08:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
 s=25mailst; t=1701504766;
 bh=9g2L4EqFg5IbhJLlgMfCzKCv8DY9nzLJn0sBO9KAzQM=;
 h=From:To:Cc:Subject:Date:From;
 b=shxOKLUSr4uhSwcY38cKmsUNni7SJnFkKsfQ8WxPCq4s9zZFBl9bIEkFzA7qnxlAd
 W0+Dz81S4iWhGqq06sMW/PBhKhNbCoW800kgYGkwjskM2FJ1xl73WfE6XFgzIOycde
 sdZrrEaT/suEL65AOaFuwMEMWKTJV0vJbh7ujH6rVkQiOCcIUbJPPWCLHidq28kQMj
 RPsM/JUgRbjJOt1MJ7c3lCsuJMMNLgSaqZn2qB4d4G8EWZ3s4/p/1qsoW6AjBgJ+6c
 233gXRp79EJnBcY+khXyQ4N7FMXy6dEE9IXoFu/1SE4xj6qjQUGlBg39eWAw5lhKjz
 IHoe8I66cDFlA==
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
Subject: [PATCH 1/2] dt-bindings: display: simple: Add boe,
 bp082wx1-100 8.2" panel
Date: Sat,  2 Dec 2023 10:11:52 +0200
Message-ID: <20231202081157.47222-1-tony@atomide.com>
X-Mailer: git-send-email 2.43.0
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

This panel is found on Motorola mapphone tablets mz607 to mz609.

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
+        # BOE BP082WX1-100 8.2" WXGA (1280x800) LVDS panel
+      - boe,bp082wx1-100
         # BOE BP101WX1-100 10.1" WXGA (1280x800) LVDS panel
       - boe,bp101wx1-100
         # BOE EV121WXM-N10-1850 12.1" WXGA (1280x800) TFT LCD panel
-- 
2.43.0
