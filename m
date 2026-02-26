Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P02BaQIoGm4fQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:47:32 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C8C1A2DE5
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 09:47:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BCF10E886;
	Thu, 26 Feb 2026 08:47:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rXIIOEfl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
 [209.85.128.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D5B10E885
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 08:47:23 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id
 5b1f17b1804b1-483bd7354efso7970315e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 00:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1772095642; x=1772700442;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n/hVz7nlruTnhdI8UkrlZIFLUp/mnqXEgc1farN/t6k=;
 b=rXIIOEflPoLDAZ26RRnouxLXmlwF6W4cgQmTturYsWNylARw/U92XBIu3Z9zQcA4kL
 WBpTTZ3LdUOpp5kdSwGo0CDLEGcTTCCT50A1h+vv9G9CthzI1wQUiNhS/6/tC11cj50J
 LlRiPszLlHnrA7S/LiJOMVo8UC5qn7bZgn8XU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772095642; x=1772700442;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=n/hVz7nlruTnhdI8UkrlZIFLUp/mnqXEgc1farN/t6k=;
 b=MMto5A4YYj+yUjJNRLGqo7gKp3zUzDIc4mUOIaSoaXrf0D4HfYOJR0sbJXMQPDcyH/
 gJgqlfEUbq4y7BWxQuX0roP2uhcKS5qvL7Cf3F6x7TXkv98BcY1qSoV9I8nP3nGaPUdV
 vdvcK3hjQY7ypgHEMGm9XzFtUWIwSF+/RMTzPJuUGEQJ9wBW5jHwYaKZpL9RRXtVgmla
 PycvGsmsNR9FndUI5czSF4Yk9Ia1IzTY/QSdHudfpLUNKsrAwaDwiMdEwyUfWblRMWBw
 EC8UaVqNYJZH8VrZWJk7hMn1t0EksSV+lVsMQOqZMmr6XA55clZ8UxyJz8/+KjEf26xV
 vMQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWytZ2VRmVIGptYn34RWAwQrUUpFpmoikptuFaDeBXBEg0ShdT8uLGtql+nL2UDVF7amOyBQSOgqCg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvxrL7NQ3yHb6MwRbfmnr1JH+d44nZ29FYA4/DTE4bQI91pj6x
 qb4HqfAysDvn9H7n6DaC40HOIC7HodIjk7E0AGY4gtqaNEtAXLZEBTIbi5Ra+bIzWd4=
X-Gm-Gg: ATEYQzyhaLn61HPxojDoLEhEenz/i7YDdAPseI1sVZQDfp+PwMhTe6D9PGRvsUPl2yz
 SNXdbH1WP/udRpNebc+0xozhmQi7n3HrgPE7EXLEtce6tD9BueqnGPos4/5RQXTPNi/v5vxl+ov
 gWYJgdZ4WIhmIxk3Un8IxtcplBODd4k9HIzFTbM+d5xIviJGyGqlus/+k7pZkMNWoMrK04JiQ8V
 LI+skiIAS83OwIG8Xy61RQunD8EFCiY1GwJ7M899G9uYyOnk/z9OBrx9lix28x3U3NIzginuDFH
 hCPc6Zmr9GHpACSky/EO521RFDVeHGoDm83Pv6cVUMDVesV7CqiHqsg0BU7Gkzv0WduQHofjkat
 fmhvUS98FhOejWbvGEkneZRuWU2XR62MLkZAzDvSLc4M52VKJJnUfsqWwdc8vxQGHJAIHif36hS
 xrwxt7d14o2kMTb4/OiW8zgn3aRc0L3/XBFzd7Ctf0CwnGUohc7OiAqiY5BjHwVR+V2wiy5or1T
 e+R0nt1NjtAiMjBhhDTiDL5fhKPcnZDUCkvrttcSRuNeNu/Lp/drKfQqYhsCw2U65r47NBu67X8
 ek/SZza5/0atgTm5tGv+SwZS
X-Received: by 2002:a05:600c:8b11:b0:483:6d42:25c6 with SMTP id
 5b1f17b1804b1-483c21a105fmr60548225e9.23.1772095641758; 
 Thu, 26 Feb 2026 00:47:21 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-95-248-31-95.retail.telecomitalia.it. [95.248.31.95])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfb85c58sm31581075e9.9.2026.02.26.00.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 00:47:21 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <jesszhan0024@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [RESEND PATCH v4 3/4] dt-bindings: ili9806e: add Rocktech
 RK050HR345-CT106A display
Date: Thu, 26 Feb 2026 09:47:02 +0100
Message-ID: <20260226084713.2566672-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226084713.2566672-1-dario.binacchi@amarulasolutions.com>
References: <20260226084713.2566672-1-dario.binacchi@amarulasolutions.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amarulasolutions.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amarulasolutions.com:s=google];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[amarulasolutions.com,kernel.org,gmail.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-amarula@amarulasolutions.com,m:dario.binacchi@amarulasolutions.com,m:robh@kernel.org,m:conor+dt@kernel.org,m:airlied@gmail.com,m:jesszhan0024@gmail.com,m:krzk+dt@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:mwalle@kernel.org,m:neil.armstrong@linaro.org,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[amarulasolutions.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dario.binacchi@amarulasolutions.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.908];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.0:email,devicetree.org:url]
X-Rspamd-Queue-Id: 61C8C1A2DE5
X-Rspamd-Action: no action

Document the Rocktech 5" 480x854 panel based on the Ilitek ILI9806E
controller.

This panel uses SPI for control and an RGB interface for display
data, so adjust the binding requirements accordingly.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Add Reviewed-by tag of Rob Herring

Changes in v2:
- Restore vdd-supply as required for both DSI and SPI types
- Dop useless settings in case of rocktech,rk050hr345-ct106a

 .../display/panel/ilitek,ili9806e.yaml        | 38 ++++++++++++++++++-
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
index f80307579485..2080d9e0ffac 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9806e.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/display/panel/ilitek,ili9806e.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Ilitek ILI9806E based MIPI-DSI panels
+title: Ilitek ILI9806E based panels
 
 maintainers:
   - Michael Walle <mwalle@kernel.org>
@@ -18,6 +18,7 @@ properties:
       - enum:
           - densitron,dmt028vghmcmi-1d
           - ortustech,com35h3p70ulc
+          - rocktech,rk050hr345-ct106a
       - const: ilitek,ili9806e
 
   reg:
@@ -30,11 +31,24 @@ required:
   - compatible
   - reg
   - vdd-supply
-  - vccio-supply
   - reset-gpios
   - backlight
   - port
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - rocktech,rk050hr345-ct106a
+then:
+  $ref: /schemas/spi/spi-peripheral-props.yaml#
+  required:
+    - spi-max-frequency
+else:
+  required:
+    - vccio-supply
+
 unevaluatedProperties: false
 
 examples:
@@ -60,5 +74,25 @@ examples:
             };
         };
     };
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
 
+        panel@0 {
+            compatible = "rocktech,rk050hr345-ct106a", "ilitek,ili9806e";
+            reg = <0>;
+            vdd-supply = <&reg_vdd_panel>;
+            spi-max-frequency = <10000000>;
+            reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;
+            backlight = <&backlight>;
+            port {
+                panel_in_rgb: endpoint {
+                    remote-endpoint = <&ltdc_out_rgb>;
+                };
+            };
+        };
+    };
 ...
-- 
2.43.0

