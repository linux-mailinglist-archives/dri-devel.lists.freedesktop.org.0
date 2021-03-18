Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 752F63409C8
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 17:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8865A6E90D;
	Thu, 18 Mar 2021 16:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE516E8B2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 16:13:36 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id AA2831640;
 Thu, 18 Mar 2021 12:13:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 18 Mar 2021 12:13:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=b/RnXpPizO/eW
 WDLfpsKMhw6rY2ky9U0twz7YpMe1tI=; b=M7CGYzr4LqZcasHeX+1il4K495AfT
 hnGJH1Fxd69Bb9FbTTesrYS13R4zqueFSWSpDEKg0GqJkvh7Ga4RryAbNiTk4Ewm
 CBjPPsU5gWDuVtYfV6Q3Xi3drW1Xap+x95Ou0nWhrC7WSHwUagN85QmpKIGvMJxM
 s6tn+pfD0MmAtQcP+f1v8Oe0QBFQaJtUWdLcyc1wRfKQbph4zlIwY7hr5RIKaH6u
 F0OE6n5Msb6TMF9CWTao9BLX9ONBjTBVt1Behh6qL7O51OLkDvciuyWa7gZPj9q3
 c0LDCWXcYE7YfVoiiE1hWrEZmutX9lqn7LfudFvutdR/4craa7zKQGh5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=b/RnXpPizO/eWWDLfpsKMhw6rY2ky9U0twz7YpMe1tI=; b=ICK00XJU
 /RdcVFOI1A7m0Sf9gWFs0kOh4G4SNYwlvFvbtBh7K9qHF0pZEhmxRtUDlRmMw/b9
 sbuTU4Jy6mUo+Vbp5tP/p37kE0rNGhNjOxjVxHv7fq7Lo/ymDz5k2I5vQgdYja6a
 AEbsah9KL5e3t4u254MO+wyoBCzn3SXoqyBs4lbMi5wyJjQRoUbMas5dksjI4v1L
 AbBknmuGcJWyweXnfOzn6qvtZ6K2+Yh3hI+QlFcOF18lYsHJDarkL7KlKNs0mL08
 o7quJE2XmhcrKeXctFZKVvIrpvn7FWBJ3W5g8+t81YWvtL4v/Qj1+QnV/rF/mN5k
 askPqEJZ1FzP2w==
X-ME-Sender: <xms:L3xTYGeFDyc6ZII66n-yc_oyFxulvAE-ZKyMHENy3tatJhnssJcgew>
 <xme:L3xTYANzYCj3HnsOuIuwzC0twpe58frs8o_toWdKJY9AS-16nX1hmoWxjTgMdwq_c
 3v3TyiiD6Vn5PsTgLc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudefiedgkeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:L3xTYHgCinCIpJMqajmTBpkJ4D9Ji4z-Z-MsHy0HbxXBJEry__X0Jg>
 <xmx:L3xTYD9JfoTaK1OnVadDPlfxuZsWEhaBwv8gizHoQjZnAOtMuDWcpg>
 <xmx:L3xTYCuO60P-MaZwD1uR4exl980_zUsRBSm1TFDb5K07oxfZxL8GZA>
 <xmx:L3xTYEJork59gMsotVn8A3Iw1AZtm87ezKXqvE5pNftnkVJHkg1gIA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id DBFF0108005C;
 Thu, 18 Mar 2021 12:13:34 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/vc4: crtc: Reduce PV fifo threshold on hvs4
Date: Thu, 18 Mar 2021 17:13:28 +0100
Message-Id: <20210318161328.1471556-3-maxime@cerno.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210318161328.1471556-1-maxime@cerno.tech>
References: <20210318161328.1471556-1-maxime@cerno.tech>
MIME-Version: 1.0
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
 Maxime Ripard <maxime@cerno.tech>, Dom Cobley <popcornmix@gmail.com>,
 Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dom Cobley <popcornmix@gmail.com>

Experimentally have found PV on hvs4 reports fifo full
error with expected settings and does not with one less

This appears as:
[drm:drm_atomic_helper_wait_for_flip_done] *ERROR* [CRTC:82:crtc-3] flip_done timed out

with bit 10 of PV_STAT set "HVS driving pixels when the PV FIFO is full"

Fixes: c8b75bca92cb ("drm/vc4: Add KMS support for Raspberry Pi.")
Signed-off-by: Dom Cobley <popcornmix@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 269390bc586e..76657dcdf9b0 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -210,6 +210,7 @@ static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 {
 	const struct vc4_crtc_data *crtc_data = vc4_crtc_to_vc4_crtc_data(vc4_crtc);
 	const struct vc4_pv_data *pv_data = vc4_crtc_to_vc4_pv_data(vc4_crtc);
+	struct vc4_dev *vc4 = to_vc4_dev(vc4_crtc->base.dev);
 	u32 fifo_len_bytes = pv_data->fifo_depth;
 
 	/*
@@ -238,6 +239,22 @@ static u32 vc4_get_fifo_full_level(struct vc4_crtc *vc4_crtc, u32 format)
 		if (crtc_data->hvs_output == 5)
 			return 32;
 
+		/*
+		 * It looks like in some situations, we will overflow
+		 * the PixelValve FIFO (with the bit 10 of PV stat being
+		 * set) and stall the HVS / PV, eventually resulting in
+		 * a page flip timeout.
+		 *
+		 * Displaying the video overlay during a playback with
+		 * Kodi on an RPi3 seems to be a great solution with a
+		 * failure rate around 50%.
+		 *
+		 * Removing 1 from the FIFO full level however
+		 * seems to completely remove that issue.
+		 */
+		if (!vc4->hvs->hvs5)
+			return fifo_len_bytes - 3 * HVS_FIFO_LATENCY_PIX - 1;
+
 		return fifo_len_bytes - 3 * HVS_FIFO_LATENCY_PIX;
 	}
 }
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
