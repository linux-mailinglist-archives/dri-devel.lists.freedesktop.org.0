Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E0EC604D0
	for <lists+dri-devel@lfdr.de>; Sat, 15 Nov 2025 13:22:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02ABB10E29D;
	Sat, 15 Nov 2025 12:21:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GbhUTg2y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BED10E29D
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Nov 2025 12:21:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4CBA1401E6;
 Sat, 15 Nov 2025 12:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96EF2C19423;
 Sat, 15 Nov 2025 12:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763209299;
 bh=qnbEQfJ/X0ZmpMOyN7rpabYvjrZ5czl2oCiK6yZ/aM8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GbhUTg2yrGlqBqVcfC9aqi1YG/6NW5DUwhyWV5txF5m9ZyTAKTz4BxGdHAxWXA+z/
 ajY63z2+iHYvGDaOnpHL8KOwJQ+bXOfC8Fr0xhYnthlwHTK8sXSVUwZvfzhmIRBIYe
 jE6a3yvmWy0jZ6Hr1QMg2MV2qXco19ljCMv+g0jPfD6GUioaFESwYdCG151UU09IvA
 en868vAL8EhhCnk6SXMC9QHZAmXMfBjjNRYgbtGkpnAMjwMYLJi2sE5Ge4dN7nlY8d
 gGSYvw8rKDUP0ZDisjQin1CkHJxVFx3Xb5aIDUk4DkCqXOby51UQsbzJfJELPcry/4
 KArbIYHHxlkmg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Michal Simek <michal.simek@amd.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Harini Katakam <harini.katakam@amd.com>,
 Shyam Pandey <radhey.shyam.pandey@amd.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 3/3] dt-bindings: mmc: am654: Simplify dma-coherent property
Date: Sat, 15 Nov 2025 13:21:23 +0100
Message-ID: <20251115122120.35315-6-krzk@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251115122120.35315-4-krzk@kernel.org>
References: <20251115122120.35315-4-krzk@kernel.org>
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

Common boolean properties need to be only allowed in the binding
(":true"), because their type is already defined by core DT schema.
Simplify dma-coherent property to match common syntax.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 Documentation/devicetree/bindings/mmc/sdhci-am654.yaml | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
index 676a74695389..242a3c6b925c 100644
--- a/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
+++ b/Documentation/devicetree/bindings/mmc/sdhci-am654.yaml
@@ -50,8 +50,7 @@ properties:
       - const: clk_ahb
       - const: clk_xin
 
-  dma-coherent:
-    type: boolean
+  dma-coherent: true
 
   # PHY output tap delays:
   # Used to delay the data valid window and align it to the sampling clock.
-- 
2.48.1

