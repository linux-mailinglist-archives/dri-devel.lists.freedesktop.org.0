Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A107EA67AFE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 18:31:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA77F10E4B5;
	Tue, 18 Mar 2025 17:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="ayQDJK6J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF31810E4BC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 17:31:48 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 08ED922D5D;
 Tue, 18 Mar 2025 18:31:44 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lccN4SBgsolE; Tue, 18 Mar 2025 18:31:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1742319099; bh=2mxyo1QWsb0cKmtR8daQLgYMmyIzI1jWM/p5CIZf9tk=;
 h=From:Date:Subject:To:Cc;
 b=ayQDJK6JSTn5LMsDMGZ0Je/k1suQ2syWcJtdMOsiKu/s2kL4qRXpqjnF0o/MrnCW/
 QLtmdfS9cZTrEz0YWQuAKUrKJvUzT8too3ROeNd53A2+YA9zKl82pi4Bpuw/KtqbA+
 fJPvWq1QGXIHin7SRUD4hIG8c2nwrAZdzECsQaEIDeZ1Hon9IK2tIkvSd/vZt8qxMr
 M19Yd96RWJfHdehZZWb9WecJQSEcIJHUgqc01CtLEi/a9RBXG/53sNeihFL5vGrej9
 z+NBkMqPTOnltlWwpPCbd0kkWm9g0Zkxg/Kh9vEKRD/LooDkBz4WiEPAgQN8ObSJbw
 x5FjuE3NDvd6Q==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 18 Mar 2025 23:01:09 +0530
Subject: [PATCH v2] dt-bindings: gpu: arm,mali-midgard: add exynos7870-mali
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-exynos7870-gpu-v2-1-58dc2094dc7f@disroot.org>
X-B4-Tracking: v=1; b=H4sIANyt2WcC/13MQQ6CMBCF4auQWVszbVHQlfcwLKCMMBtKpthAS
 O9uJXHj8n/J+3YIJEwB7sUOQpED+ymHORXgxnYaSHGfGwyaCxq0itZt8qGqK1TD/FbOdTddk7G
 dIcinWejF6wE+m9wjh8XLdvhRf9cfVf5TUSutsO9Kp6+2RYuPnoN4v5y9DNCklD5JS3OorgAAA
 A==
X-Change-ID: 20250203-exynos7870-gpu-ccb918e23b2e
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742319093; l=1667;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=2mxyo1QWsb0cKmtR8daQLgYMmyIzI1jWM/p5CIZf9tk=;
 b=J7+nzaE6aKQDV2gA16Fm6HytV1GJzc/88PtwMgkAa/zEJBnLbGipln9Pvdfd5KQkGCt0FX9M3
 /FTvRQq06ClAUflP5Uutkq2yN6IIoq2FV8cUTQAxboR0xYfIPINjOw5
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
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

Exynos7870 SoC uses the ARM Mali T830 GPU, document its compatible
string with the appropriate fallback. The T830 compatible is already
defined in the panfrost driver, but was commented out as it was unused.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
This patch series is a part of Exynos7870 upstreaming.
---
Changes in v2:
- Reviewed-by krzk.
- Link to v1: https://lore.kernel.org/r/20250204-exynos7870-gpu-v1-1-0db4c163a030@disroot.org
---
 Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
index 0801da33a385b42fa3a7ff367fafee54b1aae458..48daba21a890d24c02383672518bbd5cd7885d16 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml
@@ -45,12 +45,15 @@ properties:
               - samsung,exynos7-mali
           - const: samsung,exynos5433-mali
           - const: arm,mali-t760
+      - items:
+          - enum:
+              - samsung,exynos7870-mali
+          - const: arm,mali-t830
       - items:
           - enum:
               - rockchip,rk3399-mali
           - const: arm,mali-t860
 
-          # "arm,mali-t830"
           # "arm,mali-t880"
 
   reg:

---
base-commit: e94bd4ec45ac156616da285a0bf03056cd7430fc
change-id: 20250203-exynos7870-gpu-ccb918e23b2e

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

