Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E191E59A3
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 09:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB42C6E42A;
	Thu, 28 May 2020 07:43:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com
 [66.111.4.221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 650126E33F
 for <dri-devel@lists.freedesktop.org>; Wed, 27 May 2020 15:49:50 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.nyi.internal (Postfix) with ESMTP id C3B9A582034;
 Wed, 27 May 2020 11:49:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Wed, 27 May 2020 11:49:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm2; bh=fse909+Uy/SxW
 fg4vh9c6yKXmMtSynUFNN2rQ9mVfiM=; b=CKnAQTj4qF9YmRrmG1WEUm3QBlGmN
 +Z8rAt4fKlNZvAY2Eb+XikZjeCsWRL6RJP/EZtPIvEdPcY0D5RVMjyTxaHGH0aBU
 W5Pfmd35yAayjvkBS62zPpb/usriE4khPkxh9oSA2UPfXxTGaoeGOEhkgJgLyckQ
 rB+mXcLNXZQt+48xIiEAMM/s57iA7jJaLCo+LV8ilOr18tMPd3uLnwUyoudRjkSv
 nbLnkt9peQi8fOK/yuAJFWRYpkdxBaStJEBCqU5YdBlYDkMS+G/cM/VKXQW3tc78
 gMPYitDhLkyMhUH4MacOwqjP6N9ucPsdcX1LyrxU4jxyYkqi7hMaljNyw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=fse909+Uy/SxWfg4vh9c6yKXmMtSynUFNN2rQ9mVfiM=; b=WVS1ZcNo
 FqGEz8XqMA0IYpsSErp7m51LvvR0lGObJ+dUsbdXH6eQU35Y56w5qYrzFBtRhOsl
 2hzgk2EWUcvbGHPiu3utHZQ5zgZlFU27yfeJEVAt0PguyjAmNpReL4rlHdefo/X+
 j732M4b7CbOxrSN9YsngEYwNhjlj+JP32FncSBJeiydEdLwgjCG+moaCIChdWPJn
 jTPDYlMOF4Jnqn1/gLAN9ehLRyuPvupVYaPeMIRNwHRgnuF6uGrSyMR4tesjnFDr
 fS98le+8/daRG2aEu2OqrnHH7qG9BNJHCxqcR6Wk9L34wrcRtsgImA9WqXwoGrPH
 hnHQ5jM7s9K6/w==
X-ME-Sender: <xms:HYzOXmPOhVtbZq6umOLH4FtKV5U4Tj_CosAY3igUXG-WM129k0e4GA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedruddvgedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
 hedvnecukfhppeeltddrkeelrdeikedrjeeinecuvehluhhsthgvrhfuihiivgepfeenuc
 frrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:HYzOXk_un5RM9e-lK-qGZ68t6hcTojeALMY8u1Fah22J90mV8JyAAg>
 <xmx:HYzOXtTJZyLPprvipXGYkG8Tu3vxZ1iby2tBW4q5zAy3MXjngKsOAw>
 <xmx:HYzOXmvT2BHsdkWVaXc0DZ1cmgywxTOJhSXevJj1XYYwO3elv7YLhA>
 <xmx:HYzOXkuqrYplodrUNRB_wbrLkHS7Qd6S4WZStS_tro5ibw_HrziP5A>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 605A63061CCB;
 Wed, 27 May 2020 11:49:49 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 021/105] drm/vc4: plane: Create more planes
Date: Wed, 27 May 2020 17:47:51 +0200
Message-Id: <6b4586842314b8c101758fdda6555d4353b7789b.1590594512.git-series.maxime@cerno.tech>
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

Let's now create more planes that can be affected to all the CRTCs.

vc4 has 3 CRTCs, 1 primary and 1 cursor each, and was having 24 (8
planes per CRTC) overlays.

However, vc5 has 5 CRTCs, so keeping the same logic would put us at 50
planes which is well above the 32 planes limit imposed by DRM.

Using 16 seems like a good tradeoff between staying under 32 and yet
providing enough planes.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/vc4/vc4_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 5335123ae2a0..c190ccc42c51 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -1387,7 +1387,7 @@ int vc4_plane_create_additional_planes(struct drm_device *drm)
 	 * modest number of planes to expose, that should hopefully
 	 * still cover any sane usecase.
 	 */
-	for (i = 0; i < 8; i++) {
+	for (i = 0; i < 16; i++) {
 		struct drm_plane *plane =
 			vc4_plane_init(drm, DRM_PLANE_TYPE_OVERLAY);
 
-- 
git-series 0.9.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
