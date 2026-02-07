Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAC3MqeAh2lQYwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:12:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F077106CFF
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 19:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01B6710E2A1;
	Sat,  7 Feb 2026 18:12:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=thundersoft.com header.i=@thundersoft.com header.b="LGCz9P7g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m15599.qiye.163.com (mail-m15599.qiye.163.com
 [101.71.155.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E9C10E170
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 07:33:42 +0000 (UTC)
Received: from [127.0.1.1] (unknown [113.235.123.225])
 by smtp.qiye.163.com (Hmail) with ESMTP id 3372cf66b;
 Sat, 7 Feb 2026 15:33:38 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Sat, 07 Feb 2026 15:32:54 +0800
Subject: [PATCH v3 1/3] dt-bindings: display: lt9611: Support single Port B
 input
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260207-rubikpi-next-20260116-v3-1-23b9aa189a3a@thundersoft.com>
References: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
In-Reply-To: <20260207-rubikpi-next-20260116-v3-0-23b9aa189a3a@thundersoft.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Christopher Obbard <christopher.obbard@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roger Shimizu <rosh@debian.org>, 
 linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770449616; l=2074;
 i=hongyang.zhao@thundersoft.com; s=20251115; h=from:subject:message-id;
 bh=EGlbJt4UoSLkYy09+Ujv17dM+4JZjbWnbz1SJ8A7TVQ=;
 b=VabQBDcaR19gGUsPqBfUFW5+ApjQtXi/6JPTGqKx+qQymjWtrf7Qsp7roy3l9QqMS7y/SlqK6
 8hEmEyAng0wAkYlnZQpWK/ajm0VhFF5+Vowt2ko4gZU0Lylro/7lyXJ
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=0M0CJ1s9WiFZwli2JsxLB9ykikp5WkpKzCWgpdANKNI=
X-HM-Tid: 0a9c370545c509d5kunm3723250e7f3075
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZH0JCVkpDT0NPSkMfHh5JQlYVFAkWGhdVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlKSkhVSUhOVUpJSFVJSU5ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
 tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
 b=LGCz9P7gcDxPocmLXLstQ5nLO+UPYcIl+LO3yYZXUsj35hK0bCDm0SvEG59RAzORhN3dwivCxKLjF5EF3L4a2ExmLqjBBBE418m7dv4GNQIxbvz/5h/ka8qzSXHW3Oqvw+5lN7ZEpAV1ez50yX6xvByrgasoZZ/jevWItPAFo5c=;
 c=relaxed/relaxed; s=default; d=thundersoft.com; v=1; 
 bh=W01jkYSpWbsH8AaTOMMLWBvhB2MlFfUuXRlmTq4crEU=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Sat, 07 Feb 2026 18:12:44 +0000
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
	DMARC_POLICY_ALLOW(-0.50)[thundersoft.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[thundersoft.com:s=default];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:christopher.obbard@linaro.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:rosh@debian.org,m:linux-arm-msm@vger.kernel.org,m:hongyang.zhao@thundersoft.com,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de,oss.qualcomm.com];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.0:email];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-0.926];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.1:email,0.0.0.2:email]
X-Rspamd-Queue-Id: 2F077106CFF
X-Rspamd-Action: no action

The LT9611 has two DSI input ports (Port A and Port B). Update the
binding to clearly document the port mapping and allow using Port B
alone when DSI is physically connected to Port B only.

Changes:
- Clarify port@0 corresponds to DSI Port A input
- Clarify port@1 corresponds to DSI Port B input
- Change port requirement from mandatory port@0 to anyOf port@0/port@1,
  allowing either port to be used independently

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
---
 .../bindings/display/bridge/lontium,lt9611.yaml           | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
index 655db8cfdc25..429a06057ae8 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt9611.yaml
@@ -44,21 +44,28 @@ properties:
       port@0:
         $ref: /schemas/graph.yaml#/properties/port
         description:
-          Primary MIPI port-1 for MIPI input
+          DSI Port A input. directly drives the display, or works in
+          combination with Port B for higher resolution displays.
 
       port@1:
         $ref: /schemas/graph.yaml#/properties/port
         description:
-          Additional MIPI port-2 for MIPI input, used in combination
-          with primary MIPI port-1 to drive higher resolution displays
+          DSI Port B input. Can be used alone if DSI is physically
+          connected to Port B, or in combination with Port A for higher
+          resolution displays.
 
       port@2:
         $ref: /schemas/graph.yaml#/properties/port
         description:
           HDMI port for HDMI output
 
+    anyOf:
+      - required:
+          - port@0
+      - required:
+          - port@1
+
     required:
-      - port@0
       - port@2
 
 required:

-- 
2.43.0

