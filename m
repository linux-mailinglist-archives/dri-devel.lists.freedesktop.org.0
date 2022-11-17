Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6B862DAB6
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 13:26:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB49510E149;
	Thu, 17 Nov 2022 12:26:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCAC10E0FF
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 12:26:09 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0315D1056;
 Thu, 17 Nov 2022 13:26:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1668687967;
 bh=yfFyz7wpXnjtMG0eWbQ9O+tbjcJ1m6UEcsmC+Bey/MU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u18Ma5rIUDqL7TLX7uHlA8ga7y20YL9uORqpeYoSFcEpkWEkZB9gs2/l4xRMkZ38j
 sHOiFrK22skqoaajGhJsc8MaPJNg+2uwK+i4ry6MMD+PM7f1mvLYLRurev7VtbSCHd
 a9cqnMUC5uWVzMEmFK+IVCMIzHzpiTJ/s7inAMho=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/8] dt-bindings: display: renesas,
 du: Provide bindings for r8a779g0
Date: Thu, 17 Nov 2022 14:25:40 +0200
Message-Id: <20221117122547.809644-2-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Extend the Renesas DU display bindings to support the r8a779g0 V4H.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
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

