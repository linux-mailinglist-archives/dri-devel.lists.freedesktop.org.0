Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1D8640516
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 11:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5B910E6CA;
	Fri,  2 Dec 2022 10:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3BDE10E012
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 09:56:51 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C8896D0;
 Thu,  1 Dec 2022 10:56:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669888610;
 bh=NihHXOAyw3YquNkpsRZgUpX6GQmS+L99zVdRiIJdslI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bZou7l3OGajZGDE3LeWWfnAf433XzV2buIzAe+Te0FoPLyY4P0kYKEbJCjXfGoyvD
 ZEGzBAfzzlN70wPAfIFGKv/GazvhaI3cV9FyVTBnwBy+eNyW1Rbm/0nwrWH1lNIkCn
 l+YInpl4YsrBQrPebqLoe9JJW1wpeA1rwiQmBzPA=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/7] dt-bindings: display: renesas,
 du: Provide bindings for r8a779g0
Date: Thu,  1 Dec 2022 11:56:25 +0200
Message-Id: <20221201095631.89448-2-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201095631.89448-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221201095631.89448-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Dec 2022 10:48:00 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Extend the Renesas DU display bindings to support the r8a779g0 V4H.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/display/renesas,du.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index b3e588022082..d4830f52c512 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -40,6 +40,7 @@ properties:
       - renesas,du-r8a77990 # for R-Car E3 compatible DU
       - renesas,du-r8a77995 # for R-Car D3 compatible DU
       - renesas,du-r8a779a0 # for R-Car V3U compatible DU
+      - renesas,du-r8a779g0 # for R-Car V4H compatible DU
 
   reg:
     maxItems: 1
@@ -762,6 +763,7 @@ allOf:
           contains:
             enum:
               - renesas,du-r8a779a0
+              - renesas,du-r8a779g0
     then:
       properties:
         clocks:
-- 
2.34.1

