Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D5DA65DD1
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 20:21:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA4D10E0FF;
	Mon, 17 Mar 2025 19:21:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=disroot.org header.i=@disroot.org header.b="l+YImy4a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A5D10E0FF
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 19:21:48 +0000 (UTC)
Received: from mail01.disroot.lan (localhost [127.0.0.1])
 by disroot.org (Postfix) with ESMTP id 49DA4219D8;
 Mon, 17 Mar 2025 20:21:40 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kxohck1h9amb; Mon, 17 Mar 2025 20:21:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
 t=1742239297; bh=NgHB5DloDHIam4+aHZexc6F7ttmxCu/XVF8xokkwquA=;
 h=From:Date:Subject:To:Cc;
 b=l+YImy4aQlQv0I0Anwet+lGQrE6VSpB9qlQteehdh6qiyDn79CnMF5Ds5e72K7mPw
 UGtyf8fu0tGm6VprKTvPEkFOS9f+qePsu7X9QnkHqgIaFsmPhZOkgyF3rHbJvAYU6X
 +psKT7kDIubpNdRF73kJWfeUgB0SYTmissoO+CAINUguxqWCf3ysv5SOzs3fjjVHPC
 DQRmyHpwWaGdHLQAk5MC2UEzu1ZXfmwinornAmh+fncD9C/OUn5VMpHK4FNli+WGIT
 XZ8vGfcU7kdQ1JOfqDTsUlOPtaTWtQ5H2JYb3YqZxr+3fCVQnHdLu2qtm10XIuMyl+
 7yIxWUnHc89Mw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 18 Mar 2025 00:50:51 +0530
Subject: [PATCH RESEND] dt-bindings: gpu: arm,mali-midgard: add
 exynos7870-mali compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-exynos7870-gpu-v1-1-084863f28b5c@disroot.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742239290; l=1463;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=NgHB5DloDHIam4+aHZexc6F7ttmxCu/XVF8xokkwquA=;
 b=5AWkfH6JBT7GtIr30t5ZeuidQwBQJjvOsSNHSN1mjAhWajpxjQo3OHQF3a7zfzfDPKi5Yb/CM
 NsBOKLPJ/OjBRklcXN8mQaUszht7FKeYS3IovG+S9fSNA6UYIhWyfFQ
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

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
This patch series is a part of Exynos7870 upstreaming.
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
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-gpu-ccb918e23b2e

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>

