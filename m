Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4599421532B
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jul 2020 09:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6786E342;
	Mon,  6 Jul 2020 07:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25616E29D
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jul 2020 13:57:21 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 4D9BB5C00C2;
 Fri,  3 Jul 2020 09:57:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Fri, 03 Jul 2020 09:57:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=LQGABx/8V72trxiNmGxwQSgFhJ
 r1TVDqVnqGy4cDU7E=; b=DBkJPBrxx9T/YWeHh0No9VnjZQzFg+gPOFi7hC2Wmo
 ++uuBG2x9SkxvNrVx9MmpqeIebSXR0uRgr+9ZNmZdFc8ea+tHXcO+wCAYKK4lc5Y
 l2z1B4k8Un+bVUkwy05sM5yqP7TFKhHjsEUaTny10wAnY6vp1mdd65dL09uBHLAd
 +4MsvflAzXA1PrVD8+gBh3+25mNLA5XRbUrufo1weDWEuOTZ6Q/WCU9kFObDFFOL
 HS4FsGgwu64kpKcPT7+vdZsIXNQM3/SF1a8W4CG/DZLpUOP7MQY/UA0hydTsBKfA
 w5jHSElGq0hgAd3sfJC8EoWhpCtYoNk6DqHToWDr5nFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=LQGABx/8V72trxiNm
 GxwQSgFhJr1TVDqVnqGy4cDU7E=; b=juoI4P4zqbPY+S7K14jhmG81lkebJofQz
 +0/FYtGbxTQZGMbwJqhNOX3pV24S+YXYYrIgT58066J+porZuAVGj+HQlw6XUT+J
 mUEKhPBCHRUdBP2LelU6CdjQ32ZUWUTH/oA9c41Xb+1k3RjV5DtxkO1XvkTx+gHm
 c9eeWrsjmgWcM+AruXh+8ldckJxdmDxncVb+T1y0Lt7LMnvkCNkwi29+hjXRNfOR
 flNrPWXw++/KBY9XKUY2sxaxV/650bhsCnuKEuoVJXIl6mfWBX7m0jLe2nQ+qwK+
 lxMI1ifeSToTX7b/W8bzGCzpydhICZpZHTcRboLfWcapH89BI0RqA==
X-ME-Sender: <xms:PTn_XsFoeq0P7TjkcElzlV9HiEc3QtSAI6NSAMOJXoxixIj7a-CYUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduiedrtdeigdejudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:PTn_XlUcHg8-ImU7H0tU1htlg8OfEaxHW2H2dxXERMvuq-4dI7Qniw>
 <xmx:PTn_XmLGAkm0FdSzwPOGvFT7QZE35lMYM-YFO7_P_x6-0oofHYPdkQ>
 <xmx:PTn_XuHvpbc7AXKyQZZX2GEyoN8Hr_jtUax55NfCeTSrIpPBuaZsOA>
 <xmx:Pzn_Xvi5igu62wI04VXxlLoXc6cKcwJm0ZL04iVt3gtuCOQ5Nwo4WQ>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A14CB3280059;
 Fri,  3 Jul 2020 09:57:17 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>
Subject: [PATCH] drm/vc4: Convert register accessors to FIELD_*
Date: Fri,  3 Jul 2020 15:57:13 +0200
Message-Id: <20200703135713.985810-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 Jul 2020 07:19:17 +0000
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
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VC4_SET_FIELD and VC4_GET_FIELD are reimplementing most of the logic
already defined in FIELD_SET and FIELD_GET. Let's convert the vc4 macros to
use the FIELD_* macros.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_regs.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index b5a6b4cdd332..324462cc9cd4 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -6,19 +6,18 @@
 #ifndef VC4_REGS_H
 #define VC4_REGS_H
 
+#include <linux/bitfield.h>
 #include <linux/bitops.h>
 
 #define VC4_MASK(high, low) ((u32)GENMASK(high, low))
 /* Using the GNU statement expression extension */
 #define VC4_SET_FIELD(value, field)					\
 	({								\
-		uint32_t fieldval = (value) << field##_SHIFT;		\
-		WARN_ON((fieldval & ~field##_MASK) != 0);		\
-		fieldval & field##_MASK;				\
+		WARN_ON(!FIELD_FIT(field##_MASK, value));		\
+		FIELD_PREP(field##_MASK, value);			\
 	 })
 
-#define VC4_GET_FIELD(word, field) (((word) & field##_MASK) >>		\
-				    field##_SHIFT)
+#define VC4_GET_FIELD(word, field) FIELD_GET(field##_MASK, word)
 
 #define V3D_IDENT0   0x00000
 # define V3D_EXPECTED_IDENT0 \
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
