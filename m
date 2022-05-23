Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED61530B1E
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 10:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7484910F073;
	Mon, 23 May 2022 08:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9026B10F04E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 08:46:36 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id rs12so15495803ejb.13
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 01:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/UJVNFJlnsJgNgDCoE5ZckFUTQDcqZNSRJVFlxfYlxA=;
 b=b11+npovOhBjUUHd+nEfFfMTBvFoZw1H3W9282L6Tp3WbVlZ8IxSFZZXZ6q9xJDxGY
 EW1ov0cjxrepoUt/z3W4HjL9LUbatrctpSRC9iqEJjw3GHGmgLB/YBL6gMlhBU+bwOZ8
 9Q2yb9CKp+1U5D6U/Ay9/RB3nGyutYaPD6KW+N8ur1Y3+YOycQMBbYZ20dED3cD7g3IE
 1eRqCVYrsLEw/YykEeamjI/JjXWvLR6UnboQs41oXXwp/9AvIOAFrk5x7TtPgSCjsgZx
 z7YJ+Pnkd+JFJx4ABoXMvPZqVjTOru2Gq7bWp7ETR5OctRJG6RLNwJpra4oFp7l28h6m
 FG5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/UJVNFJlnsJgNgDCoE5ZckFUTQDcqZNSRJVFlxfYlxA=;
 b=rLhC03Bq29ziYHz+OBIguvy30RRdfxSe/5a4aUK447KR3pj9nKKKaZLLRUvmiRvVKE
 PiX2rsC4IAH2HXzNEI/19s4wacNLEV2elOWdNkpGdqy6lluY+W8Sqs2t2mVSlPvn2uQC
 cDnK4yNsiz0niCWTMu0Y2mW664xGauHbV1yUbDhwW4Z6pgnJKLqkWef83iqIY5Zr2xcu
 3bUWkw1euDNl3jPevyTHeH33otT5ypARjZ0OvRUzD5LAxtxYphJ6SdQFrEL8cAkaNsLi
 tNh20gPFL4xjAbjXZ6r1ymiI5CdBv92FLO+oNHwqj7V9+951Cbrfjj3I3TKYuI+5VsmN
 kCpQ==
X-Gm-Message-State: AOAM532s5ifAN1VkqzOKLKZ9Jn/eiPtcSNFKCSsU/4AgY56mAHLlG+2b
 ciO2FrtpjEtXUI3m3Ztr3FNC5w==
X-Google-Smtp-Source: ABdhPJy/yZ/lyLvwTyt4cXG/A5E5S0zgmqqcWtG9q9FfqLebYY41G/XptN11JbgOUzqxswfr2um6MA==
X-Received: by 2002:a17:906:dc89:b0:6f4:d3a9:34ed with SMTP id
 cs9-20020a170906dc8900b006f4d3a934edmr18924201ejc.459.1653295595105; 
 Mon, 23 May 2022 01:46:35 -0700 (PDT)
Received: from prec5560.. ([176.74.57.19]) by smtp.gmail.com with ESMTPSA id
 s17-20020a1709060c1100b006fee27d471csm905706ejf.150.2022.05.23.01.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 01:46:34 -0700 (PDT)
From: Robert Foss <robert.foss@linaro.org>
To: andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 xji@analogixsemi.com, hsinyi@chromium.org, sam@ravnborg.org,
 tzimmermann@suse.de, maxime@cerno.tech, jose.exposito89@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] Revert "dt-bindings:drm/bridge:anx7625: add port@0
 property"
Date: Mon, 23 May 2022 10:46:15 +0200
Message-Id: <20220523084615.13510-2-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523084615.13510-1-robert.foss@linaro.org>
References: <20220523084615.13510-1-robert.foss@linaro.org>
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

This reverts commit 7328736d270aa4fa6fcd033ade02acc2874a2db5.
---
 .../display/bridge/analogix,anx7625.yaml      | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 4590186c4a0b..35a48515836e 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -94,22 +94,7 @@ properties:
         $ref: /schemas/graph.yaml#/$defs/port-base
         unevaluatedProperties: false
         description:
-          MIPI DSI/DPI input.
-
-        properties:
-          endpoint:
-            $ref: /schemas/media/video-interfaces.yaml#
-            type: object
-            additionalProperties: false
-
-            properties:
-              remote-endpoint: true
-
-              bus-type:
-                enum: [7]
-                default: 1
-
-              data-lanes: true
+          Video port for MIPI DSI input.
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
@@ -158,8 +143,6 @@ examples:
                     reg = <0>;
                     anx7625_in: endpoint {
                         remote-endpoint = <&mipi_dsi>;
-                        bus-type = <7>;
-                        data-lanes = <0 1 2 3>;
                     };
                 };
 
-- 
2.34.1

