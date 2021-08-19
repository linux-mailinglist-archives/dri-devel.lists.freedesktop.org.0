Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 844343F1ADB
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 15:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB3A6E959;
	Thu, 19 Aug 2021 13:45:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A211D6E969
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Aug 2021 13:45:04 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id 3B3112B00A12;
 Thu, 19 Aug 2021 09:45:03 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 19 Aug 2021 09:45:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm3; bh=+ide+UmLneTo5
 vJdUf22CynDGpfUvW89sPLSj2e8DUg=; b=uOhF8AqsndqoeztegDMB83zEHgtmo
 pA+ZsyXNRqbGnr6Hxcxy8DLMXcQ1dHa5Ekr3m9d9/2Sx4sNSc7uCEdiuoAqmiKoq
 cM6g1P5uiDtmFXMBgudtq7LOwEDgHLbupv2ZTcg6YbjLozmzogaZBYiAt2qO6Y99
 63D36vK1KlOhRKOncK9RtqN+IcSPQopvzivB7LTIbaUB07BLflMnoEmsm9tOhmZP
 Npe/DULakUD4H3nyQOXzH3YLOefpM1sIlw3IOey8YEWrBy8V/kp9AumLLji0C0Iq
 HxlSPvah+Nkgx7evYNRgfH3dRMNQAKI4L3RTeYmI1j1M5FTfZGgIZnl8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; bh=+ide+UmLneTo5vJdUf22CynDGpfUvW89sPLSj2e8DUg=; b=btWOSf0i
 L3zdDpb61uwFjTGZfbfrCUG1FdGqR6MsBdUxz9WsEDTH2dHJKNPQfxCHVXsmEqjP
 mUhenJFS5IP0fSrPsAYUKOlO4JLJ7HBtFLjejtXC67toYWhUix8kFE+5E2dXe/UN
 Av0F7tuHQFNRhm3A5VAN/XI4Wf/NADwcElEQATerV0ppB9cYwl9RydhON2wNT6Oo
 CupYIRS9nsMJz6ge+/xw9tALvn82q+XUd6lwY3iOawU+PHn9aPKwx7k+G3fVjECc
 QP2/ggTz2mnmM8LxhVAtoc8Zr0gnK0Cdq853RCzGTn0GsfdMrASOYoZavos+5IlJ
 7pCpZUrSbEpRVw==
X-ME-Sender: <xms:XmAeYarKL6_pMpWQ4Wr2FhbkVXvmaEB__M8MLzsFyhtkQ9C1VfLt5g>
 <xme:XmAeYYoiHBAduOHobNm16OtpQAT19KbXkMW8A0_KpUtLmLCNa5E8jnIsJngWeLfrP
 qDaV-o_62H5-P2m-LU>
X-ME-Received: <xmr:XmAeYfMIm50Twb5CpnHSN3gINIZNXJ_cfhZaeeY6s-VH-pRvwFMPrVG7hCorj6uP1bVo3hmrr5_mp6w5RvfqbyBUUojlloAQG8ku>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleejgdeiiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
 vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:XmAeYZ6N9KNWampImOMjMUK7VGMAh9C-GmXMj89kIOlc6TdMeNNk-A>
 <xmx:XmAeYZ4ESFRBh7rTuA41Udw18JbQMrhT6oscq5ChttCJSgzsmPWNsA>
 <xmx:XmAeYZiHXl2eE2jKzpEhpg9kGzTUNLUNax9J44CMlrBjeHIhhE9fZQ>
 <xmx:XmAeYYKkyQf_CUKkfOOXDsx3yLEmRA8fHRbr8iBsxGgrPSZVGGsrTNuwAGg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 Aug 2021 09:45:02 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Cc: linux-rpi-kernel@lists.infradead.org, Emma Anholt <emma@anholt.net>,
 bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenz@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/vc4: hdmi: Actually check for the connector status in
 hotplug
Date: Thu, 19 Aug 2021 15:44:54 +0200
Message-Id: <20210819134454.850031-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210819134454.850031-1-maxime@cerno.tech>
References: <20210819134454.850031-1-maxime@cerno.tech>
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

The drm_helper_hpd_irq_event() documentation states that this function
is "useful for drivers which can't or don't track hotplug interrupts for
each connector." and that "Drivers which support hotplug interrupts for
each connector individually and which have a more fine-grained detect
logic should bypass this code and directly call
drm_kms_helper_hotplug_event()". This is thus what we ended-up doing.

However, what this actually means, and is further explained in the
drm_kms_helper_hotplug_event() documentation, is that
drm_kms_helper_hotplug_event() should be called by drivers that can
track the connection status change, and if it has changed we should call
that function.

This underlying expectation we failed to provide is that the caller of
drm_kms_helper_hotplug_event() should call drm_helper_probe_detect() to
probe the new status of the connector.

Since we didn't do it, it meant that even though we were sending the
notification to user-space and the DRM clients that something changed we
never probed or updated our internal connector status ourselves.

This went mostly unnoticed since the detect callback usually doesn't
have any side-effect. Also, if we were using the DRM fbdev emulation
(which is a DRM client), or any user-space application that can deal
with hotplug events, chances are they would react to the hotplug event
by probing the connector status eventually.

However, now that we have to enable the scrambler in detect() if it was
enabled it has a side effect, and an application such as Kodi or
modetest doesn't deal with hotplug events. This resulted with a black
screen when Kodi or modetest was running when a screen was disconnected
and then reconnected, or switched off and on.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index a3dbd1fdff7d..d9e001b9314f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1578,10 +1578,11 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 static irqreturn_t vc4_hdmi_hpd_irq_thread(int irq, void *priv)
 {
 	struct vc4_hdmi *vc4_hdmi = priv;
-	struct drm_device *dev = vc4_hdmi->connector.dev;
+	struct drm_connector *connector = &vc4_hdmi->connector;
+	struct drm_device *dev = connector->dev;
 
 	if (dev && dev->registered)
-		drm_kms_helper_hotplug_event(dev);
+		drm_connector_helper_hpd_irq_event(connector);
 
 	return IRQ_HANDLED;
 }
-- 
2.31.1

