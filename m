Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 124CF61F53D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 15:17:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFAD10E327;
	Mon,  7 Nov 2022 14:17:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38DF10E325;
 Mon,  7 Nov 2022 14:16:55 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id C12C32B05E60;
 Mon,  7 Nov 2022 09:16:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Mon, 07 Nov 2022 09:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1667830612; x=
 1667837812; bh=fyi2TvlgzV3RXXjQh+4+NY3ECe0Qn799H5ajsQPxG8U=; b=k
 sLeOkeV4ma3hghCmEGtFb1EFdhH/oYJuNu26Pt1SdDTJmsbQmr6fORRpQVGWSK10
 81EtrRZMRVmq23a4ZRc8CaTatg1phpJIsv440bxSA40DcPojyeM5eKodek9qbFq/
 DoiZR8EFvZkngNLTHrxcyK11T08PDfG8io36dt83xKCFKDm4FTQ5PfWpa6bHipfV
 w3N+sYf+JiNrWazjIvWqSg063buasU+wzXl84MS54/Sd/tKnqiOfBce4XpwGqQgr
 NNca1UDRWfFLH8Jal2TqQBVG6blKAHKTNweLwYsF5dFqf7cDwUjIDPR1NDgM/UqL
 IVShsHsF6FjRMnlO3wYYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1667830612; x=
 1667837812; bh=fyi2TvlgzV3RXXjQh+4+NY3ECe0Qn799H5ajsQPxG8U=; b=h
 U4rrn9I03qKmAIRaztcUi3GSEnEB/RhJmqjrkVFq5FkNU4lmna8NTmkZSaiOavPf
 6PKkCS03ytPSWTtiIzmCJpZZ8ZCn/UV8ecteKhvpFKMF5NrB9kjXYo8s3vgN1Mgj
 dZFpmlQ/DGzhmR9mbJUx98S1MljB3wBDQqUdIdNs6Ss4H4+Knm+ZfvzBZymKnjxr
 xvAbLeoaizih9ED9NifnHraCzWMPZy6dBumnEJphovJQVZhvqDdm1CTEko6iDoN0
 4rYVODJ7Ejc6JRfPmBTBUBckNEwqXDgLFDvO8iMBW+UR5jyhcNCGm8m+OkZ6njeq
 SdIkhrQSqAB0+mNprTVVw==
X-ME-Sender: <xms:UxNpY6vIPwW5QGMiAGXQ6iywnM0otdew0jPzTfH6kLE048RqGZWtfQ>
 <xme:UxNpY_cuDBq2ld1PfQHJB_kA6evu1jPQuq35xGybMB2cjHzAKfUH9OFe2dLIwEQGe
 Rfidq8Tj_nwQmI9qAQ>
X-ME-Received: <xmr:UxNpY1xBdn6AFQy83limwDEivMkwF-09MQYYGqb78lardTTGTCjUpxyxShNa5tnVFq86bbyz-jwRMf9mh3-4nF7WxwCCWsJAatqNv5PEhVad2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrvdekgdeitdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhfffuggfgtgfkfhgjvfevofesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpedvgfevjefhtdetveevhfelieeuueetgfdvgeevkeegudejffegfffgtedt
 leelhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:UxNpY1PoxWS9i3lHZZmDqeb1oxyhIDkQAKCLDn5XKq3JR2DBpmPC_Q>
 <xmx:UxNpY69Bxhlat9vSlFNx4sa_40zqoMYlnFbholX8smX-SogJzHR9Ew>
 <xmx:UxNpY9XNp-iwOKRePJxEre8FSRpFd9Cu7h_CjSEtg3qJ1h9KEG-sxQ>
 <xmx:VBNpY-Ljm7TUctYmeEptrAtFOgsTRyXMFNP_DCJYHSAVXsuZaJDT4__cbXQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Nov 2022 09:16:50 -0500 (EST)
From: Maxime Ripard <maxime@cerno.tech>
Date: Mon, 07 Nov 2022 15:16:29 +0100
Subject: [PATCH v7 03/23] drm/connector: Only register TV mode property if
 present
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <20220728-rpi-analog-tv-properties-v7-3-7072a478c6b3@cerno.tech>
References: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
In-Reply-To: <20220728-rpi-analog-tv-properties-v7-0-7072a478c6b3@cerno.tech>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Emma Anholt <emma@anholt.net>, Karol Herbst <kherbst@redhat.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>,
 Lyude Paul <lyude@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>
X-Mailer: b4 0.11.0-dev-99e3a
X-Developer-Signature: v=1; a=openpgp-sha256; l=1618; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=JMejCU/s/gpF+Xr3qgC8U1y+p70nBDad28T6UzRMYXQ=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDMmZwvYNWgf/fprJvj19x/1zi2ytXNQkLxyr+fTadKvmrHju
 x7PSO0pZGMS4GGTFFFlihM2XxJ2a9bqTjW8ezBxWJpAhDFycAjCR4ycZGV6KrL2oa2zy3MbpYPTKi/
 J1XE/natSe7FWKt8sPLLibPYfhD+dr5cw/+wPXXTstIznngoNPwOZQ+de7HrBeVHXYXMruwQwA
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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
Cc: Dom Cobley <dom@raspberrypi.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>, Hans de Goede <hdegoede@redhat.com>, Noralf Trønnes <noralf@tronnes.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>, Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_create_tv_properties() will create the TV mode property
unconditionally.

However, since we'll gradually phase it out, let's register it only if we
have a list passed as an argument. This will make the transition easier.

Acked-by: Noralf Trønnes <noralf@tronnes.org>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/drm_connector.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 98bfbaf29273..6e9e2f96f3a8 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1690,15 +1690,18 @@ int drm_mode_create_tv_properties(struct drm_device *dev,
 	if (drm_mode_create_tv_margin_properties(dev))
 		goto nomem;
 
-	dev->mode_config.legacy_tv_mode_property =
-		drm_property_create(dev, DRM_MODE_PROP_ENUM,
-				    "mode", num_modes);
-	if (!dev->mode_config.legacy_tv_mode_property)
-		goto nomem;
 
-	for (i = 0; i < num_modes; i++)
-		drm_property_add_enum(dev->mode_config.legacy_tv_mode_property,
-				      i, modes[i]);
+	if (num_modes) {
+		dev->mode_config.legacy_tv_mode_property =
+			drm_property_create(dev, DRM_MODE_PROP_ENUM,
+					    "mode", num_modes);
+		if (!dev->mode_config.legacy_tv_mode_property)
+			goto nomem;
+
+		for (i = 0; i < num_modes; i++)
+			drm_property_add_enum(dev->mode_config.legacy_tv_mode_property,
+					      i, modes[i]);
+	}
 
 	dev->mode_config.tv_brightness_property =
 		drm_property_create_range(dev, 0, "brightness", 0, 100);

-- 
b4 0.11.0-dev-99e3a
