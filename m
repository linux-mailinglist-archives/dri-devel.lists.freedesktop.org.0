Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKBKNGYYdmnXLgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 14:19:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2F080A24
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jan 2026 14:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D3D10E133;
	Sun, 25 Jan 2026 13:19:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="BGbg+0HO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC0D10E100
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 13:19:28 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id
 5b1f17b1804b1-47ee4539adfso40151045e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jan 2026 05:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769347167; x=1769951967; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=R5Zfr1fBtqgJrfSd/g+IV1kLhhHTpd7Gc0DhUBdILk8=;
 b=BGbg+0HOoJEMZzhKjb0PwYJUgrA6xEiuWdL7QZYWo+moSZ/dYa5rCZj2pAY0W80AIU
 biiNRWMpX+BHRebKVP5LKZ1u1Ba64pDk12XqPFHgm1VCkTj6S5T4Pal+ciHmlkvhSVmm
 DeJ0MJHNTY7CXsMdY0mbZqtk0e+qBzl2hKA39vc0YSRYgBTZ6Ry1x5W+jjNChPavu09f
 66qIfS6e/gTuU3dGx2LGyi/v5kYaWJ7r9/66wTIZwzRGdCJgZ6ODWJbeeH044nGA2DKe
 sfI/gHMT4Q1nAB1bgwN4Joqx0XiCkjEV3DkL7ibbO7DHKMQ5GkIW/lLzF5OXqiS4RQ+F
 mHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769347167; x=1769951967;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R5Zfr1fBtqgJrfSd/g+IV1kLhhHTpd7Gc0DhUBdILk8=;
 b=FD738ObFAmHc6/GVuLD/LZmN8oi1BHqD+8QUa2f5dap7dYfMq4BKuNAg/DuqtxH+Q6
 IMghoU0MkQH9oYHCxv92L6aMp0kp4DDsW2opMUhowBg4bW95LAQq0F2RrloS2xB61kK5
 0TeYpY5c9gujzlnxBfCReEspOppJBlSF9NbCXQWN+varAlzTeaDoqm81Hk6Vszw78Pzh
 vucIG0XAYv0tMQ+nsouIJvoAf9ady8Bafna1npppr8Yy7VgiJL0gwOLvjTjBc1y+2Hix
 luuH7nIMdOPM2TbcI0Q+MRVoo+YNUxjsImUZyOfCSknVlh+Ye/24pqe8wm73BLOO70TK
 yapQ==
X-Gm-Message-State: AOJu0Yy3Q4CpxC65rm1+ZcHrin2mZuKwhJmyzBzgKjCci4mqQs/ucu0k
 E4zrgWGtVqTQ0YlqCYUSN6AR/YzWzG3fl9EfAnrVE0GkPkS8KI0nKpfx
X-Gm-Gg: AZuq6aL1CRKRyWwVtKwV7b/gpkO4e5Q48aQdI/KN19sO+BmuzDtxRmhXMZIaAXwEi4q
 prM4zdXe7A+c201LEfFD3l/YDHZRneJ2oeq/Hl5Xh0O/gnGcjaXdklFfj9xPvNqeJSMNvNrIQt1
 xbZT6GvfNr5Z68dOSHX6FIHDU3HGluze2k9MZFbuarBjoCHcnW/tgRmvFBQC/XwZvODv/QVgb7T
 f7Su8Bo8FkP6+pwTAC3ru91MEoQp2zm7mrVM7ELsPYTAbIA5oQ+o5SuUdqa0rNwCfOeYQChDQn9
 /u6go/u/QN/VIsr6PsziTDodXKbxqRIT290Xi6hL5caQ+vwYyX6JMoQdOZB8E0ysYU83Rem7gyM
 GTeqTvVOO7DwGF59SrmCDxZtJdUuiCbORsTiJfQ2D2fajLsV/skLVJ8Wme6E/mBH/lswVu2KW52
 zW
X-Received: by 2002:a05:600c:3f18:b0:477:7c7d:d9b2 with SMTP id
 5b1f17b1804b1-4805d06ae8dmr25854955e9.32.1769347167119; 
 Sun, 25 Jan 2026 05:19:27 -0800 (PST)
Received: from xeon ([188.163.112.49]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48047028928sm382382215e9.2.2026.01.25.05.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jan 2026 05:19:26 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] dt-bindings: display: panel: document Atrix 4G and
 Droid X2 DSI panel
Date: Sun, 25 Jan 2026 15:19:03 +0200
Message-ID: <20260125131904.45372-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125131904.45372-1-clamor95@gmail.com>
References: <20260125131904.45372-1-clamor95@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,oss.qualcomm.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jessica.zhang@oss.qualcomm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:clamor95@gmail.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,devicetree.org:url]
X-Rspamd-Queue-Id: 0E2F080A24
X-Rspamd-Action: no action

Atrix 4G and Droid X2 use the same 540x960 DSI video mode panel. Exact
panel vendor and model are unknown hence generic compatible is used based
on board name it is used with.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../display/panel/motorola,mot-panel.yaml     | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/motorola,mot-panel.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/motorola,mot-panel.yaml b/Documentation/devicetree/bindings/display/panel/motorola,mot-panel.yaml
new file mode 100644
index 000000000000..2326a83bc405
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/motorola,mot-panel.yaml
@@ -0,0 +1,68 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/motorola,mot-panel.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Atrix 4G and Droid X2 DSI Display Panel
+
+maintainers:
+  - Svyatoslav Ryhel <clamor95@gmail.com>
+
+description:
+  Atrix 4G and Droid X2 use the same 540x960 DSI video mode panel. Exact
+  panel vendor and model are unknown hence generic compatible is used.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: motorola,mot-panel
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: Regulator for main power supply.
+
+  vddio-supply:
+    description: Regulator for 1.8V IO power supply.
+
+  backlight: true
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "motorola,mot-panel";
+            reg = <0>;
+
+            reset-gpios = <&gpio 35 GPIO_ACTIVE_LOW>;
+
+            vdd-supply = <&vdd_5v0_panel>;
+            vddio-supply = <&vdd_1v8_vio>;
+
+            backlight = <&backlight>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi_out>;
+                };
+            };
+        };
+    };
+...
-- 
2.51.0

