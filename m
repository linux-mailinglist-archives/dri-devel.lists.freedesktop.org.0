Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11514EDBCC
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CFB10EF0F;
	Thu, 31 Mar 2022 14:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F36510EF39
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 14:37:57 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id EFAE65C0215;
 Thu, 31 Mar 2022 10:37:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 31 Mar 2022 10:37:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=c3MG28IkIDDaP+2FD0/HIcBYJMqGLk
 LuATBfhwe3ziM=; b=w7AmvI2maxjQJcmDdo1Db37N1lyvsQPKWz39TxbnkxGIrt
 7zVyoCjpqHpRWTTKT2JEatvKKoJMrUS4KKNmKa2ppZbEoMPK+ThwM+D8pwJwxZpQ
 Zwgr8UXTkZXdHRirZPgF92mI2wZHVL+99zYF+W8O1qTC8RWAoD5FExUQztH3eXRE
 9SuaIwdj3vUvnr286NomIgGSnMnucug3upgAIFTnSeshkm1v1oO44Pmwv+rckqao
 ffAxX0Bab44CyFkWMMaMAVrlBfT7oLFQh+1gcZM6ozfo1wvHrSexu3UVZ0yx6S4y
 J7xMR2ZgwbuGjZRoN7NECnt0LZPB9egF/0QS1CsQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=c3MG28
 IkIDDaP+2FD0/HIcBYJMqGLkLuATBfhwe3ziM=; b=iGUxsatmJaXVvQGTHuZBb9
 9pri3O7KDzO82lNZUeMTjp4xtjg3Fz1AX57k5tHy2fVFHyaQt4qjr8kROZyP7Vl5
 rKceyUeAfAQf5/lr2alAm8XzIoe3YPjY6lBeSKMGy4dsL97FHtP3T5KzyWWdQY2l
 9keE2zbKy3VbEbgnzjDG24Y3RvVOW6FrURNxEsfJc0TE2adADFnM9Ivkr+lDB9Au
 qGslzz5R+lsU8w0Zyx+bApaYHTEa+gEOPAnPnxx2TNQF+uMn/rLk4EoUr4CMiHQ/
 0hk+ASEFuJb7muoRdPHNfqVskc6FqX3LJoKgPykNNUayR22F9+TMtIKwjD7Es2IQ
 ==
X-ME-Sender: <xms:xLxFYtf9cORf09QtOd90FOgeiGIJ0NkXVhRIDMoIi93pMrrpZNYWsw>
 <xme:xLxFYrNaVYT-adKMHpvC7W7zNCooONg98JKoT2XsKSncZ-l_93O_XCXDgp_GeAfNL
 KgpqTu8otsaNO8fRTo>
X-ME-Received: <xmr:xLxFYmjIONYn6v7tWy2HQ6onrIB_lZ0hEyaIWt4I3zHGJyvLnY8KoGPQjwFmzxS6HQYAlr6uAkD30mpmyP1ByDsfMOdKdgIRcpn4svs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xLxFYm8w_m68mZRgQag6JXmMnJSAUrJudjbAae1HFG3JuaWz9xLABg>
 <xmx:xLxFYpsdVsYjDd8nFZCS7kA-UlB1NOnJfMUUtrcKk2QD4n4Vt8rRgg>
 <xmx:xLxFYlF5DgcykQbBA3eYDiCYRvfgFMLK3KN-j06_7uuvqIC30M6HVw>
 <xmx:xLxFYjJLdZJ9mBZMfKD2FmxQMBTso_wd_-lgjnVjKSgshPWmPzt2dQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 10:37:56 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/7] drm/vc4: hvs: Remove dlist setup duplication
Date: Thu, 31 Mar 2022 16:37:41 +0200
Message-Id: <20220331143744.777652-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331143744.777652-1-maxime@cerno.tech>
References: <20220331143744.777652-1-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Setting the DISPLISTx register needs to occur in every case, and we
don't need to protect the register using the event_lock, so we can just
move it after the if branches and simplify a bit the function.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hvs.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index d225eea6e640..71aa5081eaa3 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -402,15 +402,12 @@ static void vc4_hvs_update_dlist(struct drm_crtc *crtc)
 			crtc->state->event = NULL;
 		}
 
-		HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
-			  vc4_state->mm.start);
-
 		spin_unlock_irqrestore(&dev->event_lock, flags);
-	} else {
-		HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
-			  vc4_state->mm.start);
 	}
 
+	HVS_WRITE(SCALER_DISPLISTX(vc4_state->assigned_channel),
+		  vc4_state->mm.start);
+
 	spin_lock_irqsave(&vc4_crtc->irq_lock, flags);
 	vc4_crtc->current_dlist = vc4_state->mm.start;
 	spin_unlock_irqrestore(&vc4_crtc->irq_lock, flags);
-- 
2.35.1

