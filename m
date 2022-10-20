Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65209605A2F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 10:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2D3C10E4E0;
	Thu, 20 Oct 2022 08:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A8C10E4F3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 08:51:00 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 8DFB7320091A;
 Thu, 20 Oct 2022 04:50:57 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 20 Oct 2022 04:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1666255857; x=
 1666342257; bh=6BmxZWAyjtGIjNyaQNkRjZBqzpz5NoPfZAD21+NUfLw=; b=M
 D89TI7Ups78H9gI7Mv+rcE1wiLyWwo9n0oTn7mS7pyanBRF17tZiVvVqnUHRnEVY
 SpePLxMuH2X9HNccggAWQvkGfv5LTaSwyMe7zw+W11abhxj8L7wNBfcdGKxiTMZ6
 /96oYhTzV4moq1srWhDrey4jl6BMD3rDm0HspRtWAGZRffsFfWSGHUDl/G1RQzrN
 sCblUhydwlvK7MiZ6BaaVWOocTXpm4n/3NBzGZ71LervA/tyyslVJq6bv0CZI4Ye
 19ktdZbaWL4glE0dmNohA7GvVIS0Ut9xyA+3LmVfa35IEgc6v7Nl/xH+V63BQMc0
 vVh0PRWNAPnlAGzjjHWIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666255857; x=
 1666342257; bh=6BmxZWAyjtGIjNyaQNkRjZBqzpz5NoPfZAD21+NUfLw=; b=O
 fhjH82+kiE0rqZzxg6qRwhz8U7hpIn3nz5FPpjwl9dqdSxBlIGN9WiM7rf1K1TWw
 Kk3wlYKeAR4V4C/ZyeqqqcW3jDPui0kixy0GXz+6ZPHqAjekgH1T7fL6MfpYe92E
 jzQIK6aAEBo8w0swutlkzonYRaBSEcDg5S/QFBue6OwDzGbZJdbxZVV6Gd9NhnV1
 FqJnZLbvc96+Db7UvXWOJnpBxLcd8v/XYCoWTbDkkLQaDXgJZENfixgZfcgcnJlv
 nx4jUudTrxPLse5rHoVgj/FyF63jYN+kGuYMeDiuvGaJT31FJguCATYhyf6Q4sWJ
 PZ2LTMEeSDZSWcBNLm+eg==
X-ME-Sender: <xms:8QtRY7mh1pNMi307NJjfH8SAl_11g0e8kZUAKEvDEFH1UKN9XAD0bA>
 <xme:8QtRY-0tMZTGLOMR9tXUJjk7IY8a5r6UMuIzaEspWV7BaDeNrhvp1GTi67tI-BfHI
 Dpkaht2GFsCITJZwQ8>
X-ME-Received: <xmr:8QtRYxrUDxyrqxFlFSouoh6jSIVqM2Zwe9mu1uioNYHK-iz2mcDgpp01FA5G_eCZYF8w9b53crP6DGSNYRn5TtOw1yrLvRaBREu0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgtdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:8QtRYzkXKIQsg2sL-7MPi9IWBRNaUCQZ8F1rzj8yoS1_38i8W_swrg>
 <xmx:8QtRY53dvlyX4gxNvelLlQwEcjrr9expd0MHKIka-YBxbhmkC-v-Ow>
 <xmx:8QtRYysGAuw4QUt6TY9y52Svbj5CrqD1xytXxuRc-6EppdJBEPDKWQ>
 <xmx:8QtRY0HLhIj2kONg8C6M-JnMvC_g_XW3bns2qsUs9zNQ5xjY0SbXTA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 04:50:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 20 Oct 2022 10:30:46 +0200
Subject: [PATCH v2 2/7] media: uapi: add MEDIA_BUS_FMT_BGR666_1X18
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221013-rpi-dpi-improvements-v2-2-7691903fb9c8@cerno.tech>
References: <20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech>
In-Reply-To: <20221013-rpi-dpi-improvements-v2-0-7691903fb9c8@cerno.tech>
To: Emma Anholt <emma@anholt.net>, Maxime Ripard <mripard@kernel.org>,
 Rob Herring <robh@kernel.org>, 
 Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
 David Airlie <airlied@linux.ie>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2403; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=szjBqRq1RvNKILPE+9E7yhnpqEgZLZ5Nn5mxleAdPwg=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmB7BaflXmDGda4h/+r2b1Yvd1e8KfIDgW3p882zVjs/7K8
 nG1xRykLgxgXg6yYIkuMsPmSuFOzXney8c2DmcPKBDKEgYtTACZiHMTw301Rfe/SZ2dbO43erlH0Pt
 KROEv/eXYh+/OTbUJbvm1SPcjIsPv3zgtrtPk2xP6z6bKtarBW4hKbcuvTtIt9YSb6WgePcgEA
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

From: Joerg Quinten <aBUGSworstnightmare@gmail.com>

Add the BGR666 format MEDIA_BUS_FMT_BGR666_1X18 supported by the
RaspberryPi.

Signed-off-by: Joerg Quinten <aBUGSworstnightmare@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../userspace-api/media/v4l/subdev-formats.rst     | 37 ++++++++++++++++++++++
 include/uapi/linux/media-bus-format.h              |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index 1e61c02aa788..68f8d7d37984 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -912,6 +912,43 @@ The following tables list existing packed RGB formats.
       - g\ :sub:`5`
       - g\ :sub:`4`
       - g\ :sub:`3`
+    * .. _MEDIA-BUS-FMT-BGR666-1X18:
+
+      - MEDIA_BUS_FMT_BGR666_1X18
+      - 0x1023
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      - b\ :sub:`5`
+      - b\ :sub:`4`
+      - b\ :sub:`3`
+      - b\ :sub:`2`
+      - b\ :sub:`1`
+      - b\ :sub:`0`
+      - g\ :sub:`5`
+      - g\ :sub:`4`
+      - g\ :sub:`3`
+      - g\ :sub:`2`
+      - g\ :sub:`1`
+      - g\ :sub:`0`
+      - r\ :sub:`5`
+      - r\ :sub:`4`
+      - r\ :sub:`3`
+      - r\ :sub:`2`
+      - r\ :sub:`1`
+      - r\ :sub:`0`
     * .. _MEDIA-BUS-FMT-RGB666-1X18:
 
       - MEDIA_BUS_FMT_RGB666_1X18
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index b0a945eb7040..2ee0b38c0a71 100644
--- a/include/uapi/linux/media-bus-format.h
+++ b/include/uapi/linux/media-bus-format.h
@@ -34,7 +34,7 @@
 
 #define MEDIA_BUS_FMT_FIXED			0x0001
 
-/* RGB - next is	0x1023 */
+/* RGB - next is	0x1024 */
 #define MEDIA_BUS_FMT_RGB444_1X12		0x1016
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE	0x1001
 #define MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE	0x1002
@@ -46,6 +46,7 @@
 #define MEDIA_BUS_FMT_BGR565_2X8_LE		0x1006
 #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007
 #define MEDIA_BUS_FMT_RGB565_2X8_LE		0x1008
+#define MEDIA_BUS_FMT_BGR666_1X18		0x1023
 #define MEDIA_BUS_FMT_RGB666_1X18		0x1009
 #define MEDIA_BUS_FMT_RBG888_1X24		0x100e
 #define MEDIA_BUS_FMT_RGB666_1X24_CPADHI	0x1015

-- 
b4 0.10.1
