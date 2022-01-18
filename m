Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9083B492289
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 10:20:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D690A10EBCD;
	Tue, 18 Jan 2022 09:20:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A324B10EBCD
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 09:20:16 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 o14-20020a17090ac08e00b001b4b55792aeso1742431pjs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 01:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kp2JX1puGgzXBsvWu8HbdG09bQuSVyJ347xkXdyu4zM=;
 b=iv59fl/+TUN+el5syUDm5Q/h9mk7/lMUY0VPBIFqmNn0QRc/6edIaPvpLBE72jhAlL
 DarFZ6GtROPD9sX3dKbdtjgsvsmkQRPWJIBx7Cgn4CG8DAUa2+XxmKDSbQRcrX8pa7LZ
 MVDz20uwoFy9g2As45611p0L/nstkFWaG1oM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kp2JX1puGgzXBsvWu8HbdG09bQuSVyJ347xkXdyu4zM=;
 b=xnE0SiDIykOkymepXZEtag+JOANljVB1KsZ22ryqwmksJa+dSiASgYvp8XObp6zAJB
 wvMGsSn1AdXbCf7RGIhVv0oOKEmM6lUUF0nrJhYQewU5XWBfm8yPNxiPFVem9dhxX9s9
 3UJ6YEgCBP0niH6G7fPj0j0x0sSW735YIyJ1qlao/re1kEoOtjdXbSRQNuKo2SadE9JX
 SzcaxWEjn3dLWdouuOf9od07gbJwxMPvNJ+cQ4voAUWZnzYdQyEZmNEiva3QC64BYave
 fUJspoNyS0gRI6dpCxyFOaGaIR482XZ0x2EYsbkZlAEv6Ft/A0tVwzldg9zPY4PhpJEO
 w9xA==
X-Gm-Message-State: AOAM531Po9AYwQJY3xHfgjOF7gTzp/vMhP8b1HLeU3HJJDMmxTGJnzxq
 J55mY2gKoF3CBgV5LJt9OscKvQ==
X-Google-Smtp-Source: ABdhPJxSYdZj6GlxPX1EcP3nJedapwQ4dsYkk+FXgi6D1vUmmCz6wwa/8hmHr6JqKMsLEwhJm6YGHA==
X-Received: by 2002:a17:902:ea85:b0:14a:3c49:f140 with SMTP id
 x5-20020a170902ea8500b0014a3c49f140mr26185537plb.31.1642497616208; 
 Tue, 18 Jan 2022 01:20:16 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:4448:8072:97f1:64dd])
 by smtp.gmail.com with ESMTPSA id y1sm14691501pgs.4.2022.01.18.01.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 01:20:15 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Robert Foss <robert.foss@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v4 4/4] dt-bindings: drm/bridge: anx7625: Add aux-bus node
Date: Tue, 18 Jan 2022 17:20:02 +0800
Message-Id: <20220118092002.4267-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220118092002.4267-1-hsinyi@chromium.org>
References: <20220118092002.4267-1-hsinyi@chromium.org>
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
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

List panel under aux-bus node if it's connected to anx7625's aux bus.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Xin Ji <xji@analogixsemi.com>
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
2.34.1.703.g22d0c6ccf7-goog

