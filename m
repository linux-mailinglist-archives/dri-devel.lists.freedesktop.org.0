Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3C9A44E42
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 22:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B367E10E7E7;
	Tue, 25 Feb 2025 21:03:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Xe7Sdg3x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA4910E7E7
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 21:03:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 78DAC5C03C2;
 Tue, 25 Feb 2025 21:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC64AC4CEDD;
 Tue, 25 Feb 2025 21:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740517405;
 bh=5QLha3LU54q2eJpH1rlZ9gtOA95sAt4D3nlp+ptlssw=;
 h=From:To:Cc:Subject:Date:From;
 b=Xe7Sdg3xqnC0ijDR2xEdQS7iYEc+HPkaF1a9tFadBkRzPT846RidLssoY6DTJgZxA
 coepeyFbfaVDzTulWQ0lA13JXpv+uh6JUEWizvSAoboMJ/7JxoJ2KrdEWCDqjgtp2m
 pGLkCjdLj49kd+CvYR/7oEv6uZLfCnudVGeXAhLnxwMXSVoQ5wzBX3UzFyJnsr3PoF
 9nJhDz8tmi4GSGDCjBetKYGf0sjhgUeMSur+LGXTYBFPiU+ORsvVWP5A6ab9YnOGWT
 OoZ/cA2n5aM7xoVJlQXGU8nO0MdVi7gdP5pVy4XCc//syfWLLGDHvXL80Mpmx/J83R
 UM2f+Y0+GvaaQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: mitsubishi,
 aa104xd12: Allow jeida-18 for data-mapping
Date: Tue, 25 Feb 2025 15:03:14 -0600
Message-ID: <20250225210316.3043357-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
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

There's both a user and the datasheet[1] indicate that 6-bpp is supported
as well.

[1] https://agdisplays.com/pub/media/catalog/datasheet/Mitsubishi/AA104XD12.pdf

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/display/panel/mitsubishi,aa104xd12.yaml          | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
index 3623ffa6518d..2c92d81caaaf 100644
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
@@ -33,7 +33,9 @@ properties:
     description: Reference to the regulator powering the panel VCC pins.
 
   data-mapping:
-    const: jeida-24
+    enum:
+      - jeida-18
+      - jeida-24
 
   width-mm:
     const: 210
-- 
2.47.2

