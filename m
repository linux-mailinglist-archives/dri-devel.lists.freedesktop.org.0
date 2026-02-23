Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +IHEEWFinWk8PQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB875183C53
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 09:33:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BAB310E4FD;
	Tue, 24 Feb 2026 08:33:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="O5aLlj5r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0516110E30F
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 20:26:46 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-43767807da6so3536942f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Feb 2026 12:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771878405; x=1772483205; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=E2KmA+8Pfbp7g0ZPmDRNIiwTVdZh9YZrLO0rcJPB57Y=;
 b=O5aLlj5rf0t3/yPfV9H317q93M4koo3IFXjj52VArWV0RVw6PCiICjwoXsGJprcIBF
 adIZo1cP67y4K6bXnEay0vgxEjpXhdmPtxn3P1EDDAlY3RX6ZO2lIoOA+iwMDuc8UW++
 lMVuKWUs+9+YQvC/xC9fqdu8pJn7UZKnX0ktxgDL/xdA/UXg7PTS7IOrUdN2kbEfkjlC
 tq456nPuqR4smwt8nabQOdnd6rHnKhfQwR+KRqWuFw8hMcc7rBHMtAVpur6b32OsmEdX
 EbLPyF/RHUWvy/ojYSxunbfKGFkriji2kvaAYIdogqLb0RhfHuY6m0RfE3E47omJvQzU
 ndbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771878405; x=1772483205;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=E2KmA+8Pfbp7g0ZPmDRNIiwTVdZh9YZrLO0rcJPB57Y=;
 b=arLLw1hJuGVwPl/otFe0ei3F9IvcvcbFO/iOMIV73vmCZ8U0PGHFM+SpqC1Xa8w859
 EDYBTDK60ZoRrN0CL8fSykE6X3QieVJNLxoL9MtQ0SnDt/+daLEufhH6SPRcv5lkbf6f
 r5NLktg8CA66jA2eK7skL6c4Sd24UZLFhNWCfVlwlVSStCg2nXTuaMW6lRQ8/nHCLkBG
 gowS73BXwm+7gze5igyZ+dWr2cWk5h19qUbSnfRYhfE9H2bQv9DpTvAP0nKAo5/fzsa5
 nQJGS001MUWLAlcl2/+cubkbszqUyK0f9r/7gZ1ON7gDHeuE0asz9wjTbs6p70eRvLsQ
 RwEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuL5u/1fpPGsla31cG/cQPBav8YIrW1lKAgWfe/VIqsK7EyBWHJhK57b7/5UpK9s5xnsSozGFKgKo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw6RCYKIMdfQ9EKEDdmRxda7KDUkc4I4qM+SBpACgM5SUM7DxAo
 9G1NADoQxUTZeeQf8H9x6Y3QhDAsg30n5hYvpNC+MkmilJo27abR1jmz
X-Gm-Gg: ATEYQzyrtwMomiuuYngzlVs0dQ340hSgRrZ09+wCN36Xsjck+ObOBsMlQpi+IHz5Va2
 v8t4OttOP0AUXS9ZoBrbIV5R6IguSUARogMvPn0bkIvJPk6avY55vKr+p48vkT62KQZjqSvo4u9
 Qojf8ZCcqwyXpCE1Kt/N20VBemJfSVMrNJwoXkUXHy58NaDLjKu1S6TJGQUhd4PSbmME7ax8+Je
 8VmOhC/voHNi42a2llkCfB8H634eJ+hEYTRRIGEGzaM1cmQ+PFbngFSWKi8nnYehPSs8bAuVKXt
 J2TFfeDfrBuKTXv4xbnROoCapElMyZguAWdXp7mzjRKGinMcFHfKwXl00aPknEfrIK+WHqg+XG1
 IfJmqjBrtPoFVOviyjlGCGZTfvyIGwDAhfYlwCirXEz5St5eEsbkHZHhV6sdyhnqRWgM+XoniCN
 lgk3g6FGjlSFwpZEBCEVIOUUgbugUbYC1O1bRvtP6/wM83fB0efzWcHbNeTOHXX2M=
X-Received: by 2002:a05:6000:2004:b0:437:6c07:998f with SMTP id
 ffacd0b85a97d-4396f1812a0mr18928065f8f.45.1771878405247; 
 Mon, 23 Feb 2026 12:26:45 -0800 (PST)
Received: from [10.100.102.82] (46-116-183-56.bb.netvision.net.il.
 [46.116.183.56]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d54c5csm21369551f8f.38.2026.02.23.12.26.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Feb 2026 12:26:44 -0800 (PST)
From: Yedaya Katsman <yedaya.ka@gmail.com>
Date: Mon, 23 Feb 2026 22:26:20 +0200
Subject: [PATCH v2 1/3] dt-bindings: display: panel: Add Samsung S6E8FCO
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260223-panel-patches-v2-1-1b6ad471d540@gmail.com>
References: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
In-Reply-To: <20260223-panel-patches-v2-0-1b6ad471d540@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Kamil_Go=C5=82da?= <kamil.golda@protonmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, Yedaya Katsman <yedaya.ka@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771878400; l=2810;
 i=yedaya.ka@gmail.com; s=20260113; h=from:subject:message-id;
 bh=V7fqUxwHPHnpclzLi48IhRpOeLBkH3gWfVtQ4pPChnA=;
 b=CkxTItGSw02vnP3BgtaVJvQ2rlHgubEMYaZKNbuiwz6iA/OQZlH0fTnnql52+Pl+7wtgAgeLN
 TRBcEu/AcxoBOShrpzZ4yqizrtoi8Kp/TG0itJDVeQTbxYrnNZAmCCF
X-Developer-Key: i=yedaya.ka@gmail.com; a=ed25519;
 pk=CgNmxD3tYSws5dZfpmJfc6re/bV/f47veVijddHLytk=
X-Mailman-Approved-At: Tue, 24 Feb 2026 08:33:17 +0000
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:kamil.golda@protonmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:~postmarketos/upstreaming@lists.sr.ht,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:yedaya.ka@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:yedayaka@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,protonmail.com];
	TAGGED_FROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yedayaka@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.sr.ht,lists.freedesktop.org,vger.kernel.org,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ixit.cz:email,protonmail.com:email,linaro.org:email]
X-Rspamd-Queue-Id: CB875183C53
X-Rspamd-Action: no action

Document Samsung S6E8FCO 6.09" 720x1560 panel
found in the Xiaomi Mi A3 smartphone.

Co-developed-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Kamil Gołda <kamil.golda@protonmail.com>
Signed-off-by: Yedaya Katsman <yedaya.ka@gmail.com>
---
 .../bindings/display/panel/samsung,s6e8fco.yaml    | 64 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 69 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.yaml b/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..8c042ce5f65bf317df48e109d88ebdc87ef5d5ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/samsung,s6e8fco.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S6E8FCO AMOLED Panel
+
+maintainers:
+  - Yedaya Katsman <yedaya.ka@gmail.com>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: samsung,s6e8fco
+
+  reg:
+    maxItems: 1
+
+  vddio-supply: true
+  ldo-supply: true
+  iovcc-supply: true
+  reset-gpios: true
+  port: true
+
+required:
+  - compatible
+  - reg
+  - vddio-supply
+  - ldo-supply
+  - iovcc-supply
+  - port
+  - reset-gpios
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
+            compatible = "samsung,s6e8fco";
+            reg = <0>;
+
+            vddio-supply = <&vreg_l9a>;
+            ldo-supply = <&panel_ldo_supply>;
+            iovcc-supply = <&panel_iovcc_supply>;
+
+            reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&mdss_dsi0_out>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index e087673237636268346979ddc270f8cf0905c722..545d4cf68b9ac27765c7981e668e32cfecf3366b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8183,6 +8183,11 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/samsung,s6e3ha8.yaml
 F:	drivers/gpu/drm/panel/panel-samsung-s6e3ha8.c
 
+DRM DRIVER FOR SAMSUNG S6E8FCO PANELS
+M:	Yedaya Katsman <yedaya.ka@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/panel/samsung,s6e8fco.yaml
+
 DRM DRIVER FOR SAMSUNG SOFEF00 DDIC
 M:	David Heidelberg <david@ixit.cz>
 M:	Casey Connolly <casey.connolly@linaro.org>

-- 
2.53.0

