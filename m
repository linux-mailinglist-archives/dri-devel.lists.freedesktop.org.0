Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D333605A32
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 10:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC16610E4F1;
	Thu, 20 Oct 2022 08:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03A210E498
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 08:50:55 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 6FA2A3200583;
 Thu, 20 Oct 2022 04:50:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 20 Oct 2022 04:50:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666255853; x=
 1666342253; bh=w9fLnwph45TF4TFvLOs558TwHHV6wwwwUgEx8H1VCC8=; b=M
 pjF6/f3TeD8o2nODqxzZRhrXDnT98v2FhlCtNWJUwyA+M6IOme8yKZ+eeqKDENJZ
 ogGiCtVAWf4E5NoyIJk/3zC3A+PoZicr63s6GGd38VUJQrlxzvnpeIhcNNzXW7vt
 PMeuwUJcaOre+b3MhCl4cJs6w5X5S+6+fcbr+D34gU4w13fNGwB+DQhwIWrGYcfP
 ttq4huy5c/FDaEKypkbETS1Jws2B5EDi6aSVfGBvWcGVIjupT0+ELX92EAn8pomS
 Jf8mfBq1P+Xn5LxjRh/N70rCBcn/+eGiBZO0oZ/51zR6XtmNjI0S18oeqeWB3RO6
 q0Iwtm3h23iyIb4N50dgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666255853; x=
 1666342253; bh=w9fLnwph45TF4TFvLOs558TwHHV6wwwwUgEx8H1VCC8=; b=S
 s19u63NKZrJJKcEAJCnMbZxjt4UWfQS2PARGNTwHmtuDasfXLO0okYGw7Pv51Edv
 juvbn9U6nAf5jSGmgMUfLUixdwl+LWJOWOUb8G9Dnw/tiTRx2zyf2bJspQPb0EY9
 USRWlZZ8lNQuEZwYBKKaN0vgHfUKUGOS81riFR4w4+uE0XLf7B+eFTMd66pN0yKv
 w+Dvh6Qbxfb3/TjqAkxYzIxyrTQDWwtOdr7YafKdJCma9rg+Gcm3g+CK3c62wAQY
 mybMESLuhAKRr5a1GPs6QBFcDB5TkX5Kf+Qeco8LTgtDGJ67W0h2GV7/SRNnqzg8
 1NdD2ID5nKB4EPmEO16fQ==
X-ME-Sender: <xms:7AtRY52qrz15uODR2X8PU82FPaIYWYrtOHjotb5_o_KgoM7uliIwmw>
 <xme:7AtRYwHPxs3WRAMNcxKda1Dpjy60_gvokS4JWQgupP7nf_8X44evzXMW367K_7g6A
 hcyMkARCxuA7QN1Xe0>
X-ME-Received: <xmr:7AtRY55h7eUflDrrfHpXUJZQNWz3Z14fKD5rMEc-yvazDWQ7zWcL9VfkDzUg112l7JylOckVjmM4-wYp9maKEQnE8aNlzG1ew8lN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:7AtRY23wUXLqXcV32GE2ARf0S9YRPV8jLW4LCdJXw3CnAPpb2hB24w>
 <xmx:7AtRY8EQpbHlU7ItlJXHVTZxyjZEbf_7J_HLRPc3jljKBdurGXwNjg>
 <xmx:7AtRY38kKEEUy08Xt6_Y-fbi8ubTVMJi-PuQ-2PQk-BcLukhrvGA0A>
 <xmx:7QtRY8Vqa7uhoLZhSurFWC7brcely2HEVQXDQz2P3QYYvYLFnbqNPA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 04:50:52 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 20 Oct 2022 10:30:45 +0200
Subject: [PATCH v2 1/7] media: uapi: add MEDIA_BUS_FMT_RGB565_1X24_CPADHI
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221013-rpi-dpi-improvements-v2-1-7691903fb9c8@cerno.tech>
References: <20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech>
In-Reply-To: <20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2439; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=W7JgRSJCAGYWl+FNKphNaQremlGGiWyzZAhBKVcV0Jk=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmB7Ba93xoXzudPsFxdsuhN/zau5ZZO8esmrfi7Nr71SLDi
 8YRnHaUsDGJcDLJiiiwxwuZL4k7Net3JxjcPZg4rE8gQBi5OAZgIzwpGhvON39YayAU/9jq8ap/Bpc
 ups35Pu/Fy7knfu7b7dr5tCHRjZDjlqZli/XvXK59dHtr+5vemTJpqvJmrJjHk/gd3h947s7gB
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Joerg Quinten <aBUGSworstnightmare@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Morgan <macromorgan@hotmail.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Add the MEDIA_BUS_FMT_RGB565_1X24_CPADHI format used by the Geekworm
MZP280 panel for the Raspberry Pi.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../userspace-api/media/v4l/subdev-formats.rst     | 37 ++++++++++++++++++++++
 include/uapi/linux/media-bus-format.h              |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index d21d532eee15..1e61c02aa788 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -986,6 +986,43 @@ The following tables list existing packed RGB formats.
       - g\ :sub:`2`
       - g\ :sub:`1`
       - g\ :sub:`0`
+    * .. _MEDIA-BUS-FMT-RGB565-1X24_CPADHI:
+
+      - MEDIA_BUS_FMT_RGB565_1X24_CPADHI
+      - 0x1022
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - 0
+      - 0
+      - 0
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
+      - 0
+      - 0
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - 0
+      - 0
+      - 0
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
     * .. _MEDIA-BUS-FMT-RGB666-1X24_CPADHI:
 
       - MEDIA_BUS_FMT_RGB666_1X24_CPADHI
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index ec3323dbb927..b0a945eb7040 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,13 +34,14 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x1022 */
+/* RGB - next is	0x1023 */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE	0x1003
 #define MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE	0x1004
 #define MEDIA_BUS_FMT_RGB565_1X16		0x1017
+#define MEDIA_BUS_FMT_RGB565_1X24_CPADHI	0x1022
 #define MEDIA_BUS_FMT_BGR565_2X8_BE		0x1005
 #define MEDIA_BUS_FMT_BGR565_2X8_LE		0x1006
 #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007

-- 
b4 0.10.1
