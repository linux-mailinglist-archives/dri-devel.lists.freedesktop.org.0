Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF0E49E3D7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 14:51:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B529110EA8C;
	Thu, 27 Jan 2022 13:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90A7110EA8C
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 13:51:20 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id F09DD5C00D1;
 Thu, 27 Jan 2022 08:51:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 27 Jan 2022 08:51:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :message-id:mime-version:reply-to:sender:subject:subject:to:to;
 s=fm2; bh=OQqsJi5rhZ40tXNJ9/wsM2scjBO73ZEdJ4VGQ0XLI7w=; b=rgJy2
 vGJwsoqZxk6stSwFyBWkI6gG9zQR8RYv3mTdeg9FaDcsKLjkF/tpGflY7UpwQxwq
 JUrcx2bCYaqoDpEP1BvLEq+HncqXMibmwWdYPPsDdmsBKwpaljFbdBL5Rpek4sje
 zhgffDFEr4bHXu1FliJycq+34WUKQLxWtDpnKXqtzFoF4QJeLRRc0YmaypwhN6s7
 Vt+sby+2OtBErzIAlcflKtv1LUQn04YNwOCyfYvibFwd8cHvfn1bQPGNZvN/ibai
 QIaX8WzjYzXDP0EmqjvEn7CvSjAp3CdwvEfjVXD4ZnQsWyUy+M6K8fz/ncWFsNiP
 O8P18RroFRGVCdhmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:sender
 :subject:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=OQqsJi5rhZ40tXNJ9/wsM2scjBO73
 ZEdJ4VGQ0XLI7w=; b=SpNGPgWIs5bRGNzToKGU00DDgqB5Z0qsU8zjSOhBeDtOx
 OKTglpYoQty10cR91zyC8sF0AycFMm6+h9BV+z2Im3eZ6m07rDLNw/PGWxiUadTE
 TjTwaf5uiTHICJy5Apc2viB4B1LEHXkL4mbVxmW8Bc6YhLJXyLmqbzlYy9q3HZrj
 PCdMmgFPxtTtsEIQ6yBI5b3zfzn11SFNnmJaHGvyQfXN/YKVSNIB9Z27PX3x7KFH
 EEm7Jxo/5RLQ330yiIFrrL4b0IPP/qZQO3Var9bAhegTTfOgwEtgvjwUXWgo3QRr
 mxXC/bDUyYYYVGl8v8ckXrEWd5gcg0UWc1Eg60aJw==
X-ME-Sender: <xms:V6PyYZ_XgzA7lbjp0olno3K3pJSzuDdqHAjJRYe4n10M1TluxNGmcA>
 <xme:V6PyYdvEZQwSwfVj8RxnlkH4Iv8YtxsSIoH2fQkd3slSFtqAdUFNx_0Oqm-qUEoxA
 Z5ZJwHfuJldB7aCQYE>
X-ME-Received: <xmr:V6PyYXDrdRGT_Vsmk-bw0qwIzFapHX96yPxKoLe4THDjOWdBElOBMlEVirspYKmePjhcDyisZ905pSWwsip9jzSYJDQByZBVkDedDNo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrfeefgdehkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigih
 hmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:V6PyYddK39Dmmcp3RgyRYNa_FQHawoUTYcBecc48QUn2zBWotABD6Q>
 <xmx:V6PyYePLxzg5oZNIcEv0hmjIqcIVOCk5JaD1ts3wGZJczPNEIrOMng>
 <xmx:V6PyYfldav6OWBKsIhbf3bhOeTvctnNimLciju2cB66soMFxEu29yA>
 <xmx:V6PyYfiPNkHz58vt0wKhCEZy30xUTSDk9wyS1ahJB985nYpNjuE9EA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 27 Jan 2022 08:51:19 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH] drm/vc4: hdmi: Allow DBLCLK modes even if horz timing is odd.
Date: Thu, 27 Jan 2022 14:51:16 +0100
Message-Id: <20220127135116.298278-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.34.1
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
Cc: Tim Gover <tim.gover@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The 2711 pixel valve can't produce odd horizontal timings, and
checks were added to vc4_hdmi_encoder_atomic_check and
vc4_hdmi_encoder_mode_valid to filter out/block selection of
such modes.

Modes with DRM_MODE_FLAG_DBLCLK double all the horizontal timing
values before programming them into the PV. The PV values,
therefore, can not be odd, and so the modes can be supported.

Amend the filtering appropriately.

Fixes: 57fb32e632be ("drm/vc4: hdmi: Block odd horizontal timings")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 0ee446df50a0..92b1530aa17b 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1269,6 +1269,7 @@ static int vc4_hdmi_encoder_atomic_check(struct drm_encoder *encoder,
 	unsigned long long tmds_rate;
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
+	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
 	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return -EINVAL;
@@ -1316,6 +1317,7 @@ vc4_hdmi_encoder_mode_valid(struct drm_encoder *encoder,
 	struct vc4_hdmi *vc4_hdmi = encoder_to_vc4_hdmi(encoder);
 
 	if (vc4_hdmi->variant->unsupported_odd_h_timings &&
+	    !(mode->flags & DRM_MODE_FLAG_DBLCLK) &&
 	    ((mode->hdisplay % 2) || (mode->hsync_start % 2) ||
 	     (mode->hsync_end % 2) || (mode->htotal % 2)))
 		return MODE_H_ILLEGAL;
-- 
2.34.1

