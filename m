Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774601E59C3
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 399A56E462;
	Thu, 28 May 2020 07:44:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B4E6E342
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:50:59 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id 1A5545820DD;
 Wed, 27 May 2020 11:50:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:50:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=ounqDkKyB9FLa
 CDv2YNyzZ5BItMJjprgBr0/54Ryzxs=; b=Y7g8Yr+2xMKAOZQ8bzPpv/1tMXBiR
 AeyNgtwN9vLgyXFKq9IqmhXZusMdMggLEXnwiR/XUo01f8xFt3EZKZG7uzR8XWLC
 kpERJdh9mp9FImjNIeYVAyNsmCog/2jxStbBP5nqqsQdFSSGb7ZUcM01D0LcHlmX
 p5hnnqzxkydwLWZqBL4rE3VnNf9njKM8yPcNMdVlk6wJcxoG1Dv2Qt0h21LxcPAJ
 xbeEEoEHSUGhzedVxhnaASVcbqpbphsP8yzXYS5NDjwiKzE2Uy60Vc9hqmJKiR2A
 eCM6A9iuMwe+yrsHQ91yor82jnGj1OwO1sdn+xxgqHtVcUaGX4jFv/quA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=ounqDkKyB9FLaCDv2YNyzZ5BItMJjprgBr0/54Ryzxs=; b=FRp4on9b
 c9xGZztCjLa2tvjA4sKtG+SqJVXDrbFz/32ipl8piNlf/mQSCinb4ugs3hI51vvZ
 mayd6YXFHCkiq2hTdgdDBRIRHEDogjgw9FCxMUvan+FFBeunYMkHiq78iiHa5JQD
 D0pfOSNKeXCrqg+vL4HHIvwnY8CySBlNqC73LVqGY1CXJW4R75vNlMCPFxKOC/JO
 J3tT4wxNOKtLbudR/ucpst/x3OWQcr8mOw2jOaDcKVFE48fuXkCXHpWZI5D44OZL
 6stis0HkAmjown4AiPrNlkfe401Z8Q1kikP5h5N8pgAEhBesnaeQLAs6onjUn+by
 reRL7eG2pd1o5g==
X-ME-Sender: <xms:YozOXk8kDZnEoD_cS6SMfqHa789Nd4FCN3x7AOh1i9dZBNlffhAxng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepgeegne
 curfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:YozOXsuLATyAfm73AxzeblL0V3Ou0iKSSt-8vfhnAQZ5Lt1igTCAHQ>
 <xmx:YozOXqA_xdCAYYcGKM8tlKN1xlE_me93MPd6nLA-sHhn-11iQIkAEg>
 <xmx:YozOXkdDicfZUJPRYPH7yQjFpI5A4aE2WnZYgGEmdE0aFD4H4JVM4g>
 <xmx:Y4zOXsee4amgMUSkSNr_-HVAcyaxVn3ve8-l71OnX7AkcQPh1nGeVw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id B22CC3280059;
 Wed, 27 May 2020 11:50:58 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 064/105] drm/vc4: crtc: Change the HVS5 test for
 of_device_is_compatible
Date: Wed, 27 May 2020 17:48:34 +0200
Message-Id: <2165607ede34d229d0cbce916c70c7fb6c0337be.1590594512.git-series.maxime@cerno.tech>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 May 2020 07:43:50 +0000
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
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>,
 linux-arm-kernel@lists.infradead.org, Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TXP probes before the HVS, so testing the hvs5 flag in the hvs pointer
of the main device structure won't work and result in a null pointer
dereference.

Let's test for the main device compatible instead so that it can work.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_crtc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 6d7799ff8f87..d284596ec048 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -1055,7 +1055,6 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 		  const struct drm_crtc_funcs *crtc_funcs,
 		  const struct drm_crtc_helper_funcs *crtc_helper_funcs)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(drm);
 	struct drm_crtc *crtc = &vc4_crtc->base;
 	struct drm_plane *primary_plane;
 	unsigned int i;
@@ -1076,7 +1075,7 @@ int vc4_crtc_init(struct drm_device *drm, struct vc4_crtc *vc4_crtc,
 				  crtc_funcs, NULL);
 	drm_crtc_helper_add(crtc, crtc_helper_funcs);
 
-	if (!vc4->hvs->hvs5) {
+	if (!of_device_is_compatible(drm->dev->of_node, "brcm,bcm2711-vc5")) {
 		drm_mode_crtc_set_gamma_size(crtc, ARRAY_SIZE(vc4_crtc->lut_r));
 
 		/* We support CTM, but only for one CRTC at a
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
