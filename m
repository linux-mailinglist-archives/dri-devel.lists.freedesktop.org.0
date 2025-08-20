Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65312B2E32B
	for <lists+dri-devel@lfdr.de>; Wed, 20 Aug 2025 19:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC8EE10E79E;
	Wed, 20 Aug 2025 17:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=ariel.dalessandro@collabora.com header.b="YmQ2Jueg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F63E10E79E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Aug 2025 17:16:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755710172; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RjzT/f8YblOclyalWeryqHbLicp5WmRidds8+LWiFgwkE9fl7bT0/hyPj3LTqJeXSXAr4OAhcXLbqY2CNpvFD5a/wTcMkyamK1NaU2z7PVd5cLpgOygHkjR8yd+hWfk1jCO949KpeCr5UxT5erSCVBc6/TZuG8eMc+eOrW9rFqM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755710172;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=U2cYAc7TRbA/3mF29NaHDGo0+OsEf9lfl8V9ifaEr3c=; 
 b=kXi+D+/QdGWNCBtsnYxOQdLJXLRy3HbjU3u4lvvI5lzS18JY5DrPM1QAO2iL7441PZ9gQhXxWCd9BnJINXilS4cuVBqPjyHOAY5nXs52e9+1Ll0ruOe/vIG506nf9Xst3yQw0lIoZ0jLzDs8l2yEPgDsj4r9OlVouggGhNqSX8k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=ariel.dalessandro@collabora.com;
 dmarc=pass header.from=<ariel.dalessandro@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755710171; 
 s=zohomail; d=collabora.com; i=ariel.dalessandro@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=U2cYAc7TRbA/3mF29NaHDGo0+OsEf9lfl8V9ifaEr3c=;
 b=YmQ2Juega/HOl6KnUF4i9NncuelEK2VPn9Fh7FH8d1kJ8KFM/jl89+DeORaM96Md
 tjbalhQof5uDLhfAcUBm9ze0luDTFvZORvjFzngrp+KwzKxwc+GW7XKF9YfD5upPrxI
 gO7DRXkvDMKT5w6X0EuHfQf0WPVePsiU/AzLub4g=
Received: by mx.zohomail.com with SMTPS id 1755710169818871.9439170647294;
 Wed, 20 Aug 2025 10:16:09 -0700 (PDT)
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
To: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch,
 andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com,
 ariel.dalessandro@collabora.com, broonie@kernel.org,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org,
 davem@davemloft.net, dmitry.torokhov@gmail.com, edumazet@google.com,
 flora.fu@mediatek.com, houlong.wei@mediatek.com, jeesw@melfas.com,
 jmassot@collabora.com, kernel@collabora.com, krzk+dt@kernel.org,
 kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com,
 lgirdwood@gmail.com, linus.walleij@linaro.org,
 louisalexis.eyraud@collabora.com, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mchehab@kernel.org, minghsiu.tsai@mediatek.com,
 mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com,
 robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch,
 support.opensource@diasemi.com, tiffany.lin@mediatek.com,
 tzimmermann@suse.de, yunfei.dong@mediatek.com
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [PATCH v1 09/14] dt-bindings: pinctrl: mediatek,
 mt65xx-pinctrl: Allow gpio-line-names
Date: Wed, 20 Aug 2025 14:12:57 -0300
Message-ID: <20250820171302.324142-10-ariel.dalessandro@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
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

Current, the DT bindings for MediaTek's MT65xx Pin controller is missing
the gpio-line-names property, add it to the associated schema.

Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
---
 .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
index b9680b896f12f..aa71398cf522f 100644
--- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
@@ -43,6 +43,8 @@ properties:
       the amount of cells must be specified as 2. See the below mentioned gpio
       binding representation for description of particular cells.
 
+  gpio-line-names: true
+
   mediatek,pctl-regmap:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
-- 
2.50.1

