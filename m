Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C9C7576EF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 10:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FBC210E179;
	Tue, 18 Jul 2023 08:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A5C710E179
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 08:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1689669857; x=1721205857;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HgPdbUmEfsLF8pyFhzs6jd6wcfwbV7JK9KcdUCKPGNA=;
 b=bl8tmXIqtU1thmbvK4rDS5TX9I8+B3YWRGGbwKN4qmH+vaZkNgXe5YIC
 96uCt2pZMNnMUAYV6oQEnsPQ+6mBAuwv2nYs4x98StUyO5C2BVE9ujMey
 uJkhQPPXVqPtF9Wj/2OtMlM6mz1Ek4baVp4ZONQTBQwETdnCXFdqCRahs
 YkeNJiomaRPXg0FGlKf1zkyQ/C/TSl0XVBOueRUQc069WnSOSkmNICw0z
 Yv3QbN0+ou5Yici+kq0jfBsFx3DOWjaie5pTIlIWgE8wrb2bOqFr9C0hC
 af9BKPNADXIUGBjV7WvnFL8wS6i9w0kzIllRS872U+wAsPZgOUzHWBKtE g==;
X-IronPort-AV: E=Sophos;i="6.01,213,1684792800"; d="scan'208";a="31980959"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 18 Jul 2023 10:44:15 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AA7FA280078;
 Tue, 18 Jul 2023 10:44:14 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH 1/1] dt-bindings: display: bridge: tc358867: Add interrupt
 property
Date: Tue, 18 Jul 2023 10:44:11 +0200
Message-Id: <20230718084411.1189831-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This bridge has an interrupt line for event signaling. Add the
corresponding property.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
This fixes warnings like:
imx93-tqma9352-mba93xxla.dtb: dp-bridge@f: 'interrupt-parent', 'interrupts'
do not match any of the regexes: 'pinctrl-[0-9]+'
  from schema $id: http://devicetree.org/schemas/display/bridge/toshiba,tc358767.yaml#

 .../devicetree/bindings/display/bridge/toshiba,tc358767.yaml   | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
index 0521261b04a9..ae894d996d21 100644
--- a/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/toshiba,tc358767.yaml
@@ -49,6 +49,9 @@ properties:
     description: |
         OF device-tree gpio specification for RSTX pin(active low system reset)
 
+  interrupts:
+    maxItems: 1
+
   toshiba,hpd-pin:
     $ref: /schemas/types.yaml#/definitions/uint32
     enum:
-- 
2.34.1

