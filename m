Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJcPAakNcGlyUwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 00:20:09 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4931A4DB19
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 00:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0131B10E14E;
	Tue, 20 Jan 2026 23:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UDyxxEhR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com
 [74.125.82.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D24410E14E
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 23:20:03 +0000 (UTC)
Received: by mail-dy1-f194.google.com with SMTP id
 5a478bee46e88-2ac3d5ab81bso6476655eec.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 15:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768951203; x=1769556003; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=At8sEw4IJz6edgX+XTJSF5huNTHEo8Z6l7w0WtgZiBE=;
 b=UDyxxEhROKV74n5xSLR0/KZO0RdRxaaa3GKm8kr4hINuQMcoyrd70KUdDJZh0Gb6Ll
 nDqtuOaVjQuwPTPU9TS5/AI/tg6sNDmSFHFSrU0vzXnFLaB5/B+fWDQWLHSfjuQMztJD
 ETVenhRjzAaI0kEVLNBlgN58S2ZgQw0fMYGZ+ioNv92eF3fW1WZfY1TdiwklNTZWxGmx
 skdVVsGqGvxUDA//SSNXNaXh8qlBsQzO+IuoGsvYw2H81w5A3bDYaR7mLplPQWr+gHnD
 y8x1GcjLVzMStJkKUYBU7x3p5Ktm/2AVVyMtAgBvjp6idppbR1StSC5iWCTgTzf4PQUi
 3n+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768951203; x=1769556003;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=At8sEw4IJz6edgX+XTJSF5huNTHEo8Z6l7w0WtgZiBE=;
 b=Ua6r+tnSrEBZRhqRxQE9m6kElN/Ibxi+tgzDyCMFRcmX7Dh+zcr8oE6Ah0TGdDeocd
 tkw7wL2FXJg6ivPk/FD5VlePT2KjjRu1xvXJIh6kNGppjC9ZQC5g4gxLy+MflMMpJKuY
 ns/1IWBAtz3uKvoDHUdmp/tLbz0j9Fwufk8Uh8xgbiFPsFAJTlbAE6JArsDbTHlnLXkH
 wAt0I6po3mdCrU0n9jXD9VaJrGkE3AnNSyy6vSmLg2rVniyVt+v1Bsf88n+briCSuff6
 2XmTGQBHuDAib53uEV2uSx9H4S5ehmLDX8kd8utiihykOtRGRqVa1xsd4LRqjezepQ8R
 5eLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRDsf88MyavCQ90sMmqhwM0LMsDxlAgMlLbmziJQ0aHM+/3y0mMdDyxLeilvK44KehkKjnB5VPOxk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwAN90n4CSvQICUV9mJCU4rnfVCpHTI901G1OzgN+seIpvoBnPi
 lrWfnqens+/K9p68uIBCv6rHr4sw8CnMFaeLjHMU8cg5/RKLJU9NlfEO
X-Gm-Gg: AZuq6aLqKUmA7KWXOXRLAeJoAv6ipy4+7wCL7yETiN0i1/AZIaPiOwiVocwT74iKcUz
 vTHzT6eO81/ULh+YJEpR9tcv0zAfWHkQj8nx5oyBjhmhuwdpHDBAWjlG3VRADZrpog2cim8cQ5Q
 m1ffHrqwBCR7CI7ZZE/zLhDICO6MeKo689rnRDNu5M7Yu/PdVY1slbW8e9uQX6SO7t3kSrcQlm1
 wwgcKdtulZQ3qWGk3qLMV9lHon5Pf35hSESEwptreqboQLSIHIc5aujgEoqp6OBCDFpWXwFE2Vb
 +57jnXvSVmBj2eUCSiX2SG1KeRwjOr0rB1M2PEXoPae1QGZx4g9fooDBIoHgMLRgwc3yYBqhEzT
 m2RykOfvfhMnw/0XEoRHiZ4kGKdyNmC06DfzALmNZmD6ZxJ1KJ1WRPddz70hRFtyzu6bO4Dqj8T
 dnG0qcAw==
X-Received: by 2002:a05:7300:a286:b0:2ae:55f1:8201 with SMTP id
 5a478bee46e88-2b6b46c6813mr9693768eec.1.1768951202448; 
 Tue, 20 Jan 2026 15:20:02 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61::1000])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6fc2820a2sm4326816eec.35.2026.01.20.15.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 15:20:01 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: victor.liu@nxp.com
Cc: marek.vasut@mailbox.org, neil.armstrong@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, frank.li@nxp.com,
 Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v3 1/2] dt-bindings: display: bridge: ldb: Document nxp,
 enable-termination-resistor
Date: Tue, 20 Jan 2026 20:19:29 -0300
Message-Id: <20260120231930.2782444-1-festevam@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [3.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[festevam@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:victor.liu@nxp.com,m:marek.vasut@mailbox.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:frank.li@nxp.com,m:festevam@nabladev.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[festevam@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,i.mx:url]
X-Rspamd-Queue-Id: 4931A4DB19
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Fabio Estevam <festevam@nabladev.com>

Document the optional nxp,enable-termination-resistor property for the
i.MX LVDS display bridge.

This boolean property indicates that the built-in 100 Ohm termination
resistor on the LVDS output is enabled. It is controlled via the HS_EN
bit in the LVDS_CTRL register. Enabling the resistor can improve LVDS
signal quality and may prevent visual artifacts on some boards, but
increases the power consumption.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v1:
- Restrict it to i.MX6SX. (Liu Ying)

 .../bindings/display/bridge/fsl,ldb.yaml       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
index 49664101a353..7f380879fffd 100644
--- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
@@ -35,6 +35,15 @@ properties:
       - const: ldb
       - const: lvds
 
+  nxp,enable-termination-resistor:
+    type: boolean
+    description:
+      Indicates that the built-in 100 Ohm termination resistor on the LVDS
+      output is enabled. This property is optional and controlled via the
+      HS_EN bit in the LVDS_CTRL register. Enabling it can improve signal
+      quality and prevent visual artifacts on some boards, but increases
+      power consumption.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -84,6 +93,15 @@ allOf:
       required:
         - reg-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx6sx-ldb
+    then:
+      properties:
+        nxp,enable-termination-resistor: false
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

