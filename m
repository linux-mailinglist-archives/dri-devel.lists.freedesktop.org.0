Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2248BA87A5E
	for <lists+dri-devel@lfdr.de>; Mon, 14 Apr 2025 10:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3792110E4DE;
	Mon, 14 Apr 2025 08:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Av3lQNTb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAE5E10E4DB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Apr 2025 08:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1744619362;
 bh=vKWaMsZmWzPU+TCnaLekNCf91VIFblbtMmVHFHpypHo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Av3lQNTbcT8yW5K7jWCg7O0y3srXU9/+XpzzF4g6RuXzDiOg9Ag+nwO6wVlNqm29o
 ccC+qP82tG2n9GEIXyoeaCO929rA7tqF4i2fD2oiYv4w3Bn2Ltdmhqwu1tin8yrjqf
 olIEKm2hNyPDyj/ZQNIdznQvUhaXKwvRwEayY6e6NEiolHZf9JBc2LaEdNr1UnBeH2
 ScgjzwDgbuJFgeKNCn9ITKTyaWhO0wiUYeb6q459lCsHa9G8o9JOpViTrj9jUjee2c
 UNDAY7oqUg3wcLS/4IkTnFqGB9abaTjOlN/nuLnbpLpXTk9ELCZol8q0zFhMq5e+fk
 hQ4URWsPtVzlg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C26017E0FC1;
 Mon, 14 Apr 2025 10:29:21 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com, pablo.sun@mediatek.com, christophe.jaillet@wanadoo.fr
Subject: [PATCH v4 1/3] dt-bindings: vendor-prefixes: Add Shenzhen Aoly
 Technology Co., Ltd.
Date: Mon, 14 Apr 2025 10:29:16 +0200
Message-ID: <20250414082918.30298-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414082918.30298-1-angelogioacchino.delregno@collabora.com>
References: <20250414082918.30298-1-angelogioacchino.delregno@collabora.com>
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

Aoly is a manufacturer of LCD/IPS displays based in Shenzhen,
Mainland China.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Link: https://lore.kernel.org/r/20250410072456.387562-2-angelogioacchino.delregno@collabora.com
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 86f6a19b28ae..6136c8832a66 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -129,6 +129,8 @@ patternProperties:
     description: Andes Technology Corporation
   "^anvo,.*":
     description: Anvo-Systems Dresden GmbH
+  "^aoly,.*":
+    description: Shenzhen Aoly Technology Co., Ltd.
   "^aosong,.*":
     description: Guangzhou Aosong Electronic Co., Ltd.
   "^apm,.*":
-- 
2.49.0

