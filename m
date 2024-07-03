Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF129258D4
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 12:37:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F233910E133;
	Wed,  3 Jul 2024 10:37:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=testtoast.com header.i=@testtoast.com header.b="7r9QpDxd";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="kxuxrqFD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BE610E133
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 10:37:25 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.nyi.internal (Postfix) with ESMTP id 0C63713805FD;
 Wed,  3 Jul 2024 06:37:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 03 Jul 2024 06:37:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
 h=cc:cc:content-transfer-encoding:content-type:date:date:from
 :from:in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to; s=fm2; t=1720003045; x=
 1720089445; bh=Dm+SaVDrUda5WbcCerWZSXrYK7brLZGJK02EEf65S3Y=; b=7
 r9QpDxdbkQ2JD1Ynuy2lE4fRkXukt1lp7QPpjP6giCtYM3VUeRIdEAcyM+eIXefk
 6sciIB3B6D+TEuTdqN9JK4aOcLSyrtCg7aI1gdz+aHq6drQ/JvraaqKwTF190lA4
 wN5Vg8Ic9hdUHY2qSTrvPKF46mKg02b4HCE5K8LHTSCyfOvH5ErDmg+HC3IeGGKU
 XYcozESxGtkkLH1DtAXUtzO9LsW7GObOPsXzK7QAzlQent9llDsaCOe1wAo8ZrUZ
 bOhRMd471St7Geee7IqshdeR1G7p7DG3ey2nLZo9kSKy/Zjq8XoED3gRzjpl3irc
 Y0bNNSYaSo+Vxvnrc1oqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720003045; x=
 1720089445; bh=Dm+SaVDrUda5WbcCerWZSXrYK7brLZGJK02EEf65S3Y=; b=k
 xuxrqFDbZZER7E+fdxbGgk2QaBjJwl5IGxrcXNm/YjfSJBo+ShmNfyvqD/ZToF7T
 VuRhvF7IB69Psfj08EYepSNM++DiBlbUhnLctLv45aJvhKsl1r0wAU8ex0XOHNfG
 JtjNrFMcCbFyvoNCHdpBJEROeYoQswexIakuWuyFX1OhSWClOPjLNquFG8XEa4Ii
 Krar3W+ekAxCeY6C5Gc4u7oXhnG/1wpk002Puf6oeWcnLOTnw2Yjb/WQdFnl2wEK
 NDQlUvSrltYEeME83jyfovnXnM7B+E2nZUb+dlZfzgEIaYy8HTqXL/zoFvTxjotr
 x+HWEY6J5VkG0bDjB0rwA==
X-ME-Sender: <xms:5CmFZk2Z12OUemDRNYpxOAIBpozuJp9ztpTgdgKl17qfsifFc5LqEQ>
 <xme:5CmFZvGPeZcCcU01uoZo6nhT1MqpdghI_NbWCgbEMhQNMlHJcKXeJygRz-5kJnyV_
 QgMcnIsV6shDnEXXg>
X-ME-Received: <xmr:5CmFZs4noV1oaP1fCGmuCLzB0SXiyB_OEMmEDLcaiLEgpx20h_59V1fCFMdHh1-9nd-9rev9ekXhXrWRw0sRmpMh6au2l0an7p9P9KX_W3S8ZI4x>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejgdeftdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefthigrnhcu
 hggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsthdrtghomheqnecuggftrfgrth
 htvghrnhepueeitdegledtvdekiefgteehleekleeggeeigeeggfduffejuddtkefhjeek
 leffnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpuggvvhhitggvthhrvggvrdhorh
 hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprhih
 rghnsehtvghsthhtohgrshhtrdgtohhm
X-ME-Proxy: <xmx:5CmFZt1yLEJ5vXiONbHHVy91aJoeDW5Xae2amyAErOyksivZh36NXA>
 <xmx:5CmFZnE6H-I3GLPjM7ihf2J1OhXA8qdd3eWvcz6SRqEzCVsN3D7eew>
 <xmx:5CmFZm8E4LT1-Yx7z__Hz5y5MsPO8haQTD5cIQdiyeDgiTo-Mowjcg>
 <xmx:5CmFZskuTxLNbPRlIWMT4A8VcIbgg7m5lPLN3IuH62fJs37K1Vcsbg>
 <xmx:5SmFZtXuT9nDP3Yacqz3-xYqdiA3rjIlqlY1hmD_rd-bgaR1bZ4dLw_h>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jul 2024 06:37:20 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Hironori KIKUCHI <kikuchan98@gmail.com>,
 Chris Morgan <macroalpha82@gmail.com>, Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 1/3] dt-bindings: display: panel: Rename WL-355608-A8 panel
Date: Wed,  3 Jul 2024 22:31:44 +1200
Message-ID: <20240703103710.31169-2-ryan@testtoast.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703103710.31169-1-ryan@testtoast.com>
References: <20240703103710.31169-1-ryan@testtoast.com>
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

The WL-355608-A8 is a 3.5" 640x480@60Hz RGB LCD display from an unknown
OEM used in a number of handheld gaming devices made by Anbernic.
Previously committed using the OEM serial without a vendor prefix,
however following subsequent discussion the preference is to use the
integrating device vendor and name where the OEM is unknown.

Alter the filename and compatible string to reflect the convention.

Fixes: f08aac40639c ("drm: panel: nv3052c: Add WL-355608-A8 panel")
Signed-off-by: Ryan Walklin <ryan@testtoast.com>

--
Changelog v1..v2:
- Use known panel serial for compatible name rather than referencing
  integrating devices as per feedback [1] from DT maintainers.

 [1] https://lore.kernel.org/linux-devicetree/8b4519fc-0fba-48fe-bfb4-318818b47a65@app.fastmail.com/#t
---
 .../{wl-355608-a8.yaml => anbernic,wl-355608-a8.yaml}     | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename Documentation/devicetree/bindings/display/panel/{wl-355608-a8.yaml => anbernic,wl-355608-a8.yaml} (82%)

diff --git a/Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml b/Documentation/devicetree/bindings/display/panel/anbernic,wl-355608-a8.yaml
similarity index 82%
rename from Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml
rename to Documentation/devicetree/bindings/display/panel/anbernic,wl-355608-a8.yaml
index 397c26be9bda5..dde3600f0189c 100644
--- a/Documentation/devicetree/bindings/display/panel/wl-355608-a8.yaml
+++ b/Documentation/devicetree/bindings/display/panel/anbernic,wl-355608-a8.yaml
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/panel/wl-355608-a8.yaml#
+$id: http://devicetree.org/schemas/display/panel/anbernic,wl-355608-a8.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: WL-355608-A8 3.5" (640x480 pixels) 24-bit IPS LCD panel
+title: Anbernic WL-355608-A8 3.5" 640x480 24-bit IPS LCD panel
 
 maintainers:
   - Ryan Walklin <ryan@testtoast.com>
@@ -15,7 +15,7 @@ allOf:
 
 properties:
   compatible:
-    const: wl-355608-a8
+    const: anbernic,wl-355608-a8
 
   reg:
     maxItems: 1
@@ -41,7 +41,7 @@ examples:
         #size-cells = <0>;
 
         panel@0 {
-            compatible = "wl-355608-a8";
+            compatible = "anbernic,wl-355608-a8";
             reg = <0>;
 
             spi-3wire;
-- 
2.45.2

