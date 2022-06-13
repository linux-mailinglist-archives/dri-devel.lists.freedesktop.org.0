Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1B35485D8
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jun 2022 16:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B994910E846;
	Mon, 13 Jun 2022 14:49:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A42E610E84B
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jun 2022 14:49:24 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 6055E3200926;
 Mon, 13 Jun 2022 10:49:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 13 Jun 2022 10:49:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1655131762; x=1655218162; bh=Bf
 t2FBXggzIetHl6yJpADADcBIFVoum/NRt76/1Opuc=; b=Qp/lWm1jcEfRD1oxJW
 7n/dhcgmUpD0V6UlDOMvLikVEIs1aZNulEtIvYoai5RGYjXmL/Y1T0UqKTNDgkAO
 IPzUn/Tz4gCRThjL9F44ZRKQ+A0c0+qB87kF/q0Am21EZ4h7D5iWbjPgrogRC3tn
 utqShrJ23yUzWQV4Ii55ZF7CsfdXvUgIPLDsm4goBZV7Jcs4yC5UHAbNsVF45GgJ
 mJef12Tz8USu6hRCUUppOXGvlksOBLi/taYsPhJMOO/ouWSkTgFoUnIVa/EU2/H2
 kuzPiZSXteHq9ltrqGFJ4voF7B7HFTD2n9qVm/hZqCDVK0bASJyv9ZVwKqHUrYhZ
 KNxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1655131762; x=1655218162; bh=Bft2FBXggzIet
 Hl6yJpADADcBIFVoum/NRt76/1Opuc=; b=GLfdtDRGDthaWqlzLLUCZeVbE0M+w
 wBR9pxMUKSnu/UaUOXheWMINhDU/4/yPTg+3SWyOolko3+ja/cnPGUHvboWaAyPg
 Ln9cG+RQjlfUMKzZwCptMQT5fCeWZL0emQ9j6pffnStxpyjlRjWLgnCMsuiZjdRa
 tJYw/ghVUY6l4PHMqqNfpIv3r/PdckxdP06lZKkQOIJJI88p1B6MwIUsgGpjYAMw
 f6xeWm/9sksLYHuFac6IeVZ7TTZi5E6dF6EkpL6cygteW6XiAy0/a2a0sENFjnXh
 HBxeluv03Cq7lUbOKnTjAD33trzAxVon66VmWV0SRVCQ3AE8tzagM6ZJw==
X-ME-Sender: <xms:ck6nYuzXwbORg5rhzUd0EhWNoMcIOXE1r9xlcpp2sOeKwi9e_r8iuw>
 <xme:ck6nYqQTDa_Vpyj7jIW2I4UxV5nr_Hsea6IWNsF19_l1qzcR7eMBF9fTC2CMttoUu
 hC9KbaC_BkWR0e-sEc>
X-ME-Received: <xmr:ck6nYgUNx5JBGvEzISyeWiXNHbybbCoy-7mM3We0dp4gg-8xqgeMpwm4pIu36vxgF4iqE8UzUJpr3pK-CxVvRWfpf2K6kmzBZbk9cG0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddujedgjeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
 vdejhfenucevlhhushhtvghrufhiiigvpeegnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ck6nYkh18u8U88EY7sCAegqzDCaJApvy7XFTp2A8w-ZgRev2fYYQXQ>
 <xmx:ck6nYgBkPsp0zzHMnMBNc-p7BLbfuuXTCBAlF_hQ0rkpp_GdkJE5pw>
 <xmx:ck6nYlIwT9trQfOCoCGoTBuV7kXwe30Zc93-uztPGT_yvrFnueus4A>
 <xmx:ck6nYv5jCk4WTHBakm6v-a5YxEW42A6nlaxba2b2jIPUs7uV1ZGu9A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Jun 2022 10:49:22 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 25/33] drm/vc4: hdmi: Skip writes to disabled packet RAM
Date: Mon, 13 Jun 2022 16:47:52 +0200
Message-Id: <20220613144800.326124-26-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220613144800.326124-1-maxime@cerno.tech>
References: <20220613144800.326124-1-maxime@cerno.tech>
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
Cc: Dom Cobley <popcornmix@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

This path actually occurs when audio is started during a hdmi mode set.
As the data will be written by vc4_hdmi_set_infoframes when packet RAM
is enabled again, don't treat as an error

Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 7 ++++++-
 drivers/gpu/drm/vc4/vc4_hdmi.h | 6 ++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 0dc7e57715af..c62e32f68974 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -601,7 +601,9 @@ static void vc4_hdmi_set_audio_infoframe(struct drm_encoder *encoder)
 	union hdmi_infoframe frame;
 
 	memcpy(&frame.audio, audio, sizeof(*audio));
-	vc4_hdmi_write_infoframe(encoder, &frame);
+
+	if (vc4_hdmi->packet_ram_enabled)
+		vc4_hdmi_write_infoframe(encoder, &frame);
 }
 
 static void vc4_hdmi_set_hdr_infoframe(struct drm_encoder *encoder)
@@ -741,6 +743,8 @@ static void vc4_hdmi_encoder_post_crtc_disable(struct drm_encoder *encoder,
 
 	mutex_lock(&vc4_hdmi->mutex);
 
+	vc4_hdmi->packet_ram_enabled = false;
+
 	spin_lock_irqsave(&vc4_hdmi->hw_lock, flags);
 
 	HDMI_WRITE(HDMI_RAM_PACKET_CONFIG, 0);
@@ -1351,6 +1355,7 @@ static void vc4_hdmi_encoder_post_crtc_enable(struct drm_encoder *encoder,
 			   VC4_HDMI_RAM_PACKET_ENABLE);
 
 		spin_unlock_irqrestore(&vc4_hdmi->hw_lock, flags);
+		vc4_hdmi->packet_ram_enabled = true;
 
 		vc4_hdmi_set_infoframes(encoder);
 	}
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.h b/drivers/gpu/drm/vc4/vc4_hdmi.h
index 1159b2992fb1..c3ed2b07df23 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.h
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.h
@@ -212,6 +212,12 @@ struct vc4_hdmi {
 	 */
 	struct drm_display_mode saved_adjusted_mode;
 
+	/**
+	 * @packet_ram_enabled: Is the HDMI controller packet RAM currently
+	 * on? Protected by @mutex.
+	 */
+	bool packet_ram_enabled;
+
 	/**
 	 * @scdc_enabled: Is the HDMI controller currently running with
 	 * the scrambler on? Protected by @mutex.
-- 
2.36.1

