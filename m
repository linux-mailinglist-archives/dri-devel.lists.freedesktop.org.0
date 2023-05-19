Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B860709F31
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 20:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FB9510E60A;
	Fri, 19 May 2023 18:40:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77D5F10E600
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 18:40:27 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2ad89c7a84fso40316431fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 19 May 2023 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684521625; x=1687113625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8NJTpbaQkrMxS2HcO+vhGH2r43mf2msf3vlTqsDsrs=;
 b=w96081i/Sr0UNRO05ZM8yBIa714IRprJfTI2+2T1hTsUcPNYRrjKxfbiWlMhk3Bze4
 wmilfOPhv7Z290X0rQqVh9F+w71TGwCilVdHH1ILY9TJ36RYNfwDmIH2S7FffCzHGGlE
 zAyt8+ssopYeoXyxABNbZp9QNrEbDUpz81SCJzp+3zG1++wJBUCqavKQ1+sjJk7XJCHK
 jrg0cb0g3N+jJdbaTrH0SW4L8aduzO2jAV7uRip+rpQTqlFjrSkuSUNyWvAIPM8WPZyH
 uOoTSqSi0g5Zm+xkyeetSjQX3pat6Kqii7BPXS83gcuMMu3u0sQQAIN+g8AFJ6SWxtEU
 RPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684521625; x=1687113625;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c8NJTpbaQkrMxS2HcO+vhGH2r43mf2msf3vlTqsDsrs=;
 b=E94sUq/zcXBbYmnODyFncmPworcPIKOfROYX3tK5ilzO7OmsGg3IH7h2pfdY2AuFtO
 nnCq1I3KOYNo/k3CK8YSAsko2X0mM7qvvizzAf5IJpZq+boYxUqvruS792ocniEgi9P6
 Lr+f9OwLAPgcse9s6ezxzlBlJxwpRDzjHdttdDxGRDjiOzVfbq/Vwx7fYY1T3OwH8iwF
 iITHzIYrBPOmF5869DRsG4x5opvlSJW0lhXNI2a9RImNEvnnA3ZU/TRW8CgBYkmdRcEH
 iHaqNuAROTEk8DtC1SmkHU0CMzuF2uMcmW/Tifh/ym6VF8vG1wzuY6GwAJK9C8UoSm3F
 jGzA==
X-Gm-Message-State: AC+VfDzwaIrwcDM44bgQtiubVNzo73yklYjxFlOu/QL4SHJ9l1TYKAFc
 OlJhgiz1Fw+g+7PV46EhzIDM+w==
X-Google-Smtp-Source: ACHHUZ4f62Y0UoZLVYtNqHXRT/v14mYuJUtSH+wU3eLo3ZCW15UhZ5VkvHxoDO4OBra/hdi/wEGMzg==
X-Received: by 2002:a2e:b209:0:b0:2a7:96bd:9eb3 with SMTP id
 l9-20020a2eb209000000b002a796bd9eb3mr1073425ljm.3.1684521625511; 
 Fri, 19 May 2023 11:40:25 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d22-20020a2e96d6000000b002ab59a09d75sm932493ljj.120.2023.05.19.11.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 11:40:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 1/3] dt-bindings: display: hdmi-connector: add hdmi-pwr
 supply
Date: Fri, 19 May 2023 21:40:21 +0300
Message-Id: <20230519184023.3943362-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519184023.3943362-1-dmitry.baryshkov@linaro.org>
References: <20230519184023.3943362-1-dmitry.baryshkov@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Follow the dp-connector example and add hdmi-pwr supply to drive the 5V
pin of the HDMI connector (together with some simple glue logic possibly
attached to the connector).

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/display/connector/hdmi-connector.yaml  | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml b/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
index 83c0d008265b..3ee8f9225984 100644
--- a/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
+++ b/Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
@@ -36,6 +36,9 @@ properties:
     description: GPIO signal to enable DDC bus
     maxItems: 1
 
+  hdmi-pwr-supply:
+    description: Power supply for the HDMI +5V Power pin
+
   port:
     $ref: /schemas/graph.yaml#/properties/port
     description: Connection to controller providing HDMI signals
-- 
2.39.2

