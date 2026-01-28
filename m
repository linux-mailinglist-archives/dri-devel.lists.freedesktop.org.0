Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0LgxJ8ckemlk3QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:01:27 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 511E9A36CD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 16:01:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE7310E716;
	Wed, 28 Jan 2026 15:01:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=thundersoft.com header.i=@thundersoft.com header.b="bJZEvR9Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m155104.qiye.163.com (mail-m155104.qiye.163.com
 [101.71.155.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A88E10E20E
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 11:16:21 +0000 (UTC)
Received: from [127.0.1.1] (unknown [36.129.139.90])
 by smtp.qiye.163.com (Hmail) with ESMTP id 3248e5334;
 Wed, 28 Jan 2026 19:16:16 +0800 (GMT+08:00)
From: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Date: Wed, 28 Jan 2026 19:15:45 +0800
Subject: [PATCH v2 1/3] dt-bindings: display: lt9611: Support single Port B
 input
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-rubikpi-next-20260116-v2-1-ba51ce8d2bd2@thundersoft.com>
References: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
In-Reply-To: <20260128-rubikpi-next-20260116-v2-0-ba51ce8d2bd2@thundersoft.com>
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
 Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Hongyang Zhao <hongyang.zhao@thundersoft.com>, 
 Roger Shimizu <rosh@debian.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769598974; l=2063;
 i=hongyang.zhao@thundersoft.com; s=20260127; h=from:subject:message-id;
 bh=tUM2zRhk3tGjOWNoL9pr4hiIZD4Y3QnOEKMpju2f5T0=;
 b=zhOepmzkG/jf1+koNGRN3EtYjWQyYkfzrIpRwvDdRnDCkJw/OA/qr2xF216a3U8P+T9m1S7aw
 0XFy0GRUU4bA2+phvTBXC1qNUHEd9RD3ErLIsj3vWa6jRK6e+QVs6RE
X-Developer-Key: i=hongyang.zhao@thundersoft.com; a=ed25519;
 pk=D9yL5W9Zj0lPBDAq9gzY++1849VlXuTWAkROzZ88J/4=
X-HM-Tid: 0a9c0451825009d5kunm18b1b2c5170b9b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
 tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCGR5DVksaH0NDTU4fQ0hLGVYVFAkWGhdVEwETFh
 oSFyQUDg9ZV1kYEgtZQVlITVVKSUJVSkhCVUJLWVdZFhoPEhUdFFlBWU9LSFVKS0lPT09IVUpLS1
 VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
 b=bJZEvR9Q6c4yRnm0JhQ72J7wVFo5/nEN9I3JU//CrD3K+8CE4kdnW+6EecMZBIFEky1I/3ZKTGk8fzqNl7jb8sIre+6yq8YcGZMSAMND6AkIjFv/YVQ1t7wDaINjLEm93D9GZzircmd0EGXVn0zYa1d6TjA01ZXh/LrBOHlPep8=;
 c=relaxed/relaxed; s=default; d=thundersoft.com; v=1; 
 bh=MrdWylWfyr000+v/1my5reLHLYqfpjYw9XG/zLUhbzw=;
 h=date:mime-version:subject:message-id:from;
X-Mailman-Approved-At: Wed, 28 Jan 2026 15:01:07 +0000
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
X-Spamd-Result: default: False [8.69 / 15.00];
	URIBL_BLACK(7.50)[thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	BAD_REP_POLICIES(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:hongyang.zhao@thundersoft.com,m:rosh@debian.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	RCVD_COUNT_THREE(0.00)[3];
	R_DKIM_ALLOW(0.00)[thundersoft.com:s=default];
	FORGED_SENDER(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,linux.intel.com,suse.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RSPAMD_URIBL_FAIL(0.00)[0.0.0.2:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[thundersoft.com,none];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hongyang.zhao@thundersoft.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	DKIM_TRACE(0.00)[thundersoft.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:131.252.210.177:c];
	RSPAMD_EMAILBL_FAIL(0.00)[0/port.0.0.0.1:query timed out,hongyang.zhao.thundersoft.com:query timed out];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.1:email,thundersoft.com:email,thundersoft.com:dkim,thundersoft.com:mid,0.0.0.0:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,0.0.0.2:email]
X-Rspamd-Queue-Id: 511E9A36CD
X-Rspamd-Action: add header
X-Spam: Yes

The LT9611 has two DSI input ports (Port A and Port B). Update the
binding to clearly document the port mapping and allow using Port B
alone when DSI is physically connected to Port B only.

Changes:
- Clarify port@0 corresponds to DSI Port A input
- Clarify port@1 corresponds to DSI Port B input
- Change port requirement from mandatory port@0 to anyOf port@0/port@1,
  allowing either port to be used independently

Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
Reviewed-by: Roger Shimizu <rosh@debian.org>
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

