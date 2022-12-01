Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A64F63EB69
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 09:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7518210E567;
	Thu,  1 Dec 2022 08:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D35E510E564
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 08:44:07 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 3A4195C0196;
 Thu,  1 Dec 2022 03:44:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 01 Dec 2022 03:44:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1669884247; x=
 1669970647; bh=hUh+dINDYfVicqmxW17xJxoMlwEEp1x/t2PLssyMhf4=; b=I
 xkqofr+mmdZwzgCkaYwXuK6Isijm5s2CnzIIIEUDvORgl6RLU9W26SzJF4ZvC/Kw
 LGxZACBbXzoQe4MBWkhUVeT7/EYhmymNFIZJbLhWjdkXTUeRVXhHSQmIopGDpFXD
 C/5BpGJFG6Wv+80pgofTboKZZZNDQ4jX5RFYATIqfJu8YPfTaCEYxAUSWhMvgaYn
 3lxP/USCzNM0IjAIYShJvxuCKsYIFVtO/8O8a+Pcy60cE2I419kDlZ26kzi/1fkl
 ZiZ3CngyTKijNZj10WFd07pRTBSkSwxORJnOEnQjgm2rEkffa9ipSI8xVI4bzcGA
 pPphbOIG4JvKdT+TWlzjw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1669884247; x=
 1669970647; bh=hUh+dINDYfVicqmxW17xJxoMlwEEp1x/t2PLssyMhf4=; b=l
 P2EJKtPaQG65xgYboOMWp5KwJFwYi3PhOpuirUVLlGIx+sqnggyaQr3Rt/0KBZms
 8MF4adEg3i1OIRsUecJD3zJpuynMLPJk+OrpDeDZDaTSD5FYL76AOC2lJTjHUvAA
 +3OLrK+3+OFhjR6JJSF2zm9ATgI7d+CEkBqQS4fX6c2SW2rAPnd3KX8+QkKksWly
 MuPX8wZAJIYbtp14XWp1Mr44w7dSWmGEgrOIA86aF4X5bqi/XD5+zCJHeq7EHNBZ
 XR/whIlEVzmm3D8C17lE834bZDdKyuIsruR10Dvhebm7VM8gWwGLjybscYs6j8tX
 JkhnBvnk5XGquWzM2Niog==
X-ME-Sender: <xms:VmmIY3RS1EzaB-5fz15Nfee-2Joku6bkHfqNru3sEk7RON0qJDUYxg>
 <xme:VmmIY4xvYVsH4OSpehP3t9xfq1ZWbnsxemucUPqwLceYkJOTF62d76TnD6bm5jW0H
 rcYYvcsHcuPK-Y0_lU>
X-ME-Received: <xmr:VmmIY82eJKdt2mVO9_QGxxM2JgCENLR5lJhwJXwbFyvHPFNWagBqFz2qWFpGGYwBW33IpxpQsrtF9g71Uv5eEzt_bAPhBb3_ngWzgGK_ipMcFA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrtdeggdduvdehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephfffufggtgfgkfhfjgfvvefosehtkeertdertdejnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepudduudfhveejteefgedvffdvvedvjedugedukeejhedtlefhffevtefh
 jeeltdevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:VmmIY3A3I4FPWzHGEB7xdEGLdewjgd5j4KqkOUtowWRuY25oYSO8wA>
 <xmx:VmmIYwj_UBe4hwptkVQoT9tbkya5uBBWkUsAb0kPsuG1OSPz3n_2Lg>
 <xmx:VmmIY7pi5D74ErCr1GqfeeqQfYWMpK0znjGAKZ_MlVxwqM7e3ZNmhg>
 <xmx:V2mIY72GlA8W7LT9AFlbSMJcO3ZDeCV0lXMHOVD36U375oCF1OVypw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 Dec 2022 03:44:06 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Thu, 01 Dec 2022 09:42:47 +0100
Subject: [PATCH v3 2/7] media: uapi: add MEDIA_BUS_FMT_BGR666_1X18
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20221013-rpi-dpi-improvements-v3-2-eb76e26a772d@cerno.tech>
References: <20221013-rpi-dpi-improvements-v3-0-eb76e26a772d@cerno.tech>
In-Reply-To: <20221013-rpi-dpi-improvements-v3-0-eb76e26a772d@cerno.tech>
To: Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 David Airlie <airlied@linux.ie>, Emma Anholt <emma@anholt.net>,
 Eric Anholt <eric@anholt.net>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2482; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=KvJtTTgxfbh2fypsRdg9v7CTxVjvVevaQRZzT6XDsXU=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMkdmWxTvCase+v0WWCl8NXCRz5Pdu7QahMpOldyftv0CqkZ
 u17HdpSyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAiV+IZGY4fT7U5ucqGw93pwOXb1i
 7vfVY9Dsqd6+NcPSFqascbixRGhhOqK/K2tXR8eG5b3dL6aY7Mh+z04CubA23Yy28VynjE8AMA
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Joerg Quinten <aBUGSworstnightmare@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chris Morgan <macromorgan@hotmail.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Joerg Quinten <aBUGSworstnightmare@gmail.com>

Add the BGR666 format MEDIA_BUS_FMT_BGR666_1X18 supported by the
RaspberryPi.

Signed-off-by: Joerg Quinten <aBUGSworstnightmare@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 .../userspace-api/media/v4l/subdev-formats.rst     | 37 ++++++++++++++++++++++
 include/uapi/linux/media-bus-format.h              |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index aa549c42e798..6605c056cc7c 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -949,6 +949,43 @@ The following tables list existing packed RGB formats.
       - b\ :sub:`2`
       - b\ :sub:`1`
       - b\ :sub:`0`
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
     * .. _MEDIA-BUS-FMT-RBG888-1X24:
 
       - MEDIA_BUS_FMT_RBG888_1X24
diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/media-bus-format.h
index 8e159e6b4d21..6ce56a984112 100644
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
 #define MEDIA_BUS_FMT_RGB565_2X8_BE		0x1007
 #define MEDIA_BUS_FMT_RGB565_2X8_LE		0x1008
 #define MEDIA_BUS_FMT_RGB666_1X18		0x1009
+#define MEDIA_BUS_FMT_BGR666_1X18		0x1023
 #define MEDIA_BUS_FMT_RBG888_1X24		0x100e
 #define MEDIA_BUS_FMT_RGB666_1X24_CPADHI	0x1015
 #define MEDIA_BUS_FMT_RGB565_1X24_CPADHI	0x1022

-- 
b4 0.10.1
