Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF2F4A85DB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 15:10:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA5F10F9DC;
	Thu,  3 Feb 2022 14:10:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC90A10F9DC
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Feb 2022 14:10:39 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 z14-20020a17090ab10e00b001b6175d4040so10182971pjq.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Feb 2022 06:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ye0S9ZGhY+9EmUZN3Zyu0p+11AX+B8bmbaaOWhr2T0c=;
 b=STDUWwb7a/y85Ok/NB5I7fhKge4GwjC4knpXMRyn9PW8JuUjtD7b56eE/ncs7hF9U6
 JS5nlLRclPPFsDEZbVjsJUoEHgBJ5osV5YnHkwEN891F1RH3DX/Dn0KFYZ9SNOFMlq0P
 ANg5M0M5z7FaE1kLG+qErqJvc3obODs7RZI4s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ye0S9ZGhY+9EmUZN3Zyu0p+11AX+B8bmbaaOWhr2T0c=;
 b=s4CI2V5PgvmfLrVs9VzBPRzsX/REPhTnAzxsBzS04tbtKKLF71ZG8w+AAVx7BArV5b
 +EZKy3Rk+y08/yeqeWPJ+KBC/ajFj9kWeIlzPKPYR64T8jm0+tuEQMHSuXtXE6CaiSWY
 Ia5Tq854sp60DPd2O7RFJPVYmxTlY7eptT/2/IbdlDTH1MBmnD4vXIXnq+k+Ozg/kdnf
 uIRidWeHwI5Q3bWrIOWVcgQ2cn3nDU7f1D/an7NuP2qebOMTvX61DtUxgiYAq0HBrIOs
 DPnQl41LtMmCXyAIgbs5p16HzXyt8Kh0UYljvWopi3WvrWlxMLK97gKyIzqygNkaWa/x
 WIfA==
X-Gm-Message-State: AOAM530WcFJMFKZEzX6cKdr+Wpy/CpL822m3vcXMYCc6mvsxaaMSI9YH
 1KQzk8pqNlovKCNwGX/L0bo6IQ==
X-Google-Smtp-Source: ABdhPJzoYwpMxEEv91fmnBO89N5wgJxdp3QJbpKicysgnntwueXq+qnjqpTLcsJFXmHlbsX9bsA6iQ==
X-Received: by 2002:a17:902:e806:: with SMTP id
 u6mr37236170plg.10.1643897439187; 
 Thu, 03 Feb 2022 06:10:39 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:cbdf:65ae:127:f762])
 by smtp.gmail.com with ESMTPSA id w11sm29532818pfu.50.2022.02.03.06.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 06:10:38 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v6 4/4] dt-bindings: drm/bridge: anx7625: Add aux-bus node
Date: Thu,  3 Feb 2022 22:10:23 +0800
Message-Id: <20220203141023.570180-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220203141023.570180-1-hsinyi@chromium.org>
References: <20220203141023.570180-1-hsinyi@chromium.org>
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

List panel under aux-bus node if it's connected to anx7625's aux bus.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../display/bridge/analogix,anx7625.yaml        | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
index 1d3e88daca041a..0d38d6fe39830f 100644
--- a/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/analogix,anx7625.yaml
@@ -83,6 +83,9 @@ properties:
     type: boolean
     description: let the driver enable audio HDMI codec function or not.
 
+  aux-bus:
+    $ref: /schemas/display/dp-aux-bus.yaml#
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -167,5 +170,19 @@ examples:
                     };
                 };
             };
+
+            aux-bus {
+                panel {
+                    compatible = "innolux,n125hce-gn1";
+                    power-supply = <&pp3300_disp_x>;
+                    backlight = <&backlight_lcd0>;
+
+                    port {
+                        panel_in: endpoint {
+                            remote-endpoint = <&anx7625_out>;
+                        };
+                    };
+                };
+            };
         };
     };
-- 
2.35.0.rc2.247.g8bbb082509-goog

