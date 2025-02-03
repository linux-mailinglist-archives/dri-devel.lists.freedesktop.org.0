Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9959BA26D98
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 09:48:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B5B10E5C7;
	Tue,  4 Feb 2025 08:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=beims.me header.i=@beims.me header.b="tC4Iv/wu";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="h+DTMfIw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFF8C10E54F
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 19:31:12 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id DFE02254016E;
 Mon,  3 Feb 2025 14:25:23 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-01.internal (MEProxy); Mon, 03 Feb 2025 14:25:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=beims.me; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1738610723; x=
 1738697123; bh=jeTpN+DA6GlNWTpy41RYxKGLGj01xrB9HXx/VsEI3UU=; b=t
 C4Iv/wuywzPnEX6biD/a7tDx1YZNSHRgI6DSSwMxQXzGWr1amS8v0YwYF6mzqb0m
 DyfTf6s109XuT5TiPYtkxsmcfkRfDdUBShcHCNwIaiV+nhT/s9iPLdbzSS2xRKkX
 4uT7EZtZJxqYgOWitN/Xx3WhZOBziyHlE/osuUnUubm2XNwxUjL44sMmPPWb0Swj
 +6V6lRCGvUtaNlHHVPCmjzYYBUv21tAdv8LrsRfoZXxlMIhClYFfXon+ryinvtmu
 A9BMFGiQFa+qZ6t5anqQBmAqKLeNAwqrEF8CahszrDRsK0axBixuiW8Jjg/9Dgcf
 FVbZ3KorH2KytZDDNThCw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; t=1738610723; x=1738697123; bh=j
 eTpN+DA6GlNWTpy41RYxKGLGj01xrB9HXx/VsEI3UU=; b=h+DTMfIwaZQokSc3L
 dN6rLLk6dt8UBUufyDytifdwqGoljOhskBL5DI3wfdXeRR5C6et/xCc4TvchnuJp
 ztboVdMxRjve+Zsc4jmMO9hdNWRxYPx+KWPlvrMNPUL5wsK1mnUDTfwzOdqu7MXk
 oCfVgbkQ7XUZidWWBDfIQWK60hQ7Np/gD3JGxspbWH1eSlnYiz9l9ECjRpaCWt77
 46pTT5c58ErexqTljB8xU2Vah9S/gtLKoJ/6kxZR+OQXXCgk5/DnJuWdmbdHm8ah
 p3O8mZaiB3J+4wgKSaXMD9o81PSynbuzB251v6ijqoERK/OAE1LI9xC3ce10Y+Y5
 JJG9w==
X-ME-Sender: <xms:IxihZ5pPPbddMeuNeCAGlEFvJ-Ly3X_3zItsQN0GgHxapLbGeK1KpQ>
 <xme:IxihZ7pcjVCTeti4PKIu-OlcGQmh-RCz5eVIZUUtw7ounZMdStInC6HAwUXcvqM-X
 _kciCeC002U4VrTs5U>
X-ME-Received: <xmr:IxihZ2PvVwyEXP4zTX1hylrIEkhXtVg54onWAPeEMW_1zYH3aPVNpALXEGEUwDjeVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddukeeggecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpehrrghfrggvlhessggvihhmshdrmhgvnecuggftrfgrthhtvghrnhepge
 egvdegjeeugeektdfgkeeikeeghfffvddvvddujeejlefffeegfeekleejteelnecuvehl
 uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhgrfhgrvghlse
 gsvghimhhsrdhmvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdp
 rhgtphhtthhopegrughrihgvnhdrghhrrghsshgvihhnsehgmhgrihhlrdgtohhmpdhrtg
 hpthhtoheprghnughriigvjhdrhhgrjhgurgesihhnthgvlhdrtghomhdprhgtphhtthho
 pehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprh
 hfohhssheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgt
 hhgrrhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehjohhnrghsse
 hkfihisghoohdrshgvpdhrtghpthhtohepjhgvrhhnvghjrdhskhhrrggsvggtsehgmhgr
 ihhlrdgtohhmpdhrtghpthhtohepmhgrrghrthgvnhdrlhgrnhhkhhhorhhstheslhhinh
 hugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdr
 ohhrgh
X-ME-Proxy: <xmx:IxihZ05LqxCzva6w6KLIMF5jc5IZStymJD_ONMAhyFCD8TpQoHz2_Q>
 <xmx:IxihZ47owkrgZGugLvfXCZPUBvk5lS3ZSmyDx6dQHLSzLtEZPQdMQg>
 <xmx:IxihZ8g0u_k364KwqJ_TCWbhtspTximMJqM8EZ3ufKolhWjEeCrTSw>
 <xmx:IxihZ666HhGP3ZDQOLzfa6EasVkwDtqjyJLKqyiBcZvfzXJKMe16dQ>
 <xmx:IxihZ-6a6OkKfckI0N_RGXNOIENlDYRmLcl1zPg7v8t7hKt76RjF67pi>
Feedback-ID: idc214666:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Feb 2025 14:25:18 -0500 (EST)
From: rafael@beims.me
To: Adrien Grassein <adrien.grassein@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Joao Paulo Goncalves <joao.goncalves@toradex.com>
Cc: Rafael Beims <rafael.beims@toradex.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: display: bridge: lt8912b: Add I2S audio
 input port
Date: Mon,  3 Feb 2025 16:23:55 -0300
Message-ID: <20250203192401.244651-2-rafael@beims.me>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250203192401.244651-1-rafael@beims.me>
References: <20250203192401.244651-1-rafael@beims.me>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 04 Feb 2025 08:48:22 +0000
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

From: Rafael Beims <rafael.beims@toradex.com>

Add the I2S audio input port for audio over HDMI support.

Signed-off-by: Rafael Beims <rafael.beims@toradex.com>
---
 .../bindings/display/bridge/lontium,lt8912b.yaml          | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
index 2cef25215798..ce555f52beb8 100644
--- a/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt8912b.yaml
@@ -51,6 +51,11 @@ properties:
           HDMI port, should be connected to a node compatible with the
           hdmi-connector binding.
 
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description:
+          I2S Audio input port
+
     required:
       - port@0
       - port@1
@@ -76,6 +81,9 @@ properties:
   vdd-supply:
     description: A 1.8V supply that powers the digital part.
 
+  "#sound-dai-cells":
+    const: 0
+
 required:
   - compatible
   - reg
-- 
2.47.2

