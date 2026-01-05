Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99BCFCF562A
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 20:32:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E60310E11A;
	Mon,  5 Jan 2026 19:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mxwcosU2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ED2910E1E3
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 19:32:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E8D4643CD0;
 Mon,  5 Jan 2026 19:32:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0A67C116D0;
 Mon,  5 Jan 2026 19:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767641546;
 bh=q9cQlTH+WIpOMJjB31tyEhi+IJtQyrYG+P/zBl1mJl8=;
 h=From:To:Cc:Subject:Date:From;
 b=mxwcosU2dLL7phAhR4W/sEyNm2d0UPRRC4aGxQFRzcQWcIW7MKa1TLiMgAJvDZZZ+
 LQ7OXyjqGCLomeNm8KX1ydHbWZVSeK7ciDpiHLprLFGWWxg7XVrppEL69zJlFJ4BYf
 omaXBzMfryLjoqrNDDX22W7yWR+/cqgY+yELffI/l5W2fNUz5MPTMGOW02AnFZjl8/
 Y2aInNYmoSSEBr8CvTmYgm71awvVypa212lVEakAbe80HoPcmsya8Bb34qQ2cEJ4ko
 PQWW2AfYx+BkUqdEDqL8B3tbAdA1Bcb9ve+UUTMeGM+E8sUG9H2Ayjup4EzriduCri
 1KliW+fOcZ8tQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: display: panel-simple: Allow "data-mapping" for
 "yes-optoelectronics, ytc700tlag-05-201c"
Date: Mon,  5 Jan 2026 13:32:19 -0600
Message-ID: <20260105193220.3166778-1-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
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

The "data-mapping" property is in use already with the
"yes-optoelectronics,ytc700tlag-05-201c" panel, so allow it in the
schema.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index fc244fbb5a54..e4a5b30ccfc9 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -349,7 +349,9 @@ if:
     properties:
       compatible:
         contains:
-          const: innolux,g101ice-l01
+          enum:
+            - innolux,g101ice-l01
+            - yes-optoelectronics,ytc700tlag-05-201c
 then:
   properties:
     data-mapping: false
-- 
2.51.0

