Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2CE4EDBD0
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA74B10F116;
	Thu, 31 Mar 2022 14:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987D210EFB7
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 14:38:01 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CD5445C0076;
 Thu, 31 Mar 2022 10:38:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 31 Mar 2022 10:38:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; bh=AP2OymA55nN3Qv9e8GGaULiAE+rOC/
 nw0TizDO81Grk=; b=hMryHQJz9NLGfmyGesOhkMYeCrZMRIDWPAaPP5JpRg1MWP
 aiUZXUNjan8Aj7VJrpeFMQSZv+GtIe6ot222DI9i/KTrzw6+6qmp3Jve9CrnGpZ7
 18YNMOWslyUvIspzHW5HCppdb2LjhIRtGZ/+4ZnquMeLFTECGq0b35dC17oARjwE
 Ocbhto2T2en0LJs4fBdMpPAF+uLvwN06VfjCxYI7j+R+u6N7orw2fi8ZV6yTRdkD
 o1EJ4sMk7LZJ2pSFADQjKIf6nuPprx07/EmoZe7RlLSAU1MFC5GXp0l7VGRi0w1+
 j1jVemM7CnSnX30IYmkiMsE3xtrro36eoYdnbMGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=AP2Oym
 A55nN3Qv9e8GGaULiAE+rOC/nw0TizDO81Grk=; b=HjgmDS/sFbrR1zPTIA2M6r
 kS0qGeJrp2TEpEr7Ecnn0mEeAoqIP/mhew5fsgHL/a26QqU8orRDEZRUItzP+L/D
 X/c/qC3eHNy90KM2RLlNKx/LL75d4gQFELmjmMS3nM4GwCfzaBpASKKvrotjwM23
 mq/fG12uEz3REAeIU32/SAMgklm7o62pmYiJlOIjLQZkSaEZrvLHjnnxaeoaGzT9
 jSzFzHnHz1sKfutMAsaon2MAdD2V/0qxx0p55x9K6FGSIRtWHJ30u58scYAq/SHw
 l4Q8hlU4Mmbm4g5ebqQddTdH9L3ovmIH5ZMJr69v6YIzt+h4wNK/52JyacfKpWwg
 ==
X-ME-Sender: <xms:yLxFYsa7PF-cLqg5pqJyMq8-0WfF79FTBedLQhMsRTnyqbnA7M29lw>
 <xme:yLxFYnbzDTSDzg_oxfKfudh4GwoKEw98Tzne7viYT1vHlf4w-wUtiV07wsJvQ7rkL
 fwUuYAJZaexM6Z2xts>
X-ME-Received: <xmr:yLxFYm8F1W4mn6QsifEGR19qzlLybQbtqWeT9JWdegbuKFstOb-UiYHEhOBdo57pHNaH47skL6vFf7p-JXxOe_dq3xTzBMDM9sxFPGI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgkedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:yLxFYmp2zBwavEaxVSK_urwFBMVqJg5I73czfPQzvg6QB8bDXYB4GA>
 <xmx:yLxFYnprbUfh5VRUe2kie2MT25PocRjFAqrvV2wlhEBrsKVM8ksYqQ>
 <xmx:yLxFYkT7hBmwnX7hvT4j8DT26orMYtg9D8qIOlu0k6N8exAGQGvHCw>
 <xmx:yLxFYompeptfoMuFtkmLed0tV4MyVs5m42U5u_c-v9S-WscrwqvXbQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 10:38:00 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/7] drm/vc4: kms: Ignore atomic_flush if we're disabled
Date: Thu, 31 Mar 2022 16:37:43 +0200
Message-Id: <20220331143744.777652-7-maxime@cerno.tech>
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

atomic_flush will be called for each CRTC even if they aren't enabled.

The whole code we have there will thus run without a properly affected
channel, which can then result in all sorts of weird behaviour.

Fortunately, the DRM_PLANE_COMMIT_ACTIVE_ONLY flag will skip the CRTC
atomic_begin and atomic_flush, and the planes atomic_update, if they
aren't enabled.

Our plane atomic_update is a nop, and atomic_begin will copy the current
HVS channel to the vc4_crtc structure for the interrupt handler to
consume, but the handler won't run if the CRTC is disabled. So in the
end, it will only skip our CRTC atomic_flush, which is what we want.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_kms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index 992d6a240002..928657c736b7 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -401,7 +401,8 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 	else
 		vc4_hvs_pv_muxing_commit(vc4, state);
 
-	drm_atomic_helper_commit_planes(dev, state, 0);
+	drm_atomic_helper_commit_planes(dev, state,
+					DRM_PLANE_COMMIT_ACTIVE_ONLY);
 
 	drm_atomic_helper_commit_modeset_enables(dev, state);
 
-- 
2.35.1

