Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WSGuNHsLf2lziwIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 09:14:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2890BC530F
	for <lists+dri-devel@lfdr.de>; Sun, 01 Feb 2026 09:14:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDAB910E041;
	Sun,  1 Feb 2026 08:14:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="C9P9r5k3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D5210E041
 for <dri-devel@lists.freedesktop.org>; Sun,  1 Feb 2026 08:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Rg
 ZxWMsgxvF9wqaRGd5L3OLgxXU9L3sDTfqybdxvKyM=; b=C9P9r5k3f/tlVWwIT3
 1UR58PvbFfWJnowCwO1q/35CLWyYjyE0d2u7OIHJF5za4vKNRrdtG4kTvxcKjlaF
 UJ3YHXiZWrmNVpH6W1fROBBe3AhghTyg7/U9KX/+oSye5z4+8SWY9wmb5QYq9PI4
 d8Gz8QOVrhRbNwGvrFMV6HQT4=
Received: from ProDesk-480.. (unknown [])
 by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id
 _____wD3Hz40C39pmxGTKQ--.55310S3; 
 Sun, 01 Feb 2026 16:13:46 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com,
	heiko@sntech.de
Cc: alchark@gmail.com, andrzej.hajda@intel.com, conor+dt@kernel.org,
 cristian.ciocaltea@collabora.com, airlied@gmail.com,
 jernej.skrabec@gmail.com, jonas@kwiboo.se, kever.yang@rock-chips.com,
 krzk+dt@kernel.org, Laurent.pinchart@ideasonboard.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, nicolas.frattaroli@collabora.com,
 robh@kernel.org, rfoss@kernel.org, hjc@rock-chips.com,
 sebastian.reichel@collabora.com, simona@ffwll.ch, tzimmermann@suse.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 1/5] dt-bindings: display: rockchip: Add rk3576 DisplayPort
Date: Sun,  1 Feb 2026 16:13:27 +0800
Message-ID: <20260201081338.407999-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260201081338.407999-1-andyshrk@163.com>
References: <20260201081338.407999-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3Hz40C39pmxGTKQ--.55310S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zr4UWr43Jw4xKw1rKr1ftFb_yoW8CryUpa
 9xCw1UX3yIgr17W3yDtr1kCrs5K3WkA3yjyr17tw17KwsxKF4F93Wagwn8Jw43JF17Aa9x
 CF4j9ryxJw42vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jwVysUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbCxRoLaWl-CzrP+AAA3t
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
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:heiko@sntech.de,m:alchark@gmail.com,m:andrzej.hajda@intel.com,m:conor+dt@kernel.org,m:cristian.ciocaltea@collabora.com,m:airlied@gmail.com,m:jernej.skrabec@gmail.com,m:jonas@kwiboo.se,m:kever.yang@rock-chips.com,m:krzk+dt@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:neil.armstrong@linaro.org,m:nicolas.frattaroli@collabora.com,m:robh@kernel.org,m:rfoss@kernel.org,m:hjc@rock-chips.com,m:sebastian.reichel@collabora.com,m:simona@ffwll.ch,m:tzimmermann@suse.de,m:devicetree@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-rockchip@lists.infradead.org,m:andy.yan@rock-chips.com,m:conor@kernel.org,m:jernejskrabec@gmail.com,m:krzk@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[163.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,intel.com,kernel.org,collabora.com,kwiboo.se,rock-chips.com,ideasonboard.com,linux.intel.com,linaro.org,ffwll.ch,suse.de,vger.kernel.org,lists.freedesktop.org,lists.infradead.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andyshrk@163.com,dri-devel-bounces@lists.freedesktop.org];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[163.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 2890BC530F
X-Rspamd-Action: no action

From: Andy Yan <andy.yan@rock-chips.com>

The DisplayPort found on RK3576 is very similar to that of RK3588,
but work in dual pixel mode. And itself does not depend on the I2S
clock or the SPDIF clock when transmit audio.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>

---

Changes in v2:
- Remove unnecessary maxItems

 .../display/rockchip/rockchip,dw-dp.yaml      | 27 ++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
index 6345f0132d43..8a5299755abf 100644
--- a/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
+++ b/Documentation/devicetree/bindings/display/rockchip/rockchip,dw-dp.yaml
@@ -27,13 +27,11 @@ description: |
   * Pixel clock up to 594MHz
   * I2S, SPDIF audio interface
 
-allOf:
-  - $ref: /schemas/sound/dai-common.yaml#
-
 properties:
   compatible:
     enum:
       - rockchip,rk3588-dp
+      - rockchip,rk3576-dp
 
   reg:
     maxItems: 1
@@ -42,6 +40,7 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 3
     items:
       - description: Peripheral/APB bus clock
       - description: DisplayPort AUX clock
@@ -50,6 +49,7 @@ properties:
       - description: SPDIF interfce clock
 
   clock-names:
+    minItems: 3
     items:
       - const: apb
       - const: aux
@@ -95,6 +95,27 @@ required:
   - ports
   - resets
 
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3588-dp
+    then:
+      properties:
+        clocks:
+          minItems: 5
+        clock-names:
+          minItems: 5
+    else:
+      properties:
+        clocks:
+          maxItems: 3
+        clock-names:
+          maxItems: 3
+
 unevaluatedProperties: false
 
 examples:
-- 
2.43.0

