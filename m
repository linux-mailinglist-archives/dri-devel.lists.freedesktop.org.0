Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2F44675B5
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 11:54:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9820A7338D;
	Fri,  3 Dec 2021 10:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80D017338E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 10:54:46 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailnew.nyi.internal (Postfix) with ESMTP id D9D6058019A;
 Fri,  3 Dec 2021 05:54:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Fri, 03 Dec 2021 05:54:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=t50ddVEhLE5r2
 v0NOsgHoz9/ZdcQ3nJCvid/C9Swdbc=; b=TTWF6f461H6mIg/p67oHIm79wJqFP
 huOVkrAGOISMtl6SC7ybXM3krKyctcNLaqKnWpiW6EAxgfD57d37ysSGgf8c1E90
 WVtmWHhQLy2sZ+h6LPmz87KaHT/6Vs2zVJSTO7XlXovAmhSkn2bSm7kYpfMv4cuM
 GmZi5prJJ8mU5r6KvVwREwqzW4SsKpzlzQbs3WKJ6o3H38ERR5Z4VP+wG2n6QBe6
 gwaC5Yq9rgZd0YG9Q4vh969Q+PhoXuVeqJ6XhAnzhs1oHCzJwBnGQBCvKIVxbg+y
 xbBR/3rdPP7zFnFxYHkmPNW2qCb6pvotbOZ8hJKz1w3ODh0b0G0gVKYgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; bh=t50ddVEhLE5r2v0NOsgHoz9/ZdcQ3nJCvid/C9Swdbc=; b=Ca9ZTzG4
 /iC/dXx4W7t8hfB9gvMQgwcPamd666HuuNyGOQ2MDnWXrnsV83YcS1NX0Objq06e
 GnXvTrqqchJOUbJ5l3EIYRU+bG4AUCtbnJpZlxvu0CJmAMOhMxleAHFEQsjdxTLZ
 iE+0rnpLIhxl/VcKjFBtuqHG4Yz5AhSOkgo3vb/PqkUxe4xKC3BSMKRB4uuqBp3P
 OydDFnRecrI+AkpA4WEo7XnyqMQ1mPAGCaOh95vYKSGfoZEq3CG1K5Qxw1LtaFqI
 M4rc0gPJgbPTQ/dyu4lPxpr+UTX9fj/Ptp0ZodKY9Y76Q8scwlHA4O5VtF4FQvYN
 tS86Kby/m32k8Q==
X-ME-Sender: <xms:dfepYSHxBDj0zXMgs8gOHacJDtt-17LcR777xVMeAKpLhYJiaMNyoA>
 <xme:dfepYTVtIHvAdaRytMVqc-5R1vkLkp-cen-TWxh47MlYiUOb69QZm9qv6bWKVN5ji
 xLAHA-hTbxdZJvmmZQ>
X-ME-Received: <xmr:dfepYcJ1KClen7eNzkWFVUmau596dUhIuSKeL1E5y2CJFekq5kqNR67RpTBKOCVPP39exu_Kx9HBwiPdplTHP2bsLvcC5HTDvUjzSRkmwxQrdQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrieejgddvfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dfepYcHbwe87stsB_6ASACTzZYD5yB89QGCZaw30V66elgvjG8AyEQ>
 <xmx:dfepYYW7KXH-v73F9xulKXD_kK2vXlkO63bD1zi2g_ABfrh7lKc43g>
 <xmx:dfepYfPxwGJMXC07swZoXeXJhkGIWXPKr3LvswHbOp_I0MIRUPcX_Q>
 <xmx:dfepYcRueXTcFp-7bBGAxuRvhl2TY1tbis5Ug5e5r213LPlZMegQbw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Dec 2021 05:54:45 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 11/11] drm/vc4: hdmi: Force YUV422 if the rate is too high
Date: Fri,  3 Dec 2021 11:54:20 +0100
Message-Id: <20211203105420.573494-12-maxime@cerno.tech>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211203105420.573494-1-maxime@cerno.tech>
References: <20211203105420.573494-1-maxime@cerno.tech>
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When using the modes that need the highest pixel rate we support (such
as 4k at 60Hz), using a 10 or 12 bpc output will put us over the limit
of what we can achieve.

In such a case, let's force our output to be YUV422 so that we can go
back down under the required clock rate.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 04eb1ab9dad3..5b8b2688a3f4 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1411,8 +1411,15 @@ vc4_hdmi_encoder_compute_config(struct vc4_hdmi *vc4_hdmi,
 					     vc4_state, mode,
 					     conn_state->max_bpc,
 					     format);
-	if (ret)
-		return ret;
+	if (ret) {
+		format = VC4_HDMI_OUTPUT_YUV422;
+		ret = vc4_hdmi_encoder_compute_clock(vc4_hdmi,
+						     vc4_state, mode,
+						     conn_state->max_bpc,
+						     format);
+		if (ret)
+			return ret;
+	}
 
 	vc4_state->output_format = format;
 	return ret;
-- 
2.33.1

