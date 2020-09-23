Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88FCB276A89
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 09:19:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709576EAB8;
	Thu, 24 Sep 2020 07:19:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9248F6E117
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Sep 2020 08:40:35 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F206C5C024B;
 Wed, 23 Sep 2020 04:40:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 23 Sep 2020 04:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding; s=fm3; bh=KiG29+cx4RKmN1lcyumz822CbC
 Dd70GdGTr7Brbk0gI=; b=FzKNyllATASbcobohcAkcm2kf10ZkAMUXc2cWdOKw2
 0aWKCjaybnl7xC1xnpPa8Rz5BWNASmFiTY7c+zD+USweLfTgU+0LZGSQqiVJMD60
 DNJgxpPXndRu7mnkIE+je9+OwU1K/5IeOhWfIm631PTbjejIvBvJ9lWb5is+o6gz
 PAF6UORmTEAYJebxbjlMqIhil8FuaBx3p6xpgWS74izXRQeSlm3BePwqxiPul8Qq
 sokANGtk5lOPRKacqxzA/CuDo/XExSq412U+cwGUHqaAPBDa2F8lD+BJ347L2ioX
 CmjdLa5kow7dAufcDrnNMH98qy++kfauvGu5QOtF6J/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :message-id:mime-version:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KiG29+cx4RKmN1lcy
 umz822CbCDd70GdGTr7Brbk0gI=; b=UVJNgGOeirWNRrfnkMR8a2no1P/13cHpN
 PkfuXDfSwRAPgjyyKyqCtNY2KV0QSaIfKOYI2MJZBbjkzrcTL7259ewrtJgNfcKt
 +U9IPeFI6Ch4qghRZVri3mU1JIDVnzWzpS2GjDxG0ihgpzZpcqTBwAXw8HWkkWZ4
 4cPkxDvB/tmjTHLL0EPyqOx0AMGHwZProZP7agbJcYR0M+yt0n0l/1mlQUI2rihP
 zPtiXZ32DqCY4lFXAIWU07obOOfuSI2oREu41hiN89D3S+pKvIi43ZItwww2GqZ2
 Wik8PnlNED1itAjD+zFybxERVMpEAleRKGiQsRakataIGVrf82p2w==
X-ME-Sender: <xms:AgprX6X_nmexaQ1DXJ-7w7R72ulBWOtZQTvwjyoMyCqO3qrU2mDTXA>
 <xme:AgprX2kzcwIuN1i8ESb-DOnqOf6iFC7tVXYWrnwgLu8wEZXUgocBa5-sCPH3wVWqm
 tn9eZwX44y7LWv_6LM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeigddtiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucft
 ihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtthgvrh
 hnpeejffehuddvvddvlefhgeelleffgfeijedvhefgieejtdeiueetjeetfeeukeejgeen
 ucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:AgprX-aRafVAz_QVHJsocXGOBTwLGPUz5vnI3vInsQfQCImdpL0k0A>
 <xmx:AgprXxUv848JtO6UI_dcu8k6YZLGCWneb8SF5aCdD84LywBE1GUI6w>
 <xmx:AgprX0mud6DvYQFmt6acGlSHeuUbTGic8Fwlf4qKwSJBTTYMegRdDw>
 <xmx:AgprXyaYj-8wN6YmIq5vOm-4ddAvggv_oNWtkhxWmPEEfTskxYGEYA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2EDC9328005D;
 Wed, 23 Sep 2020 04:40:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Eric Anholt <eric@anholt.net>
Subject: [PATCH v2 1/2] drm/vc4: crtc: Rework a bit the CRTC state code
Date: Wed, 23 Sep 2020 10:40:31 +0200
Message-Id: <20200923084032.218619-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 24 Sep 2020 07:19:09 +0000
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current CRTC state reset hook in vc4 allocates a vc4_crtc_state
structure as a drm_crtc_state, and relies on the fact that vc4_crtc_state
embeds drm_crtc_state as its first member, and therefore can be safely
casted.

However, this is pretty fragile especially since there's no check for this
in place, and we're going to need to access vc4_crtc_state member at reset
so this looks like a good occasion to make it more robust.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Tested-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

---

Changes from v1:
  - new patch
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index a393f93390a2..7ef20adedee5 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -852,11 +852,18 @@ void vc4_crtc_destroy_state(struct drm_crtc *crtc,
 
 void vc4_crtc_reset(struct drm_crtc *crtc)
 {
+	struct vc4_crtc_state *vc4_crtc_state;
+
 	if (crtc->state)
 		vc4_crtc_destroy_state(crtc, crtc->state);
-	crtc->state = kzalloc(sizeof(struct vc4_crtc_state), GFP_KERNEL);
-	if (crtc->state)
-		__drm_atomic_helper_crtc_reset(crtc, crtc->state);
+
+	vc4_crtc_state = kzalloc(sizeof(*vc4_crtc_state), GFP_KERNEL);
+	if (!vc4_crtc_state) {
+		crtc->state = NULL;
+		return;
+	}
+
+	__drm_atomic_helper_crtc_reset(crtc, &vc4_crtc_state->base);
 }
 
 static const struct drm_crtc_funcs vc4_crtc_funcs = {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
