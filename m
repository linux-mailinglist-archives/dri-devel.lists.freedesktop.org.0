Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95B1FA44E43
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 22:03:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A64910E7E8;
	Tue, 25 Feb 2025 21:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rua6QqsG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDE910E7E8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 21:03:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A80FB5C04EB;
 Tue, 25 Feb 2025 21:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A451C4CEDD;
 Tue, 25 Feb 2025 21:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740517407;
 bh=3rjzucY2mzCS228H6NdD5SCcBe2EbMfvymk2w4oTTTk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rua6QqsGWULVo6JIaHkhYkZsmQsYHrG84S0o7f2MfZmZbE6CnRFdafTtciX0MpS7s
 yk3Mg5XSHm/gFzcqdRrIvpIhv1v3sFFr5J0muP2KM9nHAiOUy9QOjIc+eUyw2DT8ZX
 MAVvS9OHMVCfH/piWSd8OanTFXH/F/GpbB8Xfrzu0RNrZLcCu0D0Kycv33jQfhPoAy
 /6VRmfokCqwOcSTM993ohRtwcGx+4ZEYgYqxjXxFxzk6JgLD977KczYz8EWJ3IIE7/
 PytJBDjvcJusPc8EEn5zGVAnhizQbxou+DYBt3IU7UHJp5bibBwjSSlIQ73xz25n+w
 IGN9HeadCuqsQ==
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
Subject: [PATCH 2/2] dt-bindings: display: mitsubishi,
 aa104xd12: Adjust allowed and required properties
Date: Tue, 25 Feb 2025 15:03:15 -0600
Message-ID: <20250225210316.3043357-2-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250225210316.3043357-1-robh@kernel.org>
References: <20250225210316.3043357-1-robh@kernel.org>
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

The Mitsubishi aa104xd12 panel requires an external backlight driver
circuit, so allow the "backlight" property.

There are users of this panel without a vcc-supply, so it shouldn't be
required.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
index 2c92d81caaaf..96621b89ae9e 100644
--- a/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
+++ b/Documentation/devicetree/bindings/display/panel/mitsubishi,aa104xd12.yaml
@@ -43,6 +43,7 @@ properties:
   height-mm:
     const: 158
 
+  backlight: true
   panel-timing: true
   port: true
 
@@ -50,7 +51,6 @@ additionalProperties: false
 
 required:
   - compatible
-  - vcc-supply
   - data-mapping
   - width-mm
   - height-mm
-- 
2.47.2

