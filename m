Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E504DB53733
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 17:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFA410E3B0;
	Thu, 11 Sep 2025 15:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="UG+iT4YB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0DD10E3B0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Sep 2025 15:15:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1757603699; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RfQQ/M6Tm+6OaYTlB7FKmVd0qTVEJfQBVE3+fZ4Pa3hwCrsDZb9vqtwn3dRmZS9ScyCktZluwjSwUkEtrQoUSoyCzyDxdG2ChPP7mHlUKAiqUcIIThtaNjiZPKFB6zz48lC780EDMZyUxXSA1lQB2UvVwzqZbvRJflLK12iZmMQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1757603699;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=pUtxZbvlNIi4H5EeFTGaoT/G6bLVLSFgmTvDYT5R3gQ=; 
 b=XzzTiLYGaQts1yoxDScBtoi4FMPDx3Q275Hd5ugIxyelpYN69Zzr+Iylz8OwUlShOzzHEL/+hJANMdbBmtIbIonrnMqnRkXK/mrDEeIe1hjXz26wCq0NnJvPn7DaIk3AAppziFizntQOvca3f4w+PyoJTHihWtAddSyPGJs0fyo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1757603699; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=pUtxZbvlNIi4H5EeFTGaoT/G6bLVLSFgmTvDYT5R3gQ=;
 b=UG+iT4YBQ9kxlpgN7Ojj4kZaWQKaVMN6VD1IQcR4bXOhvQs5ZJgQoPF+GhByeHqi
 S7DNO141+WLxOLF1wdGAwz++Bl2BOEYHb8YBy6pOk6U5YpC57Kpemxf03bkRINgZokA
 genKNirerdwk3In3ZcuWUJV6JM7z2gC1YxCvRmb4=
Received: by mx.zohomail.com with SMTPS id 1757603698448103.94183972441317;
 Thu, 11 Sep 2025 08:14:58 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 ariel.dalessandro@collabora.com, broonie@kernel.org,
 chunkuang.hu@kernel.org, conor+dt@kernel.org, davem@davemloft.net,
 dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com,
 heiko@sntech.de, houlong.wei@mediatek.com, jeesw@melfas.com,
 kernel@collabora.com, krzk+dt@kernel.org, kuba@kernel.org,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, luiz.dentz@gmail.com,
 maarten.lankhorst@linux.intel.com, marcel@holtmann.org,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: [PATCH v2 11/12] dt-bindings: soc: mediatek: pwrap: Add power-domains
 property
Date: Thu, 11 Sep 2025 12:10:00 -0300
Message-ID: <20250911151001.108744-12-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
References: <20250911151001.108744-1-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

Currently, the DT bindings for Mediatek PMIC Wrapper is missing the
power-domains property, which is used in the MT8173 E1 evaluation board as
it needs USB power domain.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/soc/mediatek/mediatek,pwrap.yaml     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index 4737e5f45d541..54c0cd64d3094 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -98,6 +98,9 @@ properties:
       - const: pwrap
       - const: pwrap-bridge
 
+  power-domains:
+    maxItems: 1
+
   pmic:
     type: object
 
@@ -126,6 +129,18 @@ allOf:
         clock-names:
           minItems: 4
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8173-pwrap
+    then:
+      properties:
+        power-domains: true
+    else:
+      properties:
+        power-domains: false
+
 additionalProperties: false
 
 examples:
-- 
2.50.1

